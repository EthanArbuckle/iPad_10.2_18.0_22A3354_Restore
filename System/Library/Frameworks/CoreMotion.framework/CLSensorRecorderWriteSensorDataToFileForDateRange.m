@implementation CLSensorRecorderWriteSensorDataToFileForDateRange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderWriteSensorDataToFileForDateRange)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLSensorRecorderWriteSensorDataToFileForDateRange *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSensorRecorderWriteSensorDataToFileForDateRange;
  v7 = -[CLSensorRecorderWriteSensorDataToFileForDateRange init](&v17, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("startTime"), v5, v6);
    v7->_startTime = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("endTime"), v10, v11);
    v7->_endTime = v12;
    v7->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v13, (uint64_t)CFSTR("dataType"), v14, v15);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("startTime"), v3, v4, self->_startTime);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("endTime"), v8, v9, self->_endTime);
  objc_msgSend_encodeInt32_forKey_(a3, v10, self->_dataType, (uint64_t)CFSTR("dataType"), v11);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_dataType = a3;
}

@end
