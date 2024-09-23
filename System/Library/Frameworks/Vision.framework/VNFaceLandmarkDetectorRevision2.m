@implementation VNFaceLandmarkDetectorRevision2

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v12;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  objc_super v34;

  v12 = *(_QWORD *)&a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a5;
  v20 = a7;
  v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)VNFaceLandmarkDetectorRevision2;
  -[VNFaceLandmarkDetectorDNN processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:](&v34, sel_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler_, a4, v19, v12, v20, a8, v21, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v30 = v23;
LABEL_25:

      goto LABEL_26;
    }
    if (objc_msgSend(v23, "count") != 1)
    {
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error while processing Face Landmarks"));
        v30 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      goto LABEL_25;
    }
    -[VNDetector validatedImageBufferFromOptions:error:](self, "validatedImageBufferFromOptions:error:", v19, a8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v30 = 0;
LABEL_24:

      goto LABEL_25;
    }
    +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v19, a8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v30 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v26 = -[VNFaceLandmarkDetectorDNN landmarkPoints65](self, "landmarkPoints65");
    v27 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("VNFaceLandmarkDetectorProcessOption_CalculateLandmarkScore"));
    if (!-[VNFaceLandmarkDetector postprocessLandmarkResultsForLandmarks:imageBuffer:outputFace:options:warningRecorder:error:](self, "postprocessLandmarkResultsForLandmarks:imageBuffer:outputFace:options:warningRecorder:error:", v26, v25, v24, v27, v20, a8)|| (-[VNFaceLandmarkDetector calculatePupilLocationAndUpdateLandmarkPoints:](self, "calculatePupilLocationAndUpdateLandmarkPoints:", v26), !-[VNFaceLandmarkDetectorDNN translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:imageBuffer:outputFace:error:](self, "translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:imageBuffer:outputFace:error:", v26, v25, v24, a8)))
    {
      v30 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *v26, v26[1] - *v26);
    v29 = (void *)v28;
    if (v28)
    {
      v32 = (void *)v28;
      objc_msgSend(v24, "setLandmarkPoints65Data:originatingRequestSpecifier:", v28, v33);
      v30 = v23;
    }
    else
    {
      if (!a8)
      {
        v30 = 0;
        goto LABEL_21;
      }
      v32 = 0;
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Internal error while processing Face Landmarks"));
      v30 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v32;
LABEL_21:

    goto LABEL_22;
  }
  v30 = 0;
LABEL_26:

  -[VNFaceLandmarkDetectorDNN releaseResources](self, "releaseResources");
  return v30;
}

+ (unsigned)landmarkDetectorDNNVersion
{
  return 1;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return CFSTR("solo_landmarks_s9min6ugm8_opt.espresso");
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return CFSTR("image");
}

@end
