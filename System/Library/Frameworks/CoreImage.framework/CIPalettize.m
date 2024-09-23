@implementation CIPalettize

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

- (id)_kernelApplyPalette
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_palettize);
}

- (id)outputImage
{
  CIImage **p_inputPaletteImage;
  CIImage *inputPaletteImage;
  double v5;
  NSObject *v6;
  id result;
  CIImage *inputImage;
  double v9;
  double v10;
  NSNumber *inputPerceptual;
  _BOOL4 v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CIImage *v23;
  double v24;
  CGFloat v25;
  double v26;
  CIImage *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD v33[5];
  CGAffineTransform v34;
  _QWORD v35[4];
  CGRect v36;

  v35[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  p_inputPaletteImage = &self->inputPaletteImage;
  inputPaletteImage = self->inputPaletteImage;
  if (!inputPaletteImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputPaletteImage, "extent");
  if (CGRectIsInfinite(v36) || (-[CIImage extent](*p_inputPaletteImage, "extent"), v5 > 1.0))
  {
    v6 = ci_logger_api();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CIPalettize outputImage].cold.1((id *)p_inputPaletteImage, v6);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  else
  {
    inputImage = self->inputImage;
    -[CIImage extent](*p_inputPaletteImage, "extent");
    v10 = v9;
    inputPerceptual = self->inputPerceptual;
    if (inputPerceptual)
      v12 = -[NSNumber BOOLValue](inputPerceptual, "BOOLValue");
    else
      v12 = 0;
    v13 = (unint64_t)v10;
    -[CIImage extent](self->inputImage, "extent");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = -[CIPalettize _kernelApplyPalette](self, "_kernelApplyPalette");
    v23 = *p_inputPaletteImage;
    -[CIImage extent](*p_inputPaletteImage, "extent");
    v25 = -v24;
    -[CIImage extent](*p_inputPaletteImage, "extent");
    CGAffineTransformMakeTranslation(&v34, v25, -v26);
    v27 = -[CIImage imageByApplyingTransform:](v23, "imageByApplyingTransform:", &v34);
    if (v12)
    {
      inputImage = -[CIImage imageByApplyingFilter:](inputImage, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
      v27 = -[CIImage imageByApplyingFilter:](v27, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
    }
    v28 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
    v29 = *MEMORY[0x1E0C9D5E0];
    v30 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v31 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v32 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __26__CIPalettize_outputImage__block_invoke;
    v33[3] = &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v33[4] = v13;
    v35[0] = v28;
    v35[1] = v27;
    v35[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
    result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:", v33, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3), v29, v30, v31, v32), "imageByCroppingToRect:", v15, v17, v19, v21), "imageByPremultiplyingAlpha");
    if (v12)
      return (id)objc_msgSend(result, "imageByApplyingFilter:", CFSTR("CISRGBToneCurveToLinear"));
  }
  return result;
}

double __26__CIPalettize_outputImage__block_invoke(uint64_t a1, int a2)
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
  v8 = "-[CIPalettize outputImage]";
  v9 = 2048;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s The input palette should be a K x 1 image but received %.1f x %.1f]", (uint8_t *)&v7, 0x20u);
}

@end
