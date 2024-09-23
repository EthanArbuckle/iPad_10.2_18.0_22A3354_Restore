@implementation CIPortraitBlurDirectionalBlur

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CIPortraitBlurDir);
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlurDirectionalBlur _kernelMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlurDirectionalBlur _kernelMetal]::onceToken, &__block_literal_global_93);
  return (id)-[CIPortraitBlurDirectionalBlur _kernelMetal]::k;
}

id __45__CIPortraitBlurDirectionalBlur__kernelMetal__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIPortraitBlurDirM"));
  -[CIPortraitBlurDirectionalBlur _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  id v3;
  id v5;
  CIImage *inputImage;
  CISampler *v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  CIVector *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v25 = -[NSNumber BOOLValue](self->inputHorizontalBlur, "BOOLValue");
  if (-[NSNumber BOOLValue](self->inputUseMetal, "BOOLValue"))
    v3 = -[CIPortraitBlurDirectionalBlur _kernelMetal](self, "_kernelMetal");
  else
    v3 = -[CIPortraitBlurDirectionalBlur _kernel](self, "_kernel");
  v5 = v3;
  if (!v3)
    v5 = -[CIPortraitBlurDirectionalBlur _kernel](self, "_kernel");
  inputImage = self->inputImage;
  v29 = CFSTR("wrap_mode");
  v30[0] = CFSTR("clamp");
  v7 = +[CISampler samplerWithImage:options:](CISampler, "samplerWithImage:options:", inputImage, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1));
  -[NSNumber floatValue](self->inputAntiAliasBlurStrength, "floatValue");
  v9 = v8;
  -[NSNumber floatValue](self->inputMaxBlur, "floatValue");
  v11 = (float)(v9 * v10);
  v12 = 1.0;
  if (*((_BYTE *)v23 + 24))
    v13 = 1.0;
  else
    v13 = 0.0;
  if (*((_BYTE *)v23 + 24))
    v12 = 0.0;
  v14 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v11, v13, v12);
  v15 = *MEMORY[0x1E0C9D5E0];
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v28[0] = v7;
  v28[1] = v14;
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2, MEMORY[0x1E0C809B0], 3221225472, __44__CIPortraitBlurDirectionalBlur_outputImage__block_invoke, &unk_1E2EC3638, &v22);
  v26 = CFSTR("kCIKernelOutputFormat");
  v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 264);
  v20 = (void *)objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:options:", &v21, v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1), v15, v16, v17, v18);
  _Block_object_dispose(&v22, 8);
  return v20;
}

double __44__CIPortraitBlurDirectionalBlur_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double result;

  v5 = -3.0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v6 = -3.0;
  else
    v6 = 0.0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v5 = 0.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v6, v5);
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

- (NSNumber)inputHorizontalBlur
{
  return self->inputHorizontalBlur;
}

- (void)setInputHorizontalBlur:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputMaxBlur
{
  return self->inputMaxBlur;
}

- (void)setInputMaxBlur:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputAntiAliasBlurStrength
{
  return self->inputAntiAliasBlurStrength;
}

- (void)setInputAntiAliasBlurStrength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputUseMetal
{
  return self->inputUseMetal;
}

- (void)setInputUseMetal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

@end
