@implementation CISingleChannelColorMap

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[7];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryInterlaced");
  v9[3] = CFSTR("CICategoryNonSquarePixels");
  v9[4] = CFSTR("CICategoryStillImage");
  v9[5] = CFSTR("CICategoryBuiltIn");
  v9[6] = CFSTR("CICategoryApplePrivate");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v10[1] = CFSTR("inputChannelIndex");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeDefault");
  v8[0] = CFSTR("CIAttributeTypeInteger");
  v8[1] = &unk_1E2F1B560;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1B560;
  v8[3] = &unk_1E2F1B578;
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v10[2] = CFSTR("inputShouldNormalize");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = CFSTR("CIAttributeTypeBoolean");
  v6[1] = MEMORY[0x1E0C9AAB0];
  v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v10[3] = CFSTR("inputColorMapIndex");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1B560;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1B560;
  v4[3] = &unk_1E2F1B590;
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v11[4] = CFSTR("14");
  v10[4] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[5] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[5] = CFSTR("11.0");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)outputImage
{
  uint64_t v3;
  uint64_t v4;
  CIKernel *v5;
  CIColorKernel *v6;
  CIColorKernel *v7;
  uint64_t v8;
  CGColorSpace *v9;
  CIImage *v10;
  CIImage *v11;
  CIImage *inputImage;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CIImage *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CIImage *v30;
  _QWORD v32[4];
  int v33;
  _QWORD v34[2];
  const __CFString *v35;
  CIVector *v36;
  _QWORD v37[2];
  _QWORD v38[6];
  _QWORD v39[8];

  v39[6] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (-[NSNumber intValue](self->inputColorMapIndex, "intValue") < 0
    || -[NSNumber intValue](self->inputColorMapIndex, "intValue") <= 1)
  {
    v3 = -[NSNumber intValue](self->inputColorMapIndex, "intValue") < 0
       ? 0
       : -[NSNumber intValue](self->inputColorMapIndex, "intValue");
  }
  else
  {
    v3 = 1;
  }
  if (-[NSNumber intValue](self->inputChannelIndex, "intValue") < 0
    || -[NSNumber intValue](self->inputChannelIndex, "intValue") <= 3)
  {
    v4 = -[NSNumber intValue](self->inputChannelIndex, "intValue") < 0
       ? 0
       : -[NSNumber intValue](self->inputChannelIndex, "intValue");
  }
  else
  {
    v4 = 3;
  }
  v5 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ciSingleChannelColorMap);
  v6 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_ciExtractChannel);
  if (!v5)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v7 = v6;
  v39[0] = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", *(&colormaps + v3), 2048, 0);
  v38[0] = CFSTR("kCIImageProviderContentDigest");
  v38[1] = CFSTR("kCIImageProviderName");
  v39[1] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CISingleChannelColorMap_%d"), v3);
  v39[2] = MEMORY[0x1E0C9AAA0];
  v38[2] = CFSTR("CIImageFlipped");
  v38[3] = CFSTR("CIImageClampToEdge");
  v39[3] = MEMORY[0x1E0C9AAB0];
  v39[4] = MEMORY[0x1E0C9AAB0];
  v38[4] = CFSTR("kCIImageCacheHint");
  v38[5] = CFSTR("kCIImageAlphaOne");
  v39[5] = MEMORY[0x1E0C9AAB0];
  v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 6);
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  v10 = [CIImage alloc];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __38__CISingleChannelColorMap_outputImage__block_invoke;
  v32[3] = &__block_descriptor_36_e24_v56__0_v8Q16Q24Q32Q40Q48l;
  v33 = v3;
  v11 = -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](v10, "initWithImageProvider:width:height:format:colorSpace:options:", v32, 256, 1, 2056, v9, v8);
  CGColorSpaceRelease(v9);
  if (!v11)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  -[CIImage extent](inputImage, "extent");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v37[0] = inputImage;
  v37[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v21 = -[CIColorKernel applyWithExtent:arguments:](v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2), v14, v16, v18, v20);
  if (-[NSNumber BOOLValue](self->inputShouldNormalize, "BOOLValue"))
  {
    v35 = CFSTR("inputExtent");
    -[CIImage extent](v21, "extent");
    v36 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v21 = -[CIImage imageByApplyingFilter:withInputParameters:](v21, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRedNormalize"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  }
  -[CIImage extent](v21, "extent");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v34[0] = v21;
  v34[1] = -[CIImage imageByClampingToExtent](v11, "imageByClampingToExtent");
  v30 = -[CIKernel applyWithExtent:roiCallback:arguments:](v5, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_8, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2), v23, v25, v27, v29);

  return v30;
}

void *__38__CISingleChannelColorMap_outputImage__block_invoke(uint64_t a1, void *__b, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t v11;

  memset_pattern8(__b, &unk_1924920A8, a3);
  if (8 * a6 >= a3)
    v11 = a3;
  else
    v11 = 8 * a6;
  return memcpy(__b, (char *)*(&colormaps + *(unsigned int *)(a1 + 32)) + 16 * a4, v11);
}

double __38__CISingleChannelColorMap_outputImage__block_invoke_2(uint64_t a1, int a2)
{
  double result;

  if (a2 == 1)
    return 0.0;
  if (a2)
    return *MEMORY[0x1E0C9D648];
  return result;
}

- (NSNumber)inputChannelIndex
{
  return self->inputChannelIndex;
}

- (void)setInputChannelIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputShouldNormalize
{
  return self->inputShouldNormalize;
}

- (void)setInputShouldNormalize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputColorMapIndex
{
  return self->inputColorMapIndex;
}

- (void)setInputColorMapIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
