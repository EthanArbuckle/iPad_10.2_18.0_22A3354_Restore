@implementation BWInferenceSchedulerConnection

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setFramebuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BWInferenceSchedulerResourceCoordinator)coordinator
{
  return self->_coordinator;
}

- (OS_dispatch_group)coordinationGroup
{
  return self->_coordinationGroup;
}

- (BWInferenceSchedulerFramebuffer)framebuffer
{
  return self->_framebuffer;
}

- (BWInferenceSchedulerConnection)initWithInferenceTargetQueue:(id)a3 scalingTargetQueue:(id)a4 submissionTargetQueue:(id)a5 completionTargetQueue:(id)a6
{
  BWInferenceSchedulerConnection *v10;
  BWInferenceSchedulerConnection *v11;
  unint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWInferenceSchedulerConnection;
  v10 = -[BWInferenceSchedulerConnection init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    do
      v12 = __ldaxr(&nextIdentifier);
    while (__stlxr(v12 + 1, &nextIdentifier));
    v10->_identifier = v12;
    v10->_coordinator = objc_alloc_init(BWInferenceSchedulerResourceCoordinator);
    v11->_inferenceQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.inference", 0, (dispatch_queue_t)a3);
    v11->_scalingQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.scaling", 0, (dispatch_queue_t)a4);
    v11->_submissionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.submission", 0, (dispatch_queue_t)a5);
    v11->_completionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.coremedia.inference-connection.submission", 0, (dispatch_queue_t)a6);
    v11->_coordinationGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v11;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BWInferenceSchedulerConnection)init
{
  return -[BWInferenceSchedulerConnection initWithInferenceTargetQueue:scalingTargetQueue:submissionTargetQueue:completionTargetQueue:](self, "initWithInferenceTargetQueue:scalingTargetQueue:submissionTargetQueue:completionTargetQueue:", 0, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerConnection;
  -[BWInferenceSchedulerConnection dealloc](&v3, sel_dealloc);
}

- (OS_dispatch_queue)inferenceQueue
{
  return self->_inferenceQueue;
}

- (OS_dispatch_queue)scalingQueue
{
  return self->_scalingQueue;
}

- (OS_dispatch_queue)submissionQueue
{
  return self->_submissionQueue;
}

@end
