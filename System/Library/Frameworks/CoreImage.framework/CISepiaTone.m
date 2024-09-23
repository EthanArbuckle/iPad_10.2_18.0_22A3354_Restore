@implementation CISepiaTone

+ (id)customAttributes
{
  _QWORD v3[8];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorEffect");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryNonSquarePixels");
  v3[4] = CFSTR("CICategoryStillImage");
  v3[5] = CFSTR("CICategoryHighDynamicRange");
  v3[6] = CFSTR("CICategoryBuiltIn");
  v3[7] = CFSTR("CICategoryXMPSerializable");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  v5[1] = CFSTR("5");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputIntensity, "doubleValue");
  return fabs(v2) < 0.01;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_sepia);
}

- (id)outputImage
{
  id v4;
  NSNumber *inputIntensity;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CISepiaTone _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  v4 = -[CISepiaTone _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  inputIntensity = self->inputIntensity;
  v10[0] = self->inputImage;
  v10[1] = inputIntensity;
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2), v6, v7, v8, v9);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
