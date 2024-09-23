@implementation CAMIntensityButton

- (CAMIntensityButton)initWithLayoutStyle:(int64_t)a3
{
  CAMIntensityButton *v4;
  CAMIntensityButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CAMIntensityButton *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMIntensityButton;
  v4 = -[CAMIntensityButton initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_orientation = 1;
    v4->_layoutStyle = a3;
    -[CAMIntensityButton setAdjustsImageWhenHighlighted:](v4, "setAdjustsImageWhenHighlighted:", 0);
    v6 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:", CFSTR("CAMIntensityButton"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMIntensityButton setImage:forState:](v5, "setImage:forState:", v9, 0);
    -[CAMIntensityButton _updateColorsAnimated:](v5, "_updateColorsAnimated:", 0);
    v10 = v5;

  }
  return v5;
}

- (void)setIntensityValue:(double)a3
{
  if (self->_intensityValue != a3)
    self->_intensityValue = a3;
}

- (void)setActive:(BOOL)a3
{
  -[CAMIntensityButton setActive:animated:](self, "setActive:animated:", a3, 0);
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL4 v7;

  v4 = a4;
  v5 = a3;
  v7 = -[CAMIntensityButton isActive](self, "isActive");
  -[CAMIntensityButton setSelected:](self, "setSelected:", v5);
  if (v7 != v5)
    -[CAMIntensityButton _updateColorsAnimated:](self, "_updateColorsAnimated:", v4);
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[CAMIntensityButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  void *v4;
  id v5;

  if (-[CAMIntensityButton isActive](self, "isActive", a3))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMIntensityButton imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMIntensityButton setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    -[CAMIntensityButton imageView](self, "imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, a3, v4);

  }
}

- (double)intensityValue
{
  return self->_intensityValue;
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
