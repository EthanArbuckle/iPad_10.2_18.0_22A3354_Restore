@implementation VNDetectFaceLandmarksRequest

void __51__VNDetectFaceLandmarksRequest_privateRevisionsSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (+[VNRequest supportsPrivateRevision:](VNDetectFaceRectanglesRequest, "supportsPrivateRevision:", 3737841667))
  {
    objc_msgSend(v2, "addIndex:", 3737841664);
  }
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)+[VNDetectFaceLandmarksRequest privateRevisionsSet]::ourPrivateRevisions;
  +[VNDetectFaceLandmarksRequest privateRevisionsSet]::ourPrivateRevisions = v0;

}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectFaceLandmarksRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNDetectFaceLandmarksRequest;
  -[VNRequest resolvedRevisionDidChangeFromRevision:](&v5, sel_resolvedRevisionDidChangeFromRevision_, a3);
  if (-[VNRequest revision](self, "revision") <= 2)
  {
    -[VNRequest configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstellation:", 1);

  }
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectFaceLandmarksRequest privateRevisionsSet]::onceToken != -1)
    dispatch_once(&+[VNDetectFaceLandmarksRequest privateRevisionsSet]::onceToken, &__block_literal_global_72);
  return (id)+[VNDetectFaceLandmarksRequest privateRevisionsSet]::ourPrivateRevisions;
}

- (VNRequestFaceLandmarksConstellation)constellation
{
  void *v2;
  VNRequestFaceLandmarksConstellation v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "constellation");

  return v3;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNDetectFaceLandmarksRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v13, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v7 = -[VNDetectFaceLandmarksRequest performBlinkDetection](self, "performBlinkDetection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNFaceLandmarkDetectorProcessOption_BlinkDetection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VNDetectFaceLandmarksRequest constellation](self, "constellation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("VNFaceLandmarkDetectorDNNProcessOption_Constellation"));

  if (a3 != 3 || v7)
    v11 = MEMORY[0x1E0C9AAB0];
  else
    v11 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("VNFaceLandmarkDetectorOption_LoadRefinersModel"));
  return v6;
}

- (BOOL)performBlinkDetection
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "performBlinkDetection");

  return v3;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNFaceLandmarkDetectorType");
  return CFSTR("VNFaceLandmarkDetectorType");
}

- (int64_t)dependencyProcessingOrdinality
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
  -[VNDetectFaceLandmarksRequest cascadeStepCount](self, "cascadeStepCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = v3 - objc_msgSend(v4, "integerValue") + 20;

  return v3;
}

- (NSNumber)cascadeStepCount
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cascadeStepCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (void)setRefineRightEyeRegion:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRefineRightEyeRegion:", v3);

}

- (void)setRefineMouthRegion:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRefineMouthRegion:", v3);

}

- (void)setRefineLeftEyeRegion:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRefineLeftEyeRegion:", v3);

}

- (void)setPerformBlinkDetection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerformBlinkDetection:", v3);

}

- (void)setCascadeStepCount:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCascadeStepCount:", v5);

}

- (VNDetectFaceLandmarksRequest)initWithCompletionHandler:(id)a3
{
  VNDetectFaceLandmarksRequest *v3;
  VNDetectFaceLandmarksRequest *v4;
  uint64_t v5;
  VNDetectFaceLandmarksRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNDetectFaceLandmarksRequest;
  v3 = -[VNRequest initWithCompletionHandler:](&v8, sel_initWithCompletionHandler_, a3);
  v4 = v3;
  if (v3)
  {
    if (-[VNRequest revision](v3, "revision") == 3)
      v5 = 2;
    else
      v5 = 1;
    -[VNDetectFaceLandmarksRequest setConstellation:](v4, "setConstellation:", v5);
    v6 = v4;
  }

  return v4;
}

- (void)setConstellation:(VNRequestFaceLandmarksConstellation)constellation
{
  id v5;

  if (objc_msgSend((id)objc_opt_class(), "revision:supportsConstellation:", -[VNRequest revision](self, "revision"), constellation))
  {
    -[VNRequest configuration](self, "configuration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConstellation:", constellation);

  }
}

+ (BOOL)revision:(NSUInteger)requestRevision supportsConstellation:(VNRequestFaceLandmarksConstellation)constellation
{
  return objc_msgSend((id)objc_msgSend(a1, "configurationClass"), "revision:supportsConstellation:", requestRevision, constellation);
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
    +[VNDetectFaceLandmarksRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE6036D0 = objc_opt_class();
    unk_1EE6036D8 = xmmword_1A15C3FE0;
    qword_1EE6036E8 = objc_opt_class();
    *(_OWORD *)algn_1EE6036F0 = xmmword_1A15C3FE0;
    qword_1EE603700 = objc_opt_class();
    unk_1EE603708 = vdupq_n_s64(2uLL);
    qword_1EE603718 = objc_opt_class();
    unk_1EE603720 = vdupq_n_s64(3uLL);
    qword_1EE603730 = objc_opt_class();
    unk_1EE603738 = xmmword_1A15C5A00;
    qword_1EE603748 = objc_opt_class();
    *(_OWORD *)algn_1EE603750 = xmmword_1A15DD920;
    qword_1EE603760 = objc_opt_class();
    unk_1EE603768 = xmmword_1A15FB530;
    qword_1EE603778 = objc_opt_class();
    unk_1EE603780 = xmmword_1A15FB540;
    qword_1EE603790 = objc_opt_class();
    unk_1EE603798 = xmmword_1A15C3FE0;
    qword_1EE6037A8 = objc_opt_class();
    *(_OWORD *)algn_1EE6037B0 = xmmword_1A15C5A00;
    qword_1EE6037C0 = objc_opt_class();
    *(_QWORD *)algn_1EE6037C8 = 1;
    qword_1EE6037D8 = 0;
    unk_1EE6037E0 = 0;
    qword_1EE6037D0 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceLandmarksRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

+ (const)dependentRequestMappingTable
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNDetectFaceLandmarksRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 2;
    qword_1EE63FE50 = objc_opt_class();
    unk_1EE63FE58 = xmmword_1A15DD920;
    qword_1EE63FE68 = objc_opt_class();
    *(_OWORD *)algn_1EE63FE70 = xmmword_1A15FB550;
    qword_1EE63FE80 = objc_opt_class();
    *(_QWORD *)algn_1EE63FE88 = 3737841667;
    qword_1EE63FE98 = 0;
    unk_1EE63FEA0 = 0;
    qword_1EE63FE90 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceLandmarksRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
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
    v5 = CFSTR("VNDetectFaceLandmarksRequestPrivateRevisionANSTModel");
  }
  else
  {
    v8 = v3;
    v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VNDetectFaceLandmarksRequest;
    objc_msgSendSuper2(&v7, sel_descriptionForPrivateRevision_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)refineMouthRegion
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "refineMouthRegion");

  return v3;
}

- (BOOL)refineLeftEyeRegion
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "refineLeftEyeRegion");

  return v3;
}

- (BOOL)refineRightEyeRegion
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "refineRightEyeRegion");

  return v3;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  VNRequestFaceLandmarksConstellation v11;
  BOOL v12;
  objc_super v14;

  v4 = a3;
  -[VNDetectFaceLandmarksRequest cascadeStepCount](self, "cascadeStepCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cascadeStepCount");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((!v5 || !v6 || objc_msgSend(v5, "compare:", v6) != 1)
    && (v8 = -[VNDetectFaceLandmarksRequest refineMouthRegion](self, "refineMouthRegion"),
        v8 == objc_msgSend(v4, "refineMouthRegion"))
    && (v9 = -[VNDetectFaceLandmarksRequest refineLeftEyeRegion](self, "refineLeftEyeRegion"),
        v9 == objc_msgSend(v4, "refineLeftEyeRegion"))
    && (v10 = -[VNDetectFaceLandmarksRequest refineRightEyeRegion](self, "refineRightEyeRegion"),
        v10 == objc_msgSend(v4, "refineRightEyeRegion"))
    && (v11 = -[VNDetectFaceLandmarksRequest constellation](self, "constellation"),
        v11 == objc_msgSend(v4, "constellation"))
    && (!-[VNDetectFaceLandmarksRequest performBlinkDetection](self, "performBlinkDetection")
     || objc_msgSend(v4, "performBlinkDetection")))
  {
    v14.receiver = self;
    v14.super_class = (Class)VNDetectFaceLandmarksRequest;
    v12 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v14, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setProcessedResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (-[VNRequest resolvedRevision](self, "resolvedRevision") == 1)
  {
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", &__block_literal_global_87);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v6, "removeObjectsAtIndexes:", v5);

      v4 = v6;
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)VNDetectFaceLandmarksRequest;
  -[VNRequest setProcessedResults:](&v7, sel_setProcessedResults_, v4);

}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectFaceLandmarksRequest *v4;
  void *v5;
  objc_super v6;

  v4 = (VNDetectFaceLandmarksRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectFaceLandmarksRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNDetectFaceLandmarksRequest cascadeStepCount](v4, "cascadeStepCount");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectFaceLandmarksRequest setCascadeStepCount:](self, "setCascadeStepCount:", v5);

      -[VNDetectFaceLandmarksRequest setRefineMouthRegion:](self, "setRefineMouthRegion:", -[VNDetectFaceLandmarksRequest refineMouthRegion](v4, "refineMouthRegion"));
      -[VNDetectFaceLandmarksRequest setRefineLeftEyeRegion:](self, "setRefineLeftEyeRegion:", -[VNDetectFaceLandmarksRequest refineLeftEyeRegion](v4, "refineLeftEyeRegion"));
      -[VNDetectFaceLandmarksRequest setRefineRightEyeRegion:](self, "setRefineRightEyeRegion:", -[VNDetectFaceLandmarksRequest refineRightEyeRegion](v4, "refineRightEyeRegion"));
      -[VNDetectFaceLandmarksRequest setPerformBlinkDetection:](self, "setPerformBlinkDetection:", -[VNDetectFaceLandmarksRequest performBlinkDetection](v4, "performBlinkDetection"));
      -[VNDetectFaceLandmarksRequest setConstellation:](self, "setConstellation:", -[VNDetectFaceLandmarksRequest constellation](v4, "constellation"));
    }
  }

}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  VNRequestFaceLandmarksConstellation v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  id v24;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing DetectFaceLandmarks request\n"), v9, v10, v11, v12, v13, v14, v23);
  -[VNDetectFaceLandmarksRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_11;
  v16 = -[VNDetectFaceLandmarksRequest constellation](self, "constellation");
  if ((objc_msgSend((id)objc_opt_class(), "revision:supportsConstellation:", a3, v16) & 1) == 0)
  {
    if (!a5)
      goto LABEL_14;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("VNDetectFaceLandmarksRequest revision %lu doesn't support constellation %lu"), a3, v16);
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    LOBYTE(a5) = 0;
    goto LABEL_14;
  }
  v24 = 0;
  v17 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v24, 1, a5);
  v18 = v24;
  v19 = v18;
  if (v17
    && (v18
     || (-[VNRequest detectFacesInContext:error:](self, "detectFacesInContext:error:", v8, a5),
         (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v19, a3, v15, 0, &__block_literal_global_103, &__block_literal_global_105_12545, v8, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a5) = v20 != 0;
    if (v20)
      -[VNRequest setResults:](self, "setResults:", v20);

  }
  else
  {
    LOBYTE(a5) = 0;
  }

LABEL_14:
  return (char)a5;
}

BOOL __72__VNDetectFaceLandmarksRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "landmarkPoints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __72__VNDetectFaceLandmarksRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBoundingBoxAligned") ^ 1;
}

uint64_t __52__VNDetectFaceLandmarksRequest_setProcessedResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRevision1DetectedRectanglesCompatible") ^ 1;
}

- (NSString)description
{
  id v3;
  void *v4;
  VNRequestFaceLandmarksConstellation v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9.receiver = self;
  v9.super_class = (Class)VNDetectFaceLandmarksRequest;
  -[VNImageBasedRequest description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VNDetectFaceLandmarksRequest constellation](self, "constellation");
  v6 = CFSTR("VNRequestFaceLandmarksConstellationNotDefined");
  if (v5 == VNRequestFaceLandmarksConstellation65Points)
    v6 = CFSTR("VNRequestFaceLandmarksConstellation65Points");
  if (v5 == VNRequestFaceLandmarksConstellation76Points)
    v6 = CFSTR("VNRequestFaceLandmarksConstellation76Points");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v6);

  return (NSString *)v7;
}

@end
