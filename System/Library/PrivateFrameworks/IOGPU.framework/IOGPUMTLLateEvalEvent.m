@implementation IOGPUMTLLateEvalEvent

- (IOGPUMTLLateEvalEvent)initWithDevice:(__IOGPUDevice *)a3
{
  IOGPUMTLLateEvalEvent *v4;
  IOGPUMTLLateEvalEvent *v5;
  uint64_t v6;
  uint32_t outputCnt;
  objc_super v9;
  uint64_t output[3];

  output[2] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMTLLateEvalEvent;
  v4 = -[IOGPUMTLLateEvalEvent init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_deviceRef = a3;
    CFRetain(a3);
    outputCnt = 2;
    if (IOConnectCallMethod(v5->_deviceRef->var2, 0x1Du, 0, 0, 0, 0, output, &outputCnt, 0, 0))
    {

      return 0;
    }
    else
    {
      v6 = output[1];
      v5->_eventName = output[0];
      v5->_globalTraceObjectID = v6;
    }
  }
  return v5;
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
      IOConnectCallMethod(deviceRef->var2, 0x1Eu, &input, 1u, 0, 0, 0, 0, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMTLLateEvalEvent;
  -[IOGPUMTLLateEvalEvent dealloc](&v4, sel_dealloc);
}

- (void)setSignaledValue:(unint64_t)a3
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = self->_eventName;
  input[1] = a3;
  IOConnectCallMethod(self->_deviceRef->var2, 0x1Fu, input, 2u, 0, 0, 0, 0, 0, 0);
}

- (unint64_t)signaledValue
{
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output[3];

  output[2] = *MEMORY[0x24BDAC8D0];
  input = self->_eventName;
  output[0] = 0;
  output[1] = 0;
  outputCnt = 2;
  IOConnectCallMethod(self->_deviceRef->var2, 0x20u, &input, 1u, 0, 0, output, &outputCnt, 0, 0);
  return output[0];
}

@end
