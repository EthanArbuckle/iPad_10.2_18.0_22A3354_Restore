@implementation RedEyeGlintFinder

- (id)outputImage
{
  double v3;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  CIVector *v14;
  CIVector *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (outputImage_onceToken_0 != -1)
    dispatch_once(&outputImage_onceToken_0, &__block_literal_global_77);
  -[CIVector X](self->inputThresholds, "X");
  v4 = v3;
  -[CIVector Y](self->inputThresholds, "Y");
  v6 = v5;
  -[CIVector Z](self->inputThresholds, "Z");
  *(float *)&v7 = v7;
  v8 = 1.0 / (1.0 - v4);
  v9 = 1.0 / (1.0 - v6);
  v10 = 1.0 / (1.0 - *(float *)&v7);
  v11 = v8 + -1.0;
  v12 = v9 + -1.0;
  v13 = v10 + -1.0;
  v14 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v8, v9, v10, 0.0);
  v15 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v11, v12, v13, 0.0);
  v16 = (void *)objc_msgSend((id)outputImage_kernels, "objectAtIndexedSubscript:", 0);
  -[CIImage extent](self->inputImage, "extent");
  v22[0] = self->inputImage;
  v22[1] = v14;
  v22[2] = v15;
  return (id)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_4_2, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3), v17, v18, v19, v20);
}

NSArray *__32__RedEyeGlintFinder_outputImage__block_invoke()
{
  NSArray *result;

  result = +[CIKernel kernelsWithString:](CIColorKernel, "kernelsWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kernel vec4 _redEyeGlintfinder(__sample a, vec4 factors, vec4 offsets) { vec4 b = max(sqrt(a)*factors - offsets, vec4(0.0)); float y = b.r * b.g * b.b; return vec4(y, y, y, 1.0); }"));
  outputImage_kernels = (uint64_t)result;
  return result;
}

@end
