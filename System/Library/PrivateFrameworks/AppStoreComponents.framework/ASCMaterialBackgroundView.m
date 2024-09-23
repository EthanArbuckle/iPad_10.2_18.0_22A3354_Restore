@implementation ASCMaterialBackgroundView

- (ASCMaterialBackgroundView)initWithFrame:(CGRect)a3
{
  ASCMaterialBackgroundView *v3;
  ASCMaterialBackgroundView *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIVisualEffectView *visualEffectView;
  id v9;
  uint64_t v10;
  UIImageView *imageView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASCMaterialBackgroundView;
  v3 = -[ASCMaterialBackgroundView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCMaterialBackgroundView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMaterialBackgroundView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v6);
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v7;

    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v10;

    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 2);
    -[ASCMaterialBackgroundView addSubview:](v4, "addSubview:", v4->_imageView);
    -[ASCMaterialBackgroundView addSubview:](v4, "addSubview:", v4->_visualEffectView);

  }
  return v4;
}

- (ASCMaterialBackgroundView)initWithCoder:(id)a3
{
  -[ASCMaterialBackgroundView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCMaterialBackgroundView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCMaterialBackgroundView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASCMaterialBackgroundView;
  -[ASCMaterialBackgroundView layoutSubviews](&v13, sel_layoutSubviews);
  -[ASCMaterialBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ASCMaterialBackgroundView visualEffectView](self, "visualEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[ASCMaterialBackgroundView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
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
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
