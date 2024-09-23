@implementation PKInkSmoothingDescriptor

- (PKInkSmoothingDescriptor)initWithStylusSmoothing:(double)a3 touch:(double)a4 velocity:(double)a5 angle:(double)a6 radius:(double)a7
{
  PKInkSmoothingDescriptor *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKInkSmoothingDescriptor;
  result = -[PKInkSmoothingDescriptor init](&v13, sel_init);
  if (result)
  {
    result->_stylusSmoothing = a3;
    result->_touchSmoothing = a4;
    result->_velocitySmoothing = a5;
    result->_angleSmoothing = a6;
    result->_radiusSmoothing = a7;
  }
  return result;
}

- (id)mutableCopy
{
  return -[PKInkSmoothingDescriptor initWithStylusSmoothing:touch:velocity:angle:radius:]([PKInkSmoothingDescriptor alloc], "initWithStylusSmoothing:touch:velocity:angle:radius:", self->_stylusSmoothing, self->_touchSmoothing, self->_velocitySmoothing, self->_angleSmoothing, self->_radiusSmoothing);
}

- (double)stylusSmoothing
{
  return self->_stylusSmoothing;
}

- (double)touchSmoothing
{
  return self->_touchSmoothing;
}

- (double)velocitySmoothing
{
  return self->_velocitySmoothing;
}

- (double)angleSmoothing
{
  return self->_angleSmoothing;
}

- (double)radiusSmoothing
{
  return self->_radiusSmoothing;
}

@end
