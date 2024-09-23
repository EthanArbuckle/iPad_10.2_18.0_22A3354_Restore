@implementation VNDetectFace3DLandmarksRequest

+ (const)dependentRequestCompatibility
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNDetectFace3DLandmarksRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable = 1;
    qword_1EE6404D0 = objc_opt_class();
    unk_1EE6404D8 = vdupq_n_s64(1uLL);
    qword_1EE6404E8 = objc_opt_class();
    *(_OWORD *)algn_1EE6404F0 = xmmword_1A15FB410;
    qword_1EE640500 = objc_opt_class();
    *(_QWORD *)algn_1EE640508 = 3;
    qword_1EE640518 = 0;
    unk_1EE640520 = 0;
    qword_1EE640510 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFace3DLandmarksRequest dependentRequestCompatibility]::ourDependentRequestCompatibilityTable;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(5000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNFaceGeometryEstimatorType");
    v5 = CFSTR("VNFaceGeometryEstimatorType");
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
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  double v26;
  void *v27;
  CFDictionaryRef DictionaryRepresentation;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  int v38;
  id v39;
  CGSize v40;

  v8 = a4;
  VNValidatedLog(1, (uint64_t)CFSTR("Processing DetectFace3DLandmarks request\n"), v9, v10, v11, v12, v13, v14, v34);
  v39 = 0;
  v15 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v39, 1, a5);
  v16 = v39;
  if (v15)
  {
    v35 = a3;
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = v17;
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v16
      || (-[VNRequest categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:](self, "categorizeFaceObservations:shouldRunDetectorBlock:facesThatNeedNoProcessing:facesThatNeedProcessing:facesThatNeed2DLandmarks:", v16, &__block_literal_global_17940, v17, v37, v18), objc_msgSend(v18, "count")))
    {
      if (objc_msgSend(v18, "count"))
        v19 = v18;
      else
        v19 = 0;
      -[VNRequest detectFaceLandmarksInContext:faces:error:](self, "detectFaceLandmarksInContext:faces:error:", v8, v19, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v32 = 0;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v37, "addObjectsFromArray:", v20);

    }
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "width");
      v24 = objc_msgSend(v22, "height");
      v38 = 0;
      if ((objc_msgSend(v22, "getPixelFocalLengthIfAvailable:", &v38) & 1) == 0)
        v38 = 1161527296;
      v25 = objc_alloc(MEMORY[0x1E0C99E08]);
      LODWORD(v26) = v38;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40.width = (double)v23;
      v40.height = (double)v24;
      DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v40);
      v29 = (void *)objc_msgSend(v25, "initWithObjectsAndKeys:", v27, CFSTR("VNFaceGeometryEstimatorInitOption_CameraFocalLength"), DictionaryRepresentation, CFSTR("VNFaceGeometryEstimatorInitOption_ImageSize"), 0);

      -[VNDetectFace3DLandmarksRequest applicableDetectorTypeForRevision:error:](self, "applicableDetectorTypeForRevision:error:", v35, a5);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        -[VNRequest processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:](self, "processFaceObservations:revision:regionOfInterest:detectorType:detectorOptions:shouldAlignFaceBBox:shouldRunDetectorBlock:context:error:", v37, v35, v30, v29, &__block_literal_global_25_17943, &__block_literal_global_17940, v8, a5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 != 0;
        if (v31)
        {
          objc_msgSend(v36, "addObjectsFromArray:", v31);
          -[VNRequest setResults:](self, "setResults:", v36);
        }

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

    goto LABEL_22;
  }
  v32 = 0;
LABEL_23:

  return v32;
}

uint64_t __74__VNDetectFace3DLandmarksRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isBoundingBoxAligned") ^ 1;
}

BOOL __74__VNDetectFace3DLandmarksRequest_internalPerformRevision_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "landmarks3d");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

@end
