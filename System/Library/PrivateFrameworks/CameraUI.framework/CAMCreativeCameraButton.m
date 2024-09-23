@implementation CAMCreativeCameraButton

- (void)_commonCAMCreativeCameraButtonInitializationWithStyle:(int64_t)a3 overContent:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *circleBackgroundView;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  self->_layoutStyle = a3;
  self->__overContent = a4;
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("CAMButtonBackground"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v8);
    circleBackgroundView = self->__circleBackgroundView;
    self->__circleBackgroundView = v9;

    -[CAMCreativeCameraButton imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCreativeCameraButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->__circleBackgroundView, v11);
    +[CAMFullscreenViewfinder lightControlBackgroundColor](CAMFullscreenViewfinder, "lightControlBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMCreativeCameraButton setTintColor:](self, "setTintColor:", v12);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMCreativeCameraButton imageView](self, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v14);

}

- (CAMCreativeCameraButton)initWithLayoutStyle:(int64_t)a3
{
  CAMCreativeCameraButton *v4;
  CAMCreativeCameraButton *v5;
  CAMCreativeCameraButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMCreativeCameraButton;
  v4 = -[CAMCreativeCameraButton initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMCreativeCameraButton _commonCAMCreativeCameraButtonInitializationWithStyle:overContent:](v4, "_commonCAMCreativeCameraButtonInitializationWithStyle:overContent:", a3, 0);
    -[CAMCreativeCameraButton _updateImages](v5, "_updateImages");
    v6 = v5;
  }

  return v5;
}

- (id)initForOverContent
{
  CAMCreativeCameraButton *v2;
  CAMCreativeCameraButton *v3;
  CAMCreativeCameraButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMCreativeCameraButton;
  v2 = -[CAMCreativeCameraButton initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[CAMCreativeCameraButton _commonCAMCreativeCameraButtonInitializationWithStyle:overContent:](v2, "_commonCAMCreativeCameraButtonInitializationWithStyle:overContent:", 4, 1);
    -[CAMCreativeCameraButton _updateImages](v3, "_updateImages");
    v4 = v3;
  }

  return v3;
}

- (void)_updateImages
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = -[CAMCreativeCameraButton _isOverContent](self, "_isOverContent");
  v4 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CAMCreativeCameraButtonNoBorder"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:", v8);
  }
  else
  {
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CAMCreativeCameraButtonInactive"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithRenderingMode:", 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("CAMCreativeCameraButton"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMCreativeCameraButton setImage:forState:](self, "setImage:forState:", v12, 0);
  -[CAMCreativeCameraButton setImage:forState:](self, "setImage:forState:", v12, 2);
  if (!-[CAMCreativeCameraButton _isOverContent](self, "_isOverContent"))
    -[CAMCreativeCameraButton setImage:forState:](self, "setImage:forState:", v11, 1);
  -[CAMCreativeCameraButton setImage:forState:](self, "setImage:forState:", v11, 4);
  -[CAMCreativeCameraButton setImage:forState:](self, "setImage:forState:", v11, 5);
  -[CAMCreativeCameraButton setImage:forState:](self, "setImage:forState:", v11, 6);
  -[CAMCreativeCameraButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if ((-[CAMCreativeCameraButton isEnabled](self, "isEnabled") & 1) == 0
    && -[CAMCreativeCameraButton pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    -[CAMCreativeCameraButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
  }
  v10.receiver = self;
  v10.super_class = (Class)CAMCreativeCameraButton;
  -[CAMCreativeCameraButton hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CAMCreativeCameraButton;
  -[CAMCreativeCameraButton layoutSubviews](&v20, sel_layoutSubviews);
  -[CAMCreativeCameraButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMCreativeCameraButton bounds](self, "bounds");
  -[CAMCreativeCameraButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[CAMCreativeCameraButton intrinsicContentSize](self, "intrinsicContentSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v3, "setCenter:", v5, v7);
  objc_msgSend(v3, "setBounds:", v8, v9, v11, v13);
  -[CAMCreativeCameraButton _circleBackgroundView](self, "_circleBackgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "intrinsicContentSize");
    v17 = v16;
    v19 = v18;
    objc_msgSend(v15, "setCenter:", v5, v7);
    objc_msgSend(v15, "setBounds:", v8, v9, v17, v19);
  }

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CAMCreativeCameraButton _circleBackgroundView](self, "_circleBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v7 = v6;
    v9 = v8;

  }
  else
  {
    if (-[CAMCreativeCameraButton useCompactLayout](self, "useCompactLayout"))
      v7 = 30.0;
    else
      v7 = 42.0;
    v9 = v7;
  }

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMCreativeCameraButton setNeedsLayout](self, "setNeedsLayout");
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
  v5 = -[CAMCreativeCameraButton isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)CAMCreativeCameraButton;
  -[CAMCreativeCameraButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    -[CAMCreativeCameraButton imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CAMCreativeCameraButton _isOverContent](self, "_isOverContent"))
    {
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMAnimationHelper animateLayer:forButtonHighlighted:layoutStyle:](CAMAnimationHelper, "animateLayer:forButtonHighlighted:layoutStyle:", v7, v3, -[CAMCreativeCameraButton layoutStyle](self, "layoutStyle"));

    }
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMCreativeCameraButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMCreativeCameraButton imageView](self, "imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, a3, v4);

  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMCreativeCameraButton _updateImages](self, "_updateImages");
  }
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
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

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)useCompactLayout
{
  return self->_useCompactLayout;
}

- (void)useCompactLayout:(BOOL)a3
{
  self->_useCompactLayout = a3;
}

- (BOOL)_isOverContent
{
  return self->__overContent;
}

- (UIImageView)_circleBackgroundView
{
  return self->__circleBackgroundView;
}

- (void)set_circleBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->__circleBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__circleBackgroundView, 0);
}

@end
