@implementation CISaliencyMapFilter

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryVideo");
  v3[1] = CFSTR("CICategoryStillImage");
  v3[2] = CFSTR("CICategoryBuiltIn");
  v3[3] = CFSTR("CICategoryStylize");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v5[1] = CFSTR("12");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.14");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v5;
  double v6;
  CGFloat v7;
  double v8;
  CIImage *v9;
  CGColorSpace *v10;
  CIImage *v11;
  uint64_t v12;
  CIImage *v13;
  CIImage *v14;
  CGAffineTransform v15;
  uint64_t v16;
  const __CFString *v17;
  CIVector *v18;
  _QWORD v19[2];
  CGRect v20;

  v19[1] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsInfinite(v20))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v16 = 0;
  v5 = self->inputImage;
  -[CIImage extent](v5, "extent");
  v7 = -v6;
  -[CIImage extent](self->inputImage, "extent");
  CGAffineTransformMakeTranslation(&v15, v7, -v8);
  v9 = -[CIImage imageByApplyingTransform:](v5, "imageByApplyingTransform:", &v15);
  v10 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v11 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v9, "imageByColorMatchingWorkingSpaceToColorSpace:", v10);
  v19[0] = v11;
  v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v17 = CFSTR("rect");
  -[CIImage extent](v11, "extent");
  v18 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v13 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CISaliencyMapKernel, "applyWithExtent:inputs:arguments:error:", v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1), &v16, 0.0, 0.0, 64.0, 64.0);
  if (v16)
  {
    CGColorSpaceRelease(v10);
    return +[CIImage emptyImage](CIImage, "emptyImage");
  }
  else
  {
    v14 = -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](v13, "imageByColorMatchingColorSpaceToWorkingSpace:", v10);
    CGColorSpaceRelease(v10);
  }
  return v14;
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
