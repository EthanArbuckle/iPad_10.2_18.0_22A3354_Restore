@implementation MDLCheckerboardTexture

- (void)dealloc
{
  const void *v3;
  CGColor *color1;
  objc_super v5;

  v3 = *(const void **)&self->_divisions;
  if (v3)
    CFRelease(v3);
  color1 = self->_color1;
  if (color1)
    CFRelease(color1);
  v5.receiver = self;
  v5.super_class = (Class)MDLCheckerboardTexture;
  -[MDLCheckerboardTexture dealloc](&v5, sel_dealloc);
}

- (void)setDivisions:(float)divisions
{
  if ((float)*(int *)(&self->super._hasAlphaValues + 2) != divisions)
    *(_DWORD *)(&self->super._hasAlphaValues + 2) = (int)divisions;
}

- (float)divisions
{
  return (float)*(int *)(&self->super._hasAlphaValues + 2);
}

- (void)setColor1:(CGColorRef)color1
{
  CGColor *v5;

  if (color1)
  {
    objc_msgSend_clearTexelData(self, a2, (uint64_t)color1);
    v5 = *(CGColor **)&self->_divisions;
    if (v5)
      CGColorRelease(v5);
    *(_QWORD *)&self->_divisions = CGColorCreateCopy(color1);
  }
}

- (CGColorRef)color1
{
  return *(CGColorRef *)&self->_divisions;
}

- (void)setColor2:(CGColorRef)color2
{
  CGColor *color1;

  if (color2)
  {
    objc_msgSend_clearTexelData(self, a2, (uint64_t)color2);
    color1 = self->_color1;
    if (color1)
      CGColorRelease(color1);
    self->_color1 = CGColorCreateCopy(color2);
  }
}

- (CGColorRef)color2
{
  return self->_color1;
}

- (id)generateDataAtLevel:(int64_t)a3 selector:(SEL)a4
{
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const CGFloat *Components;
  const CGFloat *v22;
  int16x8_t v23;
  float32x4_t v24;
  int32x2_t v25;
  uint64_t v26;
  int8x8_t v27;
  int32x2_t v28;
  int32x2_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int8x16_t v33;
  float32x2_t v34;
  uint64_t v35;
  uint64_t v36;
  float32x4_t v37;
  uint64_t v38;
  float32x2_t v44;
  int8x16_t v45;
  uint64_t v46;
  uint64_t v47;
  int8x16_t v48;
  int32x2_t v50;

  if (self->super._channelEncoding != 1)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v7, v11, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 8 bit textures supported"), v9, v10);

  }
  if (self->super._textureData.channelCount != 4)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v12, v16, (uint64_t)CFSTR("ModelIOException"), CFSTR("[%@ %@]: Only 4 channel textures supported"), v14, v15);

  }
  v50 = *(int32x2_t *)self->super._anon_118;
  objc_msgSend_allocateDataAtLevel_(self, a2, a3);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend_mutableBytes(v17, v18, v19);
  Components = CGColorGetComponents(*(CGColorRef *)&self->_divisions);
  v22 = CGColorGetComponents(self->_color1);
  v25.i32[0] = 0;
  v26 = 0;
  v27.i32[1] = v50.i32[1];
  v27.i32[0] = 1;
  v28 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v25, v50), 0), v27, (int8x8_t)v50);
  v29 = vmax_s32(vshl_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v25, vdup_lane_s32(v28, 1)), 0), (int8x8_t)(v28.u32[0] | 0x100000000), (int8x8_t)v28), vneg_s32(vdup_n_s32(a3))), (int32x2_t)0x100000001);
  v31 = *(int8x16_t *)Components;
  v30 = *(int8x16_t *)(Components + 2);
  v33 = *(int8x16_t *)v22;
  v32 = *(int8x16_t *)(v22 + 2);
  v34 = vcvt_f32_s32(v29);
  v35 = v29.u32[0];
  v36 = (4 * v29.i32[0]);
  v37 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  v38 = v29.u32[1];
  __asm { FMOV            V5.2S, #1.0 }
  v44 = vdiv_f32(_D5, v34);
  v45.i64[0] = 0x100000001;
  v45.i64[1] = 0x100000001;
  do
  {
    v46 = 0;
    v47 = 0;
    do
    {
      v23.i32[0] = 0;
      v24.f32[0] = (float)(int)v47;
      v24.f32[1] = (float)(int)v26;
      *(int32x2_t *)v24.f32 = vcvt_s32_f32(vmul_f32(vmul_n_f32(*(float32x2_t *)v24.f32, (float)*(int *)(&self->super._hasAlphaValues + 2)), v44));
      *(int32x2_t *)v24.f32 = vadd_s32(vdup_lane_s32(*(int32x2_t *)v24.f32, 1), *(int32x2_t *)v24.f32);
      v48 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32((int32x4_t)vandq_s8((int8x16_t)v24, v45), (int32x4_t)v23), 0);
      v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)vbslq_s8(v48, v33, v31)), (float64x2_t)vbslq_s8(v48, v32, v30));
      v23 = (int16x8_t)vcvtq_s32_f32(vmulq_f32(v24, v37));
      *(int16x4_t *)v23.i8 = vmovn_s32((int32x4_t)v23);
      *(int8x8_t *)v23.i8 = vmovn_s16(v23);
      *(_DWORD *)(v20 + v26 * v36 + (v46 & 0xFFFFFFFC)) = v23.i32[0];
      ++v47;
      v46 += 4;
    }
    while (v35 != v47);
    ++v26;
  }
  while (v26 != v38);
  return v17;
}

- (MDLCheckerboardTexture)initWithDivisions:(float)divisions name:(NSString *)name dimensions:(vector_int2)dimensions channelCount:(int)channelCount channelEncoding:(MDLTextureChannelEncoding)channelEncoding color1:(CGColorRef)color1 color2:(CGColorRef)color2
{
  NSString *v16;
  const char *v17;
  MDLCheckerboardTexture *v18;
  uint64_t v19;
  NSString *v20;
  MDLCheckerboardTexture *v21;
  objc_super v23;

  v16 = name;
  v23.receiver = self;
  v23.super_class = (Class)MDLCheckerboardTexture;
  v18 = -[MDLTexture init](&v23, sel_init);
  if (v18)
  {
    if (v16)
    {
      objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v17, (uint64_t)v16);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v18->super._name;
      v18->super._name = (NSString *)v19;

    }
    *(vector_int2 *)v18->super._anon_118 = dimensions;
    *(_DWORD *)(&v18->super._hasAlphaValues + 2) = (int)divisions;
    *(_QWORD *)&v18->_divisions = CGColorCreateCopy(color1);
    v18->_color1 = CGColorCreateCopy(color2);
    *(_QWORD *)&v18->super._anon_118[8] = (int)(4 * *(_QWORD *)v18->super._anon_118);
    v18->super._textureData.channelCount = channelCount;
    v18->super._channelEncoding = channelEncoding;
    v18->super._selfCreating = 1;
    v21 = v18;
  }

  return v18;
}

@end
