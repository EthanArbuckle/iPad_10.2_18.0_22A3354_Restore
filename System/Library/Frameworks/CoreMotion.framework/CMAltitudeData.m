@implementation CMAltitudeData

- (CMAltitudeData)initWithAltitude:(float)a3 andTimestamp:(double)a4 atBaseAltitude:(float)a5
{
  CMAltitudeData *v7;
  float v8;
  CMAltitudeDataInternal *v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMAltitudeData;
  v7 = -[CMLogItem initWithTimestamp:](&v17, sel_initWithTimestamp_, a4);
  if (v7)
  {
    v8 = (float)(1.0 - powf(a3 / 101320.0, 0.19026)) * 44331.0;
    v9 = [CMAltitudeDataInternal alloc];
    *(float *)&v10 = v8 - a5;
    *(float *)&v11 = a3;
    v7->_internal = (id)objc_msgSend_initWithAltitude_andPressure_(v9, v12, v13, v14, v15, v10, v11);
  }
  return v7;
}

- (CMAltitudeData)initWithTimestamp:(double)a3 pressure:(float)a4 relativeAltitude:(float)a5
{
  CMAltitudeData *v7;
  CMAltitudeDataInternal *v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CMAltitudeData;
  v7 = -[CMLogItem initWithTimestamp:](&v16, sel_initWithTimestamp_, a3);
  if (v7)
  {
    v8 = [CMAltitudeDataInternal alloc];
    *(float *)&v9 = a5;
    *(float *)&v10 = a4;
    v7->_internal = (id)objc_msgSend_initWithAltitude_andPressure_(v8, v11, v12, v13, v14, v9, v10);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAltitudeData)initWithCoder:(id)a3
{
  CMAltitudeData *v4;
  CMAltitudeDataInternal *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CMAltitudeData;
  v4 = -[CMLogItem initWithCoder:](&v21, sel_initWithCoder_);
  if (v4)
  {
    v5 = [CMAltitudeDataInternal alloc];
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCMAltitudeCodingKeyAltitude"), v7, v8);
    v10 = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCMAltitudeCodingKeyPressure"), v12, v13);
    *(float *)&v15 = v14;
    *(float *)&v14 = v10;
    objc_msgSend_setAltitude_andPressure_(v5, v16, v17, v18, v19, v14, v15);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  float *internal;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CMAltitudeData;
  -[CMLogItem encodeWithCoder:](&v12, sel_encodeWithCoder_);
  internal = (float *)self->_internal;
  objc_msgSend_encodeDouble_forKey_(a3, v6, (uint64_t)CFSTR("kCMAltitudeCodingKeyAltitude"), v7, v8, internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCMAltitudeCodingKeyPressure"), v10, v11, internal[3]);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMAltitudeData;
  -[CMLogItem dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMAltitudeData;
  v8 = -[CMLogItem copyWithZone:](&v10, sel_copyWithZone_);
  if (v8)
    v8[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3, v6, v7);
  return v8;
}

- (id)description
{
  float *internal;
  void *v3;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  internal = (float *)self->_internal;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = internal[2];
  v5 = internal[3];
  v11.receiver = self;
  v11.super_class = (Class)CMAltitudeData;
  -[CMLogItem timestamp](&v11, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("Altitude %f Pressure %f @ %f"), v7, v8, *(_QWORD *)&v4, *(_QWORD *)&v5, v9);
}

- (NSNumber)relativeAltitude
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, *((float *)self->_internal + 2));
}

- (NSNumber)pressure
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (NSNumber *)objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v2, v3, v4, (float)(*((float *)self->_internal + 3) / 1000.0));
}

@end
