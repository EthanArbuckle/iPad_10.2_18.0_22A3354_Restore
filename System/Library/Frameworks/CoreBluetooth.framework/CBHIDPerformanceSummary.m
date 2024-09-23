@implementation CBHIDPerformanceSummary

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)errorRate
{
  return self->_errorRate;
}

- (void)setErrorRate:(double)a3
{
  self->_errorRate = a3;
}

- (double)intervalSecondsExpected
{
  return self->_intervalSecondsExpected;
}

- (void)setIntervalSecondsExpected:(double)a3
{
  self->_intervalSecondsExpected = a3;
}

- (double)intervalSecondsMax
{
  return self->_intervalSecondsMax;
}

- (void)setIntervalSecondsMax:(double)a3
{
  self->_intervalSecondsMax = a3;
}

- (char)rssi
{
  return self->_rssi;
}

- (void)setRssi:(char)a3
{
  self->_rssi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
