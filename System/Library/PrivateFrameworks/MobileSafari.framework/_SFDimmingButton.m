@implementation _SFDimmingButton

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFDimmingButton;
  -[_SFDimmingButton layoutSubviews](&v3, sel_layoutSubviews);
  -[_SFDimmingButton _updateImageAlpha](self, "_updateImageAlpha");
}

- (void)_updateImageAlpha
{
  double *p_highlightedImageAlpha;
  id v4;

  p_highlightedImageAlpha = &self->_highlightedImageAlpha;
  if (self->_highlightedImageAlpha != 0.0 || self->_normalImageAlpha != 0.0)
  {
    -[_SFDimmingButton imageView](self, "imageView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((-[_SFDimmingButton isHighlighted](self, "isHighlighted") & 1) == 0)
      p_highlightedImageAlpha = &self->_normalImageAlpha;
    objc_msgSend(v4, "setAlpha:", *p_highlightedImageAlpha);

  }
}

- (void)setTapTargetSideMargins:(id)a3
{
  objc_storeStrong((id *)&self->_tapTargetSideMargins, a3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  double highlightAnimationDuration;
  _QWORD v7[5];
  objc_super v8;

  v3 = a3;
  v5 = -[_SFDimmingButton isHighlighted](self, "isHighlighted");
  v8.receiver = self;
  v8.super_class = (Class)_SFDimmingButton;
  -[_SFDimmingButton setHighlighted:](&v8, sel_setHighlighted_, v3);
  if (v5 != v3)
  {
    highlightAnimationDuration = 0.0;
    if (!v3)
      highlightAnimationDuration = self->_highlightAnimationDuration;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35___SFDimmingButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E21E2050;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659328, v7, 0, highlightAnimationDuration, 0.0);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  unsigned __int8 v22;
  _SFDimmingButton **v23;
  _SFDimmingButton *v25;
  _SFDimmingButton *v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_tapTargetSideMargins)
  {
    v26 = self;
    v23 = &v26;
LABEL_10:
    v23[1] = (_SFDimmingButton *)_SFDimmingButton;
    v22 = objc_msgSendSuper2((objc_super *)v23, sel_pointInside_withEvent_, v7, x, y, v25);
    goto LABEL_11;
  }
  -[_SFDimmingButton bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[NSValue CGPointValue](self->_tapTargetSideMargins, "CGPointValue");
  v18 = (44.0 - v13) * -0.5;
  if (v13 >= 44.0)
    v18 = 0.0;
  v19 = v18 - v16;
  v20 = (44.0 - v15) * -0.5;
  if (v15 >= 44.0)
    v20 = 0.0;
  v21 = v20 - v17;
  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  v29 = CGRectInset(v28, v19, v21);
  v27.x = x;
  v27.y = y;
  if (!CGRectContainsPoint(v29, v27))
  {
    v25 = self;
    v23 = &v25;
    goto LABEL_10;
  }
  v22 = 1;
LABEL_11:

  return v22;
}

- (void)setNormalImageAlpha:(double)a3
{
  self->_normalImageAlpha = a3;
  -[_SFDimmingButton _updateImageAlpha](self, "_updateImageAlpha");
}

- (void)setHighlightedImageAlpha:(double)a3
{
  self->_highlightedImageAlpha = a3;
  -[_SFDimmingButton _updateImageAlpha](self, "_updateImageAlpha");
}

- (void)setDimmableBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *cachedDimmedBackgroundColor;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_dimmableBackgroundColor != v7)
  {
    objc_storeStrong((id *)&self->_dimmableBackgroundColor, a3);
    -[UIColor sf_darkenedColor](v7, "sf_darkenedColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    cachedDimmedBackgroundColor = self->_cachedDimmedBackgroundColor;
    self->_cachedDimmedBackgroundColor = v5;

    -[_SFDimmingButton _updateBackgroundColor](self, "_updateBackgroundColor");
  }

}

- (void)_updateBackgroundColor
{
  UIColor **p_dimmableBackgroundColor;

  p_dimmableBackgroundColor = &self->_dimmableBackgroundColor;
  if (self->_dimmableBackgroundColor)
  {
    if (-[_SFDimmingButton isHighlighted](self, "isHighlighted"))
      p_dimmableBackgroundColor = &self->_cachedDimmedBackgroundColor;
    -[_SFDimmingButton setBackgroundColor:](self, "setBackgroundColor:", *p_dimmableBackgroundColor);
  }
}

- (void)setTapTargetSideMargin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  float v9;
  void *v10;
  _QWORD v11[2];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v4, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    *(double *)v11 = v8;
    *(double *)&v11[1] = v9;
    objc_msgSend(v6, "valueWithBytes:objCType:", v11, "{CGPoint=dd}");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFDimmingButton setTapTargetSideMargins:](self, "setTapTargetSideMargins:", v10);

  }
  else
  {
    -[_SFDimmingButton setTapTargetSideMargins:](self, "setTapTargetSideMargins:", 0);
  }

}

- (NSNumber)tapTargetSideMargin
{
  void *tapTargetSideMargins;
  void *v3;

  tapTargetSideMargins = self->_tapTargetSideMargins;
  if (tapTargetSideMargins)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(tapTargetSideMargins, "CGPointValue");
    objc_msgSend(v3, "numberWithDouble:");
    tapTargetSideMargins = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)tapTargetSideMargins;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFDimmingButton;
  -[_SFDimmingButton contextMenuInteraction:configurationForMenuAtLocation:](&v8, sel_contextMenuInteraction_configurationForMenuAtLocation_, a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_alwaysUsesUIMenuOrdering)
    objc_msgSend(v5, "setPreferredMenuElementOrder:", 2);
  return v6;
}

- (double)normalImageAlpha
{
  return self->_normalImageAlpha;
}

- (double)highlightedImageAlpha
{
  return self->_highlightedImageAlpha;
}

- (double)highlightAnimationDuration
{
  return self->_highlightAnimationDuration;
}

- (void)setHighlightAnimationDuration:(double)a3
{
  self->_highlightAnimationDuration = a3;
}

- (UIColor)dimmableBackgroundColor
{
  return self->_dimmableBackgroundColor;
}

- (NSValue)tapTargetSideMargins
{
  return self->_tapTargetSideMargins;
}

- (BOOL)alwaysUsesUIMenuOrdering
{
  return self->_alwaysUsesUIMenuOrdering;
}

- (void)setAlwaysUsesUIMenuOrdering:(BOOL)a3
{
  self->_alwaysUsesUIMenuOrdering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapTargetSideMargins, 0);
  objc_storeStrong((id *)&self->_dimmableBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cachedDimmedBackgroundColor, 0);
}

@end
