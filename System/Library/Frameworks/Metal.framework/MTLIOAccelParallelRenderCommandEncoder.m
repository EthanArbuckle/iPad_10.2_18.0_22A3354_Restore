@implementation MTLIOAccelParallelRenderCommandEncoder

- (MTLIOAccelParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  MTLIOAccelParallelRenderCommandEncoder *v5;
  MTLIOAccelParallelRenderCommandEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  v5 = -[_MTLParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:](&v8, sel_initWithCommandBuffer_renderPassDescriptor_, a3, a4);
  v6 = v5;
  if (v5)
  {
    -[MTLDevice deviceRef](v5->super._device, "deviceRef");
    v6->super._globalTraceObjectID = IOAccelDeviceGetNextGlobalTraceID();
    if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
    {
      -[MTLDevice deviceRef](v6->super._device, "deviceRef");
      objc_msgSend(a3, "globalTraceObjectID");
      -[MTLIOAccelParallelRenderCommandEncoder getType](v6, "getType");
      IOAccelDeviceTraceEvent();
    }
  }
  return v6;
}

- (void)setLabel:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v5, sel_setLabel_);
  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    self->super._labelTraceID = IOAccelDeviceTraceObjectLabel();
  }
}

- (void)endEncoding
{
  objc_super v3;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    -[MTLCommandBuffer globalTraceObjectID](self->super._commandBuffer, "globalTraceObjectID");
    -[MTLIOAccelParallelRenderCommandEncoder getType](self, "getType");
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  -[_MTLParallelRenderCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (void)pushDebugGroup:(id)a3
{
  objc_super v5;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    IOAccelDeviceTraceObjectLabel();
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  -[_MTLParallelRenderCommandEncoder pushDebugGroup:](&v5, sel_pushDebugGroup_, a3);
}

- (void)popDebugGroup
{
  objc_super v3;

  if (*(_DWORD *)*MEMORY[0x1E0D39EE0])
  {
    -[MTLDevice deviceRef](self->super._device, "deviceRef");
    IOAccelDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelParallelRenderCommandEncoder;
  -[_MTLParallelRenderCommandEncoder popDebugGroup](&v3, sel_popDebugGroup);
}

- (unint64_t)getType
{
  return 3;
}

- (BOOL)isMemorylessRender
{
  return 0;
}

@end
