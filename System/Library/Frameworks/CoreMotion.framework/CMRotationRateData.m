@implementation CMRotationRateData

- (CMRotationRateData)initWithRotationRate:(id)a3 andTimestamp:(double)a4
{
  float var2;
  float var1;
  float var0;
  CMRotationRateData *v7;
  CMRotationRateDataInternal *v8;
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
  v17.super_class = (Class)CMRotationRateData;
  v7 = -[CMLogItem initWithTimestamp:](&v17, sel_initWithTimestamp_, a4);
  if (v7)
  {
    v8 = [CMRotationRateDataInternal alloc];
    *(float *)&v9 = var0;
    *(float *)&v10 = var1;
    *(float *)&v11 = var2;
    v7->_internal = (id)objc_msgSend_initWithRotationRate_(v8, v12, v13, v14, v15, v9, v10, v11);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRotationRateData)initWithCoder:(id)a3
{
  CMRotationRateData *v4;
  CMRotationRateDataInternal *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CMRotationRateData;
  v4 = -[CMLogItem initWithCoder:](&v29, sel_initWithCoder_);
  if (v4)
  {
    v5 = [CMRotationRateDataInternal alloc];
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, (uint64_t)CFSTR("rotation_x"), v7, v8);
    v10 = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("rotation_y"), v12, v13);
    v15 = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v16, (uint64_t)CFSTR("rotation_z"), v17, v18);
    HIDWORD(v19) = 1066524486;
    v20 = v10 / 0.0174532924;
    v21 = v15 / 0.0174532924;
    *(float *)&v21 = v15 / 0.0174532924;
    v23 = v22 / 0.0174532924;
    *(float *)&v19 = v23;
    *(float *)&v23 = v20;
    objc_msgSend_setRotationRate_(v5, v24, v25, v26, v27, v23, v21, v19);
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
  v17.super_class = (Class)CMRotationRateData;
  -[CMLogItem encodeWithCoder:](&v17, sel_encodeWithCoder_);
  internal = (float *)self->_internal;
  v6 = (float)(internal[3] * 0.017453);
  v7 = (float)(internal[4] * 0.017453);
  objc_msgSend_encodeDouble_forKey_(a3, v8, (uint64_t)CFSTR("rotation_x"), v9, v10, (float)(internal[2] * 0.017453));
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("rotation_y"), v12, v13, v6);
  objc_msgSend_encodeDouble_forKey_(a3, v14, (uint64_t)CFSTR("rotation_z"), v15, v16, v7);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMRotationRateData;
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
  v10.super_class = (Class)CMRotationRateData;
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
  v12.super_class = (Class)CMRotationRateData;
  -[CMLogItem timestamp](&v12, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("x %f y %f z %f @ %f"), v8, v9, *(_QWORD *)&v4, *(_QWORD *)&v5, *(_QWORD *)&v6, v10);
}

- (CMRotationRate)rotationRate
{
  float *internal;
  double v3;
  double v4;
  double v5;
  CMRotationRate result;

  internal = (float *)self->_internal;
  v3 = (float)(internal[2] * 0.017453);
  v4 = (float)(internal[3] * 0.017453);
  v5 = (float)(internal[4] * 0.017453);
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

@end
