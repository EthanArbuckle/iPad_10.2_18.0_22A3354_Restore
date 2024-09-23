@implementation RedEyeChannel

- (id)outputImage
{
  int v3;
  NSNumber *inputParam1;
  float v5;
  float v6;
  NSNumber *inputParam2;
  float v9;
  float v10;
  NSNumber *inputParam3;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (outputImage_onceToken_2 != -1)
    dispatch_once(&outputImage_onceToken_2, &__block_literal_global_81);
  v3 = -[NSNumber intValue](self->inputChannel, "intValue");
  inputParam1 = self->inputParam1;
  if (inputParam1)
  {
    -[NSNumber floatValue](inputParam1, "floatValue");
    v6 = v5;
    if (v3 <= 0x18 && ((1 << v3) & 0x1A08000) != 0)
      v6 = 1.0 / (1.0 - v5);
  }
  else
  {
    v6 = 1.0;
    if ((v3 - 15) < 0xA)
      v6 = flt_192499C68[v3 - 15];
  }
  inputParam2 = self->inputParam2;
  if (inputParam2)
  {
    -[NSNumber floatValue](inputParam2, "floatValue");
    v10 = v9;
    if (v3 == 21 || v3 == 15)
      v10 = 1.0 / (1.0 - v9);
  }
  else
  {
    v10 = 1.0;
    if ((v3 - 15) < 0xA)
      v10 = flt_192499C90[v3 - 15];
  }
  inputParam3 = self->inputParam3;
  if (inputParam3)
  {
    -[NSNumber floatValue](inputParam3, "floatValue");
    v14 = v13;
    if ((v3 & 0xFFFFFFFD) == 0x15)
      v14 = 1.0 / (1.0 - v13);
  }
  else
  {
    v15 = 1.0;
    if (v3 == 21)
      v15 = 5.0;
    if (v3 == 23)
      v14 = 2.0;
    else
      v14 = v15;
  }
  if (self->inputParam1)
  {
    -[NSNumber floatValue](self->inputParam4, "floatValue");
    v17 = v16;
  }
  else
  {
    v17 = 1.0;
  }
  v18 = (void *)objc_msgSend((id)outputImage_kernels_1, "objectAtIndexedSubscript:", v3);
  -[CIImage extent](self->inputImage, "extent");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28[0] = self->inputImage;
  v28[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v6, v10, v14, v17);
  return (id)objc_msgSend(v18, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2), v20, v22, v24, v26);
}

NSArray *__28__RedEyeChannel_outputImage__block_invoke()
{
  NSArray *result;

  result = +[CIKernel kernelsWithString:](CIColorKernel, "kernelsWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", aKernelVec4Rede_4));
  outputImage_kernels_1 = (uint64_t)result;
  return result;
}

- (id)filterNameForChannel:(int)a3
{
  if ((a3 - 1) > 0x17)
    return CFSTR("Original");
  else
    return off_1E2EC5A48[a3 - 1];
}

- (id)parameterNamesForChannel:(int)a3
{
  if ((a3 - 15) > 9)
    return (id)MEMORY[0x1E0C9AA60];
  else
    return (id)qword_1E2EC5B08[a3 - 15];
}

@end
