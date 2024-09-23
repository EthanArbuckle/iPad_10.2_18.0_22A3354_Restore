@implementation CILinearToAppleLog

+ (id)customAttributes
{
  _QWORD v3[8];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryHighDynamicRange");
  v3[4] = CFSTR("CICategoryNonSquarePixels");
  v3[5] = CFSTR("CICategoryStillImage");
  v3[6] = CFSTR("CICategoryBuiltIn");
  v3[7] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  v5[1] = CFSTR("18");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("15.0");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIColorKernel *v3;
  CIImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_linearToAppleLog);
  v4 = -[CIImage imageByUnpremultiplyingAlpha](-[CILinearToAppleLog inputImage](self, "inputImage"), "imageByUnpremultiplyingAlpha");
  -[CIImage extent](v4, "extent");
  v10[0] = v4;
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), v5, v6, v7, v8), "imageByPremultiplyingAlpha");
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
