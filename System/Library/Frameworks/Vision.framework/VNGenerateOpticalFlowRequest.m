@implementation VNGenerateOpticalFlowRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 - 1 > 1)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v4 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = CFSTR("VNOpticalFlowGeneratorType");
    v5 = CFSTR("VNOpticalFlowGeneratorType");
  }
  return v4;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNGenerateOpticalFlowRequest *v4;
  VNGenerateOpticalFlowRequest *v5;
  objc_super v6;

  v4 = (VNGenerateOpticalFlowRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateOpticalFlowRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNGenerateOpticalFlowRequest setComputationAccuracy:](self, "setComputationAccuracy:", -[VNGenerateOpticalFlowRequest computationAccuracy](v5, "computationAccuracy"));
      -[VNGenerateOpticalFlowRequest setOutputPixelFormat:](self, "setOutputPixelFormat:", -[VNGenerateOpticalFlowRequest outputPixelFormat](v5, "outputPixelFormat"));
      -[VNGenerateOpticalFlowRequest setKeepNetworkOutput:](self, "setKeepNetworkOutput:", -[VNGenerateOpticalFlowRequest keepNetworkOutput](v5, "keepNetworkOutput"));

    }
  }

}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  VNGenerateOpticalFlowRequestComputationAccuracy v8;
  VNGenerateOpticalFlowRequestComputationAccuracy v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VNGenerateOpticalFlowRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v19, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = -[VNGenerateOpticalFlowRequest computationAccuracy](self, "computationAccuracy");
  if (v8 - 1 >= 3)
    v9 = VNGenerateOpticalFlowRequestComputationAccuracyLow;
  else
    v9 = v8;
  objc_msgSend(v7, "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNOpticalFlowGeneratorOption_ComputationAccuracy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGenerateOpticalFlowRequest outputPixelFormat](self, "outputPixelFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("VNOpticalFlowGeneratorProcessOption_OutputPixelFormat"));

  if (a3 == 2)
  {
    v18 = 0;
    -[VNTargetedImageRequest requiredTargetedImageBufferReturningError:](self, "requiredTargetedImageBufferReturningError:", &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    objc_msgSend(v13, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", v12 != 0, v14);

    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "aspectForRegionOfInterest:") == 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("VNOpticalFlowGeneratorInitOption_PortraitMode"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNGenerateOpticalFlowRequest keepNetworkOutput](self, "keepNetworkOutput"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("VNOpticalFlowGeneratorProcessOption_KeepNetworkOutput"));

  }
  return v6;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 1;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    objc_msgSend(v8, "previousSequencedObservationsAcceptedByRequest:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  v12 = -[VNGenerateOpticalFlowRequest _internalPerformRevision:inContext:previousObservation:error:](self, "_internalPerformRevision:inContext:previousObservation:error:", a3, v9, v11, a5);
  objc_msgSend(v11, "setTargetImageSignature:", 0);
  objc_msgSend(v11, "setOpticalFlow:", 0);

  return v12;
}

- (BOOL)_internalPerformRevision:(unint64_t)a3 inContext:(id)a4 previousObservation:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  VNImageSignature *v33;
  void *v34;
  BOOL v35;
  void *v37;
  id v38;
  VNImageSignature *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  -[VNGenerateOpticalFlowRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a3, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v10, "imageBufferAndReturnError:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v35 = 0;
LABEL_22:

      goto LABEL_23;
    }
    -[VNTargetedImageRequest requiredTargetedImageBufferReturningError:](self, "requiredTargetedImageBufferReturningError:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v35 = 0;
LABEL_21:

      goto LABEL_22;
    }
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v39 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v13, a6, v15, v17, v19, v21);
    objc_msgSend(v11, "targetImageSignature");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VNImageSignature isEqual:](v39, "isEqual:", v23);

    if ((v24 & 1) == 0)
    {
      objc_msgSend(v11, "setTargetImageSignature:", 0);
      objc_msgSend(v11, "setOpticalFlow:", 0);
    }
    objc_msgSend(v10, "session");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v13;
    v43[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNGenerateOpticalFlowRequest _createGeneratorOptionsForRequestRevision:session:images:previousTargetImageIsCurrentRefImage:previousObservation:](self, "_createGeneratorOptionsForRequestRevision:session:images:previousTargetImageIsCurrentRefImage:previousObservation:", a3, v41, v25, v24, v11);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "detectorOfType:configuredWithOptions:error:", v12, v40, a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      v35 = 0;
LABEL_20:

      goto LABEL_21;
    }
    -[VNImageBasedRequest regionOfInterestPixelRectForWidth:height:](self, "regionOfInterestPixelRectForWidth:height:", objc_msgSend(v14, "width"), objc_msgSend(v14, "height"));
    objc_msgSend(v26, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", objc_msgSend(v10, "qosClass"), v40, self, a6, 0, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31)
      goto LABEL_18;
    if (objc_msgSend(v31, "count") == 1)
    {
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 1)
      {
        v33 = -[VNImageSignature initWithImageBuffer:regionOfInterest:error:]([VNImageSignature alloc], "initWithImageBuffer:regionOfInterest:error:", v14, a6, v16, v18, v20, v22);
        objc_msgSend(v37, "setTargetImageSignature:", v33);

      }
      v42 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1, v37);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNRequest setResults:](self, "setResults:", v34);

      v35 = 1;
      goto LABEL_19;
    }
    if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot generate optical flow"));
      v35 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_18:
      v35 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  v35 = 0;
LABEL_23:

  return v35;
}

- (id)_createGeneratorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4 images:(id)a5 previousTargetImageIsCurrentRefImage:(BOOL)a6 previousObservation:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;

  v8 = a6;
  v12 = a5;
  v13 = a7;
  v14 = -[VNGenerateOpticalFlowRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, a4);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("VNDetectorProcessOption_InputImageBuffers"));
  if (v8)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("VNOpticalFlowGeneratorProcessOption_PreviousObservation"));

  return v14;
}

- (VNGenerateOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  _QWORD *v2;
  VNGenerateOpticalFlowRequestComputationAccuracy v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[19];
  else
    v3 = VNGenerateOpticalFlowRequestComputationAccuracyLow;

  return v3;
}

- (void)setComputationAccuracy:(VNGenerateOpticalFlowRequestComputationAccuracy)computationAccuracy
{
  _QWORD *v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[19] = computationAccuracy;

}

- (OSType)outputPixelFormat
{
  _DWORD *v2;
  OSType v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[37];
  else
    v3 = 0;

  return v3;
}

- (void)setOutputPixelFormat:(OSType)outputPixelFormat
{
  _DWORD *v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[37] = outputPixelFormat;

}

- (BOOL)keepNetworkOutput
{
  _BYTE *v2;
  BOOL v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[144] != 0;
  else
    v3 = 0;

  return v3;
}

- (void)setKeepNetworkOutput:(BOOL)keepNetworkOutput
{
  _BYTE *v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[144] = keepNetworkOutput;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateOpticalFlowRequest revisionAvailability]::revisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
