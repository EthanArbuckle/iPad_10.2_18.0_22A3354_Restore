@implementation IOGPUMetalCommandEncoder

- (void)pushDebugGroup:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD868]), "deviceRef");
    v6 = -[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    IOGPUDeviceTraceObjectLabel(v5, 8, 12, v6, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalCommandEncoder;
  -[_MTLCommandEncoder pushDebugGroup:](&v7, sel_pushDebugGroup_, a3);
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD868]), "deviceRef");
    v6 = -[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    v7 = (int)*MEMORY[0x24BDDD878];
    v8 = *(uint64_t *)((char *)&self->super.super.super.isa + v7);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)IOGPUDeviceTraceObjectLabel(v5, 8, 0, v6, v8);
  }
}

- (void)endEncoding
{
  objc_super v3;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD868]), "deviceRef");
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD860]), "globalTraceObjectID");
    -[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    -[_MTLCommandEncoder getType](self, "getType");
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandEncoder;
  -[_MTLCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (unint64_t)globalTraceObjectID
{
  uint64_t v3;
  unint64_t result;

  v3 = (int)*MEMORY[0x24BDDD870];
  result = *(unint64_t *)((char *)&self->super.super.super.isa + v3);
  if (!result)
  {
    result = IOGPUDeviceGetNextGlobalTraceID(objc_msgSend(*(id *)((char *)&self->super.super.super.isa
                                                                + (int)*MEMORY[0x24BDDD868]), "deviceRef"));
    *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)result;
  }
  return result;
}

- (IOGPUMetalCommandEncoder)initWithCommandBuffer:(id)a3
{
  IOGPUMetalCommandEncoder *v4;
  IOGPUMetalCommandEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v7, sel_initWithCommandBuffer_);
  v5 = v4;
  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + (int)*MEMORY[0x24BDDD868]), "deviceRef");
    objc_msgSend(a3, "globalTraceObjectID");
    -[IOGPUMetalCommandEncoder globalTraceObjectID](v5, "globalTraceObjectID");
    -[_MTLCommandEncoder getType](v5, "getType");
    IOGPUDeviceTraceEvent();
  }
  return v5;
}

- (void)popDebugGroup
{
  objc_super v3;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD868]), "deviceRef");
    -[IOGPUMetalCommandEncoder globalTraceObjectID](self, "globalTraceObjectID");
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalCommandEncoder;
  -[_MTLCommandEncoder popDebugGroup](&v3, sel_popDebugGroup);
}

@end
