@implementation AKAuthorizationAppleIDButton

+ (id)buttonWithType:(int64_t)a3 style:(int64_t)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationButtonType:authorizationButtonStyle:", a3, a4);
}

- (AKAuthorizationAppleIDButton)initWithAuthorizationButtonType:(int64_t)a3 authorizationButtonStyle:(int64_t)a4
{
  double v6;
  double v7;
  AKAuthorizationAppleIDButton *v8;
  AKAuthorizationAppleIDButton *v9;
  double v10;
  objc_super v12;

  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationAppleIDButton;
  v8 = -[AKAuthorizationAppleIDButton initWithFrame:](&v12, sel_initWithFrame_, v6, v7, 130.0, 30.0);
  v9 = v8;
  if (v8)
  {
    if (a4 == 3)
    {
      v8->_changesInterfaceStyle = 1;
      a4 = +[AKAuthorizationAppleIDButton _buttonStyleForUIStyle](AKAuthorizationAppleIDButton, "_buttonStyleForUIStyle");
    }
    v9->_type = a3;
    v9->_style = a4;
    objc_msgSend((id)objc_opt_class(), "defaultCornerRadius");
    v9->_cornerRadius = v10;
    -[AKAuthorizationAppleIDButton _commonInit](v9, "_commonInit");
  }
  return v9;
}

- (AKAuthorizationAppleIDButton)initWithFrame:(CGRect)a3
{
  return -[AKAuthorizationAppleIDButton initWithAuthorizationButtonType:authorizationButtonStyle:](self, "initWithAuthorizationButtonType:authorizationButtonStyle:", 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (AKAuthorizationAppleIDButton)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationAppleIDButton *v5;

  v4 = a3;
  v5 = -[AKAuthorizationAppleIDButton init](self, "init");
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_style"));
    -[AKAuthorizationAppleIDButton _commonInit](v5, "_commonInit");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationAppleIDButton;
  v4 = a3;
  -[AKAuthorizationAppleIDButton encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("_type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("_style"));

}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationAppleIDButton setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = (void *)MEMORY[0x1E0CB3718];
  -[AKAuthorizationAppleIDButton widthAnchor](self, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintGreaterThanOrEqualToConstant:", 130.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  -[AKAuthorizationAppleIDButton widthAnchor](self, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintLessThanOrEqualToConstant:", 375.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  -[AKAuthorizationAppleIDButton heightAnchor](self, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", 30.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  -[AKAuthorizationAppleIDButton heightAnchor](self, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", 64.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v13);

}

+ (int64_t)_buttonStyleForUIStyle
{
  void *v2;
  _BOOL4 v3;

  objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") != 2;

  return 2 * v3;
}

+ (double)defaultCornerRadius
{
  return 6.0;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[AKAuthorizationAppleIDButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)drawRect:(CGRect)a3
{
  -[AKAuthorizationAppleIDButton _drawRect:inView:](self, "_drawRect:inView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_drawRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGContext *CurrentContext;
  void *v11;
  double v12;
  double v13;
  CGImage *v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v9, "_screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "scale");
  v13 = v12;

  v14 = AKCreateAppleIDButtonImageWithCornerRadius(self->_type, self->_style, 0, width, height, v13, self->_cornerRadius);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGContextDrawImage(CurrentContext, v15, v14);
  CGImageRelease(v14);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationAppleIDButton;
  -[AKAuthorizationAppleIDButton layoutSubviews](&v3, sel_layoutSubviews);
  -[AKAuthorizationAppleIDButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 130.0;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_createHighlightFilterIfNecessary
{
  id v3;
  CAFilter *v4;
  CAFilter *highlightFilter;
  CAFilter *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_highlightFilter)
  {
    v3 = objc_alloc(MEMORY[0x1E0CD2780]);
    v4 = (CAFilter *)objc_msgSend(v3, "initWithType:", *MEMORY[0x1E0CD2E60]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    v6 = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAFilter setValue:forKey:](v6, "setValue:forKey:", objc_msgSend(v7, "CGColor"), CFSTR("inputColor"));

    v10[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKAuthorizationAppleIDButton layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v8);

  }
}

- (void)_performAnimationToSetHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a3;
  -[AKAuthorizationAppleIDButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
  -[AKAuthorizationAppleIDButton layer](self, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0.6;
  if (!v3)
    v5 = 1.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA478];
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithCGColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v15, "setValue:forKeyPath:", objc_msgSend(v10, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDuration:", 0.15);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  v12 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "CGColor"));
  v13 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "setToValue:", objc_msgSend(v13, "CGColor"));
  v14 = (id)objc_msgSend(v15, "ak_addAdditiveAnimation:", v11);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[AKAuthorizationAppleIDButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AKAuthorizationAppleIDButton;
    -[AKAuthorizationAppleIDButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[AKAuthorizationAppleIDButton _performAnimationToSetHighlighted:](self, "_performAnimationToSetHighlighted:", v3);
  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationAppleIDButton;
  -[AKAuthorizationAppleIDButton setEnabled:](&v6, sel_setEnabled_);
  v5 = 0.5;
  if (v3)
    v5 = 1.0;
  -[AKAuthorizationAppleIDButton setAlpha:](self, "setAlpha:", v5);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E0CEB110];
}

- (id)accessibilityLabel
{
  int64_t type;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  type = self->_type;
  if (type == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SIGN_UP_WITH_APPLE");
  }
  else if (type == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("CONTINUE_WITH_APPLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("SIGN_IN_WITH_APPLE");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E7679C68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationAppleIDButton;
  -[AKAuthorizationAppleIDButton traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  if (self->_changesInterfaceStyle)
  {
    -[AKAuthorizationAppleIDButton traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle") != 2;

    self->_style = 2 * v5;
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightFilter, 0);
}

@end
