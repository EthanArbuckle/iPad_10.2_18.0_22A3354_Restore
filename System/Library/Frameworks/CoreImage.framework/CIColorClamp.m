@implementation CIColorClamp

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorClamp);
}

- (id)_kernelAlphaPreserving
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorClampAP);
}

+ (id)customAttributes
{
  const __CFString *v3;
  CIVector *v4;
  const __CFString *v5;
  CIVector *v6;
  _QWORD v7[6];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorAdjustment");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryInterlaced");
  v7[3] = CFSTR("CICategoryNonSquarePixels");
  v7[4] = CFSTR("CICategoryStillImage");
  v7[5] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v9[1] = CFSTR("7");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.9");
  v8[3] = CFSTR("inputMinComponents");
  v5 = CFSTR("CIAttributeDefault");
  v6 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v8[4] = CFSTR("inputMaxComponents");
  v3 = CFSTR("CIAttributeDefault");
  v4 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0, 1.0, 1.0, 1.0);
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)outputImage
{
  CIVector *inputMinComponents;
  CIVector *inputMaxComponents;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  inputMinComponents = self->inputMinComponents;
  if (!inputMinComponents)
    inputMinComponents = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  inputMaxComponents = self->inputMaxComponents;
  if (!inputMaxComponents)
    inputMaxComponents = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
  -[CIImage extent](self->inputImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CIVector W](self->inputMinComponents, "W");
  if (v13 > 0.0)
  {
    v6 = *MEMORY[0x1E0C9D5E0];
    v8 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  }
  -[CIVector W](self->inputMinComponents, "W");
  if (v14 <= 0.0 && (-[CIVector W](self->inputMaxComponents, "W"), v15 >= 1.0))
    v16 = -[CIColorClamp _kernelAlphaPreserving](self, "_kernelAlphaPreserving");
  else
    v16 = -[CIColorClamp _kernel](self, "_kernel");
  v18 = v16;
  v19[0] = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v19[1] = inputMinComponents;
  v19[2] = inputMaxComponents;
  return (id)objc_msgSend((id)objc_msgSend(v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3), v6, v8, v10, v12), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputMinComponents
{
  return self->inputMinComponents;
}

- (void)setInputMinComponents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputMaxComponents
{
  return self->inputMaxComponents;
}

- (void)setInputMaxComponents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
