@implementation CAMFilterButton

+ (CAMFilterButton)filterButtonWithLayoutStyle:(int64_t)a3
{
  void *v4;

  +[CAMFilterButton buttonWithType:](CAMFilterButton, "buttonWithType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_commonCAMFilterButtonInitializationWithStyle:", a3);
  return (CAMFilterButton *)v4;
}

- (CAMFilterButton)initWithFrame:(CGRect)a3
{
  CAMFilterButton *v3;
  CAMFilterButton *v4;
  CAMFilterButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFilterButton;
  v3 = -[CAMFilterButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMFilterButton _commonCAMFilterButtonInitializationWithStyle:](v3, "_commonCAMFilterButtonInitializationWithStyle:", 0);
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMFilterButtonInitializationWithStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_orientation = 1;
  self->_layoutStyle = a3;
  -[CAMFilterButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
  -[CAMFilterButton _filterImage](self, "_filterImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFilterButton setImage:forState:](self, "setImage:forState:", v4, 0);

  -[CAMFilterButton imageForState:](self, "imageForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFilterButton setImage:forState:](self, "setImage:forState:", v5, 2);

  -[CAMFilterButton _filterOnImage](self, "_filterOnImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFilterButton setImage:forState:](self, "setImage:forState:", v6, 4);

  -[CAMFilterButton _filterOnImage](self, "_filterOnImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFilterButton setImage:forState:](self, "setImage:forState:", v7, 5);

  -[CAMFilterButton _filterOnImage](self, "_filterOnImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFilterButton setImage:forState:](self, "setImage:forState:", v8, 6);

}

- (id)_filterImage
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_layoutStyle == 3)
    v2 = CFSTR("CAMPhotoBoothFilterButton.png");
  else
    v2 = CFSTR("CAMFilterButton.png");
  v3 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_filterOnImage
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_layoutStyle == 3)
    v2 = CFSTR("CAMPhotoBoothFilterButton.png");
  else
    v2 = CFSTR("CAMFilterButtonOn.png");
  v3 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMFilterButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMFilterButton imageView](self, "imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, a3, v4);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CAMFilterButton imageForState:](self, "imageForState:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_tappableEdgeInsets.top;
  left = self->_tappableEdgeInsets.left;
  bottom = self->_tappableEdgeInsets.bottom;
  right = self->_tappableEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMFilterButton;
  -[CAMFilterButton layoutSubviews](&v8, sel_layoutSubviews);
  -[CAMFilterButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  CAMViewSetBoundsAndCenterForFrame(v3, v4, v5, v6, v7);

}

- (CAMFilterButton)initWithCoder:(id)a3
{
  CAMFilterButton *v3;
  CAMFilterButton *v4;
  CAMFilterButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFilterButton;
  v3 = -[CAMFilterButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMFilterButton _commonCAMFilterButtonInitializationWithStyle:](v3, "_commonCAMFilterButtonInitializationWithStyle:", 0);
    v5 = v4;
  }

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v5 = -[CAMFilterButton isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)CAMFilterButton;
  -[CAMFilterButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CAMFilterButton imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v7, v3, -[CAMFilterButton layoutStyle](self, "layoutStyle"));

  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMFilterButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (id)imageForAccessibilityHUD
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("CAMFilterButton-AXHUD"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end
