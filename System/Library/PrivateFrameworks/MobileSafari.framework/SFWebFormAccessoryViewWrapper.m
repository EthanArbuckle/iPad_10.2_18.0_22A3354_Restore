@implementation SFWebFormAccessoryViewWrapper

- (SFWebFormAccessoryViewWrapper)initWithWebFormAccessoryView:(id)a3 bottomBarHeight:(double)a4
{
  id v7;
  SFWebFormAccessoryViewWrapper *v8;
  SFWebFormAccessoryViewWrapper *v9;
  SFWebFormAccessoryViewWrapper *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFWebFormAccessoryViewWrapper;
  v8 = -[SFWebFormAccessoryViewWrapper init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_bottomBarHeight = a4;
    objc_storeStrong((id *)&v8->_webFormAccessoryView, a3);
    -[SFWebFormAccessoryViewWrapper addSubview:](v9, "addSubview:", v7);
    -[SFWebFormAccessoryViewWrapper sizeToFit](v9, "sizeToFit");
    v10 = v9;
  }

  return v9;
}

- (void)setBottomBarHeight:(double)a3
{
  if (self->_bottomBarHeight != a3)
  {
    self->_bottomBarHeight = a3;
    -[SFWebFormAccessoryViewWrapper sizeToFit](self, "sizeToFit");
    -[SFWebFormAccessoryViewWrapper setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double Height;
  double v20;
  CGRect rect;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = SFWebFormAccessoryViewWrapper;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[SFWebFormAccessoryViewWrapper bounds](self, "bounds");
  v4 = v3;
  rect.origin.x = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView frame](self->_webFormAccessoryView, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  Height = CGRectGetHeight(v22);
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  v20 = Height - CGRectGetHeight(v23);
  v24.origin.x = rect.origin.x;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[UIView setFrame:](self->_webFormAccessoryView, "setFrame:", v12, v20, CGRectGetWidth(v24), v18);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double bottomBarHeight;
  double v5;
  double v6;
  CGSize result;
  CGRect v8;

  width = a3.width;
  bottomBarHeight = self->_bottomBarHeight;
  -[UIView bounds](self->_webFormAccessoryView, "bounds", a3.width, a3.height);
  v5 = bottomBarHeight + CGRectGetHeight(v8);
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_webFormAccessoryView, "frame", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (double)bottomBarHeight
{
  return self->_bottomBarHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webFormAccessoryView, 0);
}

@end
