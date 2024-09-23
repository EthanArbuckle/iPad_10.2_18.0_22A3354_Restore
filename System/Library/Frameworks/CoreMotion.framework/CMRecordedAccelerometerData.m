@implementation CMRecordedAccelerometerData

- (double)startTime
{
  return self->_startDateValue;
}

- (CMRecordedAccelerometerData)initWithData:(CMAccel100 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  CMRecordedAccelerometerData *v10;
  const char *v11;
  CMRecordedAccelerometerData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CMRecordedAccelerometerData;
  v10 = -[CMRecordedAccelerometerData init](&v14, sel_init);
  v12 = v10;
  if (v10)
    objc_msgSend_resetWithData_timestamp_walltime_identifier_(v10, v11, (uint64_t)a3, a4, a6, a5);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedAccelerometerData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMRecordedAccelerometerData *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CMRecordedAccelerometerData;
  v7 = -[CMRecordedAccelerometerData init](&v26, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("timestamp"), v5, v6);
    v7->_timestampValue = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("startDate"), v10, v11);
    v7->_startDateValue = v12;
    objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("accel_x"), v14, v15);
    v7->_accelerationValue.x = v16;
    objc_msgSend_decodeFloatForKey_(a3, v17, (uint64_t)CFSTR("accel_y"), v18, v19);
    v7->_accelerationValue.y = v20;
    objc_msgSend_decodeFloatForKey_(a3, v21, (uint64_t)CFSTR("accel_z"), v22, v23);
    v7->_accelerationValue.z = v24;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMRecordedAccelerometerData *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = self;
  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("timestamp"), v3, v4, self->_timestampValue);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("startDate"), v8, v9, v6->_startDateValue);
  v6 = (CMRecordedAccelerometerData *)((char *)v6 + 32);
  v10 = *(double *)&v6->super.super.super.isa;
  *(float *)&v10 = *(double *)&v6->super.super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v11, (uint64_t)CFSTR("accel_x"), v12, v13, v10);
  v14 = *(double *)&v6->super.super._internalLogItem;
  *(float *)&v14 = v14;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("accel_y"), v16, v17, v14);
  v18 = *(double *)&v6->super._internal;
  *(float *)&v18 = v18;
  objc_msgSend_encodeFloat_forKey_(a3, v19, (uint64_t)CFSTR("accel_z"), v20, v21, v18);
}

- (void)resetWithData:(CMAccel100 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  unint64_t v6;

  *(float64x2_t *)&self->_accelerationValue.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  self->_accelerationValue.z = a3->var2;
  v6 = *(_QWORD *)(&a3->var2 + 1);
  self->_startDateValue = a5 - (double)(uint64_t)(a4 - v6) / 1000000.0;
  self->_timestampValue = (double)v6 / 1000000.0;
  self->_identifier = a6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMRecordedAccelerometerData;
  -[CMAccelerometerData dealloc](&v2, sel_dealloc);
}

- ($1AB5FA073B851C12C2339EC22442E995)acceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_accelerationValue.x;
  y = self->_accelerationValue.y;
  z = self->_accelerationValue.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
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

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%llu, %f, %f, (%f, %f, %f)"), v2, v3, self->_identifier, *(_QWORD *)&self->_timestampValue, *(_QWORD *)&self->_startDateValue, *(_QWORD *)&self->_accelerationValue.x, *(_QWORD *)&self->_accelerationValue.y, *(_QWORD *)&self->_accelerationValue.z);
}

- (uint64_t)identifier
{
  return self->_identifier;
}

@end
