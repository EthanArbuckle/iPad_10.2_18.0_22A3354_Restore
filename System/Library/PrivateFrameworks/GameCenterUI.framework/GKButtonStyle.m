@implementation GKButtonStyle

+ (id)defaultStyle
{
  GKButtonStyle *v2;
  void *v3;
  GKButtonStyle *v4;

  v2 = [GKButtonStyle alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0799999982);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKButtonStyle initWithCornerRadius:andBackgroundColor:](v2, "initWithCornerRadius:andBackgroundColor:", v3, 14.0);

  return v4;
}

+ (id)standardStyle
{
  GKButtonStyle *v2;
  void *v3;
  GKButtonStyle *v4;

  v2 = [GKButtonStyle alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.200000003);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKButtonStyle initWithCornerRadius:andBackgroundColor:](v2, "initWithCornerRadius:andBackgroundColor:", v3, 12.0);

  return v4;
}

- (GKButtonStyle)initWithCornerRadius:(double)a3 andBackgroundColor:(id)a4
{
  id v7;
  char *v8;
  GKButtonStyle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKButtonStyle;
  v8 = -[GKButtonStyle init](&v11, sel_init);
  v9 = (GKButtonStyle *)v8;
  if (v8)
  {
    *((double *)v8 + 2) = a3;
    v8[8] = 1;
    *(_OWORD *)(v8 + 40) = xmmword_1AB7F85A0;
    *(_OWORD *)(v8 + 56) = xmmword_1AB7F85A0;
    objc_storeStrong((id *)v8 + 3, a4);
    v9->_compositingFilter = (id)*MEMORY[0x1E0CD2EA0];
  }

  return v9;
}

- (void)applyToButton:(id)a3
{
  double cornerRadius;
  void *v5;
  id compositingFilter;
  void *v7;
  id v8;

  cornerRadius = self->_cornerRadius;
  v8 = a3;
  objc_msgSend(v8, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", cornerRadius);

  objc_msgSend(v8, "setClipsToBounds:", self->_clipToBounds);
  objc_msgSend(v8, "setTitleEdgeInsets:", self->_titleEdgeInsets.top, self->_titleEdgeInsets.left, self->_titleEdgeInsets.bottom, self->_titleEdgeInsets.right);
  objc_msgSend(v8, "setBackgroundColor:", self->_backgroundColor);
  compositingFilter = self->_compositingFilter;
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", compositingFilter);

  objc_msgSend(v8, "setNeedsLayout");
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)clipToBounds
{
  return self->_clipToBounds;
}

- (void)setClipToBounds:(BOOL)a3
{
  self->_clipToBounds = a3;
}

- (UIEdgeInsets)titleEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_titleEdgeInsets.top;
  left = self->_titleEdgeInsets.left;
  bottom = self->_titleEdgeInsets.bottom;
  right = self->_titleEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  self->_titleEdgeInsets = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (id)compositingFilter
{
  return self->_compositingFilter;
}

- (void)setCompositingFilter:(id)a3
{
  self->_compositingFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
