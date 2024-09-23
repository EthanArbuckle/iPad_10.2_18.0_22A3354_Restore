@implementation VNTrackMaskRequest

- (VNTrackMaskRequest)initWithFrameUpdateSpacing:(id *)a3 mask:(__CVBuffer *)a4 completionHandler:(id)a5
{
  VNTrackMaskRequest *v7;
  VNTrackMaskDetectorState *v8;
  uint64_t v9;
  VNTrackMaskDetectorState *state;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VNTrackMaskRequest;
  v12 = *a3;
  v7 = -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](&v13, sel_initWithFrameAnalysisSpacing_completionHandler_, &v12, a5);
  if (v7)
  {
    v8 = [VNTrackMaskDetectorState alloc];
    v12 = *a3;
    v9 = -[VNTrackMaskDetectorState initWithFrameUpdateSpacing:mask:](v8, "initWithFrameUpdateSpacing:mask:", &v12, a4);
    state = v7->_state;
    v7->_state = (VNTrackMaskDetectorState *)v9;

  }
  return v7;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  VNTrackMaskRequest *v4;
  objc_super v5;

  v4 = (VNTrackMaskRequest *)a3;
  if (self != v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackMaskRequest;
    -[VNImageBasedRequest applyConfigurationOfRequest:](&v5, sel_applyConfigurationOfRequest_, v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VNTrackMaskRequest setGenerateCropRect:](self, "setGenerateCropRect:", -[VNTrackMaskRequest generateCropRect](v4, "generateCropRect"));
  }

}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNTrackMaskRequest generateCropRect](self, "generateCropRect");
  if (v5 == objc_msgSend(v4, "generateCropRect"))
  {
    v8.receiver = self;
    v8.super_class = (Class)VNTrackMaskRequest;
    v6 = -[VNImageBasedRequest willAcceptCachedResultsFromRequestWithConfiguration:](&v8, sel_willAcceptCachedResultsFromRequestWithConfiguration_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNTrackMaskRequest;
  v5 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](&v8, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VNTrackMaskRequest generateCropRect](self, "generateCropRect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("VNTrackMaskDetectorProcessorOption_GenerateCropRect"));

  return v5;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNTrackMaskDetectorType");
    v5 = CFSTR("VNTrackMaskDetectorType");
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

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v19, a3, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(v8, "imageBufferAndReturnError:", a5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v20[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_state, CFSTR("VNTrackMaskDetectorProcessOption_State"));
      v15 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v10, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v15, v11, self, a5, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 != 0;
      if (v16)
        -[VNRequest setResults:](self, "setResults:", v16);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)generateCropRect
{
  return self->_generateCropRect;
}

- (void)setGenerateCropRect:(BOOL)a3
{
  self->_generateCropRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&revisionAvailability_ourRevisionAvailability;
}

@end
