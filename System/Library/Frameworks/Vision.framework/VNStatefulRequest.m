@implementation VNStatefulRequest

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

- (id)newDuplicateInstance
{
  id v3;
  void *v4;
  void *v5;
  _BYTE v7[24];

  v3 = objc_alloc((Class)objc_opt_class());
  -[VNStatefulRequest frameAnalysisSpacing](self, "frameAnalysisSpacing");
  -[VNRequest completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrameAnalysisSpacing:completionHandler:", v7, v4);

  return v5;
}

- (id)description
{
  const __CFAllocator *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;
  CMTime time;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[VNStatefulRequest frameAnalysisSpacing](self, "frameAnalysisSpacing");
  v4 = (__CFString *)CMTimeCopyDescription(v3, &time);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9.receiver = self;
  v9.super_class = (Class)VNStatefulRequest;
  -[VNImageBasedRequest description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@ FAS=%@"), v6, v4);

  return v7;
}

- (VNStatefulRequest)initWithFrameAnalysisSpacing:(CMTime *)frameAnalysisSpacing completionHandler:(VNRequestCompletionHandler)completionHandler
{
  VNStatefulRequest *v5;
  VNStatefulRequest *v6;
  void *v7;
  __int128 v9;
  CMTimeEpoch epoch;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNStatefulRequest;
  v5 = -[VNRequest initWithCompletionHandler:](&v11, sel_initWithCompletionHandler_, completionHandler);
  v6 = v5;
  if (v5)
  {
    -[VNRequest configuration](v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)&frameAnalysisSpacing->value;
    epoch = frameAnalysisSpacing->epoch;
    objc_msgSend(v7, "setFrameAnalysisSpacing:", &v9);

  }
  return v6;
}

- (CMTime)frameAnalysisSpacing
{
  void *v4;
  CMTime *result;
  void *v6;

  -[VNRequest configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "frameAnalysisSpacing");
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

- (NSInteger)minimumLatencyFrameCount
{
  return 1;
}

- (NSUUID)requestUUID
{
  void *v2;
  void *v3;

  -[VNRequest configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end
