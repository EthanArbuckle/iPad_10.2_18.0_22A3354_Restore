@implementation QLPinchRotationTracker

- (QLPinchRotationTracker)init
{
  QLPinchRotationTracker *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLPinchRotationTracker;
  result = -[QLPinchRotationTracker init](&v3, sel_init);
  if (result)
  {
    result->_targetZoom = 0.35;
    result->_minimumZoomForDismissal = 0.95;
  }
  return result;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6
{
  double x;
  __int128 v8;
  __int128 v9;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  double y;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;

  x = a6.x;
  self->_initialBounds = a4;
  self->_initialTrackingCenter = a3;
  self->_trackedCenter = a3;
  v8 = *(_OWORD *)&a5->a;
  v9 = *(_OWORD *)&a5->c;
  *(_OWORD *)&self->_trackedTransform.tx = *(_OWORD *)&a5->tx;
  *(_OWORD *)&self->_trackedTransform.c = v9;
  *(_OWORD *)&self->_trackedTransform.a = v8;
  self->_initialGestureLocation = a6;
  self->_previousScale = 1.0;
  self->_trackedScale = 1.0;
  *(CGFloat *)&v8 = a4.origin.x;
  *(CGFloat *)&v9 = a4.origin.y;
  width = a4.size.width;
  height = a4.size.height;
  v12 = CGRectGetWidth(*(CGRect *)&v8);
  y = self->_initialGestureLocation.y;
  v14 = x / v12;
  v15 = CGRectGetHeight(self->_initialBounds);
  self->_anchorPoint.x = v14;
  self->_anchorPoint.y = y / v15;
  v16 = self->_initialGestureLocation.x;
  v17 = v16 - CGRectGetWidth(self->_initialBounds) * 0.5;
  v18 = self->_initialGestureLocation.y;
  v19 = CGRectGetHeight(self->_initialBounds);
  self->_anchorLocationOffset.x = v17;
  self->_anchorLocationOffset.y = v18 - v19 * 0.5;
}

- (void)trackGestureLocation:(CGPoint)a3
{
  CGFloat y;

  self->_location = a3;
  y = a3.y;
  self->_trackedCenter = (CGPoint)vaddq_f64(vsubq_f64((float64x2_t)a3, (float64x2_t)self->_initialGestureLocation), (float64x2_t)self->_initialTrackingCenter);
  -[QLPinchRotationTracker update](self, "update");
}

- (void)trackScale:(double)a3
{
  self->_previousScale = self->_trackedScale;
  self->_trackedScale = a3;
  -[QLPinchRotationTracker update](self, "update");
}

- (void)trackRotation:(double)a3
{
  self->_rotation = a3;
  -[QLPinchRotationTracker update](self, "update");
}

- (_QLDismissGestureTrackingVelocity)trackedVelocity
{
  double trackedScale;
  double rotation;
  double v4;
  double v5;
  _QLDismissGestureTrackingVelocity result;

  trackedScale = self->_trackedScale;
  rotation = self->_rotation;
  v4 = 0.0;
  v5 = 0.0;
  result.var3 = rotation;
  result.var2 = trackedScale;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (CGRect)trackedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialBounds.origin.x;
  y = self->_initialBounds.origin.y;
  width = self->_initialBounds.size.width;
  height = self->_initialBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)finalAnimationDuration
{
  return 0.4;
}

- (double)finalAnimationSpringDamping
{
  return 1.0;
}

- (void)update
{
  double trackedScale;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  double rotation;
  __int128 v10;
  __int128 v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  trackedScale = self->_trackedScale;
  self->_shouldFinishDismissal = trackedScale < self->_minimumZoomForDismissal;
  v4 = MEMORY[0x24BDBD8B8];
  v5 = *MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&self->_trackedTransform.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&self->_trackedTransform.c = v6;
  v7 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&self->_trackedTransform.tx = v7;
  *(_OWORD *)&v13.a = v5;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tx = v7;
  CGAffineTransformScale(&v14, &v13, trackedScale, trackedScale);
  v8 = *(_OWORD *)&v14.c;
  *(_OWORD *)&self->_trackedTransform.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&self->_trackedTransform.c = v8;
  *(_OWORD *)&self->_trackedTransform.tx = *(_OWORD *)&v14.tx;
  rotation = self->_rotation;
  v10 = *(_OWORD *)&self->_trackedTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->_trackedTransform.a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tx = *(_OWORD *)&self->_trackedTransform.tx;
  CGAffineTransformRotate(&v14, &v13, rotation);
  v11 = *(_OWORD *)&v14.c;
  *(_OWORD *)&self->_trackedTransform.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&self->_trackedTransform.c = v11;
  *(_OWORD *)&self->_trackedTransform.tx = *(_OWORD *)&v14.tx;
  self->_trackedCenter = (CGPoint)vaddq_f64(vaddq_f64(vsubq_f64((float64x2_t)self->_location, (float64x2_t)self->_initialGestureLocation), (float64x2_t)self->_initialTrackingCenter), (float64x2_t)self->_anchorLocationOffset);
  v12 = 1.0;
  if ((1.0 - trackedScale) / (1.0 - self->_targetZoom) <= 1.0)
    v12 = (1.0 - trackedScale) / (1.0 - self->_targetZoom);
  self->_dismissalProgress = fmax(v12, 0.0);
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)trackedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_trackedCenter.x;
  y = self->_trackedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGAffineTransform)trackedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].d;
  return self;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (BOOL)shouldFinishDismissal
{
  return self->_shouldFinishDismissal;
}

- (double)targetZoom
{
  return self->_targetZoom;
}

- (void)setTargetZoom:(double)a3
{
  self->_targetZoom = a3;
}

- (double)minimumZoomForDismissal
{
  return self->_minimumZoomForDismissal;
}

- (void)setMinimumZoomForDismissal:(double)a3
{
  self->_minimumZoomForDismissal = a3;
}

@end
