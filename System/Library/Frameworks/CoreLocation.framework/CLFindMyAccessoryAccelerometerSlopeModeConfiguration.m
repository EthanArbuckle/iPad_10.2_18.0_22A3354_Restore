@implementation CLFindMyAccessoryAccelerometerSlopeModeConfiguration

+ (unsigned)minimumSampleCount
{
  return 0;
}

+ (unsigned)maximumSampleCount
{
  return 3;
}

+ (float)minimumThreshold
{
  return 0.0;
}

+ (float)maximumThreshold
{
  return 7.97;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryAccelerometerSlopeModeConfiguration)initWithThreshold:(float)a3 sampleCount:(unsigned __int8)a4 sampleRate:(unsigned __int8)a5
{
  unsigned int v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  CLFindMyAccessoryAccelerometerSlopeModeConfiguration *result;
  objc_super v28;

  v6 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend_minimumThreshold(v9, v10, v11, v12);
  if (v13 > a3)
    return 0;
  v14 = (void *)objc_opt_class();
  objc_msgSend_maximumThreshold(v14, v15, v16, v17);
  if (v18 < a3)
    return 0;
  v19 = (void *)objc_opt_class();
  if (objc_msgSend_minimumSampleCount(v19, v20, v21, v22) > v6)
    return 0;
  v23 = (void *)objc_opt_class();
  if (objc_msgSend_maximumSampleCount(v23, v24, v25, v26) < v6)
    return 0;
  v28.receiver = self;
  v28.super_class = (Class)CLFindMyAccessoryAccelerometerSlopeModeConfiguration;
  result = -[CLFindMyAccessoryAccelerometerSlopeModeConfiguration init](&v28, sel_init);
  if (result)
  {
    result->_threshold = a3;
    result->_sampleCount = v6;
    result->_sampleRate = a5;
  }
  return result;
}

- (CLFindMyAccessoryAccelerometerSlopeModeConfiguration)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  CLFindMyAccessoryAccelerometerSlopeModeConfiguration *v6;
  const char *v7;
  uint64_t v8;
  float v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLFindMyAccessoryAccelerometerSlopeModeConfiguration;
  v6 = -[CLFindMyAccessoryAccelerometerSlopeModeConfiguration init](&v13, sel_init);
  if (v6)
  {
    v6->_sampleCount = objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("sampleCount"), v5);
    objc_msgSend_decodeFloatForKey_(a3, v7, (uint64_t)CFSTR("threshold"), v8);
    v6->_threshold = v9;
    v6->_sampleRate = objc_msgSend_decodeIntForKey_(a3, v10, (uint64_t)CFSTR("sampleRate"), v11);
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  const char *v8;

  objc_msgSend_encodeInt_forKey_(a3, a2, self->_sampleCount, (uint64_t)CFSTR("sampleCount"));
  *(float *)&v5 = self->_threshold;
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("threshold"), v7, v5);
  objc_msgSend_encodeInt_forKey_(a3, v8, self->_sampleRate, (uint64_t)CFSTR("sampleRate"));
}

- (float)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(float)a3
{
  self->_threshold = a3;
}

- (unsigned)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unsigned __int8)a3
{
  self->_sampleCount = a3;
}

- (unsigned)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(unsigned __int8)a3
{
  self->_sampleRate = a3;
}

@end
