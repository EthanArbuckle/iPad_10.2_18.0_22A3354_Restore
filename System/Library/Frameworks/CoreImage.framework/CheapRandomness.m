@implementation CheapRandomness

- (id)outputImage
{
  CIColorKernel *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSNumber *inputScale;
  id v9;
  float v10;
  NSNumber *v11;
  const __CFString *v13;
  NSNumber *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_drr_noise);
  v4 = *MEMORY[0x1E0C9D5E0];
  v5 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  inputScale = self->inputScale;
  v15[0] = self->inputDither;
  v15[1] = inputScale;
  v9 = -[CIColorKernel applyWithExtent:roiCallback:arguments:](v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_21, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2), v4, v5, v6, v7);
  -[NSNumber floatValue](self->inputScale, "floatValue");
  if (v10 > 1.0)
  {
    v11 = self->inputScale;
    v13 = CFSTR("inputRadius");
    v14 = v11;
    return (id)objc_msgSend(v9, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBoxBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  }
  return v9;
}

- (NSNumber)inputDither
{
  return self->inputDither;
}

- (void)setInputDither:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
