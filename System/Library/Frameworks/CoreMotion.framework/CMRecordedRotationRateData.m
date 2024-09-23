@implementation CMRecordedRotationRateData

- (CMRecordedRotationRateData)initWithData:(CMGyro200 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5
{
  CMRecordedRotationRateData *result;
  unint64_t var4;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMRecordedRotationRateData;
  result = -[CMRecordedRotationRateData init](&v10, sel_init);
  if (result)
  {
    *(float64x2_t *)&result->_rotationRate.x = vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&a3->var0, (float32x2_t)vdup_n_s32(0x3C8EFA35u)));
    result->_rotationRate.z = (float)(a3->var2 * 0.017453);
    var4 = a3->var4;
    result->_startDateValue = a5 - (double)(uint64_t)(a4 - var4) / 1000000.0;
    result->_timestampValue = (double)var4 / 1000000.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedRotationRateData)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMRecordedRotationRateData *v7;
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
  v26.super_class = (Class)CMRecordedRotationRateData;
  v7 = -[CMRecordedRotationRateData init](&v26, sel_init);
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
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMRecordedRotationRateData *v6;
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
  v6 = (CMRecordedRotationRateData *)((char *)v6 + 32);
  v10 = *(double *)&v6->super.super.super.isa;
  *(float *)&v10 = *(double *)&v6->super.super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v11, (uint64_t)CFSTR("rotation_x"), v12, v13, v10);
  v14 = *(double *)&v6->super.super._internalLogItem;
  *(float *)&v14 = v14;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("rotation_y"), v16, v17, v14);
  v18 = *(double *)&v6->super._internal;
  *(float *)&v18 = v18;
  objc_msgSend_encodeFloat_forKey_(a3, v19, (uint64_t)CFSTR("rotation_z"), v20, v21, v18);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMRecordedRotationRateData;
  -[CMRotationRateData dealloc](&v2, sel_dealloc);
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

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%f %f, (%f, %f, %f)"), v2, v3, *(_QWORD *)&self->_timestampValue, *(_QWORD *)&self->_startDateValue, *(_QWORD *)&self->_rotationRate.x, *(_QWORD *)&self->_rotationRate.y, *(_QWORD *)&self->_rotationRate.z);
}

@end
