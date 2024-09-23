@implementation HDCloudSyncPipelineStage

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncPipelineStage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncPipelineStage;
  result = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v5, sel_initWithConfiguration_cloudState_, a3, a4);
  if (result)
  {
    result->_criticalFailureOnError = 1;
    result->_expectedSendSize = 1;
    result->_expectedReceiveSize = 1;
  }
  return result;
}

- (BOOL)criticalFailureOnError
{
  return self->_criticalFailureOnError;
}

- (void)setCriticalFailureOnError:(BOOL)a3
{
  self->_criticalFailureOnError = a3;
}

- (int64_t)expectedSendSize
{
  return self->_expectedSendSize;
}

- (void)setExpectedSendSize:(int64_t)a3
{
  self->_expectedSendSize = a3;
}

- (int64_t)expectedReceiveSize
{
  return self->_expectedReceiveSize;
}

- (void)setExpectedReceiveSize:(int64_t)a3
{
  self->_expectedReceiveSize = a3;
}

- (id)pipelineStageIgnoringErrors
{
  HDCloudSyncIgnoredErrorsPipelineStage *v3;
  void *v4;
  void *v5;
  HDCloudSyncIgnoredErrorsPipelineStage *v6;

  v3 = [HDCloudSyncIgnoredErrorsPipelineStage alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncIgnoredErrorsPipelineStage initWithConfiguration:cloudState:stage:](v3, "initWithConfiguration:cloudState:stage:", v4, v5, self);

  return v6;
}

@end
