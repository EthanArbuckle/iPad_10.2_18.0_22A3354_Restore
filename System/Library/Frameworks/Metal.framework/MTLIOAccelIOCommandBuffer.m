@implementation MTLIOAccelIOCommandBuffer

- (MTLIOAccelIOCommandBuffer)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLIOAccelIOCommandBuffer;
  return -[_MTLIOCommandBuffer initWithQueue:](&v4, sel_initWithQueue_, a3);
}

- (MTLIOAccelIOCommandBuffer)initWithQueue:(id)a3 resourceList:(id)a4 retained:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelIOCommandBuffer;
  return -[_MTLIOCommandBuffer initWithQueue:resourceList:retained:](&v6, sel_initWithQueue_resourceList_retained_, a3, a4, a5);
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelIOCommandBuffer;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[_MTLIOCommandBuffer globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

@end
