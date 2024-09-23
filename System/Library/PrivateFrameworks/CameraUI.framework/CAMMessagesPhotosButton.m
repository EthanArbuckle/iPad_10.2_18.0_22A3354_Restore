@implementation CAMMessagesPhotosButton

+ (id)photosButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CAMMessagesPhotosButton;
  objc_msgSendSuper2(&v8, sel_buttonWithType_, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  v4 = (void *)MEMORY[0x1E0DC3870];
  CAMCameraUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CAMMessagesPhotosButton"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:forState:", v6, 0);

  objc_msgSend(v2, "setOrientation:", 1);
  return v2;
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMMessagesPhotosButton;
  -[CAMMessagesPhotosButton layoutSubviews](&v10, sel_layoutSubviews);
  -[CAMMessagesPhotosButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMMessagesPhotosButton bounds](self, "bounds");
  -[CAMMessagesPhotosButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v3, "intrinsicContentSize");
  v7 = v6;
  v9 = v8;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", v4, v5, v7, v9);

}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMMessagesPhotosButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
    -[CAMMessagesPhotosButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOrientation:(int64_t)a3
{
  -[CAMMessagesPhotosButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMMessagesPhotosButton imageView](self, "imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, a3, v4);

  }
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
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("CAMMessagesPhotosButton"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

@end
