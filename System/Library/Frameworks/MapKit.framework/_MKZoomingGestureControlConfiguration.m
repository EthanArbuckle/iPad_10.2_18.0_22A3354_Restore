@implementation _MKZoomingGestureControlConfiguration

- (double)zoomDraggingResistance
{
  return self->_zoomDraggingResistance;
}

- (_MKZoomingGestureControlConfiguration)initWithDecelerationThreshold:(double)a3 maximumZoomInVelocity:(double)a4 maximumZoomOutVelocity:(double)a5 zoomOutFrictionScale:(double)a6 zoomDraggingResistance:(double)a7
{
  _MKZoomingGestureControlConfiguration *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MKZoomingGestureControlConfiguration;
  result = -[_MKZoomingGestureControlConfiguration init](&v13, sel_init);
  if (result)
  {
    result->_decelerationThreshold = a3;
    result->_maximumZoomInVelocity = a4;
    result->_maximumZoomOutVelocity = a5;
    result->_zoomOutFrictionScale = a6;
    result->_zoomDraggingResistance = a7;
  }
  return result;
}

- (_MKZoomingGestureControlConfiguration)initWithDecelerationThreshold:(double)a3 maximumZoomInVelocity:(double)a4 maximumZoomOutVelocity:(double)a5 zoomOutFrictionScale:(double)a6
{
  return -[_MKZoomingGestureControlConfiguration initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:zoomDraggingResistance:](self, "initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:zoomDraggingResistance:", a3, a4, a5, a6, 0.0);
}

+ (id)defaultConfiguration
{
  return -[_MKZoomingGestureControlConfiguration initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:zoomDraggingResistance:]([_MKZoomingGestureControlConfiguration alloc], "initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:zoomDraggingResistance:", 1.5, 10.0, -1.5, 2.5, 200.0);
}

+ (id)configurationForCarPlay
{
  return -[_MKZoomingGestureControlConfiguration initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:zoomDraggingResistance:]([_MKZoomingGestureControlConfiguration alloc], "initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:zoomDraggingResistance:", 1.5, 10.0, -1.5, 2.5, 200.0);
}

+ (id)configurationForDigitalCrown
{
  return -[_MKZoomingGestureControlConfiguration initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:]([_MKZoomingGestureControlConfiguration alloc], "initWithDecelerationThreshold:maximumZoomInVelocity:maximumZoomOutVelocity:zoomOutFrictionScale:", 100.0, 1.0, -1.0, 4.5);
}

- (double)decelerationThreshold
{
  return self->_decelerationThreshold;
}

- (double)maximumZoomInVelocity
{
  return self->_maximumZoomInVelocity;
}

- (double)maximumZoomOutVelocity
{
  return self->_maximumZoomOutVelocity;
}

- (double)zoomOutFrictionScale
{
  return self->_zoomOutFrictionScale;
}

@end
