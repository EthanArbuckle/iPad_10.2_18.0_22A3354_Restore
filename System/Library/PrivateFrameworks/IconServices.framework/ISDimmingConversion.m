@implementation ISDimmingConversion

- (ISDimmingConversion)initWithCGImage:(CGImage *)a3
{
  ISDimmingConversion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISDimmingConversion;
  v4 = -[ISDimmingConversion init](&v6, sel_init);
  if (v4)
  {
    v4->_cgImage = CGImageRetain(a3);
    *(_QWORD *)&v4->_targetHighlightBrightnessLevel = 0x3EE666663F6CCCCDLL;
    v4->_minMeanBrightnessAdjustmentFactor = 0.65;
  }
  return v4;
}

- (void)dealloc
{
  __CFData *data;
  objc_super v4;

  CGImageRelease(self->_cgImage);
  data = self->_data;
  if (data)
    CFRelease(data);
  free(*(void **)&self->_ucharDimmed[7]);
  v4.receiver = self;
  v4.super_class = (Class)ISDimmingConversion;
  -[ISDimmingConversion dealloc](&v4, sel_dealloc);
}

- (BOOL)_prepareSamplesIfNeeded
{
  CGImage *cgImage;
  CGImageAlphaInfo AlphaInfo;
  __CFData *v5;
  const UInt8 *BytePtr;
  int Height;
  int v8;

  if (*(_QWORD *)self->_ucharSamples)
    goto LABEL_2;
  cgImage = self->_cgImage;
  if (!cgImage)
    return (char)cgImage;
  if (CGImageGetBitsPerComponent(cgImage) != 8 || CGImageGetBitsPerPixel(self->_cgImage) != 32)
    goto LABEL_13;
  AlphaInfo = CGImageGetAlphaInfo(self->_cgImage);
  LOBYTE(cgImage) = 0;
  if (AlphaInfo <= kCGImageAlphaNoneSkipLast && ((1 << AlphaInfo) & 0x2A) != 0)
  {
    cgImage = CGImageGetDataProvider(self->_cgImage);
    if (cgImage)
    {
      cgImage = CGDataProviderCopyData(cgImage);
      if (cgImage)
      {
        v5 = cgImage;
        BytePtr = CFDataGetBytePtr(cgImage);
        if (BytePtr)
        {
          self->_data = v5;
          *(_QWORD *)self->_ucharSamples = BytePtr;
          self->_width = CGImageGetWidth(self->_cgImage);
          Height = CGImageGetHeight(self->_cgImage);
          v8 = self->_width * Height;
          self->_height = Height;
          self->_numberOfSamples = v8;
          self->_alphaInfo = AlphaInfo;
LABEL_2:
          LOBYTE(cgImage) = 1;
          return (char)cgImage;
        }
        CFRelease(v5);
LABEL_13:
        LOBYTE(cgImage) = 0;
      }
    }
  }
  return (char)cgImage;
}

- (void)_computeDimmingParameters
{
  float targetMeanBrightnessLevel;
  float targetHighlightBrightnessLevel;
  uint64_t v5;
  unsigned int alphaInfo;
  int numberOfSamples;
  _DWORD *v8;
  uint64_t v9;
  float v10;
  uint8x8_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int32x2_t v14;
  uint64_t v15;
  int32x2_t v16;
  int v17;
  int v18;
  int v19;
  float v20;
  float v21;
  int32x2_t v22;
  uint64_t v23;
  float v24;
  float v30;
  float32x4_t v31;
  uint64_t v32;
  float v33;
  float v34;
  BOOL v35;
  float32x4_t v36;
  float v37;
  float32x4_t v38;
  unint64_t v39;
  float v40;
  float v41;
  float v42;
  float v43;
  int8x16_t v44;
  unsigned int v45;
  _OWORD v46[25];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (-[ISDimmingConversion _prepareSamplesIfNeeded](self, "_prepareSamplesIfNeeded"))
  {
    targetHighlightBrightnessLevel = self->_targetHighlightBrightnessLevel;
    targetMeanBrightnessLevel = self->_targetMeanBrightnessLevel;
    v5 = *(_QWORD *)self->_ucharSamples;
    alphaInfo = self->_alphaInfo;
    numberOfSamples = self->_numberOfSamples;
    v8 = malloc_type_malloc(0x1F40uLL, 0x100004052888210uLL);
    v9 = 0;
    v45 = 10;
    v10 = (float)numberOfSamples;
    do
    {
      *(float *)v11.i32 = (float)(v10 * (float)rand_r(&v45)) * 4.6566e-10;
      LODWORD(v46[0]) = 0;
      computeSampleAndLuma(v5, (int)*(float *)v11.i32, alphaInfo, 0, 0, 0, v46, v11, v12, v13);
      v8[v9++] = v46[0];
    }
    while (v9 != 2000);
    v15 = 0;
    v16.i32[1] = 0;
    memset(v46, 0, sizeof(v46));
    do
    {
      v17 = (int)(float)(*(float *)&v8[v15] * 100.0);
      if (v17 >= 99)
        v17 = 99;
      ++*((_DWORD *)v46 + v17);
      ++v15;
    }
    while (v15 != 2000);
    v18 = 0;
    v19 = 99;
    while (1)
    {
      v18 += *((_DWORD *)v46 + v19);
      if (v18 >= 300)
        break;
      if (--v19 == -1)
      {
        v20 = 1.0;
        goto LABEL_13;
      }
    }
    v20 = (float)v19 / 99.0;
LABEL_13:
    v21 = 1.0;
    if (v20 > targetHighlightBrightnessLevel)
    {
      v21 = targetHighlightBrightnessLevel / v20;
      *(float *)v14.i32 = 1.0 - (float)(targetHighlightBrightnessLevel / v20);
      *(float *)v16.i32 = 1.0 / *(float *)v14.i32;
      *(float *)v14.i32 = -*(float *)v14.i32;
      *(float *)v16.i32 = *(float *)v16.i32 + -1.0;
      v43 = *(float *)v16.i32;
      v22 = vdup_lane_s32(v16, 0);
      v23 = 0x3FFFFFFFFFFFF830;
      v37 = *(float *)v22.i32;
      v38 = (float32x4_t)vdupq_lane_s32(v14, 0);
      v24 = *(float *)&v22.i32[1];
      __asm { FMOV            V0.4S, #1.0 }
      v36 = _Q0;
      do
      {
        v44 = *(int8x16_t *)&v8[v23 + 2000];
        v42 = powf(*(float *)v44.i32, v43);
        v41 = powf(*(float *)&v44.i32[1], v43);
        v39 = vextq_s8(v44, v44, 8uLL).u64[0];
        v40 = powf(*((float *)&v39 + 1), v24);
        v30 = powf(*(float *)&v39, v37);
        v31.i64[0] = __PAIR64__(LODWORD(v41), LODWORD(v42));
        v31.i64[1] = __PAIR64__(LODWORD(v40), LODWORD(v30));
        *(float32x4_t *)&v8[v23 + 2000] = vmulq_f32((float32x4_t)v44, vmlaq_f32(v36, v31, v38));
        v23 += 4;
      }
      while (v23 * 4);
    }
    v32 = 0;
    v33 = 0.0;
    do
      v33 = v33 + *(float *)&v8[v32++];
    while (v32 != 2000);
    v34 = v33 / 2000.0;
    self->_hasDimmingParameters = 1;
    v35 = v34 > targetMeanBrightnessLevel || v20 > targetHighlightBrightnessLevel;
    self->_isDimmable = v35;
    self->_highlightBrightnessAdjustmentFactor = v21;
    self->_shouldAdjustHighlightBrightness = v20 > targetHighlightBrightnessLevel;
    self->_meanBrightnessAfterHighlightAdjustment = v34;
    self->_shouldAdjustMeanBrightness = v34 > targetMeanBrightnessLevel;
    free(v8);
  }
}

- (BOOL)isDimmable
{
  if (!self->_hasDimmingParameters)
    -[ISDimmingConversion _computeDimmingParameters](self, "_computeDimmingParameters");
  return self->_isDimmable;
}

- (BOOL)_computeDimmedImage
{
  _BOOL4 v3;
  float32x4_t v4;
  int8x16_t v5;
  _DWORD *v6;
  uint64_t numberOfSamples;
  uint64_t v8;
  uint64_t v9;
  unsigned int alphaInfo;
  _BOOL4 shouldAdjustHighlightBrightness;
  float meanBrightnessAfterHighlightAdjustment;
  _BOOL4 shouldAdjustMeanBrightness;
  float v14;
  float v15;
  float v16;
  float v17;
  uint8x8_t v18;
  float32x2_t v19;
  float v20;
  int16x8_t v21;
  __n128 v22;
  float v23;
  float v24;
  double v25;
  __n128 v26;
  unsigned __int32 v27;
  __n128 v28;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v32;
  float v33;
  uint64_t v34;
  float32x4_t v35;

  v3 = -[ISDimmingConversion isDimmable](self, "isDimmable");
  if (v3)
  {
    v6 = *(_DWORD **)&self->_ucharDimmed[7];
    if (!v6)
    {
      v6 = malloc_type_malloc(4 * self->_numberOfSamples, 0x100004052888210uLL);
      *(_QWORD *)&self->_ucharDimmed[7] = v6;
    }
    numberOfSamples = self->_numberOfSamples;
    if ((int)numberOfSamples >= 1)
    {
      v8 = 0;
      v9 = *(_QWORD *)self->_ucharSamples;
      alphaInfo = self->_alphaInfo;
      shouldAdjustHighlightBrightness = self->_shouldAdjustHighlightBrightness;
      meanBrightnessAfterHighlightAdjustment = self->_meanBrightnessAfterHighlightAdjustment;
      shouldAdjustMeanBrightness = self->_shouldAdjustMeanBrightness;
      v14 = fminf(fmaxf((float)(self->_targetMeanBrightnessLevel+ (float)((float)-(float)(meanBrightnessAfterHighlightAdjustment* meanBrightnessAfterHighlightAdjustment)* meanBrightnessAfterHighlightAdjustment))/ (float)(meanBrightnessAfterHighlightAdjustment+ (float)((float)-(float)(meanBrightnessAfterHighlightAdjustment* meanBrightnessAfterHighlightAdjustment)* meanBrightnessAfterHighlightAdjustment)), self->_minMeanBrightnessAdjustmentFactor), 1.0);
      v15 = 1.0 - self->_highlightBrightnessAdjustmentFactor;
      v5.i32[0] = -1.0;
      v16 = (float)(1.0 / v15) + -1.0;
      v17 = -v15;
      v4.i64[0] = 1.0;
      v18 = (uint8x8_t)0x3F8000003F800000;
      v19 = (float32x2_t)vdup_n_s32(0x437F0000u);
      do
      {
        v35.i32[2] = 0;
        v34 = 0;
        v35.i64[0] = 0;
        computeSampleAndLuma(v9, v8, alphaInfo, &v35, (_DWORD *)&v34 + 1, (float *)&v34, 0, v18, (int8x16_t)v4, v5);
        v20 = *(float *)&v34;
        if (*(float *)&v34 == 0.0)
        {
          v21 = 0uLL;
        }
        else
        {
          v22 = (__n128)v35;
          if (shouldAdjustHighlightBrightness)
          {
            v32 = v35;
            v33 = *(float *)&v34;
            v23 = powf(*((float *)&v34 + 1), v16);
            v20 = v33;
            v22 = (__n128)vmulq_n_f32(v32, (float)(v17 * v23) + 1.0);
          }
          if (shouldAdjustMeanBrightness)
          {
            v24 = ((float)(v14 * *((float *)&v34 + 1))
                 + (1.0 - v14) * (float)(*((float *)&v34 + 1) * (float)(*((float *)&v34 + 1) * *((float *)&v34 + 1))))
                / *((float *)&v34 + 1);
            v25 = ISSegmentationMathUtils_rgb2lab(v22);
            v26.n128_f32[0] = v24 * *(float *)&v25;
            v26.n128_u32[1] = HIDWORD(v25);
            v26.n128_u32[2] = v27;
            v28.n128_u64[0] = (unint64_t)ISSegmentationMathUtils_lab2rgb(v26, (float32x4_t)v26);
            v22 = v28;
            v20 = *(float *)&v34;
          }
          v22.n128_u32[3] = 0;
          v29 = vmaxnmq_f32((float32x4_t)v22, (float32x4_t)0);
          v29.i32[3] = 0;
          v30 = vminnmq_f32(v29, (float32x4_t)xmmword_1AA977320);
          *(float32x2_t *)v4.f32 = vmul_f32(*(float32x2_t *)v30.f32, v19);
          v5.i32[0] = 1132396544;
          v4.i64[1] = COERCE_UNSIGNED_INT(vmuls_lane_f32(255.0, v30, 2)) | 0x437F000000000000;
          v21 = (int16x8_t)vcvtq_s32_f32(vmulq_n_f32(v4, v20));
          *(int16x4_t *)v21.i8 = vmovn_s32((int32x4_t)v21);
        }
        v18 = (uint8x8_t)vmovn_s16(v21);
        v6[v8++] = v18.i32[0];
      }
      while (numberOfSamples != v8);
    }
  }
  return v3;
}

- (CGImage)createDimmedImage
{
  if (-[ISDimmingConversion _computeDimmedImage](self, "_computeDimmedImage"))
    return ISCreateCGImageUchar4AlphaPremultiplied(self->_width, self->_height, *(_QWORD *)&self->_ucharDimmed[7]);
  else
    return 0;
}

- (float)targetHighlightBrightnessLevel
{
  return self->_targetHighlightBrightnessLevel;
}

- (void)setTargetHighlightBrightnessLevel:(float)a3
{
  self->_targetHighlightBrightnessLevel = a3;
}

- (float)targetMeanBrightnessLevel
{
  return self->_targetMeanBrightnessLevel;
}

- (void)setTargetMeanBrightnessLevel:(float)a3
{
  self->_targetMeanBrightnessLevel = a3;
}

- (float)minMeanBrightnessAdjustmentFactor
{
  return self->_minMeanBrightnessAdjustmentFactor;
}

- (void)setMinMeanBrightnessAdjustmentFactor:(float)a3
{
  self->_minMeanBrightnessAdjustmentFactor = a3;
}

@end
