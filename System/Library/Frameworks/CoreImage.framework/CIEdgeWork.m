@implementation CIEdgeWork

- (id)_CIEdgeWork
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_edgeWork);
}

- (id)_CIEdgeWorkContrast
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_edgeWorkContrast);
}

- (id)outputImage
{
  float v3;
  double v4;
  CIImage *inputImage;
  float v6;
  CIImage *v7;
  CIImage *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = fmaxf(v3, 0.0);
  inputImage = self->inputImage;
  v6 = (v4 * 0.158 + 4.842) * v4 * 0.7;
  v28[0] = CFSTR("inputRVector");
  v29[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.299, 0.587, 0.114);
  v28[1] = CFSTR("inputGVector");
  v29[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.299, 0.587, 0.114);
  v28[2] = CFSTR("inputBVector");
  v29[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.299, 0.587, 0.114);
  v7 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3));
  v8 = -[CIImage imageByApplyingGaussianBlurWithSigma:](v7, "imageByApplyingGaussianBlurWithSigma:", v4);
  v9 = -[CIEdgeWork _CIEdgeWork](self, "_CIEdgeWork");
  -[CIImage extent](v8, "extent");
  v27[0] = v7;
  v27[1] = v8;
  v14 = (void *)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2), v10, v11, v12, v13);
  -[CIImage extent](v7, "extent");
  v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "imageByCroppingToRect:"), "imageByApplyingGaussianBlurWithSigma:", v4);
  v16 = -[CIEdgeWork _CIEdgeWorkContrast](self, "_CIEdgeWorkContrast");
  objc_msgSend(v15, "extent");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26[0] = v15;
  *(float *)&v17 = v6;
  v26[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  return (id)objc_msgSend(v16, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2), v18, v20, v22, v24);
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19A10;
  v4[1] = &unk_1E2F19A10;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19A20;
  v4[3] = &unk_1E2F19A30;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
