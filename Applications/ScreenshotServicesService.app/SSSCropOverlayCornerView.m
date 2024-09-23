@implementation SSSCropOverlayCornerView

- (id)initForCorner:(unint64_t)a3
{
  SSSCropOverlayCornerView *v4;
  CGFloat v5;
  SSSCropOverlayGrabberView *v6;
  SSSCropOverlayGrabberView *topLineView;
  SSSCropOverlayGrabberView *v8;
  SSSCropOverlayGrabberView *leftLineView;
  CGAffineTransform v11;
  CGAffineTransform v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSSCropOverlayCornerView;
  v4 = -[SSSCropOverlayCornerView init](&v13, "init");
  v4->_corner = a3;
  v5 = 0.0;
  if (a3 - 2 <= 6)
    v5 = dbl_10006E128[a3 - 2];
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, v5);
  v11 = v12;
  -[SSSCropOverlayCornerView setTransform:](v4, "setTransform:", &v11);
  v6 = -[SSSCropOverlayGrabberView initWithEdge:]([SSSCropOverlayGrabberView alloc], "initWithEdge:", 1);
  topLineView = v4->_topLineView;
  v4->_topLineView = v6;

  v8 = -[SSSCropOverlayGrabberView initWithEdge:]([SSSCropOverlayGrabberView alloc], "initWithEdge:", 2);
  leftLineView = v4->_leftLineView;
  v4->_leftLineView = v8;

  -[SSSCropOverlayCornerView addSubview:](v4, "addSubview:", v4->_topLineView);
  -[SSSCropOverlayCornerView addSubview:](v4, "addSubview:", v4->_leftLineView);
  return v4;
}

+ (double)preferredDimension
{
  double result;

  +[SSSCropOverlayGrabberView preferredOtherDimension](SSSCropOverlayGrabberView, "preferredOtherDimension");
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSSCropOverlayCornerView;
  -[SSSCropOverlayCornerView layoutSubviews](&v10, "layoutSubviews");
  -[SSSCropOverlayCornerView bounds](self, "bounds");
  v4 = v3;
  -[SSSCropOverlayCornerView bounds](self, "bounds");
  v6 = v5;
  +[SSSCropOverlayGrabberView preferredDimension](SSSCropOverlayGrabberView, "preferredDimension");
  v8 = v7;
  v9 = v6 - v7;
  -[SSSCropOverlayGrabberView setFrame:](self->_topLineView, "setFrame:", 0.0, 0.0, v4, v7);
  -[SSSCropOverlayGrabberView setFrame:](self->_leftLineView, "setFrame:", 0.0, v8, v8, v9);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  +[SSSCropOverlayCornerView preferredDimension](SSSCropOverlayCornerView, "preferredDimension");
  v3 = v2;
  +[SSSCropOverlayCornerView preferredDimension](SSSCropOverlayCornerView, "preferredDimension");
  v5 = v4;
  v6 = v3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SSSCropOverlayGrabberView *topLineView;
  unsigned __int8 v9;
  SSSCropOverlayGrabberView *leftLineView;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  topLineView = self->_topLineView;
  -[SSSCropOverlayGrabberView convertPoint:fromView:](topLineView, "convertPoint:fromView:", self, x, y);
  if (-[SSSCropOverlayGrabberView pointInside:withEvent:](topLineView, "pointInside:withEvent:", v7))
  {
    v9 = 1;
  }
  else
  {
    leftLineView = self->_leftLineView;
    -[SSSCropOverlayGrabberView convertPoint:fromView:](leftLineView, "convertPoint:fromView:", self, x, y);
    v9 = -[SSSCropOverlayGrabberView pointInside:withEvent:](leftLineView, "pointInside:withEvent:", v7);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  SSSCropOverlayCornerView *v6;
  id v7;
  SSSCropOverlayGrabberView *v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  SSSCropOverlayCornerView *v14;
  objc_super v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v16.receiver = self;
  v16.super_class = (Class)SSSCropOverlayCornerView;
  v7 = -[SSSCropOverlayCornerView hitTest:withEvent:](&v16, "hitTest:withEvent:", a4);
  v8 = (SSSCropOverlayGrabberView *)objc_claimAutoreleasedReturnValue(v7);
  v9 = CGRectZero.origin.y;
  v10 = SSMinimumTouchableDimension;
  +[SSSCropOverlayGrabberView preferredDimension](SSSCropOverlayGrabberView, "preferredDimension");
  UIRectCenteredAboutPoint(CGRectZero.origin.x, v9, v10, v10, v11 * 0.5, v11 * 0.5);
  v17.x = x;
  v17.y = y;
  v12 = CGRectContainsPoint(v18, v17);
  if (v8 != v6->_topLineView && v8 != v6->_leftLineView && !v12)
    v6 = (SSSCropOverlayCornerView *)v8;
  v14 = v6;

  return v14;
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftLineView, 0);
  objc_storeStrong((id *)&self->_topLineView, 0);
}

@end
