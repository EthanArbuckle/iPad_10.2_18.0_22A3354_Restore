@implementation MTLIOAccelIOCommandQueue

- (MTLIOAccelIOCommandQueue)initWithDevice:(id)a3 descriptor:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOCommandQueue;
  return -[_MTLIOCommandQueue initWithDevice:descriptor:](&v5, sel_initWithDevice_descriptor_, a3, a4);
}

- (id)commandBuffer
{
  return -[MTLIOAccelIOCommandBuffer initWithQueue:resourceList:retained:]([MTLIOAccelIOCommandBuffer alloc], "initWithQueue:resourceList:retained:", self, self->super._resourceListPool, 1);
}

- (id)commandBufferWithUnretainedReferences
{
  return -[MTLIOAccelIOCommandBuffer initWithQueue:resourceList:retained:]([MTLIOAccelIOCommandBuffer alloc], "initWithQueue:resourceList:retained:", self, self->super._resourceListPool, 0);
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOCommandQueue;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[_MTLIOCommandQueue globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end
