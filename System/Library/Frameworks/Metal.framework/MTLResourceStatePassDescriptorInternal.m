@implementation MTLResourceStatePassDescriptorInternal

+ (id)resourceStatePassDescriptor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (MTLResourceStatePassDescriptorInternal)init
{
  MTLResourceStatePassDescriptorInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLResourceStatePassDescriptorInternal;
  v2 = -[MTLResourceStatePassDescriptorInternal init](&v4, sel_init);
  if (v2)
    v2->_private.sampleBufferAttachments = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLResourceStatePassDescriptorInternal;
  -[MTLResourceStatePassDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *v5;

  v3 = 0;
  v4 = 0;
  do
  {
    v5 = self->_private.sampleBufferAttachments->_sampleDescriptors[v3];
    if (v5)
      v4 ^= (unint64_t)_MTLHashState((int *)&v5->_private, 0x18uLL) << v3;
    ++v3;
  }
  while (v3 != 4);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  uint64_t v7;
  MTLResourceStatePassDescriptorPrivate *p_private;
  MTLResourceStatePassDescriptorPrivate *v9;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *v10;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *v11;
  BOOL v12;
  BOOL v13;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *v14;
  MTLResourceStatePassDescriptorPrivate *v15;
  BOOL v16;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v7 = 0;
  p_private = &self->_private;
  v9 = (MTLResourceStatePassDescriptorPrivate *)((char *)a3 + 8);
  do
  {
    v10 = p_private->sampleBufferAttachments->_sampleDescriptors[v7];
    v11 = v9->sampleBufferAttachments->_sampleDescriptors[v7];
    if (v10 == v11)
      goto LABEL_25;
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 0;
    if (v12)
    {
      v14 = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorInternal);
      v15 = v9;
      v11 = v14;
      goto LABEL_17;
    }
    if (v10)
      v13 = 1;
    else
      v13 = v11 == 0;
    if (!v13)
    {
      v14 = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorInternal);
      v15 = p_private;
      v10 = v14;
LABEL_17:
      v15->sampleBufferAttachments->_sampleDescriptors[v7] = v14;
    }
    if (v11)
      v16 = v10 == 0;
    else
      v16 = 1;
    if (v16
      || v10->_private.sampleBuffer != v11->_private.sampleBuffer
      || v10->_private.startOfEncoderSampleIndex != v11->_private.startOfEncoderSampleIndex
      || v10->_private.endOfEncoderSampleIndex != v11->_private.endOfEncoderSampleIndex)
    {
      return 0;
    }
LABEL_25:
    ++v7;
  }
  while (v7 != 4);
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t i;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  for (i = 0; i != 4; ++i)
  {
    v7 = self->_private.sampleBufferAttachments->_sampleDescriptors[i];
    if (v7)
      *(_QWORD *)(v5[1] + 8 + i * 8) = -[MTLResourceStatePassSampleBufferAttachmentDescriptorInternal copyWithZone:](v7, "copyWithZone:", a3);
  }
  return v5;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)sampleBufferAttachments
{
  return self->_private.sampleBufferAttachments;
}

@end
