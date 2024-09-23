@implementation QLSwipeDownTracker

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  __int128 v6;
  _OWORD v7[3];
  objc_super v8;

  self->_initialBounds = a4;
  v8.receiver = self;
  v8.super_class = (Class)QLSwipeDownTracker;
  v6 = *(_OWORD *)&a5->c;
  v7[0] = *(_OWORD *)&a5->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->tx;
  -[QLPHSwipeDownTracker startTrackingCenter:bounds:transform:withInitialGestureLocation:](&v8, sel_startTrackingCenter_bounds_transform_withInitialGestureLocation_, v7, a3.x, a3.y);
}

- (CGPoint)anchorPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.5;
  v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGAffineTransform)trackedTransform
{
  double Width;
  CGFloat v6;
  CGAffineTransform v8;
  objc_super v9;
  CGAffineTransform v10;
  CGRect v11;

  memset(&v10, 0, sizeof(v10));
  v9.receiver = self;
  v9.super_class = (Class)QLSwipeDownTracker;
  -[CGAffineTransform trackedTransform](&v9, sel_trackedTransform);
  -[QLPHSwipeDownTracker trackedBounds](self, "trackedBounds");
  Width = CGRectGetWidth(v11);
  v6 = CGRectGetWidth(self->_initialBounds);
  v8 = v10;
  return CGAffineTransformScale(retstr, &v8, Width / v6, Width / v6);
}

@end
