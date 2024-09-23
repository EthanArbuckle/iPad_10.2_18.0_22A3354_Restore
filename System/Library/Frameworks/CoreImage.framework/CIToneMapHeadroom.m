@implementation CIToneMapHeadroom

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[7];
  _QWORD v8[5];
  _QWORD v9[7];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorAdjustment");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryInterlaced");
  v7[3] = CFSTR("CICategoryHighDynamicRange");
  v7[4] = CFSTR("CICategoryNonSquarePixels");
  v7[5] = CFSTR("CICategoryStillImage");
  v7[6] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v9[1] = CFSTR("18");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("15.0");
  v8[3] = CFSTR("inputSourceHeadroom");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1B518;
  v6[1] = &unk_1E2F1B518;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F1B530;
  v6[3] = &unk_1E2F1B548;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputTargetHeadroom");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1B518;
  v4[1] = &unk_1E2F1B518;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1B530;
  v4[3] = &unk_1E2F1B548;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1B518;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (float)targetHeadroom
{
  float v2;
  float v3;
  BOOL v4;
  float result;

  -[NSNumber floatValue](-[CIToneMapHeadroom inputTargetHeadroom](self, "inputTargetHeadroom"), "floatValue");
  v3 = 1.0;
  if (v2 >= 1.0)
    v3 = v2;
  v4 = v2 > 0.0;
  result = 0.0;
  if (v4)
    return v3;
  return result;
}

- (Uniforms)uniforms:(SEL)a3
{
  Uniforms *result;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  float v16;

  if (self->inputSourceHeadroom)
    result = (Uniforms *)-[NSNumber floatValue](self->inputSourceHeadroom, "floatValue");
  else
    result = (Uniforms *)-[CIImage contentHeadroom](self->inputImage, "contentHeadroom");
  if (v7 < 1.0)
    v7 = 1.0;
  v8 = fmaxf(a4, v7);
  v9 = fminf((float)((float)(fminf((float)(v8 + -1.0) / 3.9261, 1.0) * -0.5) + 1.0) + (float)((float)(a4 + -1.0) * 0.29999), 1.0);
  v10 = a4 / v9;
  v11 = (float)(a4 * 0.001) / 3.0;
  v12 = (float)(v8 + 1.0) + (float)((float)(a4 / v9) * -2.0);
  v13 = fabsf(v12);
  v14 = v8 + (float)(v11 - v12);
  v15 = v13 > v11;
  if (v13 <= v11)
    v16 = v8 + (float)(v11 - v12);
  else
    v16 = v8;
  if (!v15)
    v12 = (float)(v14 + 1.0) + (float)((float)(a4 / v9) * -2.0);
  retstr->var0 = v8;
  retstr->var1 = a4;
  retstr->var2 = v9;
  retstr->var3 = v12;
  retstr->var4 = -(float)(v16 - (float)(v10 * v10));
  retstr->var5 = 1.0 - v10;
  retstr->var6 = v9 - a4;
  return result;
}

- (id)outputValue:(id)a3
{
  float v5;
  void *v6;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  -[CIToneMapHeadroom targetHeadroom](self, "targetHeadroom");
  if (v5 == 0.0)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a3, "floatValue");
    return (id)objc_msgSend(v6, "numberWithFloat:");
  }
  else
  {
    if (self)
      -[CIToneMapHeadroom uniforms:](self, "uniforms:");
    objc_msgSend(a3, "floatValue", 0);
    v9 = 0.0;
    if (*(float *)&v8 > 1.0)
    {
      v10 = (float)(sqrtf(fmaxf((float)(0.0 * *(float *)&v8) + 0.0, 0.0)) + 0.0) / 0.0;
      v11 = (float)(0.0 * v10) * (v10 + -2.0) + 0.0;
      if (*(float *)&v8 >= v12)
        v11 = v13;
      v9 = fminf(v11 / *(float *)&v8, 1.0);
    }
    *(float *)&v8 = *(float *)&v8 * v9;
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  }
}

- (id)outputImage
{
  CIColorKernel *v3;
  CIImage *v4;
  float v5;
  float v6;
  CGColorSpace *v7;
  double v8;
  CIImage *v9;
  double v10;
  CGColorSpace *v12;
  CIImage *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  CIImage *v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_headroomToneMap);
  v4 = -[CIToneMapHeadroom inputImage](self, "inputImage");
  -[CIToneMapHeadroom targetHeadroom](self, "targetHeadroom");
  if (v5 > 0.0)
  {
    v6 = v5;
    v7 = -[CIImage colorSpace](self->inputImage, "colorSpace");
    if (CGColorSpaceContainsFlexGTCInfo())
    {
      v9 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v4, "imageByColorMatchingWorkingSpaceToColorSpace:", v7);
      *(float *)&v10 = v6;
      return -[CIImage _imageByToneMappingColorSpaceToWorkingSpace:targetHeadroom:](v9, "_imageByToneMappingColorSpaceToWorkingSpace:targetHeadroom:", v7, v10);
    }
    *(float *)&v8 = v6;
    -[CIToneMapHeadroom uniforms:](self, "uniforms:", v8);
    v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D950]);
    if (v12)
      v4 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v4, "imageByColorMatchingWorkingSpaceToColorSpace:", v12);
    v13 = -[CIImage imageByUnpremultiplyingAlpha](v4, "imageByUnpremultiplyingAlpha");
    -[CIImage extent](v13, "extent");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v29[0] = v13;
    LODWORD(v14) = 0;
    v29[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    LODWORD(v22) = 0;
    v29[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    LODWORD(v23) = 0;
    v29[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v29[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v24 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 5);
    v27 = CFSTR("kCIImageContentHeadroom");
    *(float *)&v25 = v6;
    v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (CIImage *)objc_msgSend(-[CIColorKernel applyWithExtent:arguments:options:](v3, "applyWithExtent:arguments:options:", v24, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1), v15, v17, v19, v21), "imageByPremultiplyingAlpha");
    v4 = v26;
    if (v12)
      v4 = -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](v26, "imageByColorMatchingColorSpaceToWorkingSpace:", v12);
    CGColorSpaceRelease(v12);
  }
  return v4;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputSourceHeadroom
{
  return self->inputSourceHeadroom;
}

- (void)setInputSourceHeadroom:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputTargetHeadroom
{
  return self->inputTargetHeadroom;
}

- (void)setInputTargetHeadroom:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
