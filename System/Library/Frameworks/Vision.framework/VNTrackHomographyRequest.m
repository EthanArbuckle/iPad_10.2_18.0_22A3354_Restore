@implementation VNTrackHomographyRequest

- (VNTrackHomographyRequest)initWithFrameAnalysisSpacing:(id *)a3 completionHandler:(id)a4
{
  id v6;
  VNTrackHomographyRequest *v7;
  VNHomographyTrackerState *v8;
  VNHomographyTrackerState *state;
  objc_super v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v6 = a4;
  v12 = *a3;
  v11.receiver = self;
  v11.super_class = (Class)VNTrackHomographyRequest;
  v7 = -[VNStatefulRequest initWithFrameAnalysisSpacing:completionHandler:](&v11, sel_initWithFrameAnalysisSpacing_completionHandler_, &v12, v6);
  if (v7)
  {
    v8 = objc_alloc_init(VNHomographyTrackerState);
    state = v7->_state;
    v7->_state = v8;

  }
  return v7;
}

- (BOOL)allowsCachingOfResults
{
  return 0;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;

  v4 = CFSTR("VNHomographyTrackerType");
  return CFSTR("VNHomographyTrackerType");
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
  void *v15;
  BOOL v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "imageBufferAndReturnError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v18, a3, v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      v19[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("VNDetectorProcessOption_InputImageBuffers"));

      objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_state, CFSTR("VNHomographyTrackerProcessOption_State"));
      v14 = objc_msgSend(v8, "qosClass");
      -[VNImageBasedRequest regionOfInterest](self, "regionOfInterest");
      objc_msgSend(v11, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v14, v12, self, a5, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 != 0;
      if (v15)
        -[VNRequest setResults:](self, "setResults:", v15);

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
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNTrackHomographyRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end
