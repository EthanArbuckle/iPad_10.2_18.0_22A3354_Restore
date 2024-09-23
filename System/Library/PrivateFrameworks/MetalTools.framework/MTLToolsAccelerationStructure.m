@implementation MTLToolsAccelerationStructure

- (unint64_t)size
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "size");
}

- (unint64_t)bufferOffset
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bufferOffset");
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (unint64_t)accelerationStructureUniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "accelerationStructureUniqueIdentifier");
}

- (MTLAccelerationStructureDescriptor)descriptor
{
  return (MTLAccelerationStructureDescriptor *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "descriptor");
}

- (void)setDescriptor:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDescriptor:", a3);
}

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unint64_t)gpuHandle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

- (MTLBuffer)buffer
{
  return (MTLBuffer *)self->_toolsBuffer;
}

- (MTLToolsAccelerationStructure)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsAccelerationStructure *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLToolsAccelerationStructure;
  v6 = -[MTLToolsResource initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_);
  if (v6)
  {
    v7 = objc_msgSend(a3, "buffer");
    if (v7)
      v6->_toolsBuffer = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", v7, a4);
  }
  return v6;
}

- (MTLToolsAccelerationStructure)initWithBaseObject:(id)a3 parent:(id)a4 heap:(id)a5
{
  MTLToolsAccelerationStructure *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTLToolsAccelerationStructure;
  v7 = -[MTLToolsResource initWithBaseObject:parent:heap:](&v10, sel_initWithBaseObject_parent_heap_, a3, a4, a5);
  if (v7)
  {
    v8 = objc_msgSend(a3, "buffer");
    if (v8)
      v7->_toolsBuffer = -[MTLToolsResource initWithBaseObject:parent:]([MTLToolsBuffer alloc], "initWithBaseObject:parent:", v8, a4);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsAccelerationStructure;
  -[MTLToolsResource dealloc](&v3, sel_dealloc);
}

@end
