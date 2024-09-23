@implementation AVConcreteMutableValueTiming

- (AVConcreteMutableValueTiming)initWithAnchorValue:(double)a3 anchorTimeStamp:(double)a4 rate:(double)a5
{
  self->_value = a3;
  self->_timeStamp = a4;
  self->_rate = a5;
  return self;
}

- (double)anchorValue
{
  return self->_value;
}

- (double)anchorTimeStamp
{
  return self->_timeStamp;
}

- (double)rate
{
  return self->_rate;
}

- (void)setAnchorValue:(double)a3
{
  self->_value = a3;
}

- (void)setAnchorTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_timing
{
  double value;
  double rate;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  value = self->_value;
  rate = self->_rate;
  v4 = 0.0;
  if (rate != 0.0)
  {
    value = self->_timeStamp - value / rate;
    v4 = self->_rate;
  }
  result.var1 = v4;
  result.var0 = value;
  return result;
}

@end
