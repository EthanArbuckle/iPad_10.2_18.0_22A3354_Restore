@implementation ASVWorldGestureDragOffsetCorrector

- (ASVWorldGestureDragOffsetCorrector)initWithInitialDragOffset:(ASVWorldGestureDragOffsetCorrector *)self thresholdDragOffset:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ASVWorldGestureDragOffsetCorrector *v6;
  ASVWorldGestureDragOffsetCorrector *v7;
  objc_super v9;

  v4 = v3;
  v5 = v2;
  v9.receiver = self;
  v9.super_class = (Class)ASVWorldGestureDragOffsetCorrector;
  v6 = -[ASVWorldGestureDragOffsetCorrector init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)v6->_initialDragOffset = v5;
    *(_QWORD *)v6->_thresholdDragOffset = v4;
    v6->_startTime = CACurrentMediaTime();
  }
  return v7;
}

- (uint64_t)currentDragOffset
{
  double v2;
  double v3;

  v2 = CACurrentMediaTime();
  objc_msgSend(a1, "startTime");
  if (v2 - v3 < 0.25)
    objc_msgSend(a1, "thresholdDragOffset");
  return objc_msgSend(a1, "initialDragOffset");
}

- (double)initialDragOffset
{
  return *(double *)(a1 + 8);
}

- (void)setInitialDragOffset:(ASVWorldGestureDragOffsetCorrector *)self
{
  uint64_t v2;

  *(_QWORD *)self->_initialDragOffset = v2;
}

- (double)thresholdDragOffset
{
  return *(double *)(a1 + 16);
}

- (void)setThresholdDragOffset:(ASVWorldGestureDragOffsetCorrector *)self
{
  uint64_t v2;

  *(_QWORD *)self->_thresholdDragOffset = v2;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

@end
