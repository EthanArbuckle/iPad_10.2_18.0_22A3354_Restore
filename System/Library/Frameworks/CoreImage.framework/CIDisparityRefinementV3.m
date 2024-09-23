@implementation CIDisparityRefinementV3

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("CIAttributeFilterCategories");
  v6[0] = CFSTR("CICategoryColorAdjustment");
  v6[1] = CFSTR("CICategoryVideo");
  v6[2] = CFSTR("CICategoryStillImage");
  v6[3] = CFSTR("CICategoryBuiltIn");
  v6[4] = CFSTR("CICategoryApplePrivate");
  v2 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v7[1] = CFSTR("inputDraftMode");
  v8[0] = v2;
  v4[0] = CFSTR("CIAttributeType");
  v4[1] = CFSTR("CIAttributeSliderMin");
  v5[0] = CFSTR("CIAttributeTypeInteger");
  v5[1] = &unk_1E2F1BFB0;
  v4[2] = CFSTR("CIAttributeSliderMax");
  v4[3] = CFSTR("CIAttributeDefault");
  v5[2] = &unk_1E2F1BFC8;
  v5[3] = &unk_1E2F1BFB0;
  v8[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
}

- (id)alphaImageForMainImage:(id)a3 disparity:(id)a4
{
  CIImage *inputMatteImage;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CIImage *v21;
  double v22;
  CGAffineTransform v24;

  inputMatteImage = self->inputMatteImage;
  if (inputMatteImage)
  {
    objc_msgSend(a4, "extent");
    v8 = v7;
    v10 = v9;
    objc_msgSend(a3, "extent");
    v12 = v11 * 0.5;
    if (v11 * 0.5 > v8)
    {
      objc_msgSend(a3, "extent", v12);
      v8 = v13 * 0.5;
    }
    objc_msgSend(a3, "extent", v12);
    if (v14 * 0.5 > v10)
    {
      objc_msgSend(a3, "extent", v14 * 0.5);
      v10 = v15 * 0.5;
    }
    -[CIImage extent](self->inputMatteImage, "extent");
    v17 = vabdd_f64(v8, v16);
    -[CIImage extent](self->inputMatteImage, "extent");
    if (v17 > 0.1 || vabdd_f64(v10, v18) > 0.1)
    {
      -[CIImage extent](self->inputMatteImage, "extent");
      v20 = v8 / v19;
      -[CIImage extent](self->inputMatteImage, "extent");
      v21 = self->inputMatteImage;
      CGAffineTransformMakeScale(&v24, v20, v10 / v22);
      return -[CIImage imageByApplyingTransform:](v21, "imageByApplyingTransform:", &v24);
    }
  }
  return inputMatteImage;
}

- (id)outputImage
{
  int v3;
  double v4;
  float v5;
  CIImage *inputMainImage;
  uint64_t v7;
  CIImage *inputImage;
  id v9;
  CIFilter *v10;
  CIFilter *v11;
  uint64_t v12;
  NSDictionary *inputTuningParameters;
  CIImage *v14;
  NSDictionary *v15;
  CIImage *v16;
  CGAffineTransform v18;
  CGAffineTransform v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[2];
  const __CFString *v26;
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputMainImage || !self->inputTuningParameters)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v3 = +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDisparityRefinementV3 inputDraftMode](self, "inputDraftMode"));
  v4 = 0.5;
  if (v3 == 2)
  {
    -[NSNumber floatValue](-[CIDisparityRefinementV3 inputScale](self, "inputScale", 0.5), "floatValue");
    v4 = 0.5 / v5;
  }
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, v4, v4);
  inputMainImage = self->inputMainImage;
  v18 = v19;
  v7 = -[CIImage imageByApplyingTransform:](inputMainImage, "imageByApplyingTransform:", &v18);
  inputImage = self->inputImage;
  v9 = -[CIDisparityRefinementV3 alphaImageForMainImage:disparity:](self, "alphaImageForMainImage:disparity:", v7, inputImage);
  v26 = CFSTR("inputImage");
  v27[0] = v7;
  v10 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIDisparityPreprocV3"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
  v11 = v10;
  if (v9)
    -[CIFilter setValue:forKey:](v10, "setValue:forKey:", v9, CFSTR("inputAlphaImage"));
  v12 = -[CIFilter outputImage](v11, "outputImage");
  inputTuningParameters = self->inputTuningParameters;
  v24[0] = CFSTR("inputTuningParameters");
  v24[1] = CFSTR("inputScale");
  v25[0] = inputTuningParameters;
  v25[1] = -[CIDisparityRefinementV3 inputScale](self, "inputScale");
  v14 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDisparityWeightsV3"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  v22[0] = CFSTR("inputPreprocImage");
  v22[1] = CFSTR("inputTuningParameters");
  v15 = self->inputTuningParameters;
  v23[0] = v12;
  v23[1] = v15;
  v22[2] = CFSTR("inputScale");
  v23[2] = -[CIDisparityRefinementV3 inputScale](self, "inputScale");
  v16 = -[CIImage imageByApplyingFilter:withInputParameters:](v14, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDisparityRefinementSparseSamplerV3"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
  if (+[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDisparityRefinementV3 inputDraftMode](self, "inputDraftMode")) != 1)
  {
    v20[0] = CFSTR("inputPreprocImage");
    v20[1] = CFSTR("inputDisparityWeightImage");
    v21[0] = v12;
    v21[1] = v14;
    v21[2] = self->inputTuningParameters;
    v20[2] = CFSTR("inputTuningParameters");
    v20[3] = CFSTR("inputScale");
    v21[3] = -[CIDisparityRefinementV3 inputScale](self, "inputScale");
    return -[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDisparityRefinementAntialiasV3"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
  }
  return v16;
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputMainImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMainImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputMatteImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
