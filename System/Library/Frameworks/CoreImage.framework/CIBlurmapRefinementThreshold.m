@implementation CIBlurmapRefinementThreshold

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_thresholdRed);
}

- (id)outputImage
{
  CIImage *v3;
  id v4;
  void *v5;
  CIImage *inputImage;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSNumber *inputThreshold;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputImage)
  {
    v4 = -[CIBlurmapRefinementThreshold kernel](self, "kernel");
    if (v4)
    {
      v5 = v4;
      inputImage = self->inputImage;
      -[CIImage extent](inputImage, "extent");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      inputThreshold = self->inputThreshold;
      v20[0] = inputImage;
      v20[1] = inputThreshold;
      v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
      v18[0] = CFSTR("kCIKernelOutputFormat");
      v18[1] = CFSTR("kCIImageAlphaOne");
      v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
      v19[1] = MEMORY[0x1E0C9AAB0];
      return (id)objc_msgSend(v5, "applyWithExtent:arguments:options:", v16, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2), v8, v10, v12, v14);
    }
  }
  return v3;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputThreshold:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

@end
