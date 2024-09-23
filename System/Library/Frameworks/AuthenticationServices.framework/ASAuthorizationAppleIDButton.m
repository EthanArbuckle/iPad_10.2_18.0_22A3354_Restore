@implementation ASAuthorizationAppleIDButton

+ (ASAuthorizationAppleIDButton)buttonWithType:(ASAuthorizationAppleIDButtonType)type style:(ASAuthorizationAppleIDButtonStyle)style
{
  return (ASAuthorizationAppleIDButton *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAuthorizationButtonType:authorizationButtonStyle:", type, style);
}

- (ASAuthorizationAppleIDButton)initWithAuthorizationButtonType:(ASAuthorizationAppleIDButtonType)type authorizationButtonStyle:(ASAuthorizationAppleIDButtonStyle)style
{
  double v6;
  double v7;
  ASAuthorizationAppleIDButton *v8;
  ASAuthorizationAppleIDButton *v9;
  double v10;
  objc_super v12;

  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v12.receiver = self;
  v12.super_class = (Class)ASAuthorizationAppleIDButton;
  v8 = -[ASAuthorizationAppleIDButton initWithFrame:](&v12, sel_initWithFrame_, v6, v7, 130.0, 30.0);
  v9 = v8;
  if (v8)
  {
    v8->_type = type;
    v8->_style = style;
    objc_msgSend((id)objc_opt_class(), "defaultCornerRadius");
    v9->_cornerRadius = v10;
    _ASAuthorizationButtonInitialize(v9);
  }
  return v9;
}

- (ASAuthorizationAppleIDButton)initWithFrame:(CGRect)a3
{
  return -[ASAuthorizationAppleIDButton initWithAuthorizationButtonType:authorizationButtonStyle:](self, "initWithAuthorizationButtonType:authorizationButtonStyle:", 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ASAuthorizationAppleIDButton)initWithCoder:(id)a3
{
  id v4;
  ASAuthorizationAppleIDButton *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASAuthorizationAppleIDButton;
  v5 = -[ASAuthorizationAppleIDButton initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_style"));
    _ASAuthorizationButtonInitialize(v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASAuthorizationAppleIDButton;
  v4 = a3;
  -[ASAuthorizationAppleIDButton encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("_type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("_style"));

}

+ (double)defaultCornerRadius
{
  return 6.0;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  if (self->_cornerRadius != cornerRadius)
  {
    self->_cornerRadius = cornerRadius;
    -[ASAuthorizationAppleIDButton setNeedsDisplay](self, "setNeedsDisplay");
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)drawRect:(CGRect)a3
{
  -[ASAuthorizationAppleIDButton _drawRect:inView:](self, "_drawRect:inView:", self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_drawRect:(CGRect)a3 inView:(id)a4
{
  id v5;
  CGContext *CurrentContext;
  void *v7;
  CGImage *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGRect v17;

  v5 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v5, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");

  -[ASAuthorizationAppleIDButton _ak_buttonType](self, "_ak_buttonType");
  -[ASAuthorizationAppleIDButton _ak_buttonStyle](self, "_ak_buttonStyle");
  objc_msgSend(v5, "bounds");
  v8 = (CGImage *)AKCreateAppleIDButtonImageWithCornerRadius();
  objc_msgSend(v5, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17.origin.x = v10;
  v17.origin.y = v12;
  v17.size.width = v14;
  v17.size.height = v16;
  CGContextDrawImage(CurrentContext, v17, v8);
  CGImageRelease(v8);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASAuthorizationAppleIDButton;
  -[ASAuthorizationAppleIDButton layoutSubviews](&v3, sel_layoutSubviews);
  -[ASAuthorizationAppleIDButton setNeedsDisplay](self, "setNeedsDisplay");
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

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_highlightFilter)
  {
    v3 = objc_alloc(MEMORY[0x24BDE56B0]);
    v4 = (CAFilter *)objc_msgSend(v3, "initWithType:", *MEMORY[0x24BDE5BA8]);
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    -[CAFilter setName:](self->_highlightFilter, "setName:", CFSTR("highlightFilter"));
    v6 = self->_highlightFilter;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 1.0);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAFilter setValue:forKey:](v6, "setValue:forKey:", objc_msgSend(v7, "CGColor"), CFSTR("inputColor"));

    v10[0] = self->_highlightFilter;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationAppleIDButton layer](self, "layer");
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
  -[ASAuthorizationAppleIDButton _createHighlightFilterIfNecessary](self, "_createHighlightFilterIfNecessary");
  -[ASAuthorizationAppleIDButton layer](self, "layer");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0.6;
  if (!v3)
    v5 = 1.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithCGColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v15, "setValue:forKeyPath:", objc_msgSend(v10, "CGColor"), CFSTR("filters.highlightFilter.inputColor"));
  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("filters.highlightFilter.inputColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDuration:", 0.15);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x24BDE5978]);
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
  if (-[ASAuthorizationAppleIDButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ASAuthorizationAppleIDButton;
    -[ASAuthorizationAppleIDButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[ASAuthorizationAppleIDButton _performAnimationToSetHighlighted:](self, "_performAnimationToSetHighlighted:", v3);
  }
}

- (int64_t)_ak_buttonType
{
  int64_t type;

  type = self->_type;
  if (type == 1)
    return 2;
  else
    return type == 2;
}

- (int64_t)_ak_buttonStyle
{
  int64_t style;
  int64_t v3;

  style = self->_style;
  v3 = 1;
  if (style != 1)
    v3 = 2;
  if (style)
    return v3;
  else
    return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (id)accessibilityLabel
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightFilter, 0);
}

@end
