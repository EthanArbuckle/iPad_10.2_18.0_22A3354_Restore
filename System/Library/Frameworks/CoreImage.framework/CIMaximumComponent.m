@implementation CIMaximumComponent

+ (id)customAttributes
{
  _QWORD v3[7];
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
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v5[1] = CFSTR("6");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.5");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_maximumComponent);
}

- (id)outputImage
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = -[CIMaximumComponent _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v9[0] = self->inputImage;
  return (id)objc_msgSend(v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1), v4, v5, v6, v7);
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
