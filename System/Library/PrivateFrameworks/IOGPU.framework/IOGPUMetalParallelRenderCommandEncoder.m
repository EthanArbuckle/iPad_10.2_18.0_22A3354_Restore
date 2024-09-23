@implementation IOGPUMetalParallelRenderCommandEncoder

- (IOGPUMetalParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  IOGPUMetalParallelRenderCommandEncoder *v5;
  IOGPUMetalParallelRenderCommandEncoder *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  v5 = -[_MTLParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:](&v9, sel_initWithCommandBuffer_renderPassDescriptor_, a3, a4);
  v6 = v5;
  if (v5)
  {
    v7 = (int)*MEMORY[0x24BDDD968];
    *(Class *)((char *)&v5->super.super.super.isa + (int)*MEMORY[0x24BDDD970]) = (Class)IOGPUDeviceGetNextGlobalTraceID(objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ v7), "deviceRef"));
    if (*(_DWORD *)__globalGPUCommPage)
    {
      objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + v7), "deviceRef");
      objc_msgSend(a3, "globalTraceObjectID");
      -[IOGPUMetalParallelRenderCommandEncoder getType](v6, "getType");
      IOGPUDeviceTraceEvent();
    }
  }
  return v6;
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  -[_MTLObjectWithLabel setLabel:](&v9, sel_setLabel_);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD968]), "deviceRef");
    v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD970]);
    v7 = (int)*MEMORY[0x24BDDD978];
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
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD968]), "deviceRef");
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD950]), "globalTraceObjectID");
    -[IOGPUMetalParallelRenderCommandEncoder getType](self, "getType");
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  -[_MTLParallelRenderCommandEncoder endEncoding](&v3, sel_endEncoding);
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD968]), "deviceRef");
    v6 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD970]);
    objc_msgSend(a3, "cStringUsingEncoding:", 1);
    IOGPUDeviceTraceObjectLabel(v5, 8, 12, v6, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  -[_MTLParallelRenderCommandEncoder pushDebugGroup:](&v7, sel_pushDebugGroup_, a3);
}

- (void)popDebugGroup
{
  objc_super v3;

  if (*(_DWORD *)__globalGPUCommPage)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BDDD968]), "deviceRef");
    IOGPUDeviceTraceEvent();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
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

- (id)_renderCommandEncoderCommon
{
  unint64_t StatusReg;
  id result;
  objc_super v4;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(_QWORD *)(StatusReg + 288) = 11181;
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalParallelRenderCommandEncoder;
  result = -[_MTLParallelRenderCommandEncoder _renderCommandEncoderCommon](&v4, sel__renderCommandEncoderCommon);
  *(_QWORD *)(StatusReg + 288) = 0;
  return result;
}

@end
