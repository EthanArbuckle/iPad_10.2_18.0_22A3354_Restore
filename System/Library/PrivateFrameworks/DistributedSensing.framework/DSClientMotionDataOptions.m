@implementation DSClientMotionDataOptions

- (DSClientMotionDataOptions)init
{
  DSClientMotionDataOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DSClientMotionDataOptions;
  result = -[DSClientMotionDataOptions init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_deviceType = 0;
  return result;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unsigned int)a3
{
  self->_deviceType = a3;
}

- (unsigned)dataSubType
{
  return self->_dataSubType;
}

- (void)setDataSubType:(unsigned int)a3
{
  self->_dataSubType = a3;
}

@end
