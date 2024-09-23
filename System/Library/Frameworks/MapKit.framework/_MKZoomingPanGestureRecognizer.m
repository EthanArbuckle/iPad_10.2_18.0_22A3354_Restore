@implementation _MKZoomingPanGestureRecognizer

- (void)setZoomDraggingResistance:(double)a3
{
  self->_zoomDraggingResistance = a3;
}

- (_MKZoomingPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _MKZoomingPanGestureRecognizer *v4;
  _MKZoomingPanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MKZoomingPanGestureRecognizer;
  v4 = -[_MKZoomingPanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[_MKZoomingPanGestureRecognizer reset](v4, "reset");
  return v5;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKZoomingPanGestureRecognizer;
  -[_MKZoomingPanGestureRecognizer reset](&v3, sel_reset);
  self->_didStartUpdate = 0;
  self->_translation = 0.0;
  self->_scale = 1.0;
  self->_velocity = 0.0;
  self->_previousVelocity = 0.0;
}

- (double)velocity
{
  double previousVelocity;

  previousVelocity = self->_previousVelocity;
  if (previousVelocity == 0.0)
    return self->_velocity;
  else
    return previousVelocity * 0.75 + self->_velocity * 0.25;
}

- (double)scale
{
  return self->_scale;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKZoomingPanGestureRecognizer;
  -[_MKZoomingPanGestureRecognizer touchesMoved:withEvent:](&v5, sel_touchesMoved_withEvent_, a3, a4);
  -[_MKZoomingPanGestureRecognizer _updateScaleAndVelocityIfNeeded:](self, "_updateScaleAndVelocityIfNeeded:", -[_MKZoomingPanGestureRecognizer state](self, "state"));
}

- (void)_updateScaleAndVelocityIfNeeded:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double Current;
  double v9;

  if (a3 == 2)
  {
    -[_MKZoomingPanGestureRecognizer view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomingPanGestureRecognizer translationInView:](self, "translationInView:", v4);
    v6 = v5;

    if (self->_didStartUpdate)
    {
      v7 = (1.0 - (v6 - self->_translation) / self->_zoomDraggingResistance) * self->_scale;
      Current = CFAbsoluteTimeGetCurrent();
      v9 = Current - self->_lastUpdateTimestamp;
      self->_previousVelocity = self->_velocity;
      self->_lastUpdateTimestamp = Current;
      self->_velocity = (v7 - self->_scale) / v9;
      self->_translation = v6;
      self->_scale = v7;
    }
    else
    {
      self->_didStartUpdate = 1;
      self->_lastUpdateTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }
}

- (double)zoomDraggingResistance
{
  return self->_zoomDraggingResistance;
}

@end
