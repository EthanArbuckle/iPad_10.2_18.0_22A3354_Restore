@implementation MTLCommandQueueDescriptorInternal

- (unint64_t)qosLevel
{
  return self->_qosLevel;
}

- (unint64_t)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (BOOL)commitSynchronously
{
  return self->_commitSynchronously;
}

- (OS_dispatch_queue)commitQueue
{
  return self->_commitQueue;
}

- (BOOL)disableCrossQueueHazardTracking
{
  return self->_disableCrossQueueHazardTracking;
}

- (BOOL)isOpenGLQueue
{
  return self->_openGLQueue;
}

- (BOOL)enableLowLatencyWaitSharedEvent
{
  return self->_enableLowLatencyWaitSharedEvent;
}

- (BOOL)enableLowLatencySignalSharedEvent
{
  return self->_enableLowLatencySignalSharedEvent;
}

- (BOOL)disableIOFencing
{
  return self->_disableIOFencing;
}

- (BOOL)disableAsyncCompletionDispatch
{
  return self->_disableAsyncCompletionDispatch;
}

- (unint64_t)devicePartition
{
  return self->_devicePartition;
}

- (MTLCommandQueueDescriptorInternal)init
{
  MTLCommandQueueDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCommandQueueDescriptorInternal;
  result = -[MTLCommandQueueDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    result->_maxCommandBufferCount = 64;
    result->_qosLevel = 2;
    result->_commitQueue = 0;
    result->_commitSynchronously = 0;
    result->_completionQueue = 0;
    result->_disableCrossQueueHazardTracking = 0;
    result->_disableAsyncCompletionDispatch = 0;
    result->_openGLQueue = 0;
    result->_devicePartition = 0;
    result->_lockParameterBufferSizeToMax = 0;
    result->_logState = 0;
  }
  return result;
}

- (void)setMaxCommandBufferCount:(unint64_t)a3
{
  self->_maxCommandBufferCount = a3;
}

- (void)setCompletionQueue:(id)a3
{
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  if (self->_completionQueue)
    dispatch_release((dispatch_object_t)a3);
  self->_completionQueue = (OS_dispatch_queue *)a3;
}

- (void)setCommitSynchronously:(BOOL)a3
{
  self->_commitSynchronously = a3;
}

- (void)dealloc
{
  NSObject *commitQueue;
  NSObject *completionQueue;
  objc_super v5;

  commitQueue = self->_commitQueue;
  if (commitQueue)
    dispatch_release(commitQueue);
  completionQueue = self->_completionQueue;
  if (completionQueue)
    dispatch_release(completionQueue);

  v5.receiver = self;
  v5.super_class = (Class)MTLCommandQueueDescriptorInternal;
  -[MTLCommandQueueDescriptorInternal dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setMaxCommandBufferCount:", self->_maxCommandBufferCount);
    objc_msgSend(v5, "setQosLevel:", self->_qosLevel);
    objc_msgSend(v5, "setCommitQueue:", self->_commitQueue);
    objc_msgSend(v5, "setCommitSynchronously:", self->_commitSynchronously);
    objc_msgSend(v5, "setCompletionQueue:", self->_completionQueue);
    objc_msgSend(v5, "setDisableCrossQueueHazardTracking:", self->_disableCrossQueueHazardTracking);
    objc_msgSend(v5, "setDisableAsyncCompletionDispatch:", self->_disableAsyncCompletionDispatch);
    objc_msgSend(v5, "setIsOpenGLQueue:", self->_openGLQueue);
    objc_msgSend(v5, "setDevicePartition:", self->_devicePartition);
    objc_msgSend(v5, "setDisableIOFencing:", self->_disableIOFencing);
    objc_msgSend(v5, "setEnableLowLatencySignalSharedEvent:", self->_enableLowLatencySignalSharedEvent);
    objc_msgSend(v5, "setEnableLowLatencyWaitSharedEvent:", self->_enableLowLatencyWaitSharedEvent);
    objc_msgSend(v5, "setLockParameterBufferSizeToMax:", self->_lockParameterBufferSizeToMax);
    objc_msgSend(v5, "setLogState:", self->_logState);
    objc_msgSend(v5, "setCommitsWithQoS:", self->_commitsWithQoS);
  }
  return v5;
}

- (void)setCommitQueue:(id)a3
{
  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  if (self->_commitQueue)
    dispatch_release((dispatch_object_t)a3);
  self->_commitQueue = (OS_dispatch_queue *)a3;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t qosLevel;
  void *v8;
  objc_super v10;
  _QWORD v11[23];

  v11[22] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v11[0] = v4;
  v11[1] = CFSTR("maxCommandBufferCount =");
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxCommandBufferCount);
  v6 = 0;
  v11[2] = v5;
  v11[3] = v4;
  v11[4] = CFSTR("qosLevel =");
  qosLevel = self->_qosLevel;
  if (qosLevel <= 4)
    v6 = *((_QWORD *)&off_1E0FE56D8 + qosLevel);
  v11[5] = v6;
  v11[6] = v4;
  v11[7] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("commitQueue =%p"), self->_commitQueue);
  v11[8] = v4;
  v11[9] = CFSTR("commitSynchronously =");
  v11[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_commitSynchronously);
  v11[11] = v4;
  v11[12] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("completionQueue =%p"), self->_completionQueue);
  v11[13] = v4;
  v11[14] = CFSTR("disableCrossQueueHazardTracking =");
  v11[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableCrossQueueHazardTracking);
  v11[16] = v4;
  v11[17] = CFSTR("disableAsyncCompletionDispatch =");
  v11[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disableAsyncCompletionDispatch);
  v11[19] = v4;
  v11[20] = CFSTR("lockParameterBufferSizeToMax =");
  v11[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lockParameterBufferSizeToMax);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 22);
  v10.receiver = self;
  v10.super_class = (Class)MTLCommandQueueDescriptorInternal;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[MTLCommandQueueDescriptorInternal description](&v10, sel_description), objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLCommandQueueDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (void)setQosLevel:(unint64_t)a3
{
  self->_qosLevel = a3;
}

- (void)setDisableCrossQueueHazardTracking:(BOOL)a3
{
  self->_disableCrossQueueHazardTracking = a3;
}

- (void)setDisableAsyncCompletionDispatch:(BOOL)a3
{
  self->_disableAsyncCompletionDispatch = a3;
}

- (void)setIsOpenGLQueue:(BOOL)a3
{
  self->_openGLQueue = a3;
}

- (void)setDevicePartition:(unint64_t)a3
{
  self->_devicePartition = a3;
}

- (void)setDisableIOFencing:(BOOL)a3
{
  self->_disableIOFencing = a3;
}

- (void)setEnableLowLatencySignalSharedEvent:(BOOL)a3
{
  self->_enableLowLatencySignalSharedEvent = a3;
}

- (void)setEnableLowLatencyWaitSharedEvent:(BOOL)a3
{
  self->_enableLowLatencyWaitSharedEvent = a3;
}

- (BOOL)lockParameterBufferSizeToMax
{
  return self->_lockParameterBufferSizeToMax;
}

- (void)setLockParameterBufferSizeToMax:(BOOL)a3
{
  self->_lockParameterBufferSizeToMax = a3;
}

- (id)logState
{
  return self->_logState;
}

- (void)setLogState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)commitsWithQoS
{
  return self->_commitsWithQoS;
}

- (void)setCommitsWithQoS:(BOOL)a3
{
  self->_commitsWithQoS = a3;
}

@end
