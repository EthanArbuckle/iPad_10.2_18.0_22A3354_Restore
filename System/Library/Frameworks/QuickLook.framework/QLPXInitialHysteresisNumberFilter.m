@implementation QLPXInitialHysteresisNumberFilter

- (double)updatedOutput
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[QLPXNumberFilter output](self, "output");
  v4 = v3;
  -[QLPXNumberFilter input](self, "input");
  v6 = v5;
  if (!self->_didReachThreshold)
  {
    -[QLPXInitialHysteresisNumberFilter hysteresis](self, "hysteresis");
    if (v6 - v4 >= v7 || (v7 = -v7, v6 - v4 <= v7))
    {
      self->_offset = v7;
      self->_didReachThreshold = 1;
    }
    else if (!self->_didReachThreshold)
    {
      return v4;
    }
  }
  return v6 - self->_offset;
}

- (double)outputDerivative
{
  double result;

  result = 1.0;
  if (!self->_didReachThreshold)
    return 0.0;
  return result;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

@end
