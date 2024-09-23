@implementation ARCamera

- (ARCamera)init
{
  return -[ARCamera initWithIntrinsics:imageResolution:](self, "initWithIntrinsics:imageResolution:", *MEMORY[0x1E0C83FE8], *(double *)(MEMORY[0x1E0C83FE8] + 16), *(double *)(MEMORY[0x1E0C83FE8] + 32), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (uint64_t)initWithIntrinsics:(double)a3 imageResolution:(double)a4
{
  void *v9;
  uint64_t v10;
  _OWORD v15[2];

  v9 = (void *)objc_opt_new();
  memset(v15, 0, sizeof(v15));
  v10 = objc_msgSend(a1, "initWithIntrinsics:imageResolution:devicePosition:lensType:radialDistortion:tangentialDistortion:exposureDuration:calibrationData:extrinsicsMap:", 0, 0, v15, 0, v9, a2, a3, a4, a5, a6, 0.0, 0.0);

  return v10;
}

- (ARCamera)initWithIntrinsics:(__n128)a3 imageResolution:(__n128)a4 devicePosition:(CGFloat)a5 lensType:(CGFloat)a6 radialDistortion:(__n128)a7 tangentialDistortion:(double)a8 exposureDuration:(uint64_t)a9 calibrationData:(int64_t)a10 extrinsicsMap:(unint64_t)a11
{
  id v22;
  id v23;
  ARCamera *v24;
  ARCamera *v25;
  uint64_t v26;
  NSDictionary *extrinsicsMap;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v33;
  __int128 v35;
  objc_super v38;

  v35 = a12[1];
  v33 = *a12;
  v22 = a13;
  v23 = a14;
  v38.receiver = a1;
  v38.super_class = (Class)ARCamera;
  v24 = -[ARCamera init](&v38, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_imageResolution.width = a5;
    v24->_imageResolution.height = a6;
    *(__n128 *)&v24->_anon_90[16] = a3;
    *(__n128 *)&v24->_anon_90[32] = a4;
    v24->_lensType = a11;
    v24->_devicePosition = a10;
    *(_OWORD *)&v24->_radialDistortion[16] = v35;
    *(__n128 *)v24->_anon_90 = a2;
    *(__n128 *)v24->_tangentialDistortion = a7;
    *(_OWORD *)v24->_radialDistortion = v33;
    v24->_exposureDuration = a8;
    objc_storeStrong((id *)&v24->_calibrationData, a13);
    v26 = objc_msgSend(v23, "copy");
    extrinsicsMap = v25->_extrinsicsMap;
    v25->_extrinsicsMap = (NSDictionary *)v26;

    v28 = MEMORY[0x1E0C83FF0];
    v29 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *(_OWORD *)&v25[1].super.isa = *MEMORY[0x1E0C83FF0];
    *(_OWORD *)&v25[1]._trackingState = v29;
    v30 = *(_OWORD *)(v28 + 48);
    *(_OWORD *)&v25[1]._exposureDuration = *(_OWORD *)(v28 + 32);
    *(_OWORD *)&v25[1]._lensType = v30;
    v25->_trackingState = 0;
    v25->_trackingStateReason = 0;
  }

  return v25;
}

- (ARCamera)initWithCoder:(id)a3
{
  id v4;
  ARCamera *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  float v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *extrinsicsMap;

  v4 = a3;
  v5 = -[ARCamera init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeSizeForKey:", CFSTR("imageResolution"));
    v5->_imageResolution.width = v6;
    v5->_imageResolution.height = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("exposureDuration"));
    v5->_exposureDuration = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("exposureOffset"));
    v5->_exposureOffset = v9;
    objc_msgSend(v4, "ar_decodeMatrix3x3ForKey:", CFSTR("intrinsics"));
    *(_DWORD *)&v5->_anon_90[8] = v10;
    *(_QWORD *)v5->_anon_90 = v11;
    *(_DWORD *)&v5->_anon_90[24] = v12;
    *(_QWORD *)&v5->_anon_90[16] = v13;
    *(_DWORD *)&v5->_anon_90[40] = v14;
    *(_QWORD *)&v5->_anon_90[32] = v15;
    v5->_lensType = 0;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", CFSTR("transform"));
    *(_OWORD *)&v5[1].super.isa = v16;
    *(_OWORD *)&v5[1]._trackingState = v17;
    *(_OWORD *)&v5[1]._exposureDuration = v18;
    *(_OWORD *)&v5[1]._lensType = v19;
    v5->_trackingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trackingState"));
    v5->_trackingStateReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trackingStateReason"));
    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("extrinsicsMap"));
    v24 = objc_claimAutoreleasedReturnValue();
    extrinsicsMap = v5->_extrinsicsMap;
    v5->_extrinsicsMap = (NSDictionary *)v24;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  double height;
  double v6;
  id v7;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  v7 = a3;
  objc_msgSend(v7, "encodeSize:forKey:", CFSTR("imageResolution"), width, height);
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("exposureDuration"), self->_exposureDuration);
  *(float *)&v6 = self->_exposureOffset;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("exposureOffset"), v6);
  objc_msgSend(v7, "ar_encodeMatrix3x3:forKey:", CFSTR("intrinsics"), *(double *)self->_anon_90, *(double *)&self->_anon_90[16], *(double *)&self->_anon_90[32]);
  objc_msgSend(v7, "ar_encodeMatrix4x4:forKey:", CFSTR("transform"), *(double *)&self[1].super.isa, *(double *)&self[1]._trackingState, self[1]._exposureDuration, *(double *)&self[1]._lensType);
  objc_msgSend(v7, "encodeInteger:forKey:", self->_trackingState, CFSTR("trackingState"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_trackingStateReason, CFSTR("trackingStateReason"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_extrinsicsMap, CFSTR("extrinsicsMap"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (simd_float3)eulerAngles
{
  __n128 v2;
  __n128 v3;
  __n128 v4;
  simd_float3 result;

  -[ARCamera transform](self, "transform");
  *(double *)result.i64 = AREulerAnglesFromMatrix(v2, v3, v4);
  return result;
}

- (CGPoint)focalLength
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(float *)self->_anon_90;
  v3 = *(float *)&self->_anon_90[20];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)principalPoint
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)&self->_anon_90[32]);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (double)displayCenterTransform
{
  double result;

  *(_QWORD *)&result = ARDisplayCenterTransformForCaptureDevicePosition(objc_msgSend(a1, "devicePosition")).n128_u64[0];
  return result;
}

- (simd_float4x4)projectionMatrix
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  simd_float4x4 result;

  -[ARCamera projectionMatrixForOrientation:viewportSize:zNear:zFar:](self, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", 3, self->_imageResolution.width, self->_imageResolution.height, 0.00100000005, 0.0);
  result.columns[3].i64[1] = v9;
  result.columns[3].i64[0] = v8;
  result.columns[2].i64[1] = v7;
  result.columns[2].i64[0] = v6;
  result.columns[1].i64[1] = v5;
  result.columns[1].i64[0] = v4;
  result.columns[0].i64[1] = v3;
  result.columns[0].i64[0] = v2;
  return result;
}

- (id)_description:(BOOL)a3
{
  _BOOL4 v3;
  int64_t trackingState;
  unint64_t trackingStateReason;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  double exposureDuration;
  double exposureOffset;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CGSize imageResolution;

  v3 = a3;
  trackingState = self->_trackingState;
  if (trackingState)
  {
    if (trackingState == 2)
    {
      v8 = CFSTR("Normal");
    }
    else if (trackingState == 1)
    {
      trackingStateReason = self->_trackingStateReason;
      if (trackingStateReason >= 5)
        v7 = CFSTR("Undefined");
      else
        v7 = off_1E6674460[trackingStateReason];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("Limited"), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("Undefined");
    }
  }
  else
  {
    v8 = CFSTR("NotAvailable");
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  imageResolution = self->_imageResolution;
  exposureDuration = self->_exposureDuration;
  exposureOffset = self->_exposureOffset;
  v14 = *(float *)self->_anon_90;
  v15 = *(float *)&self->_anon_90[20];
  v16 = COERCE_FLOAT(*(_OWORD *)&self->_anon_90[32]);
  v17 = COERCE_FLOAT(HIDWORD(*(_QWORD *)&self->_anon_90[32]));
  ARMatrix4x4Description(v3, *(__n128 *)&self[1].super.isa, *(__n128 *)&self[1]._trackingState, *(__n128 *)&self[1]._exposureDuration, *(__n128 *)&self[1]._lensType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p imageResolution=(%.f, %.f) exposureDuration=%.f exposureOffset=%.f focalLength=(%.03f, %.03f) principalPoint=(%.03f, %.03f) trackingState=%@ transform=%@>"), v11, self, imageResolution, *(_QWORD *)&exposureDuration, *(_QWORD *)&exposureOffset, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, v8, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)description
{
  return -[ARCamera _description:](self, "_description:", 0);
}

- (id)debugQuickLookObject
{
  return -[ARCamera _description:](self, "_description:", 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float32x4_t *v5;
  uint64_t *v6;
  BOOL v7;
  float32x4_t v8;
  uint32x4_t v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (float32x4_t *)v4;
    v6 = (uint64_t *)v5;
    v7 = self->_imageResolution.width == *(double *)&v5[4].i64[1]
      && self->_imageResolution.height == *(double *)v5[5].i64;
    v10 = v7
       && self->_exposureDuration == *(double *)v5[2].i64
       && self->_exposureOffset == v5->f32[2]
       && (v8.i64[0] = 0x3400000034000000,
           v8.i64[1] = 0x3400000034000000,
           v9 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_90[16], v5[10])), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)self->_anon_90, v5[9]))), (int8x16_t)vcgeq_f32(v8, vabdq_f32(*(float32x4_t *)&self->_anon_90[32], v5[11]))), v9.i32[3] = v9.i32[2], (vminvq_u32(v9) & 0x80000000) != 0)&& AREqualTransforms(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1]._trackingState, *(float32x4_t *)&self[1]._exposureDuration, *(float32x4_t *)&self[1]._lensType, v5[12], v5[13], v5[14], v5[15])&& self->_trackingState == v6[2]&& self->_trackingStateReason == v6[3]&& -[NSDictionary isEqualToDictionary:](self->_extrinsicsMap, "isEqualToDictionary:", v6[5]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGPoint)projectPoint:(simd_float3)point orientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize
{
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  float64x2_t v20;
  float64x2_t v22;
  double v23;
  float32x4_t v25;
  double width;
  double height;
  CGPoint result;

  width = viewportSize.width;
  height = viewportSize.height;
  -[ARCamera viewMatrixForOrientation:](self, "viewMatrixForOrientation:");
  v25 = vaddq_f32(v10, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, point.f32[0]), v8, *(float32x2_t *)point.f32, 1), v9, (float32x4_t)point, 2));
  -[ARCamera projectionMatrixForOrientation:viewportSize:zNear:zFar:](self, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", orientation, width, height, 0.000000100000001, 0.0);
  v15 = (int32x4_t)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v25.f32[0]), _Q1, *(float32x2_t *)v25.f32, 1), v13, v25, 2), v14, v25, 3);
  *(float32x2_t *)v15.i8 = vdiv_f32(*(float32x2_t *)v15.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2));
  __asm { FMOV            V1.2S, #1.0 }
  v13.i32[0] = vadd_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)_Q1.f32).u32[0];
  v13.i32[1] = vsub_f32(*(float32x2_t *)&_Q1, *(float32x2_t *)&v15).i32[1];
  v20 = vcvtq_f64_f32(*(float32x2_t *)v13.f32);
  *(double *)v13.i64 = width;
  *(double *)&v13.i64[1] = height;
  __asm { FMOV            V1.2D, #0.5 }
  v22 = vmulq_f64(vmulq_f64((float64x2_t)v13, v20), _Q1);
  v23 = v22.f64[1];
  result.x = v22.f64[0];
  result.y = v23;
  return result;
}

- (simd_float3)unprojectPoint:(CGPoint)point ontoPlaneWithTransform:(simd_float4x4)planeTransform orientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize
{
  float v8;
  float v9;
  float v10;
  __float2 v11;
  float32x4_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  int32x4_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  int8x16_t v35;
  float v36;
  float v37;
  float32x4_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  float v44;
  float32x4_t v45;
  float v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  _OWORD v50[4];
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  simd_float4x4 v55;
  simd_float4x4 v56;

  v39 = (float32x4_t)planeTransform.columns[3];
  v49 = (float32x4_t)planeTransform.columns[1];
  v8 = point.x / viewportSize.width;
  v46 = (float)(v8 * 2.0) + -1.0;
  v9 = point.y / viewportSize.height;
  v44 = (float)(v9 * -2.0) + 1.0;
  -[ARCamera projectionMatrixForOrientation:viewportSize:zNear:zFar:](self, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", viewportSize.width, viewportSize.height, 0.1, 0.0, *(double *)planeTransform.columns[2].i64);
  v56 = __invert_f4(v55);
  v47 = vaddq_f32((float32x4_t)v56.columns[3], vmlaq_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)v56.columns[0], v46), (float32x4_t)v56.columns[1], v44), (float32x4_t)0, (float32x4_t)v56.columns[2]));
  v45 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 3);
  v10 = (double)ARCameraToDisplayRotation(orientation) * 3.14159265 / 180.0;
  v11 = __sincosf_stret(v10 * 0.5);
  v12 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFF70, v11.__sinval);
  v12.i32[3] = LODWORD(v11.__cosval);
  *(double *)&v13 = simd_matrix4x4(v12);
  v42 = v14;
  v43 = v13;
  v40 = v16;
  v41 = v15;
  -[ARCamera transform](self, "transform");
  v21 = 0;
  v50[0] = v43;
  v50[1] = v42;
  v50[2] = v41;
  v50[3] = v40;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v51 + v21 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(v50[v21])), v18, *(float32x2_t *)&v50[v21], 1), v19, (float32x4_t)v50[v21], 2), v20, (float32x4_t)v50[v21], 3);
    ++v21;
  }
  while (v21 != 4);
  v22 = vdivq_f32(v47, v45);
  v48 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v51, v22.f32[0]), v52, *(float32x2_t *)v22.f32, 1), v53, v22, 2), v54, v22, 3);
  -[ARCamera transform](self, "transform");
  v24 = vsubq_f32(v48, v23);
  v25 = (int32x4_t)vmulq_f32(v24, v24);
  v25.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v25, 2), vadd_f32(*(float32x2_t *)v25.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v25.i8, 1))).u32[0];
  v26 = vrsqrte_f32((float32x2_t)v25.u32[0]);
  v27 = vmul_f32(v26, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v26, v26)));
  v28 = vmulq_n_f32(v24, vmul_f32(v27, vrsqrts_f32((float32x2_t)v25.u32[0], vmul_f32(v27, v27))).f32[0]);
  v29 = vmulq_f32(v49, v28);
  v30 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1)));
  if (v30.f32[0] > -0.00000011921 && v30.f32[0] < 0.00000011921)
    return (simd_float3)xmmword_1B3C07CD0;
  v32 = vmulq_f32(v49, vsubq_f32(v39, v23));
  v34 = vaddq_f32(v32, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v32.f32, 1));
  v33 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v32, 2), v34);
  v34.i32[0] = 1.0;
  v35.i64[0] = 0x8000000080000000;
  v35.i64[1] = 0x8000000080000000;
  LODWORD(v36) = vbslq_s8(v35, (int8x16_t)v34, (int8x16_t)v33).u32[0];
  if (v33.f32[0] == 0.0)
    v36 = 0.0;
  LODWORD(v37) = vbslq_s8(v35, (int8x16_t)v34, (int8x16_t)v30).u32[0];
  if (v30.f32[0] == 0.0)
    v37 = 0.0;
  if ((float)(v36 - v37) == 0.0)
    return (simd_float3)vmlaq_n_f32(v23, v28, vdivq_f32(v33, v30).f32[0]);
  return (simd_float3)xmmword_1B3C07CD0;
}

- (simd_float4x4)projectionMatrixForOrientation:(UIInterfaceOrientation)orientation viewportSize:(CGSize)viewportSize zNear:(CGFloat)zNear zFar:(CGFloat)zFar
{
  double height;
  double width;
  uint64_t v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  simd_float4x4 result;

  height = viewportSize.height;
  width = viewportSize.width;
  v9 = ARCameraToDisplayRotation(orientation);
  ARAdjustIntrincisForOrientation();
  v13 = self->_imageResolution.height;
  if (v9 == 90 || v9 == -90)
  {
    v14 = self->_imageResolution.width;
  }
  else
  {
    v14 = self->_imageResolution.height;
    v13 = self->_imageResolution.width;
  }
  v15 = ARAdjustIntrinsicsForViewportSize(v10, v11, v12, v13, v14, width, height);
  *(float *)&v18 = ARMatrixMakeFrustum(v15, v16, v17, width, height);
  result.columns[3].i64[1] = v25;
  result.columns[3].i64[0] = v24;
  result.columns[2].i64[1] = v23;
  result.columns[2].i64[0] = v22;
  result.columns[1].i64[1] = v21;
  result.columns[1].i64[0] = v20;
  result.columns[0].i64[1] = v19;
  result.columns[0].i64[0] = v18;
  return result;
}

- (simd_float4x4)viewMatrixForOrientation:(UIInterfaceOrientation)orientation
{
  float v4;
  __float2 v5;
  float32x4_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[4];
  simd_float4x4 v21;

  v4 = (double)ARCameraToDisplayRotation(orientation) * 3.14159265 / 180.0;
  v5 = __sincosf_stret(v4 * 0.5);
  v6 = vmulq_n_f32((float32x4_t)xmmword_1B3BDFF70, v5.__sinval);
  v6.i32[3] = LODWORD(v5.__cosval);
  *(double *)&v7 = simd_matrix4x4(v6);
  v18 = v8;
  v19 = v7;
  v16 = v10;
  v17 = v9;
  -[ARCamera transform](self, "transform");
  v15 = 0;
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  memset(&v21, 0, sizeof(v21));
  do
  {
    v21.columns[v15] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v20[v15])), v12, *(float32x2_t *)&v20[v15], 1), v13, (float32x4_t)v20[v15], 2), v14, (float32x4_t)v20[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  return __invert_f4(v21);
}

- (double)extrinsicMatrixToDeviceType:(void *)a1
{
  double result;

  *(_QWORD *)&result = ARMatrix4x3FromMatrix4x4(objc_msgSend(a1, "extrinsicMatrix4x4ToDeviceType:")).n128_u64[0];
  return result;
}

- (__n128)extrinsicMatrix4x4ToDeviceType:(uint64_t)a1
{
  void *v1;
  void *v2;
  __int128 v3;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "matrix");
    v5 = v3;
  }
  else
  {
    v5 = *MEMORY[0x1E0C83FF0];
  }

  return (__n128)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIntrinsics:imageResolution:", *(double *)self->_anon_90, *(double *)&self->_anon_90[16], *(double *)&self->_anon_90[32], self->_imageResolution.width, self->_imageResolution.height);
  v5 = (id *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 48) = self->_lensType;
    *(_OWORD *)(v4 + 96) = *(_OWORD *)self->_tangentialDistortion;
    v6 = *(_OWORD *)&self->_radialDistortion[16];
    *(_OWORD *)(v4 + 112) = *(_OWORD *)self->_radialDistortion;
    *(_OWORD *)(v4 + 128) = v6;
    v7 = *(_OWORD *)&self[1].super.isa;
    v8 = *(_OWORD *)&self[1]._trackingState;
    v9 = *(_OWORD *)&self[1]._lensType;
    *(_OWORD *)(v4 + 224) = *(_OWORD *)&self[1]._exposureDuration;
    *(_OWORD *)(v4 + 240) = v9;
    *(_OWORD *)(v4 + 192) = v7;
    *(_OWORD *)(v4 + 208) = v8;
    *(_QWORD *)(v4 + 16) = self->_trackingState;
    *(_QWORD *)(v4 + 24) = self->_trackingStateReason;
    *(_QWORD *)(v4 + 56) = self->_devicePosition;
    *(double *)(v4 + 32) = self->_exposureDuration;
    *(float *)(v4 + 8) = self->_exposureOffset;
    objc_storeStrong((id *)(v4 + 64), self->_calibrationData);
    objc_storeStrong(v5 + 5, self->_extrinsicsMap);
  }
  return v5;
}

- (simd_float4x4)transform
{
  simd_float4 v2;
  simd_float4 v3;
  simd_float4 v4;
  simd_float4 v5;
  simd_float4x4 result;

  v2 = *(simd_float4 *)&self[1].super.isa;
  v3 = *(simd_float4 *)&self[1]._trackingState;
  v4 = *(simd_float4 *)&self[1]._exposureDuration;
  v5 = *(simd_float4 *)&self[1]._lensType;
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setTransform:(__n128)a3
{
  result[12] = a2;
  result[13] = a3;
  result[14] = a4;
  result[15] = a5;
  return result;
}

- (ARTrackingState)trackingState
{
  return self->_trackingState;
}

- (void)setTrackingState:(int64_t)a3
{
  self->_trackingState = a3;
}

- (ARTrackingStateReason)trackingStateReason
{
  return self->_trackingStateReason;
}

- (void)setTrackingStateReason:(int64_t)a3
{
  self->_trackingStateReason = a3;
}

- (simd_float3x3)intrinsics
{
  simd_float3 v2;
  simd_float3 v3;
  simd_float3 v4;
  simd_float3x3 result;

  v2 = *(simd_float3 *)self->_anon_90;
  v3 = *(simd_float3 *)&self->_anon_90[16];
  v4 = *(simd_float3 *)&self->_anon_90[32];
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setIntrinsics:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  return result;
}

- (CGSize)imageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_imageResolution.width;
  height = self->_imageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (NSTimeInterval)exposureDuration
{
  return self->_exposureDuration;
}

- (void)setExposureDuration:(double)a3
{
  self->_exposureDuration = a3;
}

- (float)exposureOffset
{
  return self->_exposureOffset;
}

- (void)setExposureOffset:(float)a3
{
  self->_exposureOffset = a3;
}

- (NSDictionary)extrinsicsMap
{
  return self->_extrinsicsMap;
}

- (void)setExtrinsicsMap:(id)a3
{
  objc_storeStrong((id *)&self->_extrinsicsMap, a3);
}

- (unint64_t)lensType
{
  return self->_lensType;
}

- (void)setLensType:(unint64_t)a3
{
  self->_lensType = a3;
}

- (__n128)radialDistortion
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 112);
  v3 = *(_OWORD *)(a1 + 128);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setRadialDistortion:(ARCamera *)self
{
  _OWORD *v2;
  __int128 v3;

  v3 = v2[1];
  *(_OWORD *)self->_radialDistortion = *v2;
  *(_OWORD *)&self->_radialDistortion[16] = v3;
}

- (__n128)tangentialDistortion
{
  return a1[6];
}

- (void)setTangentialDistortion:(ARCamera *)self
{
  __int128 v2;

  *(_OWORD *)self->_tangentialDistortion = v2;
}

- (int64_t)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int64_t)a3
{
  self->_devicePosition = a3;
}

- (AVCameraCalibrationData)calibrationData
{
  return self->_calibrationData;
}

- (void)setCalibrationData:(id)a3
{
  objc_storeStrong((id *)&self->_calibrationData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationData, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
}

- (id)initFromImageData:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  ARCamera *v19;
  __int128 v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _OWORD v27[4];

  v4 = a3;
  objc_msgSend(v4, "cameraIntrinsics");
  v25 = v6;
  v26 = v5;
  v24 = v7;
  objc_msgSend(v4, "imageResolution");
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v4, "cameraPosition");
  v13 = objc_msgSend(v4, "lensType");
  if (v4)
  {
    objc_msgSend(v4, "radialDistortion");
    objc_msgSend(v4, "tangentialDistortion", v27[3], v27[2]);
  }
  else
  {
    objc_msgSend(0, "tangentialDistortion", 0, 0, 0, 0);
  }
  v23 = v14;
  objc_msgSend(v4, "exposureDuration");
  v16 = v15;
  objc_msgSend(v4, "calibrationData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extrinsicsMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  v27[1] = v21;
  v19 = -[ARCamera initWithIntrinsics:imageResolution:devicePosition:lensType:radialDistortion:tangentialDistortion:exposureDuration:calibrationData:extrinsicsMap:](self, "initWithIntrinsics:imageResolution:devicePosition:lensType:radialDistortion:tangentialDistortion:exposureDuration:calibrationData:extrinsicsMap:", v12, v13, v27, v17, v18, v26, v25, v24, v9, v11, v23, v16);

  return v19;
}

@end
