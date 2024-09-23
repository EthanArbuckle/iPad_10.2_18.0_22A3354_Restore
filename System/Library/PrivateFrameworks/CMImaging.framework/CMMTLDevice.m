@implementation CMMTLDevice

- (id)forwardingTargetForSelector:(SEL)a3
{
  MTLDeviceSPI *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_device;
  else
    v4 = 0;
  return v4;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CMMTLDevice;
  return -[CMMTLDevice respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (id)newCommandQueue
{
  return -[CMMTLCommandQueue initWithCMMTLDevice:]([CMMTLCommandQueue alloc], "initWithCMMTLDevice:", self);
}

- (InterceptConfig)interceptConfig
{
  return self->_interceptConfig;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  return -[CMMTLCommandQueue initWithCMMTLDevice:maxCommandBufferCount:]([CMMTLCommandQueue alloc], "initWithCMMTLDevice:maxCommandBufferCount:", self, a3);
}

- (CMMTLDevice)initWithLevel:(int)a3
{
  uint64_t v3;
  CMMTLDevice *v4;
  MTLDeviceSPI *v5;
  MTLDeviceSPI *device;
  InterceptConfig *v7;
  InterceptConfig *interceptConfig;
  CMMTLDevice *v9;
  CMMTLDevice *v10;
  int v12;
  objc_super v13;

  v3 = *(_QWORD *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)CMMTLDevice;
  v4 = -[CMMTLDevice init](&v13, sel_init);
  if (!v4)
    goto LABEL_5;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v5 = (MTLDeviceSPI *)MTLCreateSystemDefaultDevice();
  device = v4->_device;
  v4->_device = v5;

  if (v4->_device)
  {
    if ((_DWORD)v3)
    {
      v7 = -[InterceptConfig initWithLevel:]([InterceptConfig alloc], "initWithLevel:", v3);
      interceptConfig = v4->_interceptConfig;
      v4->_interceptConfig = v7;

      if (v4->_interceptConfig)
        goto LABEL_5;
    }
  }
  FigDebugAssert3();
  v12 = FigSignalErrorAt();
  v9 = 0;
  if (!v12)
LABEL_5:
    v9 = v4;
  v10 = v9;

  return v10;
}

- (FigMetalExecutionStatus)executionStatus
{
  return -[InterceptConfig executionStatus](self->_interceptConfig, "executionStatus");
}

- (void)setExecutionStatus:(id)a3
{
  -[InterceptConfig setExecutionStatus:](self->_interceptConfig, "setExecutionStatus:", a3);
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id v4;
  CMMTLCommandQueue *v5;

  v4 = a3;
  v5 = -[CMMTLCommandQueue initWithCMMTLDevice:descriptor:]([CMMTLCommandQueue alloc], "initWithCMMTLDevice:descriptor:", self, v4);

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_device);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CMMTLDevice;
    -[CMMTLDevice forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (void)setInterceptConfig:(id)a3
{
  objc_storeStrong((id *)&self->_interceptConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interceptConfig, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
