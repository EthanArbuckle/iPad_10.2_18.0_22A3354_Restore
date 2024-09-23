@implementation VNBrightnessDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isReentrant
{
  return 1;
}

- (__CVBuffer)_createPixelBufferFromImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 maximumIntermediateSideLength:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __CVBuffer *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a6;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = 1.0;
  v24.size.height = 1.0;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectEqualToRect(v21, v24))
  {
    v16 = objc_msgSend(v14, "createBufferWithMaxSideLengthOf:pixelFormat:options:error:", a5, 1111970369, v15, a7);
  }
  else
  {
    v17 = objc_msgSend(v14, "width");
    v18 = objc_msgSend(v14, "height");
    v22.origin.x = x * (double)v17;
    v22.size.width = width * (double)v17;
    v22.origin.y = y * (double)v18;
    v22.size.height = height * (double)v18;
    v23 = CGRectIntegral(v22);
    objc_msgSend(v14, "makeClippedRectAgainstImageExtentUsingOriginalRect:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    v16 = objc_msgSend(v14, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", a5, 1111970369, v15, a7, 0);
  }
  v19 = (__CVBuffer *)v16;

  return v19;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  __CVBuffer *v18;
  BOOL v19;
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v16, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    && (v21 = 0,
        +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:withDefaultValue:error:", &v21, CFSTR("VNBrightnessDetectorProcessOption_MaximumIntermediateSideLength"), v16, 256, a8)))
  {
    v18 = -[VNBrightnessDetector _createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:](self, "_createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:", v17, v21, v16, a8, x, y, width, height);
    *a7 = v18;
    v19 = v18 != 0;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v11;
  void *v12;
  VNImageScoreObservation *v13;
  double v14;
  void *v15;
  void *v16;
  int v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v18 = 0;
  if (+[VNBrightnessMeasure computeBrightnessScore:onImage:error:](VNBrightnessMeasure, "computeBrightnessScore:onImage:error:", &v18, a4, a8))
  {
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v11, a8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageScoreObservation alloc], "initWithOriginatingRequestSpecifier:", v12);
      LODWORD(v14) = v18;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageScoreObservation setExposureScore:](v13, "setExposureScore:", v15);

      v19[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
