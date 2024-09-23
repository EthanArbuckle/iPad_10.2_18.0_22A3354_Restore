@implementation CIBlurmapRefinementDistanceDelta

- (id)outputImage
{
  id result;
  CIImage *inputImage;
  NSNumber *inputThreshold;
  CIImage *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CIImage *v15;
  NSNumber *inputDistance;
  id v17;
  CIImage *inputSecondaryImage;
  NSNumber *inputScalingFactor;
  void *v20;
  NSNumber **v21;
  const __CFString **v22;
  uint64_t v23;
  NSNumber *v24;
  const __CFString *v25;
  NSNumber *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  NSNumber *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  result = +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  if (inputImage)
  {
    inputThreshold = self->inputThreshold;
    v31 = CFSTR("inputThreshold");
    v32[0] = inputThreshold;
    v6 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlurmapRefinementThreshold"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1));
    -[CIImage extent](v6, "extent");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[CIImage imageByClampingToExtent](v6, "imageByClampingToExtent");
    inputDistance = self->inputDistance;
    v29 = CFSTR("inputRadius");
    v30 = inputDistance;
    v17 = -[CIImage _imageByRenderingToIntermediate](-[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v15, "imageByApplyingFilter:withInputParameters:", CFSTR("CIGaussianBlur"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1)), "imageByCroppingToRect:", v8, v10, v12, v14), "_imageByRenderingToIntermediate");
    inputSecondaryImage = self->inputSecondaryImage;
    if (inputSecondaryImage)
    {
      v27[0] = CFSTR("inputSecondaryImage");
      v27[1] = CFSTR("inputScalingFactor");
      inputScalingFactor = self->inputScalingFactor;
      v28[0] = inputSecondaryImage;
      v28[1] = inputScalingFactor;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = (NSNumber **)v28;
      v22 = (const __CFString **)v27;
      v23 = 2;
    }
    else
    {
      v24 = self->inputScalingFactor;
      v25 = CFSTR("inputScalingFactor");
      v26 = v24;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = &v26;
      v22 = &v25;
      v23 = 1;
    }
    return (id)objc_msgSend(v17, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlurmapRefinementLinearMapping"), objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, v23));
  }
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

- (CIImage)inputSecondaryImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputSecondaryImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputThreshold:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputDistance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputScalingFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputScalingFactor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

@end
