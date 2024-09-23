@implementation AWAttentionSampler

- (int)currentState
{
  return self->_currentState;
}

- (void)startDeadlineComputation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_nextDeadline = -1;
  -[AWSampleLogger startUpdate](self->_sampleLogger, "startUpdate");
}

- (void)finishDeadlineComputationWithOptions:(id)a3
{
  _BOOL8 v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = self->_nextDeadline != -1;
  -[AWAttentionSampler shouldSample:withDeadline:withOptions:](self, "shouldSample:withDeadline:withOptions:", v4);
  -[AWSampleLogger shouldSample:](self->_sampleLogger, "shouldSample:", v4);
}

- (AWAttentionSampler)init
{
  AWAttentionSampler *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  id stateChangedCallback;
  uint64_t v6;
  AWSampleLogger *sampleLogger;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AWAttentionSampler;
  v2 = -[AWAttentionSampler init](&v9, sel_init);
  if (v2)
  {
    awQueue(1);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    stateChangedCallback = v2->_stateChangedCallback;
    v2->_stateChangedCallback = &__block_literal_global_1493;

    +[AWSampleLogger sharedLogger](AWSampleLogger, "sharedLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    sampleLogger = v2->_sampleLogger;
    v2->_sampleLogger = (AWSampleLogger *)v6;

    v2->_samplingSuppressedMask = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = "true";
  if (self->_samplingSuppressedMask)
    v8 = "true";
  else
    v8 = "false";
  if (!self->_unitTestSampling)
    v7 = "false";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> (samplingSuppressed: %s unitTestSampling: %s)"), v5, self, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setUnitTestMode
{
  AWSampleLogger *sampleLogger;

  sampleLogger = self->_sampleLogger;
  self->_sampleLogger = 0;

  self->_unitTestSampling = 1;
}

- (void)updateSamplingDeadline:(unint64_t)a3 forClient:(id)a4
{
  NSObject *queue;
  unint64_t nextDeadline;
  id v9;

  queue = self->_queue;
  v9 = a4;
  dispatch_assert_queue_V2(queue);
  nextDeadline = self->_nextDeadline;
  if (nextDeadline == -1 || nextDeadline < a3)
    self->_nextDeadline = a3;
  -[AWSampleLogger updateDataForClient:deadline:](self->_sampleLogger, "updateDataForClient:deadline:", v9, a3);

}

- (unint64_t)nextSampleTimeForSamplingInterval:(unint64_t)a3 ignoreDisplayState:(BOOL)a4
{
  abort();
}

- (unint64_t)minimumAttentionSamplerErrorRetryTime
{
  abort();
}

- (void)shouldSample:(BOOL)a3 withDeadline:(unint64_t)a4 withOptions:(id)a5
{
  abort();
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  abort();
}

- (void)setDisplayState:(BOOL)a3
{
  abort();
}

- (void)setCarPlayConnected:(BOOL)a3
{
  abort();
}

- (AWAttentionSampler)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  AWPearlAttentionSampler *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "valueForKey:", CFSTR("eventMask"));
  v6 = (AWPearlAttentionSampler *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("eventMask"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongValue");

    if (v8 == 128)
    {
      v6 = -[AWPearlAttentionSampler initWithOptions:]([AWPearlAttentionSampler alloc], "initWithOptions:", v5);
      goto LABEL_6;
    }
LABEL_5:
    v6 = 0;
  }
LABEL_6:

  return &v6->super;
}

- (AWSampleLogger)sampleLogger
{
  return self->_sampleLogger;
}

- (void)setSampleLogger:(id)a3
{
  objc_storeStrong((id *)&self->_sampleLogger, a3);
}

- (id)stateChangedCallback
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setStateChangedCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)operationEndableCallback
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setOperationEndableCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (unint64_t)samplingSuppressedMask
{
  return self->_samplingSuppressedMask;
}

- (void)setSamplingSuppressedMask:(unint64_t)a3
{
  self->_samplingSuppressedMask = a3;
}

- (unint64_t)lastTriggerTime
{
  return self->_lastTriggerTime;
}

- (void)setLastTriggerTime:(unint64_t)a3
{
  self->_lastTriggerTime = a3;
}

- (unint64_t)lastPositiveDetectTime
{
  return self->_lastPositiveDetectTime;
}

- (void)setLastPositiveDetectTime:(unint64_t)a3
{
  self->_lastPositiveDetectTime = a3;
}

- (unint64_t)lastPollTimeoutTime
{
  return self->_lastPollTimeoutTime;
}

- (void)setLastPollTimeoutTime:(unint64_t)a3
{
  self->_lastPollTimeoutTime = a3;
}

- (BOOL)lastFaceMetadataValid
{
  return self->_lastFaceMetadataValid;
}

- (void)setLastFaceMetadataValid:(BOOL)a3
{
  self->_lastFaceMetadataValid = a3;
}

- (double)lastPitch
{
  return self->_lastPitch;
}

- (void)setLastPitch:(double)a3
{
  self->_lastPitch = a3;
}

- (double)lastYaw
{
  return self->_lastYaw;
}

- (void)setLastYaw:(double)a3
{
  self->_lastYaw = a3;
}

- (double)lastRoll
{
  return self->_lastRoll;
}

- (void)setLastRoll:(double)a3
{
  self->_lastRoll = a3;
}

- (unint64_t)lastOrientation
{
  return self->_lastOrientation;
}

- (void)setLastOrientation:(unint64_t)a3
{
  self->_lastOrientation = a3;
}

- (double)lastDistance
{
  return self->_lastDistance;
}

- (void)setLastDistance:(double)a3
{
  self->_lastDistance = a3;
}

- (unint64_t)lastFaceState
{
  return self->_lastFaceState;
}

- (void)setLastFaceState:(unint64_t)a3
{
  self->_lastFaceState = a3;
}

- (unint64_t)lastMetadataType
{
  return self->_lastMetadataType;
}

- (void)setLastMetadataType:(unint64_t)a3
{
  self->_lastMetadataType = a3;
}

- (float)lastAttentionScore
{
  return self->_lastAttentionScore;
}

- (void)setLastAttentionScore:(float)a3
{
  self->_lastAttentionScore = a3;
}

- (float)lastFaceDetectionScore
{
  return self->_lastFaceDetectionScore;
}

- (void)setLastFaceDetectionScore:(float)a3
{
  self->_lastFaceDetectionScore = a3;
}

- (CGRect)lastFaceBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastFaceBounds.origin.x;
  y = self->_lastFaceBounds.origin.y;
  width = self->_lastFaceBounds.size.width;
  height = self->_lastFaceBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastFaceBounds:(CGRect)a3
{
  self->_lastFaceBounds = a3;
}

- (unint64_t)lastPersonID
{
  return self->_lastPersonID;
}

- (void)setLastPersonID:(unint64_t)a3
{
  self->_lastPersonID = a3;
}

- (BOOL)unitTestSampling
{
  return self->_unitTestSampling;
}

- (NSMutableArray)lastMotionData
{
  return self->_lastMotionData;
}

- (void)setLastMotionData:(id)a3
{
  objc_storeStrong((id *)&self->_lastMotionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMotionData, 0);
  objc_storeStrong(&self->_operationEndableCallback, 0);
  objc_storeStrong(&self->_stateChangedCallback, 0);
  objc_storeStrong((id *)&self->_sampleLogger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
