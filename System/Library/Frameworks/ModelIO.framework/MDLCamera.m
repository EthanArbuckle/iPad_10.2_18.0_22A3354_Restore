@implementation MDLCamera

- (MDLCamera)init
{
  id v2;
  MDLTransform *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  simd_float4x4 *v9;
  simd_float4x4 *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MDLCamera;
  v2 = -[MDLObject init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MDLTransform);
    objc_msgSend_setTransform_(v2, v4, (uint64_t)v3);

    v5 = operator new();
    objc_msgSend_transform(v2, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1DCBC1068(v5, v8);
    *((_QWORD *)v2 + 7) = v5;

    *((_DWORD *)v2 + 32) = 1085485875;
    *((_DWORD *)v2 + 16) = 1065353216;
    *((_DWORD *)v2 + 33) = 1028443341;
    v9 = (simd_float4x4 *)*((_QWORD *)v2 + 7);
    v9[3].columns[2].i32[2] = 1103101952;
    v9[3].columns[2].f32[3] = atanf(12.0 / v9[3].columns[0].f32[2]) * 114.59;
    sub_1DCBC1034(v9);
    v10 = (simd_float4x4 *)*((_QWORD *)v2 + 7);
    v10[3].columns[3].i32[0] = 1069547520;
    sub_1DCBC1034(v10);
    v11 = v2;
  }

  return (MDLCamera *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  CAAnimation *focalDistanceAnimation;
  uint64_t v24;
  void *v25;
  CAAnimation *fStopAnimation;
  uint64_t v27;
  void *v28;
  CAAnimation *focalLengthAnimation;
  uint64_t v30;
  void *v31;
  CAAnimation *apertureAnimation;
  uint64_t v33;
  void *v34;
  CAAnimation *apertureAspectAnimation;
  uint64_t v36;
  void *v37;
  RTCamera *v38;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  objc_msgSend_transform(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  v15 = objc_opt_class();
  LODWORD(v14) = objc_msgSend_isSubclassOfClass_(v14, v16, v15);

  if ((_DWORD)v14)
  {
    objc_msgSend_transform(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_copyWithZone_(v19, v20, (uint64_t)a3);
    objc_msgSend_setTransform_((void *)v10, v22, (uint64_t)v21);

  }
  *(float *)(v10 + 64) = self->_worldToMetersConversionScale;
  focalDistanceAnimation = self->_focalDistanceAnimation;
  if (focalDistanceAnimation)
  {
    v24 = objc_msgSend_copyWithZone_(focalDistanceAnimation, v17, (uint64_t)a3);
    v25 = *(void **)(v10 + 72);
    *(_QWORD *)(v10 + 72) = v24;

  }
  fStopAnimation = self->_fStopAnimation;
  if (fStopAnimation)
  {
    v27 = objc_msgSend_copyWithZone_(fStopAnimation, v17, (uint64_t)a3);
    v28 = *(void **)(v10 + 80);
    *(_QWORD *)(v10 + 80) = v27;

  }
  focalLengthAnimation = self->_focalLengthAnimation;
  if (focalLengthAnimation)
  {
    v30 = objc_msgSend_copyWithZone_(focalLengthAnimation, v17, (uint64_t)a3);
    v31 = *(void **)(v10 + 88);
    *(_QWORD *)(v10 + 88) = v30;

  }
  apertureAnimation = self->_apertureAnimation;
  if (apertureAnimation)
  {
    v33 = objc_msgSend_copyWithZone_(apertureAnimation, v17, (uint64_t)a3);
    v34 = *(void **)(v10 + 96);
    *(_QWORD *)(v10 + 96) = v33;

  }
  apertureAspectAnimation = self->_apertureAspectAnimation;
  if (apertureAspectAnimation)
  {
    v36 = objc_msgSend_copyWithZone_(apertureAspectAnimation, v17, (uint64_t)a3);
    v37 = *(void **)(v10 + 104);
    *(_QWORD *)(v10 + 104) = v36;

  }
  v38 = (RTCamera *)operator new();
  sub_1DCBC1160(v38, self->_camera);
  self->_camera = v38;
  return (id)v10;
}

- (void)dealloc
{
  RTCamera *camera;
  objc_super v4;

  camera = self->_camera;
  if (camera)
    (*((void (**)(RTCamera *, SEL))camera->var0 + 1))(camera, a2);
  v4.receiver = self;
  v4.super_class = (Class)MDLCamera;
  -[MDLCamera dealloc](&v4, sel_dealloc);
}

- (int64_t)version
{
  return 1;
}

- (RTCamera)rtCamera
{
  return self->_camera;
}

- (double)getViewMatrixAtTime:(uint64_t)a1
{
  return sub_1DCBC1D74(*(_QWORD *)(a1 + 56), 0.0);
}

- (matrix_float4x4)projectionMatrix
{
  float v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  matrix_float4x4 result;

  v2 = sub_1DCBC1DB8((uint64_t)self->_camera, 0.0);
  result.columns[3].i64[1] = v10;
  result.columns[3].i64[0] = v9;
  result.columns[2].i64[1] = v8;
  result.columns[2].i64[0] = v7;
  result.columns[1].i64[1] = v6;
  result.columns[1].i64[0] = v5;
  result.columns[0].i64[1] = v4;
  result.columns[0].f32[1] = v3;
  result.columns[0].f32[0] = v2;
  return result;
}

- (float)getProjectionMatrixAtTime:(uint64_t)a1
{
  return sub_1DCBC1DB8(*(_QWORD *)(a1 + 56), 0.0);
}

- (vector_float3)rayTo:(vector_int2)pixel forViewPort:(vector_int2)size
{
  uint64_t v4;
  uint64_t v5;
  vector_float3 result;

  sub_1DCBC1EB8((float32x4_t *)self->_camera, COERCE_DOUBLE(vcvt_f32_s32((int32x2_t)pixel)), COERCE_DOUBLE(vcvt_f32_s32((int32x2_t)size)));
  result.i64[1] = v5;
  result.i64[0] = v4;
  return result;
}

- (float)focalLength
{
  return self->_camera[1].var19;
}

- (void)setFocalLength:(float)focalLength
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[0].f32[2] = focalLength;
  camera[3].columns[2].f32[3] = atanf(camera[3].columns[2].f32[2] / (float)(focalLength + focalLength)) * 114.59;
  sub_1DCBC1034(camera);
}

- (float)focusDistance
{
  return *((float *)&self->_camera[2].var2 + 1);
}

- (void)setFocusDistance:(float)focusDistance
{
  *((float *)&self->_camera[2].var2 + 1) = focusDistance;
}

- (float)aperture
{
  return self->_camera[2].var3;
}

- (void)setAperture:(float)a3
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[2].f32[2] = a3;
  camera[3].columns[2].f32[3] = atanf(a3 / (float)(camera[3].columns[0].f32[2] + camera[3].columns[0].f32[2])) * 114.59;
  sub_1DCBC1034(camera);
}

- (float)sensorVerticalAperture
{
  return self->_camera[2].var3;
}

- (void)setSensorVerticalAperture:(float)sensorVerticalAperture
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[2].f32[2] = sensorVerticalAperture;
  camera[3].columns[2].f32[3] = atanf(sensorVerticalAperture/ (float)(camera[3].columns[0].f32[2] + camera[3].columns[0].f32[2]))* 114.59;
  sub_1DCBC1034(camera);
}

- (vector_float2)sensorEnlargement
{
  return (vector_float2)self->_camera[2].var0;
}

- (void)setSensorEnlargement:(vector_float2)sensorEnlargement
{
  self->_camera[2].var0 = (void **)sensorEnlargement;
}

- (vector_float2)sensorShift
{
  return (vector_float2)self->_camera[2].var1;
}

- (void)setSensorShift:(vector_float2)sensorShift
{
  self->_camera[2].var1 = (unint64_t)sensorShift;
}

- (float)fov
{
  return self->_camera[2].var4;
}

- (void)setFov:(float)a3
{
  sub_1DCB56828((simd_float4x4 *)self->_camera, a3);
}

- (float)fieldOfView
{
  return self->_camera[2].var4;
}

- (void)setFieldOfView:(float)fieldOfView
{
  sub_1DCB56828((simd_float4x4 *)self->_camera, fieldOfView);
}

- (float)aspect
{
  return *(float *)&self->_camera[2].var5;
}

- (void)setAspect:(float)a3
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[3].f32[0] = a3;
  sub_1DCBC1034(camera);
}

- (float)sensorAspect
{
  return *(float *)&self->_camera[2].var5;
}

- (void)setSensorAspect:(float)sensorAspect
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[3].columns[3].f32[0] = sensorAspect;
  sub_1DCBC1034(camera);
}

- (float)circleOfConfusionForDistance:(float)a3
{
  float result;

  result = (float)(self->_camera[1].var19 * self->_camera[2].var3) / (float)(a3 - self->_camera[1].var19);
  if (result >= self->_maximumCircleOfConfusion)
    return self->_maximumCircleOfConfusion;
  return result;
}

- (float)zNear
{
  return self->_camera[2].var11;
}

- (void)setZNear:(float)a3
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[0] = a3;
  sub_1DCBC1034(camera);
}

- (float)zFar
{
  return self->_camera[2].var12;
}

- (void)setZFar:(float)a3
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[1] = a3;
  sub_1DCBC1034(camera);
}

- (float)nearVisibilityDistance
{
  return self->_camera[2].var11;
}

- (void)setNearVisibilityDistance:(float)nearVisibilityDistance
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[0] = nearVisibilityDistance;
  sub_1DCBC1034(camera);
}

- (float)farVisibilityDistance
{
  return self->_camera[2].var12;
}

- (void)setFarVisibilityDistance:(float)farVisibilityDistance
{
  simd_float4x4 *camera;

  camera = (simd_float4x4 *)self->_camera;
  camera[4].columns[1].f32[1] = farVisibilityDistance;
  sub_1DCBC1034(camera);
}

- (MDLTexture)bokehKernelWithSize:(vector_int2)size
{
  int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  float v15;
  float v16;
  int8x16_t v17;
  int v18;
  unsigned int v19;
  float v20;
  float32x2_t v21;
  int *v22;
  int i;
  int v24;
  int v25;
  float v26;
  float v27;
  __float2 v28;
  float32x2_t v29;
  __float2 v30;
  int8x16_t v31;
  int8x16_t v32;
  int8x16_t v33;
  int v34;
  int v35;
  int *v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  MDLTexture *v41;
  const char *v42;
  void *isCube;
  size_t v46;
  int *v47;
  int v48;
  int8x16_t v49;

  v4 = size.i32[0];
  v5 = size.i32[1];
  v46 = 4 * size.i32[1] * size.i32[0];
  v47 = (int *)malloc_type_malloc(v46, 0xB538CCF4uLL);
  v8 = objc_msgSend_apertureBladeCount(self, v6, v7);
  v10 = v8;
  if (v4 >= 0)
    v11 = v4;
  else
    v11 = v4 + 1;
  v12 = v11 >> 1;
  if (v5 >= 0)
    v13 = v5;
  else
    v13 = v5 + 1;
  v48 = -(v13 >> 1);
  if ((v8 - 3) > 0xD)
  {
    if (v5 >= 1)
    {
      v35 = 0;
      v36 = v47;
      do
      {
        if (v4 >= 1)
        {
          v37 = -v12;
          v38 = v4;
          do
          {
            if ((v35 - (v13 >> 1)) * (v35 - (v13 >> 1)) + v37 * v37 < (v12 * v12))
              v39 = -1;
            else
              v39 = -16777216;
            *v36++ = v39;
            ++v37;
            --v38;
          }
          while (v38);
        }
        ++v35;
      }
      while (v35 != v5);
    }
  }
  else
  {
    v14 = (double)v8;
    v15 = 3.14159265 / (double)v8;
    v16 = cosf(v15);
    if (v5 >= 1)
    {
      v18 = 0;
      *(float *)v17.i32 = (float)v12;
      v19 = (int)(float)(v16 * (float)v12) * (int)(float)(v16 * (float)v12);
      v20 = 6.28318531 / v14;
      v21 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 0);
      v22 = v47;
      do
      {
        if (v4 >= 1)
        {
          for (i = 0; i != v4; ++i)
          {
            v24 = i - v12;
            if ((v18 + v48) * (v18 + v48) + v24 * v24 < v19)
            {
LABEL_18:
              v34 = -1;
            }
            else
            {
              v25 = 0;
              *(float *)v17.i32 = (float)v24;
              *(float *)&v17.i32[1] = (float)(v18 + v48);
              v49 = v17;
              while (1)
              {
                v26 = (float)v25 * v20;
                v27 = v26 + v20;
                v28 = __sincosf_stret(v26);
                v29 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v28.__sinval), LODWORD(v28.__cosval)), (float)v12);
                v30 = __sincosf_stret(v27);
                v31.i64[1] = v49.i64[1];
                *(float32x2_t *)v32.i8 = vmul_f32(vmla_f32(vneg_f32(v29), v21, (float32x2_t)__PAIR64__(LODWORD(v30.__sinval), LODWORD(v30.__cosval))), (float32x2_t)vrev64_s32((int32x2_t)vsub_f32(*(float32x2_t *)v49.i8, v29)));
                *(int32x2_t *)v31.i8 = vdup_lane_s32(*(int32x2_t *)v32.i8, 1);
                *(float32x2_t *)v32.i8 = vsub_f32(*(float32x2_t *)v32.i8, *(float32x2_t *)v31.i8);
                v31.i32[0] = 1.0;
                v33.i64[0] = 0x8000000080000000;
                v33.i64[1] = 0x8000000080000000;
                v17 = vbslq_s8(v33, v31, v32);
                if (*(float *)v32.i32 == 0.0)
                  v17.i32[0] = v32.i32[0];
                if ((int)*(float *)v17.i32 < 0)
                  break;
                if (v10 == ++v25)
                  goto LABEL_18;
              }
              v34 = -16777216;
            }
            *v22++ = v34;
          }
        }
        ++v18;
      }
      while (v18 != v5);
    }
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)v47, v46);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = [MDLTexture alloc];
  isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v41, v42, (uint64_t)v40, 1, CFSTR("bokeh"), v4, 4, 1, *(double *)&size, 0);
  free(v47);

  return (MDLTexture *)isCube;
}

- (vector_float3)exposure
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setExposure:(vector_float3)exposure
{
  __int128 v3;

  *(_OWORD *)&self->_camera[2].var15 = v3;
}

- (vector_float2)exposureCompression
{
  return *(vector_float2 *)&self->_camera[2].var13;
}

- (void)setExposureCompression:(vector_float2)exposureCompression
{
  *(vector_float2 *)&self->_camera[2].var13 = exposureCompression;
}

- (void)frameBoundingBox:(MDLAxisAlignedBoundingBox *)boundingBox setNearAndFar:(BOOL)setNearAndFar
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  int v7;
  RTCamera *camera;
  int8x16_t v10;
  _BOOL4 v11;
  int v12;
  __int32 v13;
  int v19;
  unsigned int v20;
  int8x16_t v21;
  float32x4_t v22;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  int32x4_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float32x4_t v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x4_t v37;
  int32x4_t v38;
  float32x4_t v39;
  int32x4_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  simd_float4x4 *v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  __n128 v52;
  float32x4_t v53;
  simd_float4x4 v54;
  simd_float4x4 v55;

  v7 = (int)boundingBox;
  camera = self->_camera;
  v10 = (int8x16_t)vcgtq_f32(v5, v4);
  v11 = v10.i32[0] != 0;
  v10.i32[0] = vextq_s8(v10, v10, 8uLL).u32[0];
  *(int32x2_t *)v10.i8 = vtst_s32(*(int32x2_t *)v10.i8, *(int32x2_t *)v10.i8);
  v12 = v11 & v10.i32[1];
  v13 = v10.i32[0];
  __asm { FMOV            V2.4S, #5.0 }
  v19 = v12 & v13;
  if (v19)
    v20 = -1;
  else
    v20 = 0;
  v21 = (int8x16_t)vdupq_n_s32(v20);
  v22 = (float32x4_t)vbslq_s8(v21, _Q2, (int8x16_t)v4);
  __asm { FMOV            V0.4S, #-5.0 }
  v24 = (float32x4_t)vbslq_s8(v21, _Q0, (int8x16_t)v5);
  v25.i64[0] = 0x3F0000003F000000;
  v25.i64[1] = 0x3F0000003F000000;
  v6.i32[0] = -915135488;
  v47 = v22;
  v49 = v24;
  if ((v19 & 1) == 0)
  {
    v26 = vmulq_f32(vsubq_f32(v22, v24), v25);
    v27 = (int32x4_t)vmulq_f32(v26, v26);
    v28 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.i8, 1)), (float32x4_t)vdupq_laneq_s32(v27, 2)).f32[0]);
    if (v28 > 1.1755e-38)
    {
      v29 = camera[2].var4 * 0.0174532925;
      v30 = v28 * 1.05;
      v31 = sinf(v29 * 0.5);
      v25.i64[0] = 0x3F0000003F000000;
      v25.i64[1] = 0x3F0000003F000000;
      v22 = v47;
      v24 = v49;
      v6.f32[0] = v30 / v31;
    }
  }
  v51 = v6;
  v53 = vmulq_f32(vaddq_f32(v24, v22), v25);
  objc_msgSend_translation(camera->var10, a2, (uint64_t)boundingBox, setNearAndFar, *(_OWORD *)&v47, *(_OWORD *)&v49);
  v33 = vsubq_f32(v32, v53);
  v34 = (int32x4_t)vmulq_f32(v33, v33);
  v34.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2)).u32[0];
  v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
  v36 = vmul_f32(vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)), v35);
  *(float32x2_t *)v34.i8 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36)));
  v52 = (__n128)vmulq_n_f32(v33, vmulq_f32((float32x4_t)v34, v51).f32[0]);
  sub_1DCBC1214((uint64_t)self->_camera, v52);
  sub_1DCBC19BC((float32x4_t *)self->_camera, v53);
  *(double *)v54.columns[0].i64 = sub_1DCBC1D74((uint64_t)self->_camera, 0.0);
  v55 = __invert_f4(v54);
  if (v7)
  {
    v37 = vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmlaq_n_f32((float32x4_t)v55.columns[3], (float32x4_t)v55.columns[0], v48.f32[0]), (float32x4_t)v55.columns[1], *(float32x2_t *)v48.f32, 1), (float32x4_t)v55.columns[2], v48, 2), (float32x4_t)v52);
    v38 = (int32x4_t)vmulq_f32(v37, v37);
    v39 = vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmlaq_n_f32((float32x4_t)v55.columns[3], (float32x4_t)v55.columns[0], v50.f32[0]), (float32x4_t)v55.columns[1], *(float32x2_t *)v50.f32, 1), (float32x4_t)v55.columns[2], v50, 2), (float32x4_t)v52);
    v40 = (int32x4_t)vmulq_f32(v39, v39);
    v41 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.i8, 1)), (float32x4_t)vdupq_laneq_s32(v38, 2)).f32[0]);
    v42 = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.i8, 1)), (float32x4_t)vdupq_laneq_s32(v40, 2)).f32[0]);
    v43 = fmaxf(v42, -3.4028e38);
    if (v41 > v43)
      v43 = v41;
    v44 = fminf(v42, 0.1);
    if (v41 < v44)
      v44 = v41;
    v45 = v44 * 0.70711;
    v46 = (simd_float4x4 *)self->_camera;
    if (v43 > 1000.0)
      v45 = 0.70711;
    v46[4].columns[1].f32[0] = v45;
    v46[4].columns[1].f32[1] = v43 * 4.0;
    sub_1DCBC1034(v46);
  }
}

- (void)lookAt:(vector_float3)focusPosition
{
  float32x4_t v3;

  sub_1DCBC19BC((float32x4_t *)self->_camera, v3);
}

- (void)lookAt:(vector_float3)focusPosition from:(vector_float3)cameraPosition
{
  float32x4_t v4;
  __n128 v5;
  float32x4_t v7;

  v7 = v4;
  sub_1DCBC1214((uint64_t)self->_camera, v5);
  sub_1DCBC19BC((float32x4_t *)self->_camera, v7);
}

- (float)worldToMetersConversionScale
{
  return self->_worldToMetersConversionScale;
}

- (void)setWorldToMetersConversionScale:(float)worldToMetersConversionScale
{
  self->_worldToMetersConversionScale = worldToMetersConversionScale;
}

- (CAAnimation)focalDistanceAnimation
{
  return self->_focalDistanceAnimation;
}

- (void)setFocalDistanceAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CAAnimation)fStopAnimation
{
  return self->_fStopAnimation;
}

- (void)setFStopAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CAAnimation)focalLengthAnimation
{
  return self->_focalLengthAnimation;
}

- (void)setFocalLengthAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CAAnimation)apertureAnimation
{
  return self->_apertureAnimation;
}

- (void)setApertureAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CAAnimation)apertureAspectAnimation
{
  return self->_apertureAspectAnimation;
}

- (void)setApertureAspectAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (MDLCameraProjection)projection
{
  return self->_projection;
}

- (void)setProjection:(MDLCameraProjection)projection
{
  self->_projection = projection;
}

- (float)barrelDistortion
{
  return self->_barrelDistortion;
}

- (void)setBarrelDistortion:(float)barrelDistortion
{
  self->_barrelDistortion = barrelDistortion;
}

- (float)fisheyeDistortion
{
  return self->_fisheyeDistortion;
}

- (void)setFisheyeDistortion:(float)fisheyeDistortion
{
  self->_fisheyeDistortion = fisheyeDistortion;
}

- (float)opticalVignetting
{
  return self->_opticalVignetting;
}

- (void)setOpticalVignetting:(float)opticalVignetting
{
  self->_opticalVignetting = opticalVignetting;
}

- (float)chromaticAberration
{
  return self->_chromaticAberration;
}

- (void)setChromaticAberration:(float)chromaticAberration
{
  self->_chromaticAberration = chromaticAberration;
}

- (float)fStop
{
  return self->_fStop;
}

- (void)setFStop:(float)fStop
{
  self->_fStop = fStop;
}

- (NSUInteger)apertureBladeCount
{
  return self->_apertureBladeCount;
}

- (void)setApertureBladeCount:(NSUInteger)apertureBladeCount
{
  self->_apertureBladeCount = apertureBladeCount;
}

- (float)maximumCircleOfConfusion
{
  return self->_maximumCircleOfConfusion;
}

- (void)setMaximumCircleOfConfusion:(float)maximumCircleOfConfusion
{
  self->_maximumCircleOfConfusion = maximumCircleOfConfusion;
}

- (NSTimeInterval)shutterOpenInterval
{
  return self->_shutterOpenInterval;
}

- (void)setShutterOpenInterval:(NSTimeInterval)shutterOpenInterval
{
  self->_shutterOpenInterval = shutterOpenInterval;
}

- (vector_float3)flash
{
  vector_float3 result;

  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (void)setFlash:(vector_float3)flash
{
  __int128 v3;

  *(_OWORD *)self->_flash = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apertureAspectAnimation, 0);
  objc_storeStrong((id *)&self->_apertureAnimation, 0);
  objc_storeStrong((id *)&self->_focalLengthAnimation, 0);
  objc_storeStrong((id *)&self->_fStopAnimation, 0);
  objc_storeStrong((id *)&self->_focalDistanceAnimation, 0);
}

@end
