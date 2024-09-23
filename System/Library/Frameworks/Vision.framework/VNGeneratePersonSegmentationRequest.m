@implementation VNGeneratePersonSegmentationRequest

- (VNGeneratePersonSegmentationRequest)init
{
  return -[VNGeneratePersonSegmentationRequest initWithCompletionHandler:](self, "initWithCompletionHandler:", 0);
}

- (VNGeneratePersonSegmentationRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](self, "initWithFrameAnalysisSpacing:completionHandler:", &v4, completionHandler);
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNGeneratePersonSegmentationRequest *v4;
  VNGeneratePersonSegmentationRequest *v5;
  objc_super v6;

  v4 = (VNGeneratePersonSegmentationRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNGeneratePersonSegmentationRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNGeneratePersonSegmentationRequest setQualityLevel:](self, "setQualityLevel:", -[VNGeneratePersonSegmentationRequest qualityLevel](v5, "qualityLevel"));
      -[VNGeneratePersonSegmentationRequest setOutputPixelFormat:](self, "setOutputPixelFormat:", -[VNGeneratePersonSegmentationRequest outputPixelFormat](v5, "outputPixelFormat"));
      -[VNGeneratePersonSegmentationRequest setUseTiling:](self, "setUseTiling:", -[VNGeneratePersonSegmentationRequest useTiling](v5, "useTiling"));
      -[VNGeneratePersonSegmentationRequest minimumConfidence](v5, "minimumConfidence");
      -[VNGeneratePersonSegmentationRequest setMinimumConfidence:](self, "setMinimumConfidence:");

    }
  }

}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  VNGeneratePersonSegmentationRequestQualityLevel v9;
  void *v10;

  if (a3 == 1)
    goto LABEL_4;
  if (a3 != 3737841665)
  {
    if (a3 == 3737841664)
      goto LABEL_4;
    if (a4)
    {
      +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
      v6 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
LABEL_14:
    v6 = 0;
    return v6;
  }
  v9 = -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel");
  if (v9 != VNGeneratePersonSegmentationRequestQualityLevelFast)
  {
    if (v9 == VNGeneratePersonSegmentationRequestQualityLevelBalanced)
    {
      v6 = CFSTR("VNE5RTSemanticSegmentationMultiGeneratorType");
      goto LABEL_5;
    }
    if (v9)
    {
      if (a4)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Undefined quality level: %lu"), -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_14;
    }
  }
LABEL_4:
  v6 = CFSTR("VNSegmentationGeneratorType");
LABEL_5:
  v7 = v6;
  return v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNGeneratePersonSegmentationRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNGeneratePersonSegmentationRequest useTiling](self, "useTiling"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("VNSegmentationGeneratorProcessOption_UseTiling"));

  return v5;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  VNGeneratePersonSegmentationRequestQualityLevel v5;
  OSType v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v5 = -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel");
  if (v5 == objc_msgSend(v4, "qualityLevel")
    && (v6 = -[VNGeneratePersonSegmentationRequest outputPixelFormat](self, "outputPixelFormat"),
        v6 == objc_msgSend(v4, "outputPixelFormat"))
    && (-[VNGeneratePersonSegmentationRequest minimumConfidence](self, "minimumConfidence"),
        v8 = v7,
        objc_msgSend(v4, "minimumConfidence"),
        v8 == v9))
  {
    v12.receiver = self;
    v12.super_class = (Class)VNGeneratePersonSegmentationRequest;
    v10 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v12, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
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
  VNGeneratePersonSegmentationRequestQualityLevel v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  BOOL v21;
  id v22;
  VNGeneratePersonSegmentationRequest *v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  id v40;
  id v41;
  id v42;
  unsigned int v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v8, "qosClass");
    v44 = -[VNGeneratePersonSegmentationRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v45);
    v46 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", v10, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    v11 = -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel");
    if (v11)
    {
      if (v11 == VNGeneratePersonSegmentationRequestQualityLevelBalanced)
      {
        if (a5)
        {
          v19 = 0;
          v33 = +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Balanced quality level is handled by compound request"));
          goto LABEL_37;
        }
      }
      else
      {
        if (v11 == VNGeneratePersonSegmentationRequestQualityLevelFast)
        {
          v41 = v45;
          v12 = v9;
          v13 = v44;
          v38 = v12;
          if (self)
          {
            v39 = objc_msgSend(v12, "width");
            v37 = objc_msgSend(v12, "height");
            objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E459CA30, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"));
            v50 = (void *)VNPersonSegmentationGeneratorFastOutputBlobNameMask;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGeneratePersonSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v51[0] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));

            v48 = VNPersonSegmentationGeneratorFastOutputBlobNameMask;
            v49 = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("VNSegmentationGeneratorProcessOption_KeepRawOutputMask"));

            v17 = CFSTR("portrait");
            if (v39 > v37)
              v17 = CFSTR("landscape");
            v18 = v17;
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"));
            if (self->_previousObservations && v39 == self->_previousImageWidth && v37 == self->_previousImageHeight)
              objc_msgSend(v13, "setObject:forKeyedSubscript:");
            -[VNGeneratePersonSegmentationRequest _internalPerformRevision:session:qosClass:generatorOptions:error:](self, a3, v41, v43, v13, (uint64_t)a5);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_storeStrong((id *)&self->_previousObservations, v19);
              self->_previousImageWidth = objc_msgSend(v38, "width");
              self->_previousImageHeight = objc_msgSend(v38, "height");
              v20 = v19;
            }

          }
          else
          {
            v19 = 0;
          }

          goto LABEL_35;
        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = +[VNError errorForInvalidOption:named:](VNError, "errorForInvalidOption:named:", v34, CFSTR("qualityLevel"));

        }
      }
      v21 = 0;
      v19 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v40 = v45;
    v22 = v8;
    v42 = v44;
    if (self)
    {
      v23 = objc_alloc_init(VNGeneratePersonSegmentationRequest);
      -[VNGeneratePersonSegmentationRequest applyConfigurationOfRequest:](v23, "applyConfigurationOfRequest:", self);
      -[VNGeneratePersonSegmentationRequest setQualityLevel:](v23, "setQualityLevel:", 1);
      for (i = 0; i != 12; i += 4)
      {
        -[VNGeneratePersonSegmentationRequest setOutputPixelFormat:](v23, "setOutputPixelFormat:", *(unsigned int *)&-[VNGeneratePersonSegmentationRequest _internalPerformAccurateRevision:session:inContext:qosClass:generatorOptions:error:]::pixelFormatTypes[i]);
        objc_msgSend(v22, "cachedObservationsAcceptedByRequest:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          goto LABEL_26;
      }
      -[VNGeneratePersonSegmentationRequest setOutputPixelFormat:](v23, "setOutputPixelFormat:", 1278226534);
      if (v23)
      {
        -[VNRequest configuration](v23, "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setKeepRawOutputMask:", 1);

      }
      objc_msgSend(v22, "requestPerformerAndReturnError:", a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v51[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v25, "performDependentRequests:onBehalfOfRequest:inContext:error:", v27, self, v22, a5);

        if ((v28 & 1) != 0)
        {
          -[VNRequest results](v23, "results");
          v29 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)v29;
LABEL_26:
          objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_1E459CA18, CFSTR("VNSegmentationGeneratorProcessOption_QualityLevel"));
          v49 = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VNGeneratePersonSegmentationRequest outputPixelFormat](self, "outputPixelFormat"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v30;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v31, CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));

          v47 = VNPersonSegmentationGeneratorLearnedMattingOutputBlobNameMask;
          v48 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v32, CFSTR("VNSegmentationGeneratorProcessOption_KeepRawOutputMask"));

          objc_msgSend(v42, "setObject:forKeyedSubscript:", v25, CFSTR("VNSegmentationGeneratorProcessOption_MaskImageObservations"));
          -[VNGeneratePersonSegmentationRequest _internalPerformRevision:session:qosClass:generatorOptions:error:](self, a3, v40, v43, v42, (uint64_t)a5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        }
      }
      v19 = 0;
LABEL_33:

    }
    else
    {
      v19 = 0;
    }

LABEL_35:
    if (v19)
    {
      -[VNRequest setResults:](self, "setResults:", v19);
      v21 = 1;
      goto LABEL_38;
    }
LABEL_37:
    v21 = 0;
    goto LABEL_38;
  }
  v21 = 0;
LABEL_39:

  return v21;
}

- (VNGeneratePersonSegmentationRequestQualityLevel)qualityLevel
{
  void *v2;
  VNGeneratePersonSegmentationRequestQualityLevel v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "qualityLevel");

  return v3;
}

- (void)setQualityLevel:(VNGeneratePersonSegmentationRequestQualityLevel)qualityLevel
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQualityLevel:", qualityLevel);

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

- (BOOL)useTiling
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "useTiling");

  return v3;
}

- (void)setUseTiling:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUseTiling:", v3);

}

- (float)minimumConfidence
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumConfidence");
  v4 = v3;

  return v4;
}

- (void)setMinimumConfidence:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setMinimumConfidence:", v4);

}

- (id)description
{
  void (**v3)(void *, VNGeneratePersonSegmentationRequestQualityLevel);
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  float v10;
  uint64_t v11;
  objc_super v13;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__VNGeneratePersonSegmentationRequest_description__block_invoke;
  aBlock[3] = &unk_1E4545DC0;
  aBlock[4] = self;
  v3 = (void (**)(void *, VNGeneratePersonSegmentationRequestQualityLevel))_Block_copy(aBlock);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)VNGeneratePersonSegmentationRequest;
  -[VNStatefulRequest description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, -[VNGeneratePersonSegmentationRequest qualityLevel](self, "qualityLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ qualityLevel=%@"), v5, v6);

  if (-[VNRequest resolvedRevision](self, "resolvedRevision") >= 0xDECAF000)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = -[VNGeneratePersonSegmentationRequest useTiling](self, "useTiling");
    -[VNGeneratePersonSegmentationRequest minimumConfidence](self, "minimumConfidence");
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@ useTiling=%d minimumConfidence=%f"), v7, v9, v10);

    v7 = (void *)v11;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousObservations, 0);
}

uint64_t __50__VNGeneratePersonSegmentationRequest_description__block_invoke(uint64_t a1)
{
  unint64_t v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "qualityLevel");
  if (v1 > 2)
    return 0;
  else
    return *((_QWORD *)&off_1E4545E00 + v1);
}

- (id)_internalPerformRevision:(void *)a3 session:(uint64_t)a4 qosClass:(void *)a5 generatorOptions:(uint64_t)a6 error:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = a3;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_OutputPixelFormat"));
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_KeepRawOutputMask"));
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("VNSegmentationGeneratorProcessOption_MaskImageObservations"));
  objc_msgSend(a1, "applicableDetectorTypeForRevision:error:", a2, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "detectorOfType:configuredWithOptions:error:", v14, v13, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(a1, "regionOfInterest");
      objc_msgSend(v15, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", a4, v12, a1, a6, 0);
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

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNGeneratePersonSegmentationRequest(Revisioning) revisionAvailability]::revisionAvailability;
}

+ (id)privateRevisionsSet
{
  if (+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_16450);
  return (id)+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::privateRevisions;
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
    return CFSTR("VNGeneratePersonSegmentationRequestPrivateRevisionInstanceBased4People");
  if (a3 == 3737841665)
  {
    v5 = CFSTR("VNGeneratePersonSegmentationRequestPrivateRevisionSemanticV6");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNGeneratePersonSegmentationRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __71__VNGeneratePersonSegmentationRequest_Revisioning__privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 3737841664);
  objc_msgSend(v2, "addIndex:", 3737841665);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::privateRevisions;
  +[VNGeneratePersonSegmentationRequest(Revisioning) privateRevisionsSet]::privateRevisions = v0;

}

- (uint64_t)keepRawOutputMask
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "keepRawOutputMask");

  return v2;
}

@end
