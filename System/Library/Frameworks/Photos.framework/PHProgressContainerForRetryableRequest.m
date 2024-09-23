@implementation PHProgressContainerForRetryableRequest

- (PHProgressContainerForRetryableRequest)init
{
  PHProgressContainerForRetryableRequest *v2;
  uint64_t v3;
  NSProgress *totalProgress;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHProgressContainerForRetryableRequest;
  v2 = -[PHProgressContainerForRetryableRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1000);
    v3 = objc_claimAutoreleasedReturnValue();
    totalProgress = v2->_totalProgress;
    v2->_totalProgress = (NSProgress *)v3;

  }
  return v2;
}

- (void)setRequestProgress:(id)a3
{
  NSProgress *v4;
  int64_t v5;
  NSProgress *currentRequestProgress;
  NSProgress *v7;
  NSProgress *v8;

  v4 = (NSProgress *)a3;
  v5 = -[NSProgress totalUnitCount](self->_totalProgress, "totalUnitCount");
  currentRequestProgress = self->_currentRequestProgress;
  if (currentRequestProgress)
  {
    -[NSProgress setCompletedUnitCount:](currentRequestProgress, "setCompletedUnitCount:", 0);
    v7 = self->_currentRequestProgress;
  }
  else
  {
    v7 = 0;
  }
  self->_currentRequestProgress = v4;
  v8 = v4;

  -[NSProgress addChild:withPendingUnitCount:](self->_totalProgress, "addChild:withPendingUnitCount:", self->_currentRequestProgress, v5);
}

- (NSProgress)totalProgress
{
  return self->_totalProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalProgress, 0);
  objc_storeStrong((id *)&self->_currentRequestProgress, 0);
}

@end
