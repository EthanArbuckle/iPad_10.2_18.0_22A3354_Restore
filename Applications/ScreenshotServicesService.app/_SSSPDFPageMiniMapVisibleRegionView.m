@implementation _SSSPDFPageMiniMapVisibleRegionView

- (_SSSPDFPageMiniMapVisibleRegionView)initWithFrame:(CGRect)a3
{
  _SSSPDFPageMiniMapVisibleRegionView *v3;
  CAShapeLayer *v4;
  CAShapeLayer *shadowMask;
  id v6;
  double y;
  double width;
  double height;
  UIView *v10;
  UIView *shadowView;
  UIView *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *highlightView;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_SSSPDFPageMiniMapVisibleRegionView;
  v3 = -[_SSSPDFPageMiniMapVisibleRegionView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  shadowMask = v3->_shadowMask;
  v3->_shadowMask = v4;

  v6 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (UIView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  shadowView = v3->_shadowView;
  v3->_shadowView = v10;

  v12 = v3->_shadowView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
  -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_shadowView, "layer"));
  objc_msgSend(v14, "setMask:", v3->_shadowMask);

  -[_SSSPDFPageMiniMapVisibleRegionView addSubview:](v3, "addSubview:", v3->_shadowView);
  v15 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  highlightView = v3->_highlightView;
  v3->_highlightView = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_highlightView, "layer"));
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
  objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_highlightView, "layer"));
  objc_msgSend(v19, "setBorderWidth:", 2.0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_highlightView, "layer"));
  objc_msgSend(v20, "setCornerRadius:", 2.0);

  -[_SSSPDFPageMiniMapVisibleRegionView addSubview:](v3, "addSubview:", v3->_highlightView);
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SSSPDFPageMiniMapVisibleRegionView;
  -[_SSSPDFPageMiniMapVisibleRegionView layoutSubviews](&v3, "layoutSubviews");
  -[_SSSPDFPageMiniMapVisibleRegionView visibleRect](self, "visibleRect");
  -[_SSSPDFPageMiniMapVisibleRegionView updateVisibleRegionViewWithVisibleRect:](self, "updateVisibleRegionViewWithVisibleRect:");
  -[_SSSPDFPageMiniMapVisibleRegionView visibleRect](self, "visibleRect");
  -[_SSSPDFPageMiniMapVisibleRegionView updateHiddenRegionViewWithVisibleRect:](self, "updateHiddenRegionViewWithVisibleRect:");
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
  -[_SSSPDFPageMiniMapVisibleRegionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateVisibleRegionViewWithVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *highlightView;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  highlightView = self->_highlightView;
  v9 = CGRectInset(a3, -2.0, -2.0);
  -[UIView setFrame:](highlightView, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  v11.origin.x = CGRectZero.origin.x;
  v11.origin.y = CGRectZero.origin.y;
  v11.size.width = CGRectZero.size.width;
  v11.size.height = CGRectZero.size.height;
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[UIView setHidden:](self->_highlightView, "setHidden:", CGRectEqualToRect(v10, v11));
}

- (void)updateHiddenRegionViewWithVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIView *shadowView;
  CAShapeLayer *shadowMask;
  CGPath *Mutable;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  shadowView = self->_shadowView;
  -[_SSSPDFPageMiniMapVisibleRegionView bounds](self, "bounds");
  -[UIView setFrame:](shadowView, "setFrame:");
  shadowMask = self->_shadowMask;
  -[UIView bounds](self->_shadowView, "bounds");
  -[CAShapeLayer setFrame:](shadowMask, "setFrame:");
  Mutable = CGPathCreateMutable();
  -[CAShapeLayer bounds](self->_shadowMask, "bounds");
  CGPathAddRect(Mutable, 0, v11);
  -[UIView convertRect:fromView:](self->_shadowView, "convertRect:fromView:", self, x, y, width, height);
  v13 = CGRectInset(v12, -1.0, -1.0);
  CGPathAddRect(Mutable, 0, v13);
  -[CAShapeLayer setPath:](self->_shadowMask, "setPath:", Mutable);
  -[CAShapeLayer setFillRule:](self->_shadowMask, "setFillRule:", kCAFillRuleEvenOdd);
  CGPathRelease(Mutable);
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightView, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (CAShapeLayer)shadowMask
{
  return self->_shadowMask;
}

- (void)setShadowMask:(id)a3
{
  objc_storeStrong((id *)&self->_shadowMask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowMask, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
}

@end
