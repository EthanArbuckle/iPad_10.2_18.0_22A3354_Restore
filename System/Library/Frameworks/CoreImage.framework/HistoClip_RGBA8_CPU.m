@implementation HistoClip_RGBA8_CPU

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  CIImage *inputCenterLeft;
  CIImage *inputDetectionLeft;
  uint64_t v9;
  NSNumber *inputPercentileRepair;
  NSNumber *inputPercentileSpecular;
  NSNumber *inputPercentRepair;
  NSNumber *inputPercentSpecular;
  NSNumber *inputInterPeakMinRepair;
  CIVector *inputMinimum;
  CIVector *inputMaxArea;
  CIVector *inputCenterOffsetLeft;
  CIVector *inputCenterOffsetRight;
  CIVector *inputCenterExtentLeft;
  CIVector *inputCenterExtentRight;
  NSNumber *inputAbortMaxCenterDist;
  NSNumber *inputMinDensity;
  NSNumber *inputMaxRelDensity;
  NSNumber *inputDensityRadius;
  CIVector *inputMaxAreaRatio;
  CIVector *v26;
  NSNumber *inputMinInterDispersion;
  NSNumber *inputMaxInterDispersion;
  NSNumber *inputMinGobalLocalMeanDiff;
  uint64_t v31;
  _QWORD v32[21];
  _QWORD v33[21];
  _QWORD v34[6];

  v34[5] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v3 = *MEMORY[0x1E0C9D5E0];
  v4 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  inputCenterLeft = self->inputCenterLeft;
  v34[0] = self->inputImage;
  v34[1] = inputCenterLeft;
  inputDetectionLeft = self->inputDetectionLeft;
  v34[2] = self->inputCenterRight;
  v34[3] = inputDetectionLeft;
  v34[4] = self->inputDetectionRight;
  v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  inputPercentileRepair = self->inputPercentileRepair;
  v32[0] = CFSTR("percentileRepair");
  v32[1] = CFSTR("percentileSpecular");
  inputPercentileSpecular = self->inputPercentileSpecular;
  inputPercentRepair = self->inputPercentRepair;
  v33[0] = inputPercentileRepair;
  v33[1] = inputPercentileSpecular;
  inputPercentSpecular = self->inputPercentSpecular;
  v32[2] = CFSTR("percentRepair");
  v32[3] = CFSTR("percentSpecular");
  v33[2] = inputPercentRepair;
  v33[3] = inputPercentSpecular;
  inputInterPeakMinRepair = self->inputInterPeakMinRepair;
  inputMinimum = self->inputMinimum;
  v32[4] = CFSTR("interPeakMinRepair");
  v32[5] = CFSTR("threshold");
  inputMaxArea = self->inputMaxArea;
  v33[4] = inputInterPeakMinRepair;
  v33[5] = inputMinimum;
  v32[6] = CFSTR("area");
  v32[7] = CFSTR("centerOffsetLeft");
  inputCenterOffsetLeft = self->inputCenterOffsetLeft;
  inputCenterOffsetRight = self->inputCenterOffsetRight;
  v33[6] = inputMaxArea;
  v33[7] = inputCenterOffsetLeft;
  inputCenterExtentLeft = self->inputCenterExtentLeft;
  v32[8] = CFSTR("centerOffsetRight");
  v32[9] = CFSTR("centerExtentLeft");
  v33[8] = inputCenterOffsetRight;
  v33[9] = inputCenterExtentLeft;
  inputCenterExtentRight = self->inputCenterExtentRight;
  inputAbortMaxCenterDist = self->inputAbortMaxCenterDist;
  v32[10] = CFSTR("centerExtentRight");
  v32[11] = CFSTR("abortMaxCenterDist");
  inputMinDensity = self->inputMinDensity;
  v33[10] = inputCenterExtentRight;
  v33[11] = inputAbortMaxCenterDist;
  v32[12] = CFSTR("minDensity");
  v32[13] = CFSTR("maxRelDensity");
  inputMaxRelDensity = self->inputMaxRelDensity;
  inputDensityRadius = self->inputDensityRadius;
  v33[12] = inputMinDensity;
  v33[13] = inputMaxRelDensity;
  inputMaxAreaRatio = self->inputMaxAreaRatio;
  v32[14] = CFSTR("densityRadius");
  v32[15] = CFSTR("areaMaxRatio");
  v33[14] = inputDensityRadius;
  v33[15] = inputMaxAreaRatio;
  v33[16] = self->inputTuning;
  v32[16] = CFSTR("tuning");
  v32[17] = CFSTR("roi");
  -[CIImage extent](self->inputImage, "extent");
  v26 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  inputMinInterDispersion = self->inputMinInterDispersion;
  v33[17] = v26;
  v33[18] = inputMinInterDispersion;
  inputMaxInterDispersion = self->inputMaxInterDispersion;
  v32[18] = CFSTR("minInterDispersion");
  v32[19] = CFSTR("maxInterDispersion");
  v32[20] = CFSTR("minGobalLocalMeanDiff");
  inputMinGobalLocalMeanDiff = self->inputMinGobalLocalMeanDiff;
  v33[19] = inputMaxInterDispersion;
  v33[20] = inputMinGobalLocalMeanDiff;
  return +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PercentileClipProcessor_RGBA8_CPU, "applyWithExtent:inputs:arguments:error:", v9, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 21), &v31, v3, v4, v5, v6);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputCenterLeft
{
  return self->inputCenterLeft;
}

- (void)setInputCenterLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIImage)inputCenterRight
{
  return self->inputCenterRight;
}

- (void)setInputCenterRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputCenterExtentLeft
{
  return self->inputCenterExtentLeft;
}

- (void)setInputCenterExtentLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputCenterExtentRight
{
  return self->inputCenterExtentRight;
}

- (void)setInputCenterExtentRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputPercentileRepair
{
  return self->inputPercentileRepair;
}

- (void)setInputPercentileRepair:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputPercentileSpecular
{
  return self->inputPercentileSpecular;
}

- (void)setInputPercentileSpecular:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputPercentRepair
{
  return self->inputPercentRepair;
}

- (void)setInputPercentRepair:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputPercentSpecular
{
  return self->inputPercentSpecular;
}

- (void)setInputPercentSpecular:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)inputInterPeakMinRepair
{
  return self->inputInterPeakMinRepair;
}

- (void)setInputInterPeakMinRepair:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSNumber)inputAbortMaxCenterDist
{
  return self->inputAbortMaxCenterDist;
}

- (void)setInputAbortMaxCenterDist:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSNumber)inputMinDensity
{
  return self->inputMinDensity;
}

- (void)setInputMinDensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSNumber)inputMaxRelDensity
{
  return self->inputMaxRelDensity;
}

- (void)setInputMaxRelDensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSNumber)inputDensityRadius
{
  return self->inputDensityRadius;
}

- (void)setInputDensityRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSNumber)inputMinInterDispersion
{
  return self->inputMinInterDispersion;
}

- (void)setInputMinInterDispersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSNumber)inputMaxInterDispersion
{
  return self->inputMaxInterDispersion;
}

- (void)setInputMaxInterDispersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSNumber)inputMinGobalLocalMeanDiff
{
  return self->inputMinGobalLocalMeanDiff;
}

- (void)setInputMinGobalLocalMeanDiff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (CIVector)inputMinimum
{
  return self->inputMinimum;
}

- (void)setInputMinimum:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (CIVector)inputMaxArea
{
  return self->inputMaxArea;
}

- (void)setInputMaxArea:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (CIVector)inputMaxAreaRatio
{
  return self->inputMaxAreaRatio;
}

- (void)setInputMaxAreaRatio:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (CIVector)inputCenterOffsetLeft
{
  return self->inputCenterOffsetLeft;
}

- (void)setInputCenterOffsetLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (CIVector)inputCenterOffsetRight
{
  return self->inputCenterOffsetRight;
}

- (void)setInputCenterOffsetRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (CIImage)inputDetectionLeft
{
  return self->inputDetectionLeft;
}

- (void)setInputDetectionLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (CIImage)inputDetectionRight
{
  return self->inputDetectionRight;
}

- (void)setInputDetectionRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSNumber)inputTuning
{
  return self->inputTuning;
}

- (void)setInputTuning:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

@end
