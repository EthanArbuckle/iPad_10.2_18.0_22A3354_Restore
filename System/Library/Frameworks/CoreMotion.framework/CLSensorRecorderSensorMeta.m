@implementation CLSensorRecorderSensorMeta

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorMeta)initWithDataType:(int)a3
{
  CLSensorRecorderSensorMeta *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSensorRecorderSensorMeta;
  result = -[CLSensorRecorderSensorMeta init](&v5, sel_init);
  if (result)
    result->_dataType = a3;
  return result;
}

- (CLSensorRecorderSensorMeta)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CLSensorRecorderSensorMeta *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CLSensorRecorderSensorMeta;
  v7 = -[CLSensorRecorderSensorMeta init](&v31, sel_init);
  if (v7)
  {
    v7->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, (uint64_t)CFSTR("identifier"), v5, v6);
    objc_msgSend_decodeDoubleForKey_(a3, v8, (uint64_t)CFSTR("startTime"), v9, v10);
    v7->_startTime = v11;
    v7->_timestamp = objc_msgSend_decodeInt64ForKey_(a3, v12, (uint64_t)CFSTR("timestamp"), v13, v14);
    v7->_dataIdentifier = objc_msgSend_decodeInt64ForKey_(a3, v15, (uint64_t)CFSTR("dataIdentifier"), v16, v17);
    v7->_offset = objc_msgSend_decodeInt32ForKey_(a3, v18, (uint64_t)CFSTR("offset"), v19, v20);
    v7->_dataSize = objc_msgSend_decodeInt32ForKey_(a3, v21, (uint64_t)CFSTR("dataSize"), v22, v23);
    v7->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v24, (uint64_t)CFSTR("dataType"), v25, v26);
    v7->_movement = objc_msgSend_decodeBoolForKey_(a3, v27, (uint64_t)CFSTR("movement"), v28, v29);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, (uint64_t)CFSTR("identifier"), v3);
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("startTime"), v7, v8, self->_startTime);
  objc_msgSend_encodeInt64_forKey_(a3, v9, self->_timestamp, (uint64_t)CFSTR("timestamp"), v10);
  objc_msgSend_encodeInt64_forKey_(a3, v11, self->_dataIdentifier, (uint64_t)CFSTR("dataIdentifier"), v12);
  objc_msgSend_encodeInt32_forKey_(a3, v13, self->_offset, (uint64_t)CFSTR("offset"), v14);
  objc_msgSend_encodeInt32_forKey_(a3, v15, self->_dataSize, (uint64_t)CFSTR("dataSize"), v16);
  objc_msgSend_encodeInt32_forKey_(a3, v17, self->_dataType, (uint64_t)CFSTR("dataType"), v18);
  objc_msgSend_encodeBool_forKey_(a3, v19, self->_movement, (uint64_t)CFSTR("movement"), v20);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("%@,<identifier, %llu, startTime, %f, timestamp, %llu, dataIdentifier, %llu, offset, %u, dataSize, %u, dataType, %d, movement, %d>"), v7, v8, v5, self->_identifier, *(_QWORD *)&self->_startTime, self->_timestamp, self->_dataIdentifier, self->_offset, self->_dataSize, self->_dataType, self->_movement);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)dataIdentifier
{
  return self->_dataIdentifier;
}

- (void)setDataIdentifier:(unint64_t)a3
{
  self->_dataIdentifier = a3;
}

- (unsigned)offset
{
  return self->_offset;
}

- (void)setOffset:(unsigned int)a3
{
  self->_offset = a3;
}

- (unsigned)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unsigned int)a3
{
  self->_dataSize = a3;
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_dataType = a3;
}

- (BOOL)movement
{
  return self->_movement;
}

- (void)setMovement:(BOOL)a3
{
  self->_movement = a3;
}

@end
