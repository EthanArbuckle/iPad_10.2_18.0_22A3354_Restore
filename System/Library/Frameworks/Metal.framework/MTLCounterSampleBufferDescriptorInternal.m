@implementation MTLCounterSampleBufferDescriptorInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCounterSampleBufferDescriptorInternal;
  -[MTLCounterSampleBufferDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTLCounterSampleBufferDescriptorInternal *v4;

  v4 = -[MTLCounterSampleBufferDescriptorInternal init](+[MTLCounterSampleBufferDescriptor allocWithZone:](MTLCounterSampleBufferDescriptorInternal, "allocWithZone:", a3), "init");
  -[MTLCounterSampleBufferDescriptorInternal setCounterSet:](v4, "setCounterSet:", self->_counterSet);
  -[MTLCounterSampleBufferDescriptorInternal setStorageMode:](v4, "setStorageMode:", self->_storageMode);
  -[MTLCounterSampleBufferDescriptorInternal setLabel:](v4, "setLabel:", self->_label);
  -[MTLCounterSampleBufferDescriptorInternal setSampleCount:](v4, "setSampleCount:", self->_sampleCount);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *Class;
  int v12;
  MTLCounterSet *counterSet;
  unint64_t storageMode;
  unint64_t sampleCount;
  NSString *label;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v18 = v6;
    v19 = v5;
    v20 = v4;
    v21 = v3;
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v12) = 0;
      return v12;
    }
    counterSet = self->_counterSet;
    if (counterSet == (MTLCounterSet *)objc_msgSend(a3, "counterSet")
      || (v12 = -[MTLCounterSet isEqual:](self->_counterSet, "isEqual:", objc_msgSend(a3, "counterSet"))) != 0)
    {
      storageMode = self->_storageMode;
      if (storageMode != objc_msgSend(a3, "storageMode", v18, v19, v20, v21, v7, v8))
        goto LABEL_3;
      sampleCount = self->_sampleCount;
      if (sampleCount != objc_msgSend(a3, "sampleCount"))
        goto LABEL_3;
      label = self->_label;
      if (label == (NSString *)objc_msgSend(a3, "label")
        || (v12 = -[NSString isEqual:](self->_label, "isEqual:", objc_msgSend(a3, "label"))) != 0)
      {
        LOBYTE(v12) = 1;
      }
    }
  }
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t storageMode;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = -[MTLCounterSet hash](self->_counterSet, "hash");
  v3 = -[NSString hash](self->_label, "hash");
  storageMode = self->_storageMode;
  v6[1] = v3;
  v6[2] = storageMode;
  v6[3] = self->_sampleCount;
  return _MTLHashState((int *)v6, 0x20uLL);
}

- (id)counterSet
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCounterSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (id)label
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (void)setSampleCount:(unint64_t)a3
{
  self->_sampleCount = a3;
}

@end
