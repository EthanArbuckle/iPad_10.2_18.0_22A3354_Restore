@implementation BWMetalInferenceContext

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (BWMetalInferenceContext)initWithScheduler:(id)a3 priority:(unsigned int)a4
{
  BWMetalInferenceContext *v6;
  MTLDevice *v7;
  MTLCommandQueue *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWMetalInferenceContext;
  v6 = -[BWMetalInferenceContext init](&v11, sel_init);
  if (v6)
  {
    v7 = (MTLDevice *)(id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
    v6->_device = v7;
    v8 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v7, "newCommandQueue");
    v6->_commandQueue = v8;
    v6->_commandQueueSPI = v8;
    if (a3)
    {
      -[MTLCommandQueue setSubmissionQueue:](v8, "setSubmissionQueue:", objc_msgSend(a3, "metalSubmissionQueue"));
      -[MTLCommandQueueSPI setCompletionQueue:](v6->_commandQueueSPI, "setCompletionQueue:", objc_msgSend(a3, "metalCompletionQueue"));
    }
    if (a4 - 13 >= 2 && a4)
    {
      if (a4 == 39)
        v9 = 2;
      else
        v9 = 4;
    }
    else
    {
      v9 = 1;
    }
    -[MTLCommandQueueSPI setGPUPriority:](v6->_commandQueueSPI, "setGPUPriority:", v9);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMetalInferenceContext;
  -[BWMetalInferenceContext dealloc](&v3, sel_dealloc);
}

@end
