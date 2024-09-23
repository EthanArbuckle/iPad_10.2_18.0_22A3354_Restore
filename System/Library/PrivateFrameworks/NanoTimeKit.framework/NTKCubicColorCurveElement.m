@implementation NTKCubicColorCurveElement

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (__n128)color
{
  return a1[1];
}

- (void)setColor:(NTKCubicColorCurveElement *)self
{
  __int128 v2;

  *(_OWORD *)self->_color = v2;
}

@end
