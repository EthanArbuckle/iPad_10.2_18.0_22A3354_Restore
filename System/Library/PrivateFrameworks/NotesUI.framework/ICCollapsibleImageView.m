@implementation ICCollapsibleImageView

- (void)performSetup
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[ICCollapsibleImageView frame](self, "frame");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  -[ICCollapsibleImageView setImageView:](self, "setImageView:", v4);

  -[ICCollapsibleImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleBaseView performSetUpWithContentView:](self, "performSetUpWithContentView:", v5);

  -[ICCollapsibleImageView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleImageView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  -[ICCollapsibleImageView image](self, "image");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCollapsibleImageView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v9);

}

- (void)setImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[ICCollapsibleImageView imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)setTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_tintColor, a3);
  v5 = a3;
  -[ICCollapsibleImageView imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
