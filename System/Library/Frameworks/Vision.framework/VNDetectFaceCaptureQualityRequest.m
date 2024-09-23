@implementation VNDetectFaceCaptureQualityRequest

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;

  if (a3 != a4)
    return 0;
  v8 = v4;
  v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNDetectFaceCaptureQualityRequest;
  return objc_msgSendSuper2(&v7, sel_revision_mayAcceptResultsProducedByRevision_, a3, a3);
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
    +[VNDetectFaceCaptureQualityRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE603860 = objc_opt_class();
    unk_1EE603868 = vdupq_n_s64(1uLL);
    qword_1EE603878 = objc_opt_class();
    unk_1EE603880 = xmmword_1A15FB410;
    qword_1EE603890 = objc_opt_class();
    unk_1EE603898 = xmmword_1A15FB6E0;
    qword_1EE6038A8 = objc_opt_class();
    *(_OWORD *)algn_1EE6038B0 = xmmword_1A15C3FE0;
    qword_1EE6038C0 = objc_opt_class();
    unk_1EE6038C8 = vdupq_n_s64(2uLL);
    qword_1EE6038D8 = objc_opt_class();
    unk_1EE6038E0 = vdupq_n_s64(3uLL);
    qword_1EE6038F0 = objc_opt_class();
    unk_1EE6038F8 = xmmword_1A15C5A00;
    qword_1EE603908 = objc_opt_class();
    *(_OWORD *)algn_1EE603910 = xmmword_1A15DD920;
    qword_1EE603920 = objc_opt_class();
    *(_QWORD *)algn_1EE603928 = 3;
    qword_1EE603938 = 0;
    unk_1EE603940 = 0;
    qword_1EE603930 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceCaptureQualityRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 - 1 > 2)
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
    v4 = CFSTR("VNFaceQualityGeneratorType");
    v5 = CFSTR("VNFaceQualityGeneratorType");
  }
  return v4;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v16;

  v8 = a4;
  -[VNDetectFaceCaptureQualityRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v16 = 0;
    v10 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v16, 1, a5);
    v11 = v16;
    v12 = v11;
    if (v10
      && (v11
       || (-[VNRequest detectFacesInContext:error:](self, "detectFacesInContext:error:", v8, a5),
           (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v12, a3, v9, 0, &__block_literal_global_22969, &__block_literal_global_21_22970, v8, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 != 0;
      if (v13)
        -[VNRequest setResults:](self, "setResults:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

BOOL __77__VNDetectFaceCaptureQualityRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "faceCaptureQuality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __77__VNDetectFaceCaptureQualityRequest_internalPerformRevision_inContext_error___block_invoke()
{
  return 0;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectFaceCaptureQualityRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
