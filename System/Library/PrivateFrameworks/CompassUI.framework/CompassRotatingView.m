@implementation CompassRotatingView

- (double)compassHeading
{
  return self->_compassHeading;
}

- (void)setCompassHeading:(double)a3
{
  self->_angle = a3 * -3.14159265 / 180.0;
  self->_compassHeading = -a3;
}

- (double)angle
{
  return self->_angle;
}

@end
