@implementation CIBlurmapRefinementLinearMapping

- (id)kernelNoSecondaryImage
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_linearMappingNoSecondaryImage);
}

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_linearMapping);
}

- (id)outputImage
{
  id result;
  CIImage *inputImage;
  id v5;
  void *v6;
  CIImage *inputSecondaryImage;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  NSNumber *inputScalingFactor;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  result = +[CIImage emptyImage](CIImage, "emptyImage");
  if (result)
  {
    inputImage = self->inputImage;
    if (self->inputSecondaryImage)
      v5 = -[CIBlurmapRefinementLinearMapping kernel](self, "kernel");
    else
      v5 = -[CIBlurmapRefinementLinearMapping kernelNoSecondaryImage](self, "kernelNoSecondaryImage");
    v6 = v5;
    inputSecondaryImage = self->inputSecondaryImage;
    if (inputSecondaryImage)
    {
      v24[0] = inputImage;
      v24[1] = inputSecondaryImage;
      v24[2] = self->inputScalingFactor;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v24;
      v10 = 3;
    }
    else
    {
      inputScalingFactor = self->inputScalingFactor;
      v23[0] = inputImage;
      v23[1] = inputScalingFactor;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v23;
      v10 = 2;
    }
    v12 = objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
    -[CIImage extent](inputImage, "extent");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21[1] = CFSTR("kCIImageAlphaOne");
    v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053, CFSTR("kCIKernelOutputFormat"));
    v22[1] = MEMORY[0x1E0C9AAB0];
    return (id)objc_msgSend(v6, "applyWithExtent:arguments:options:", v12, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2), v14, v16, v18, v20);
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputSecondaryImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputSecondaryImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputScalingFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputScalingFactor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

@end
