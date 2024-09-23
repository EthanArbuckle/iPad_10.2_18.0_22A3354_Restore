@implementation CIGuidedFilter

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryGeometryAdjustment");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("12");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.14");
  v8[3] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = CFSTR("CIAttributeTypeScalar");
  v6[1] = &unk_1E2F19D70;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19D80;
  v6[3] = &unk_1E2F19D70;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v8[4] = CFSTR("inputEpsilon");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeScalar");
  v4[1] = &unk_1E2F19D90;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19DA0;
  v4[3] = &unk_1E2F19DB0;
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)_downsampledColorImage:(id)a3
{
  id v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v3 = a3;
  objc_msgSend(a3, "extent");
  v6 = v5;
  v8 = v7;
  -[CIImage extent](self->inputImage, "extent");
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&v14, v9 / v6, v10 / v8);
  v13 = v14;
  if (!CGAffineTransformIsIdentity(&v13))
  {
    v12 = v14;
    return (id)objc_msgSend(v3, "imageByApplyingTransform:highQualityDownsample:", &v12, 1);
  }
  return v3;
}

- (id)_upsampleImage:(id)a3 targetImageSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  memset(&v13, 0, sizeof(v13));
  objc_msgSend(a3, "extent");
  v8 = width / v7;
  objc_msgSend(v6, "extent");
  CGAffineTransformMakeScale(&v13, v8, height / v9);
  v12 = v13;
  if (!CGAffineTransformIsIdentity(&v12))
  {
    v11 = v13;
    return (id)objc_msgSend(v6, "imageByApplyingTransform:highQualityDownsample:", &v11, 0);
  }
  return v6;
}

- (id)_fullFloatBoxFilter
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_boxFilter3);
}

- (id)_boxFilter:(id)a3 fullFloat:(BOOL)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CISampler *v15;
  id v16;
  void *v18;
  void *v19;
  float v20;
  CISampler *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (a4)
  {
    v22 = CFSTR("wrap_mode");
    v23 = CFSTR("clamp");
    v15 = +[CISampler samplerWithImage:options:](CISampler, "samplerWithImage:options:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v16 = -[CIGuidedFilter _fullFloatBoxFilter](self, "_fullFloatBoxFilter");
    v21 = v15;
    return (id)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_37, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1), v8, v10, v12, v14);
  }
  else
  {
    v18 = (void *)objc_msgSend(a3, "imageByClampingToExtent");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[NSNumber floatValue](self->inputRadius, "floatValue");
    v24 = CFSTR("inputRadius");
    v25[0] = objc_msgSend(v19, "numberWithDouble:", v20 * 2.0 + 1.0);
    return (id)objc_msgSend((id)objc_msgSend(v18, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1)), "imageByCroppingToRect:", v8, v10, v12, v14);
  }
}

double __39__CIGuidedFilter__boxFilter_fullFloat___block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

- (id)_multiplyImagesKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_multiplyImages);
}

- (id)multiplyImages:(id)a3 imageB:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _QWORD v20[3];
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = -[CIGuidedFilter _multiplyImagesKernel](self, "_multiplyImagesKernel");
  objc_msgSend(a3, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(a4, "extent");
  v23.origin.x = v15;
  v23.origin.y = v16;
  v23.size.width = v17;
  v23.size.height = v18;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v22 = CGRectUnion(v21, v23);
  v20[0] = a3;
  v20[1] = a4;
  return (id)objc_msgSend(v6, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2), v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (id)subtract:(id)a3 minus:(id)a4
{
  CIColorKernel *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _QWORD v20[3];
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_subtractImages);
  objc_msgSend(a3, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(a4, "extent");
  v23.origin.x = v15;
  v23.origin.y = v16;
  v23.size.width = v17;
  v23.size.height = v18;
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v22 = CGRectUnion(v21, v23);
  v20[0] = a3;
  v20[1] = a4;
  return -[CIColorKernel applyWithExtent:arguments:](v6, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2), v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (id)_computeABKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_computeAB);
}

- (id)_finalResult
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_finalResult);
}

- (id)_combineRGB_and_A
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_combineRGB_and_A);
}

- (id)_swizzleImageXXX1:(id)a3
{
  CIColorKernel *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_swizzleXXX1);
  objc_msgSend(a3, "extent");
  v10[0] = a3;
  return -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), v5, v6, v7, v8);
}

- (id)_swizzleImageYYZ1:(id)a3
{
  CIColorKernel *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_swizzleYYZ1);
  objc_msgSend(a3, "extent");
  v10[0] = a3;
  return -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), v5, v6, v7, v8);
}

- (id)_swizzleImageYZZ1:(id)a3
{
  CIColorKernel *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_swizzleYZZ1);
  objc_msgSend(a3, "extent");
  v10[0] = a3;
  return -[CIColorKernel applyWithExtent:arguments:](v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), v5, v6, v7, v8);
}

- (id)computeAB:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  _QWORD v43[6];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v43[5] = *MEMORY[0x1E0C80C00];
  v5 = -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", a3, 1);
  v6 = -[CIGuidedFilter _swizzleImageXXX1:](self, "_swizzleImageXXX1:", a3);
  v7 = -[CIGuidedFilter _swizzleImageYYZ1:](self, "_swizzleImageYYZ1:", a3);
  v8 = -[CIGuidedFilter _swizzleImageYZZ1:](self, "_swizzleImageYZZ1:", a3);
  v9 = -[CIGuidedFilter multiplyImages:imageB:](self, "multiplyImages:imageB:", v6, a3);
  v10 = -[CIGuidedFilter multiplyImages:imageB:](self, "multiplyImages:imageB:", v7, v8);
  v11 = -[CIGuidedFilter _swizzleImageXXX1:](self, "_swizzleImageXXX1:", v5);
  v12 = -[CIGuidedFilter _swizzleImageYYZ1:](self, "_swizzleImageYYZ1:", v5);
  v13 = -[CIGuidedFilter _swizzleImageYZZ1:](self, "_swizzleImageYZZ1:", v5);
  v14 = -[CIGuidedFilter multiplyImages:imageB:](self, "multiplyImages:imageB:", v11, v5);
  v15 = -[CIGuidedFilter multiplyImages:imageB:](self, "multiplyImages:imageB:", v12, v13);
  v16 = -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", v9, 1);
  v17 = -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", v10, 1);
  v18 = -[CIGuidedFilter subtract:minus:](self, "subtract:minus:", v16, v14);
  v19 = -[CIGuidedFilter subtract:minus:](self, "subtract:minus:", v17, v15);
  v20 = -[CIGuidedFilter subtract:minus:](self, "subtract:minus:", -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", objc_msgSend(a3, "imageByPremultiplyingAlpha"), 1), objc_msgSend(v5, "imageByPremultiplyingAlpha"));
  v21 = -[CIGuidedFilter _computeABKernel](self, "_computeABKernel");
  objc_msgSend(v20, "extent");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v18, "extent");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  objc_msgSend(v19, "extent");
  v47.origin.x = v38;
  v47.origin.y = v39;
  v47.size.width = v40;
  v47.size.height = v41;
  v44.origin.x = v31;
  v44.origin.y = v33;
  v44.size.width = v35;
  v44.size.height = v37;
  v48 = CGRectUnion(v44, v47);
  v45.origin.x = v23;
  v45.origin.y = v25;
  v45.size.width = v27;
  v45.size.height = v29;
  v46 = CGRectUnion(v45, v48);
  v43[0] = v18;
  v43[1] = v19;
  v43[2] = v20;
  v43[3] = v5;
  v43[4] = self->inputEpsilon;
  return -[CIGuidedFilter _boxFilter:fullFloat:](self, "_boxFilter:fullFloat:", objc_msgSend(v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 5), v46.origin.x, v46.origin.y, v46.size.width, v46.size.height), 0);
}

- (id)outputImage
{
  CIImage *inputImage;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  id v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CIImage *v31;
  id v32;
  uint64_t v33;
  double v34;
  double v35;
  id v36;
  id v37;
  CIImage *inputGuideImage;
  double v39;
  double v40;
  double v41;
  double v42;
  _QWORD v43[2];
  _QWORD v44[3];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v44[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputGuideImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsInfinite(v45))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](self->inputGuideImage, "extent");
  if (CGRectIsInfinite(v46))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](self->inputGuideImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CIImage extent](self->inputImage, "extent");
  v50.origin.x = v13;
  v50.origin.y = v14;
  v50.size.width = v15;
  v50.size.height = v16;
  v47.origin.x = v6;
  v47.origin.y = v8;
  v47.size.width = v10;
  v47.size.height = v12;
  if (CGRectEqualToRect(v47, v50))
    return self->inputImage;
  v17 = -[CIGuidedFilter _downsampledColorImage:](self, "_downsampledColorImage:", self->inputGuideImage);
  v18 = -[CIGuidedFilter _combineRGB_and_A](self, "_combineRGB_and_A");
  objc_msgSend(v17, "extent");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[CIImage extent](self->inputImage, "extent");
  v51.origin.x = v27;
  v51.origin.y = v28;
  v51.size.width = v29;
  v51.size.height = v30;
  v48.origin.x = v20;
  v48.origin.y = v22;
  v48.size.width = v24;
  v48.size.height = v26;
  v49 = CGRectUnion(v48, v51);
  v31 = self->inputImage;
  v44[0] = v17;
  v44[1] = v31;
  v32 = -[CIGuidedFilter computeAB:](self, "computeAB:", objc_msgSend(v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2), v49.origin.x, v49.origin.y, v49.size.width, v49.size.height));
  -[CIImage extent](self->inputImage, "extent");
  v33 = objc_msgSend(v32, "imageByCroppingToRect:");
  -[CIImage extent](self->inputGuideImage, "extent");
  v36 = -[CIGuidedFilter _upsampleImage:targetImageSize:](self, "_upsampleImage:targetImageSize:", v33, v34, v35);
  v37 = -[CIGuidedFilter _finalResult](self, "_finalResult");
  objc_msgSend(v36, "extent");
  inputGuideImage = self->inputGuideImage;
  v43[0] = v36;
  v43[1] = inputGuideImage;
  return (id)objc_msgSend(v37, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2), v39, v40, v41, v42);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputGuideImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputGuideImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputEpsilon
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputEpsilon:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

@end
