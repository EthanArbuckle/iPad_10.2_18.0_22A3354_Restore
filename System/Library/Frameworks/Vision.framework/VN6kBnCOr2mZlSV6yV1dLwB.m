@implementation VN6kBnCOr2mZlSV6yV1dLwB

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNImageSignatureDetectorType");
  return CFSTR("VNImageSignatureDetectorType");
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VN6kBnCOr2mZlSV6yV1dLwB *v4;
  VN6kBnCOr2mZlSV6yV1dLwB *v5;
  objc_super v6;

  v4 = (VN6kBnCOr2mZlSV6yV1dLwB *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VN6kBnCOr2mZlSV6yV1dLwB setImageSignatureprintType:](self, "setImageSignatureprintType:", -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](v5, "imageSignatureprintType"));
      -[VN6kBnCOr2mZlSV6yV1dLwB setImageSignatureHashType:](self, "setImageSignatureHashType:", -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureHashType](v5, "imageSignatureHashType"));

    }
  }

}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v10, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureprintType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureHashType](self, "imageSignatureHashType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNImageSignatureDetectorInitOption_ImageSignatureHashType"));

  }
  return v6;
}

- (VN6kBnCOr2mZlSV6yV1dLwB)initWithImageSignatureprintType:(unint64_t)a3 imageSignatureHashType:(unint64_t)a4
{
  return -[VN6kBnCOr2mZlSV6yV1dLwB initWithImageSignatureprintType:imageSignatureHashType:completionHandler:](self, "initWithImageSignatureprintType:imageSignatureHashType:completionHandler:", a3, a4, 0);
}

- (VN6kBnCOr2mZlSV6yV1dLwB)initWithImageSignatureprintType:(unint64_t)a3 imageSignatureHashType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  VN6kBnCOr2mZlSV6yV1dLwB *v9;
  VN6kBnCOr2mZlSV6yV1dLwB *v10;
  objc_super v12;

  v8 = a5;
  v9 = 0;
  if (a3 == 3 && a4 == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
    v10 = -[VNRequest initWithCompletionHandler:](&v12, sel_initWithCompletionHandler_, v8);
    self = v10;
    if (v10)
    {
      -[VN6kBnCOr2mZlSV6yV1dLwB setImageSignatureprintType:](v10, "setImageSignatureprintType:", 3);
      -[VN6kBnCOr2mZlSV6yV1dLwB setImageSignatureHashType:](self, "setImageSignatureHashType:", 1);
      self = self;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "imageSignatureprintType");
  if (v5 != -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType"))
    goto LABEL_5;
  v6 = objc_msgSend(v4, "imageSignatureHashType");
  if (v6 != -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureHashType](self, "imageSignatureHashType"))
    goto LABEL_5;
  -[VN6kBnCOr2mZlSV6yV1dLwB inputSignatureprint](self, "inputSignatureprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputSignatureprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = VisionCoreEqualOrNilObjects();

  if ((v9 & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
    v10 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v12, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (VN6Ac6Cyl5O5oK19HboyMBR)inputSignatureprint
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputSignatureprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (VN6Ac6Cyl5O5oK19HboyMBR *)v3;
}

- (void)setInputSignatureprint:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputSignatureprint:", v5);
  if (v5)
    -[VN6kBnCOr2mZlSV6yV1dLwB setImageSignatureprintType:](self, "setImageSignatureprintType:", objc_msgSend(v5, "imageSignatureprintType"));

}

- (unint64_t)imageSignatureprintType
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageSignatureprintType");

  return v3;
}

- (void)setImageSignatureprintType:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageSignatureprintType:", a3);

}

- (unint64_t)imageSignatureHashType
{
  void *v2;
  unint64_t v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageSignatureHashType");

  return v3;
}

- (void)setImageSignatureHashType:(unint64_t)a3
{
  id v4;

  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageSignatureHashType:", a3);

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && -[VNRequest validateImageBuffer:ofNonZeroWidth:andHeight:error:](self, "validateImageBuffer:ofNonZeroWidth:andHeight:error:", v9, 0, 0, a5))
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v20, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    if (!v11)
    {
      v15 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[VN6kBnCOr2mZlSV6yV1dLwB inputSignatureprint](self, "inputSignatureprint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      if (-[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType") != 3)
      {
        v13 = 0;
        goto LABEL_14;
      }
      -[VN6kBnCOr2mZlSV6yV1dLwB imageSignaturnprintByRunningNeuralHashprintRequest:error:](self, "imageSignaturnprintByRunningNeuralHashprintRequest:error:", v8, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_12;
    }
    v14 = objc_msgSend(v13, "imageSignatureprintType");
    if (v14 != -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType"))
    {
      if (a5)
      {
        +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Mismatch in signature print type"));
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
LABEL_12:
      v15 = 0;
      goto LABEL_17;
    }
LABEL_14:
    v21[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNImageSignatureDetectorProcessOption_ImageSignatureprintInput"));
    v17 = objc_msgSend(v8, "qosClass");
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v17, v12, self, a5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18 != 0;
    if (v18)
      -[VNRequest setResults:](self, "setResults:", v18);

    goto LABEL_17;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(2000, self);
}

- (id)imageSignaturnprintByRunningNeuralHashprintRequest:(id)a3 error:(id *)a4
{
  id v6;
  VNCreateNeuralHashprintRequest *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(VNCreateNeuralHashprintRequest);
  -[VNRequest setRevision:](v7, "setRevision:", 1);
  objc_msgSend(v6, "requestPerformerAndReturnError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "performDependentRequests:onBehalfOfRequest:inContext:error:", v9, self, v6, a4);

  if ((v10 & 1) == 0)
    goto LABEL_8;
  -[VNRequest results](v7, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 1;

  if (!v12)
  {
    if (a4)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Internal error creating sceneprint"));
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  -[VNRequest results](v7, "results");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageNeuralHashprint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else if (a4)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Internal error while creating image signature print"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v16;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)dependentRequestCompatibility
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VN6kBnCOr2mZlSV6yV1dLwB dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE63F920 = objc_opt_class();
    unk_1EE63F928 = xmmword_1A15FB410;
    qword_1EE63F938 = objc_opt_class();
    unk_1EE63F940 = 1;
    qword_1EE63F950 = 0;
    unk_1EE63F958 = 0;
    qword_1EE63F948 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VN6kBnCOr2mZlSV6yV1dLwB dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6;
  VN6kBnCOr2mZlSV6yV1dLwB *v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VN6kBnCOr2mZlSV6yV1dLwB;
  if ((objc_msgSendSuper2(&v10, sel_warmUpSession_error_, v6, a4) & 1) != 0)
  {
    v7 = -[VN6kBnCOr2mZlSV6yV1dLwB initWithImageSignatureprintType:imageSignatureHashType:]([VN6kBnCOr2mZlSV6yV1dLwB alloc], "initWithImageSignatureprintType:imageSignatureHashType:", 3, 1);
    v8 = -[VNRequest warmUpSession:error:](v7, "warmUpSession:error:", v6, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)VN6kBnCOr2mZlSV6yV1dLwB;
  -[VNImageBasedRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %lu %lu"), v4, -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureprintType](self, "imageSignatureprintType"), -[VN6kBnCOr2mZlSV6yV1dLwB imageSignatureHashType](self, "imageSignatureHashType"));

  return v5;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VN6kBnCOr2mZlSV6yV1dLwB(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
