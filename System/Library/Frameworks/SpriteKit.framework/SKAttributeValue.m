@implementation SKAttributeValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)copyValueTo:(void *)a3 type:(int64_t)a4 count:(unsigned int)a5
{
  unint64_t v5;
  unsigned int v6;
  size_t v8;
  char *v9;

  v5 = a4 - 1;
  if ((unint64_t)(a4 - 1) <= 7)
  {
    v6 = a5;
    if (a5)
    {
      v8 = qword_1DC9658E0[v5];
      v9 = (char *)self + qword_1DC9658A0[v5];
      do
      {
        memcpy(a3, v9, v8);
        a3 = (char *)a3 + v8;
        --v6;
      }
      while (v6);
    }
  }
  return v5 < 8;
}

+ (SKAttributeValue)valueWithFloat:(float)value
{
  SKAttributeValue *v4;
  double v5;

  v4 = objc_alloc_init(SKAttributeValue);
  *(float *)&v5 = value;
  -[SKAttributeValue setFloatValue:](v4, "setFloatValue:", v5);
  return v4;
}

+ (SKAttributeValue)valueWithVectorFloat2:(vector_float2)value
{
  SKAttributeValue *v4;

  v4 = objc_alloc_init(SKAttributeValue);
  -[SKAttributeValue setVectorFloat2Value:](v4, "setVectorFloat2Value:", *(double *)&value);
  return v4;
}

+ (SKAttributeValue)valueWithVectorFloat3:(vector_float3)value
{
  double v3;
  SKAttributeValue *v4;
  double v6;

  v6 = v3;
  v4 = objc_alloc_init(SKAttributeValue);
  -[SKAttributeValue setVectorFloat3Value:](v4, "setVectorFloat3Value:", v6);
  return v4;
}

+ (SKAttributeValue)valueWithVectorFloat4:(vector_float4)value
{
  SKAttributeValue *v3;
  double v5;

  v5 = *(double *)value.i64;
  v3 = objc_alloc_init(SKAttributeValue);
  -[SKAttributeValue setVectorFloat4Value:](v3, "setVectorFloat4Value:", v5);
  return v3;
}

- (float)floatValue
{
  return self->floatValues[0];
}

- (void)setFloatValue:(float)floatValue
{
  self->floatValues[0] = floatValue;
  self->halfFloatValues[0] = floatToHalfFloat(floatValue);
}

- (vector_float2)vectorFloat2Value
{
  return *(vector_float2 *)self->floatValues;
}

- (void)setVectorFloat2Value:(vector_float2)vectorFloat2Value
{
  float v4;

  v4 = vectorFloat2Value.f32[1];
  *(vector_float2 *)self->floatValues = vectorFloat2Value;
  self->halfFloatValues[0] = floatToHalfFloat(vectorFloat2Value.f32[0]);
  self->halfFloatValues[1] = floatToHalfFloat(v4);
}

- (vector_float3)vectorFloat3Value
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setVectorFloat3Value:(vector_float3)vectorFloat3Value
{
  __int128 v3;
  float v5;
  float v6;

  v5 = *((float *)&v3 + 1);
  *(_QWORD *)self->floatValues = v3;
  v6 = *((float *)&v3 + 2);
  self->floatValues[2] = *((float *)&v3 + 2);
  self->halfFloatValues[0] = floatToHalfFloat(*(float *)&v3);
  self->halfFloatValues[1] = floatToHalfFloat(v5);
  self->halfFloatValues[2] = floatToHalfFloat(v6);
}

- (vector_float4)vectorFloat4Value
{
  return *(vector_float4 *)self->floatValues;
}

- (void)setVectorFloat4Value:(vector_float4)vectorFloat4Value
{
  float v4;
  float v5;
  float v6;

  v4 = vectorFloat4Value.f32[3];
  v5 = vectorFloat4Value.f32[2];
  v6 = vectorFloat4Value.f32[1];
  *(vector_float4 *)self->floatValues = vectorFloat4Value;
  self->halfFloatValues[0] = floatToHalfFloat(vectorFloat4Value.f32[0]);
  self->halfFloatValues[1] = floatToHalfFloat(v6);
  self->halfFloatValues[2] = floatToHalfFloat(v5);
  self->halfFloatValues[3] = floatToHalfFloat(v4);
}

- (SKAttributeValue)init
{
  SKAttributeValue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKAttributeValue;
  result = -[SKAttributeValue init](&v3, sel_init);
  if (result)
    result->_type = 0;
  return result;
}

- (SKAttributeValue)initWithCoder:(id)a3
{
  id v4;
  SKAttributeValue *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v10;
  unsigned int v11;

  v4 = a3;
  v5 = -[SKAttributeValue init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_floatValues0"));
    v11 = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_floatValues1"));
    v10 = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_floatValues2"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_floatValues3"));
    -[SKAttributeValue setVectorFloat4Value:](v5, "setVectorFloat4Value:", COERCE_DOUBLE(__PAIR64__(v10, v11)));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("_type"));

  *(float *)&v5 = self->floatValues[0];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_floatValues0"), v5);
  *(float *)&v6 = self->floatValues[1];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_floatValues1"), v6);
  *(float *)&v7 = self->floatValues[2];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_floatValues2"), v7);
  *(float *)&v8 = self->floatValues[3];
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_floatValues3"), v8);

}

- (BOOL)isEqualToAttributeValue:(id)a3
{
  SKAttributeValue *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;

  v4 = (SKAttributeValue *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    if ((COERCE_UNSIGNED_INT(self->floatValues[0] - v4->floatValues[0]) & 0x60000000) != 0)
      goto LABEL_9;
    if ((COERCE_UNSIGNED_INT(self->floatValues[1] - v4->floatValues[1]) & 0x60000000) != 0)
      goto LABEL_9;
    if ((COERCE_UNSIGNED_INT(self->floatValues[2] - v4->floatValues[2]) & 0x60000000) != 0)
      goto LABEL_9;
    v5 = v4->floatValues[3];
    v6 = self->floatValues[3] - v5;
    if ((LODWORD(v6) & 0x60000000) != 0)
      goto LABEL_9;
    LOWORD(v6) = self->halfFloatValues[0];
    LOWORD(v5) = v4->halfFloatValues[0];
    v7 = (float)LODWORD(v5);
    v8 = (float)LODWORD(v6) - v7;
    if ((LODWORD(v8) & 0x60000000) != 0)
      goto LABEL_9;
    LOWORD(v8) = self->halfFloatValues[1];
    LOWORD(v7) = v4->halfFloatValues[1];
    v9 = (float)LODWORD(v7);
    v10 = (float)LODWORD(v8) - v9;
    if ((LODWORD(v10) & 0x60000000) != 0
      || (LOWORD(v10) = self->halfFloatValues[2],
          LOWORD(v9) = v4->halfFloatValues[2],
          v11 = (float)LODWORD(v9),
          v12 = (float)LODWORD(v10) - v11,
          (LODWORD(v12) & 0x60000000) != 0))
    {
LABEL_9:
      v13 = 0;
    }
    else
    {
      LOWORD(v12) = self->halfFloatValues[3];
      LOWORD(v11) = v4->halfFloatValues[3];
      v13 = (COERCE_UNSIGNED_INT((float)LODWORD(v12) - (float)LODWORD(v11)) & 0x60000000) == 0;
    }
  }

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

@end
