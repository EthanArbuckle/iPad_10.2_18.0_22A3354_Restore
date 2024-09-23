@implementation CMAttitude

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMAttitude;
  -[CMAttitude dealloc](&v3, sel_dealloc);
}

- (CMAttitude)initWithQuaternion:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  CMAttitude *v7;
  CMAttitudeInternal *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)CMAttitude;
  v7 = -[CMAttitude init](&v14, sel_init);
  if (v7)
  {
    v8 = [CMAttitudeInternal alloc];
    v7->_internal = (id)objc_msgSend_initWithQuaternion_(v8, v9, v10, v11, v12, var0, var1, var2, var3);
  }
  return v7;
}

- (void)setQuaternion:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_setQuaternion_(self->_internal, a2, v3, v4, v5, a3.var0, a3.var1, a3.var2, a3.var3);
}

- (CMRotationMatrix)rotationMatrix
{
  CMRotationMatrix *result;
  float64x2_t v5;
  float64x2_t v6;
  float32x2_t v7[4];
  float v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sub_18F20677C((uint64_t)v7, (double *)self->_internal + 1);
  v5 = vcvtq_f64_f32(v7[1]);
  *(float64x2_t *)&retstr->m11 = vcvtq_f64_f32(v7[0]);
  *(float64x2_t *)&retstr->m13 = v5;
  v6 = vcvtq_f64_f32(v7[3]);
  *(float64x2_t *)&retstr->m22 = vcvtq_f64_f32(v7[2]);
  *(float64x2_t *)&retstr->m31 = v6;
  retstr->m33 = v8;
  return result;
}

- (double)yaw
{
  return sub_18F1EACE4((double *)self->_internal + 1);
}

- (double)roll
{
  return sub_18F1EAD24((double *)self->_internal + 1);
}

- (double)pitch
{
  double *internal;

  internal = (double *)self->_internal;
  return asin(internal[1] * (internal[2] + internal[2]) + internal[3] * (internal[4] + internal[4]));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAttitude)initWithCoder:(id)a3
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
  uint64_t v18;
  uint64_t v19;

  objc_msgSend_decodeDoubleForKey_(a3, a2, (uint64_t)CFSTR("kCMAttitudeCodingKeyQX"), v3, v4);
  objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("kCMAttitudeCodingKeyQY"), v8, v9);
  objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("kCMAttitudeCodingKeyQZ"), v11, v12);
  objc_msgSend_decodeDoubleForKey_(a3, v13, (uint64_t)CFSTR("kCMAttitudeCodingKeyQW"), v14, v15);
  return (CMAttitude *)objc_msgSend_initWithQuaternion_(self, v16, v17, v18, v19);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double *internal;
  double v7;
  double v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  internal = (double *)self->_internal;
  v7 = internal[3];
  v8 = internal[4];
  v9 = internal[1];
  objc_msgSend_encodeDouble_forKey_(a3, a2, (uint64_t)CFSTR("kCMAttitudeCodingKeyQX"), v3, v4, internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v10, (uint64_t)CFSTR("kCMAttitudeCodingKeyQY"), v11, v12, v7);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("kCMAttitudeCodingKeyQZ"), v14, v15, v8);
  objc_msgSend_encodeDouble_forKey_(a3, v16, (uint64_t)CFSTR("kCMAttitudeCodingKeyQW"), v17, v18, v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double *internal;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  internal = (double *)self->_internal;
  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithQuaternion_(v9, v10, v11, v12, v13, internal[1], internal[2], internal[3], internal[4]);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend_isEqual_(self->_internal, v5, *((_QWORD *)a3 + 1), v6, v7);
  else
    return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_pitch(self, v6, v7, v8, v9);
  v11 = v10 * 57.2957795;
  objc_msgSend_roll(self, v12, v13, v14, v15);
  v17 = v16 * 57.2957795;
  objc_msgSend_yaw(self, v18, v19, v20, v21);
  return (id)objc_msgSend_stringWithFormat_(v3, v23, (uint64_t)CFSTR("%@ Pitch: %f, Roll: %f, Yaw: %f\n"), v24, v25, v5, *(_QWORD *)&v11, *(_QWORD *)&v17, v22 * 57.2957795);
}

- (CMQuaternion)quaternion
{
  double *internal;
  double v3;
  double v4;
  double v5;
  double v6;
  CMQuaternion result;

  internal = (double *)self->_internal;
  v3 = internal[3];
  v4 = internal[4];
  v6 = internal[1];
  v5 = internal[2];
  result.w = v6;
  result.z = v4;
  result.y = v3;
  result.x = v5;
  return result;
}

- (void)multiplyByInverseOfAttitude:(CMAttitude *)attitude
{
  double *internal;
  float64x2_t *v4;
  double v5;
  float64x2_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float64_t v10;
  float64x2_t v11;
  double v12;

  internal = (double *)self->_internal;
  v4 = (float64x2_t *)attitude->_internal;
  v5 = v4[2].f64[0];
  v6 = v4[1];
  v10 = v4->f64[1];
  v11 = vnegq_f64(v6);
  v12 = -v5;
  internal[1] = sub_18F3EEB0C(&v10, internal + 1);
  *((_QWORD *)internal + 2) = v7;
  *((_QWORD *)internal + 3) = v8;
  *((_QWORD *)internal + 4) = v9;
}

@end
