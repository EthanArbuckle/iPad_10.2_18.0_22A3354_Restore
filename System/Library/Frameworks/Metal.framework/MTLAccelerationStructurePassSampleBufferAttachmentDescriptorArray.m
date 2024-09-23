@implementation MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray

- (void)dealloc
{
  uint64_t i;
  objc_super v4;

  for (i = 8; i != 40; i += 8)

  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray;
  -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray dealloc](&v4, sel_dealloc);
}

- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Class *v9;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *result;
  unint64_t *v11;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *v12;

  if (attachmentIndex >= 4)
    MTLReportFailure(0, "-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]", 756, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v3, v4, v5, v6, attachmentIndex);
  v9 = &self->super.isa + attachmentIndex;
  v12 = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v9[1];
  v11 = (unint64_t *)(v9 + 1);
  result = v12;
  if (!v12)
  {
    result = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
    while (!__ldaxr(v11))
    {
      if (!__stlxr((unint64_t)result, v11))
      {
        *v11 = (unint64_t)result;
        return result;
      }
    }
    __clrex();

    return (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)*v11;
  }
  return result;
}

- (void)setObject:(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)attachment atIndexedSubscript:(NSUInteger)attachmentIndex
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor **sampleDescriptors;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *v12;

  if (attachmentIndex >= 4)
    MTLReportFailure(0, "-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]", 772, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v4, v5, v6, v7, attachmentIndex);
  sampleDescriptors = self->_sampleDescriptors;
  if (sampleDescriptors[attachmentIndex] != attachment)
  {
    v12 = sampleDescriptors[attachmentIndex];
    sampleDescriptors[attachmentIndex] = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor copy](attachment, "copy");

  }
}

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_sampleDescriptors[a3];
}

- (void)copyFrom:(id)a3 withZone:(_NSZone *)a4
{
  uint64_t v6;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor **sampleDescriptors;

  v6 = 0;
  sampleDescriptors = self->_sampleDescriptors;
  do
  {
    sampleDescriptors[v6] = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)objc_msgSend((id)objc_msgSend(a3, "_descriptorAtIndex:", v6), "copyWithZone:", a4);
    ++v6;
  }
  while (v6 != 4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v5, "copyFrom:withZone:", self, a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *Class;
  _BOOL4 v14;
  uint64_t v15;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor **sampleDescriptors;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *v17;
  uint64_t v18;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *v19;
  BOOL v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a3 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    v23 = v8;
    v24 = v7;
    v25 = v6;
    v26 = v5;
    v27 = v4;
    v28 = v3;
    v29 = v9;
    v30 = v10;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v15 = 0;
      sampleDescriptors = self->_sampleDescriptors;
      do
      {
        v17 = sampleDescriptors[v15];
        v18 = objc_msgSend(a3, "objectAtIndexedSubscript:", v15, v23, v24, v25, v26, v27, v28, v29, v30);
        if (v17 != (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v18)
        {
          v19 = (MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *)v18;
          if (v17)
            v20 = v18 == 0;
          else
            v20 = 0;
          if (v20)
          {
            v19 = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
            *((_QWORD *)a3 + v15 + 1) = v19;
          }
          else if (v18 && !v17)
          {
            v17 = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
            sampleDescriptors[v15] = v17;
          }
          if (v19)
            v21 = v17 == 0;
          else
            v21 = 1;
          if (v21)
            goto LABEL_3;
          v14 = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor isEqual:](v17, "isEqual:", v19);
          if (!v14)
            return v14;
        }
        ++v15;
      }
      while (v15 != 4);
      LOBYTE(v14) = 1;
    }
    else
    {
LABEL_3:
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor **sampleDescriptors;
  MTLAccelerationStructurePassSampleBufferAttachmentDescriptor *v5;

  v2 = 0;
  v3 = 0;
  sampleDescriptors = self->_sampleDescriptors;
  do
  {
    v5 = sampleDescriptors[v2];
    if (v5)
      v3 ^= -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor hash](v5, "hash") << v2;
    ++v2;
  }
  while (v2 != 4);
  return v3;
}

@end
