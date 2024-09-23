@implementation VNDetectFaceExpressionsRequest

+ (const)dependentRequestCompatibility
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNDetectFaceExpressionsRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE6037F0 = objc_opt_class();
    unk_1EE6037F8 = vdupq_n_s64(1uLL);
    qword_1EE603808 = objc_opt_class();
    *(_OWORD *)algn_1EE603810 = xmmword_1A15FB410;
    qword_1EE603820 = objc_opt_class();
    *(_QWORD *)algn_1EE603828 = 3;
    qword_1EE603838 = 0;
    unk_1EE603840 = 0;
    qword_1EE603830 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceExpressionsRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNFaceExpressionDetectorType");
    v5 = CFSTR("VNFaceExpressionDetectorType");
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

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
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
  BOOL v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v25;
  id v26;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing DetectFaceExpressions request\n"), v9, v10, v11, v12, v13, v14, v25);
  v26 = 0;
  v15 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v26, 1, a5);
  v16 = v26;
  if (v15)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v16
      || (-[VNRequest categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:](self, "categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:", v16, &__block_literal_global_23_30021, v17, v19, v18), objc_msgSend(v18, "count")))
    {
      if (objc_msgSend(v18, "count"))
        v20 = v18;
      else
        v20 = 0;
      -[VNRequest detectFaceLandmarksInContext:faces:error:](self, "detectFaceLandmarksInContext:faces:error:", v8, v20, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v23 = 0;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v19, "addObjectsFromArray:", v21);

    }
    -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
    -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v19, a3, CFSTR("VNFaceExpressionDetectorType"), 0, &__block_literal_global_30020, &__block_literal_global_23_30021, v8, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 != 0;
    if (v22)
    {
      objc_msgSend(v17, "addObjectsFromArray:", v22);
      -[VNRequest setResults:](self, "setResults:", v17);
    }

    goto LABEL_14;
  }
  v23 = 0;
LABEL_15:

  return v23;
}

BOOL __74__VNDetectFaceExpressionsRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "landmarks3d");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __74__VNDetectFaceExpressionsRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBoundingBoxAligned") ^ 1;
}

@end
