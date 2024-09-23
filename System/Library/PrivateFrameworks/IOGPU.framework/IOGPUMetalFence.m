@implementation IOGPUMetalFence

- (IOGPUMetalFence)initWithDevice:(id)a3
{
  IOGPUMetalFence *v4;
  IOGPUMTLFence *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalFence;
  v4 = -[_MTLObjectWithLabel init](&v7, sel_init);
  if (v4)
  {
    v4->_device = (MTLDevice *)a3;
    v5 = -[IOGPUMTLFence initWithDevice:]([IOGPUMTLFence alloc], "initWithDevice:", objc_msgSend(a3, "deviceRef"));
    v4->_fence = v5;
    if (v5)
    {
      v4->_fenceIndex = v5->_fenceName;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalFence;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return self->_device;
}

@end
