@implementation CLFindMyAccessoryAccelerometerOrientationModeConfiguration

- (CLFindMyAccessoryAccelerometerOrientationModeConfiguration)initWithThreshold:(unsigned int)a3 sleepDuration:(unsigned __int16)a4
{
  CLFindMyAccessoryAccelerometerOrientationModeConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLFindMyAccessoryAccelerometerOrientationModeConfiguration;
  result = -[CLFindMyAccessoryAccelerometerOrientationModeConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_threshold = a3;
    result->_sleepDuration_ms = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryAccelerometerOrientationModeConfiguration)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend_decodeIntForKey_(a3, a2, (uint64_t)CFSTR("threshold"), v3);
  v9 = (unsigned __int16)objc_msgSend_decodeIntForKey_(a3, v7, (uint64_t)CFSTR("sleepDuration"), v8);
  return (CLFindMyAccessoryAccelerometerOrientationModeConfiguration *)MEMORY[0x1E0DE7D20](self, sel_initWithThreshold_sleepDuration_, v6, v9);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_threshold, (uint64_t)CFSTR("threshold"));
  objc_msgSend_encodeInt_forKey_(a3, v5, self->_sleepDuration_ms, (uint64_t)CFSTR("sleepDuration"));
}

- (unsigned)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unsigned int)a3
{
  self->_threshold = a3;
}

- (unsigned)sleepDuration_ms
{
  return self->_sleepDuration_ms;
}

- (void)setSleepDuration_ms:(unsigned __int16)a3
{
  self->_sleepDuration_ms = a3;
}

@end
