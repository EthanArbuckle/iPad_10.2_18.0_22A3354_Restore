@implementation MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal

- (void)dealloc
{
  uint64_t v3;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal **sampleDescriptors;
  objc_super v5;

  v3 = 0;
  sampleDescriptors = self->_sampleDescriptors;
  do

  while (v3 != 4);
  v5.receiver = self;
  v5.super_class = (Class)MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal;
  -[MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v9;
  id result;

  if (a3 >= 4)
    MTLReportFailure(0, "-[MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 188, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v3, v4, v5, v6, a3);
  v9 = (id *)&self->_sampleDescriptors[a3];
  result = *v9;
  if (!*v9)
  {
    result = objc_alloc_init(MTLResourceStatePassSampleBufferAttachmentDescriptorInternal);
    while (!__ldaxr((unint64_t *)v9))
    {
      if (!__stlxr((unint64_t)result, (unint64_t *)v9))
      {
        *v9 = result;
        return result;
      }
    }
    __clrex();

    return *v9;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal **sampleDescriptors;
  MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *v12;

  if (a4 >= 4)
    MTLReportFailure(0, "-[MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 204, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v4, v5, v6, v7, a4);
  sampleDescriptors = self->_sampleDescriptors;
  if (sampleDescriptors[a4] != a3)
  {
    v12 = sampleDescriptors[a4];
    sampleDescriptors[a4] = (MTLResourceStatePassSampleBufferAttachmentDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_sampleDescriptors[a3];
}

@end
