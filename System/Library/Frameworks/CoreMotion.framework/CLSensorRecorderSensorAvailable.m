@implementation CLSensorRecorderSensorAvailable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorAvailable)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLSensorRecorderSensorAvailable *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSensorRecorderSensorAvailable;
  v7 = -[CLSensorRecorderSensorAvailable init](&v9, sel_init);
  if (v7)
    v7->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v4, (uint64_t)CFSTR("dataType"), v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;

  objc_msgSend_encodeInt32_forKey_(a3, a2, self->_dataType, (uint64_t)CFSTR("dataType"), v3);
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
