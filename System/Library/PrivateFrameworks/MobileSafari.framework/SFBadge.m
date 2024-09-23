@implementation SFBadge

- (SFBadge)initWithFrame:(CGRect)a3
{
  SFBadge *v3;
  SFBadge *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SFBadge *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFBadge;
  v3 = -[SFBadge initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFBadge tintColor](v3, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFBadge setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = *MEMORY[0x1E0CD2A60];
    -[SFBadge layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    v8 = v4;
  }

  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFBadge;
  -[SFBadge tintColorDidChange](&v4, sel_tintColorDidChange);
  -[SFBadge tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBadge setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  void *v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)SFBadge;
  -[SFBadge layoutSubviews](&v10, sel_layoutSubviews);
  -[SFBadge bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = fmin(v7, CGRectGetHeight(v12)) * 0.5;
  -[SFBadge layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 6.0;
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
