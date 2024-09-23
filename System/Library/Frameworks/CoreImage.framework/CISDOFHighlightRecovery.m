@implementation CISDOFHighlightRecovery

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[10];
  _QWORD v19[12];

  v19[10] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("CIAttributeFilterCategories");
  v17[0] = CFSTR("CICategoryColorAdjustment");
  v17[1] = CFSTR("CICategoryVideo");
  v17[2] = CFSTR("CICategoryStillImage");
  v17[3] = CFSTR("CICategoryBuiltIn");
  v17[4] = CFSTR("CICategoryApplePrivate");
  v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v19[1] = CFSTR("12");
  v18[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v18[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v19[2] = CFSTR("10.14");
  v18[3] = CFSTR("inputScale");
  v15[0] = CFSTR("CIAttributeSliderMin");
  v15[1] = CFSTR("CIAttributeSliderMax");
  v16[0] = &unk_1E2F1A800;
  v16[1] = &unk_1E2F1A810;
  v15[2] = CFSTR("CIAttributeMin");
  v15[3] = CFSTR("CIAttributeMax");
  v16[2] = &unk_1E2F1A800;
  v16[3] = &unk_1E2F1A810;
  v15[4] = CFSTR("CIAttributeDefault");
  v15[5] = CFSTR("CIAttributeType");
  v16[4] = &unk_1E2F1A810;
  v16[5] = CFSTR("CIAttributeTypeScalar");
  v19[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v18[4] = CFSTR("inputMaxBlur");
  v13[0] = CFSTR("CIAttributeSliderMin");
  v13[1] = CFSTR("CIAttributeSliderMax");
  v14[0] = &unk_1E2F1A800;
  v14[1] = &unk_1E2F1A820;
  v13[2] = CFSTR("CIAttributeMin");
  v13[3] = CFSTR("CIAttributeMax");
  v14[2] = &unk_1E2F1A800;
  v14[3] = &unk_1E2F1A820;
  v13[4] = CFSTR("CIAttributeDefault");
  v13[5] = CFSTR("CIAttributeType");
  v14[4] = &unk_1E2F1A830;
  v14[5] = CFSTR("CIAttributeTypeScalar");
  v19[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v18[5] = CFSTR("inputApertureScale");
  v11[0] = CFSTR("CIAttributeSliderMin");
  v11[1] = CFSTR("CIAttributeSliderMax");
  v12[0] = &unk_1E2F1A840;
  v12[1] = &unk_1E2F1A810;
  v11[2] = CFSTR("CIAttributeMin");
  v11[3] = CFSTR("CIAttributeMax");
  v12[2] = &unk_1E2F1A840;
  v12[3] = &unk_1E2F1A810;
  v11[4] = CFSTR("CIAttributeDefault");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1A810;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v19[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v18[6] = CFSTR("inputBlurRadius");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0025, 0.0075);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v19[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v18[7] = CFSTR("inputMaxIntensity");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.9, 1.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v19[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v18[8] = CFSTR("inputMinIntensity");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.2);
  v6[1] = CFSTR("CIAttributeTypePosition");
  v19[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v18[9] = CFSTR("inputIterations");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1BC98;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1BCB0;
  v4[3] = &unk_1E2F1BCC8;
  v19[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
}

- (id)outputImage
{
  NSNumber *inputMaxBlur;
  NSNumber *inputApertureScaling;
  NSNumber *inputIterations;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CIImage *inputImage;
  CFTypeRef v14;
  CIImage *v15;
  float v16;
  float v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double width;
  double height;
  double v28;
  CGFloat v29;
  double v30;
  CIImage *v31;
  void *v32;
  float v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CIImage *v41;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CIImage *v49;
  _QWORD v50[9];
  _QWORD v51[10];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v51[9] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (!-[NSNumber integerValue](self->inputIterations, "integerValue"))
    return self->inputImage;
  inputMaxBlur = self->inputMaxBlur;
  inputApertureScaling = self->inputApertureScaling;
  v50[0] = CFSTR("maxBlur");
  v50[1] = CFSTR("apertureScaling");
  inputIterations = self->inputIterations;
  v51[0] = inputMaxBlur;
  v51[1] = inputApertureScaling;
  v51[2] = inputIterations;
  v50[2] = CFSTR("iterations");
  v50[3] = CFSTR("blurRadiusT0");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector X](self->inputBlurRadius, "X");
  v51[3] = objc_msgSend(v6, "numberWithDouble:");
  v50[4] = CFSTR("blurRadiusT1");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector Y](self->inputBlurRadius, "Y");
  v51[4] = objc_msgSend(v7, "numberWithDouble:");
  v50[5] = CFSTR("maxIntensityT0");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector X](self->inputMaxIntensity, "X");
  v51[5] = objc_msgSend(v8, "numberWithDouble:");
  v50[6] = CFSTR("maxIntensityT1");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector Y](self->inputMaxIntensity, "Y");
  v51[6] = objc_msgSend(v9, "numberWithDouble:");
  v50[7] = CFSTR("minIntensityT0");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector X](self->inputMinIntensity, "X");
  v51[7] = objc_msgSend(v10, "numberWithDouble:");
  v50[8] = CFSTR("minIntensityT1");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector Y](self->inputMinIntensity, "Y");
  v51[8] = objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 9);
  inputImage = self->inputImage;
  v14 = linearP3ColorSpace();
  v15 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v14);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v17 = v16;
  -[CIImage extent](v15, "extent");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, 1.0 / v17, 1.0 / v17);
  v47 = v48;
  v52.origin.x = v19;
  v52.origin.y = v21;
  v52.size.width = v23;
  v52.size.height = v25;
  v53 = CGRectApplyAffineTransform(v52, &v47);
  v54 = CGRectIntegral(v53);
  width = v54.size.width;
  height = v54.size.height;
  -[CIImage extent](v15, "extent", v54.origin.x, v54.origin.y);
  v29 = width / v28;
  -[CIImage extent](v15, "extent");
  CGAffineTransformMakeScale(&v46, v29, height / v30);
  v48 = v46;
  if (v17 != 1.0)
  {
    v31 = -[CIImage imageByClampingToExtent](v15, "imageByClampingToExtent");
    v45 = v48;
    v15 = -[CIImage imageByApplyingTransform:highQualityDownsample:](v31, "imageByApplyingTransform:highQualityDownsample:", &v45, 1);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v12);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E2F1A810, CFSTR("scale"));
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[NSNumber floatValue](self->inputIterations, "floatValue");
    *(float *)&v34 = v33 / v17;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v32, "numberWithFloat:", v34), CFSTR("iterations"));
  }
  v44 = v48;
  v55.origin.x = v19;
  v55.origin.y = v21;
  v55.size.width = v23;
  v55.size.height = v25;
  v56 = CGRectApplyAffineTransform(v55, &v44);
  if ((((unint64_t)v56.size.width | (unint64_t)v56.size.height) & 1) != 0)
  {
    v35 = (unint64_t)v56.size.width;
    v36 = (unint64_t)v56.size.height;
    v15 = -[CIImage imageByCroppingToRect:](-[CIImage imageByClampingToExtent](v15, "imageByClampingToExtent"), "imageByCroppingToRect:", v56.origin.x, v56.origin.y, (double)((v35 & 1) + v35), (double)((v36 & 1) + v36));
  }
  -[CIImage extent](v15, "extent", v56.origin.x, v56.origin.y);
  v49 = v15;
  v41 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIHighlightRecoveryProcessor, "applyWithExtent:inputs:arguments:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1), v12, 0, v37, v38, v39, v40);
  if (v17 != 1.0)
  {
    CGAffineTransformMakeScale(&v43, v17, v17);
    v41 = -[CIImage imageByApplyingTransform:highQualityDownsample:](v41, "imageByApplyingTransform:highQualityDownsample:", &v43, 1);
  }
  -[CIImage extent](self->inputImage, "extent");
  return -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](-[CIImage imageByCroppingToRect:](v41, "imageByCroppingToRect:"), "imageByColorMatchingColorSpaceToWorkingSpace:", v14);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputIterations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputMaxBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CIVector)inputBlurRadius
{
  return (CIVector *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputBlurRadius:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (CIVector)inputMaxIntensity
{
  return (CIVector *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputMaxIntensity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CIVector)inputMinIntensity
{
  return (CIVector *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputMinIntensity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

@end
