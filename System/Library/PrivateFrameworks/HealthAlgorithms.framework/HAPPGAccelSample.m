@implementation HAPPGAccelSample

- (HAPPGAccelSample)initWithSamplingFrequency:(unsigned __int16)a3 timestamp:(int64_t)a4 x:(float)a5 y:(float)a6 z:(float)a7
{
  HAPPGAccelSample *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HAPPGAccelSample;
  result = -[HAPPGAccelSample init](&v13, sel_init);
  result->_samplingFrequency = a3;
  result->_timestamp = a4;
  result->_x = a5;
  result->_y = a6;
  result->_z = a7;
  return result;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)samplingFrequency
{
  return self->_samplingFrequency;
}

- (float)x
{
  return self->_x;
}

- (float)y
{
  return self->_y;
}

- (float)z
{
  return self->_z;
}

@end
