@implementation CIPerspectiveRotate

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[9];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGeometryAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("13");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.15");
  v12[3] = CFSTR("inputFocalLength");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeDefault");
  v10[0] = CFSTR("CIAttributeTypeScalar");
  v10[1] = &unk_1E2F1BBF0;
  v9[2] = CFSTR("CIAttributeSliderMin");
  v9[3] = CFSTR("CIAttributeSliderMax");
  v10[2] = &unk_1E2F1BC08;
  v10[3] = &unk_1E2F1BC20;
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v12[4] = CFSTR("inputPitch");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypeAngle");
  v8[1] = &unk_1E2F1BC38;
  v7[2] = CFSTR("CIAttributeIdentity");
  v7[3] = CFSTR("CIAttributeSliderMin");
  v8[2] = &unk_1E2F1BC38;
  v8[3] = &unk_1E2F1A630;
  v7[4] = CFSTR("CIAttributeSliderMax");
  v8[4] = &unk_1E2F1A640;
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputYaw");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeAngle");
  v6[1] = &unk_1E2F1BC38;
  v5[2] = CFSTR("CIAttributeIdentity");
  v5[3] = CFSTR("CIAttributeSliderMin");
  v6[2] = &unk_1E2F1BC38;
  v6[3] = &unk_1E2F1A630;
  v5[4] = CFSTR("CIAttributeSliderMax");
  v6[4] = &unk_1E2F1A640;
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v12[6] = CFSTR("inputRoll");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeAngle");
  v4[1] = &unk_1E2F1BC38;
  v3[2] = CFSTR("CIAttributeIdentity");
  v3[3] = CFSTR("CIAttributeSliderMin");
  v4[2] = &unk_1E2F1BC38;
  v4[3] = &unk_1E2F1A650;
  v3[4] = CFSTR("CIAttributeSliderMax");
  v4[4] = &unk_1E2F1A660;
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
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
  float v2;
  float v3;
  float v4;
  float v5;
  CI::Perspective *v6;
  float v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  int32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  uint64_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  __int128 v32;
  int32x4_t v33;
  __int128 v35;
  __int128 v36;
  int32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;

  objc_msgSend((id)a1, "computeCameraIntrinsics");
  objc_msgSend(*(id *)(a1 + 192), "floatValue");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 200), "floatValue");
  v5 = v4;
  v6 = (CI::Perspective *)objc_msgSend(*(id *)(a1 + 208), "floatValue");
  *(__n64 *)v8.f32 = CI::Perspective::getRotation(v6, v3, v5, v7);
  v11 = 0;
  v12 = vaddq_f32(v10, vmlaq_f32(vmulq_f32(v8, (float32x4_t)0), (float32x4_t)0, v9));
  v13 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2);
  v14 = (int32x4_t)vdivq_f32(v12, v13);
  v13.f32[0] = -*(float *)v14.i32;
  *(float *)v14.i32 = -*(float *)&v14.i32[1];
  __asm { FMOV            V5.4S, #1.0 }
  v20 = vzip1q_s32(vzip2q_s32(vdupq_lane_s32(*(int32x2_t *)v13.f32, 0), _Q5), v14);
  v21 = *(float32x4_t *)(a1 + 80);
  v22 = *(float32x4_t *)(a1 + 96);
  v23 = *(float32x4_t *)(a1 + 112);
  v35 = xmmword_192496870;
  v36 = xmmword_192496880;
  v37 = v20;
  do
  {
    *(float32x4_t *)((char *)&v38 + v11) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(__int128 *)((char *)&v35 + v11))), v22, *(float32x2_t *)((char *)&v35 + v11), 1), v23, *(float32x4_t *)((char *)&v35 + v11), 2);
    v11 += 16;
  }
  while (v11 != 48);
  v24 = 0;
  v25 = v38;
  v26 = v39;
  v27 = v40;
  v35 = (__int128)v8;
  v36 = (__int128)v9;
  v37 = (int32x4_t)v10;
  do
  {
    *(float32x4_t *)((char *)&v38 + v24) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v25, COERCE_FLOAT(*(__int128 *)((char *)&v35 + v24))), v26, *(float32x2_t *)((char *)&v35 + v24), 1), v27, *(float32x4_t *)((char *)&v35 + v24), 2);
    v24 += 16;
  }
  while (v24 != 48);
  v28 = 0;
  v29 = v38;
  v30 = v39;
  v31 = v40;
  v32 = *(_OWORD *)(a1 + 144);
  v33 = *(int32x4_t *)(a1 + 160);
  v35 = *(_OWORD *)(a1 + 128);
  v36 = v32;
  v37 = v33;
  do
  {
    *(float32x4_t *)((char *)&v38 + v28) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(__int128 *)((char *)&v35 + v28))), v30, *(float32x2_t *)((char *)&v35 + v28), 1), v31, *(float32x4_t *)((char *)&v35 + v28), 2);
    v28 += 16;
  }
  while (v28 != 48);
  return *(double *)v38.i64;
}

- (id)outputImage
{
  simd::float3x3 v4;

  if (!self->inputImage)
    return 0;
  -[CIPerspectiveRotate outputTransform](self, "outputTransform");
  return perspectiveTransformImage(self->inputImage, v4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSNumber)inputFocalLength
{
  return self->inputFocalLength;
}

- (void)setInputFocalLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)inputPitch
{
  return self->inputPitch;
}

- (void)setInputPitch:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)inputYaw
{
  return self->inputYaw;
}

- (void)setInputYaw:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)inputRoll
{
  return self->inputRoll;
}

- (void)setInputRoll:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
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
