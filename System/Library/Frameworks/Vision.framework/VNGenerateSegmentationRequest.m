@implementation VNGenerateSegmentationRequest

- (void)applyConfigurationOfRequest:(id)a3
{
  VNGenerateSegmentationRequest *v4;
  VNGenerateSegmentationRequest *v5;
  objc_super v6;

  v4 = (VNGenerateSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateSegmentationRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNGenerateSegmentationRequest setOutputPixelFormat:](self, "setOutputPixelFormat:", -[VNGenerateSegmentationRequest outputPixelFormat](v5, "outputPixelFormat"));

    }
  }

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNGenerateSegmentationRequest outputPixelFormat](self, "outputPixelFormat");
  if (v5 == objc_msgSend(v4, "outputPixelFormat"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNGenerateSegmentationRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)performAccurateSegmentationInContext:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = a4;
  -[VNGenerateSegmentationRequest configuredCopyOfSelfWithBalancedQualityLevel](self, "configuredCopyOfSelfWithBalancedQualityLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v9, "setOutputPixelFormat:", -[VNGenerateSegmentationRequest performAccurateSegmentationInContext:options:error:]::pixelFormatTypes[i]);
    objc_msgSend(v8, "cachedObservationsAcceptedByRequest:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_7;
  }
  objc_msgSend(v9, "setOutputPixelFormat:", 1278226534);
  objc_msgSend(v8, "requestPerformerAndReturnError:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (v26[0] = v9,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "performDependentRequests:onBehalfOfRequest:inContext:error:", v13, self, v8, a5),
        v13,
        (v14 & 1) == 0))
  {

    v11 = 0;
LABEL_14:
    self = 0;
    goto LABEL_18;
  }
  objc_msgSend(v9, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  if (!objc_msgSend(v11, "count"))
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Empty observations"));
      self = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v11, CFSTR("VNGuidedUpsamplingGeneratorOption_LowResImages"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &unk_1E459D0A8, CFSTR("VNGuidedUpsamplingGeneratorOption_InputPixelFormat"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGenerateSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v15, CFSTR("VNGuidedUpsamplingGeneratorOption_OutputPixelFormat"));

  v16 = v8;
  v17 = CFSTR("VNGuidedUpsamplingGeneratorType");
  v18 = v25;
  if (self)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v18);
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_KeepRawOutputMask"));
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_MaskImageObservations"));
    objc_msgSend(v16, "session");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "detectorOfType:configuredWithOptions:error:", CFSTR("VNGuidedUpsamplingGeneratorType"), v19, a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v24 = v16;
      v22 = objc_msgSend(v16, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v21, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v22, v18, self, a5, 0);
      self = (VNGenerateSegmentationRequest *)objc_claimAutoreleasedReturnValue();
      v16 = v24;
    }
    else
    {
      self = 0;
    }

  }
LABEL_18:

  return self;
}

- (id)configuredCopyOfSelfWithBalancedQualityLevel
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

- (unsigned)outputPixelFormat
{
  void *v2;
  unsigned int v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "outputPixelFormat");

  return v3;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputPixelFormat:", v3);

}

- (id)description
{
  id v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)VNGenerateSegmentationRequest;
  -[VNImageBasedRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VNGenerateSegmentationRequest outputPixelFormat](self, "outputPixelFormat");
  if (v5 == 1278226488)
    v6 = CFSTR("kCVPixelFormatType_OneComponent8");
  else
    v6 = 0;
  if (v5 == 1278226534)
    v7 = CFSTR("kCVPixelFormatType_OneComponent32Float");
  else
    v7 = v6;
  if (v5 == 1278226536)
    v8 = CFSTR("kCVPixelFormatType_OneComponent16Half");
  else
    v8 = v7;
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ pixelFormat=%@"), v4, v8);

  return v9;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
