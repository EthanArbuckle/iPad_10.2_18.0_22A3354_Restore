@implementation MTLRenderPipelineColorAttachmentDescriptorArrayInternal

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v9;
  id result;

  if (a3 >= 8)
    MTLReportFailure(0, "-[MTLRenderPipelineColorAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 1952, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v3, v4, v5, v6, a3);
  v9 = (id *)&self->_descriptors[a3];
  result = *v9;
  if (!*v9)
  {
    result = objc_alloc_init(MTLRenderPipelineColorAttachmentDescriptorInternal);
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

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return self->_descriptors[a3];
}

- (void)dealloc
{
  uint64_t v3;
  MTLRenderPipelineColorAttachmentDescriptorInternal **descriptors;
  objc_super v5;

  v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 8);
  v5.receiver = self;
  v5.super_class = (Class)MTLRenderPipelineColorAttachmentDescriptorArrayInternal;
  -[MTLRenderPipelineColorAttachmentDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLRenderPipelineColorAttachmentDescriptorInternal **descriptors;
  uint64_t v12;
  MTLRenderPipelineColorAttachmentDescriptorInternal *v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPipelineColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1969, (uint64_t)CFSTR("attachment is not a MTLRenderPipelineColorAttachmentDescriptor."), v4, v5, v6, v7, v12);
  }
  if (a4 >= 8)
    MTLReportFailure(0, "-[MTLRenderPipelineColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1971, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v4, v5, v6, v7, a4);
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLRenderPipelineColorAttachmentDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

@end
