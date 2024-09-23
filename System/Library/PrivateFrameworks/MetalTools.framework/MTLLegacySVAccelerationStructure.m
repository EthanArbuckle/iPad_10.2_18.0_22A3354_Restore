@implementation MTLLegacySVAccelerationStructure

- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4
{
  MTLLegacySVAccelerationStructure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructure;
  v4 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:](&v6, sel_initWithBaseObject_parent_, a3, a4);
  v4->_accelerationStructureType = 0;
  -[MTLLegacySVAccelerationStructure _setupIdentifier](v4, "_setupIdentifier");
  return v4;
}

- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 heap:(id)a4
{
  MTLLegacySVAccelerationStructure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVAccelerationStructure;
  v4 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:heap:](&v6, sel_initWithBaseObject_parent_heap_, a3, a4, a4);
  v4->_accelerationStructureType = 0;
  -[MTLLegacySVAccelerationStructure _setupIdentifier](v4, "_setupIdentifier");
  return v4;
}

- (MTLLegacySVAccelerationStructure)initWithAccelerationStructure:(id)a3 device:(id)a4 type:(unint64_t)a5
{
  MTLLegacySVAccelerationStructure *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVAccelerationStructure;
  v6 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:](&v8, sel_initWithBaseObject_parent_, a3, a4);
  v6->_accelerationStructureType = a5;
  -[MTLLegacySVAccelerationStructure _setupIdentifier](v6, "_setupIdentifier");
  return v6;
}

- (void)_setupIdentifier
{
  uint64_t v3;
  uint64_t v4;
  MTLToolsObjectCache **p_functionObjectCache;
  unint64_t accelerationStructureHandle;
  MTLToolsObjectCache *v7;
  MTLBuffer *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t accelerationStructureType;

  self->_accelerationStructureHandle = LegacySVBufferDescriptorHeap::createHandle((std::mutex *)&self->super.super.super._device[2].functionObjectCache, (MTLLegacySVBuffer *)self);
  v3 = -[MTLToolsObject buffer](self->super.super.super._baseObject, "buffer");
  v4 = -[MTLToolsObject bufferOffset](self->super.super.super._baseObject, "bufferOffset");
  p_functionObjectCache = &self->super.super.super._device[2].functionObjectCache;
  accelerationStructureHandle = self->_accelerationStructureHandle;
  std::mutex::lock((std::mutex *)p_functionObjectCache);
  -[MTLToolsObjectCache setArgumentBuffer:offset:](p_functionObjectCache[15], "setArgumentBuffer:offset:", p_functionObjectCache[16], -[MTLToolsObjectCache encodedLength](p_functionObjectCache[15], "encodedLength") * accelerationStructureHandle);
  v7 = p_functionObjectCache[15];
  -[MTLToolsObjectCache setBuffer:offset:atIndex:](v7, "setBuffer:offset:atIndex:", v3, v4, 0);
  *(_DWORD *)-[MTLToolsObjectCache constantDataAtIndex:](v7, "constantDataAtIndex:", 1) = -1;
  std::mutex::unlock((std::mutex *)p_functionObjectCache);
  v8 = (MTLBuffer *)-[MTLToolsDevice newInternalBufferWithLength:options:](self->super.super.super._device, "newInternalBufferWithLength:options:", 32, 0);
  self->_debugBuf = v8;
  v9 = (uint64_t *)-[MTLBuffer contents](v8, "contents");
  *v9 = MTLLegacySVBufferHandleToOffset(self->_accelerationStructureHandle);
  v10 = -[MTLToolsObject gpuResourceID](self->super.super.super._baseObject, "gpuResourceID");
  accelerationStructureType = self->_accelerationStructureType;
  v9[1] = v10;
  v9[2] = accelerationStructureType;
  v9[3] = 0;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return -[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress", a3);
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)gpuAddress
{
  return -[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)-[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress");
}

- (unint64_t)underlyingGPUAddress
{
  return -[MTLBuffer gpuAddress](self->_debugBuf, "gpuAddress");
}

- (id)debugBuf
{
  return self->_debugBuf;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
  objc_msgSend(a3, "useResourceInternal:usage:", self->_debugBuf, 1);
  if ((*(uint64_t *)((_BYTE *)&self->super.super.super._device[2].dynamicLibraryObjectCache + 4) & 0x200000001) != 0)
    objc_msgSend((id)objc_msgSend(a3, "commandBuffer"), "markAccelerationStructure:usage:stages:", self, 1, 3);
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
  BOOL var1;
  unint64_t v6;
  void *v9;
  uint64_t v10;

  var1 = a5.var1;
  v6 = a5.var0.var1;
  objc_msgSend(a3, "useResourceInternal:usage:stages:", self->_debugBuf, 1);
  if ((*(uint64_t *)((_BYTE *)&self->super.super.super._device[2].dynamicLibraryObjectCache + 4) & 0x200000001) != 0)
  {
    v9 = (void *)objc_msgSend(a3, "commandBuffer");
    if (var1)
      v10 = v6;
    else
      v10 = 3;
    objc_msgSend(v9, "markAccelerationStructure:usage:stages:", self, 1, v10);
  }
}

- (void)dealloc
{
  objc_super v3;

  LegacySVBufferDescriptorHeap::freeBufferHandle((std::mutex *)&self->super.super.super._device[2].functionObjectCache, self->_accelerationStructureHandle);

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVAccelerationStructure;
  -[MTLToolsAccelerationStructure dealloc](&v3, sel_dealloc);
}

- (unint64_t)accelerationStructureHandle
{
  return self->_accelerationStructureHandle;
}

- (MTLBuffer)childrenWrappersBuffer
{
  return self->_childrenWrappersBuffer;
}

- (void)setChildrenWrappersBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
