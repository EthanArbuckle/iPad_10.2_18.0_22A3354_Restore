@implementation VNGenerateSkySegmentationRequest

- (void)applyConfigurationOfRequest:(id)a3
{
  VNGenerateSkySegmentationRequest *v4;
  VNGenerateSkySegmentationRequest *v5;
  objc_super v6;

  v4 = (VNGenerateSkySegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGenerateSkySegmentationRequest;
    -[VNGenerateSegmentationRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNGenerateSkySegmentationRequest setQualityLevel:](self, "setQualityLevel:", -[VNGenerateSkySegmentationRequest qualityLevel](v5, "qualityLevel"));

    }
  }

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  int64_t v6;
  int64_t v7;
  __CFString *v8;
  __CFString *v10;
  void *v11;

  if (a3 == 3737841664)
  {
    v7 = -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel");
    if (v7 == 1)
    {
      v8 = CFSTR("VNE5RTSemanticSegmentationMultiGeneratorType");
      goto LABEL_14;
    }
    if (v7)
    {
      if (a4)
      {
LABEL_16:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v11, CFSTR("qualityLevel"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_17:
      v8 = 0;
      return v8;
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (a4)
      {
        +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        return 0;
      }
      goto LABEL_17;
    }
    v6 = -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel");
    if (v6 == 1)
    {
      v8 = CFSTR("VNSegmentationGeneratorType");
      goto LABEL_14;
    }
    if (v6)
    {
      if (a4)
        goto LABEL_16;
      goto LABEL_17;
    }
  }
  v8 = CFSTR("VNGuidedUpsamplingGeneratorType");
LABEL_14:
  v10 = v8;
  return v8;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNGenerateSkySegmentationRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v8, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"));

  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel");
  if (v5 == objc_msgSend(v4, "qualityLevel"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNGenerateSkySegmentationRequest;
    v6 = -[VNGenerateSegmentationRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(1000, self);
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VNGenerateSkySegmentationRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v10);
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    v13 = -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel");
    if (v13)
    {
      if (v13 == 1)
      {
        if (a5)
        {
          v14 = 0;
          v15 = +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Balanced quality level is handled by compound request"));
          v16 = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VNGenerateSkySegmentationRequest qualityLevel](self, "qualityLevel"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v18, CFSTR("qualityLevel"));

      }
    }
    else
    {
      -[VNGenerateSegmentationRequest performAccurateSegmentationInContext:options:error:](self, "performAccurateSegmentationInContext:options:error:", v8, v11, a5);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[VNRequest setResults:](self, "setResults:", v17);
        v16 = 1;
        v14 = (void *)v17;
        goto LABEL_12;
      }
    }
    v16 = 0;
    v14 = 0;
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:

  return v16;
}

- (id)configuredCopyOfSelfWithBalancedQualityLevel
{
  VNGenerateSkySegmentationRequest *v3;

  v3 = objc_alloc_init(VNGenerateSkySegmentationRequest);
  -[VNGenerateSkySegmentationRequest applyConfigurationOfRequest:](v3, "applyConfigurationOfRequest:", self);
  -[VNGenerateSkySegmentationRequest setQualityLevel:](v3, "setQualityLevel:", 1);
  return v3;
}

- (int64_t)qualityLevel
{
  void *v2;
  int64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "qualityLevel");

  return v3;
}

- (void)setQualityLevel:(int64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityLevel:", a3);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGenerateSkySegmentationRequest revisionAvailability]::revisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNGenerateSkySegmentationRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNGenerateSkySegmentationRequest privateRevisionsSet]::onceToken, &__block_literal_global_31030);
  return (id)+[VNGenerateSkySegmentationRequest privateRevisionsSet]::privateRevisions;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 == 3737841664)
  {
    v5 = CFSTR("VNGenerateSkySegmentationRequestPrivateRevisionSemanticV6");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNGenerateSkySegmentationRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __55__VNGenerateSkySegmentationRequest_privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 3737841664);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNGenerateSkySegmentationRequest privateRevisionsSet]::privateRevisions;
  +[VNGenerateSkySegmentationRequest privateRevisionsSet]::privateRevisions = v0;

}

@end
