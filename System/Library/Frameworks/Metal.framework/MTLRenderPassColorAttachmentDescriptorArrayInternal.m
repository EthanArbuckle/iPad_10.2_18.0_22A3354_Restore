@implementation MTLRenderPassColorAttachmentDescriptorArrayInternal

- (id)_descriptorAtIndex:(unint64_t)a3
{
  id *v3;
  uint64_t v4;

  if (a3 <= 7)
  {
    v3 = (id *)&self->_color_descriptors[a3];
    return *v3;
  }
  if (a3 == 9)
  {
    v4 = 80;
    goto LABEL_7;
  }
  if (a3 == 8)
  {
    v4 = 72;
LABEL_7:
    v3 = (id *)((char *)&self->super.super.isa + v4);
    return *v3;
  }
  return 0;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v9;
  id result;

  if (a3 >= 8)
    MTLReportFailure(0, "-[MTLRenderPassColorAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 1008, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v3, v4, v5, v6, a3);
  v9 = (id *)&self->_color_descriptors[a3];
  result = *v9;
  if (!*v9)
  {
    result = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorInternal);
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

- (void)dealloc
{
  uint64_t v3;
  MTLRenderPassColorAttachmentDescriptorInternal **color_descriptors;
  objc_super v5;

  v3 = 0;
  color_descriptors = self->_color_descriptors;
  do

  while (v3 != 8);
  v5.receiver = self;
  v5.super_class = (Class)MTLRenderPassColorAttachmentDescriptorArrayInternal;
  -[MTLRenderPassColorAttachmentDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLRenderPassColorAttachmentDescriptorInternal **color_descriptors;
  uint64_t v12;
  MTLRenderPassColorAttachmentDescriptorInternal *v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLRenderPassColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1025, (uint64_t)CFSTR("attachment is not a MTLRenderPassColorAttachmentDescriptor."), v4, v5, v6, v7, v12);
  }
  if (a4 >= 8)
    MTLReportFailure(0, "-[MTLRenderPassColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 1028, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v4, v5, v6, v7, a4);
  color_descriptors = self->_color_descriptors;
  if (color_descriptors[a4] != a3)
  {
    v13 = color_descriptors[a4];
    color_descriptors[a4] = (MTLRenderPassColorAttachmentDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

@end
