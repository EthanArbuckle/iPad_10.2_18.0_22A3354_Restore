@implementation NSValue(AVTExtensions)

+ (id)avt_valueWithFloat3_usableWithKVCForSCNVector3:()AVTExtensions
{
  __n128 v2;

  v2 = a1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v2, "{SCNVector3=fff}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)avt_valueWithFloat4_usableWithKVCForSCNVector4:()AVTExtensions
{
  __n128 v2;

  v2 = a1;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v2, "{SCNVector4=ffff}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)avt_valueWithFloat3:()AVTExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], 0.0);
}

- (float32x2_t)avt_float3Value
{
  id v1;
  float32x2_t result;
  id v3;
  _BYTE *v4;
  float64x2_t v5;

  v1 = objc_retainAutorelease(a1);
  if (!strcmp((const char *)objc_msgSend(v1, "objCType"), "{SCNVector3=fff}"))
  {
LABEL_4:
    LODWORD(v5.f64[1]) = 0;
    v5.f64[0] = 0.0;
    objc_msgSend(v1, "getValue:", &v5, *(double *)&result);
    return *(float32x2_t *)&v5.f64[0];
  }
  v3 = objc_retainAutorelease(v1);
  if (strcmp((const char *)objc_msgSend(v3, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    v1 = objc_retainAutorelease(v3);
    v4 = (_BYTE *)objc_msgSend(v1, "objCType");
    result = 0;
    if (*v4)
      return result;
    goto LABEL_4;
  }
  memset(&v5, 0, 32);
  objc_msgSend(v3, "getValue:", &v5);
  return vcvt_f32_f64(v5);
}

+ (uint64_t)avt_valueWithFloat4:()AVTExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], a1.n128_f32[3]);
}

- (float64_t)avt_float4Value
{
  id v1;
  float64_t result;
  id v3;
  _BYTE *v4;
  float64x2_t v5;
  float64x2_t v6;

  v1 = objc_retainAutorelease(a1);
  if (!strcmp((const char *)objc_msgSend(v1, "objCType"), "{SCNVector4=ffff}"))
  {
LABEL_4:
    v5 = 0uLL;
    objc_msgSend(v1, "getValue:", &v5, result);
    return v5.f64[0];
  }
  v3 = objc_retainAutorelease(v1);
  if (strcmp((const char *)objc_msgSend(v3, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    v1 = objc_retainAutorelease(v3);
    v4 = (_BYTE *)objc_msgSend(v1, "objCType");
    result = 0.0;
    if (*v4)
      return result;
    goto LABEL_4;
  }
  v5 = 0u;
  v6 = 0u;
  objc_msgSend(v3, "getValue:", &v5);
  *(_QWORD *)&result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v6).u64[0];
  return result;
}

+ (id)avt_valueWithFloat4x4:()AVTExtensions
{
  _OWORD v6[8];

  v6[0] = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  v6[1] = vcvt_hight_f64_f32(a2);
  v6[2] = vcvtq_f64_f32(*(float32x2_t *)a3.f32);
  v6[3] = vcvt_hight_f64_f32(a3);
  v6[4] = vcvtq_f64_f32(*(float32x2_t *)a4.f32);
  v6[5] = vcvt_hight_f64_f32(a4);
  v6[6] = vcvtq_f64_f32(*(float32x2_t *)a5.f32);
  v6[7] = vcvt_hight_f64_f32(a5);
  objc_msgSend(a1, "valueWithCATransform3D:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)avt_float4x4Value
{
  id v1;
  id v2;
  id v3;
  float32x4_t v4;
  float32x4_t v5;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;

  v1 = objc_retainAutorelease(a1);
  if (!strcmp((const char *)objc_msgSend(v1, "objCType"), "{?=[4]}"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v1, "getValue:", &v19);
  }
  else
  {
    v2 = objc_retainAutorelease(v1);
    if (!strcmp((const char *)objc_msgSend(v2, "objCType"), "{SCNMatrix4=ffffffffffffffff}"))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v2, "getValue:", &v15);
      v19 = v15;
      v20 = v16;
      v21 = v17;
      v22 = v18;
    }
    else
    {
      v3 = objc_retainAutorelease(v2);
      if (!strcmp((const char *)objc_msgSend(v3, "objCType"), "{CATransform3D=dddddddddddddddd}"))
      {
        objc_msgSend(v3, "CATransform3DValue");
        v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v7), v8);
        v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
        v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
        v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
      }
      else
      {
        v4 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
        v19 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
        v20 = v4;
        v5 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
        v21 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
        v22 = v5;
      }
    }
  }
  return *(double *)v19.i64;
}

@end
