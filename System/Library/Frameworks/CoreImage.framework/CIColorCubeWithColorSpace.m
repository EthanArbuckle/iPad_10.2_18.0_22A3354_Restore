@implementation CIColorCubeWithColorSpace

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[7];
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("CIAttributeFilterCategories");
  v8[0] = CFSTR("CICategoryColorEffect");
  v8[1] = CFSTR("CICategoryVideo");
  v8[2] = CFSTR("CICategoryInterlaced");
  v8[3] = CFSTR("CICategoryNonSquarePixels");
  v8[4] = CFSTR("CICategoryStillImage");
  v8[5] = CFSTR("CICategoryHighDynamicRange");
  v8[6] = CFSTR("CICategoryBuiltIn");
  v10[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 7);
  v10[1] = CFSTR("7");
  v9[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v9[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v10[2] = CFSTR("10.9");
  v9[3] = CFSTR("inputCubeDimension");
  v6[0] = CFSTR("CIAttributeMin");
  v6[1] = CFSTR("CIAttributeMax");
  v7[0] = &unk_1E2F1B4E8;
  v7[1] = &unk_1E2F1B500;
  v6[2] = CFSTR("CIAttributeDefault");
  v6[3] = CFSTR("CIAttributeIdentity");
  v7[2] = &unk_1E2F1B4E8;
  v7[3] = &unk_1E2F1B4E8;
  v6[4] = CFSTR("CIAttributeType");
  v7[4] = CFSTR("CIAttributeTypeCount");
  v10[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v9[4] = CFSTR("inputCubeData");
  v4[0] = CFSTR("CIAttributeDefault");
  if (defaultCube(void)::onceToken != -1)
    dispatch_once(&defaultCube(void)::onceToken, &__block_literal_global_6);
  v4[1] = CFSTR("CIAttributeIdentity");
  v5[0] = defaultCube(void)::data;
  v5[1] = defaultCube(void)::data;
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v9[5] = CFSTR("inputColorSpace");
  v10[4] = v2;
  v10[5] = MEMORY[0x1E0C9AA70];
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6, v4[0]);
}

- (id)outputImage
{
  id inputColorSpace;
  id v4;
  CFTypeID v5;
  CIImage *inputImage;
  char v7;
  CIImage *v8;
  int v9;
  CIVector *v10;
  id v11;
  id v12;
  id v13;
  id result;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (!self->super.inputImage || !-[CIColorCube _checkInputs](self, "_checkInputs"))
    return 0;
  inputColorSpace = self->inputColorSpace;
  if (inputColorSpace == (id)objc_msgSend(MEMORY[0x1E0C99E38], "null") || (v4 = self->inputColorSpace) == 0)
  {
    v4 = 0;
    inputImage = self->super.inputImage;
    v7 = 1;
    goto LABEL_9;
  }
  v5 = CFGetTypeID(v4);
  if (v5 != CGColorSpaceGetTypeID() || CGColorSpaceGetModel((CGColorSpaceRef)v4) != kCGColorSpaceModelRGB)
  {
    NSLog(CFSTR("CIColorCubeWithColorSpace inputColorSpace must be an RGB CGColorSpaceRef"));
    return 0;
  }
  inputImage = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->super.inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v4);
  v7 = 0;
LABEL_9:
  v8 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v9 = -[NSNumber intValue](self->super.inputCubeDimension, "intValue");
  v10 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (double)v9 + -1.0, 1.0 / ((double)v9 + -1.0), 1.0 / (double)v9, 1.0 / (double)(v9 * v9));
  v11 = -[CIColorCube cubeImage](self, "cubeImage");
  if (objc_msgSend(v11, "isOpaque"))
    v12 = -[CIColorCube _kernelOpaque](self, "_kernelOpaque");
  else
    v12 = -[CIColorCube _kernel](self, "_kernel");
  v13 = v12;
  if (-[NSNumber BOOLValue](self->super.inputExtrapolate, "BOOLValue"))
  {
    if (objc_msgSend(v11, "isOpaque"))
      v13 = -[CIColorCube _kernelOpaqueExtend](self, "_kernelOpaqueExtend");
    else
      v13 = 0;
  }
  -[CIImage extent](v8, "extent");
  v19[0] = v8;
  v19[1] = v11;
  v19[2] = v10;
  result = (id)objc_msgSend((id)objc_msgSend(v13, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3), v15, v16, v17, v18), "imageByPremultiplyingAlpha");
  if ((v7 & 1) == 0)
    return (id)objc_msgSend(result, "imageByColorMatchingColorSpaceToWorkingSpace:", v4);
  return result;
}

- (id)inputColorSpace
{
  return self->inputColorSpace;
}

- (void)setInputColorSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
