@implementation CILocalContrast

+ (id)customAttributes
{
  objc_class *v2;
  objc_class *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorAdjustment");
  v9[1] = CFSTR("CICategoryStillImage");
  v9[2] = CFSTR("CICategoryApplePrivate");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v10[1] = CFSTR("inputStrength");
  v7[0] = CFSTR("CIAttributeClass");
  v2 = (objc_class *)objc_opt_class();
  v8[0] = NSStringFromClass(v2);
  v8[1] = &unk_1E2F1A170;
  v7[1] = CFSTR("CIAttributeDefault");
  v7[2] = CFSTR("CIAttributeMin");
  v8[2] = &unk_1E2F1A180;
  v8[3] = &unk_1E2F1A190;
  v7[3] = CFSTR("CIAttributeMax");
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[2] = CFSTR("inputScale");
  v5[0] = CFSTR("CIAttributeClass");
  v3 = (objc_class *)objc_opt_class();
  v6[0] = NSStringFromClass(v3);
  v6[1] = &unk_1E2F1A1A0;
  v5[1] = CFSTR("CIAttributeDefault");
  v5[2] = CFSTR("CIAttributeMin");
  v6[2] = &unk_1E2F1A1B0;
  v6[3] = &unk_1E2F1A1C0;
  v5[3] = CFSTR("CIAttributeMax");
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v11[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3, v5[0]);
}

- (id)_kernelLocalContrast
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_localContrast);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  float v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  CIImage *v15;
  CIImage *v16;
  float v17;
  double v18;
  float v19;
  uint64_t v20;
  CIImage *v21;
  double v22;
  double v23;
  CIImage *v24;
  uint64_t v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[5];
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  v36[0] = CFSTR("inputRVector");
  v37[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.333333, 0.333333, 0.333333, 0.0);
  v36[1] = CFSTR("inputGVector");
  v37[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.333333, 0.333333, 0.333333, 0.0);
  v36[2] = CFSTR("inputBVector");
  v37[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.333333, 0.333333, 0.333333, 0.0);
  v36[3] = CFSTR("inputAVector");
  v37[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
  v36[4] = CFSTR("inputBiasVector");
  v37[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v4 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5));
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v6 = v5;
  -[CIImage extent](self->inputImage, "extent");
  v8 = v7;
  v9 = v6 / v8;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v11 = v10;
  -[CIImage extent](self->inputImage, "extent");
  v13 = v12;
  v14 = v11 / v13;
  v15 = -[CIImage imageByClampingToExtent](v4, "imageByClampingToExtent");
  CGAffineTransformMakeScale(&v32, v9, v14);
  v16 = -[CIImage imageByApplyingGaussianBlurWithSigma:](-[CIImage imageByApplyingTransform:](v15, "imageByApplyingTransform:", &v32), "imageByApplyingGaussianBlurWithSigma:", 5.0);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v20 = -[CIImage imageByCroppingToRect:](v16, "imageByCroppingToRect:", 0.0, 0.0, v18, v19);
  v21 = self->inputImage;
  v35[0] = v20;
  v34[0] = CFSTR("inputSmallImage");
  v34[1] = CFSTR("inputSpatialSigma");
  LODWORD(v22) = 5.0;
  v35[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v34[2] = CFSTR("inputLumaSigma");
  LODWORD(v23) = 1041865114;
  v35[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = -[CIImage imageByApplyingFilter:withInputParameters:](v21, "imageByApplyingFilter:withInputParameters:", CFSTR("CIEdgePreserveUpsampleFilter"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3));
  -[CIImage extent](self->inputImage, "extent");
  v25 = -[CIImage imageByCroppingToRect:](v24, "imageByCroppingToRect:");
  v26 = -[CILocalContrast _kernelLocalContrast](self, "_kernelLocalContrast");
  -[CIImage extent](self->inputImage, "extent");
  v33[0] = self->inputImage;
  v33[1] = v25;
  v33[2] = self->inputStrength;
  return (id)objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3), v27, v28, v29, v30);
}

@end
