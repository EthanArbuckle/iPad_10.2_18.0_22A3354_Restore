@implementation MDLPhotometricLight

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

- (MDLPhotometricLight)initWithIESProfile:(NSURL *)URL
{
  NSURL *v4;
  MDLPhotometricLight *v5;
  NSMutableData *v6;
  NSMutableData *sphericalHarmonicsCoefficients;
  const char *v8;
  const char *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const void *v15;
  const char *v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  RTLight *light;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  float32x4_t v25;
  float32x4_t v26;
  CGColorRef v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  float v35;
  const char *v36;
  uint64_t v37;
  MDLPhotometricLight *v38;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *__p;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *__dst;
  void *v53;
  uint64_t v54;
  void *v55[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;

  v4 = URL;
  v61.receiver = self;
  v61.super_class = (Class)MDLPhotometricLight;
  v5 = -[MDLPhysicallyPlausibleLight init](&v61, sel_init);
  if (v5)
  {
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    sphericalHarmonicsCoefficients = v5->_sphericalHarmonicsCoefficients;
    v5->_sphericalHarmonicsCoefficients = v6;

    objc_msgSend_setLightType_(v5, v8, 9);
    objc_msgSend_dataWithContentsOfURL_(MEMORY[0x1E0C99D50], v9, (uint64_t)v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_retainAutorelease(v10);
      v15 = (const void *)objc_msgSend_bytes(v12, v13, v14);
      v18 = objc_msgSend_length(v12, v16, v17);
      v19 = 0;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v56 = 0u;
      *(_OWORD *)v55 = 0u;
      __dst = 0;
      v53 = 0;
      v54 = 0;
      if (v18 != -1)
      {
        sub_1DCAE4B1C((unint64_t *)&__dst, v18 + 1);
        v19 = __dst;
      }
      memcpy(v19, v15, v18);
      *((_BYTE *)__dst + v18) = 0;
      sub_1DCB2D000(__dst, (unint64_t)__dst + v18, (uint64_t)v55);
      light = v5->super.super._light;
      if (light)
        (*((void (**)(RTLight *))light->var0 + 1))(light);
      v21 = operator new();
      v40 = v55[0];
      v41 = 0;
      v42 = 0;
      v43 = 0;
      sub_1DCB2ECD4(&v41, v55[1], v56, (uint64_t)(v56 - (unint64_t)v55[1]) >> 2);
      v44 = 0;
      v45 = 0;
      v46 = 0;
      sub_1DCB2ECD4(&v44, (const void *)v57, *((uint64_t *)&v57 + 1), (uint64_t)(*((_QWORD *)&v57 + 1) - v57) >> 2);
      __p = 0;
      v48 = 0;
      v49 = 0;
      sub_1DCB2ECD4(&__p, *((const void **)&v58 + 1), v59, (uint64_t)(v59 - *((_QWORD *)&v58 + 1)) >> 2);
      v50 = v60;
      v51 = DWORD2(v60);
      objc_msgSend_transform(v5, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25.i32[0] = 1170939904;
      v27 = sub_1DCAECFE4(v25, v26);
      sub_1DCB88A68(v21, &v40, v24, v27);
      v5->_iesLight = (void *)v21;

      if (__p)
      {
        v48 = __p;
        operator delete(__p);
      }
      if (v44)
      {
        v45 = v44;
        operator delete(v44);
      }
      if (v41)
      {
        v42 = v41;
        operator delete(v41);
      }
      v5->super.super._light = (RTLight *)v5->_iesLight;
      LODWORD(v30) = DWORD2(v60);
      objc_msgSend_setLumens_(v5, v28, v29, v30);
      *((_DWORD *)v5->_iesLight + 38) = 1056964608;
      objc_msgSend_lumens(v5, v31, v32);
      if (v35 == -1.0)
        objc_msgSend_computeLumens(v5, v33, v34);
      objc_msgSend_computeInnerAngle(v5, v33, v34);
      objc_msgSend_setInnerConeAngle_(v5, v36, v37);
      if (__dst)
      {
        v53 = __dst;
        operator delete(__dst);
      }
      if (*((_QWORD *)&v58 + 1))
      {
        *(_QWORD *)&v59 = *((_QWORD *)&v58 + 1);
        operator delete(*((void **)&v58 + 1));
      }
      if ((_QWORD)v57)
      {
        *((_QWORD *)&v57 + 1) = v57;
        operator delete((void *)v57);
      }
      if (v55[1])
      {
        *(void **)&v56 = v55[1];
        operator delete(v55[1]);
      }
    }
    else
    {
      NSLog(CFSTR("URL provided for IES initialization not valid"));
    }
    v38 = v5;

  }
  return v5;
}

- (void)generateCubemapFromLight:(NSUInteger)textureSize
{
  unsigned int v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int8x16_t v11;
  float v12;
  int v13;
  int8x16_t v14;
  int v15;
  int v16;
  int v17;
  _BYTE *v18;
  float32x4_t v19;
  id *iesLight;
  id v21;
  const char *v22;
  uint64_t v23;
  float32x4_t v24;
  CGColor *v25;
  float64x2_t *Components;
  float32x4_t v27;
  float32_t v28;
  float32x4_t v29;
  float32x4_t v30;
  MDLTexture *v31;
  const char *v32;
  MDLTexture *isCube;
  MDLTexture *lightCubeMap;
  char v35;
  unsigned int v36;
  id v37;
  float32x4_t v38;
  float32x4_t v39;

  v5 = 6 * textureSize;
  v6 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v36 = v5;
  v37 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v6, v7, (int)(4 * textureSize * v5)));
  v10 = objc_msgSend_bytes(v37, v8, v9);
  if (self->_iesLight)
  {
    v11.i64[0] = 1.0;
    v13 = 5;
    v38 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v14 = (int8x16_t)xmmword_1DCC58560;
    do
    {
      v15 = v13;
      if ((int)textureSize >= 1)
      {
        v16 = 0;
        do
        {
          v17 = 0;
          v18 = (_BYTE *)v10;
          do
          {
            v12 = 1.0 / (double)(int)textureSize;
            *(float *)v14.i32 = v12;
            *(double *)v19.i64 = sub_1DCB87B7C(v17, v16, v15, v14, v11);
            v39 = v19;
            iesLight = (id *)self->_iesLight;
            v21 = iesLight[2];
            objc_msgSend_translation(v21, v22, v23);
            v25 = (CGColor *)(*((uint64_t (**)(id *, float32x4_t))*iesLight + 2))(iesLight, vaddq_f32(v24, v39));

            Components = (float64x2_t *)CGColorGetComponents(v25);
            v27 = *(float32x4_t *)Components;
            *(float32x2_t *)v27.f32 = vcvt_f32_f64(*Components);
            v28 = Components[1].f64[0];
            v27.f32[2] = v28;
            v29 = vmulq_f32(v27, v38);
            v29.i32[3] = 0;
            v30 = vmaxnmq_f32(v29, (float32x4_t)0);
            v30.i32[3] = 0;
            v11 = (int8x16_t)xmmword_1DCC58560;
            v14 = (int8x16_t)vminnmq_f32(v30, (float32x4_t)xmmword_1DCC58560);
            *v18 = (int)*(float *)v14.i32;
            v11.i32[0] = v14.i32[1];
            v18[1] = (int)*(float *)&v14.i32[1];
            v18[2] = (int)*(float *)&v14.i32[2];
            v10 = (uint64_t)(v18 + 4);
            v18[3] = -1;
            ++v17;
            v18 += 4;
          }
          while ((_DWORD)textureSize != v17);
          ++v16;
        }
        while (v16 != (_DWORD)textureSize);
      }
      v13 = v15 - 1;
    }
    while (v15);
  }
  v31 = [MDLTexture alloc];
  v35 = 1;
  isCube = (MDLTexture *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v31, v32, (uint64_t)v37, 0, 0, 4 * textureSize, 4, 1, COERCE_DOUBLE(__PAIR64__(v36, textureSize)), v35);
  lightCubeMap = self->_lightCubeMap;
  self->_lightCubeMap = isCube;

}

- (void)computeLumens
{
  uint64_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int v6;
  float v7;
  float v8;
  int v9;
  int v10;
  int i;
  float32x4_t v12;
  id *iesLight;
  id v14;
  const char *v15;
  uint64_t v16;
  float32x4_t v17;
  const char *v18;
  uint64_t v19;
  float v20;
  float32x4_t v21;

  if (self->_iesLight)
  {
    v6 = 5;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      v9 = 0;
      v10 = v6;
      do
      {
        for (i = 0; i != 128; ++i)
        {
          v3.i64[0] = 0x3C0000003C000000;
          *(double *)v12.i64 = sub_1DCB87B7C(i, v9, v10, v3, v4);
          v21 = v12;
          iesLight = (id *)self->_iesLight;
          v14 = iesLight[2];
          objc_msgSend_translation(v14, v15, v16);
          v20 = *((float *)self->_iesLight + 34) * sub_1DCB88C1C((uint64_t)iesLight, v18, v19, vaddq_f32(v17, v21));

          *(float *)v3.i32 = sub_1DCB87D04(i, v9, 128);
          v7 = v7 + (float)(v20 * *(float *)v3.i32);
          v8 = *(float *)v3.i32 + v8;
        }
        ++v9;
      }
      while (v9 != 128);
      v6 = v10 - 1;
    }
    while (v10);
    *(double *)v3.i64 = v7 * 12.5663706 / v8;
    *(float *)v3.i32 = *(double *)v3.i64;
  }
  else
  {
    v3.i32[0] = 2143289344;
  }
  objc_msgSend_setLumens_(self, a2, v2, *(double *)v3.i64);
}

- (float)computeInnerAngle
{
  float *iesLight;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  float result;
  float *v13;
  unint64_t v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float v19;

  iesLight = (float *)self->_iesLight;
  v4 = *((_QWORD *)iesLight + 11);
  v3 = *((_QWORD *)iesLight + 12);
  v5 = v3 - v4;
  if (v3 == v4)
    return -1.0;
  v6 = 0;
  v7 = 0;
  v8 = v5 >> 2;
  v10 = *((_QWORD *)iesLight + 8);
  v9 = *((_QWORD *)iesLight + 9);
  v11 = (v9 - v10) >> 2;
  if (v11 <= 1)
    v11 = 1;
  if (v8 <= 1)
    v8 = 1;
  result = -1.0;
  do
  {
    if (v9 != v10)
    {
      v13 = (float *)(*((_QWORD *)iesLight + 14) + v6);
      v14 = v11;
      v15 = (float *)*((_QWORD *)iesLight + 8);
      do
      {
        v16 = *v15++;
        v17 = v16;
        v18 = *v13++;
        v19 = iesLight[35] * v18;
        if (result < v17 && v19 > 0.0)
          result = v17;
        --v14;
      }
      while (v14);
    }
    ++v7;
    v6 += (v9 - v10) & 0xFFFFFFFFFFFFFFFCLL;
  }
  while (v7 != v8);
  return result;
}

- (MDLTexture)generateTexture:(NSUInteger)textureSize
{
  float v5;
  id *iesLight;
  float v7;
  id v8;
  const char *v9;
  uint64_t v10;
  float32x4_t v11;
  const char *v12;
  uint64_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  id v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int8x16_t v32;
  int8x16_t v33;
  uint64_t v34;
  int v35;
  double v36;
  uint64_t v37;
  float v38;
  float v39;
  double v40;
  float v41;
  float v42;
  int8x16_t v43;
  float v44;
  float v45;
  float v46;
  int8x16_t v47;
  int8x16_t v48;
  float v49;
  float v50;
  __float2 v51;
  __float2 v52;
  float32x4_t v53;
  int32x4_t v54;
  float32x2_t v55;
  float32x2_t v56;
  CGColor *v57;
  float64x2_t *v58;
  float32x4_t v59;
  float32_t v60;
  float32x4_t v61;
  float32x4_t v62;
  MDLTexture *v63;
  const char *v64;
  uint64_t v65;
  MDLTexture *v66;
  id v67;
  const char *v68;
  const char *v69;
  MDLTexture *isCube;
  id v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int32x4_t v82;
  float32x2_t v83;
  float32x2_t v84;
  int32x4_t v85;
  float v86;
  void *v87;
  float32x4_t v88;
  float32x4_t v89;
  __float2 v90;
  float32x4_t v91;
  int32x4_t v92;
  CGColor *v93;
  float64x2_t *Components;
  float32x4_t v95;
  float32_t v96;
  float32x4_t v97;
  float32x4_t v98;
  MDLTexture *v99;
  const char *v100;
  void *v101;
  MDLTexture *lightCubeMap;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  float32x4_t v108;
  float32x4_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  float32x4_t v114;
  float v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  int8x16_t v119;
  float32x4_t v120;
  char v121;

  objc_msgSend_innerConeAngle(self, a2, textureSize);
  iesLight = (id *)self->_iesLight;
  if (!iesLight)
  {
    NSLog(CFSTR("IESLight not properly initialized, cannot generate texture."));
    v121 = 0;
    v66 = [MDLTexture alloc];
    v67 = objc_alloc(MEMORY[0x1E0C99D50]);
    v8 = (id)objc_msgSend_initWithBytes_length_(v67, v68, (uint64_t)&v121, 1);
    isCube = (MDLTexture *)objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v66, v69, (uint64_t)v8, 0, 0, 1, 1, 1, COERCE_DOUBLE(0x100000001), 0);
LABEL_30:
    v101 = isCube;
    goto LABEL_31;
  }
  v7 = v5;
  v8 = iesLight[2];
  objc_msgSend_translation(v8, v9, v10);
  v117 = v11;
  objc_msgSend_rotationMatrixAtTime_(v8, v12, v13, 0.0);
  v107 = v14;
  v109 = v15;
  v111 = v16;
  v114 = v17;
  objc_msgSend_rotationMatrixAtTime_(v8, v18, v19, 0.0);
  v118 = v24;
  if (*((_QWORD *)self->_iesLight + 12) - *((_QWORD *)self->_iesLight + 11) == 4 && v7 < 180.0)
  {
    v104 = v22;
    v105 = v23;
    v106 = v21;
    v71 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v28 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v71, v72, textureSize));
    v75 = objc_msgSend_bytes(v28, v73, v74);
    if ((int)textureSize >= 1)
    {
      v76 = v75;
      v77 = 0;
      __asm { FMOV            V1.4S, #-1.0 }
      v116 = vmlaq_f32(vmlaq_f32(vmlaq_f32(vmulq_f32(v107, (float32x4_t)0), (float32x4_t)0, v109), _Q1, v111), (float32x4_t)0, v114);
      v82 = (int32x4_t)vmulq_f32(v116, v116);
      v82.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v82.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v82.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v82, 2)).u32[0];
      v83 = vrsqrte_f32((float32x2_t)v82.u32[0]);
      v84 = vmul_f32(vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v83, v83)), v83);
      *(float32x2_t *)v82.i8 = vmul_f32(v84, vrsqrts_f32((float32x2_t)v82.u32[0], vmul_f32(v84, v84)));
      v113 = (float32x4_t)v82;
      v120 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v118, (float32x4_t)0, v106), (float32x4_t)0, v104), (float32x4_t)0, v105);
      v85 = (int32x4_t)vmulq_f32(v120, v120);
      v85.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v85.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v85.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v85, 2)).u32[0];
      *(float32x2_t *)v82.i8 = vrsqrte_f32((float32x2_t)v85.u32[0]);
      *(float32x2_t *)v82.i8 = vmul_f32(vrsqrts_f32((float32x2_t)v85.u32[0], vmul_f32(*(float32x2_t *)v82.i8, *(float32x2_t *)v82.i8)), *(float32x2_t *)v82.i8);
      v108 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      *(float32x2_t *)v85.i8 = vmul_f32(*(float32x2_t *)v82.i8, vrsqrts_f32((float32x2_t)v85.u32[0], vmul_f32(*(float32x2_t *)v82.i8, *(float32x2_t *)v82.i8)));
      v110 = (float32x4_t)v85;
      v86 = v7 * 0.017453;
      do
      {
        v87 = self->_iesLight;
        v90 = __sincosf_stret((float)(v86 * (float)(int)v77) * (float)(1.0 / (float)(textureSize - 1)));
        v89.f32[0] = v90.__cosval;
        v88.f32[0] = v90.__sinval;
        v91 = vmlaq_n_f32(vmulq_n_f32(v120, vmulq_f32(v88, v110).f32[0]), v116, vmulq_f32(v89, v113).f32[0]);
        v92 = (int32x4_t)vmulq_f32(v91, v91);
        v92.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v92.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v92, 2)).u32[0];
        *(float32x2_t *)v89.f32 = vrsqrte_f32((float32x2_t)v92.u32[0]);
        *(float32x2_t *)v89.f32 = vmul_f32(vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(*(float32x2_t *)v89.f32, *(float32x2_t *)v89.f32)), *(float32x2_t *)v89.f32);
        v93 = (CGColor *)(*(uint64_t (**)(void *, float32x4_t))(*(_QWORD *)v87 + 16))(v87, vmlaq_n_f32(v117, v91, vmul_f32(*(float32x2_t *)v89.f32, vrsqrts_f32((float32x2_t)v92.u32[0], vmul_f32(*(float32x2_t *)v89.f32, *(float32x2_t *)v89.f32))).f32[0]));
        Components = (float64x2_t *)CGColorGetComponents(v93);
        v95 = *(float32x4_t *)Components;
        *(float32x2_t *)v95.f32 = vcvt_f32_f64(*Components);
        v96 = Components[1].f64[0];
        v95.f32[2] = v96;
        v97 = vmulq_f32(v95, v108);
        v97.i32[3] = 0;
        v98 = vmaxnmq_f32(v97, (float32x4_t)0);
        v98.i32[3] = 0;
        *(_BYTE *)(v76 + v77++) = (int)vminnmq_f32(v98, (float32x4_t)xmmword_1DCC58560).f32[0];
      }
      while ((_DWORD)textureSize != (_DWORD)v77);
    }
    v99 = [MDLTexture alloc];
    v65 = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v99, v100, (uint64_t)v28, 0, 0, (int)textureSize, 1, 1, COERCE_DOUBLE(textureSize | 0x100000000), 0);
    goto LABEL_26;
  }
  if (v7 >= 89.0)
  {
    lightCubeMap = self->_lightCubeMap;
    if (!lightCubeMap)
    {
      objc_msgSend_generateCubemapFromLight_(self, v20, textureSize);
      lightCubeMap = self->_lightCubeMap;
    }
    isCube = lightCubeMap;
    goto LABEL_30;
  }
  v26 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v28 = objc_retainAutorelease((id)objc_msgSend_initWithLength_(v26, v27, textureSize * textureSize));
  v31 = objc_msgSend_bytes(v28, v29, v30);
  if ((int)textureSize >= 1)
  {
    v34 = v31;
    v35 = 0;
    v112 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    v115 = v7 * 0.017453;
    v36 = 1.0 / (double)(int)textureSize;
    do
    {
      v37 = 0;
      v38 = ((double)v35 + (double)v35) * v36 + -1.0;
      v39 = v38 * v38;
      v40 = v38;
      do
      {
        *(double *)v32.i64 = ((double)(int)v37 + (double)(int)v37) * v36 + -1.0;
        *(float *)v32.i32 = *(double *)v32.i64;
        v119 = v32;
        v41 = sqrtf(v39 + (float)(*(float *)v32.i32 * *(float *)v32.i32));
        *(double *)v32.i64 = v41;
        if (v41 < 0.01)
          *(double *)v32.i64 = 0.01;
        *(double *)v32.i64 = v40 / *(double *)v32.i64;
        *(float *)v32.i32 = *(double *)v32.i64;
        v42 = fabsf(*(float *)v32.i32);
        v33.i32[0] = 1.0;
        v43.i64[0] = 0x8000000080000000;
        v43.i64[1] = 0x8000000080000000;
        LODWORD(v44) = vbslq_s8(v43, v33, v32).u32[0];
        if (*(float *)v32.i32 == 0.0)
          v44 = 0.0;
        if (v42 > 1.0)
          *(float *)v32.i32 = v44;
        v45 = v115 * v41;
        v46 = acosf(*(float *)v32.i32);
        v47.i64[0] = 0x8000000080000000;
        v47.i64[1] = 0x8000000080000000;
        v48.i32[0] = 1.0;
        LODWORD(v49) = vbslq_s8(v47, v48, v119).u32[0];
        if (*(float *)v119.i32 == 0.0)
          v49 = 0.0;
        v50 = v46 * v49;
        v51 = __sincosf_stret(v45);
        v52 = __sincosf_stret(v50);
        v53.f32[0] = v52.__sinval * v51.__sinval;
        v53.f32[1] = v52.__cosval * v51.__sinval;
        v53.f32[2] = -v51.__cosval;
        v54 = (int32x4_t)vmulq_f32(v53, v53);
        v54.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v54.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v54.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v54, 2)).u32[0];
        v55 = vrsqrte_f32((float32x2_t)v54.u32[0]);
        v56 = vmul_f32(vrsqrts_f32((float32x2_t)v54.u32[0], vmul_f32(v55, v55)), v55);
        v57 = (CGColor *)(*(uint64_t (**)(void *, float32x4_t))(*(_QWORD *)self->_iesLight + 16))(self->_iesLight, vmlaq_n_f32(v117, v53, vmul_f32(v56, vrsqrts_f32((float32x2_t)v54.u32[0], vmul_f32(v56, v56))).f32[0]));
        v58 = (float64x2_t *)CGColorGetComponents(v57);
        v59 = *(float32x4_t *)v58;
        *(float32x2_t *)v59.f32 = vcvt_f32_f64(*v58);
        v60 = v58[1].f64[0];
        v59.f32[2] = v60;
        v61 = vmulq_f32(v59, v112);
        v61.i32[3] = 0;
        v62 = vmaxnmq_f32(v61, (float32x4_t)0);
        v62.i32[3] = 0;
        v32 = (int8x16_t)vminnmq_f32(v62, (float32x4_t)xmmword_1DCC58560);
        *(_BYTE *)(v34 + v37++) = (int)*(float *)v32.i32;
      }
      while ((_DWORD)textureSize != (_DWORD)v37);
      ++v35;
      v34 += v37;
    }
    while (v35 != (_DWORD)textureSize);
  }
  v63 = [MDLTexture alloc];
  v65 = objc_msgSend_initWithData_topLeftOrigin_name_dimensions_rowStride_channelCount_channelEncoding_isCube_(v63, v64, (uint64_t)v28, 0, 0, (int)textureSize, 1, 1, COERCE_DOUBLE(vdup_n_s32(textureSize)), 0);
LABEL_26:
  v101 = (void *)v65;

LABEL_31:
  return (MDLTexture *)v101;
}

- (id)computeSceneKitRenderingTexture:(unint64_t)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_generateTexture_, a3);
}

- (void)generateSphericalHarmonicsFromLight:(NSUInteger)sphericalHarmonicsLevel
{
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  const char *v10;
  __int128 v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  float *v20;
  const char *v21;
  uint64_t v22;
  size_t v23;
  float *v24;
  uint64_t v25;
  int8x16_t v26;
  int8x16_t v27;
  float v28;
  uint64_t v29;
  int v30;
  float v31;
  uint64_t i;
  uint64_t j;
  float32x4_t v34;
  float v35;
  id v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  float *v41;
  _BYTE *v42;
  uint64_t v43;
  float *v44;
  unint64_t v45;
  float v46;
  unint64_t v47;
  float v48;
  float v49;
  float *v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  float *v54;
  id v55;
  uint64_t v56;
  __int128 v57;
  float32x4_t v58;

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
  objc_msgSend_dimensions(self->_lightCubeMap, a2, sphericalHarmonicsLevel);
  v57 = v11;
  objc_msgSend_texelDataWithBottomLeftOrigin(self->_lightCubeMap, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_iesLight)
  {
    v55 = v14;
    v16 = (sphericalHarmonicsLevel + 1) * (sphericalHarmonicsLevel + 1);
    v17 = v16;
    objc_msgSend_setLength_(self->_sphericalHarmonicsCoefficients, v15, 12 * v16);
    v20 = (float *)objc_msgSend_mutableBytes(self->_sphericalHarmonicsCoefficients, v18, v19);
    v23 = objc_msgSend_length(self->_sphericalHarmonicsCoefficients, v21, v22);
    v54 = v20;
    bzero(v20, v23);
    self->_sphericalHarmonicsLevel = sphericalHarmonicsLevel;
    v24 = (float *)malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL);
    v56 = 0;
    v27.i64[1] = *((_QWORD *)&v57 + 1);
    v25 = v57;
    v26.i64[0] = 1.0;
    *(double *)v27.i64 = 1.0 / (double)(int)v57;
    v28 = *(double *)v27.i64;
    v29 = 2 * v16;
    v30 = v16;
    v53 = v16 & 0xFFFFFFFD;
    v31 = 0.0;
    do
    {
      if ((int)v25 >= 1)
      {
        for (i = 0; i != v25; ++i)
        {
          for (j = 0; j != v25; ++j)
          {
            *(float *)v27.i32 = v28;
            *(double *)v34.i64 = sub_1DCB87B7C(i, j, v56, v27, v26);
            v58 = v34;
            v35 = sub_1DCB87D04(i, j, v25);
            v36 = objc_retainAutorelease(v55);
            v39 = objc_msgSend_bytes(v36, v37, v38);
            switch(sphericalHarmonicsLevel)
            {
              case 0uLL:
                sub_1DCB878DC(v24);
                break;
              case 1uLL:
                sub_1DCB878EC((uint64_t)v24, (int8x16_t)v58);
                break;
              case 2uLL:
                sub_1DCB87934((uint64_t)v24, (int8x16_t)v58);
                break;
              case 3uLL:
                sub_1DCB879F4((uint64_t)v24, v58);
                break;
              default:
                break;
            }
            if (v30 >= 1)
            {
              v41 = v54;
              v42 = (_BYTE *)(v39 + 4 * (int)v25 * (int)v25 * (5 - (int)v56) + 4 * ((int)i + (int)j * (int)v25));
              *(double *)v27.i64 = v35 * 0.00392156863;
              v43 = v53;
              v44 = v24;
              do
              {
                LOBYTE(v40) = *v42;
                *(double *)&v45 = (double)*(unint64_t *)&v40;
                v46 = *v41 + *(double *)v27.i64 * *v44 * *(double *)&v45;
                *v41 = v46;
                LOBYTE(v45) = v42[1];
                *(double *)&v47 = (double)v45;
                v48 = v41[v17] + *(double *)v27.i64 * *v44 * *(double *)&v47;
                v41[v17] = v48;
                v49 = *v44++;
                LOBYTE(v47) = v42[2];
                v40 = (double)v47;
                *(double *)v26.i64 = v41[v29] + *(double *)v27.i64 * v49 * v40;
                *(float *)v26.i32 = *(double *)v26.i64;
                v41[v29] = *(float *)v26.i32;
                ++v41;
                --v43;
              }
              while (v43);
            }
            v31 = v35 + v31;
          }
        }
      }
      ++v56;
    }
    while (v56 != 6);
    v50 = v54;
    if (v30 >= 1)
    {
      LODWORD(v52) = 3 * v30;
      if (3 * v30 <= 1)
        v52 = 1;
      else
        v52 = v52;
      do
      {
        v51 = 12.5663706 / v31;
        *v50 = *v50 * v51;
        ++v50;
        --v52;
      }
      while (v52);
    }
    free(v24);
    v14 = v55;
  }

}

- (CGColor)evaluatedColorFromSHVector:(MDLPhotometricLight *)self
{
  float32x4_t v2;
  int v4;
  size_t v5;
  float *v6;
  const char *v7;
  uint64_t v8;
  __int32 *v9;
  int32x4_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x4_t v13;
  float32x4_t v14;
  uint64_t v15;
  float32x4_t v16;
  float *v17;
  float v18;
  CGColorSpace *DeviceRGB;
  CGColor *v20;
  float32x4_t v22;
  float32x4_t v23;
  CGFloat components[2];
  double v25;
  uint64_t v26;
  uint64_t v27;

  v22 = v2;
  v27 = *MEMORY[0x1E0C80C00];
  v4 = LODWORD(self->_sphericalHarmonicsLevel) + 1;
  v5 = (v4 * v4);
  v6 = (float *)malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
  v9 = (__int32 *)objc_msgSend_mutableBytes(self->_sphericalHarmonicsCoefficients, v7, v8);
  v10 = (int32x4_t)vmulq_f32(v22, v22);
  v10.i32[0] = vadd_f32(vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1)), (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2)).u32[0];
  v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
  v12 = vmul_f32(vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)), v11);
  v13 = vmulq_n_f32(v22, vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
  switch(self->_sphericalHarmonicsLevel)
  {
    case 0uLL:
      sub_1DCB878DC(v6);
      if (v4)
        goto LABEL_9;
      goto LABEL_16;
    case 1uLL:
      sub_1DCB878EC((uint64_t)v6, (int8x16_t)v13);
      if (!v4)
        goto LABEL_16;
      goto LABEL_9;
    case 2uLL:
      sub_1DCB87934((uint64_t)v6, (int8x16_t)v13);
      if (v4)
        goto LABEL_9;
      goto LABEL_16;
    case 3uLL:
      sub_1DCB879F4((uint64_t)v6, v13);
      if (!v4)
        goto LABEL_16;
      goto LABEL_9;
    default:
      NSLog(CFSTR("Computation of Spherical Harmonics Coefficients level %lu not yet supported"), *(double *)v13.i64, self->_sphericalHarmonicsLevel);
      if (v4)
      {
LABEL_9:
        if (v5 <= 1)
          v15 = 1;
        else
          v15 = v5;
        v16 = 0uLL;
        v17 = v6;
        do
        {
          v14.i32[0] = *v9;
          v18 = *v17++;
          v14.i32[1] = v9[v5];
          *(float32x2_t *)v14.f32 = vmul_n_f32(*(float32x2_t *)v14.f32, v18);
          v14.f32[2] = *(float *)&v9[(2 * v5)] * v18;
          v16 = vaddq_f32(v14, v16);
          ++v9;
          --v15;
        }
        while (v15);
      }
      else
      {
LABEL_16:
        v16 = 0uLL;
      }
      v23 = v16;
      free(v6);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v23.f32);
      v25 = v23.f32[2];
      v26 = 0x3FF0000000000000;
      v20 = CGColorCreate(DeviceRGB, components);
      CGColorSpaceRelease(DeviceRGB);
      return v20;
  }
}

- (MDLTexture)lightCubeMap
{
  return self->_lightCubeMap;
}

- (NSUInteger)sphericalHarmonicsLevel
{
  return self->_sphericalHarmonicsLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightCubeMap, 0);
  objc_storeStrong((id *)&self->_sphericalHarmonicsCoefficients, 0);
}

@end
