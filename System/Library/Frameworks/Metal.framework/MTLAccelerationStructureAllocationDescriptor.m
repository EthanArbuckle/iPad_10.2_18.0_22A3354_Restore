@implementation MTLAccelerationStructureAllocationDescriptor

- (MTLAccelerationStructureAllocationDescriptor)init
{
  MTLAccelerationStructureAllocationDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureAllocationDescriptor;
  result = -[MTLAccelerationStructureAllocationDescriptor init](&v3, sel_init);
  if (result)
    result->_storageMode = 2;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setStorageMode:", self->_storageMode);
  objc_msgSend(v4, "setForceResourceIndex:", self->_forceResourceIndex);
  objc_msgSend(v4, "setResourceIndex:", self->_resourceIndex);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  unint64_t v6;
  int v7;
  unint64_t v9;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v6 = -[MTLAccelerationStructureAllocationDescriptor storageMode](self, "storageMode");
  if (v6 != objc_msgSend(a3, "storageMode"))
    return 0;
  v7 = -[MTLAccelerationStructureAllocationDescriptor forceResourceIndex](self, "forceResourceIndex");
  if (v7 != objc_msgSend(a3, "forceResourceIndex"))
    return 0;
  v9 = -[MTLAccelerationStructureAllocationDescriptor resourceIndex](self, "resourceIndex");
  return v9 == objc_msgSend(a3, "resourceIndex");
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = -[MTLAccelerationStructureAllocationDescriptor storageMode](self, "storageMode");
  v4[1] = -[MTLAccelerationStructureAllocationDescriptor forceResourceIndex](self, "forceResourceIndex");
  v4[2] = -[MTLAccelerationStructureAllocationDescriptor resourceIndex](self, "resourceIndex");
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (BOOL)forceResourceIndex
{
  return self->_forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_forceResourceIndex = a3;
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_resourceIndex = a3;
}

@end
