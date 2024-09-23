@implementation MTLIOAccelCommandEncoder

- (MTLIOAccelCommandEncoder)initWithCommandBuffer:(id)a3
{
  MTLIOAccelCommandEncoder *v4;
  MTLIOAccelCommandEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v7, sel_initWithCommandBuffer_);
  v5 = v4;
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](v4->super._device, "deviceRef");
    objc_msgSend(a3, "globalTraceObjectID");
    -[MTLIOAccelCommandEncoder globalTraceObjectID](v5, "globalTraceObjectID");
    -[_MTLCommandEncoder getType](v5, "getType");
    IOAccelDeviceTraceEvent();
  }
  return v5;
}

- (void)endEncoding
{
  objc_super v3;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    -[MTLCommandBuffer globalTraceObjectID](self->super._commandBuffer, "globalTraceObjectID");
    -[MTLIOAccelCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    -[_MTLCommandEncoder getType](self, "getType");
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandEncoder;
  -[_MTLCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    -[MTLIOAccelCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)pushDebugGroup:(id)a3
{
  objc_super v5;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    -[MTLIOAccelCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    IOAccelDeviceTraceObjectLabel();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelCommandEncoder;
  -[_MTLCommandEncoder pushDebugGroup:](&v5, sel_pushDebugGroup_, a3);
}

- (void)popDebugGroup
{
  objc_super v3;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    -[MTLIOAccelCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelCommandEncoder;
  -[_MTLCommandEncoder popDebugGroup](&v3, sel_popDebugGroup);
}

- (unint64_t)globalTraceObjectID
{
  unint64_t result;

  result = self->super._globalTraceObjectID;
  if (!result)
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    result = IOAccelDeviceGetNextGlobalTraceID();
    self->super._globalTraceObjectID = result;
  }
  return result;
}

@end
