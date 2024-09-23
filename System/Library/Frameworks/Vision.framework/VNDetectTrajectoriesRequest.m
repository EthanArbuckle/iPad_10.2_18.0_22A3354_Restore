@implementation VNDetectTrajectoriesRequest

- (VNDetectTrajectoriesRequest)initWithFrameAnalysisSpacing:(CMTime *)frameAnalysisSpacing trajectoryLength:(NSInteger)trajectoryLength completionHandler:(VNRequestCompletionHandler)completionHandler
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VNRequestCompletionHandler v14;
  VNDetectTrajectoriesRequest *v15;
  VNDetectTrajectoriesRequest *v16;
  void *v17;
  VNTrajectoryProcessor *v18;
  uint64_t v19;
  VNTrajectoryProcessor *trajectoryProcessor;
  VNTrajectoryRequestState *v21;
  VNTrajectoryRequestState *state;
  __int128 v24;
  CMTimeEpoch epoch;
  objc_super v26;

  v14 = completionHandler;
  if (trajectoryLength >= 5)
  {
    if (trajectoryLength < 0x80000000)
      goto LABEL_6;
    trajectoryLength = 0x7FFFFFFFLL;
  }
  else
  {
    trajectoryLength = 5;
  }
  VNValidatedLog(4, (uint64_t)CFSTR("trajectory length must be in range [%llu..%llu]"), v8, v9, v10, v11, v12, v13, 5);
LABEL_6:
  v26.receiver = self;
  v26.super_class = (Class)VNDetectTrajectoriesRequest;
  v24 = *(_OWORD *)&frameAnalysisSpacing->value;
  epoch = frameAnalysisSpacing->epoch;
  v15 = -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](&v26, sel_initWithFrameAnalysisSpacing_completionHandler_, &v24, v14);
  v16 = v15;
  if (v15)
  {
    -[VNRequest configuration](v15, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTrajectoryLength:", trajectoryLength);
    v18 = [VNTrajectoryProcessor alloc];
    v24 = *(_OWORD *)&frameAnalysisSpacing->value;
    epoch = frameAnalysisSpacing->epoch;
    v19 = -[VNTrajectoryProcessor initWithFrameAnalysisSpacing:trajectoryLength:](v18, "initWithFrameAnalysisSpacing:trajectoryLength:", &v24, trajectoryLength);
    trajectoryProcessor = v16->_trajectoryProcessor;
    v16->_trajectoryProcessor = (VNTrajectoryProcessor *)v19;

    v21 = objc_alloc_init(VNTrajectoryRequestState);
    state = v16->_state;
    v16->_state = v21;

  }
  return v16;
}

- (NSInteger)trajectoryLength
{
  void *v2;
  NSInteger v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trajectoryLength");

  return v3;
}

- (float)objectMinimumNormalizedRadius
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectMinimumNormalizedRadius");
  v4 = v3;

  return v4;
}

- (void)setObjectMinimumNormalizedRadius:(float)objectMinimumNormalizedRadius
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = objectMinimumNormalizedRadius;
  objc_msgSend(v5, "setObjectMinimumNormalizedRadius:", v4);

}

- (float)objectMaximumNormalizedRadius
{
  void *v2;
  float v3;
  float v4;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectMaximumNormalizedRadius");
  v4 = v3;

  return v4;
}

- (void)setObjectMaximumNormalizedRadius:(float)objectMaximumNormalizedRadius
{
  double v4;
  id v5;

  -[VNRequest configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = objectMaximumNormalizedRadius;
  objc_msgSend(v5, "setObjectMaximumNormalizedRadius:", v4);

}

- (CMTime)targetFrameTime
{
  void *v4;
  CMTime *result;
  void *v6;

  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "targetFrameTime");
    v4 = v6;
  }
  else
  {
    retstr->value = 0;
    *(_QWORD *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }

  return result;
}

- (void)setTargetFrameTime:(CMTime *)targetFrameTime
{
  void *v4;
  CMTime v5;

  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *targetFrameTime;
  objc_msgSend(v4, "setTargetFrameTime:", &v5);

}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("VNComputeStageMain");
  +[VNComputeDeviceUtilities allCPUComputeDevices](VNComputeDeviceUtilities, "allCPUComputeDevices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newDuplicateInstance
{
  id v3;
  NSInteger v4;
  void *v5;
  void *v6;
  _BYTE v8[24];

  v3 = objc_alloc((Class)objc_opt_class());
  -[VNStatefulRequest frameAnalysisSpacing](self, "frameAnalysisSpacing");
  v4 = -[VNDetectTrajectoriesRequest trajectoryLength](self, "trajectoryLength");
  -[VNRequest completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFrameAnalysisSpacing:trajectoryLength:completionHandler:", v8, v4, v5);

  return v6;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNDetectTrajectoriesRequest *v4;
  objc_super v5;

  v4 = (VNDetectTrajectoriesRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNDetectTrajectoriesRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VNDetectTrajectoriesRequest objectMinimumNormalizedRadius](v4, "objectMinimumNormalizedRadius");
      -[VNDetectTrajectoriesRequest setObjectMinimumNormalizedRadius:](self, "setObjectMinimumNormalizedRadius:");
      -[VNDetectTrajectoriesRequest objectMaximumNormalizedRadius](v4, "objectMaximumNormalizedRadius");
      -[VNDetectTrajectoriesRequest setObjectMaximumNormalizedRadius:](self, "setObjectMaximumNormalizedRadius:");
    }
  }

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
  BOOL v11;
  objc_super v13;

  v4 = a3;
  -[VNDetectTrajectoriesRequest objectMinimumNormalizedRadius](self, "objectMinimumNormalizedRadius");
  v6 = v5;
  objc_msgSend(v4, "objectMinimumNormalizedRadius");
  if (v6 >= v7
    && (-[VNDetectTrajectoriesRequest objectMaximumNormalizedRadius](self, "objectMaximumNormalizedRadius"),
        v9 = v8,
        objc_msgSend(v4, "objectMaximumNormalizedRadius"),
        v9 <= v10))
  {
    v13.receiver = self;
    v13.super_class = (Class)VNDetectTrajectoriesRequest;
    v11 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v13, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNDetectTrajectoriesRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v13, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_state, CFSTR("VNTrajectoryProcessorOption_RequestState"));
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[VNDetectTrajectoriesRequest objectMinimumNormalizedRadius](self, "objectMinimumNormalizedRadius");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("VNTrajectoryProcessorOption_ObjectMinimumNormalizedRadius"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VNDetectTrajectoriesRequest objectMaximumNormalizedRadius](self, "objectMaximumNormalizedRadius");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("VNTrajectoryProcessorOption_ObjectMaximumNormalizedRadius"));

  memset(v12, 0, sizeof(v12));
  -[VNDetectTrajectoriesRequest targetFrameTime](self, "targetFrameTime");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", v12, "{?=qiIq}");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("VNTrajectoryProcessorOption_ProcessingTargetFrameTime"));

  return v5;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  VNTrajectoryProcessor *trajectoryProcessor;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  char v28;

  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_5;
  objc_msgSend(v9, "timingInfo");
  if ((v28 & 1) == 0)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 18, CFSTR("No valid presentationTimeStamp was available for this image"));
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_5:
    v11 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v8, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[VNDetectTrajectoriesRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a3, v12);

  trajectoryProcessor = self->_trajectoryProcessor;
  -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[VNStatefulRequest requestUUID](self, "requestUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNTrajectoryProcessor processVNImageBuffer:regionOfInterest:withOptions:warningRecorder:requestUUID:error:](trajectoryProcessor, "processVNImageBuffer:regionOfInterest:withOptions:warningRecorder:requestUUID:error:", v10, v13, self, v23, a5, v16, v18, v20, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v24 != 0;
  if (v24)
  {
    if (a3 == 1
      && +[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:](VNRuntimeUtilities, "linkTimeOrRunTimeBeforeVersion:", 393216))
    {
      v25 = &__block_literal_global_86_33184;
      objc_msgSend(v24, "sortedArrayWithOptions:usingComparator:", 16, &__block_literal_global_86_33184);
      v26 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v26;
    }
    -[VNRequest setResults:](self, "setResults:", v24);

  }
LABEL_12:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_trajectoryProcessor, 0);
}

+ (BOOL)setsTimeRangeOnResults
{
  return 1;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
