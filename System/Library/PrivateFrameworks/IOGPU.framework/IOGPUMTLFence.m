@implementation IOGPUMTLFence

- (IOGPUMTLFence)initWithDevice:(__IOGPUDevice *)a3
{
  IOGPUMTLFence *v4;
  IOGPUMTLFence *v5;
  size_t v7;
  unsigned int outputStruct;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMTLFence;
  v4 = -[IOGPUMTLFence init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_deviceRef = a3;
    CFRetain(a3);
    outputStruct = 0;
    v7 = 4;
    if (IOConnectCallMethod(v5->_deviceRef->var2, 0x12u, 0, 0, 0, 0, 0, 0, &outputStruct, &v7))
    {

      return 0;
    }
    else
    {
      v5->_fenceName = outputStruct;
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
    if (self->_fenceName)
    {
      input = self->_fenceName;
      IOConnectCallMethod(deviceRef->var2, 0x13u, &input, 1u, 0, 0, 0, 0, 0, 0);
      deviceRef = self->_deviceRef;
    }
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMTLFence;
  -[IOGPUMTLFence dealloc](&v4, sel_dealloc);
}

@end
