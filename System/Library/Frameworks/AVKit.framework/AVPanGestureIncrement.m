@implementation AVPanGestureIncrement

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("translation: (%f, %f)  velocity: (%f, %f)  hasMultipleTouches: %d  horizontalSkew: %f"), *(_QWORD *)&self->_translation.x, *(_QWORD *)&self->_translation.y, *(_QWORD *)&self->_velocity.x, *(_QWORD *)&self->_velocity.y, self->_hasMultipleTouches, self->_velocity.x / self->_velocity.y);
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)velocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_velocity.x;
  y = self->_velocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)hasMultipleTouches
{
  return self->_hasMultipleTouches;
}

+ (AVPanGestureIncrement)gestureIncrementWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 timestamp:(double)a5 hasMultipleTouches:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  AVPanGestureIncrement *v12;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v12 = objc_alloc_init(AVPanGestureIncrement);
  v12->_translation.y = v10;
  v12->_velocity.x = x;
  v12->_velocity.y = y;
  v12->_hasMultipleTouches = a6;
  v12->_timestamp = a5;
  v12->_translation.x = v11;
  return v12;
}

@end
