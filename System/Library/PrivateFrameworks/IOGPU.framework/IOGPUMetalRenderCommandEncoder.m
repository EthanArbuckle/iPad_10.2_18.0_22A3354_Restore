@implementation IOGPUMetalRenderCommandEncoder

- (unint64_t)getType
{
  return 0;
}

- (IOGPUMetalRenderCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalRenderCommandEncoder;
  return -[IOGPUMetalCommandEncoder initWithCommandBuffer:](&v5, sel_initWithCommandBuffer_, a3, a4);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)textureBarrier
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (BOOL)isMemorylessRender
{
  return 0;
}

- (void)getVertexBufferContentsAtIndex:(unint64_t)a3
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)getFragmentBufferContentsAtIndex:(unint64_t)a3
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)getRenderPipelineState
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  if (a4)
  {
    v9 = a4;
    v11 = 0;
    do
    {
      ++a3;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = 2;
      else
        v12 = 1;
      v11 |= v12;
      --v9;
    }
    while (v9);
  }
  else
  {
    v11 = 0;
  }
  -[IOGPUMetalRenderCommandEncoder memoryBarrierWithScope:afterStages:beforeStages:](self, "memoryBarrierWithScope:afterStages:beforeStages:", v11, a5, a6);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalRenderCommandEncoder setVertexVisibleFunctionTable:atBufferIndex:](self, "setVertexVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalRenderCommandEncoder setVertexVisibleFunctionTables:withBufferRange:](self, "setVertexVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalRenderCommandEncoder setFragmentVisibleFunctionTable:atBufferIndex:](self, "setFragmentVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalRenderCommandEncoder setFragmentVisibleFunctionTables:withBufferRange:](self, "setFragmentVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalRenderCommandEncoder setTileVisibleFunctionTable:atBufferIndex:](self, "setTileVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[IOGPUMetalRenderCommandEncoder setTileVisibleFunctionTables:withBufferRange:](self, "setTileVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLCommandEncoder setObjectVisibleFunctionTable:atBufferIndex:](self, "setObjectVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[_MTLCommandEncoder setObjectVisibleFunctionTables:withBufferRange:](self, "setObjectVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLCommandEncoder setMeshVisibleFunctionTable:atBufferIndex:](self, "setMeshVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[_MTLCommandEncoder setMeshVisibleFunctionTables:withBufferRange:](self, "setMeshVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalRenderCommandEncoder setVertexBuffer:offset:atIndex:](self, "setVertexBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalRenderCommandEncoder setFragmentBuffer:offset:atIndex:](self, "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[IOGPUMetalRenderCommandEncoder setTileBuffer:offset:atIndex:](self, "setTileBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLCommandEncoder setObjectBuffer:offset:atIndex:](self, "setObjectBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLCommandEncoder setMeshBuffer:offset:atIndex:](self, "setMeshBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[IOGPUMetalRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

@end
