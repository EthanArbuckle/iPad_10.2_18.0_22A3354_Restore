@implementation NIBluetoothHostTimeSyncResponse

- (NIBluetoothHostTimeSyncResponse)initWithDeviceEventCount:(unint64_t)a3 uwbDeviceTimeUs:(unint64_t)a4 uwbDeviceTimeUncertainty:(unsigned __int8)a5 uwbClockSkewMeasurementAvailable:(unsigned __int8)a6 deviceMaxPpm:(unsigned __int16)a7 success:(unsigned __int8)a8 retryDelay:(unsigned __int16)a9
{
  NIBluetoothHostTimeSyncResponse *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)NIBluetoothHostTimeSyncResponse;
  result = -[NIBluetoothHostTimeSyncResponse init](&v16, sel_init);
  if (result)
  {
    result->_deviceEventCount = a3;
    result->_uwbDeviceTimeUs = a4;
    result->_uwbDeviceTimeUncertainty = a5;
    result->_uwbClockSkewMeasurementAvailable = a6;
    result->_deviceMaxPpm = a7;
    result->_success = a8;
    result->_retryDelay = a9;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("deviceEventCount:%llu\n"), self->_deviceEventCount);
  objc_msgSend(v6, "appendFormat:", CFSTR("uwbDeviceTimeUs:%llu\n"), self->_uwbDeviceTimeUs);
  objc_msgSend(v6, "appendFormat:", CFSTR("uwbDeviceTimeUncertainty:%u\n"), self->_uwbDeviceTimeUncertainty);
  objc_msgSend(v6, "appendFormat:", CFSTR("uwbClockSkewMeasurementAvailable:%u\n"), self->_uwbClockSkewMeasurementAvailable);
  objc_msgSend(v6, "appendFormat:", CFSTR("deviceMaxPpm:%u\n"), self->_deviceMaxPpm);
  objc_msgSend(v6, "appendFormat:", CFSTR("success:%u\n"), self->_success);
  objc_msgSend(v6, "appendFormat:", CFSTR("retryDelay:%u>"), self->_retryDelay);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOWORD(v6) = self->_retryDelay;
  return (id)objc_msgSend(v4, "initWithDeviceEventCount:uwbDeviceTimeUs:uwbDeviceTimeUncertainty:uwbClockSkewMeasurementAvailable:deviceMaxPpm:success:retryDelay:", self->_deviceEventCount, self->_uwbDeviceTimeUs, self->_uwbDeviceTimeUncertainty, self->_uwbClockSkewMeasurementAvailable, self->_deviceMaxPpm, self->_success, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_deviceEventCount, CFSTR("deviceEventCount"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_uwbDeviceTimeUs, CFSTR("uwbDeviceTimeUs"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_uwbDeviceTimeUncertainty, CFSTR("uwbDeviceTimeUncertainty"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_uwbClockSkewMeasurementAvailable, CFSTR("uwbClockSkewMeasurementAvailable"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_deviceMaxPpm, CFSTR("deviceMaxPpm"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_success, CFSTR("success"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_retryDelay, CFSTR("retryDelay"));

}

- (NIBluetoothHostTimeSyncResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_deviceEventCount = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceEventCount"));
    self->_uwbDeviceTimeUs = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("uwbDeviceTimeUs"));
    self->_uwbDeviceTimeUncertainty = objc_msgSend(v5, "decodeIntForKey:", CFSTR("uwbDeviceTimeUncertainty"));
    self->_uwbClockSkewMeasurementAvailable = objc_msgSend(v5, "decodeIntForKey:", CFSTR("uwbClockSkewMeasurementAvailable"));
    self->_deviceMaxPpm = objc_msgSend(v5, "decodeIntForKey:", CFSTR("deviceMaxPpm"));
    self->_success = objc_msgSend(v5, "decodeIntForKey:", CFSTR("success"));
    self->_retryDelay = objc_msgSend(v5, "decodeIntForKey:", CFSTR("retryDelay"));
  }

  return self;
}

- (unint64_t)deviceEventCount
{
  return self->_deviceEventCount;
}

- (unint64_t)uwbDeviceTimeUs
{
  return self->_uwbDeviceTimeUs;
}

- (unsigned)uwbDeviceTimeUncertainty
{
  return self->_uwbDeviceTimeUncertainty;
}

- (unsigned)uwbClockSkewMeasurementAvailable
{
  return self->_uwbClockSkewMeasurementAvailable;
}

- (unsigned)deviceMaxPpm
{
  return self->_deviceMaxPpm;
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)retryDelay
{
  return self->_retryDelay;
}

@end
