@implementation VNImageRegistrationDetector

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

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  VNImageTranslationAlignmentObservation *v14;
  double v15;
  void *v16;
  _OWORD v18[3];
  _OWORD v19[3];
  double v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v10, a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNImageRegistrationDetectorProcessOption_ReferenceImageRegistrationSignature"), v10, a8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[VNValidationUtilities requiredObjectOfClass:forKey:inOptions:error:](VNValidationUtilities, "requiredObjectOfClass:forKey:inOptions:error:", objc_opt_class(), CFSTR("VNImageRegistrationDetectorProcessOption_FloatingImageRegistrationSignature"), v10, a8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && (v20 = 0.0,
            +[VNValidationUtilities getPercentageValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getPercentageValue:forKey:inOptions:withDefaultValue:error:", &v20, CFSTR("VNImageRegistrationDetectorProcessOption_MinimumOverlapPercentage"), v10, a8, 0.25)))
      {
        v14 = -[VNObservation initWithOriginatingRequestSpecifier:]([VNImageTranslationAlignmentObservation alloc], "initWithOriginatingRequestSpecifier:", v11);
        -[VNImageAlignmentObservation setReferenceImageSignature:](v14, "setReferenceImageSignature:", v12);
        -[VNImageAlignmentObservation setFloatingImageSignature:](v14, "setFloatingImageSignature:", v13);
        HIDWORD(v15) = HIDWORD(v20);
        *(float *)&v15 = v20;
        if (+[VNImageRegistration computeTransform:forRegisteringImageSignature:withSignature:minimumOverlap:error:](VNImageRegistration, "computeTransform:forRegisteringImageSignature:withSignature:minimumOverlap:error:", v19, v12, v13, a8, v15))
        {
          v18[0] = v19[0];
          v18[1] = v19[1];
          v18[2] = v19[2];
          -[VNImageTranslationAlignmentObservation setAlignmentTransform:](v14, "setAlignmentTransform:", v18);
          v21[0] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
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
