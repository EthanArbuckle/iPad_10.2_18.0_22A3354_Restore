@implementation CMRecordedGyroData

- (double)startTime
{
  return self->_startDateValue;
}

- (CMRecordedGyroData)initWithData:(CMGyro50 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  CMRecordedGyroData *v10;
  const char *v11;
  CMRecordedGyroData *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CMRecordedGyroData;
  v10 = -[CMRecordedGyroData init](&v14, sel_init);
  v12 = v10;
  if (v10)
    objc_msgSend_resetWithData_timestamp_walltime_identifier_(v10, v11, (uint64_t)a3, a4, a6, a5);
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedGyroData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMRecordedGyroData *v7;
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CMRecordedGyroData;
  v7 = -[CMRecordedGyroData init](&v30, sel_init);
  if (v7)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, (uint64_t)CFSTR("timestamp"), v5, v6);
    v7->_timestampValue = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, (uint64_t)CFSTR("startDate"), v10, v11);
    v7->_startDateValue = v12;
    objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("rotation_x"), v14, v15);
    v7->_rotationRate.x = v16;
    objc_msgSend_decodeFloatForKey_(a3, v17, (uint64_t)CFSTR("rotation_y"), v18, v19);
    v7->_rotationRate.y = v20;
    objc_msgSend_decodeFloatForKey_(a3, v21, (uint64_t)CFSTR("rotation_z"), v22, v23);
    v7->_rotationRate.z = v24;
    objc_msgSend_decodeFloatForKey_(a3, v25, (uint64_t)CFSTR("temperature"), v26, v27);
    v7->_temperatureValue = v28;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double x;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double y;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double z;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("timestamp"), v3, v4, self->_timestampValue);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("startDate"), v8, v9, self->_startDateValue);
  x = self->_rotationRate.x;
  *(float *)&x = x;
  objc_msgSend_encodeFloat_forKey_(a3, v11, (uint64_t)CFSTR("rotation_x"), v12, v13, x);
  y = self->_rotationRate.y;
  *(float *)&y = y;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("rotation_y"), v16, v17, y);
  z = self->_rotationRate.z;
  *(float *)&z = z;
  objc_msgSend_encodeFloat_forKey_(a3, v19, (uint64_t)CFSTR("rotation_z"), v20, v21, z);
  *(float *)&v22 = self->_temperatureValue;
  objc_msgSend_encodeFloat_forKey_(a3, v23, (uint64_t)CFSTR("temperature"), v24, v25, v22);
}

- (void)resetWithData:(CMGyro50 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  float var3;
  unint64_t var4;

  *(float64x2_t *)&self->_rotationRate.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  var3 = a3->var3;
  self->_rotationRate.z = a3->var2;
  self->_temperatureValue = var3;
  var4 = a3->var4;
  self->_startDateValue = a5 - (double)(uint64_t)(a4 - var4) / 1000000.0;
  self->_timestampValue = (double)var4 / 1000000.0;
  self->_identifier = a6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMRecordedGyroData;
  -[CMGyroData dealloc](&v2, sel_dealloc);
}

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rotationRate.x;
  y = self->_rotationRate.y;
  z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (float)temperature
{
  return self->_temperatureValue;
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

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%llu, %f, %f, (%f, %f, %f), %f"), v2, v3, self->_identifier, *(_QWORD *)&self->_timestampValue, *(_QWORD *)&self->_startDateValue, *(_QWORD *)&self->_rotationRate.x, *(_QWORD *)&self->_rotationRate.y, *(_QWORD *)&self->_rotationRate.z, self->_temperatureValue);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

@end
