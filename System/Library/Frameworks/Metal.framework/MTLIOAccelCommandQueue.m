@implementation MTLIOAccelCommandQueue

- (MTLIOAccelCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  MTLIOAccelCommandQueue *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelCommandQueue;
  v5 = -[_MTLCommandQueue initWithDevice:descriptor:](&v8, sel_initWithDevice_descriptor_, a3, a4);
  if (v5)
  {
    v5->_device = (MTLDevice *)a3;
    objc_msgSend(a3, "sharedRef");
    v6 = IOAccelCommandQueueCreateWithQoS();
    v5->_commandQueue = (__IOAccelCommandQueue *)v6;
    if (v6)
    {
      IOAccelCommandQueueSetDispatchQueue();
      v5->_priority = 1;
      v5->_backgroundPriority = 3;
      v5->super._globalTraceObjectID = IOAccelCommandQueueGetGlobalTraceObjectID();
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandQueue;
  -[_MTLCommandQueue setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->_device, "deviceRef");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)dealloc
{
  objc_super v3;

  IOAccelCommandQueueRelease();

  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandQueue;
  -[_MTLCommandQueue dealloc](&v3, sel_dealloc);
}

- (void)setCompletionQueue:(id)a3
{
  NSObject *completionQueueDispatch;

  completionQueueDispatch = self->super._completionQueueDispatch;
  if (completionQueueDispatch)
    dispatch_release(completionQueueDispatch);
  self->super._completionQueueDispatch = (OS_dispatch_queue *)a3;
  dispatch_retain((dispatch_object_t)a3);
  IOAccelCommandQueueSetDispatchQueue();
}

- (BOOL)_setGPUPriority:(unint64_t)a3 backgroundPriority:(unint64_t)a4
{
  int v7;

  v7 = IOAccelCommandQueueSetPriorityAndBackground();
  if (!v7)
  {
    self->_priority = a3;
    self->_backgroundPriority = a4;
  }
  return v7 == 0;
}

- (unint64_t)getGPUPriority
{
  return self->_priority;
}

- (BOOL)setGPUPriority:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  validateGPUPriority(a3, 0, a3, v3, v4, v5, v6, v7);
  return -[MTLIOAccelCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", a3, self->_backgroundPriority);
}

- (BOOL)setGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  validateGPUPriority(a3, 0, a3, a4, v4, v5, v6, v7);
  return -[MTLIOAccelCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", a3, self->_backgroundPriority);
}

- (unint64_t)getBackgroundGPUPriority
{
  return self->_backgroundPriority;
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3 >= 6)
    MTLReportFailure(0, "validateGPUPriority", 121, (uint64_t)CFSTR("priority (%d) is not a valid MTLGPUPriority"), v3, v4, v5, v6, a3);
  return -[MTLIOAccelCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", self->_priority, a3);
}

- (BOOL)setBackgroundGPUPriority:(unint64_t)a3 offset:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3 >= 6)
    MTLReportFailure(0, "validateGPUPriority", 121, (uint64_t)CFSTR("priority (%d) is not a valid MTLGPUPriority"), v4, v5, v6, v7, a3);
  return -[MTLIOAccelCommandQueue _setGPUPriority:backgroundPriority:](self, "_setGPUPriority:backgroundPriority:", self->_priority, a3);
}

- (void)submitCommandBuffers:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  _DWORD *v8;
  size_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  __int128 *v20;
  NSObject *commandQueueDispatch;
  __int128 v22;
  uint64_t v23;
  _DWORD *v24;
  _QWORD block[4];
  __int128 v26;
  int v27;
  _QWORD v28[6];
  _QWORD aBlock[7];

  aBlock[5] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78](self);
  v8 = (_DWORD *)((char *)&v23 - ((v7 + 23) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, v9);
  v24 = v8;
  v8[1] = a4;
  v10 = MEMORY[0x1E0C809B0];
  if (a4)
  {
    v11 = v24 + 3;
    v12 = a4;
    do
    {
      v13 = *a3;
      v14 = *((_QWORD *)*a3 + 73);
      *(v11 - 1) = *(_DWORD *)(*(_QWORD *)(v14 + 32) + 48);
      *v11 = *(_DWORD *)(*(_QWORD *)(v14 + 64) + 48);
      aBlock[0] = v10;
      aBlock[1] = 3221225472;
      aBlock[2] = __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke;
      aBlock[3] = &unk_1E0FE3D78;
      aBlock[4] = v13;
      v15 = _Block_copy(aBlock);
      *(_QWORD *)(v11 + 1) = v15;
      v13[76] = v15;
      v28[0] = v10;
      v28[1] = 3221225472;
      v28[2] = __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_2;
      v28[3] = &unk_1E0FE3DA0;
      v28[4] = v13;
      v28[5] = self;
      v16 = _Block_copy(v28);
      *(_QWORD *)(v11 + 3) = v16;
      v13[77] = v16;
      if (objc_msgSend(v13, "isProfilingEnabled"))
        objc_msgSend(v13, "kernelSubmitTime");
      if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
      {
        objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "backgroundTrackingPID");
        objc_msgSend((id)objc_msgSend(v13, "device"), "globalTraceObjectID");
        objc_msgSend((id)objc_msgSend(v13, "commandQueue"), "globalTraceObjectID");
        objc_msgSend(v13, "globalTraceObjectID");
        IOAccelDeviceTraceEvent();
      }
      ++a3;
      v11 += 6;
      --v12;
    }
    while (v12);
  }
  v17 = IOAccelCommandQueueSubmitCommandBuffers();
  if (v17)
  {
    if (v17 == 268435459)
      v18 = 15;
    else
      v18 = 1;
    if (v17 == -536870174)
      v19 = 7;
    else
      v19 = v18;
    if (a4)
    {
      v20 = (__int128 *)(v24 + 4);
      do
      {
        commandQueueDispatch = self->super._commandQueueDispatch;
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_3;
        block[3] = &unk_1E0FE3DC8;
        v22 = *v20;
        v20 = (__int128 *)((char *)v20 + 24);
        v26 = v22;
        v27 = v19;
        dispatch_async(commandQueueDispatch, block);
        --a4;
      }
      while (a4);
    }
  }
}

void __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v8;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    objc_msgSend(*(id *)(a1 + 32), "globalTraceObjectID");
    IOAccelDeviceTraceEvent();
  }
  if (a4)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithIOAccelError:", a4);
    objc_msgSend(*(id *)(a1 + 32), "didScheduleWithStartTime:endTime:error:", a2, a3, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didScheduleWithStartTime:endTime:error:", a2, a3, 0);
  }
}

void __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  id v8;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    objc_msgSend(*(id *)(a1 + 32), "globalTraceObjectID");
    IOAccelDeviceTraceEvent();
  }
  if (a4)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithIOAccelError:", a4);
    objc_msgSend(*(id *)(a1 + 40), "commandBufferDidComplete:startTime:completionTime:error:", *(_QWORD *)(a1 + 32), a2, a3, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "commandBufferDidComplete:startTime:completionTime:error:", *(_QWORD *)(a1 + 32), a2, a3, 0);
  }
}

void __53__MTLIOAccelCommandQueue_submitCommandBuffers_count___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  _Block_release(*(const void **)(a1 + 40));
}

- (MTLDevice)device
{
  return self->_device;
}

@end
