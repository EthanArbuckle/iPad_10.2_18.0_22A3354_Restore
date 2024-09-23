@implementation IOGPUMetalDebugCommandEncoder

- (IOGPUMetalDebugCommandEncoder)initWithCommandBuffer:(id)a3
{
  IOGPUMetalDebugCommandEncoder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IOGPUMetalDebugCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v6, sel_initWithCommandBuffer_);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:].cold.2();
    objc_msgSend(a3, "getCurrentKernelCommandBufferPointer:end:", &v4->_kernelCommandBufferCurrent, &v4->_kernelCommandBufferEnd);
    objc_msgSend(a3, "beginSegment:", v4->_kernelCommandBufferCurrent);
    v4->_resourceList = (IOGPUResourceList *)objc_msgSend(a3, "ioGPUResourceList");
    v4->_api_resourceList = (MTLResourceList *)objc_msgSend(a3, "akResourceList");
    if (!v4->_resourceList)
      -[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:].cold.1();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  self->_kernelCommandBufferEnd = 0;
  self->_kernelCommandBufferCurrent = 0;
  self->_resourceList = 0;
  self->_api_resourceList = 0;
  v2.receiver = self;
  v2.super_class = (Class)IOGPUMetalDebugCommandEncoder;
  -[_MTLCommandEncoder dealloc](&v2, sel_dealloc);
}

- (void)reserveKernelCommandBufferSpace:(unint64_t)a3
{
  void **p_kernelCommandBufferEnd;
  _BYTE *kernelCommandBufferEnd;
  void **p_kernelCommandBufferCurrent;
  void *result;
  void *v9;

  p_kernelCommandBufferEnd = &self->_kernelCommandBufferEnd;
  kernelCommandBufferEnd = self->_kernelCommandBufferEnd;
  p_kernelCommandBufferCurrent = &self->_kernelCommandBufferCurrent;
  result = self->_kernelCommandBufferCurrent;
  if (kernelCommandBufferEnd - (_BYTE *)result < a3)
  {
    v9 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]);
    objc_msgSend(v9, "growKernelCommandBuffer:", a3);
    objc_msgSend(v9, "getCurrentKernelCommandBufferPointer:end:", p_kernelCommandBufferCurrent, p_kernelCommandBufferEnd);
    result = *p_kernelCommandBufferCurrent;
    if ((_BYTE *)*p_kernelCommandBufferEnd - (_BYTE *)*p_kernelCommandBufferCurrent < a3)
      -[IOGPUMetalDebugCommandEncoder reserveKernelCommandBufferSpace:].cold.1();
  }
  *p_kernelCommandBufferCurrent = (char *)result + a3;
  return result;
}

- (void)restartDebugPass
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]);
  objc_msgSend(v3, "setCurrentKernelCommandBufferPointer:", self->_kernelCommandBufferCurrent);
  objc_msgSend(v3, "endCurrentSegment");
  objc_msgSend(v3, "beginSegment:", self->_kernelCommandBufferCurrent);
}

- (void)endEncoding
{
  void *v3;
  objc_super v4;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]);
  objc_msgSend(v3, "setCurrentKernelCommandBufferPointer:", self->_kernelCommandBufferCurrent);
  objc_msgSend(v3, "endCurrentSegment");
  self->_kernelCommandBufferEnd = 0;
  self->_kernelCommandBufferCurrent = 0;
  self->_resourceList = 0;
  self->_api_resourceList = 0;
  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalDebugCommandEncoder;
  -[_MTLCommandEncoder endEncoding](&v4, sel_endEncoding);
}

- (unsigned)addDebugResourceListInfo:(IOGPUResourceInfo *)a3 flag:(unsigned int)a4
{
  uint64_t v4;
  unsigned int result;

  v4 = *(_QWORD *)&a4;
  result = IOGPUResourceListAddResource((uint64_t)self->_resourceList, (uint64_t)a3, *(uint64_t *)&a4);
  if (!*(_QWORD *)&self->_resourceList->var12)
  {
    -[IOGPUMetalDebugCommandEncoder restartDebugPass](self, "restartDebugPass");
    result = IOGPUResourceListAddResource((uint64_t)self->_resourceList, (uint64_t)a3, v4);
    if (!*(_QWORD *)&self->_resourceList->var12)
      -[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:].cold.1();
  }
  if (result == -1)
    -[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:].cold.2();
  return result;
}

- (void)debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v8;
  _DWORD *v9;

  v8 = (a4 + 19) & 0xFFFFFFFC;
  v9 = -[IOGPUMetalDebugCommandEncoder reserveKernelCommandBufferSpace:](self, "reserveKernelCommandBufferSpace:", (a4 + 19) & 0xFFFFFFFFFFFFFFFCLL);
  *v9 = 0;
  v9[1] = v8;
  v9[2] = a5;
  v9[3] = a4;
  memcpy(v9 + 4, a3, a4);
}

- (void)addAPIResource:(id)a3
{
  if (self->_api_resourceList)
    MTLResourceListAddResource();
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]))
    -[IOGPUMetalDebugCommandEncoder kprintfBytes:length:].cold.1();
  -[IOGPUMetalDebugCommandEncoder debugBytes:length:output_type:](self, "debugBytes:length:output_type:", a3, a4, 0);
}

- (void)IOLogBytes:(const char *)a3 length:(unint64_t)a4
{
  if (!*(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BDDD860]))
    -[IOGPUMetalDebugCommandEncoder IOLogBytes:length:].cold.1();
  -[IOGPUMetalDebugCommandEncoder debugBytes:length:output_type:](self, "debugBytes:length:output_type:", a3, a4, 1);
}

- (void)initWithCommandBuffer:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:]", "IOGPUMetalDebugCommandEncoder.m", 28, "_resourceList");
}

- (void)initWithCommandBuffer:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder initWithCommandBuffer:]", "IOGPUMetalDebugCommandEncoder.m", 22, "[_commandBuffer isKindOfClass:[IOGPUMetalCommandBuffer class]]");
}

- (void)reserveKernelCommandBufferSpace:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder reserveKernelCommandBufferSpace:]", "IOGPUMetalDebugCommandEncoder.m", 51, "((uintptr_t)_kernelCommandBufferEnd - (uintptr_t)_kernelCommandBufferCurrent) >= commandSize");
}

- (void)addDebugResourceListInfo:flag:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:]", "IOGPUMetalDebugCommandEncoder.m", 85, "!IOGPUResourceListIsThresholdExceeded(_resourceList)");
}

- (void)addDebugResourceListInfo:flag:.cold.2()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder addDebugResourceListInfo:flag:]", "IOGPUMetalDebugCommandEncoder.m", 87, "segment_resource_id != kIOGPUResourceListInvalidSegmentResourceIndex");
}

- (void)kprintfBytes:length:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder kprintfBytes:length:]", "IOGPUMetalDebugCommandEncoder.m", 121, "_commandBuffer");
}

- (void)IOLogBytes:length:.cold.1()
{
  __assert_rtn("-[IOGPUMetalDebugCommandEncoder IOLogBytes:length:]", "IOGPUMetalDebugCommandEncoder.m", 127, "_commandBuffer");
}

@end
