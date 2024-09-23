@implementation CMMagnetometerData

- (CMMagnetometerData)initWithMagneticField:(id)a3 andTimestamp:(double)a4
{
  float var2;
  float var1;
  float var0;
  CMMagnetometerData *v7;
  CMMagnetometerDataInternal *v8;
  double v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v17.receiver = self;
  v17.super_class = (Class)CMMagnetometerData;
  v7 = -[CMLogItem initWithTimestamp:](&v17, sel_initWithTimestamp_, a4);
  if (v7)
  {
    v8 = [CMMagnetometerDataInternal alloc];
    *(float *)&v9 = var0;
    *(float *)&v10 = var1;
    *(float *)&v11 = var2;
    v7->_internal = (id)objc_msgSend_initWithMagneticField_(v8, v12, v13, v14, v15, v9, v10, v11);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMagnetometerData)initWithCoder:(id)a3
{
  CMMagnetometerData *v4;
  CMMagnetometerDataInternal *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  float v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  float v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CMMagnetometerData;
  v4 = -[CMLogItem initWithCoder:](&v27, sel_initWithCoder_);
  if (v4)
  {
    v5 = [CMMagnetometerDataInternal alloc];
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("kCMMagneticFieldCodingKeyX"), v7, v8);
    v10 = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCMMagneticFieldCodingKeyY"), v12, v13);
    v15 = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("kCMMagneticFieldCodingKeyZ"), v17, v18);
    *(float *)&v20 = v19;
    *(float *)&v19 = v10;
    *(float *)&v21 = v15;
    objc_msgSend_setMagneticField_(v5, v22, v23, v24, v25, v19, v21, v20);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  float *internal;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMMagnetometerData;
  -[CMLogItem encodeWithCoder:](&v17, sel_encodeWithCoder_);
  internal = (float *)self->_internal;
  v6 = internal[3];
  v7 = internal[4];
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("kCMMagneticFieldCodingKeyX"), v9, v10, internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("kCMMagneticFieldCodingKeyY"), v12, v13, v6);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("kCMMagneticFieldCodingKeyZ"), v15, v16, v7);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMMagnetometerData;
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
  v10.super_class = (Class)CMMagnetometerData;
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
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  internal = (float *)self->_internal;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = internal[2];
  v5 = internal[3];
  v6 = internal[4];
  v12.receiver = self;
  v12.super_class = (Class)CMMagnetometerData;
  -[CMLogItem timestamp](&v12, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("x %f y %f z %f @ %f"), v8, v9, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v6, v10);
}

- (CMMagneticField)magneticField
{
  float *internal;
  double v3;
  double v4;
  double v5;
  CMMagneticField result;

  internal = (float *)self->_internal;
  v3 = internal[2];
  v4 = internal[3];
  v5 = internal[4];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

@end
