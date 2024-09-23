@implementation CMAbsoluteAltitudeData

- (CMAbsoluteAltitudeData)initWithAltitude:(double)a3 accuracy:(double)a4 precision:(double)a5 status:(int64_t)a6 timestamp:(double)a7
{
  CMAbsoluteAltitudeData *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMAbsoluteAltitudeData;
  result = -[CMLogItem initWithTimestamp:](&v12, sel_initWithTimestamp_, a7);
  if (result)
  {
    result->_altitudePrivate = a3;
    result->_absoluteAltitudeAccuracy = a4;
    result->_absoluteAltitudePrecision = a5;
    result->_absoluteAltitudeStatusInfo = a6;
    result->_altitude = a3;
    result->_precision = a5;
    result->_accuracy = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMAbsoluteAltitudeData;
  -[CMLogItem dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAbsoluteAltitudeData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMAbsoluteAltitudeData *v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CMAbsoluteAltitudeData;
  v7 = -[CMLogItem initWithCoder:](&v28, sel_initWithCoder_);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyAltitude"), v5, v6);
    v9 = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyAccuracy"), v11, v12);
    v14 = v13;
    objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyPrecision"), v16, v17);
    v19 = v18;
    v23 = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyStatusInfo"), v21, v22);
    objc_msgSend_setAltitudeData_accuracy_precision_status_(v7, v24, v23, v25, v26, v9, v14, v19);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CMAbsoluteAltitudeData;
  -[CMLogItem encodeWithCoder:](&v25, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyAltitude"), v6, v7, self->_altitudePrivate);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyAccuracy"), v9, v10, self->_absoluteAltitudeAccuracy);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyPrecision"), v12, v13, self->_absoluteAltitudePrecision);
  objc_msgSend_encodeInteger_forKey_(a3, v14, self->_absoluteAltitudeStatusInfo, (uint64_t)CFSTR("kCMAbsoluteAltitudeCodingKeyStatusInfo"), v15);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("altitude"), v17, v18, self->_altitude);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("accuracy"), v20, v21, self->_accuracy);
  objc_msgSend_encodeDouble_forKey_(a3, v22, (uint64_t)CFSTR("precision"), v23, v24, self->_precision);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMAbsoluteAltitudeData;
  v4 = -[CMLogItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  v8 = v4;
  if (v4)
    objc_msgSend_setAltitudeData_accuracy_precision_status_(v4, v5, self->_absoluteAltitudeStatusInfo, v6, v7, self->_altitudePrivate, self->_absoluteAltitudeAccuracy, self->_absoluteAltitudePrecision);
  return v8;
}

- (id)description
{
  double altitudePrivate;
  void *v3;
  double absoluteAltitudeAccuracy;
  double absoluteAltitudePrecision;
  int64_t absoluteAltitudeStatusInfo;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  altitudePrivate = self->_altitudePrivate;
  v3 = (void *)MEMORY[0x1E0CB3940];
  absoluteAltitudeAccuracy = self->_absoluteAltitudeAccuracy;
  absoluteAltitudePrecision = self->_absoluteAltitudePrecision;
  absoluteAltitudeStatusInfo = self->_absoluteAltitudeStatusInfo;
  v12.receiver = self;
  v12.super_class = (Class)CMAbsoluteAltitudeData;
  -[CMLogItem timestamp](&v12, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("AbsoluteAltitude: %f, Accuracy: %f, Precision %f, statusInfo: %ld, timestamp :%f"), v8, v9, *(_QWORD *)&altitudePrivate, *(_QWORD *)&absoluteAltitudeAccuracy, *(_QWORD *)&absoluteAltitudePrecision, absoluteAltitudeStatusInfo, v10);
}

- (NSNumber)absoluteAltitude
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, self->_altitudePrivate);
}

- (void)setAltitudeData:(double)a3 accuracy:(double)a4 precision:(double)a5 status:(int64_t)a6
{
  self->_altitudePrivate = a3;
  self->_absoluteAltitudeAccuracy = a4;
  self->_absoluteAltitudePrecision = a5;
  self->_absoluteAltitudeStatusInfo = a6;
  self->_altitude = a3;
  self->_accuracy = a4;
  self->_precision = a5;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (double)precision
{
  return self->_precision;
}

- (double)absoluteAltitudeAccuracy
{
  return self->_absoluteAltitudeAccuracy;
}

- (double)absoluteAltitudePrecision
{
  return self->_absoluteAltitudePrecision;
}

- (int64_t)absoluteAltitudeStatusInfo
{
  return self->_absoluteAltitudeStatusInfo;
}

@end
