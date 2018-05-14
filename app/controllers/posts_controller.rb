class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def read
    @post = Post.find(params[:post_id])
  end
  
  def new
    @token = form_authenticity_token
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.content = params[:content]
    post.save
    
    redirect_to "/posts"
  end
  
  def edit
    @post = Post.find(params[:post_id])
    @token = form_authenticity_token
  end

  def update
    post = Post.find(params[:post_id])
    post.title = params[:title]
    post.content = params[:content]
    post.save
    
    redirect_to "/posts/#{post.id}"
  end

  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    
    redirect_to "/posts"
  end

end
