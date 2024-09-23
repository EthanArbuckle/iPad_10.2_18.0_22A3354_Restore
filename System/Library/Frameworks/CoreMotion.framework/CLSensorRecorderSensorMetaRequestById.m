@implementation CLSensorRecorderSensorMetaRequestById

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorMetaRequestById)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLSensorRecorderSensorMetaRequestById *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSensorRecorderSensorMetaRequestById;
  v7 = -[CLSensorRecorderSensorMetaRequestById init](&v12, sel_init);
  if (v7)
  {
    v7->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, (uint64_t)CFSTR("identifier"), v5, v6);
    v7->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v8, (uint64_t)CFSTR("dataType"), v9, v10);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, (uint64_t)CFSTR("identifier"), v3);
  objc_msgSend_encodeInt32_forKey_(a3, v6, self->_dataType, (uint64_t)CFSTR("dataType"), v7);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
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
