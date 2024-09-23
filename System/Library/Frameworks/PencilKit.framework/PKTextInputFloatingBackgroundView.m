@implementation PKTextInputFloatingBackgroundView

- (PKTextInputFloatingBackgroundView)initWithFrame:(CGRect)a3
{
  PKTextInputFloatingBackgroundView *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *textureView;
  void *v14;
  void *v15;
  uint64_t v16;
  UIVisualEffectView *blurView;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)PKTextInputFloatingBackgroundView;
  v3 = -[PKTextInputFloatingBackgroundView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    v5 = (void *)MEMORY[0x1E0DC3E88];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    objc_msgSend(v5, "traitCollectionWithDisplayScale:", fmin(v8, 2.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_kitImageNamed:withTrait:", CFSTR("UITexturedPaperTile"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithPatternImage:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    textureView = v3->__textureView;
    v3->__textureView = v12;

    -[UIView layer](v3->__textureView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 12.0);

    -[UIView setBackgroundColor:](v3->__textureView, "setBackgroundColor:", v11);
    -[UIView setAlpha:](v3->__textureView, "setAlpha:", 0.85);
    objc_msgSend(MEMORY[0x1E0DC3510], "_effectWithBlurRadius:scale:", 4.0, 2.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v15);
    blurView = v3->__blurView;
    v3->__blurView = (UIVisualEffectView *)v16;

    -[UIVisualEffectView _setCornerRadius:](v3->__blurView, "_setCornerRadius:", 12.0);
    -[UIVisualEffectView setClipsToBounds:](v3->__blurView, "setClipsToBounds:", 1);
    -[UIVisualEffectView contentView](v3->__blurView, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v3->__textureView);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputFloatingBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", v19);

    -[PKTextInputFloatingBackgroundView _setCornerRadius:](v3, "_setCornerRadius:", 12.0);
    -[PKTextInputFloatingBackgroundView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "CGColor");
    -[PKTextInputFloatingBackgroundView layer](v3, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderColor:", v21);

    -[PKTextInputFloatingBackgroundView layer](v3, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderWidth:", 0.5);

    -[PKTextInputFloatingBackgroundView layer](v3, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowOffset:", 0.0, 3.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = objc_msgSend(v25, "CGColor");
    -[PKTextInputFloatingBackgroundView layer](v3, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShadowColor:", v26);

    -[PKTextInputFloatingBackgroundView layer](v3, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1036831949;
    objc_msgSend(v28, "setShadowOpacity:", v29);

    -[PKTextInputFloatingBackgroundView layer](v3, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setShadowRadius:", 7.0);

    -[PKTextInputFloatingBackgroundView addSubview:](v3, "addSubview:", v3->__blurView);
  }
  return v3;
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
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKTextInputFloatingBackgroundView;
  -[PKTextInputFloatingBackgroundView layoutSubviews](&v23, sel_layoutSubviews);
  -[PKTextInputFloatingBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKTextInputFloatingBackgroundView _blurView](self, "_blurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PKTextInputFloatingBackgroundView _blurView](self, "_blurView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PKTextInputFloatingBackgroundView _textureView](self, "_textureView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

}

- (UIVisualEffectView)_blurView
{
  return self->__blurView;
}

- (UIView)_textureView
{
  return self->__textureView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textureView, 0);
  objc_storeStrong((id *)&self->__blurView, 0);
}

@end
