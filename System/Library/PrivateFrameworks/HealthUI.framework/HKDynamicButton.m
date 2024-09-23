@implementation HKDynamicButton

- (void)setHeightConstraint:(id)a3
{
  NSLayoutConstraint *v5;
  NSLayoutConstraint **p_heightConstraint;
  NSLayoutConstraint *v7;

  v5 = (NSLayoutConstraint *)a3;
  p_heightConstraint = &self->_heightConstraint;
  if (*p_heightConstraint != v5)
  {
    v7 = v5;
    -[NSLayoutConstraint setActive:](*p_heightConstraint, "setActive:", 0);
    objc_storeStrong((id *)p_heightConstraint, a3);
    -[NSLayoutConstraint setActive:](*p_heightConstraint, "setActive:", 1);
    v5 = v7;
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[HKDynamicButton _buttonLabelHeight](self, "_buttonLabelHeight");
  v3 = v2;
  v4 = 288.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (double)_buttonLabelHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double result;

  -[HKDynamicButton contentEdgeInsets](self, "contentEdgeInsets");
  v4 = 288.0 - v3;
  -[HKDynamicButton contentEdgeInsets](self, "contentEdgeInsets");
  v6 = fmax(v4 - v5, 0.0);
  -[HKDynamicButton titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v6, 0.0);
  v9 = v8 + 22.0;

  result = 50.0;
  if (v9 >= 50.0)
    return v9;
  return result;
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;

  -[HKDynamicButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HKMediumScaledPreferredBodyFontWithValue(17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[HKDynamicButton _buttonLabelHeight](self, "_buttonLabelHeight");
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
  -[HKDynamicButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDynamicButton;
  -[HKDynamicButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKDynamicButton traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKDynamicButton _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKDynamicButton;
  -[HKDynamicButton setTitle:forState:](&v5, sel_setTitle_forState_, a3, a4);
  -[HKDynamicButton _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
