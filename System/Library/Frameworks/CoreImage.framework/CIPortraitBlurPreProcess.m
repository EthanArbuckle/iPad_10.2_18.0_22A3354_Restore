@implementation CIPortraitBlurPreProcess

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CIBlurPreProcess);
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlurPreProcess _kernelMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlurPreProcess _kernelMetal]::onceToken, &__block_literal_global_238);
  return (id)-[CIPortraitBlurPreProcess _kernelMetal]::k;
}

id __40__CIPortraitBlurPreProcess__kernelMetal__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV2MetalKernelNamed:](CIColorKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIBlurPreProcessM"));
  -[CIPortraitBlurPreProcess _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  id result;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CIImage *inputBlurmapImage;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (!result)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputBlurmapImage)
  {
    if (-[NSNumber BOOLValue](self->inputUseMetal, "BOOLValue"))
      v4 = -[CIPortraitBlurPreProcess _kernelMetal](self, "_kernelMetal");
    else
      v4 = -[CIPortraitBlurPreProcess _kernel](self, "_kernel");
    v5 = v4;
    if (!v4)
      v5 = -[CIPortraitBlurPreProcess _kernel](self, "_kernel");
    -[CIImage extent](self->inputImage, "extent");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    inputBlurmapImage = self->inputBlurmapImage;
    v18[0] = self->inputImage;
    v18[1] = inputBlurmapImage;
    v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = CFSTR("kCIKernelOutputFormat");
    v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 264);
    return (id)objc_msgSend(v5, "applyWithExtent:arguments:options:", v15, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), v7, v9, v11, v13);
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

- (CIImage)inputBlurmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurmapImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputUseMetal
{
  return self->inputUseMetal;
}

- (void)setInputUseMetal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

@end
