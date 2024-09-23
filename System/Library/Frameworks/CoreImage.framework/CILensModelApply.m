@implementation CILensModelApply

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CILensModelApply);
}

- (id)outputImage
{
  id result;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    if (self->inputLensModelParams)
    {
      v4 = -[CILensModelApply kernel](self, "kernel");
      -[CIImage extent](self->inputImage, "extent");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v13[0] = self->inputImage;
      v13[1] = -[CIImage imageByClampingToExtent](self->inputLensModelParams, "imageByClampingToExtent");
      return (id)objc_msgSend(v4, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2), v6, v8, v10, v12);
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputLensModelParams
{
  return self->inputLensModelParams;
}

- (void)setInputLensModelParams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
