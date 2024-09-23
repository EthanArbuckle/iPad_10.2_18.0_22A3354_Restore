@implementation VNDetectFaceGazeRequest

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNFaceGazeDetectorType");
    v5 = CFSTR("VNFaceGazeDetectorType");
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
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(4000, self);
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VNDetectFaceGazeRequest;
  v6 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v15, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  if (a3 == 1)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[VNDetectFaceGazeRequest gazeHeatMapThreshold](self, "gazeHeatMapThreshold");
    objc_msgSend(v7, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("VNFaceGazeDetectorProcessOption_GazeHeatMapThreshold"));

    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[VNDetectFaceGazeRequest minimumFaceDimension](self, "minimumFaceDimension");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("VNFaceGazeDetectorProcessOption_MinimumFaceDimension"));

    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[VNDetectFaceGazeRequest commonGazeLocationRadius](self, "commonGazeLocationRadius");
    objc_msgSend(v11, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("VNFaceGazeDetectorProcessOption_CommonGazeLocationRadius"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNDetectFaceGazeRequest resolveSomewhereElseDirection](self, "resolveSomewhereElseDirection") ^ 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("VNFaceGazeDetectorProcessOption_DontFollowGaze"));

  }
  return v6;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  int v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  -[VNDetectFaceGazeRequest gazeHeatMapThreshold](self, "gazeHeatMapThreshold");
  v6 = v5;
  objc_msgSend(v4, "gazeHeatMapThreshold");
  if (v6 == v7
    && (-[VNDetectFaceGazeRequest minimumFaceDimension](self, "minimumFaceDimension"),
        v9 = v8,
        objc_msgSend(v4, "minimumFaceDimension"),
        v9 == v10)
    && (-[VNDetectFaceGazeRequest commonGazeLocationRadius](self, "commonGazeLocationRadius"),
        v12 = v11,
        objc_msgSend(v4, "commonGazeLocationRadius"),
        v12 == v13)
    && (v14 = -[VNDetectFaceGazeRequest resolveSomewhereElseDirection](self, "resolveSomewhereElseDirection"),
        v14 == objc_msgSend(v4, "resolveSomewhereElseDirection")))
  {
    v17.receiver = self;
    v17.super_class = (Class)VNDetectFaceGazeRequest;
    v15 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v17, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectFaceGazeRequest *v4;
  VNDetectFaceGazeRequest *v5;
  objc_super v6;

  v4 = (VNDetectFaceGazeRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectFaceGazeRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v6, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNDetectFaceGazeRequest gazeHeatMapThreshold](v5, "gazeHeatMapThreshold");
      -[VNDetectFaceGazeRequest setGazeHeatMapThreshold:](self, "setGazeHeatMapThreshold:");
      -[VNDetectFaceGazeRequest minimumFaceDimension](v5, "minimumFaceDimension");
      -[VNDetectFaceGazeRequest setMinimumFaceDimension:](self, "setMinimumFaceDimension:");
      -[VNDetectFaceGazeRequest commonGazeLocationRadius](v5, "commonGazeLocationRadius");
      -[VNDetectFaceGazeRequest setCommonGazeLocationRadius:](self, "setCommonGazeLocationRadius:");
      -[VNDetectFaceGazeRequest setResolveSomewhereElseDirection:](self, "setResolveSomewhereElseDirection:", -[VNDetectFaceGazeRequest resolveSomewhereElseDirection](v5, "resolveSomewhereElseDirection"));

    }
  }

}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  VNDetectFaceRectanglesRequest *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v26;
  VNDetectFaceRectanglesRequest *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v29, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v29;
    if (!v11)
    {
      v19 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v13 = v8;
    v14 = v13;
    if (self)
    {
      v30 = 0;
      v15 = -[VNImageBasedRequest getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:](self, "getOptionalValidatedInputFaceObservations:clippedToRegionOfInterest:error:", &v30, 1, a5);
      v16 = v30;
      v17 = v16;
      if (v15)
      {
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          v20 = objc_alloc_init(VNDetectFaceRectanglesRequest);
          v27 = v20;
          -[VNDetectFaceRectanglesRequest applyConfigurationOfRequest:](v20, "applyConfigurationOfRequest:", self);
          objc_msgSend(v14, "requestPerformerAndReturnError:", a5);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28
            && (v32[0] = v20,
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v26 = objc_msgSend(v28, "performDependentRequests:onBehalfOfRequest:inContext:error:", v21, self, v14, a5), v21, (v26 & 1) != 0))
          {
            -[VNRequest results](v27, "results");
            v18 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = 0;
          }

        }
      }
      else
      {
        v18 = 0;
      }

      if (v18)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("VNDetectorProcessOption_InputFaceObservations"));
        v31 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

        v23 = objc_msgSend(v14, "qosClass");
        -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
        objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v23, v12, self, a5, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v24 != 0;
        if (v24)
          -[VNRequest setResults:](self, "setResults:", v24);

        goto LABEL_21;
      }
    }
    else
    {

      v18 = 0;
    }
    v19 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (float)gazeHeatMapThreshold
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gazeHeatMapThreshold");
  v4 = v3;

  return v4;
}

- (void)setGazeHeatMapThreshold:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setGazeHeatMapThreshold:", v4);

}

- (float)minimumFaceDimension
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumFaceDimension");
  v4 = v3;

  return v4;
}

- (void)setMinimumFaceDimension:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setMinimumFaceDimension:", v4);

}

- (float)commonGazeLocationRadius
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonGazeLocationRadius");
  v4 = v3;

  return v4;
}

- (void)setCommonGazeLocationRadius:(float)a3
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setCommonGazeLocationRadius:", v4);

}

- (BOOL)resolveSomewhereElseDirection
{
  void *v2;
  char v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resolveSomewhereElseDirection");

  return v3;
}

- (void)setResolveSomewhereElseDirection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VNRequest configuration](self, "configuration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResolveSomewhereElseDirection:", v3);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)dependentRequestMappingTable
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    +[VNDetectFaceGazeRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 1;
    qword_1EE63FBF0 = objc_opt_class();
    *(_QWORD *)algn_1EE63FBF8 = 3737841666;
    qword_1EE63FC08 = 0;
    unk_1EE63FC10 = 0;
    qword_1EE63FC00 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNDetectFaceGazeRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNDetectFaceGazeRequest revisionAvailability]::ourRevisionAvailability;
}

@end
