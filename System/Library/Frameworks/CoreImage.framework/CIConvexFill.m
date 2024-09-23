@implementation CIConvexFill

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  CIImage *inputCenter;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *inputSplat;
  uint64_t v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9D5E0];
  v4 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v14 = 0;
  inputCenter = self->inputCenter;
  v17[0] = self->inputImage;
  v17[1] = inputCenter;
  v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2, 0);
  v16[0] = self->inputThreshold;
  v15[0] = CFSTR("kThreshold");
  v15[1] = CFSTR("kAreaThresholdLo");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector X](self->inputAreaThresholdLoHi, "X");
  v16[1] = objc_msgSend(v9, "numberWithDouble:");
  v15[2] = CFSTR("kAreaThresholdHi");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CIVector Y](self->inputAreaThresholdLoHi, "Y");
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v15[3] = CFSTR("kSplatArea");
  inputSplat = self->inputSplat;
  v16[2] = v11;
  v16[3] = inputSplat;
  return +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](ConvexFillProcessor, "applyWithExtent:inputs:arguments:error:", v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4), &v14, v3, v4, v5, v6);
}

- (CIImage)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (void)setInputThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputAreaThresholdLoHi
{
  return self->inputAreaThresholdLoHi;
}

- (void)setInputAreaThresholdLoHi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputSplat
{
  return self->inputSplat;
}

- (void)setInputSplat:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
