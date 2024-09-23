@implementation MTLIndirectCommandBufferDescriptor

- (MTLIndirectCommandType)commandTypes
{
  return self->_state.commandTypes;
}

- (void)setCommandTypes:(MTLIndirectCommandType)commandTypes
{
  self->_state.commandTypes = commandTypes;
}

- (BOOL)inheritPipelineState
{
  return self->_state.inheritPipelineState;
}

- (void)setInheritPipelineState:(BOOL)inheritPipelineState
{
  self->_state.inheritPipelineState = inheritPipelineState;
}

- (BOOL)inheritBuffers
{
  return self->_state.inheritBuffers;
}

- (void)setInheritBuffers:(BOOL)inheritBuffers
{
  self->_state.inheritBuffers = inheritBuffers;
}

- (NSUInteger)maxVertexBufferBindCount
{
  return self->_state.maxVertexBufferBindCount;
}

- (void)setMaxVertexBufferBindCount:(NSUInteger)maxVertexBufferBindCount
{
  self->_state.maxVertexBufferBindCount = maxVertexBufferBindCount;
}

- (NSUInteger)maxFragmentBufferBindCount
{
  return self->_state.maxFragmentBufferBindCount;
}

- (void)setMaxFragmentBufferBindCount:(NSUInteger)maxFragmentBufferBindCount
{
  self->_state.maxFragmentBufferBindCount = maxFragmentBufferBindCount;
}

- (NSUInteger)maxKernelBufferBindCount
{
  return self->_state.maxKernelBufferBindCount;
}

- (void)setMaxKernelBufferBindCount:(NSUInteger)maxKernelBufferBindCount
{
  self->_state.maxKernelBufferBindCount = maxKernelBufferBindCount;
}

- (NSUInteger)maxKernelThreadgroupMemoryBindCount
{
  return self->_state.maxKernelThreadgroupMemoryBindCount;
}

- (void)setMaxKernelThreadgroupMemoryBindCount:(NSUInteger)maxKernelThreadgroupMemoryBindCount
{
  self->_state.maxKernelThreadgroupMemoryBindCount = maxKernelThreadgroupMemoryBindCount;
}

- (NSUInteger)maxObjectBufferBindCount
{
  return self->_state.maxObjectBufferBindCount;
}

- (void)setMaxObjectBufferBindCount:(NSUInteger)maxObjectBufferBindCount
{
  self->_state.maxObjectBufferBindCount = maxObjectBufferBindCount;
}

- (NSUInteger)maxMeshBufferBindCount
{
  return self->_state.maxMeshBufferBindCount;
}

- (void)setMaxMeshBufferBindCount:(NSUInteger)maxMeshBufferBindCount
{
  self->_state.maxMeshBufferBindCount = maxMeshBufferBindCount;
}

- (NSUInteger)maxObjectThreadgroupMemoryBindCount
{
  return self->_state.maxObjectThreadgroupMemoryBindCount;
}

- (void)setMaxObjectThreadgroupMemoryBindCount:(NSUInteger)maxObjectThreadgroupMemoryBindCount
{
  self->_state.maxObjectThreadgroupMemoryBindCount = maxObjectThreadgroupMemoryBindCount;
}

- (BOOL)supportRayTracing
{
  return self->_state.supportRayTracing;
}

- (void)setSupportRayTracing:(BOOL)supportRayTracing
{
  self->_state.supportRayTracing = supportRayTracing;
}

- (BOOL)supportDynamicAttributeStride
{
  return self->_state.supportDynamicAttributeStride;
}

- (void)setSupportDynamicAttributeStride:(BOOL)supportDynamicAttributeStride
{
  self->_state.supportDynamicAttributeStride = supportDynamicAttributeStride;
}

- (unint64_t)resourceIndex
{
  return self->_state.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_state.resourceIndex = a3;
}

- (MTLIndirectCommandBufferDescriptor)init
{
  MTLIndirectCommandBufferDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectCommandBufferDescriptor;
  result = -[MTLIndirectCommandBufferDescriptor init](&v3, sel_init);
  result->_state.inheritPipelineState = 0;
  result->_state.maxKernelThreadgroupMemoryBindCount = 31;
  result->_state.maxObjectThreadgroupMemoryBindCount = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  result = -[MTLIndirectCommandBufferDescriptor init](+[MTLIndirectCommandBufferDescriptor allocWithZone:](MTLIndirectCommandBufferDescriptor, "allocWithZone:", a3), "init");
  if (result)
  {
    v5 = *(_OWORD *)&self->_state.commandTypes;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_state.maxVertexBufferBindCount;
    *(_OWORD *)((char *)result + 8) = v5;
    v6 = *(_OWORD *)&self->_state.maxKernelBufferBindCount;
    v7 = *(_OWORD *)&self->_state.maxObjectBufferBindCount;
    v8 = *(_OWORD *)&self->_state.maxObjectThreadgroupMemoryBindCount;
    *((_QWORD *)result + 11) = self->_state.resourceIndex;
    *(_OWORD *)((char *)result + 72) = v8;
    *(_OWORD *)((char *)result + 56) = v7;
    *(_OWORD *)((char *)result + 40) = v6;
  }
  return result;
}

- (unint64_t)hash
{
  return _MTLHashState((int *)&self->_state, 0x58uLL);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3) && memcmp(&self->_state, (char *)a3 + 8, 0x58uLL) == 0;
}

@end
