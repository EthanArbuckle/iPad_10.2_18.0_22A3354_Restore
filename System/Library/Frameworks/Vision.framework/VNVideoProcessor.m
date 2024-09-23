@implementation VNVideoProcessor

- (VNVideoProcessor)initWithURL:(NSURL *)videoURL
{
  NSURL *v4;
  VNVideoProcessor *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  VCPVideoProcessor *videoProcessor;
  VNVideoProcessor *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = videoURL;
  v12.receiver = self;
  v12.super_class = (Class)VNVideoProcessor;
  v5 = -[VNVideoProcessor init](&v12, sel_init);
  if (!v5)
    goto LABEL_6;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v6 = (void *)getVCPVideoProcessorClass_softClass;
  v17 = getVCPVideoProcessorClass_softClass;
  if (!getVCPVideoProcessorClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getVCPVideoProcessorClass_block_invoke;
    v13[3] = &unk_1E4548FA8;
    v13[4] = &v14;
    __getVCPVideoProcessorClass_block_invoke((uint64_t)v13);
    v6 = (void *)v15[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v14, 8);
  v8 = objc_msgSend([v7 alloc], "initWithURL:", v4);
  videoProcessor = v5->_videoProcessor;
  v5->_videoProcessor = (VCPVideoProcessor *)v8;

  if (v5->_videoProcessor)
    v10 = v5;
  else
LABEL_6:
    v10 = 0;

  return v10;
}

- (BOOL)addRequest:(VNRequest *)request processingOptions:(VNVideoProcessorRequestProcessingOptions *)processingOptions error:(NSError *)error
{
  VNRequest *v8;
  void *v9;

  v8 = request;
  -[VNVideoProcessorRequestProcessingOptions _createVCPVideoProcessorRequestConfiguration](processingOptions, "_createVCPVideoProcessorRequestConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = -[VCPVideoProcessor addRequest:withConfiguration:error:](self->_videoProcessor, "addRequest:withConfiguration:error:", v8, v9, error);

  return (char)error;
}

- (BOOL)addRequest:(VNRequest *)request withProcessingOptions:(NSDictionary *)processingOptions error:(NSError *)error
{
  return -[VCPVideoProcessor addRequest:withConfiguration:error:](self->_videoProcessor, "addRequest:withConfiguration:error:", request, processingOptions, error);
}

- (BOOL)removeRequest:(VNRequest *)request error:(NSError *)error
{
  return -[VCPVideoProcessor removeRequest:error:](self->_videoProcessor, "removeRequest:error:", request, error);
}

- (BOOL)analyzeWithTimeRange:(CMTimeRange *)timeRange error:(NSError *)error
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  return -[VNVideoProcessor analyzeTimeRange:error:](self, "analyzeTimeRange:error:", v6, error);
}

- (BOOL)analyzeTimeRange:(CMTimeRange *)timeRange error:(NSError *)error
{
  VCPVideoProcessor *videoProcessor;
  CMTime duration;
  __int128 v7;
  CMTimeEpoch epoch;

  videoProcessor = self->_videoProcessor;
  v7 = *(_OWORD *)&timeRange->start.value;
  epoch = timeRange->start.epoch;
  duration = timeRange->duration;
  return -[VCPVideoProcessor analyzeWithStart:andDuration:error:](videoProcessor, "analyzeWithStart:andDuration:error:", &v7, &duration, error);
}

- (void)cancel
{
  -[VCPVideoProcessor cancel](self->_videoProcessor, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoProcessor, 0);
}

@end
