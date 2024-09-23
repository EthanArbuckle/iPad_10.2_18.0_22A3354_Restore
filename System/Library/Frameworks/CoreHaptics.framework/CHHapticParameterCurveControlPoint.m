@implementation CHHapticParameterCurveControlPoint

- (CHHapticParameterCurveControlPoint)init
{

  return 0;
}

- (CHHapticParameterCurveControlPoint)initWithRelativeTime:(NSTimeInterval)time value:(float)value
{
  CHHapticParameterCurveControlPoint *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHHapticParameterCurveControlPoint;
  result = -[CHHapticParameterCurveControlPoint init](&v7, sel_init);
  if (result)
  {
    result->_time = time;
    result->_value = value;
  }
  return result;
}

- (NSTimeInterval)relativeTime
{
  return self->_time;
}

- (void)setRelativeTime:(NSTimeInterval)relativeTime
{
  self->_time = relativeTime;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)value
{
  self->_value = value;
}

@end
