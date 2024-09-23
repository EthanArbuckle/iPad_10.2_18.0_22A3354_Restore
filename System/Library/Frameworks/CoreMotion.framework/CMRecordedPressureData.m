@implementation CMRecordedPressureData

- (double)startTime
{
  return self->_startDateValue;
}

- (CMRecordedPressureData)initWithData:(CMPressure *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  CMRecordedPressureData *v10;
  const char *v11;
  CMRecordedPressureData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CMRecordedPressureData;
  v10 = -[CMRecordedPressureData init](&v14, sel_init);
  v12 = v10;
  if (v10)
    objc_msgSend_resetWithData_timestamp_walltime_identifier_(v10, v11, (uint64_t)a3, a4, a6, a5);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedPressureData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMRecordedPressureData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CMRecordedPressureData;
  v7 = -[CMAmbientPressureData initWithCoder:](&v35, sel_initWithCoder_);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("startDate"), v5, v6);
    v7->_startDateValue = v8;
    objc_msgSend_timestamp(v7, v9, v10, v11, v12);
    v7->_timestampValue = v13;
    v18 = (void *)objc_msgSend_pressure(v7, v14, v15, v16, v17);
    objc_msgSend_doubleValue(v18, v19, v20, v21, v22);
    *(float *)&v23 = v23;
    v7->_pressureValue = *(float *)&v23;
    v28 = (void *)objc_msgSend_temperature(v7, v24, v25, v26, v27);
    objc_msgSend_doubleValue(v28, v29, v30, v31, v32);
    *(float *)&v33 = v33;
    v7->_temperatureValue = *(float *)&v33;
    v7->_pressureMeasurement = 0;
    v7->_temperatureMeasurement = 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CMRecordedPressureData;
  -[CMAmbientPressureData encodeWithCoder:](&v8, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("startDate"), v6, v7, self->_startDateValue);
}

- (void)resetWithData:(CMPressure *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  unint64_t v6;

  self->_pressureMeasurement = 0;
  self->_temperatureMeasurement = 0;
  self->_pressureValue = a3->var0;
  self->_temperatureValue = a3->var1;
  v6 = *(_QWORD *)(&a3->var2 + 1);
  self->_startDateValue = a5 - (double)(uint64_t)(a4 - v6) / 1000000.0;
  self->_timestampValue = (double)v6 / 1000000.0;
  self->_identifier = a6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_dealloc(self->_pressureMeasurement, a2, v2, v3, v4);
  objc_msgSend_dealloc(self->_temperatureMeasurement, v6, v7, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)CMRecordedPressureData;
  -[CMAmbientPressureData dealloc](&v10, sel_dealloc);
}

- (double)timestamp
{
  return self->_timestampValue;
}

- (NSDate)startDate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], a2, v2, v3, v4, self->_startDateValue);
}

- (id)pressure
{
  id result;
  id v4;
  double pressureValue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  result = self->_pressureMeasurement;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3758]);
    pressureValue = self->_pressureValue;
    v10 = objc_msgSend_kilopascals(MEMORY[0x1E0CB3AF0], v6, v7, v8, v9);
    result = (id)objc_msgSend_initWithDoubleValue_unit_(v4, v11, v10, v12, v13, pressureValue);
    self->_pressureMeasurement = (NSMeasurement *)result;
  }
  return result;
}

- (id)temperature
{
  id result;
  id v4;
  double temperatureValue;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  result = self->_temperatureMeasurement;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3758]);
    temperatureValue = self->_temperatureValue;
    v10 = objc_msgSend_celsius(MEMORY[0x1E0CB3B00], v6, v7, v8, v9);
    result = (id)objc_msgSend_initWithDoubleValue_unit_(v4, v11, v10, v12, v13, temperatureValue);
    self->_temperatureMeasurement = (NSMeasurement *)result;
  }
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%llu, %f, %f, %f, %f"), v2, v3, self->_identifier, *(_QWORD *)&self->_timestampValue, *(_QWORD *)&self->_startDateValue, self->_pressureValue, self->_temperatureValue);
}

- (uint64_t)identifier
{
  return self->_identifier;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *started;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t result;
  uint64_t v48;

  v7 = (void *)objc_msgSend_pressure(self, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_doubleValue(v7, v8, v9, v10, v11);
  v13 = v12;
  v18 = (void *)objc_msgSend_temperature(self, v14, v15, v16, v17);
  objc_msgSend_doubleValue(v18, v19, v20, v21, v22);
  v24 = v23;
  objc_msgSend_timestamp(self, v25, v26, v27, v28);
  v30 = (uint64_t)v29;
  started = (void *)objc_msgSend_startDate(self, v31, v32, v33, v34);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v36, v37, v38, v39);
  v41 = v40;
  v46 = objc_msgSend_identifier(self, v42, v43, v44, v45);
  LODWORD(result) = snprintf_l(byte_1EE16E796, 0xA9uLL, 0, "{\"pressure\": %0.*g, \"temperature\": %0.*g, \"timestamp\": %ld, \"walltime\": %0.*g, \"identifier\": %llu}", 9, v13, 9, v24, v30, 9, v41, v46);
  if ((int)result <= 0)
    return (int)result;
  else
    return MEMORY[0x1E0DE7D20](a3, sel_write_maxLength_, byte_1EE16E796, result, v48);
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end
