@implementation KeyPitch

- (KeyPitch)initWithFrequency:(double)a3 volume:(double)a4 timeOffset:(double)a5
{
  KeyPitch *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KeyPitch;
  result = -[KeyPitch init](&v9, sel_init);
  if (result)
  {
    result->_timeOffsetMS = a5;
    result->_volume = a4;
    result->_frequency = a3;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[KeyPitch frequency](self, "frequency");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p frequency=%.2f timeOffsetMS=%.2f"), v4, self, v5, *(_QWORD *)&self->_timeOffsetMS);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)timeOffsetMS
{
  return self->_timeOffsetMS;
}

- (void)setTimeOffsetMS:(double)a3
{
  self->_timeOffsetMS = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

@end
