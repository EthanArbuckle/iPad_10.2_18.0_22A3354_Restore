@implementation ICCollapsibleThumbnailView

- (void)performSetup
{
  ICImageAndMovieThumbnailView *v3;
  ICImageAndMovieThumbnailView *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  _BOOL8 v10;
  id v11;

  v3 = [ICImageAndMovieThumbnailView alloc];
  -[ICCollapsibleThumbnailView frame](self, "frame");
  v4 = -[ICImageAndMovieThumbnailView initWithFrame:showMovieDuration:](v3, "initWithFrame:showMovieDuration:", 0);
  -[ICCollapsibleThumbnailView setThumbnailView:](self, "setThumbnailView:", v4);

  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleBaseView performSetUpWithContentView:](self, "performSetUpWithContentView:", v5);

  -[ICCollapsibleThumbnailView image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  v8 = -[ICCollapsibleThumbnailView imageScaling](self, "imageScaling");
  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImageScaling:", v8);

  v10 = -[ICCollapsibleThumbnailView showAsMovie](self, "showAsMovie");
  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowAsMovie:", v10);

}

- (void)setImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)setImageScaling:(unint64_t)a3
{
  id v4;

  self->_imageScaling = a3;
  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageScaling:", a3);

}

- (void)setShowAsMovie:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_showAsMovie = a3;
  -[ICCollapsibleThumbnailView thumbnailView](self, "thumbnailView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowAsMovie:", v3);

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (UIImage)image
{
  return self->_image;
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (BOOL)showAsMovie
{
  return self->_showAsMovie;
}

- (ICImageAndMovieThumbnailView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
