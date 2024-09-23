@implementation CMHeartRateData

- (CMHeartRateData)initWithHeartRate:(double)a3 confidence:(double)a4 timestamp:(double)a5 startDate:(id)a6 error:(BOOL)a7 dataSource:(int64_t)a8 mode:(int64_t)a9
{
  CMHeartRateData *v15;
  CMHeartRateData *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CMHeartRateData;
  v15 = -[CMLogItem initWithTimestamp:](&v18, sel_initWithTimestamp_, a5);
  v16 = v15;
  if (v15)
  {
    v15->_heartRate = a3;
    v15->_confidence = a4;
    v15->_startDate = (NSDate *)a6;
    v16->_error = a7;
    v16->_dataSource = a8;
    v16->_mode = a9;
    v16->_frequency = -1.0;
  }
  return v16;
}

- (CMHeartRateData)initWithHighFrequencyHeartRate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMHeartRateData *v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  objc_msgSend_timestamp(a3, a2, (uint64_t)a3, v3, v4);
  v18.receiver = self;
  v18.super_class = (Class)CMHeartRateData;
  v11 = -[CMLogItem initWithTimestamp:](&v18, sel_initWithTimestamp_);
  if (v11)
  {
    objc_msgSend_heartRate(a3, v7, v8, v9, v10);
    v11->_heartRate = v12;
    v11->_confidence = 1.0;
    v11->_startDate = (NSDate *)(id)objc_msgSend_date(a3, v13, v14, v15, v16);
    v11->_error = 0;
    v11->_dataSource = 3;
    v11->_mode = 1;
    v11->_frequency = 1.0;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMHeartRateData;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMHeartRateData;
  v4 = -[CMLogItem copyWithZone:](&v11, sel_copyWithZone_, a3);
  v9 = v4;
  if (v4)
  {
    v4[3] = *(_QWORD *)&self->_heartRate;
    v4[4] = *(_QWORD *)&self->_confidence;
    v4[5] = objc_msgSend_copy(self->_startDate, v5, v6, v7, v8);
    v9[16] = self->_error;
    *((_QWORD *)v9 + 6) = self->_dataSource;
    *((_QWORD *)v9 + 7) = self->_mode;
    *((_QWORD *)v9 + 8) = *(_QWORD *)&self->_frequency;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMHeartRateData)initWithCoder:(id)a3
{
  CMHeartRateData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)CMHeartRateData;
  v4 = -[CMLogItem initWithCoder:](&v50, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v8 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyHeartRate"), v7);
    objc_msgSend_doubleValue(v8, v9, v10, v11, v12);
    v4->_heartRate = v13;
    v14 = objc_opt_class();
    v17 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyConfidence"), v16);
    objc_msgSend_doubleValue(v17, v18, v19, v20, v21);
    v4->_confidence = v22;
    v23 = objc_opt_class();
    v4->_startDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyStartDate"), v25);
    v26 = objc_opt_class();
    v29 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyError"), v28);
    v4->_error = objc_msgSend_BOOLValue(v29, v30, v31, v32, v33);
    v4->_dataSource = objc_msgSend_decodeIntegerForKey_(a3, v34, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyDataSource"), v35, v36);
    v4->_mode = objc_msgSend_decodeIntegerForKey_(a3, v37, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyMode"), v38, v39);
    v40 = objc_opt_class();
    v43 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v41, v40, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyFrequency"), v42);
    objc_msgSend_doubleValue(v43, v44, v45, v46, v47);
    v4->_frequency = v48;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CMHeartRateData;
  -[CMLogItem encodeWithCoder:](&v38, sel_encodeWithCoder_);
  v9 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v5, v6, v7, v8, self->_heartRate);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyHeartRate"), v11);
  v16 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v12, v13, v14, v15, self->_confidence);
  objc_msgSend_encodeObject_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyConfidence"), v18);
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->_startDate, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyStartDate"), v20);
  v24 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v21, self->_error, v22, v23);
  objc_msgSend_encodeObject_forKey_(a3, v25, v24, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyError"), v26);
  objc_msgSend_encodeInteger_forKey_(a3, v27, self->_dataSource, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyDataSource"), v28);
  objc_msgSend_encodeInteger_forKey_(a3, v29, self->_mode, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyMode"), v30);
  v35 = objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v31, v32, v33, v34, self->_frequency);
  objc_msgSend_encodeObject_forKey_(a3, v36, v35, (uint64_t)CFSTR("kCMHeartRateDataCodingKeyFrequency"), v37);
}

+ (id)dataSourceName:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E2958DA0[a3];
}

+ (id)modeName:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_1E2958DC8[a3];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  double heartRate;
  double confidence;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSDate *startDate;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  heartRate = self->_heartRate;
  confidence = self->_confidence;
  v24.receiver = self;
  v24.super_class = (Class)CMHeartRateData;
  -[CMLogItem timestamp](&v24, sel_timestamp);
  v12 = v11;
  startDate = self->_startDate;
  if (self->_error)
    v14 = "true";
  else
    v14 = "false";
  v15 = objc_msgSend_dataSourceName_(CMHeartRateData, v8, self->_dataSource, v9, v10);
  v19 = objc_msgSend_modeName_(CMHeartRateData, v16, self->_mode, v17, v18);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("%@,<heartRate %f, confidence %f, @ %f, startDate %@, error %s, dataSource %@, mode %@, frequency %f>"), v21, v22, v5, *(_QWORD *)&heartRate, *(_QWORD *)&confidence, v12, startDate, v14, v15, v19, *(_QWORD *)&self->_frequency);
}

- (double)heartRate
{
  return self->_heartRate;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)error
{
  return self->_error;
}

- (int64_t)dataSource
{
  return self->_dataSource;
}

- (int64_t)mode
{
  return self->_mode;
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (id)binarySampleRepresentation
{
  void *v3;
  const char *v4;
  id v5;

  v3 = (void *)MEMORY[0x194001B4C](self, a2);
  v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, 0);
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (CMHeartRateData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  CMHeartRateData *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
  {
    v15.receiver = self;
    v15.super_class = (Class)CMHeartRateData;
    v8 = -[CMHeartRateData init](&v15, sel_init);
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3710];
      v10 = objc_opt_class();
      v12 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v9, v11, v10, (uint64_t)a3, 0);
      if (v12)
      {
        v13 = (void *)v12;

        return (CMHeartRateData *)v13;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

@end
