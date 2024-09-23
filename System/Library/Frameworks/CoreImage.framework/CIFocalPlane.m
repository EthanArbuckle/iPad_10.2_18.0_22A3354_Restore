@implementation CIFocalPlane

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputMatteImage;
  CIVector *inputFocusRect;
  NSNumber *inputZeroShiftPercentile;
  NSNumber *inputAlphaThreshold;
  NSNumber *inputAmplitude;
  NSNumber *inputExponent;
  NSNumber *inputGamma;
  NSNumber *inputMinFactor;
  _QWORD v12[9];
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  inputImage = self->super.inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputMatteImage = self->super.inputMatteImage;
  if (inputMatteImage)
  {
    v12[0] = CFSTR("inputMatteImage");
    v12[1] = CFSTR("inputFocusRect");
    inputFocusRect = self->super.inputFocusRect;
    v13[0] = inputMatteImage;
    v13[1] = inputFocusRect;
    inputZeroShiftPercentile = self->super.inputZeroShiftPercentile;
    v12[2] = CFSTR("inputZeroShiftPercentile");
    v12[3] = CFSTR("inputAlphaThreshold");
    inputAlphaThreshold = self->super.inputAlphaThreshold;
    v13[2] = inputZeroShiftPercentile;
    v13[3] = inputAlphaThreshold;
    inputAmplitude = self->super.inputAmplitude;
    v12[4] = CFSTR("inputAmplitude");
    v12[5] = CFSTR("inputExponent");
    inputExponent = self->super.inputExponent;
    v13[4] = inputAmplitude;
    v13[5] = inputExponent;
    inputGamma = self->super.inputGamma;
    v12[6] = CFSTR("inputGamma");
    v12[7] = CFSTR("inputMinFactor");
    inputMinFactor = self->super.inputMinFactor;
    v13[6] = inputGamma;
    v13[7] = inputMinFactor;
    v12[8] = CFSTR("inputMaxFactor");
    v13[8] = self->super.inputMaxFactor;
    return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIFocalPlanePreprocessorInternal"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 9));
  }
  return inputImage;
}

@end
