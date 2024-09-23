@implementation CAMCircleButton

- (CAMCircleButton)initWithFrame:(CGRect)a3
{
  CAMCircleButton *v3;
  UIImageView *v4;
  UIImageView *backgroundView;
  UIImageView *v6;
  UIImageView *imageView;
  CAMSlashContainer *v8;
  CAMSlashContainer *slashView;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMCircleButton;
  v3 = -[CAMCircleButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    backgroundView = v3->__backgroundView;
    v3->__backgroundView = v4;

    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->__imageView;
    v3->__imageView = v6;

    v8 = objc_alloc_init(CAMSlashContainer);
    slashView = v3->__slashView;
    v3->__slashView = v8;

    -[CAMSlashContainer setContentView:](v3->__slashView, "setContentView:", v3->__imageView);
    -[CAMCircleButton addSubview:](v3, "addSubview:", v3->__backgroundView);
    -[CAMCircleButton addSubview:](v3, "addSubview:", v3->__slashView);
    -[CAMCircleButton updateImage](v3, "updateImage");
    -[CAMCircleButton _updateBackgroundImage](v3, "_updateBackgroundImage");
    -[CAMCircleButton updateTintColors](v3, "updateTintColors");
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMCircleButton;
  -[CAMCircleButton layoutSubviews](&v13, sel_layoutSubviews);
  -[CAMCircleButton bounds](self, "bounds");
  UIRectGetCenter();
  -[CAMCircleButton _backgroundView](self, "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsicContentSize");
  CEKRectWithSize();
  UIRectCenteredAboutPointScale();
  objc_msgSend(v3, "setFrame:");
  -[CAMCircleButton _slashView](self, "_slashView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CAMViewAlignmentSize(v4);
  CEKRectWithSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v4, "setCenter:");
  objc_msgSend(v4, "setBounds:", v6, v8, v10, v12);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCircleButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    -[CAMCircleButton updateImage](self, "updateImage");
    -[CAMCircleButton _updateBackgroundImage](self, "_updateBackgroundImage");
  }

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[CAMCircleButton isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)CAMCircleButton;
  -[CAMCircleButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CAMCircleButton _slashView](self, "_slashView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v7, v3, 4);

  }
}

- (void)_updateBackgroundImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CAMCircleButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCircleButton _createCircleImageForContentSize:](self, "_createCircleImageForContentSize:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCircleButton _backgroundView](self, "_backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[CAMCircleButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setOrientation:(int64_t)a3
{
  id v4;

  -[CAMCircleButton _slashView](self, "_slashView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrientation:", a3);

}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CAMCircleButton _slashView](self, "_slashView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOrientation:animated:", a3, v4);

}

- (int64_t)orientation
{
  void *v2;
  int64_t v3;

  -[CAMCircleButton _slashView](self, "_slashView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  return v3;
}

- (void)updateImage
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CAMCircleButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CAMZoomButton shouldUseLargeButtonSizeForContentSize:](CAMZoomButton, "shouldUseLargeButtonSizeForContentSize:", v4);

  if (v5)
    v6 = 3;
  else
    v6 = 2;
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCircleButton imageNameForCurrentState](self, "imageNameForCurrentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCircleButton _imageView](self, "_imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v8);

  -[CAMCircleButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateTintColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[CAMCircleButton shouldUseActiveTintForCurrentState](self, "shouldUseActiveTintForCurrentState"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCircleButton activeTintAlphaForCurrentState](self, "activeTintAlphaForCurrentState");
    objc_msgSend(v3, "colorWithAlphaComponent:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  }
  else
  {
    v7 = (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCircleButton _backgroundView](self, "_backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  -[CAMCircleButton _slashView](self, "_slashView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v4);

}

- (void)updateSlashAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CAMCircleButton _slashView](self, "_slashView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSlashed:animated:", -[CAMCircleButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"), v3);

}

- (id)imageNameForCurrentState
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("%@ must be implemented by subclasses"), v4);

  return 0;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return 0;
}

- (double)activeTintAlphaForCurrentState
{
  return 1.0;
}

- (id)_createCircleImageForContentSize:(id)a3
{
  CGFloat width;
  CGContext *CurrentContext;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
  CGSize v10;
  CGRect v11;

  +[CAMZoomButton circleDiameterForContentSize:](CAMZoomButton, "circleDiameterForContentSize:", a3);
  width = v10.width;
  v10.height = v10.width;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");

  v11.origin.x = v5;
  v11.origin.y = v6;
  v11.size.width = width;
  v11.size.height = width;
  CGContextFillEllipseInRect(CurrentContext, v11);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

- (CAMSlashContainer)_slashView
{
  return self->__slashView;
}

- (void)_setSlashView:(id)a3
{
  objc_storeStrong((id *)&self->__slashView, a3);
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__slashView, 0);
}

@end
