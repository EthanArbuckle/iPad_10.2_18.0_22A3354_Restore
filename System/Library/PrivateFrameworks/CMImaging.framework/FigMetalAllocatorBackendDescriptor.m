@implementation FigMetalAllocatorBackendDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalBuffer, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (unint64_t)resourceOptions
{
  return self->_resourceOptions;
}

- (BOOL)wireMemory
{
  return self->_wireMemory;
}

- (unint64_t)memoryPoolId
{
  return self->_memoryPoolId;
}

- (NSString)label
{
  return self->_label;
}

- (MTLBuffer)externalBuffer
{
  return self->_externalBuffer;
}

- (void)setWireMemory:(BOOL)a3
{
  self->_wireMemory = a3;
}

- (void)setResourceOptions:(unint64_t)a3
{
  self->_resourceOptions = a3;
}

- (void)setMemSize:(unint64_t)a3
{
  self->_memSize = a3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void)setExternalBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_externalBuffer, a3);
}

- (FigMetalAllocatorBackendDescriptor)init
{
  FigMetalAllocatorBackendDescriptor *v2;
  FigMetalAllocatorBackendDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigMetalAllocatorBackendDescriptor;
  v2 = -[FigMetalAllocatorBackendDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_memSize = 0;
    v2->_wireMemory = 0;
    if (getDefaultStorageMode_once != -1)
      dispatch_once(&getDefaultStorageMode_once, &__block_literal_global_6);
    v3->_resourceOptions = (16 * (getDefaultStorageMode_defaultStorageMode & 0xF)) | 0x200;
  }
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: %@: %lu (%lu MB) wireMemory:%d"), objc_opt_class(), self, self->_label, self->_memSize, self->_memSize >> 20, self->_wireMemory);
}

- (void)setMemoryPoolId:(unint64_t)a3
{
  self->_memoryPoolId = a3;
}

@end
