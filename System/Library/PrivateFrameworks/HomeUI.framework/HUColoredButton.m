@implementation HUColoredButton

- (HUColoredButton)initWithFrame:(CGRect)a3
{
  return -[HUColoredButton initWithFrame:highlightedAlpha:highlightedTextAlpha:](self, "initWithFrame:highlightedAlpha:highlightedTextAlpha:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.5, 0.25);
}

- (HUColoredButton)initWithFrame:(CGRect)a3 highlightedAlpha:(double)a4 highlightedTextAlpha:(double)a5
{
  HUColoredButton *v7;
  HUColoredButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUColoredButton;
  v7 = -[HUColoredButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    -[HUColoredButton setCornerRadius:](v7, "setCornerRadius:", 8.0);
    -[HUColoredButton setHighlightedAlpha:](v8, "setHighlightedAlpha:", a4);
    -[HUColoredButton setHighlightedTextAlpha:](v8, "setHighlightedTextAlpha:", a5);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0CEB5E8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButton titleLabel](v8, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    -[HUColoredButton titleLabel](v8, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBaselineAdjustment:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButton setTitleColor:forState:](v8, "setTitleColor:forState:", v12, 0);

    v13 = (void *)MEMORY[0x1E0CEA478];
    -[HUColoredButton highlightedTextAlpha](v8, "highlightedTextAlpha");
    objc_msgSend(v13, "colorWithWhite:alpha:", 1.0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButton setTitleColor:forState:](v8, "setTitleColor:forState:", v15, 1);

  }
  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUColoredButton;
  -[HUColoredButton setHighlighted:](&v6, sel_setHighlighted_);
  v5 = 1.0;
  if (v3)
    -[HUColoredButton highlightedAlpha](self, "highlightedAlpha", 1.0);
  -[HUColoredButton setAlpha:](self, "setAlpha:", v5);
}

- (void)setBackgroundColorFollowsTintColor:(BOOL)a3
{
  id v4;

  if (self->_backgroundColorFollowsTintColor != a3)
  {
    self->_backgroundColorFollowsTintColor = a3;
    if (a3)
    {
      -[HUColoredButton tintColor](self, "tintColor");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[HUColoredButton setBackgroundColor:](self, "setBackgroundColor:", v4);

    }
  }
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUColoredButton;
  -[HUColoredButton tintColorDidChange](&v4, sel_tintColorDidChange);
  if (-[HUColoredButton backgroundColorFollowsTintColor](self, "backgroundColorFollowsTintColor"))
  {
    -[HUColoredButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUColoredButton setBackgroundColor:](self, "setBackgroundColor:", v3);

  }
}

- (BOOL)backgroundColorFollowsTintColor
{
  return self->_backgroundColorFollowsTintColor;
}

- (double)highlightedAlpha
{
  return self->_highlightedAlpha;
}

- (void)setHighlightedAlpha:(double)a3
{
  self->_highlightedAlpha = a3;
}

- (double)highlightedTextAlpha
{
  return self->_highlightedTextAlpha;
}

- (void)setHighlightedTextAlpha:(double)a3
{
  self->_highlightedTextAlpha = a3;
}

@end
