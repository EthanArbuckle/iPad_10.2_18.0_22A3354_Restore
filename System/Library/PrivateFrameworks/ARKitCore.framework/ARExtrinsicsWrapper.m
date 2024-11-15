@implementation ARExtrinsicsWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__n128)initWithMatrix:(__n128)a3
{
  ARExtrinsicsWrapper *v5;
  __n128 result;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)ARExtrinsicsWrapper;
  v5 = -[ARExtrinsicsWrapper init](&v11, sel_init);
  if (v5)
  {
    v5[1] = (ARExtrinsicsWrapper)a2;
    v5[2] = (ARExtrinsicsWrapper)a3;
    result = a5;
    v5[3] = (ARExtrinsicsWrapper)a4;
    v5[4] = (ARExtrinsicsWrapper)a5;
  }
  return result;
}

- (ARExtrinsicsWrapper)initWithCoder:(id)a3
{
  id v4;
  ARExtrinsicsWrapper *v5;
  ARExtrinsicsWrapper v6;
  ARExtrinsicsWrapper v7;
  ARExtrinsicsWrapper v8;
  ARExtrinsicsWrapper v9;

  v4 = a3;
  v5 = -[ARExtrinsicsWrapper init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("matrix"));
    v5[1] = v6;
    v5[2] = v7;
    v5[3] = v8;
    v5[4] = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "ar_encodeMatrix4x4:forKey:", CFSTR("matrix"), *(double *)&self[1].super.isa, *(double *)&self[2].super.isa, *(double *)&self[3].super.isa, *(double *)&self[4].super.isa);
}

- (BOOL)isEqual:(id)a3
{
  float32x4_t *v4;
  float32x4_t v5;
  unsigned int v6;

  v4 = (float32x4_t *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.i64[0] = 0x3400000034000000;
    v5.i64[1] = 0x3400000034000000;
    v6 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v5, vabdq_f32((float32x4_t)self[2], v4[2])), (int8x16_t)vcgeq_f32(v5, vabdq_f32((float32x4_t)self[1], v4[1]))), vandq_s8((int8x16_t)vcgeq_f32(v5, vabdq_f32((float32x4_t)self[3], v4[3])), (int8x16_t)vcgeq_f32(v5, vabdq_f32((float32x4_t)self[4], v4[4]))))) >> 31;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ARMatrix4x4Description(1, (__n128)self[1], (__n128)self[2], (__n128)self[3], (__n128)self[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (__n128)matrix
{
  return a1[1];
}

@end
