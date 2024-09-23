@implementation CILensModelApplyV3

- (id)kernel
{
  if (-[CILensModelApplyV3 kernel]::onceToken != -1)
    dispatch_once(&-[CILensModelApplyV3 kernel]::onceToken, &__block_literal_global_116);
  return (id)-[CILensModelApplyV3 kernel]::k;
}

id __28__CILensModelApplyV3_kernel__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV3MetalKernelNamed:](CIColorKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_slm_passthrough"));
  -[CILensModelApplyV3 kernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  CIImage *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CIImage *inputImage;
  uint64_t v14;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = -[CIImage imageByClampingToExtent](self->inputLensModelImage, "imageByClampingToExtent");
  v4 = -[CILensModelApplyV3 kernel](self, "kernel");
  -[CIImage extent](self->inputImage, "extent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  inputImage = self->inputImage;
  v18[0] = v3;
  v18[1] = inputImage;
  v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = CFSTR("kCIKernelOutputFormat");
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", v14, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), v6, v8, v10, v12);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputLensModelImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputLensModelImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

@end
