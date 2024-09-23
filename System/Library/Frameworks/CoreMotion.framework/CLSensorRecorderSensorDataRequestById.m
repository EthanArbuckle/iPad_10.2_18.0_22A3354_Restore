@implementation CLSensorRecorderSensorDataRequestById

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorDataRequestById)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLSensorRecorderSensorDataRequestById *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLSensorRecorderSensorDataRequestById;
  v7 = -[CLSensorRecorderSensorDataRequestById init](&v15, sel_init);
  if (v7)
  {
    v7->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, (uint64_t)CFSTR("identifier"), v5, v6);
    v7->_metaIdentifier = objc_msgSend_decodeInt64ForKey_(a3, v8, (uint64_t)CFSTR("metaIdentifier"), v9, v10);
    v7->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v11, (uint64_t)CFSTR("dataType"), v12, v13);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, (uint64_t)CFSTR("identifier"), v3);
  objc_msgSend_encodeInt64_forKey_(a3, v6, self->_metaIdentifier, (uint64_t)CFSTR("metaIdentifier"), v7);
  objc_msgSend_encodeInt32_forKey_(a3, v8, self->_dataType, (uint64_t)CFSTR("dataType"), v9);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)metaIdentifier
{
  return self->_metaIdentifier;
}

- (void)setMetaIdentifier:(unint64_t)a3
{
  self->_metaIdentifier = a3;
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
