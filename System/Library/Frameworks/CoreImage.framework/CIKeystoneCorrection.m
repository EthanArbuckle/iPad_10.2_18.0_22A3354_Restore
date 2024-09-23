@implementation CIKeystoneCorrection

+ (id)customAttributes
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryGeometryAdjustment");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("13");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.15");
  v14[3] = CFSTR("inputFocalLength");
  v11[0] = CFSTR("CIAttributeType");
  v11[1] = CFSTR("CIAttributeDefault");
  v12[0] = CFSTR("CIAttributeTypeScalar");
  v12[1] = &unk_1E2F1BBF0;
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v14[4] = CFSTR("inputTopLeft");
  v9 = CFSTR("CIAttributeType");
  v10 = CFSTR("CIAttributeTypePosition");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v14[5] = CFSTR("inputTopRight");
  v7 = CFSTR("CIAttributeType");
  v8 = CFSTR("CIAttributeTypePosition");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v14[6] = CFSTR("inputBottomRight");
  v5 = CFSTR("CIAttributeType");
  v6 = CFSTR("CIAttributeTypePosition");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v14[7] = CFSTR("inputBottomLeft");
  v3 = CFSTR("CIAttributeType");
  v4 = CFSTR("CIAttributeTypePosition");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (void)computeCameraIntrinsics
{
  float64_t v3;
  float64x2_t v4;
  double v5;
  double v6;
  float v7;
  float v8;
  float v9;
  int32x2_t v10;
  int32x4_t v11;
  int32x4_t v17;
  float v18;
  float v19;
  int32x2_t v20;
  simd_float3x3 v21;
  simd_float3x3 v22;

  -[CIImage extent](self->inputImage, "extent");
  v4.f64[1] = v3;
  *(float *)&v3 = v5;
  *(float *)&v6 = v6;
  v18 = *(float *)&v6;
  v19 = *(float *)&v3;
  v20 = (int32x2_t)vmla_f32(vcvt_f32_f64(v4), (float32x2_t)0x3F0000003F000000, (float32x2_t)__PAIR64__(LODWORD(v6), LODWORD(v3)));
  -[NSNumber floatValue](self->inputFocalLength, "floatValue");
  v8 = v7 / hypotf(36.0, 24.0);
  v9 = hypotf(v19, v18);
  v11.i64[0] = COERCE_UNSIGNED_INT(v8 * v9);
  v11.u64[1] = (unint64_t)v20;
  v21.columns[0].i32[1] = 0;
  v21.columns[0].i64[1] = 0;
  v21.columns[0].f32[0] = v8 * v9;
  *(float *)v10.i32 = v21.columns[0].f32[0];
  __asm { FMOV            V3.4S, #1.0 }
  v17 = vzip2q_s32(v11, _Q3);
  *(int32x2_t *)_Q3.i8 = vdup_lane_s32(v20, 1);
  v21.columns[2] = (simd_float3)vzip1q_s32(v17, _Q3);
  v21.columns[1] = (simd_float3)vzip2q_s32((int32x4_t)v21.columns[0].u32[0], vdupq_lane_s32(v10, 0));
  *(_OWORD *)self->_anon_50 = v21.columns[0].u32[0];
  *(simd_float3 *)&self->_anon_50[16] = v21.columns[1];
  *(simd_float3 *)&self->_anon_50[32] = v21.columns[2];
  v22 = __invert_f3(v21);
  *(_QWORD *)self->_anon_80 = v22.columns[0].i64[0];
  *(_DWORD *)&self->_anon_80[8] = v22.columns[0].i32[2];
  *(_QWORD *)&self->_anon_80[16] = v22.columns[1].i64[0];
  *(_DWORD *)&self->_anon_80[24] = v22.columns[1].i32[2];
  *(_QWORD *)&self->_anon_80[32] = v22.columns[2].i64[0];
  *(_DWORD *)&self->_anon_80[40] = v22.columns[2].i32[2];
}

- (double)outputTransform
{
  float32x4_t v2;
  float32x4_t v3;
  float32x4_t v4;
  uint64_t v5;
  float32x4_t v6;
  float32x4_t v7;
  int32x4_t v8;
  int32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  uint64_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  uint64_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  __int128 v26;
  int32x4_t v27;
  __int128 v29;
  __int128 v30;
  int32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;

  objc_msgSend((id)a1, "computeCameraIntrinsics");
  *(__n64 *)v2.f32 = CI::Perspective::getRotation((CI::Perspective *)objc_msgSend((id)a1, "computeRotation"), *(float *)(a1 + 176), *(float *)(a1 + 180), *(float *)(a1 + 184));
  v5 = 0;
  v6 = vaddq_f32(v4, vmlaq_f32(vmulq_f32(v2, (float32x4_t)0), (float32x4_t)0, v3));
  v7 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2);
  v8 = (int32x4_t)vdivq_f32(v6, v7);
  v7.f32[0] = -*(float *)v8.i32;
  *(float *)v8.i32 = -*(float *)&v8.i32[1];
  __asm { FMOV            V5.4S, #1.0 }
  v14 = vzip1q_s32(vzip2q_s32(vdupq_lane_s32(*(int32x2_t *)v7.f32, 0), _Q5), v8);
  v15 = *(float32x4_t *)(a1 + 80);
  v16 = *(float32x4_t *)(a1 + 96);
  v17 = *(float32x4_t *)(a1 + 112);
  v29 = xmmword_192496870;
  v30 = xmmword_192496880;
  v31 = v14;
  do
  {
    *(float32x4_t *)((char *)&v32 + v5) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(__int128 *)((char *)&v29 + v5))), v16, *(float32x2_t *)((char *)&v29 + v5), 1), v17, *(float32x4_t *)((char *)&v29 + v5), 2);
    v5 += 16;
  }
  while (v5 != 48);
  v18 = 0;
  v19 = v32;
  v20 = v33;
  v21 = v34;
  v29 = (__int128)v2;
  v30 = (__int128)v3;
  v31 = (int32x4_t)v4;
  do
  {
    *(float32x4_t *)((char *)&v32 + v18) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(__int128 *)((char *)&v29 + v18))), v20, *(float32x2_t *)((char *)&v29 + v18), 1), v21, *(float32x4_t *)((char *)&v29 + v18), 2);
    v18 += 16;
  }
  while (v18 != 48);
  v22 = 0;
  v23 = v32;
  v24 = v33;
  v25 = v34;
  v26 = *(_OWORD *)(a1 + 144);
  v27 = *(int32x4_t *)(a1 + 160);
  v29 = *(_OWORD *)(a1 + 128);
  v30 = v26;
  v31 = v27;
  do
  {
    *(float32x4_t *)((char *)&v32 + v22) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(__int128 *)((char *)&v29 + v22))), v24, *(float32x2_t *)((char *)&v29 + v22), 1), v25, *(float32x4_t *)((char *)&v29 + v22), 2);
    v22 += 16;
  }
  while (v22 != 48);
  return *(double *)v32.i64;
}

- (CIFilter)outputRotationFilter
{
  CIFilter *v3;
  double v4;
  double v5;
  double v6;

  -[CIKeystoneCorrection computeCameraIntrinsics](self, "computeCameraIntrinsics");
  -[CIKeystoneCorrection computeRotation](self, "computeRotation");
  v3 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPerspectiveRotate"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", self->inputImage, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", self->inputFocalLength, CFSTR("inputFocalLength"));
  *(float *)&v4 = self->pitch;
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4), CFSTR("inputPitch"));
  *(float *)&v5 = self->yaw;
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputYaw"));
  *(float *)&v6 = self->roll;
  -[CIFilter setValue:forKey:](v3, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6), CFSTR("inputRoll"));
  return v3;
}

- (id)outputImage
{
  id result;
  simd::float3x3 v4;

  result = self->inputImage;
  if (result && self->inputBottomLeft && self->inputTopLeft && self->inputTopRight)
  {
    if (self->inputBottomRight)
    {
      -[CIKeystoneCorrection outputTransform](self, "outputTransform");
      return perspectiveTransformImage(self->inputImage, v4);
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSNumber)inputFocalLength
{
  return self->inputFocalLength;
}

- (void)setInputFocalLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (CIVector)inputTopLeft
{
  return self->inputTopLeft;
}

- (void)setInputTopLeft:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (CIVector)inputTopRight
{
  return self->inputTopRight;
}

- (void)setInputTopRight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (CIVector)inputBottomRight
{
  return self->inputBottomRight;
}

- (void)setInputBottomRight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (CIVector)inputBottomLeft
{
  return self->inputBottomLeft;
}

- (void)setInputBottomLeft:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 8) = 0u;
  return self;
}

@end
