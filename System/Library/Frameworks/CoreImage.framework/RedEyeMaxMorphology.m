@implementation RedEyeMaxMorphology

- (id)outputImage
{
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSNumber *inputRadius;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  NSNumber *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v20[4];
  int v21;
  _QWORD v22[4];
  int v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (outputImage_onceToken_10 != -1)
    dispatch_once(&outputImage_onceToken_10, &__block_literal_global_11);
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = v3;
  v5 = (void *)objc_msgSend((id)outputImage_kernels_9, "objectAtIndexedSubscript:", 0);
  -[CIImage extent](self->inputImage, "extent");
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __34__RedEyeMaxMorphology_outputImage__block_invoke_2;
  v22[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v23 = v4;
  inputRadius = self->inputRadius;
  v25[0] = self->inputImage;
  v25[1] = inputRadius;
  v12 = objc_msgSend(v5, "applyWithExtent:roiCallback:arguments:", v22, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2), v8, v9, v10, v11);
  v13 = (void *)objc_msgSend((id)outputImage_kernels_9, "objectAtIndexedSubscript:", 1);
  -[CIImage extent](self->inputImage, "extent");
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __34__RedEyeMaxMorphology_outputImage__block_invoke_3;
  v20[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v21 = v4;
  v14 = self->inputRadius;
  v24[0] = v12;
  v24[1] = v14;
  return (id)objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v20, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2), v15, v16, v17, v18);
}

NSArray *__34__RedEyeMaxMorphology_outputImage__block_invoke()
{
  NSArray *result;

  result = objc_retain(+[CIKernel kernelsWithString:](CIKernel, "kernelsWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kernel vec4 _redEyeHorizontalMaxKernel(sampler im, float radius) { float offset; vec2 pt, sd; vec4 s, m"
                 "axsofar; pt = samplerCoord(im); sd = samplerTransform(im, destCoord() + vec2(1.0)) - pt; maxsofar = sam"
                 "ple(im, pt + vec2(0.0, 0.0)*sd); for (offset = 1.0; offset <= radius; offset += 1.0) { s = sample(im, p"
                 "t + vec2(offset, 0.0)*sd); maxsofar = max(maxsofar, s); s = sample(im, pt + vec2(-offset, 0.0)*sd); max"
                 "sofar = max(maxsofar, s); } return maxsofar; } kernel vec4 _redEyeVerticalMaxKernel(sampler im, float r"
                 "adius) { float offset; vec2 pt, sd; vec4 s, maxsofar; pt = samplerCoord(im); sd = samplerTransform(im, "
                 "destCoord() + vec2(1.0)) - pt; maxsofar = sample(im, pt + vec2(0.0, 0.0)*sd); for (offset = 1.0; offset"
                 " <= radius; offset += 1.0) { s = sample(im, pt + vec2(0.0, offset)*sd); maxsofar = max(maxsofar, s); s "
                 "= sample(im, pt + vec2(0.0, -offset)*sd); maxsofar = max(maxsofar, s); } return maxsofar; }")));
  outputImage_kernels_9 = (uint64_t)result;
  return result;
}

double __34__RedEyeMaxMorphology_outputImage__block_invoke_2(uint64_t a1, double a2)
{
  return a2 - ceilf(*(float *)(a1 + 32));
}

@end
