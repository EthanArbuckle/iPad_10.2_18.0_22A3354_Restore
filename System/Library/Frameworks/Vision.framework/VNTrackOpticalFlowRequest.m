@implementation VNTrackOpticalFlowRequest

- (id)_createGeneratorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4 images:(id)a5 portraitMode:(BOOL)a6 previousTargetImageIsCurrentRefImage:(BOOL)a7 previousObservation:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = a7;
  v10 = a6;
  v14 = a5;
  v15 = a8;
  v16 = -[VNTrackOpticalFlowRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, a4);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("VNOpticalFlowGeneratorInitOption_PortraitMode"));

  if (v9)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("VNOpticalFlowGeneratorProcessOption_PreviousObservation"));

  return v16;
}

- (id)_observationForOpticalFlowOfReferenceImageBuffer:(id)a3 targetImageBuffer:(id)a4 portraitMode:(BOOL)a5 previousObservation:(id)a6 previousTargetImageIsCurrentRefImage:(BOOL)a7 requestRevision:(unint64_t)a8 requestPerformingContext:(id)a9 error:(id *)a10
{
  _BOOL8 v11;
  _BOOL8 v13;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[3];

  v11 = a7;
  v13 = a5;
  v33[2] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v16 = a4;
  v32 = a6;
  v17 = a9;
  -[VNTrackOpticalFlowRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a8, a10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v17, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v31;
    v33[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNTrackOpticalFlowRequest _createGeneratorOptionsForRequestRevision:session:images:portraitMode:previousTargetImageIsCurrentRefImage:previousObservation:](self, "_createGeneratorOptionsForRequestRevision:session:images:portraitMode:previousTargetImageIsCurrentRefImage:previousObservation:", a8, v19, v20, v13, v11, v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "detectorOfType:configuredWithOptions:error:", v18, v21, a10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v29 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", objc_msgSend(v16, "width"), objc_msgSend(v16, "height"));
    objc_msgSend(v22, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", objc_msgSend(v17, "qosClass"), v21, self, a10, 0, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      if (objc_msgSend(v27, "count") == 1)
      {
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        goto LABEL_12;
      }
      if (a10)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot generate optical flow"));
        v29 = 0;
        *a10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    v29 = 0;
    goto LABEL_11;
  }
  v29 = 0;
LABEL_13:

  return v29;
}

- (VNTrackOpticalFlowRequest)init
{
  return -[VNTrackOpticalFlowRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (VNTrackOpticalFlowRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](self, "initWithFrameAnalysisSpacing:completionHandler:", &v4, completionHandler);
}

- (VNTrackOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  void *v2;
  VNTrackOpticalFlowRequestComputationAccuracy v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "computationAccuracy");

  return v3;
}

- (void)setComputationAccuracy:(VNTrackOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComputationAccuracy:", computationAccuracy);

}

- (id)supportedOutputPixelFormatsAndReturnError:(id *)a3
{
  unint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v10;

  v5 = -[VNRequest resolvedRevision](self, "resolvedRevision");
  v10 = 0;
  v6 = -[VNRequest applicableDetectorClassAndOptions:forRevision:error:](self, "applicableDetectorClassAndOptions:forRevision:error:", &v10, v5, a3);
  v7 = v10;
  if (!v6)
    goto LABEL_6;
  if (!-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
  {
    if (a3)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v5, self);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  -[objc_class supportedOutputPixelFormatsForOptions:error:](v6, "supportedOutputPixelFormatsForOptions:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (OSType)outputPixelFormat
{
  void *v2;
  OSType v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outputPixelFormat");

  return v3;
}

- (void)setOutputPixelFormat:(OSType)outputPixelFormat
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&outputPixelFormat;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputPixelFormat:", v3);

}

- (BOOL)keepNetworkOutput
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keepNetworkOutput");

  return v3;
}

- (void)setKeepNetworkOutput:(BOOL)keepNetworkOutput
{
  _BOOL8 v3;
  id v4;

  v3 = keepNetworkOutput;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeepNetworkOutput:", v3);

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNOpticalFlowGeneratorType");
    v5 = CFSTR("VNOpticalFlowGeneratorType");
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNTrackOpticalFlowRequest *v4;
  VNTrackOpticalFlowRequest *v5;
  objc_super v6;

  v4 = (VNTrackOpticalFlowRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNTrackOpticalFlowRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNTrackOpticalFlowRequest setOutputPixelFormat:](self, "setOutputPixelFormat:", -[VNTrackOpticalFlowRequest outputPixelFormat](v5, "outputPixelFormat"));
      -[VNTrackOpticalFlowRequest setKeepNetworkOutput:](self, "setKeepNetworkOutput:", -[VNTrackOpticalFlowRequest keepNetworkOutput](v5, "keepNetworkOutput"));

    }
  }

}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  VNTrackOpticalFlowRequestComputationAccuracy v7;
  VNTrackOpticalFlowRequestComputationAccuracy v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNTrackOpticalFlowRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v13, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = -[VNTrackOpticalFlowRequest computationAccuracy](self, "computationAccuracy");
  if (v7 - 1 >= 3)
    v8 = VNTrackOpticalFlowRequestComputationAccuracyLow;
  else
    v8 = v7;
  objc_msgSend(v6, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNTrackOpticalFlowRequest outputPixelFormat](self, "outputPixelFormat"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("VNOpticalFlowGeneratorProcessOption_OutputPixelFormat"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNTrackOpticalFlowRequest keepNetworkOutput](self, "keepNetworkOutput"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("VNOpticalFlowGeneratorProcessOption_KeepNetworkOutput"));

  return v5;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  CGSize v19;
  VNImageBuffer *previousImageBuffer;
  VNImageSignature *previousImageSignature;
  VNOpticalFlowObservation *previousObservation;
  VNImageSignature *v23;
  VNImageSignature *v24;
  id *p_previousImageBuffer;
  VNImageBuffer *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  _BOOL4 v32;

  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = objc_msgSend(v9, "aspectForRegionOfInterest:");
    v32 = v18 == 1;
    if (self->_previousRequestRevision != a3 || self->_previousPortraitMode != v32)
    {
      self->_previousRequestRevision = 0;
      v19 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      self->_previousRegionOfInterest.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      self->_previousRegionOfInterest.size = v19;
      previousImageBuffer = self->_previousImageBuffer;
      self->_previousImageBuffer = 0;

      previousImageSignature = self->_previousImageSignature;
      self->_previousImageSignature = 0;

      previousObservation = self->_previousObservation;
      self->_previousObservation = 0;

      self->_previousPortraitMode = 0;
    }
    v23 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v9, a5, v11, v13, v15, v17);
    v24 = v23;
    p_previousImageBuffer = (id *)&self->_previousImageBuffer;
    v26 = self->_previousImageBuffer;
    if (v26)
    {
      if (self->_previousImageSignature)
      {
        v27 = -[VNImageSignature isEqual:](v23, "isEqual:");
        v26 = (VNImageBuffer *)*p_previousImageBuffer;
      }
      else
      {
        v27 = 0;
      }
      -[VNTrackOpticalFlowRequest _observationForOpticalFlowOfReferenceImageBuffer:targetImageBuffer:portraitMode:previousObservation:previousTargetImageIsCurrentRefImage:requestRevision:requestPerformingContext:error:](self, "_observationForOpticalFlowOfReferenceImageBuffer:targetImageBuffer:portraitMode:previousObservation:previousTargetImageIsCurrentRefImage:requestRevision:requestPerformingContext:error:", v9, v26, v18 == 1, self->_previousObservation, v27, a3, v8, a5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        v28 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v29 = 0;
    }
    self->_previousRequestRevision = a3;
    self->_previousRegionOfInterest.origin.x = v11;
    self->_previousRegionOfInterest.origin.y = v13;
    self->_previousRegionOfInterest.size.width = v15;
    self->_previousRegionOfInterest.size.height = v17;
    objc_storeStrong(p_previousImageBuffer, v9);
    objc_storeStrong((id *)&self->_previousImageSignature, v24);
    objc_storeStrong((id *)&self->_previousObservation, v29);
    self->_previousPortraitMode = v32;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v29, 0);
    -[VNRequest setResults:](self, "setResults:", v30);

    v28 = 1;
LABEL_14:

    goto LABEL_15;
  }
  v28 = 0;
LABEL_15:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousObservation, 0);
  objc_storeStrong((id *)&self->_previousImageSignature, 0);
  objc_storeStrong((id *)&self->_previousImageBuffer, 0);
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNTrackOpticalFlowRequest revisionAvailability]::revisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
