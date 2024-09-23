@implementation VNBlurDetector

+ (BOOL)isReentrant
{
  return 1;
}

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
    v16 = objc_msgSend(v14, "createBufferWithMaxSideLengthOf:pixelFormat:options:error:", a5, 1278226488, v15, a7);
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
    v16 = objc_msgSend(v14, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", a5, 1278226488, v15, a7, 0);
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
        +[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v21, CFSTR("VNBlurDetectorProcessOption_MaximumIntermediateSideLength"), v16, a8)))
  {
    v18 = -[VNBlurDetector _createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:](self, "_createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:", v17, v21, v16, a8, x, y, width, height);
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
  id v12;
  id v13;
  void *v14;
  VNImageBlurObservation *v15;
  void *v16;
  double v17;
  BOOL v18;
  VNImageScoreObservation *v19;
  double v20;
  void *v21;
  uint64_t v23;
  int v24;
  VNImageScoreObservation *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a7;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v12, a8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_15;
  v24 = 0;
  if (CVPixelBufferGetWidth(a4) >= 0x20 && CVPixelBufferGetHeight(a4) > 0x1F)
  {
    v23 = 0;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &v23, CFSTR("VNBlurDetectorProcessOption_ImageBlurDeterminationMethod"), v12, a8))goto LABEL_15;
    if (v23 == 1)
    {
      v18 = +[VNBlurMeasure computeEdgeWidthBlurScore:onGrayscaleImage:error:](VNBlurMeasure, "computeEdgeWidthBlurScore:onGrayscaleImage:error:", &v24, a4, a8);
    }
    else
    {
      if (v23)
      {
        if (a8)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
          v19 = (VNImageScoreObservation *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v19, CFSTR("blurDeterminationMethod"));
          v16 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
LABEL_15:
        v16 = 0;
        goto LABEL_16;
      }
      LODWORD(v17) = 0;
      v18 = +[VNBlurMeasure computeBlurScore:onGrayscaleImage:insetFactor:error:](VNBlurMeasure, "computeBlurScore:onGrayscaleImage:insetFactor:error:", &v24, a4, a8, v17);
    }
    if (v18)
    {
      v19 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageScoreObservation alloc], "initWithOriginatingRequestSpecifier:", v14);
      LODWORD(v20) = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageScoreObservation setBlurScore:](v19, "setBlurScore:", v21);

      v25 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_16;
    }
    goto LABEL_15;
  }
  VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v13, 32);
  v15 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageBlurObservation alloc], "initWithOriginatingRequestSpecifier:", v14);
  -[VNImageScoreObservation setBlurScore:](v15, "setBlurScore:", &unk_1E459D2B8);
  v26[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v16;
}

@end
