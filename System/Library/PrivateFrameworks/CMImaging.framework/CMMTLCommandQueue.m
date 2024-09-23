@implementation CMMTLCommandQueue

- (CMMTLCommandQueue)initWithCMMTLDevice:(id)a3 maxCommandBufferCount:(unint64_t)a4
{
  id v7;
  CMMTLCommandQueue *v8;
  CMMTLCommandQueue *v9;
  uint64_t v10;
  MTLCommandQueue *commandQueue;
  uint64_t v12;
  InterceptConfig *interceptConfig;
  CMMTLCommandQueue *v14;
  CMMTLCommandQueue *v15;
  int v17;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CMMTLCommandQueue;
  v8 = -[CMMTLCommandQueue init](&v18, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_4;
  objc_storeStrong((id *)&v8->_cmDevice, a3);
  v10 = -[MTLDeviceSPI newCommandQueueWithMaxCommandBufferCount:](v9->_cmDevice->_device, "newCommandQueueWithMaxCommandBufferCount:", a4);
  commandQueue = v9->_commandQueue;
  v9->_commandQueue = (MTLCommandQueue *)v10;

  if (v9->_commandQueue)
  {
    -[CMMTLDevice interceptConfig](v9->_cmDevice, "interceptConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    interceptConfig = v9->_interceptConfig;
    v9->_interceptConfig = (InterceptConfig *)v12;

    if (v9->_interceptConfig)
      goto LABEL_4;
  }
  FigDebugAssert3();
  v17 = FigSignalErrorAt();
  v14 = 0;
  if (!v17)
LABEL_4:
    v14 = v9;
  v15 = v14;

  return v15;
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_cmDevice;
}

- (CMMTLCommandQueue)initWithCMMTLDevice:(id)a3
{
  id v5;
  CMMTLCommandQueue *v6;
  CMMTLCommandQueue *v7;
  uint64_t v8;
  MTLCommandQueue *commandQueue;
  uint64_t v10;
  InterceptConfig *interceptConfig;
  CMMTLCommandQueue *v12;
  CMMTLCommandQueue *v13;
  int v15;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMMTLCommandQueue;
  v6 = -[CMMTLCommandQueue init](&v16, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_storeStrong((id *)&v6->_cmDevice, a3);
  v8 = -[MTLDeviceSPI newCommandQueue](v7->_cmDevice->_device, "newCommandQueue");
  commandQueue = v7->_commandQueue;
  v7->_commandQueue = (MTLCommandQueue *)v8;

  if (v7->_commandQueue)
  {
    -[CMMTLDevice interceptConfig](v7->_cmDevice, "interceptConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    interceptConfig = v7->_interceptConfig;
    v7->_interceptConfig = (InterceptConfig *)v10;

    if (v7->_interceptConfig)
      goto LABEL_4;
  }
  FigDebugAssert3();
  v15 = FigSignalErrorAt();
  v12 = 0;
  if (!v15)
LABEL_4:
    v12 = v7;
  v13 = v12;

  return v13;
}

- (id)commandBuffer
{
  return -[CMMTLCommandBuffer initWithCMMTLCommandQueue:unretained:]([CMMTLCommandBuffer alloc], "initWithCMMTLCommandQueue:unretained:", self, 0);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  MTLCommandQueue *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_commandQueue;
  else
    v4 = 0;
  return v4;
}

- (CMMTLCommandQueue)initWithCMMTLDevice:(id)a3 descriptor:(id)a4
{
  id v7;
  id v8;
  CMMTLCommandQueue *v9;
  CMMTLCommandQueue *v10;
  uint64_t v11;
  MTLCommandQueue *commandQueue;
  uint64_t v13;
  InterceptConfig *interceptConfig;
  CMMTLCommandQueue *v15;
  CMMTLCommandQueue *v16;
  int v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CMMTLCommandQueue;
  v9 = -[CMMTLCommandQueue init](&v19, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  objc_storeStrong((id *)&v9->_cmDevice, a3);
  v11 = -[MTLDeviceSPI newCommandQueueWithDescriptor:](v10->_cmDevice->_device, "newCommandQueueWithDescriptor:", v8);
  commandQueue = v10->_commandQueue;
  v10->_commandQueue = (MTLCommandQueue *)v11;

  if (v10->_commandQueue)
  {
    -[CMMTLDevice interceptConfig](v10->_cmDevice, "interceptConfig");
    v13 = objc_claimAutoreleasedReturnValue();
    interceptConfig = v10->_interceptConfig;
    v10->_interceptConfig = (InterceptConfig *)v13;

    if (v10->_interceptConfig)
      goto LABEL_4;
  }
  FigDebugAssert3();
  v18 = FigSignalErrorAt();
  v15 = 0;
  if (!v18)
LABEL_4:
    v15 = v10;
  v16 = v15;

  return v16;
}

- (id)commandBufferWithUnretainedReferences
{
  return -[CMMTLCommandBuffer initWithCMMTLCommandQueue:unretained:]([CMMTLCommandBuffer alloc], "initWithCMMTLCommandQueue:unretained:", self, 1);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CMMTLCommandQueue;
  return -[CMMTLCommandQueue respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_commandQueue);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CMMTLCommandQueue;
    -[CMMTLCommandQueue forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interceptConfig, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_cmDevice, 0);
}

@end
