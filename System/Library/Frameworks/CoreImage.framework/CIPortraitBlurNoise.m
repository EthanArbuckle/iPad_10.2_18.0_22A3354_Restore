@implementation CIPortraitBlurNoise

- (id)_kernel
{
  if (-[CIPortraitBlurNoise _kernel]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlurNoise _kernel]::onceToken, &__block_literal_global_66_0);
  return (id)-[CIPortraitBlurNoise _kernel]::k;
}

CIColorKernel *__30__CIPortraitBlurNoise__kernel__block_invoke()
{
  CIColorKernel *result;

  result = +[CIColorKernel kernelWithString:](CIColorKernel, "kernelWithString:", CFSTR("vec2 __pseudo_randKY( vec2 pos)\n{\nfloat rand1 = mod(12.63 * pos.x - 57.3 * pos.y * pos.y, 0.01369) \n+ mod(75.833 * pos.y - 37.135 * pos.x * pos.x, 0.014) \n+ mod(39.7 * pos.x * pos.y + 21.7 * pos.x * pos.y * pos.y, 0.0879);\nvec2 rand2 = fract(3576.7453 * vec2( rand1, 2.0 * rand1));\nvec2 rand3 = fract(vec2(7.7387 * (rand2.x + rand2.y), 33.707 * (rand2.x - rand2.y)));\nreturn rand3;\n}\nkernel vec4 _CIPortraitBlurNoise(__sample pixBlurred, vec4 params)\n{\n    float lumaNoiseAmpl = params.x;\n    float lumaNoiseModelCoeff = params.y;\n    vec2 randVal = __pseudo_randKY( destCoord() / params.zw);\n    float noiseLuma = clamp( sqrt( -2.0 * log(randVal.x)) * cos( 6.2832 * randVal.y), -5.0, 5.0);\n    vec4 kRGB_to_Y = vec4( 0.299 , 0.587, 0.114, 0.0);\n    float outLuma = dot( pixBlurred, kRGB_to_Y);\n    float addLumaNoiseLevel = lumaNoiseAmpl * mix( 1.0, outLuma, lumaNoiseModelCoeff);\n    vec4 pixOut = clamp( pixBlurred + (noiseLuma * addLumaNoiseLevel) , 0.0, 1.0);\n    pixOut.w = pixBlurred.w;\n\t return pixOut;\n}\n"));
  -[CIPortraitBlurNoise _kernel]::k = (uint64_t)result;
  return result;
}

- (id)_kernelMetal
{
  if (-[CIPortraitBlurNoise _kernelMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlurNoise _kernelMetal]::onceToken, &__block_literal_global_70);
  return (id)-[CIPortraitBlurNoise _kernelMetal]::k;
}

id __35__CIPortraitBlurNoise__kernelMetal__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV2MetalKernelNamed:](CIColorKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIPortraitBlurNoiseM"));
  -[CIPortraitBlurNoise _kernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  uint64_t v20;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v4 = v3;
  v6 = v5;
  if (-[NSNumber BOOLValue](self->inputUseMetal, "BOOLValue"))
    v7 = -[CIPortraitBlurNoise _kernelMetal](self, "_kernelMetal");
  else
    v7 = -[CIPortraitBlurNoise _kernel](self, "_kernel");
  v8 = v7;
  if (!v7)
    v8 = -[CIPortraitBlurNoise _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v24[0] = self->inputImage;
  -[NSNumber floatValue](self->inputLumaNoiseAmpl, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputLumaNoiseModelCoeff, "floatValue");
  v24[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v18, v19, v4, v6);
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = CFSTR("kCIKernelOutputFormat");
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 264);
  return (id)objc_msgSend(v8, "applyWithExtent:arguments:options:", v20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1), v10, v12, v14, v16);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputLumaNoiseAmpl
{
  return self->inputLumaNoiseAmpl;
}

- (void)setInputLumaNoiseAmpl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputLumaNoiseModelCoeff
{
  return self->inputLumaNoiseModelCoeff;
}

- (void)setInputLumaNoiseModelCoeff:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CIVector)inputExtent
{
  return (CIVector *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
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
