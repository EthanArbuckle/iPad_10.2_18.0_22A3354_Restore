@implementation VNGenerateFaceSegmentsRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNFaceSegmentGeneratorType");
  return CFSTR("VNFaceSegmentGeneratorType");
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNGenerateFaceSegmentsRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v9, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[VNGenerateFaceSegmentsRequest faceBoundingBoxExpansionRatio](self, "faceBoundingBoxExpansionRatio");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("VNFaceSegmentGeneratorProcessOption_FaceBoundingBoxExpansionRatio"));

  return v5;
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
  BOOL v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v22;
  id v23;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing Segment Face Segments Request"), v9, v10, v11, v12, v13, v14, v22);
  -[VNGenerateFaceSegmentsRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v23 = 0;
    v16 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v23, 1, a5);
    v17 = v23;
    v18 = v17;
    if (v16
      && (v17
       || (-[VNRequest detectFacesInContext:error:](self, "detectFacesInContext:error:", v8, a5),
           (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v18, a3, v15, 0, &__block_literal_global_22297, &__block_literal_global_44, v8, a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 != 0;
      if (v19)
        -[VNRequest setResults:](self, "setResults:", v19);

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (float)faceBoundingBoxExpansionRatio
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "faceBoundingBoxExpansionRatio");
  v4 = v3;

  return v4;
}

- (void)setFaceBoundingBoxExpansionRatio:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFaceBoundingBoxExpansionRatio:", v4);

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  -[VNGenerateFaceSegmentsRequest faceBoundingBoxExpansionRatio](self, "faceBoundingBoxExpansionRatio");
  v6 = v5;
  objc_msgSend(v4, "faceBoundingBoxExpansionRatio");
  if (v6 == v7)
  {
    v10.receiver = self;
    v10.super_class = (Class)VNGenerateFaceSegmentsRequest;
    v8 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v10, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __73__VNGenerateFaceSegmentsRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "faceSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __73__VNGenerateFaceSegmentsRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBoundingBoxAligned") ^ 1;
}

@end
