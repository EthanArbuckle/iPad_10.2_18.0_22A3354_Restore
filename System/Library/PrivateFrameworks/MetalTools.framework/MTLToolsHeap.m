@implementation MTLToolsHeap

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (unint64_t)cpuCacheMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "cpuCacheMode");
}

- (unint64_t)storageMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "storageMode");
}

- (unint64_t)hazardTrackingMode
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "hazardTrackingMode");
}

- (unint64_t)resourceOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceOptions");
}

- (unint64_t)unfilteredResourceOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "unfilteredResourceOptions");
}

- (unint64_t)size
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
}

- (id)formattedDescription:(unint64_t)a3
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "formattedDescription:", a3);
}

- (unint64_t)usedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "usedSize");
}

- (unint64_t)maxAvailableSizeWithAlignment:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "maxAvailableSizeWithAlignment:", a3);
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPurgeableState:", a3);
}

- (unint64_t)allocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "allocatedSize");
}

- (unint64_t)currentAllocatedSize
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "currentAllocatedSize");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (int64_t)type
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "type");
}

- (unint64_t)protectionOptions
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "protectionOptions");
}

- (unint64_t)memoryPoolId
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryPoolId");
}

- (id)_newToolsBuffer:(id)a3
{
  MTLToolsBuffer *v4;

  if (!a3)
    return 0;
  v4 = -[MTLToolsResource initWithBaseObject:parent:heap:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:heap:", a3, self, self);

  return v4;
}

- (id)_newToolsTexture:(id)a3
{
  MTLToolsTexture *v4;

  if (!a3)
    return 0;
  v4 = -[MTLToolsResource initWithBaseObject:parent:heap:]([MTLToolsTexture alloc], "initWithBaseObject:parent:heap:", a3, self, self);

  return v4;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  return -[MTLToolsHeap _newToolsBuffer:](self, "_newToolsBuffer:", -[MTLToolsObject newBufferWithLength:options:](self->super._baseObject, "newBufferWithLength:options:", a3, a4));
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 offset:(unint64_t)a5
{
  return -[MTLToolsHeap _newToolsBuffer:](self, "_newToolsBuffer:", -[MTLToolsObject newBufferWithLength:options:offset:](self->super._baseObject, "newBufferWithLength:options:offset:", a3, a4, a5));
}

- (id)newTextureWithDescriptor:(id)a3
{
  return -[MTLToolsHeap _newToolsTexture:](self, "_newToolsTexture:", -[MTLToolsObject newTextureWithDescriptor:](self->super._baseObject, "newTextureWithDescriptor:", a3));
}

- (id)newTextureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  return -[MTLToolsHeap _newToolsTexture:](self, "_newToolsTexture:", -[MTLToolsObject newTextureWithDescriptor:offset:](self->super._baseObject, "newTextureWithDescriptor:offset:", a3, a4));
}

- (id)_newToolsAccelerationStructure:(id)a3
{
  MTLToolsAccelerationStructure *v4;

  if (!a3)
    return 0;
  v4 = -[MTLToolsAccelerationStructure initWithBaseObject:parent:heap:]([MTLToolsAccelerationStructure alloc], "initWithBaseObject:parent:heap:", a3, self, self);

  return v4;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return -[MTLToolsHeap _newToolsAccelerationStructure:](self, "_newToolsAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:](self->super._baseObject, "newAccelerationStructureWithSize:", a3));
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  return -[MTLToolsHeap _newToolsAccelerationStructure:](self, "_newToolsAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithDescriptor:](self->super._baseObject, "newAccelerationStructureWithDescriptor:", unwrapAccelerationStructureDescriptor(a3)));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4
{
  return -[MTLToolsHeap _newToolsAccelerationStructure:](self, "_newToolsAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:offset:](self->super._baseObject, "newAccelerationStructureWithSize:offset:", a3, a4));
}

- (id)newAccelerationStructureWithDescriptor:(id)a3 offset:(unint64_t)a4
{
  return -[MTLToolsHeap _newToolsAccelerationStructure:](self, "_newToolsAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithDescriptor:offset:](self->super._baseObject, "newAccelerationStructureWithDescriptor:offset:", unwrapAccelerationStructureDescriptor(a3), a4));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  return -[MTLToolsHeap _newToolsAccelerationStructure:](self, "_newToolsAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:resourceIndex:](self->super._baseObject, "newAccelerationStructureWithSize:resourceIndex:", a3, a4));
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return -[MTLToolsHeap _newToolsAccelerationStructure:](self, "_newToolsAccelerationStructure:", -[MTLToolsObject newAccelerationStructureWithSize:offset:resourceIndex:](self->super._baseObject, "newAccelerationStructureWithSize:offset:resourceIndex:", a3, a4, a5));
}

- (BOOL)detachBacking
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "detachBacking");
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "replaceBackingWithRanges:readOnly:", a3, a4);
}

@end
