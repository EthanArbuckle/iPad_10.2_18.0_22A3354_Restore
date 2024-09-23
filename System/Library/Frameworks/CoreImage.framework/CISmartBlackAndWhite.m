@implementation CISmartBlackAndWhite

- (void)getNonNormalizedSettings:(id *)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float var2;
  float var1;
  double v11;
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  float v18;
  float v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;

  a3->var0 = 1;
  -[NSNumber floatValue](self->inputHue, "floatValue");
  a3->var1 = v5;
  -[NSNumber floatValue](self->inputStrength, "floatValue");
  a3->var2 = v6;
  -[NSNumber floatValue](self->inputNeutralGamma, "floatValue");
  a3->var3 = v7;
  -[NSNumber floatValue](self->inputTone, "floatValue");
  v28 = v8;
  a3->var4 = v8;
  var1 = a3->var1;
  var2 = a3->var2;
  v11 = var2;
  v12 = var2 * cos((float)(0.60167 - var1) * 6.28318531) + 1.0;
  if (v12 <= 1.0)
    v13 = v12 * -2.0 + 3.0;
  else
    v13 = (v12 + -1.0) * -0.55 + 1.0;
  v14 = v13;
  v15 = powf(0.3, v14);
  v16 = v11 * cos((float)(0.8663 - var1) * 6.28318531) + 1.0;
  if (v16 <= 1.0)
    v17 = v16 * -2.0 + 3.0;
  else
    v17 = (v16 + -1.0) * -0.55 + 1.0;
  v18 = v17;
  v19 = powf(0.6, v18);
  v20 = v11 * cos((float)(0.22284 - var1) * 6.28318531) + 1.0;
  if (v20 <= 1.0)
    v21 = v20 * -2.0 + 3.0;
  else
    v21 = (v20 + -1.0) * -0.55 + 1.0;
  v22 = v21;
  v23 = powf(0.1, v22);
  v24 = v23 + (float)(v15 + v19);
  a3->var5[0] = v15 / v24;
  a3->var5[1] = v19 / v24;
  a3->var5[2] = v23 / v24;
  if (a3->var0)
  {
    a3->var0 = 0;
    v25 = var1 * 0.5 + 0.35;
    if (v25 < 0.0)
      v25 = v25 + 1.0;
    v26 = (float)((float)(var2 + -0.5) * 1.2) + 0.4;
    if (var2 <= 0.5)
      v26 = var2 * 0.8;
    a3->var1 = v25;
    a3->var2 = v26;
    v27 = v28 + v28;
    if (v28 <= 0.0)
      v27 = v28;
    a3->var3 = a3->var3 + 1.0;
    a3->var4 = v27;
  }
}

- (float)createHueArray
{
  float *v2;
  uint64_t v3;
  int32x4_t v4;
  float32x4_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float64x2_t v22;
  float32x4_t v23;
  float64x2_t __x;
  long double v25;
  float64x2_t v26;
  int32x4_t v27;
  float64x2_t v28;
  _BYTE v29[4];
  int32x2_t v30;

  -[CISmartBlackAndWhite getNonNormalizedSettings:](self, "getNonNormalizedSettings:", v29);
  v2 = (float *)malloc_type_malloc(0x5A0uLL, 0x100004052888210uLL);
  v3 = 0;
  v4 = (int32x4_t)xmmword_19248E120;
  v22 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
  v23 = (float32x4_t)vdupq_n_s32(0x43B38000u);
  v20 = (float32x4_t)vdupq_lane_s32(v30, 0);
  v21 = (float32x4_t)vdupq_n_s32(0x3EE66666u);
  __asm { FMOV            V0.2D, #1.0 }
  v18 = _Q0;
  v19 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)&v30.i32[1]), 0);
  __asm { FMOV            V0.4S, #3.0 }
  v17 = _Q0;
  do
  {
    v27 = v4;
    v11 = vsubq_f32(vdivq_f32(vcvtq_f32_s32(v4), v23), v20);
    v28 = vmulq_f64(vcvt_hight_f64_f32(v11), v22);
    __x = vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)v11.f32), v22);
    v25 = cos(__x.f64[1]);
    v12.f64[0] = cos(__x.f64[0]);
    v12.f64[1] = v25;
    v26 = v12;
    __x.f64[0] = cos(v28.f64[1]);
    v13.f64[0] = cos(v28.f64[0]);
    v13.f64[1] = __x.f64[0];
    v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v18, v26, v19)), vmlaq_f64(v18, v13, v19));
    v15 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v21, v14), (int8x16_t)v21, (int8x16_t)v14);
    *(int8x16_t *)&v2[v3] = vbslq_s8((int8x16_t)vcgtq_f32(v15, v17), (int8x16_t)v17, (int8x16_t)v15);
    v15.i64[0] = 0x400000004;
    v15.i64[1] = 0x400000004;
    v4 = vaddq_s32(v27, (int32x4_t)v15);
    v3 += 4;
  }
  while (v3 != 360);
  return v2;
}

- (id)hueArrayImage:(float *)a3
{
  float *v4;
  void *v5;
  void *v6;
  float v7;
  uint64_t i;
  uint64_t v9;
  uint64_t j;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v4 = -[CISmartBlackAndWhite createHueArray](self, "createHueArray");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 368);
  v6 = v5;
  v7 = *v4;
  for (i = 1; i != 360; ++i)
  {
    if (v7 <= v4[i])
      v7 = v4[i];
  }
  v9 = objc_msgSend(v5, "mutableBytes");
  for (j = 0; j != 360; ++j)
    *(_BYTE *)(v9 + j) = (int)fmaxf(fminf((float)(v4[j] * 255.0) / v7, 255.0), 0.0);
  *a3 = v7;
  free(v4);
  v12[0] = CFSTR("CIImageColorSpace");
  v12[1] = CFSTR("CIImageFlipped");
  v12[2] = CFSTR("CIImageClampToEdge");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13[1] = MEMORY[0x1E0C9AAA0];
  v13[2] = MEMORY[0x1E0C9AAB0];
  v13[3] = MEMORY[0x1E0C9AAA0];
  v12[3] = CFSTR("CIImageNearestSampling");
  v12[4] = CFSTR("kCIImageCacheHint");
  v13[4] = MEMORY[0x1E0C9AAB0];
  return +[CIImage imageWithBitmapData:bytesPerRow:size:format:options:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:options:", v6, 368, 257, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5), 360.0, 1.0);
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[7];
  _QWORD v18[8];
  _QWORD v19[10];

  v19[8] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("CIAttributeFilterCategories");
  v17[0] = CFSTR("CICategoryColorEffect");
  v17[1] = CFSTR("CICategoryVideo");
  v17[2] = CFSTR("CICategoryInterlaced");
  v17[3] = CFSTR("CICategoryNonSquarePixels");
  v17[4] = CFSTR("CICategoryStillImage");
  v17[5] = CFSTR("CICategoryBuiltIn");
  v17[6] = CFSTR("CICategoryApplePrivate");
  v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 7);
  v18[1] = CFSTR("inputStrength");
  v15[0] = CFSTR("CIAttributeMin");
  v15[1] = CFSTR("CIAttributeSliderMin");
  v16[0] = &unk_1E2F1ABB0;
  v16[1] = &unk_1E2F1ABB0;
  v15[2] = CFSTR("CIAttributeSliderMax");
  v15[3] = CFSTR("CIAttributeMax");
  v16[2] = &unk_1E2F1ABC0;
  v16[3] = &unk_1E2F1ABC0;
  v15[4] = CFSTR("CIAttributeDefault");
  v15[5] = CFSTR("CIAttributeType");
  v16[4] = &unk_1E2F1ABD0;
  v16[5] = CFSTR("CIAttributeTypeScalar");
  v19[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v18[2] = CFSTR("inputNeutralGamma");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F1ABE0;
  v14[1] = &unk_1E2F1ABE0;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeMax");
  v14[2] = &unk_1E2F1ABC0;
  v14[3] = &unk_1E2F1ABC0;
  v13[4] = CFSTR("CIAttributeDefault");
  v13[5] = CFSTR("CIAttributeType");
  v14[4] = &unk_1E2F1ABB0;
  v14[5] = CFSTR("CIAttributeTypeScalar");
  v19[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v18[3] = CFSTR("inputTone");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1ABE0;
  v12[1] = &unk_1E2F1ABE0;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeMax");
  v12[2] = &unk_1E2F1ABC0;
  v12[3] = &unk_1E2F1ABC0;
  v11[4] = CFSTR("CIAttributeDefault");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1ABB0;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v19[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v18[4] = CFSTR("inputHue");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1ABE0;
  v10[1] = &unk_1E2F1ABE0;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1ABC0;
  v10[3] = &unk_1E2F1ABC0;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1ABB0;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v19[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v18[5] = CFSTR("inputGrain");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1ABB0;
  v8[1] = &unk_1E2F1ABB0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1ABC0;
  v8[3] = &unk_1E2F1ABC0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1ABB0;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v19[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v18[6] = CFSTR("inputSeed");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1ABB0;
  v6[1] = &unk_1E2F1ABB0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1ABC0;
  v6[3] = &unk_1E2F1ABB0;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v19[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v18[7] = CFSTR("inputScaleFactor");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F1ABB0;
  v4[1] = &unk_1E2F1ABC0;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = &unk_1E2F1ABC0;
  v4[3] = CFSTR("CIAttributeTypeScalar");
  v19[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smartBlackAndWhite);
}

- (id)outputImage
{
  id v3;
  CIVector *v4;
  CIImage *v5;
  CIVector *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  uint64_t v17;
  NSNumber *inputSeed;
  _BYTE v20[12];
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage
    || !self->inputNeutralGamma
    || !self->inputTone
    || !self->inputStrength
    || !self->inputScaleFactor)
  {
    return 0;
  }
  v26 = 1.0;
  v3 = -[CISmartBlackAndWhite hueArrayImage:](self, "hueArrayImage:", &v26);
  if (v3)
  {
    -[CISmartBlackAndWhite getNonNormalizedSettings:](self, "getNonNormalizedSettings:", v20);
    v4 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v23, v24, v25, v26);
    v5 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
    v6 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.997222245, 0.00138888892, v21, v22);
    v7 = -[CISmartBlackAndWhite _kernel](self, "_kernel");
    -[CIImage extent](self->inputImage, "extent");
    v29[0] = v5;
    v29[1] = v3;
    v29[2] = v4;
    v29[3] = v6;
    v3 = (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4), v8, v9, v10, v11), "imageByPremultiplyingAlpha");
    -[NSNumber floatValue](self->inputGrain, "floatValue");
    if (v12 > 0.0)
    {
      v13 = v12;
      -[NSNumber floatValue](self->inputScaleFactor, "floatValue");
      *(float *)&v15 = v14 * 100.0;
      v27[0] = CFSTR("inputISO");
      v28[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
      v27[1] = CFSTR("inputAmount");
      *(float *)&v16 = v13;
      v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
      v27[2] = CFSTR("inputSeed");
      inputSeed = self->inputSeed;
      v28[1] = v17;
      v28[2] = inputSeed;
      return (id)objc_msgSend(v3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPhotoGrain"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    }
  }
  return v3;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputNeutralGamma
{
  return self->inputNeutralGamma;
}

- (void)setInputNeutralGamma:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputTone
{
  return self->inputTone;
}

- (void)setInputTone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputHue
{
  return self->inputHue;
}

- (void)setInputHue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputGrain
{
  return self->inputGrain;
}

- (void)setInputGrain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputSeed
{
  return self->inputSeed;
}

- (void)setInputSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

@end
