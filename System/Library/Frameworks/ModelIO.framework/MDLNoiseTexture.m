@implementation MDLNoiseTexture

- (id)_generateCellularNoiseAtLevel:(int64_t)a3 selector:(SEL)a4
{
  int32x2_t v4;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  int8x8_t v13;
  int32x2_t v14;
  int8x8_t v15;
  int v16;
  float smoothness;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int channelCount;
  int v24;
  float32x4_t v25;
  int v26;
  int8x16_t v27;
  float32x2_t v28;
  uint64_t v29;
  unint64_t v30;
  float32x4_t v31;
  unsigned int v32;
  int32x2_t v33;
  float32x4_t v34;
  uint64_t v35;
  float v36;
  uint64_t i;
  uint64_t v38;
  float32x2_t v39;
  int j;
  int8x16_t v41;
  float32x4_t v42;
  int32x4_t v43;
  float v44;
  float v45;
  float v46;
  int v48;
  float v49;

  if (self->super._textureData.channelCount != 1)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only single channel textures supported for cellular noise"), v10, v11);

  }
  v4.i32[0] = 0;
  v13.i32[1] = HIDWORD(*(_QWORD *)self->super._anon_118);
  v13.i32[0] = 1;
  v14 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->super._anon_118), 0), v13, *(int8x8_t *)self->super._anon_118);
  v15 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v14, 1)), 0), (int8x8_t)(v14.u32[0] | 0x100000000), (int8x8_t)v14);
  v48 = v15.i32[0];
  if (v15.i32[1] >> a3 <= 1)
    v16 = 1;
  else
    v16 = v15.i32[1] >> a3;
  smoothness = self->_smoothness;
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend_mutableBytes(v18, v19, v20);
  if (v48 >> a3 <= 1)
    v22 = 1;
  else
    v22 = (v48 >> a3);
  v49 = smoothness * (float)(1 << a3);
  channelCount = self->super._textureData.channelCount;
  v24 = sub_1DCAC8EDC(self->super._channelEncoding);
  v26 = 0;
  v27.i64[0] = 0xFFFFFFFFLL;
  v27.i64[1] = 0xFFFFFFFFLL;
  v28 = (float32x2_t)vdup_n_s32(0x2F800000u);
  do
  {
    v29 = 0;
    do
    {
      *(float *)&v30 = (float)(int)v29;
      *((float *)&v30 + 1) = (float)v26;
      v31 = vmulq_n_f32((float32x4_t)v30, v49);
      v32 = vcvtms_s32_f32(v31.f32[2]);
      *(float32x2_t *)v34.f32 = vrndm_f32(*(float32x2_t *)v31.f32);
      v33 = vcvt_s32_f32(*(float32x2_t *)v34.f32);
      v34.i64[1] = COERCE_UNSIGNED_INT(floorf(v31.f32[2]));
      v35 = -1;
      v36 = 3.4028e38;
      do
      {
        for (i = -1; i != 2; ++i)
        {
          v38 = 16777619 * ((i + v33.u32[1]) ^ (16777619 * ((v35 + v33.u32[0]) ^ 0x811C9DC5)));
          for (j = -1; j != 2; ++j)
          {
            v41.i64[0] = 4163728791u * (v38 ^ (v32 + j)) + 12345;
            v41.i64[1] = 1103515245 * v41.i64[0] + 12345;
            v39.f32[1] = (float)(int)i;
            v39.f32[0] = (float)(int)v35;
            *(float32x2_t *)v25.f32 = vmla_f32(v39, v28, vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vandq_s8(v41, v27))));
            v25.f32[2] = (float)j
                       + (float)((float)(1103515245
                                       * (1103515245 * (-131238505 * (v38 ^ (v32 + j)) + 12345) + 12345)
                                       + 12345)
                               * 2.3283e-10);
            v42 = vsubq_f32(v31, vaddq_f32(v34, v25));
            v43 = (int32x4_t)vmulq_f32(v42, v42);
            v44 = vaddq_f32(vaddq_f32((float32x4_t)v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.i8, 1)), (float32x4_t)vdupq_laneq_s32(v43, 2)).f32[0];
            if (v44 < v36)
              v36 = v44;
          }
        }
        ++v35;
      }
      while (v35 != 2);
      v45 = sqrtf(v36);
      if (v45 <= 1.0)
        v46 = v45 * 255.0;
      else
        v46 = 255.0;
      if (v46 > 255.0)
        v46 = 255.0;
      if (v46 < 0.0)
        v46 = 0.0;
      *(_BYTE *)(v21 + (channelCount * v22 * (v24 / 8) * v26 + v29++)) = (int)v46;
    }
    while (v29 != v22);
    ++v26;
  }
  while (v26 != v16);
  return v18;
}

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  int32x2_t v4;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  const char *v12;
  int channelCount;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  id v19;
  void *v21;
  objc_class *v22;
  const char *v23;
  int8x8_t v24;
  int32x2_t v25;
  int8x8_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  double v33;
  unsigned int v34;
  uint64_t v35;
  float v36;
  float v37;
  uint64_t v38;
  unsigned int v39;
  float v40;
  double v41;
  float v42;
  unsigned int v43;
  uint64_t v44;
  float v45;
  float v46;
  uint64_t v47;
  float v48;
  unsigned int v49;
  float v50;
  float32x4_t v51;
  float v52;
  __int32 v53;
  float v54;
  float32x4_t v55;
  unsigned int v56;
  uint64_t v57;
  float v58;
  float v59;
  uint64_t v60;
  id v62;
  float v63;
  float v64;
  __int32 v65;
  float32x4_t v66;
  float v67;
  float v68[4];

  if (!*(_DWORD *)&self->_grayScale)
  {
    objc_msgSend__generateCellularNoiseAtLevel_selector_(self, a2, a3, a4);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    return v19;
  }
  if (self->super._channelEncoding != 1)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v8, v12, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 8 bit textures supported"), v10, v11);

  }
  channelCount = self->super._textureData.channelCount;
  if (*(&self->super._hasAlphaValues + 1))
  {
    if (channelCount == 4)
      goto LABEL_14;
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v14, v18, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 4 channel textures supported for vector noise"), v16, v17);
    goto LABEL_13;
  }
  if (channelCount != 1 && channelCount != 4)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v21, v23, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 1 and 4 channel textures supported for scalar noise"), v16, v17);
LABEL_13:

  }
LABEL_14:
  v4.i32[0] = 0;
  v24.i32[1] = HIDWORD(*(_QWORD *)self->super._anon_118);
  v24.i32[0] = 1;
  v25 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, *(int32x2_t *)self->super._anon_118), 0), v24, *(int8x8_t *)self->super._anon_118);
  v26 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v4, vdup_lane_s32(v25, 1)), 0), (int8x8_t)(v25.u32[0] | 0x100000000), (int8x8_t)v25);
  if (v26.i32[0] >> a3 <= 1)
    v27 = 1;
  else
    v27 = (v26.i32[0] >> a3);
  if (v26.i32[1] >> a3 <= 1)
    v28 = 1;
  else
    v28 = (v26.i32[1] >> a3);
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v31 = objc_msgSend_mutableBytes(v19, v29, v30);
  v32 = (float)(1 << a3);
  if (*(&self->super._hasAlphaValues + 1))
  {
    v33 = __exp10((float)((float)(*(float *)(&self->super._hasAlphaValues + 2) * -2.0) + 3.0));
    v34 = 0;
    v35 = 0;
    *(float *)&v33 = v33;
    v36 = *(float *)&v33 * 0.00024414;
    v37 = v32 * 26.026;
    do
    {
      v38 = 0;
      v39 = v34;
      do
      {
        *(_QWORD *)v68 = 0;
        v67 = 0.0;
        v40 = sub_1DCAED364(&v68[1], v68, &v67, v36 * (float)(int)v38, v36 * (float)(int)v35, 0.0, 0.0);
        *(_BYTE *)(v31 + v39) = (int)(float)((float)(v37 * v68[1]) + 127.5);
        *(_BYTE *)(v31 + v39 + 1) = (int)(float)((float)(v37 * v68[0]) + 127.5);
        *(_BYTE *)(v31 + v39 + 2) = (int)(float)((float)(v37 * v67) + 127.5);
        *(_BYTE *)(v31 + v39 + 3) = (int)(float)((float)(v40 * 127.5) + 127.5);
        ++v38;
        v39 += 4;
      }
      while (v27 != v38);
      ++v35;
      v34 += 4 * v27;
    }
    while (v35 != v28);
  }
  else
  {
    v41 = v32;
    v42 = *(float *)(&self->super._hasAlphaValues + 2);
    if (self->super._textureData.channelCount == 4)
    {
      v62 = v19;
      v43 = 0;
      v44 = 0;
      v45 = __exp10((float)((float)(v42 * -2.0) + 3.0)) * v41;
      v46 = v45 * 0.00024414;
      v66 = (float32x4_t)vdupq_n_s32(0x42FF0000u);
      do
      {
        v47 = 0;
        v48 = v46 * (float)(int)v44;
        v49 = v43;
        do
        {
          v50 = v46 * (float)(int)v47;
          v51.i32[0] = sub_1DCBEBEC0(v50, v46 * (float)(int)v44);
          if (self->_vectorNoise)
          {
            v52 = 1.0;
            v53 = v51.i32[0];
            v54 = v51.f32[0];
          }
          else
          {
            v65 = v51.i32[0];
            v64 = sub_1DCBEBEC0(v50 + 1337.0, v48 + 1234.0);
            v63 = sub_1DCBEBEC0(v50 + -853.0, v48 + 11100.0);
            v52 = sub_1DCBEBEC0(v50 + 611.0, v48 + -8732.0);
            v53 = LODWORD(v64);
            v51.i32[0] = v65;
            v54 = v63;
          }
          v51.i32[1] = v53;
          v51.i64[1] = __PAIR64__(LODWORD(v52), LODWORD(v54));
          v55 = vmlaq_f32(v66, v66, v51);
          *(_BYTE *)(v31 + v49) = (int)v55.f32[0];
          *(_BYTE *)(v31 + v49 + 1) = (int)v55.f32[1];
          *(_BYTE *)(v31 + v49 + 2) = (int)v55.f32[2];
          *(_BYTE *)(v31 + v49 + 3) = (int)v55.f32[3];
          ++v47;
          v49 += 4;
        }
        while (v27 != v47);
        ++v44;
        v43 += 4 * v27;
      }
      while (v44 != v28);
      v19 = v62;
    }
    else
    {
      v56 = 0;
      v57 = 0;
      v58 = __exp10((float)((float)(v42 * -2.0) + 3.0)) * v41;
      v59 = v58 * 0.00024414;
      do
      {
        v60 = 0;
        do
        {
          *(_BYTE *)(v31 + v56 + v60) = (int)(float)((float)(sub_1DCBEBEC0(v59 * (float)(int)v60, v59 * (float)(int)v57)
                                                           * 127.5)
                                                   + 127.5);
          ++v60;
        }
        while (v27 != v60);
        ++v57;
        v56 += v27;
      }
      while (v57 != v28);
    }
  }
  return v19;
}

- (MDLNoiseTexture)initVectorNoiseWithSmoothness:(float)smoothness name:(NSString *)name textureDimensions:(vector_int2)textureDimensions channelEncoding:(MDLTextureChannelEncoding)channelEncoding
{
  char v6;
  NSString *v9;
  MDLNoiseTexture *v10;
  const char *v11;
  MDLNoiseTexture *v12;
  uint64_t v13;
  NSString *v14;
  MDLNoiseTexture *v15;
  objc_super v18;

  v6 = channelEncoding;
  v9 = name;
  v18.receiver = self;
  v18.super_class = (Class)MDLNoiseTexture;
  v10 = -[MDLTexture init](&v18, sel_init);
  v12 = v10;
  if (v10)
  {
    if (v9)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v11, (uint64_t)v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v12->super._name;
      v12->super._name = (NSString *)v13;
    }
    else
    {
      v14 = v10->super._name;
      v10->super._name = (NSString *)&stru_1EA577998;
    }

    *(vector_int2 *)v12->super._anon_118 = textureDimensions;
    v12->super._textureData.channelCount = 4;
    v12->super._channelEncoding = 1;
    *(_QWORD *)&v12->super._anon_118[8] = (v6 & 0xF) * (uint64_t)(4 * textureDimensions.i32[0]);
    *(&v12->super._hasAlphaValues + 1) = 1;
    *(float *)(&v12->super._hasAlphaValues + 2) = smoothness;
    v12->super._selfCreating = 1;
    v12->_vectorNoise = 0;
    *(_DWORD *)&v12->_grayScale = 1;
    v15 = v12;
  }

  return v12;
}

- (MDLNoiseTexture)initScalarNoiseWithSmoothness:(float)smoothness name:(NSString *)name textureDimensions:(vector_int2)textureDimensions channelCount:(int)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding grayscale:(BOOL)grayscale
{
  char v9;
  NSString *v13;
  MDLNoiseTexture *v14;
  const char *v15;
  MDLNoiseTexture *v16;
  uint64_t v17;
  NSString *v18;
  MDLNoiseTexture *v19;
  objc_super v22;

  v9 = channelEncoding;
  v13 = name;
  v22.receiver = self;
  v22.super_class = (Class)MDLNoiseTexture;
  v14 = -[MDLTexture init](&v22, sel_init);
  v16 = v14;
  if (v14)
  {
    if (v13)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v15, (uint64_t)v13);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v16->super._name;
      v16->super._name = (NSString *)v17;
    }
    else
    {
      v18 = v14->super._name;
      v14->super._name = (NSString *)&stru_1EA577998;
    }

    *(vector_int2 *)v16->super._anon_118 = textureDimensions;
    v16->super._textureData.channelCount = channelCount;
    v16->super._channelEncoding = 1;
    *(_QWORD *)&v16->super._anon_118[8] = (v9 & 0xF) * (uint64_t)(textureDimensions.i32[0] * channelCount);
    *(&v16->super._hasAlphaValues + 1) = 0;
    *(float *)(&v16->super._hasAlphaValues + 2) = smoothness;
    v16->super._selfCreating = 1;
    v16->_vectorNoise = grayscale;
    *(_DWORD *)&v16->_grayScale = 1;
    v19 = v16;
  }

  return v16;
}

- (MDLNoiseTexture)initCellularNoiseWithFrequency:(float)frequency name:(NSString *)name textureDimensions:(vector_int2)textureDimensions channelEncoding:(MDLTextureChannelEncoding)channelEncoding
{
  char v6;
  NSString *v9;
  MDLNoiseTexture *v10;
  const char *v11;
  MDLNoiseTexture *v12;
  uint64_t v13;
  NSString *v14;
  MDLNoiseTexture *v15;
  objc_super v18;

  v6 = channelEncoding;
  v9 = name;
  v18.receiver = self;
  v18.super_class = (Class)MDLNoiseTexture;
  v10 = -[MDLTexture init](&v18, sel_init);
  v12 = v10;
  if (v10)
  {
    v10->_smoothness = frequency;
    if (v9)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v11, (uint64_t)v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v12->super._name;
      v12->super._name = (NSString *)v13;
    }
    else
    {
      v14 = v10->super._name;
      v10->super._name = (NSString *)&stru_1EA577998;
    }

    *(vector_int2 *)v12->super._anon_118 = textureDimensions;
    v12->super._textureData.channelCount = 1;
    v12->super._channelEncoding = 1;
    *(_QWORD *)&v12->super._anon_118[8] = (v6 & 0xF) * (uint64_t)textureDimensions.i32[0];
    *(&v12->super._hasAlphaValues + 1) = 0;
    *(_DWORD *)(&v12->super._hasAlphaValues + 2) = 0;
    v12->super._selfCreating = 1;
    v12->_vectorNoise = 1;
    *(_DWORD *)&v12->_grayScale = 0;
    v15 = v12;
  }

  return v12;
}

@end
