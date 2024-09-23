@implementation CIPaletteCentroid

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("13");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.15");
  v6[3] = CFSTR("inputPerceptual");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAA0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_kernelClusterMask
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_PC_coord);
}

- (id)outputImage
{
  CIImage **p_inputPaletteImage;
  CIImage *inputPaletteImage;
  double v5;
  NSObject *v6;
  double v8;
  unint64_t v9;
  CIImage *inputImage;
  NSNumber *inputPerceptual;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  CIImage *v22;
  double v23;
  CGFloat v24;
  double v25;
  CIImage *v26;
  uint64_t v27;
  CIImage *v28;
  uint64_t v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  CGAffineTransform v43;
  const __CFString *v44;
  CIVector *v45;
  _QWORD v46[6];
  CGRect v47;

  v46[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  p_inputPaletteImage = &self->inputPaletteImage;
  inputPaletteImage = self->inputPaletteImage;
  if (!inputPaletteImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputPaletteImage, "extent");
  if (CGRectIsInfinite(v47) || (-[CIImage extent](*p_inputPaletteImage, "extent"), v5 > 1.0))
  {
    v6 = ci_logger_api();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CIPaletteCentroid outputImage].cold.1((id *)p_inputPaletteImage, v6);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  -[CIImage extent](*p_inputPaletteImage, "extent");
  v9 = (unint64_t)v8;
  inputImage = self->inputImage;
  inputPerceptual = self->inputPerceptual;
  if (inputPerceptual)
    v12 = -[NSNumber BOOLValue](inputPerceptual, "BOOLValue");
  else
    v12 = 0;
  -[CIImage extent](self->inputImage, "extent");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[CIPaletteCentroid _kernelClusterMask](self, "_kernelClusterMask");
  v22 = *p_inputPaletteImage;
  -[CIImage extent](*p_inputPaletteImage, "extent");
  v24 = -v23;
  -[CIImage extent](*p_inputPaletteImage, "extent");
  CGAffineTransformMakeTranslation(&v43, v24, -v25);
  v26 = -[CIImage imageByApplyingTransform:](v22, "imageByApplyingTransform:", &v43);
  if (v12)
  {
    inputImage = -[CIImage imageByApplyingFilter:](inputImage, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
    v26 = -[CIImage imageByApplyingFilter:](v26, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
  }
  v27 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v28 = +[CIImage emptyImage](CIImage, "emptyImage");
  if (v9)
  {
    v29 = 0;
    v30 = (double *)MEMORY[0x1E0C9D5E0];
    v41 = 3221225472;
    do
    {
      v31 = v18;
      v32 = v16;
      v33 = v14;
      v34 = *v30;
      v35 = v30[1];
      v36 = v30[2];
      v37 = v30[3];
      v46[0] = v27;
      v46[1] = v26;
      v46[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9, v41, MEMORY[0x1E0C809B0], v41, __32__CIPaletteCentroid_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, v9);
      v46[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v29);
      v38 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
      v39 = v35;
      v14 = v33;
      v16 = v32;
      v18 = v31;
      v40 = (void *)objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", &v42, v38, v34, v39, v36, v37);
      v44 = CFSTR("inputExtent");
      v45 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v14, v16, v31, v20);
      v28 = (CIImage *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaRedCentroid"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1)), "imageByClampingToExtent"), "imageByCroppingToRect:", (double)(int)v29++, 0.0, 1.0, 1.0), "imageByCompositingOverImage:",
                         v28);
    }
    while (v9 != v29);
  }
  return -[CIImage imageBySettingProperties:](v28, "imageBySettingProperties:", MEMORY[0x1E0C9AA70]);
}

double __32__CIPaletteCentroid_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2)
    return 0.0;
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputPaletteImage
{
  return self->inputPaletteImage;
}

- (void)setInputPaletteImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)outputImage
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "extent");
  v5 = v4;
  objc_msgSend(*a1, "extent");
  v7 = 136446722;
  v8 = "-[CIPaletteCentroid outputImage]";
  v9 = 2048;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s The input palette should be a K x 1 image but received %.1f x %.1f]", (uint8_t *)&v7, 0x20u);
}

@end
