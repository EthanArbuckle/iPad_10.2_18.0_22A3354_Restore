@implementation MDLLightProbe

- (NSData)sphericalHarmonicsCoefficients
{
  return (NSData *)self->_sphericalHarmonicsCoefficients;
}

- (void)setSphericalHarmonicsCoefficients:(id)a3
{
  const char *v4;
  NSMutableData *v5;
  NSMutableData *sphericalHarmonicsCoefficients;
  id v7;

  v7 = a3;
  objc_msgSend_dataWithData_(MEMORY[0x1E0C99DF0], v4, (uint64_t)v7);
  v5 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  sphericalHarmonicsCoefficients = self->_sphericalHarmonicsCoefficients;
  self->_sphericalHarmonicsCoefficients = v5;

}

- (MDLLightProbe)initWithReflectiveTexture:(MDLTexture *)reflectiveTexture irradianceTexture:(MDLTexture *)irradianceTexture
{
  MDLTexture *v7;
  MDLTexture *v8;
  MDLLightProbe *v9;
  MDLLightProbe *v10;
  NSMutableData *v11;
  NSMutableData *sphericalHarmonicsCoefficients;
  objc_super v14;

  v7 = reflectiveTexture;
  v8 = irradianceTexture;
  v14.receiver = self;
  v14.super_class = (Class)MDLLightProbe;
  v9 = -[MDLLight init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reflectiveTexture, reflectiveTexture);
    objc_storeStrong((id *)&v10->_irradianceTexture, irradianceTexture);
    v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    sphericalHarmonicsCoefficients = v10->_sphericalHarmonicsCoefficients;
    v10->_sphericalHarmonicsCoefficients = v11;

  }
  return v10;
}

- (void)generateSphericalHarmonicsFromIrradiance:(NSUInteger)sphericalHarmonicsLevel
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const char *v10;
  __int128 v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  float *v19;
  const char *v20;
  uint64_t v21;
  size_t v22;
  float *v23;
  uint64_t v24;
  int8x16_t v25;
  int8x16_t v26;
  float v27;
  uint64_t v28;
  int v29;
  float v30;
  uint64_t i;
  uint64_t j;
  float32x4_t v33;
  float v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  float *v40;
  _BYTE *v41;
  uint64_t v42;
  float *v43;
  unint64_t v44;
  float v45;
  unint64_t v46;
  float v47;
  float v48;
  float *v49;
  float v50;
  uint64_t v51;
  uint64_t v52;
  float *v53;
  id v54;
  uint64_t v55;
  __int128 v56;
  float32x4_t v57;

  if (sphericalHarmonicsLevel >= 4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v6, v10, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Spherical harmonics levels beyond 3 are not supported"), v8, v9);

  }
  objc_msgSend_dimensions(self->_irradianceTexture, a2, sphericalHarmonicsLevel);
  v56 = v11;
  objc_msgSend_texelDataWithBottomLeftOrigin(self->_irradianceTexture, v12, v13);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v14 = (sphericalHarmonicsLevel + 1) * (sphericalHarmonicsLevel + 1);
  v15 = v14;
  objc_msgSend_setLength_(self->_sphericalHarmonicsCoefficients, v16, 12 * v14);
  v19 = (float *)objc_msgSend_mutableBytes(self->_sphericalHarmonicsCoefficients, v17, v18);
  v22 = objc_msgSend_length(self->_sphericalHarmonicsCoefficients, v20, v21);
  v53 = v19;
  bzero(v19, v22);
  self->_sphericalHarmonicsLevel = sphericalHarmonicsLevel;
  v23 = (float *)malloc_type_calloc(v14, 4uLL, 0x100004052888210uLL);
  v55 = 0;
  v26.i64[1] = *((_QWORD *)&v56 + 1);
  v24 = v56;
  v25.i64[0] = 1.0;
  *(double *)v26.i64 = 1.0 / (double)(int)v56;
  v27 = *(double *)v26.i64;
  v28 = 2 * v14;
  v29 = v14;
  v52 = v14 & 0xFFFFFFFD;
  v30 = 0.0;
  do
  {
    if ((int)v24 >= 1)
    {
      for (i = 0; i != v24; ++i)
      {
        for (j = 0; j != v24; ++j)
        {
          *(float *)v26.i32 = v27;
          *(double *)v33.i64 = sub_1DCB87B7C(i, j, v55, v26, v25);
          v57 = v33;
          v34 = sub_1DCB87D04(i, j, v24);
          v35 = objc_retainAutorelease(v54);
          v38 = objc_msgSend_bytes(v35, v36, v37);
          switch(sphericalHarmonicsLevel)
          {
            case 0uLL:
              sub_1DCB878DC(v23);
              break;
            case 1uLL:
              sub_1DCB878EC((uint64_t)v23, (int8x16_t)v57);
              break;
            case 2uLL:
              sub_1DCB87934((uint64_t)v23, (int8x16_t)v57);
              break;
            case 3uLL:
              sub_1DCB879F4((uint64_t)v23, v57);
              break;
            default:
              break;
          }
          if (v29 >= 1)
          {
            v40 = v53;
            v41 = (_BYTE *)(v38 + 4 * (int)v24 * (int)v24 * (5 - (int)v55) + 4 * ((int)i + (int)j * (int)v24));
            *(double *)v26.i64 = v34 * 0.00392156863;
            v42 = v52;
            v43 = v23;
            do
            {
              LOBYTE(v39) = *v41;
              *(double *)&v44 = (double)*(unint64_t *)&v39;
              v45 = *v40 + *(double *)v26.i64 * *v43 * *(double *)&v44;
              *v40 = v45;
              LOBYTE(v44) = v41[1];
              *(double *)&v46 = (double)v44;
              v47 = v40[v15] + *(double *)v26.i64 * *v43 * *(double *)&v46;
              v40[v15] = v47;
              v48 = *v43++;
              LOBYTE(v46) = v41[2];
              v39 = (double)v46;
              *(double *)v25.i64 = v40[v28] + *(double *)v26.i64 * v48 * v39;
              *(float *)v25.i32 = *(double *)v25.i64;
              v40[v28] = *(float *)v25.i32;
              ++v40;
              --v42;
            }
            while (v42);
          }
          v30 = v34 + v30;
        }
      }
    }
    ++v55;
  }
  while (v55 != 6);
  v49 = v53;
  if (v29 >= 1)
  {
    LODWORD(v51) = 3 * v29;
    if (3 * v29 <= 1)
      v51 = 1;
    else
      v51 = v51;
    do
    {
      v50 = 12.5663706 / v30;
      *v49 = *v49 * v50;
      ++v49;
      --v51;
    }
    while (v51);
  }
  free(v23);

}

+ (__n128)calculateIrradianceGradientUsingSamples:(double *)a3 ofSize:(uint64_t)a4 fromSH:(void *)a5 withLevel:(uint64_t)a6
{
  const char *v9;
  id v10;
  float32x4_t v11;
  CGColor *v12;
  const CGFloat *Components;
  float v14;
  float64x2_t v15;
  float v16;
  float32x4_t v17;
  float64x2_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v10 = a5;
  v11 = 0uLL;
  if (v10 && a4)
  {
    v19 = (float64x2_t)xmmword_1DCC588E0;
    do
    {
      v20 = v11;
      v12 = (CGColor *)objc_msgSend_sampleSHAt_usingCoefficients_withLevel_(MDLLightProbe, v9, (uint64_t)v10, a6, *a3, *(_OWORD *)&v19);
      Components = CGColorGetComponents(v12);
      v14 = *Components;
      v15 = vmulq_f64(vcvtq_f64_f32(vcvt_f32_f64(*(float64x2_t *)(Components + 1))), v19);
      v16 = v15.f64[0] + v14 * 0.2126 + v15.f64[1];
      v17 = *(float32x4_t *)a3;
      a3 += 2;
      v11 = vmlaq_n_f32(v20, v17, v16);
      --a4;
    }
    while (a4);
  }
  v21 = v11;

  return (__n128)v21;
}

+ (CGColor)sampleSHAt:(id)a3 usingCoefficients:(unint64_t)a4 withLevel:
{
  float32x4_t v4;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  const char *v14;
  int v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  float *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  __int32 *v26;
  int32x4_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x4_t v30;
  uint64_t v31;
  float32x4_t v32;
  float *v33;
  float v34;
  CGColorSpace *DeviceRGB;
  CGColor *v36;
  float32x4_t v38;
  float32x4_t v39;
  CGFloat components[2];
  double v41;
  uint64_t v42;
  uint64_t v43;

  v38 = v4;
  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (a4 >= 4)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v14, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Spherical harmonics levels beyond 3 are not supported"), v12, v13, *(_OWORD *)&v38);

  }
  v15 = a4 + 1;
  v16 = (v15 * v15);
  if (objc_msgSend_length(v9, v7, v8) != 12 * (_DWORD)v16)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v17, v21, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Number of spherical harmonics coefficients inconsistent with spherical harmonics level"), v19, v20);

  }
  v22 = (float *)malloc_type_calloc((v15 * v15), 4uLL, 0x100004052888210uLL);
  v23 = objc_retainAutorelease(v9);
  v26 = (__int32 *)objc_msgSend_bytes(v23, v24, v25);
  v27 = (int32x4_t)vmulq_f32(v38, v38);
  v27.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v27.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v27, 2)).u32[0];
  v28 = vrsqrte_f32((float32x2_t)v27.u32[0]);
  v29 = vmul_f32(vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v28, v28)), v28);
  v30 = vmulq_n_f32(v38, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27.u32[0], vmul_f32(v29, v29))).f32[0]);
  switch(a4)
  {
    case 0uLL:
      sub_1DCB878DC(v22);
      break;
    case 1uLL:
      sub_1DCB878EC((uint64_t)v22, (int8x16_t)v30);
      break;
    case 2uLL:
      sub_1DCB87934((uint64_t)v22, (int8x16_t)v30);
      break;
    case 3uLL:
      sub_1DCB879F4((uint64_t)v22, v30);
      break;
    default:
      break;
  }
  if ((_DWORD)a4 == -1)
  {
    v32 = 0uLL;
  }
  else
  {
    if (v16 <= 1)
      v31 = 1;
    else
      v31 = v16;
    v32 = 0uLL;
    v33 = v22;
    do
    {
      v30.i32[0] = *v26;
      v34 = *v33++;
      v30.i32[1] = v26[v16];
      *(float32x2_t *)v30.f32 = vmul_n_f32(*(float32x2_t *)v30.f32, v34);
      v30.f32[2] = *(float *)&v26[(2 * v16)] * v34;
      v32 = vaddq_f32(v30, v32);
      ++v26;
      --v31;
    }
    while (v31);
  }
  v39 = v32;
  free(v22);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v39.f32);
  v41 = v39.f32[2];
  v42 = 0x3FF0000000000000;
  v36 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);

  return v36;
}

- (id)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_storeStrong((id *)&self->_transform, a3);
}

- (MDLTexture)reflectiveTexture
{
  return self->_reflectiveTexture;
}

- (MDLTexture)irradianceTexture
{
  return self->_irradianceTexture;
}

- (NSUInteger)sphericalHarmonicsLevel
{
  return self->_sphericalHarmonicsLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_sphericalHarmonicsCoefficients, 0);
  objc_storeStrong((id *)&self->_irradianceTexture, 0);
  objc_storeStrong((id *)&self->_reflectiveTexture, 0);
}

+ (MDLLightProbe)lightProbeWithTextureSize:(NSInteger)textureSize forLocation:(MDLTransform *)transform lightsToConsider:(NSArray *)lightsToConsider objectsToConsider:(NSArray *)objectsToConsider reflectiveCubemap:(MDLTexture *)reflectiveCubemap irradianceCubemap:(MDLTexture *)irradianceCubemap
{
  NSArray *v12;
  MDLScene *v13;
  NSArray *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSArray *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  const char *v27;
  float32x4_t *v28;
  __n128 v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  NSInteger v33;
  const char *v34;
  uint64_t v35;
  __n128 v36;
  const char *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  MDLTexture *v46;
  const char *v47;
  const char *v48;
  void *v49;
  const char *v50;
  double v51;
  const char *v52;
  const char *v53;
  void *v54;
  const char *v55;
  MDLLightProbe *v56;
  const char *v57;
  uint64_t *v58;
  const char *v59;
  id v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int8x16_t v65;
  int v66;
  int8x16_t v67;
  int v68;
  int v69;
  int v70;
  _BYTE *v71;
  double v72;
  const char *v73;
  CGColor *v74;
  float64x2_t *Components;
  float32x4_t v76;
  float32_t v77;
  float32x4_t v78;
  float32x4_t v79;
  MDLTexture *v80;
  const char *v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v87;
  NSArray *v88;
  float32x4_t *v89;
  NSArray *v90;
  MDLTransform *v91;
  void *v92;
  id v93;
  void *isCube;
  MDLTransform *v95;
  MDLTexture *v96;
  MDLTexture *v97;
  void *v98;
  double v99;
  float32x4_t v101;
  __n128 v102;
  float32x4_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v95 = transform;
  v12 = lightsToConsider;
  v90 = objectsToConsider;
  v96 = reflectiveCubemap;
  v97 = irradianceCubemap;
  v88 = v12;
  v13 = objc_alloc_init(MDLScene);
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v14 = v12;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v108, v113, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v109 != v18)
          objc_enumerationMutation(v14);
        objc_msgSend_addObject_(v13, v16, *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i));
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v108, v113, 16);
    }
    while (v17);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v20 = v90;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v104, v112, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v105 != v24)
          objc_enumerationMutation(v20);
        objc_msgSend_addObject_(v13, v22, *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j));
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v104, v112, 16);
    }
    while (v23);
  }

  v26 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v98 = (void *)objc_msgSend_initWithLength_(v26, v27, 4 * (int)textureSize * 6 * (int)textureSize);
  v91 = objc_alloc_init(MDLTransform);
  v28 = (float32x4_t *)operator new();
  v29 = sub_1DCBC1068(v28, v91);
  v30 = 0;
  v31 = 0;
  v29.n128_u32[0] = textureSize;
  v32 = COERCE_DOUBLE(vdup_lane_s32((int32x2_t)v29.n128_u64[0], 0));
  v29.n128_u32[1] = 6 * textureSize;
  v99 = v29.n128_f64[0];
  v33 = 4 * textureSize * textureSize;
  do
  {
    v103.i32[2] = 0;
    v103.i64[0] = 0;
    v102.n128_u32[2] = 0;
    v102.n128_u64[0] = 0;
    sub_1DCB87AF8(v31, (__int128 *)&v103, (__int128 *)&v102);
    objc_msgSend_translation(v95, v34, v35);
    sub_1DCBC1214((uint64_t)v28, v36);
    sub_1DCBC1AD0(v28, v103, v102);
    v28[15].i32[0] = 1065353216;
    sub_1DCBC1034((simd_float4x4 *)v28);
    sub_1DCB56828((simd_float4x4 *)v28, 90.0);
    objc_msgSend_raytraceSceneWithCamera_reflection_irradiance_size_(v13, v37, (uint64_t)v28, v96, v97, v32);
    v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v41 = objc_msgSend_bytes(v38, v39, v40);
    v44 = objc_msgSend_length(v38, v42, v43);
    objc_msgSend_replaceBytesInRange_withBytes_length_(v98, v45, v30, v33, v41, v44);

    ++v31;
    v30 += v33;
  }
  while (v31 != 6);
  v46 = [MDLTexture alloc];
  isCube = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v46, v47, (uint64_t)v98, 1, 0, 4 * textureSize, 4, 1, v99, 1, v88);
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v48, (uint64_t)CFSTR("file:///tmp/reflective.png"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToURL_(isCube, v50, (uint64_t)v49);

  LODWORD(v51) = 1028443341;
  objc_msgSend_irradianceTextureCubeWithTexture_name_dimensions_roughness_(MDLTexture, v52, (uint64_t)isCube, 0, COERCE_DOUBLE(0x2000000020), v51);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v53, (uint64_t)CFSTR("file:///tmp/irradianceConvo.png"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToURL_(v92, v55, (uint64_t)v54);

  v56 = [MDLLightProbe alloc];
  v58 = (uint64_t *)objc_msgSend_initWithReflectiveTexture_irradianceTexture_(v56, v57, (uint64_t)isCube, v92);
  objc_msgSend_generateSphericalHarmonicsFromIrradiance_(v58, v59, 3);
  v60 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v93 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v60, v61, 24576));
  v89 = v28;
  v64 = objc_msgSend_bytes(v93, v62, v63);
  v66 = 5;
  v101 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  v67.i64[1] = 1132396544;
  do
  {
    v68 = 0;
    v69 = v66;
    do
    {
      v70 = 0;
      v71 = (_BYTE *)v64;
      do
      {
        v67.i64[0] = 0x3D0000003D000000;
        v72 = sub_1DCB87B7C(v70, v68, v69, v67, v65);
        v74 = (CGColor *)objc_msgSend_sampleSHAt_usingCoefficients_withLevel_(MDLLightProbe, v73, v58[13], v58[15], v72);
        Components = (float64x2_t *)CGColorGetComponents(v74);
        v76 = *(float32x4_t *)Components;
        *(float32x2_t *)v76.f32 = vcvt_f32_f64(*Components);
        v77 = Components[1].f64[0];
        v76.f32[2] = v77;
        v78 = vmulq_f32(v76, v101);
        v78.i32[3] = 0;
        v79 = vmaxnmq_f32(v78, (float32x4_t)0);
        v79.i32[3] = 0;
        v65 = (int8x16_t)xmmword_1DCC58560;
        v67 = (int8x16_t)vminnmq_f32(v79, (float32x4_t)xmmword_1DCC58560);
        *v71 = (int)*(float *)v67.i32;
        v65.i32[0] = v67.i32[1];
        v71[1] = (int)*(float *)&v67.i32[1];
        v71[2] = (int)*(float *)&v67.i32[2];
        v64 = (uint64_t)(v71 + 4);
        v71[3] = -1;
        ++v70;
        v71 += 4;
      }
      while (v70 != 32);
      ++v68;
    }
    while (v68 != 32);
    v66 = v69 - 1;
  }
  while (v69);
  v80 = [MDLTexture alloc];
  LOBYTE(v87) = 1;
  v82 = (void *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v80, v81, (uint64_t)v93, 0, 0, 128, 4, 1, COERCE_DOUBLE(0xC000000020), v87);
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v83, (uint64_t)CFSTR("file:///tmp/sh.png"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToURL_(v82, v85, (uint64_t)v84);

  (*(void (**)(float32x4_t *))(v89->i64[0] + 8))(v89);
  return (MDLLightProbe *)v58;
}

@end
