@implementation FigMetalAllocatorDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalBuffer, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setWireMemory:(BOOL)a3
{
  self->_wireMemory = a3;
}

- (void)setMemSize:(unint64_t)a3
{
  self->_memSize = a3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (unint64_t)memSize
{
  return self->_memSize;
}

- (unint64_t)resourceOptions
{
  return self->_resourceOptions;
}

- (NSString)label
{
  return self->_label;
}

- (MTLBuffer)externalBuffer
{
  return self->_externalBuffer;
}

- (BOOL)wireMemory
{
  return self->_wireMemory;
}

- (int)compressionLevel
{
  return self->_compressionLevel;
}

- (BOOL)autoUseSubAllocators
{
  return self->_autoUseSubAllocators;
}

- (BOOL)allowFallback
{
  return self->_allowFallback;
}

- (int)allocationHint
{
  return self->_allocationHint;
}

- (void)setResourceOptions:(unint64_t)a3
{
  self->_resourceOptions = a3;
}

- (FigMetalAllocatorDescriptor)init
{
  char *v2;
  FigMetalAllocatorDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigMetalAllocatorDescriptor;
  v2 = -[FigMetalAllocatorDescriptor init](&v5, sel_init);
  v3 = (FigMetalAllocatorDescriptor *)v2;
  if (v2)
  {
    *((_QWORD *)v2 + 4) = 0;
    *((_WORD *)v2 + 4) = 0;
    v2[10] = 0;
    *(_QWORD *)(v2 + 12) = 0xFFFFFFFFLL;
    if (getDefaultStorageMode_once != -1)
      dispatch_once(&getDefaultStorageMode_once, &__block_literal_global_6);
    v3->_resourceOptions = (16 * (getDefaultStorageMode_defaultStorageMode & 0xF)) | 0x200;
  }
  return v3;
}

- (void)setCompressionLevel:(int)a3
{
  self->_compressionLevel = a3;
}

- (void)setAutoUseSubAllocators:(BOOL)a3
{
  self->_autoUseSubAllocators = a3;
}

- (void)setAllowFallback:(BOOL)a3
{
  self->_allowFallback = a3;
}

- (void)setAllocationHint:(int)a3
{
  self->_allocationHint = a3;
}

- (void)setExternalBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_externalBuffer, a3);
}

@end
