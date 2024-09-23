@implementation NSValue(Core3DKitAdditions)

+ (uint64_t)valueWithSCNVector3:()Core3DKitAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a1, a2, a3, 0.0);
}

- (float32_t)SCNVector3Value
{
  float v2;
  float64x2_t v4;
  __int128 v5;
  float32x2_t v6;
  float v7;

  if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{SCNVector3=fff}"))
  {
    v7 = 0.0;
    v6 = 0;
    objc_msgSend(a1, "getValue:size:", &v6, 12);
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    v4 = 0u;
    v5 = 0u;
    objc_msgSend(a1, "getValue:size:", &v4, 32);
    v2 = *(double *)&v5;
    v6 = vcvt_f32_f64(v4);
    v7 = v2;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
  }
  return v6.f32[0];
}

- (float)SCNVector4Value
{
  float64x2_t v3;
  float64x2_t v4;
  SCNVector4 v5;

  if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{SCNVector4=ffff}"))
  {
    v5 = (SCNVector4)0;
    objc_msgSend(a1, "getValue:size:", &v5, 16);
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    v3 = 0u;
    v4 = 0u;
    objc_msgSend(a1, "getValue:size:", &v3, 32);
    v5 = (SCNVector4)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v3), v4);
  }
  else
  {
    v5 = SCNVector4Zero;
  }
  return v5.x;
}

+ (uint64_t)SCN_valueWithCGPoint:()Core3DKitAdditions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
}

- (double)SCN_CGPointValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

+ (uint64_t)valueWithSCNVector4:()Core3DKitAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a1, a2, a3, a4);
}

+ (uint64_t)valueWithSCNMatrix4:()Core3DKitAdditions
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  _OWORD v8[8];

  v3 = vcvtq_f64_f32(a3[1]);
  v8[0] = vcvtq_f64_f32(*a3);
  v8[1] = v3;
  v4 = vcvtq_f64_f32(a3[3]);
  v8[2] = vcvtq_f64_f32(a3[2]);
  v8[3] = v4;
  v5 = vcvtq_f64_f32(a3[5]);
  v8[4] = vcvtq_f64_f32(a3[4]);
  v8[5] = v5;
  v6 = vcvtq_f64_f32(a3[7]);
  v8[6] = vcvtq_f64_f32(a3[6]);
  v8[7] = v6;
  return objc_msgSend(a1, "valueWithCATransform3D:", v8);
}

- (uint64_t)SCNMatrix4Value
{
  uint64_t result;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;

  if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{SCNMatrix4=ffffffffffffffff}"))
  {
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
    return objc_msgSend(a1, "getValue:size:", a2, 64);
  }
  else
  {
    result = strcmp((const char *)objc_msgSend(a1, "objCType"), "{CATransform3D=dddddddddddddddd}");
    if ((_DWORD)result)
    {
      result = strcmp((const char *)objc_msgSend(a1, "objCType"), "{?=[4]}");
      if ((_DWORD)result)
      {
        *(SCNMatrix4 *)a2->f32 = SCNMatrix4Identity;
        return result;
      }
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      result = objc_msgSend(a1, "getValue:size:", &v9, 64);
      v5 = (float32x4_t)v9;
      v6 = (float32x4_t)v10;
      v7 = (float32x4_t)v11;
      v8 = (float32x4_t)v12;
    }
    else
    {
      v5 = 0uLL;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = 0uLL;
      v7 = 0uLL;
      v8 = 0uLL;
      v9 = 0u;
      v10 = 0u;
      if (a1)
      {
        result = objc_msgSend(a1, "CATransform3DValue");
        v5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
        v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
        v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
        v8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v16);
      }
    }
    *a2 = v5;
    a2[1] = v6;
    a2[2] = v7;
    a2[3] = v8;
  }
  return result;
}

+ (uint64_t)SCN_valueWithSimdMatrix4:()Core3DKitAdditions
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
  return objc_msgSend(a1, "valueWithCATransform3D:", v6);
}

- (double)SCN_simdMatrix4Value
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;

  if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{?=[4]}"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(a1, "getValue:size:", &v21, 64);
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{SCNMatrix4=ffffffffffffffff}"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(a1, "getValue:size:", &v17, 64);
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = v20;
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CATransform3D=dddddddddddddddd}"))
  {
    if (a1)
    {
      objc_msgSend(a1, "CATransform3DValue");
      v4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v16);
      v5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
      v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
      v7 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
    }
    else
    {
      v7 = 0uLL;
      v6 = 0uLL;
      v5 = 0uLL;
      v4 = 0uLL;
    }
    v21 = v7;
    v22 = v6;
    v23 = v5;
    v24 = v4;
  }
  else
  {
    v2 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v21 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v22 = v2;
    v3 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
    v23 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
    v24 = v3;
  }
  return *(double *)v21.i64;
}

@end
