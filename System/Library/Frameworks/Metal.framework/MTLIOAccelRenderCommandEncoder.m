@implementation MTLIOAccelRenderCommandEncoder

- (MTLIOAccelRenderCommandEncoder)initWithCommandBuffer:(id)a3 descriptor:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelRenderCommandEncoder;
  return -[MTLIOAccelCommandEncoder initWithCommandBuffer:](&v5, sel_initWithCommandBuffer_, a3, a4);
}

- (unint64_t)getType
{
  return 0;
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)textureBarrier
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (BOOL)isMemorylessRender
{
  return 0;
}

- (void)getVertexBufferContentsAtIndex:(unint64_t)a3
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)getFragmentBufferContentsAtIndex:(unint64_t)a3
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)getRenderPipelineState
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setEmulationVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
}

- (void)setEmulationFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
}

- (void)setEmulationVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setEmulationFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setEmulationVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setEmulationFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
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
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
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
  -[MTLIOAccelRenderCommandEncoder memoryBarrierWithScope:afterStages:beforeStages:](self, "memoryBarrierWithScope:afterStages:beforeStages:", v11, a5, a6);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[MTLIOAccelRenderCommandEncoder setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:]", 280, (uint64_t)CFSTR("%s is not supported on this device"), (uint64_t)a5, a6, v6, v7, (uint64_t)"-[MTLIOAccelRenderCommandEncoder setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:]");
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[MTLIOAccelRenderCommandEncoder setVertexVisibleFunctionTable:atBufferIndex:](self, "setVertexVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
  v12[1] = *MEMORY[0x1E0C80C00];
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
    -[MTLIOAccelRenderCommandEncoder setVertexVisibleFunctionTables:withBufferRange:](self, "setVertexVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[MTLIOAccelRenderCommandEncoder setFragmentVisibleFunctionTable:atBufferIndex:](self, "setFragmentVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
  v12[1] = *MEMORY[0x1E0C80C00];
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
    -[MTLIOAccelRenderCommandEncoder setFragmentVisibleFunctionTables:withBufferRange:](self, "setFragmentVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[MTLIOAccelRenderCommandEncoder setTileVisibleFunctionTable:atBufferIndex:](self, "setTileVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
  v12[1] = *MEMORY[0x1E0C80C00];
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
    -[MTLIOAccelRenderCommandEncoder setTileVisibleFunctionTables:withBufferRange:](self, "setTileVisibleFunctionTables:withBufferRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLCommandEncoder setObjectVisibleFunctionTable:atBufferIndex:](self, "setObjectVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
  v12[1] = *MEMORY[0x1E0C80C00];
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
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLCommandEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLCommandEncoder setMeshVisibleFunctionTable:atBufferIndex:](self, "setMeshVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
  v12[1] = *MEMORY[0x1E0C80C00];
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
    -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelRenderCommandEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

@end
