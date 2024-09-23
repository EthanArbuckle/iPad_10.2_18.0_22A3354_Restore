@implementation IOGPUMTLEvent

- (IOGPUMTLEvent)initWithDeviceRef:(__IOGPUDevice *)a3
{
  return -[IOGPUMTLEvent initWithDeviceRef:options:](self, "initWithDeviceRef:options:", a3, 0);
}

- (IOGPUMTLEvent)initWithDeviceRef:(__IOGPUDevice *)a3 options:(unint64_t)a4
{
  IOGPUMTLEvent *v6;
  IOGPUMTLEvent *v7;
  size_t v9;
  uint64_t outputStruct;
  __int128 v11;
  uint64_t input;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IOGPUMTLEvent;
  v6 = -[IOGPUMTLEvent init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_deviceRef = a3;
    CFRetain(a3);
    input = a4;
    outputStruct = 0;
    v11 = 0uLL;
    v9 = 24;
    if (IOConnectCallMethod(v7->_deviceRef->var2, 0x14u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9))
    {

      return 0;
    }
    else
    {
      v7->_eventName = outputStruct;
      *(_OWORD *)&v7->_globalTraceObjectID = v11;
      v7->_enableBarrier = 1;
    }
  }
  return v7;
}

- (void)dealloc
{
  __IOGPUDevice *deviceRef;
  objc_super v4;
  uint64_t input;

  deviceRef = self->_deviceRef;
  if (deviceRef)
  {
    if (self->_eventName)
    {
      input = self->_eventName;
      IOConnectCallMethod(deviceRef->var2, 0x15u, &input, 1u, 0, 0, 0, 0, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMTLEvent;
  -[IOGPUMTLEvent dealloc](&v4, sel_dealloc);
}

- (unsigned)_encodeIOGPUKernelSignalEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4
{
  a3->var0 = self->_eventName;
  a3->var2 = a4;
  return 5;
}

- (unsigned)_encodeIOGPUKernelWaitEventCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3 value:(unint64_t)a4 timeout:(unsigned int)a5
{
  unsigned int eventName;

  eventName = self->_eventName;
  a3->var2 = a4;
  a3->var0 = eventName;
  a3->var1 = a5;
  if (self->_enableBarrier)
    return 6;
  else
    return 10;
}

- (unsigned)_encodeIOGPUKernelSignalEventAgentCommandArgs:(IOGPUKernelCommandSignalEventAgentArgs *)a3 value:(unint64_t)a4 agentMask:(unint64_t)a5
{
  _eventMisused();
  abort();
}

- (unsigned)_encodeIOGPUKernelConditionalEventAbortCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3
{
  _eventMisused();
  abort();
}

- (unsigned)_encodeIOGPUKernelSignalEventScheduledCommandArgs:(IOGPUKernelCommandSignalOrWaitEventArgs *)a3
{
  _eventMisused();
  abort();
}

- (BOOL)supportsRollback
{
  return self->_eventOptions & 1;
}

- (BOOL)enableBarrier
{
  return self->_enableBarrier;
}

- (void)setEnableBarrier:(BOOL)a3
{
  self->_enableBarrier = a3;
}

@end
