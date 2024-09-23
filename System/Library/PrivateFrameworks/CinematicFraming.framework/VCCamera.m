@implementation VCCamera

- (VCCamera)init
{
  VCCamera *v2;
  NSData *forwardGeometricDistortionPolynomial;
  NSData *inverseGeometricDistortionPolynomial;
  NSString *portType;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VCCamera;
  v2 = -[VCCamera init](&v7, sel_init);
  *(_QWORD *)&v2->_sensorSize[4] = 0x453B8000457A0000;
  *(int32x2_t *)&v2->_focalLength[4] = vdup_n_s32(0x44F9FFFFu);
  *(_QWORD *)&v2->_principalPoint[4] = 0x44BB800044FA0000;
  *(_QWORD *)&v2->_pixelSize = 0x3F8000003A83126FLL;
  v2->_hasGeometricDistortionCalibration = 0;
  v2->_geometricDistortionCalibrationMaxRadius = 0;
  *(_OWORD *)v2->_rotation = 0u;
  *(_OWORD *)v2->_translation = 0u;
  forwardGeometricDistortionPolynomial = v2->_forwardGeometricDistortionPolynomial;
  *(_QWORD *)&v2->_geometricDistortionCenter[4] = 0;
  v2->_forwardGeometricDistortionPolynomial = 0;

  inverseGeometricDistortionPolynomial = v2->_inverseGeometricDistortionPolynomial;
  v2->_inverseGeometricDistortionPolynomial = 0;

  v2->_stereographicFisheyeStrength = 0.0;
  portType = v2->_portType;
  v2->_portType = 0;

  v2->_sensorID = 0;
  v2->_modelState = 15;
  return v2;
}

- (int)updateWithCalibration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  BOOL v31;
  BOOL v32;
  int v33;
  int v34;
  NSData *forwardGeometricDistortionPolynomial;
  NSData *inverseGeometricDistortionPolynomial;
  int v37;
  int v38;
  unsigned int v40;
  unsigned int v41;
  id v42;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_31;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrixReferenceDimensions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_31;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Width"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v41 = v9;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v40 = v11;

  *(_QWORD *)&self->_sensorSize[4] = __PAIR64__(v40, v41);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IntrinsicMatrix"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_31:
    v38 = -1;
    goto LABEL_29;
  }
  v13 = objc_retainAutorelease(v12);
  v42 = v13;
  v14 = objc_msgSend(v13, "bytes");
  v15 = *(_OWORD *)v14;
  v16 = *(_OWORD *)(v14 + 32);
  DWORD1(v15) = *(_DWORD *)(v14 + 20);
  *(_QWORD *)&self->_focalLength[4] = v15;
  *(_QWORD *)&self->_principalPoint[4] = v16;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PixelSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "floatValue");
    self->_pixelSize = v19;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DistortionCalibrationValidMaxRadiusInPixels"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("X"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LensDistortionCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Y"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LensDistortionCoefficients"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("InverseLensDistortionCoefficients"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v20)
      v28 = v22 == 0;
    else
      v28 = 1;
    v31 = v28 || v24 == 0 || v25 == 0 || v26 == 0;
    v32 = !v31;
    self->_hasGeometricDistortionCalibration = v32;
    if (v31)
    {
      self->_geometricDistortionCalibrationMaxRadius = 0;
      forwardGeometricDistortionPolynomial = self->_forwardGeometricDistortionPolynomial;
      *(_QWORD *)&self->_geometricDistortionCenter[4] = 0;
      self->_forwardGeometricDistortionPolynomial = 0;

      inverseGeometricDistortionPolynomial = self->_inverseGeometricDistortionPolynomial;
      self->_inverseGeometricDistortionPolynomial = 0;

      if (((-[NSString isEqual:](self->_portType, "isEqual:", *MEMORY[0x1E0D05A50]) & 1) != 0
         || -[NSString isEqual:](self->_portType, "isEqual:", *MEMORY[0x1E0D05A28]))
        && !self->_hasGeometricDistortionCalibration)
      {
        v37 = 4;
        goto LABEL_26;
      }
    }
    else
    {
      self->_geometricDistortionCalibrationMaxRadius = objc_msgSend(v20, "intValue");
      objc_msgSend(v22, "floatValue");
      *(_DWORD *)&self->_geometricDistortionCenter[4] = v33;
      objc_msgSend(v24, "floatValue");
      *(_DWORD *)&self->_geometricDistortionCenter[8] = v34;
      objc_storeStrong((id *)&self->_forwardGeometricDistortionPolynomial, v25);
      objc_storeStrong((id *)&self->_inverseGeometricDistortionPolynomial, v27);
    }
    v37 = 0;
LABEL_26:

    v38 = 0;
    v13 = v42;
    goto LABEL_27;
  }
  v37 = 4;
  v38 = -1;
LABEL_27:

  if (!v37)
    self->_modelState = 7;
LABEL_29:

  return v38;
}

- (void)setSensorSize:(VCCamera *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_sensorSize[4] = v2;
  self->_modelState |= 1u;
}

- (void)setFocalLength:(VCCamera *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_focalLength[4] = v2;
  self->_modelState |= 1u;
}

- (void)setPrincipalPoint:(VCCamera *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_principalPoint[4] = v2;
  self->_modelState |= 1u;
}

- (void)setPixelSize:(float)a3
{
  self->_pixelSize = a3;
  self->_modelState |= 1u;
}

- (void)setZoomFactor:(float)a3
{
  self->_zoomFactor = a3;
  self->_modelState |= 1u;
}

- (float)fov
{
  float32x2_t v2;
  float v3;
  float v4;
  float v5;
  float result;
  float v7;
  float v8;

  v2 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  v7 = v2.f32[1];
  LODWORD(v8) = HIDWORD(*(_QWORD *)&self->_focalLength[4]);
  v3 = atan2f(v2.f32[0], COERCE_FLOAT(*(_QWORD *)&self->_focalLength[4]));
  v4 = v3 + v3;
  v5 = atan2f(v7, v8);
  result = v5 + v5;
  if (v4 > result)
    return v4;
  return result;
}

- (void)setFov:(float)a3
{
  float32x2_t v4;

  v4 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)&self->_focalLength[4] = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], (float)(fmaxf(v4.f32[0], v4.f32[1]) / tanf(a3 * 0.5))/ fmaxf(COERCE_FLOAT(*(_QWORD *)&self->_focalLength[4]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_focalLength[4]))));
  self->_modelState |= 1u;
}

- (float)zoomFOV
{
  float32x2_t v2;
  float32x2_t v3;
  float v4;
  float v5;
  float v6;
  float result;
  float v8;
  float v9;

  v2 = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], self->_zoomFactor);
  v3 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  v8 = v3.f32[1];
  v9 = v2.f32[1];
  v4 = atan2f(v3.f32[0], v2.f32[0]);
  v5 = v4 + v4;
  v6 = atan2f(v8, v9);
  result = v6 + v6;
  if (v5 > result)
    return v5;
  return result;
}

- (void)setZoomFOV:(float)a3
{
  float32x2_t v4;
  float v5;
  float v6;
  float zoomFactor;
  float32x2_t v8;

  v4 = vmul_f32(*(float32x2_t *)&self->_sensorSize[4], (float32x2_t)0x3F0000003F000000);
  v5 = fmaxf(v4.f32[0], v4.f32[1]);
  v6 = tanf(a3 * 0.5);
  zoomFactor = self->_zoomFactor;
  v8 = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], zoomFactor);
  self->_zoomFactor = zoomFactor * (float)((float)(v5 / v6) / fmaxf(v8.f32[0], v8.f32[1]));
  self->_modelState |= 1u;
}

- (__n128)intrinsicMatrix
{
  -[__n128 _updateModelIntrinsicProperties](a1, "_updateModelIntrinsicProperties");
  return a1[2];
}

- (void)_updateModelIntrinsicProperties
{
  int32x4_t v2;
  int32x4_t v4;
  int32x4_t v5;
  simd_float3x3 v11;
  simd_float3x3 v12;

  *(float32x2_t *)v4.i8 = vmul_n_f32(*(float32x2_t *)&self->_focalLength[4], self->_zoomFactor);
  v11.columns[0] = (simd_float3)v4.u32[0];
  v5 = vdupq_lane_s32(*(int32x2_t *)v4.i8, 1);
  v4.i32[1] = 0;
  v4.i64[1] = *(_QWORD *)&self->_principalPoint[4];
  __asm { FMOV            V5.4S, #1.0 }
  *(int32x2_t *)v2.i8 = vdup_lane_s32((int32x2_t)v4.u64[1], 1);
  v11.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v4, _Q5), v2);
  v11.columns[1] = (simd_float3)vzip2q_s32((int32x4_t)v4.u32[0], v5);
  v11.columns[1].i32[3] = 0;
  v11.columns[2].i32[3] = 0;
  *(_QWORD *)self->_anon_10 = *(_QWORD *)&self->_sensorSize[4];
  *(_OWORD *)&self->_anon_10[16] = v11.columns[0].u32[0];
  *(simd_float3 *)&self->_anon_10[32] = v11.columns[1];
  *(simd_float3 *)&self->_anon_10[48] = v11.columns[2];
  v12 = __invert_f3(v11);
  *(_DWORD *)&self->_anon_10[72] = v12.columns[0].i32[2];
  *(_DWORD *)&self->_anon_10[88] = v12.columns[1].i32[2];
  *(_QWORD *)&self->_anon_10[64] = v12.columns[0].i64[0];
  *(_QWORD *)&self->_anon_10[80] = v12.columns[1].i64[0];
  *(_DWORD *)&self->_anon_10[104] = v12.columns[2].i32[2];
  *(_QWORD *)&self->_anon_10[96] = v12.columns[2].i64[0];
  *(float *)&self->_anon_10[112] = self->_pixelSize * self->_pixelSize;
  self->_modelState &= ~1u;
}

- (void)setRotation:(VCCamera *)self
{
  __int128 v2;

  *(_OWORD *)self->_rotation = v2;
  self->_modelState |= 2u;
}

- (void)setTranslation:(VCCamera *)self
{
  __int128 v2;

  *(_OWORD *)self->_translation = v2;
  self->_modelState |= 2u;
}

- (__n128)extrinsicMatrix
{
  -[__n128 _updateModelExtrinsicProperties](a1, "_updateModelExtrinsicProperties");
  return a1[9];
}

- (__n128)rotationMatrix
{
  -[__n128 _updateModelExtrinsicProperties](a1, "_updateModelExtrinsicProperties");
  return a1[9];
}

- (void)_updateModelExtrinsicProperties
{
  __float2 v3;
  __float2 v4;
  float32x4_t v5;
  int32x4_t v6;
  int8x16_t v7;
  float32x4_t v8;
  float32x4_t v9;
  __float2 v10;
  float32x4_t v11;
  int8x16_t v13;
  simd_float4 v23;
  float32x2_t v24;
  float v25;
  simd_float4 v26;
  float32x2_t v27;
  float32x2_t v31;
  simd_float4 v32;
  float32x4_t v33;
  simd_float4 v34;
  float32x4_t v35;
  simd_float4 v36;
  float32x4_t v37;
  simd_float4 v38;
  simd_float4x4 v39;

  v37 = *(float32x4_t *)self->_rotation;
  v3 = __sincosf_stret(0.5 * v37.f32[0]);
  v33 = vmulq_n_f32((float32x4_t)xmmword_1D4E43A80, v3.__sinval);
  v4 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)v37.f32, 1));
  v5 = vmulq_n_f32((float32x4_t)xmmword_1D4E43A90, v4.__sinval);
  v5.i32[3] = LODWORD(v4.__cosval);
  v6 = (int32x4_t)vnegq_f32(v5);
  v7 = (int8x16_t)vtrn2q_s32((int32x4_t)v5, vtrn1q_s32((int32x4_t)v5, v6));
  v8 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v5, (int8x16_t)v6, 8uLL), *(float32x2_t *)v33.f32, 1), (float32x4_t)vextq_s8(v7, v7, 8uLL), v33.f32[0]);
  v9 = (float32x4_t)vrev64q_s32((int32x4_t)v5);
  v9.i32[0] = v6.i32[1];
  v9.i32[3] = v6.i32[2];
  v35 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v5, v3.__cosval), v9, v33, 2), v8);
  v10 = __sincosf_stret(vmuls_lane_f32(0.5, v37, 2));
  v11 = vmulq_n_f32((float32x4_t)xmmword_1D4E43AA0, v10.__sinval);
  v11.i32[3] = LODWORD(v10.__cosval);
  _Q1 = (int32x4_t)vnegq_f32(v11);
  v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v11, vtrn1q_s32((int32x4_t)v11, _Q1));
  _Q3 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)_Q1, 8uLL), *(float32x2_t *)v35.f32, 1), (float32x4_t)vextq_s8(v13, v13, 8uLL), v35.f32[0]);
  v39.columns[2] = (simd_float4)vrev64q_s32((int32x4_t)v11);
  v39.columns[2].i32[0] = _Q1.i32[1];
  v39.columns[2].i32[3] = _Q1.i32[2];
  _Q0 = vaddq_f32(_Q3, vmlaq_laneq_f32(vmulq_laneq_f32(v11, v35, 3), (float32x4_t)v39.columns[2], v35, 2));
  _Q1.i32[0] = _Q0.i32[1];
  v39.columns[2].i32[0] = _Q0.i32[2];
  __asm { FMLS            S5, S2, V0.S[2] }
  _S4 = _Q0.i32[3];
  __asm { FMLA            S5, S4, V0.S[3] }
  v23 = _Q5;
  _Q5.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q0.f32[2], _Q0, 3), _Q0.f32[1], _Q0.f32[0]);
  v24.f32[0] = vmuls_lane_f32(_Q0.f32[1], _Q0, 3);
  v25 = vmlas_n_f32(-(float)(_Q0.f32[1] * _Q0.f32[3]), _Q0.f32[2], _Q0.f32[0]);
  v23.f32[1] = _Q5.f32[0] + _Q5.f32[0];
  v23.f32[2] = v25 + v25;
  _Q5.f32[0] = vmlas_n_f32(-(float)(_Q0.f32[2] * _Q0.f32[3]), _Q0.f32[1], _Q0.f32[0]);
  v26.f32[0] = _Q5.f32[0] + _Q5.f32[0];
  __asm
  {
    FMLA            S3, S1, V0.S[1]
    FMLA            S3, S4, V0.S[3]
    FMLS            S3, S0, V0.S[0]
    FMLA            S5, S2, V0.S[1]
  }
  v26.i32[1] = _Q3.i32[0];
  v26.f32[2] = _Q5.f32[0] + _Q5.f32[0];
  _Q3.f32[0] = -(float)(_Q0.f32[0] * _Q0.f32[3]);
  _Q5.i64[0] = vextq_s8((int8x16_t)_Q0, (int8x16_t)_Q0, 8uLL).u64[0];
  v27 = (float32x2_t)vzip1_s32(*(int32x2_t *)_Q0.f32, *(int32x2_t *)_Q5.f32);
  __asm
  {
    FMLA            S4, S2, V0.S[2]
    FMLS            S4, S0, V0.S[0]
    FMLS            S4, S1, V0.S[1]
  }
  _Q0.i32[0] = _Q5.i32[0];
  v24.i32[1] = _Q3.i32[0];
  v31 = vmla_f32(v24, v27, *(float32x2_t *)_Q0.f32);
  *(float32x2_t *)v39.columns[2].f32 = vadd_f32(v31, v31);
  v39.columns[2].i32[2] = _S4;
  v39.columns[3] = *(simd_float4 *)self->_translation;
  v39.columns[0] = v23;
  v39.columns[0].i32[3] = *(_DWORD *)(MEMORY[0x1E0C83FF0] + 12);
  v39.columns[1] = v26;
  v39.columns[1].i32[3] = *(_DWORD *)(MEMORY[0x1E0C83FF0] + 28);
  v36 = v39.columns[1];
  v38 = v39.columns[0];
  v39.columns[2].i32[3] = *(_DWORD *)(MEMORY[0x1E0C83FF0] + 44);
  v39.columns[3].i32[3] = *(_DWORD *)(MEMORY[0x1E0C83FF0] + 60);
  v32 = v39.columns[3];
  v34 = v39.columns[2];
  *(simd_float4x4 *)&self->_anon_10[128] = __invert_f4(v39);
  *(simd_float4 *)&self->_anon_10[192] = v38;
  *(simd_float4 *)&self->_anon_10[208] = v36;
  *(simd_float4 *)&self->_anon_10[224] = v34;
  *(simd_float4 *)&self->_anon_10[240] = v32;
  self->_modelState &= ~2u;
}

- (void)setGeometricDistortionCalibrationMaxRadius:(int)a3
{
  self->_geometricDistortionCalibrationMaxRadius = a3;
  self->_modelState |= 4u;
}

- (void)setGeometricDistortionCenter:(VCCamera *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_geometricDistortionCenter[4] = v2;
  self->_modelState |= 4u;
}

- (void)setForwardGeometricDistortionPolynomial:(id)a3
{
  objc_storeStrong((id *)&self->_forwardGeometricDistortionPolynomial, a3);
  self->_modelState |= 4u;
}

- (void)setInverseGeometricDistortionPolynomial:(id)a3
{
  objc_storeStrong((id *)&self->_inverseGeometricDistortionPolynomial, a3);
  self->_modelState |= 4u;
}

- (void)_updateModelDistortionProperties
{
  uint64_t v3;
  int geometricDistortionCalibrationMaxRadius;
  float v5;
  unsigned int v6;

  self->_anon_10[256] = self->_hasGeometricDistortionCalibration;
  *(_QWORD *)&self->_anon_10[264] = *(_QWORD *)&self->_geometricDistortionCenter[4];
  __44__VCCamera__updateModelDistortionProperties__block_invoke((uint64_t)self, self->_forwardGeometricDistortionPolynomial, &self->_anon_10[276]);
  __44__VCCamera__updateModelDistortionProperties__block_invoke(v3, self->_inverseGeometricDistortionPolynomial, &self->_anon_10[312]);
  geometricDistortionCalibrationMaxRadius = self->_geometricDistortionCalibrationMaxRadius;
  v5 = *(float *)&self->_anon_10[112]
     * (float)(geometricDistortionCalibrationMaxRadius * geometricDistortionCalibrationMaxRadius);
  v6 = vcvtms_s32_f32((float)(1.0/ (float)((float)((float)(*(float *)&self->_anon_10[276]+ (float)((float)(*(float *)&self->_anon_10[280]+ (float)((float)(*(float *)&self->_anon_10[284]+ (float)((float)(*(float *)&self->_anon_10[288]+ (float)((float)(*(float *)&self->_anon_10[292] + (float)((float)(*(float *)&self->_anon_10[296] + (float)((float)(*(float *)&self->_anon_10[300] + (float)((float)(*(float *)&self->_anon_10[304] + (float)(v5 * 0.0)) * v5)) * v5)) * v5))* v5))* v5))* v5))* v5))* 0.01)+ 1.0))* (float)geometricDistortionCalibrationMaxRadius);
  *(_DWORD *)&self->_anon_10[272] = geometricDistortionCalibrationMaxRadius;
  *(_DWORD *)&self->_anon_10[308] = v6;
  self->_modelState &= ~4u;
}

void __44__VCCamera__updateModelDistortionProperties__block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v4;

  v4 = a2;
  if (v4 && objc_msgSend(v4, "length") == 32)
  {
    objc_msgSend(v4, "getBytes:length:", a3, 32);
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }

}

- (void)setStereographicFisheyeStrength:(float)a3
{
  self->_stereographicFisheyeStrength = a3;
  self->_modelState |= 8u;
}

- (void)_updateModelFisheyeProperties
{
  *(float *)&self->_anon_10[344] = self->_stereographicFisheyeStrength;
  self->_modelState &= ~8u;
}

- (VCCamera)initWithDictionary:(id)a3
{
  id v4;
  VCCamera *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int128 v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  __int128 v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  unsigned int v44;
  NSData *v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  int v49;
  NSData *forwardGeometricDistortionPolynomial;
  NSData *v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  int v55;
  NSData *inverseGeometricDistortionPolynomial;
  float v57;
  void *v58;
  VCCamera *v59;
  int v61;
  int v62;
  __int128 v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  objc_super v68;

  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)VCCamera;
  v5 = -[VCCamera init](&v68, sel_init);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SensorSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 2)
    goto LABEL_53;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v64 = v9;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  *(_QWORD *)&v5->_sensorSize[4] = __PAIR64__(v11, v64);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FocalLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 2)
    goto LABEL_53;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v65 = v13;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  *(_QWORD *)&v5->_focalLength[4] = __PAIR64__(v15, v65);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PrincipalPoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 2)
    goto LABEL_53;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v66 = v17;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  *(_QWORD *)&v5->_principalPoint[4] = __PAIR64__(v19, v66);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PixelSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  objc_msgSend(v6, "floatValue");
  v5->_pixelSize = v20;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ZoomFactor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_54:
    v6 = 0;
LABEL_55:
    v59 = 0;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_56:
    v59 = 0;
    v6 = v21;
    goto LABEL_52;
  }
  objc_msgSend(v21, "floatValue");
  v5->_zoomFactor = v22;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Translation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 3)
    goto LABEL_53;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  *(_QWORD *)&v63 = v24;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v61 = v26;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v28 = v63;
  DWORD1(v28) = v61;
  DWORD2(v28) = v29;
  *(_OWORD *)v5->_translation = v28;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Rotation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 3)
    goto LABEL_53;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  *(_QWORD *)&v63 = v31;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "floatValue");
  v62 = v33;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  v35 = v63;
  DWORD1(v35) = v62;
  DWORD2(v35) = v36;
  *(_OWORD *)v5->_rotation = v35;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCalibrationMaxRadius"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
LABEL_42:
    v5->_hasGeometricDistortionCalibration = 0;
    goto LABEL_43;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCenter"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ForwardGeometricDistortionPolynomial"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {

    goto LABEL_41;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InverseGeometricDistortionPolynomial"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
    goto LABEL_42;
  v5->_hasGeometricDistortionCalibration = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCalibrationMaxRadius"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v5->_geometricDistortionCalibrationMaxRadius = objc_msgSend(v6, "intValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GeometricDistortionCenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_54;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_56;
  v7 = v21;
  if (objc_msgSend(v7, "count") != 2)
    goto LABEL_53;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "floatValue");
  v67 = v42;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  *(_QWORD *)&v5->_geometricDistortionCenter[4] = __PAIR64__(v44, v67);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ForwardGeometricDistortionPolynomial"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 8)
    goto LABEL_53;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v45 = (NSData *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v46 = -[NSData mutableBytes](v45, "mutableBytes");
  for (i = 0; i != 8; ++i)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "floatValue");
    *(_DWORD *)(v46 + 4 * i) = v49;

  }
  forwardGeometricDistortionPolynomial = v5->_forwardGeometricDistortionPolynomial;
  v5->_forwardGeometricDistortionPolynomial = v45;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("InverseGeometricDistortionPolynomial"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  v7 = v6;
  if (objc_msgSend(v7, "count") != 8)
  {
LABEL_53:

    v59 = 0;
    v6 = v7;
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v51 = (NSData *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v52 = -[NSData mutableBytes](v51, "mutableBytes");
  for (j = 0; j != 8; ++j)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", j);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "floatValue");
    *(_DWORD *)(v52 + 4 * j) = v55;

  }
  inverseGeometricDistortionPolynomial = v5->_inverseGeometricDistortionPolynomial;
  v5->_inverseGeometricDistortionPolynomial = v51;

LABEL_43:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StereographicFisheyeStrength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_55;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_55;
  objc_msgSend(v6, "floatValue");
  v5->_stereographicFisheyeStrength = v57;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PortType"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_portType, v58);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SensorID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5->_sensorID = objc_msgSend(v6, "intValue");
  }
  v5->_modelState = 15;
  v59 = v5;
LABEL_52:

  return v59;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  _DWORD *v40;
  void *v41;
  double v42;
  uint64_t i;
  void *v44;
  _DWORD *v45;
  void *v46;
  double v47;
  uint64_t j;
  void *v49;
  void *v50;
  NSString *portType;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v56[2];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];

  v61[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&self->_sensorSize[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v4;
  LODWORD(v5) = *(_DWORD *)self->_focalLength;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SensorSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&self->_focalLength[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v8;
  LODWORD(v9) = *(_DWORD *)self->_principalPoint;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("FocalLength"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&self->_principalPoint[4]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v12;
  LODWORD(v13) = *(_DWORD *)self->_geometricDistortionCenter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PrincipalPoint"));

  *(float *)&v16 = self->_pixelSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("PixelSize"));

  *(float *)&v18 = self->_zoomFactor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("ZoomFactor"));

  LODWORD(v20) = *(_DWORD *)self->_translation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v21;
  LODWORD(v22) = *(_DWORD *)&self->_translation[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v23;
  LODWORD(v24) = *(_DWORD *)&self->_translation[8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("Translation"));

  LODWORD(v27) = *(_DWORD *)self->_rotation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v28;
  LODWORD(v29) = *(_DWORD *)&self->_rotation[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v30;
  LODWORD(v31) = *(_DWORD *)&self->_rotation[8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("Rotation"));

  if (self->_hasGeometricDistortionCalibration)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_geometricDistortionCalibrationMaxRadius);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("GeometricDistortionCalibrationMaxRadius"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&self->_geometricDistortionCenter[4]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v36;
    LODWORD(v37) = *(_DWORD *)&self->_geometricDistortionCenter[8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("GeometricDistortionCenter"));

    v40 = -[NSData bytes](self->_forwardGeometricDistortionPolynomial, "bytes");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 8; ++i)
    {
      LODWORD(v42) = v40[i];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:atIndexedSubscript:", v44, i);

    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("ForwardGeometricDistortionPolynomial"));
    v45 = -[NSData bytes](self->_inverseGeometricDistortionPolynomial, "bytes");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j != 8; ++j)
    {
      LODWORD(v47) = v45[j];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setObject:atIndexedSubscript:", v49, j);

    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("InverseGeometricDistortionPolynomial"));

  }
  *(float *)&v34 = self->_stereographicFisheyeStrength;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("StereographicFisheyeStrength"));

  portType = self->_portType;
  if (portType)
  {
    v52 = (void *)-[NSString copy](portType, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("PortType"));

  }
  if (self->_sensorID)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("SensorID"));

  }
  v54 = (void *)objc_msgSend(v3, "copy");

  return v54;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCCamera *v4;

  v4 = objc_alloc_init(VCCamera);
  *(_QWORD *)&v4->_sensorSize[4] = *(_QWORD *)&self->_sensorSize[4];
  *(_QWORD *)&v4->_focalLength[4] = *(_QWORD *)&self->_focalLength[4];
  *(_QWORD *)&v4->_principalPoint[4] = *(_QWORD *)&self->_principalPoint[4];
  v4->_pixelSize = self->_pixelSize;
  v4->_zoomFactor = self->_zoomFactor;
  *(_OWORD *)v4->_rotation = *(_OWORD *)self->_rotation;
  *(_OWORD *)v4->_translation = *(_OWORD *)self->_translation;
  v4->_geometricDistortionCalibrationMaxRadius = self->_geometricDistortionCalibrationMaxRadius;
  *(_QWORD *)&v4->_geometricDistortionCenter[4] = *(_QWORD *)&self->_geometricDistortionCenter[4];
  objc_storeStrong((id *)&v4->_forwardGeometricDistortionPolynomial, self->_forwardGeometricDistortionPolynomial);
  objc_storeStrong((id *)&v4->_inverseGeometricDistortionPolynomial, self->_inverseGeometricDistortionPolynomial);
  v4->_stereographicFisheyeStrength = self->_stereographicFisheyeStrength;
  objc_storeStrong((id *)&v4->_portType, self->_portType);
  v4->_sensorID = self->_sensorID;
  memcpy(v4->_anon_10, self->_anon_10, 0x164uLL);
  return v4;
}

- ($48BDB0EB98AEC2D0F54B28454E2FA856)model
{
  -[VCCamera _updateModel](self, "_updateModel");
  return ($48BDB0EB98AEC2D0F54B28454E2FA856 *)self->_anon_10;
}

- (void)_updateModel
{
  unsigned int modelState;

  modelState = self->_modelState;
  if (!modelState)
    return;
  if ((modelState & 1) == 0)
  {
    if ((modelState & 2) == 0)
      goto LABEL_4;
LABEL_8:
    -[VCCamera _updateModelExtrinsicProperties](self, "_updateModelExtrinsicProperties");
    modelState = self->_modelState;
    if ((modelState & 4) == 0)
    {
LABEL_5:
      if ((modelState & 8) == 0)
        return;
LABEL_10:
      -[VCCamera _updateModelFisheyeProperties](self, "_updateModelFisheyeProperties");
      return;
    }
    goto LABEL_9;
  }
  -[VCCamera _updateModelIntrinsicProperties](self, "_updateModelIntrinsicProperties");
  modelState = self->_modelState;
  if ((modelState & 2) != 0)
    goto LABEL_8;
LABEL_4:
  if ((modelState & 4) == 0)
    goto LABEL_5;
LABEL_9:
  -[VCCamera _updateModelDistortionProperties](self, "_updateModelDistortionProperties");
  if ((self->_modelState & 8) != 0)
    goto LABEL_10;
}

- (id)description
{
  void *v3;
  float v4;
  float v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("VCCamera<%p> {\n"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("  sensorSize  : %g x %g           \n"), COERCE_FLOAT(*(_QWORD *)&self->_sensorSize[4]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_sensorSize[4])));
  -[VCCamera fov](self, "fov");
  objc_msgSend(v3, "appendFormat:", CFSTR("  FOV         : %g deg            \n"), v4 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  zoomFactor  : %g                \n"), self->_zoomFactor);
  -[VCCamera zoomFOV](self, "zoomFOV");
  objc_msgSend(v3, "appendFormat:", CFSTR("  zoomedFOV   : %g deg            \n"), v5 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  rotation    : %6.2f %6.2f %6.2f \n"), *(float *)self->_rotation, *(float *)&self->_rotation[4], *(float *)&self->_rotation[8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("  translation : %6.2f %6.2f %6.2f \n"), *(float *)self->_translation, *(float *)&self->_translation[4], *(float *)&self->_translation[8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("  portType    : %@                \n"), self->_portType);
  objc_msgSend(v3, "appendFormat:", CFSTR("  sensorID    : 0x%x              \n"), self->_sensorID);
  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return v3;
}

- (id)debugDescription
{
  void *v3;
  float v4;
  float v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("VCCamera<%p> {\n"), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("  sensorSize     : %g x %g \n"), COERCE_FLOAT(*(_QWORD *)&self->_sensorSize[4]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_sensorSize[4])));
  objc_msgSend(v3, "appendFormat:", CFSTR("  principalPoint : %g , %g \n"), COERCE_FLOAT(*(_QWORD *)&self->_principalPoint[4]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_principalPoint[4])));
  objc_msgSend(v3, "appendFormat:", CFSTR("  focalLength    : %g , %g \n"), COERCE_FLOAT(*(_QWORD *)&self->_focalLength[4]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_focalLength[4])));
  objc_msgSend(v3, "appendFormat:", CFSTR("  pixelSize      : %g      \n"), self->_pixelSize);
  -[VCCamera fov](self, "fov");
  objc_msgSend(v3, "appendFormat:", CFSTR("  FOV            : %g deg  \n"), v4 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("  zoomFactor     : %g      \n"), self->_zoomFactor);
  -[VCCamera zoomFOV](self, "zoomFOV");
  objc_msgSend(v3, "appendFormat:", CFSTR("  zoomedFOV      : %g deg  \n"), v5 / 3.14159265 * 180.0);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  rotation       : %6.2f %6.2f %6.2f \n"), *(float *)self->_rotation, *(float *)&self->_rotation[4], *(float *)&self->_rotation[8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("  translation    : %6.2f %6.2f %6.2f \n"), *(float *)self->_translation, *(float *)&self->_translation[4], *(float *)&self->_translation[8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  geometricDistortionCalibrationMaxRadius : %d          \n"), self->_geometricDistortionCalibrationMaxRadius);
  objc_msgSend(v3, "appendFormat:", CFSTR("  geometricDistortionCalibrationCenter    : <%.2f %.2f> \n"), COERCE_FLOAT(*(_QWORD *)&self->_geometricDistortionCenter[4]), COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_geometricDistortionCenter[4])));
  objc_msgSend(v3, "appendFormat:", CFSTR("  forwardGeometricDistortionPolynomial    : %@          \n"), self->_forwardGeometricDistortionPolynomial);
  objc_msgSend(v3, "appendFormat:", CFSTR("  inverseGeometricDistortionPolynomial    : %@          \n"), self->_inverseGeometricDistortionPolynomial);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  stereographicFisheyeStrength : %.2f \n"), self->_stereographicFisheyeStrength);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  portType : %@   \n"), self->_portType);
  objc_msgSend(v3, "appendFormat:", CFSTR("  sensorID : 0x%x \n"), self->_sensorID);
  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  return v3;
}

- (double)sensorSize
{
  return *(double *)(a1 + 400);
}

- (double)focalLength
{
  return *(double *)(a1 + 408);
}

- (double)principalPoint
{
  return *(double *)(a1 + 416);
}

- (float)pixelSize
{
  return self->_pixelSize;
}

- (float)zoomFactor
{
  return self->_zoomFactor;
}

- (__n128)rotation
{
  return a1[29];
}

- (__n128)translation
{
  return a1[30];
}

- (BOOL)hasGeometricDistortionCalibration
{
  return self->_hasGeometricDistortionCalibration;
}

- (void)setHasGeometricDistortionCalibration:(BOOL)a3
{
  self->_hasGeometricDistortionCalibration = a3;
}

- (int)geometricDistortionCalibrationMaxRadius
{
  return self->_geometricDistortionCalibrationMaxRadius;
}

- (double)geometricDistortionCenter
{
  return *(double *)(a1 + 424);
}

- (NSData)forwardGeometricDistortionPolynomial
{
  return self->_forwardGeometricDistortionPolynomial;
}

- (NSData)inverseGeometricDistortionPolynomial
{
  return self->_inverseGeometricDistortionPolynomial;
}

- (float)stereographicFisheyeStrength
{
  return self->_stereographicFisheyeStrength;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
  objc_storeStrong((id *)&self->_portType, a3);
}

- (int)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_inverseGeometricDistortionPolynomial, 0);
  objc_storeStrong((id *)&self->_forwardGeometricDistortionPolynomial, 0);
}

@end
