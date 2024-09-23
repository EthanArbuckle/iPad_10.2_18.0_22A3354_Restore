@implementation CIMattingSolver

- (id)outputImage
{
  CIImage *inputImage;
  NSInteger v4;
  CIImage *inputMainImage;
  CIImage *inputPredicateImage;
  NSNumber *inputRadius;
  NSNumber *inputSubsampling;
  NSNumber *inputEPS;
  NSNumber *inputNumIterations;
  NSNumber *inputErosionKernelSize;
  NSNumber *inputUseDepthFilter;
  NSNumber *inputFGThresholdValue;
  NSNumber *inputBGThresholdValue;
  _QWORD v16[10];
  _QWORD v17[11];

  v17[10] = *MEMORY[0x1E0C80C00];
  inputImage = self->super.inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->super.inputPredicateImage && self->super.inputMainImage)
  {
    v4 = -[NSNumber integerValue](self->super.inputNumIterations, "integerValue");
    inputImage = self->super.inputImage;
    if (v4)
    {
      inputMainImage = self->super.inputMainImage;
      v16[0] = CFSTR("inputMainImage");
      v16[1] = CFSTR("inputPredicateImage");
      inputPredicateImage = self->super.inputPredicateImage;
      v17[0] = inputMainImage;
      v17[1] = inputPredicateImage;
      inputRadius = self->super.inputRadius;
      v16[2] = CFSTR("inputRadius");
      v16[3] = CFSTR("inputSubsampling");
      inputSubsampling = self->super.inputSubsampling;
      v17[2] = inputRadius;
      v17[3] = inputSubsampling;
      inputEPS = self->super.inputEPS;
      v16[4] = CFSTR("inputEPS");
      v16[5] = CFSTR("inputNumIterations");
      inputNumIterations = self->super.inputNumIterations;
      v17[4] = inputEPS;
      v17[5] = inputNumIterations;
      inputErosionKernelSize = self->super.inputErosionKernelSize;
      v16[6] = CFSTR("inputErosionKernelSize");
      v16[7] = CFSTR("inputUseDepthFilter");
      inputUseDepthFilter = self->super.inputUseDepthFilter;
      v17[6] = inputErosionKernelSize;
      v17[7] = inputUseDepthFilter;
      inputFGThresholdValue = self->super.inputFGThresholdValue;
      v16[8] = CFSTR("inputFGThresholdValue");
      v16[9] = CFSTR("inputBGThresholdValue");
      inputBGThresholdValue = self->super.inputBGThresholdValue;
      v17[8] = inputFGThresholdValue;
      v17[9] = inputBGThresholdValue;
      return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMattingSolverInternal"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 10));
    }
  }
  return inputImage;
}

@end
