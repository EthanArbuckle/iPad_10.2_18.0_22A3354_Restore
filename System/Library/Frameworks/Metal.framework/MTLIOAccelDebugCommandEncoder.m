@implementation MTLIOAccelDebugCommandEncoder

- (MTLIOAccelDebugCommandEncoder)initWithCommandBuffer:(id)a3
{
  MTLIOAccelDebugCommandEncoder *v4;
  MTLIOAccelDebugCommandEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLIOAccelDebugCommandEncoder;
  v4 = -[_MTLCommandEncoder initWithCommandBuffer:](&v7, sel_initWithCommandBuffer_);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(a3, "getCurrentKernelCommandBufferPointer:end:", &v4->_kernelCommandBufferCurrent, &v4->_kernelCommandBufferEnd);
    objc_msgSend(a3, "beginSegment:", v5->_kernelCommandBufferCurrent);
    v5->_resourceList = (IOAccelResourceList *)objc_msgSend(a3, "ioAccelResourceList");
    v5->_api_resourceList = (MTLResourceList *)objc_msgSend(a3, "akResourceList");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  self->_kernelCommandBufferEnd = 0;
  self->_kernelCommandBufferCurrent = 0;
  self->_resourceList = 0;
  self->_api_resourceList = 0;
  v2.receiver = self;
  v2.super_class = (Class)MTLIOAccelDebugCommandEncoder;
  -[_MTLCommandEncoder dealloc](&v2, sel_dealloc);
}

- (void)reserveKernelCommandBufferSpace:(unint64_t)a3
{
  void **p_kernelCommandBufferEnd;
  void **p_kernelCommandBufferCurrent;
  char *kernelCommandBufferCurrent;
  MTLCommandBuffer *commandBuffer;

  p_kernelCommandBufferEnd = &self->_kernelCommandBufferEnd;
  p_kernelCommandBufferCurrent = &self->_kernelCommandBufferCurrent;
  kernelCommandBufferCurrent = (char *)self->_kernelCommandBufferCurrent;
  if ((char *)self->_kernelCommandBufferEnd - (char *)kernelCommandBufferCurrent < a3)
  {
    commandBuffer = self->super.super._commandBuffer;
    -[MTLCommandBuffer growKernelCommandBuffer:](commandBuffer, "growKernelCommandBuffer:", a3);
    -[MTLCommandBuffer getCurrentKernelCommandBufferPointer:end:](commandBuffer, "getCurrentKernelCommandBufferPointer:end:", p_kernelCommandBufferCurrent, p_kernelCommandBufferEnd);
    kernelCommandBufferCurrent = (char *)*p_kernelCommandBufferCurrent;
  }
  *p_kernelCommandBufferCurrent = &kernelCommandBufferCurrent[a3];
  return kernelCommandBufferCurrent;
}

- (void)restartDebugPass
{
  MTLCommandBuffer *commandBuffer;

  commandBuffer = self->super.super._commandBuffer;
  -[MTLCommandBuffer setCurrentKernelCommandBufferPointer:](commandBuffer, "setCurrentKernelCommandBufferPointer:", self->_kernelCommandBufferCurrent);
  -[MTLCommandBuffer endCurrentSegment](commandBuffer, "endCurrentSegment");
  -[MTLCommandBuffer beginSegment:](commandBuffer, "beginSegment:", self->_kernelCommandBufferCurrent);
}

- (void)endEncoding
{
  MTLCommandBuffer *commandBuffer;
  objc_super v4;

  commandBuffer = self->super.super._commandBuffer;
  -[MTLCommandBuffer setCurrentKernelCommandBufferPointer:](commandBuffer, "setCurrentKernelCommandBufferPointer:", self->_kernelCommandBufferCurrent);
  -[MTLCommandBuffer endCurrentSegment](commandBuffer, "endCurrentSegment");
  self->_kernelCommandBufferEnd = 0;
  self->_kernelCommandBufferCurrent = 0;
  self->_resourceList = 0;
  self->_api_resourceList = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTLIOAccelDebugCommandEncoder;
  -[_MTLCommandEncoder endEncoding](&v4, sel_endEncoding);
}

- (unsigned)addDebugResourceListInfo:(IOAccelResourceInfo *)a3 flag:(unsigned int)a4
{
  unsigned int result;

  result = IOAccelResourceListAddResource();
  if (!self->_resourceList->var2)
  {
    -[MTLIOAccelDebugCommandEncoder restartDebugPass](self, "restartDebugPass");
    return IOAccelResourceListAddResource();
  }
  return result;
}

- (void)debugBytes:(const char *)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v8;
  _DWORD *v9;

  v8 = (a4 + 19) & 0xFFFFFFFC;
  v9 = -[MTLIOAccelDebugCommandEncoder reserveKernelCommandBufferSpace:](self, "reserveKernelCommandBufferSpace:", (a4 + 19) & 0xFFFFFFFFFFFFFFFCLL);
  *v9 = 0;
  v9[1] = v8;
  v9[2] = a5;
  v9[3] = a4;
  memcpy(v9 + 4, a3, a4);
}

- (void)debugResourceBytes:(unsigned int)a3 length:(unint64_t)a4 output_type:(unsigned int)a5
{
  int v6;
  unsigned int v8;
  _DWORD *v9;
  _QWORD v10[3];

  v6 = a4;
  v10[2] = a3;
  v10[0] = 0;
  v10[1] = a4 & 0xFFFFFFFFFFFFFFLL;
  v8 = -[MTLIOAccelDebugCommandEncoder addDebugResourceListInfo:flag:](self, "addDebugResourceListInfo:flag:", v10, 16);
  v9 = -[MTLIOAccelDebugCommandEncoder reserveKernelCommandBufferSpace:](self, "reserveKernelCommandBufferSpace:", 24);
  *(_QWORD *)v9 = 0x1800000001;
  v9[2] = a5;
  v9[3] = v6;
  v9[4] = v8;
  v9[5] = 0;
  -[MTLIOAccelDebugCommandEncoder restartDebugPass](self, "restartDebugPass");
}

- (void)addAPIResource:(id)a3
{
  MTLResourceList *api_resourceList;

  api_resourceList = self->_api_resourceList;
  if (api_resourceList)
    MTLResourceListAddResource((int32x2_t *)api_resourceList, (uint64_t)a3);
}

- (void)kprintfBytes:(const char *)a3 length:(unint64_t)a4
{
  -[MTLIOAccelDebugCommandEncoder debugBytes:length:output_type:](self, "debugBytes:length:output_type:", a3, a4, 0);
}

- (void)IOLogBytes:(const char *)a3 length:(unint64_t)a4
{
  -[MTLIOAccelDebugCommandEncoder debugBytes:length:output_type:](self, "debugBytes:length:output_type:", a3, a4, 1);
}

- (void)kprintfResource:(unsigned int)a3 length:(unsigned int)a4
{
  -[MTLIOAccelDebugCommandEncoder debugResourceBytes:length:output_type:](self, "debugResourceBytes:length:output_type:", *(_QWORD *)&a3, a4, 0);
}

- (void)IOLogResource:(unsigned int)a3 length:(unsigned int)a4
{
  -[MTLIOAccelDebugCommandEncoder debugResourceBytes:length:output_type:](self, "debugResourceBytes:length:output_type:", *(_QWORD *)&a3, a4, 1);
}

@end
