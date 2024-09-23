@implementation CMBikeSensorData

+ (BOOL)isAvailable
{
  if ((sub_18F1F7758() & 1) == 0)
    sub_18F1F77DC();
  return 0;
}

- (CMBikeSensorData)initWithTimestamp:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CMBikeSensorData *v11;
  double v12;
  void *v15;
  const char *v16;
  objc_super v17;

  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3, v4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMBikeSensorData.mm"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timestamp"));
  }
  v17.receiver = self;
  v17.super_class = (Class)CMBikeSensorData;
  v11 = -[CMBikeSensorData init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(a3, v7, v8, v9, v10);
    v11->fTimestamp = v12;
    *(int64x2_t *)&v11->_instantaneousCadence = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v11->_instantaneousSpeed = 1.79769313e308;
    v11->_model = (NSString *)&stru_1E295ADC8;
    v11->_manufacturer = (NSString *)&stru_1E295ADC8;
    v11->_deviceIdentifier = (NSString *)&stru_1E295ADC8;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMBikeSensorData;
  -[CMBikeSensorData dealloc](&v2, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMBikeSensorData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMBikeSensorData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
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
  v31.super_class = (Class)CMBikeSensorData;
  v7 = -[CMBikeSensorData init](&v31, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("kCMBikeSensorDataKeyTimestamp"), v5, v6);
    v7->fTimestamp = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("kCMBikeSensorDataKeyInstantaneousSpeed"), v10, v11);
    v7->_instantaneousSpeed = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, (uint64_t)CFSTR("kCMBikeSensorDataKeyInstantaneousCadence"), v14, v15);
    v7->_instantaneousCadence = v16;
    objc_msgSend_decodeDoubleForKey_(a3, v17, (uint64_t)CFSTR("kCMBikeSensorDataKeyInstantaneousPower"), v18, v19);
    v7->_instantaneousPower = v20;
    v7->_model = (NSString *)objc_msgSend_decodeObjectForKey_(a3, v21, (uint64_t)CFSTR("kCMBikeSensorDataKeyModel"), v22, v23);
    v7->_deviceIdentifier = (NSString *)objc_msgSend_decodeObjectForKey_(a3, v24, (uint64_t)CFSTR("kCMBikeSensorDataKeyDeviceIdentifier"), v25, v26);
    v7->_manufacturer = (NSString *)objc_msgSend_decodeObjectForKey_(a3, v27, (uint64_t)CFSTR("kCMBikeSensorDataKeyManufacturer"), v28, v29);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v14 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v10, v11, v12, v13, self->fTimestamp);
  v18 = (void *)objc_msgSend_initWithTimestamp_(v9, v15, v14, v16, v17);
  objc_msgSend_setInstantaneousSpeed_(v18, v19, v20, v21, v22, self->_instantaneousSpeed);
  objc_msgSend_setInstantaneousCadence_(v18, v23, v24, v25, v26, self->_instantaneousCadence);
  objc_msgSend_setInstantaneousPower_(v18, v27, v28, v29, v30, self->_instantaneousPower);
  objc_msgSend_setModel_(v18, v31, (uint64_t)self->_model, v32, v33);
  objc_msgSend_setDeviceIdentifier_(v18, v34, (uint64_t)self->_deviceIdentifier, v35, v36);
  objc_msgSend_setManufacturer_(v18, v37, (uint64_t)self->_manufacturer, v38, v39);
  return v18;
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
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMBikeSensorDataKeyTimestamp"), v3, v4, self->fTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("kCMBikeSensorDataKeyInstantaneousSpeed"), v8, v9, self->_instantaneousSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCMBikeSensorDataKeyInstantaneousCadence"), v11, v12, self->_instantaneousCadence);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCMBikeSensorDataKeyInstantaneousPower"), v14, v15, self->_instantaneousPower);
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_model, (uint64_t)CFSTR("kCMBikeSensorDataKeyModel"), v17);
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->_deviceIdentifier, (uint64_t)CFSTR("kCMBikeSensorDataKeyDeviceIdentifier"), v19);
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_manufacturer, (uint64_t)CFSTR("kCMBikeSensorDataKeyManufacturer"), v21);
}

- (NSDate)timestamp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->fTimestamp);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  double instantaneousCadence;
  double instantaneousPower;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v27 = *(_OWORD *)&self->fTimestamp;
  instantaneousCadence = self->_instantaneousCadence;
  instantaneousPower = self->_instantaneousPower;
  v12 = objc_msgSend_UTF8String(self->_model, v8, v9, v10, v11);
  v17 = objc_msgSend_UTF8String(self->_deviceIdentifier, v13, v14, v15, v16);
  v22 = objc_msgSend_UTF8String(self->_manufacturer, v18, v19, v20, v21);
  return (id)objc_msgSend_stringWithFormat_(v3, v23, (uint64_t)CFSTR("%@, <timestamp, %f, instantaneousSpeed, %f, instantaneousCadence, %f, instantaneousPower, %f, model, %s, device identifier, %s, manufacturer, %s>"), v24, v25, v5, v27, *(_QWORD *)&instantaneousCadence, *(_QWORD *)&instantaneousPower, v12, v17, v22);
}

- (id)newFitnessMachineDataFromBikeSensorData
{
  void *v3;
  CFAbsoluteTime Current;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  double fTimestamp;
  CMFitnessMachineData *v18;
  const char *v19;
  char *v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  Current = CFAbsoluteTimeGetCurrent();
  v9 = (void *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v3, v5, v6, v7, v8, Current);
  objc_msgSend_timeIntervalSinceReferenceDate(v9, v10, v11, v12, v13);
  v15 = v14;
  if (v14 - self->fTimestamp > 5.0)
  {
    if (qword_1EE16D928 != -1)
      dispatch_once(&qword_1EE16D928, &unk_1E2954588);
    v16 = qword_1EE16D930;
    if (os_log_type_enabled((os_log_t)qword_1EE16D930, OS_LOG_TYPE_ERROR))
    {
      fTimestamp = self->fTimestamp;
      *(_DWORD *)buf = 134218240;
      v23 = fTimestamp;
      v24 = 2048;
      v25 = v15;
      _os_log_impl(&dword_18F1DC000, v16, OS_LOG_TYPE_ERROR, "Received bike power data from HK which has delay more than expected. data time, %f, now, %f", buf, 0x16u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D928 != -1)
        dispatch_once(&qword_1EE16D928, &unk_1E2954588);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMBikeSensorData newFitnessMachineDataFromBikeSensorData]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
  }
  v18 = [CMFitnessMachineData alloc];
  return (id)objc_msgSend_initWithExernalBikeSensorData_speed_cadence_power_model_deviceIdentifier_manufacturer_externalFitnessType_(v18, v19, (uint64_t)self->_model, (uint64_t)self->_deviceIdentifier, (uint64_t)self->_manufacturer, 1, self->fTimestamp, self->_instantaneousSpeed, self->_instantaneousCadence, self->_instantaneousPower);
}

- (double)instantaneousSpeed
{
  return self->_instantaneousSpeed;
}

- (void)setInstantaneousSpeed:(double)a3
{
  self->_instantaneousSpeed = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)instantaneousCadence
{
  return self->_instantaneousCadence;
}

- (void)setInstantaneousCadence:(double)a3
{
  self->_instantaneousCadence = a3;
}

- (double)instantaneousPower
{
  return self->_instantaneousPower;
}

- (void)setInstantaneousPower:(double)a3
{
  self->_instantaneousPower = a3;
}

@end
