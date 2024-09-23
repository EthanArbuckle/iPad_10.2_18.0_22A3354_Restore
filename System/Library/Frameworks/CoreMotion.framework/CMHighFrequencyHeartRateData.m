@implementation CMHighFrequencyHeartRateData

- (CMHighFrequencyHeartRateData)initWithHeartRateData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CMHighFrequencyHeartRateData *v17;
  CMHeartRateData *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  CMHeartRateData *started;
  objc_super v27;
  objc_super v28;

  objc_msgSend_frequency(a3, a2, (uint64_t)a3, v3, v4);
  if (v11 >= 1.0 && (objc_msgSend_confidence(a3, v7, v8, v9, v10), v16 >= 0.4))
  {
    objc_msgSend_timestamp(a3, v12, v13, v14, v15);
    v27.receiver = self;
    v27.super_class = (Class)CMHighFrequencyHeartRateData;
    v17 = -[CMLogItem initWithTimestamp:](&v27, sel_initWithTimestamp_);
    if (v17)
    {
      started = (CMHeartRateData *)a3;
      goto LABEL_7;
    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CMHighFrequencyHeartRateData;
    v17 = -[CMLogItem initWithTimestamp:](&v28, sel_initWithTimestamp_, 0.0);
    if (v17)
    {
      v18 = [CMHeartRateData alloc];
      v23 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v19, v20, v21, v22, 0.0);
      started = (CMHeartRateData *)objc_msgSend_initWithHeartRate_confidence_timestamp_startDate_error_dataSource_mode_(v18, v24, v23, 0, 3, 1, 0.0, 0.0, 0.0);
LABEL_7:
      v17->_heartRateData = started;
    }
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  self->_heartRateData = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMHighFrequencyHeartRateData;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMHighFrequencyHeartRateData;
  v8 = -[CMLogItem copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (v8)
    v8[2] = objc_msgSend_copy(self->_heartRateData, v4, v5, v6, v7);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMHighFrequencyHeartRateData)initWithCoder:(id)a3
{
  CMHighFrequencyHeartRateData *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMHighFrequencyHeartRateData;
  v4 = -[CMLogItem initWithCoder:](&v9, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_heartRateData = (CMHeartRateData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMHighFrequencyHeartRateDataCodingKeyData"), v7);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMHighFrequencyHeartRateData;
  -[CMLogItem encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_heartRateData, (uint64_t)CFSTR("kCMHighFrequencyHeartRateDataCodingKeyData"), v6);
}

- (double)heartRate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;

  objc_msgSend_heartRate(self->_heartRateData, a2, v2, v3, v4);
  return result;
}

- (CMHighFrequencyHeartRateDataConfidence)confidence
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;

  objc_msgSend_confidence(self->_heartRateData, a2, v2, v3, v4);
  if (v10 < 0.6)
    return 0;
  objc_msgSend_confidence(self->_heartRateData, v6, v7, v8, v9);
  if (v16 < 0.8)
    return 1;
  objc_msgSend_confidence(self->_heartRateData, v12, v13, v14, v15);
  if (v17 >= 1.0)
    return 3;
  else
    return 2;
}

- (NSDate)date
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_startDate(self->_heartRateData, a2, v2, v3, v4);
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

- (CMHighFrequencyHeartRateData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v5;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  CMHighFrequencyHeartRateData *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v27;

  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4, v5, a5))
    goto LABEL_7;
  v27.receiver = self;
  v27.super_class = (Class)CMHighFrequencyHeartRateData;
  self = -[CMHighFrequencyHeartRateData init](&v27, sel_init);
  if (!self)
    return self;
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v15 = (id)objc_msgSend_initWithObjects_(v9, v12, v10, v13, v14, v11, 0);
  v17 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v8, v16, (uint64_t)v15, (uint64_t)a3, 0);
  if (!v17)
  {
LABEL_7:

    return 0;
  }
  v18 = (void *)v17;
  v19 = objc_opt_class();
  if (v19 == objc_opt_class())
  {

    return (CMHighFrequencyHeartRateData *)v18;
  }
  v20 = objc_opt_class();
  if (v20 == objc_opt_class())
  {

    v21 = [CMHighFrequencyHeartRateData alloc];
    return (CMHighFrequencyHeartRateData *)objc_msgSend_initWithHeartRateData_(v21, v22, (uint64_t)v18, v23, v24);
  }
  return self;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  _QWORD v36[3];
  _QWORD v37[4];

  v37[3] = *MEMORY[0x1E0C80C00];
  v36[0] = CFSTR("heartRate");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_heartRate(self, a2, v2, v3, v4);
  v37[0] = objc_msgSend_numberWithDouble_(v6, v7, v8, v9, v10);
  v36[1] = CFSTR("confidence");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_confidence(self, v12, v13, v14, v15);
  v37[1] = objc_msgSend_numberWithInteger_(v11, v17, v16, v18, v19);
  v36[2] = CFSTR("startTime");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  v25 = (void *)objc_msgSend_date(self, v21, v22, v23, v24);
  objc_msgSend_timeIntervalSinceReferenceDate(v25, v26, v27, v28, v29);
  v37[2] = objc_msgSend_numberWithDouble_(v20, v30, v31, v32, v33);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v34, (uint64_t)v37, (uint64_t)v36, 3);
}

@end
