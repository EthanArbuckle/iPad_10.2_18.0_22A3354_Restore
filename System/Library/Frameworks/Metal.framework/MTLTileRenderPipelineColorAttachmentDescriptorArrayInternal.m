@implementation MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal

- (void)dealloc
{
  uint64_t v3;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal **descriptors;
  objc_super v5;

  v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 8);
  v5.receiver = self;
  v5.super_class = (Class)MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal;
  -[MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal **descriptors;
  id result;

  if (a3 >= 8)
    MTLReportFailure(0, "-[MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal objectAtIndexedSubscript:]", 170, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v3, v4, v5, v6, a3);
  descriptors = self->_descriptors;
  result = descriptors[a3];
  if (!result)
  {
    result = objc_alloc_init(MTLTileRenderPipelineColorAttachmentDescriptorInternal);
    descriptors[a3] = (MTLTileRenderPipelineColorAttachmentDescriptorInternal *)result;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal **descriptors;
  uint64_t v12;
  MTLTileRenderPipelineColorAttachmentDescriptorInternal *v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 181, (uint64_t)CFSTR("attachment is not a MTLTileRenderPipelineColorAttachmentDescriptor."), v4, v5, v6, v7, v12);
  }
  if (a4 >= 8)
    MTLReportFailure(0, "-[MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal setObject:atIndexedSubscript:]", 183, (uint64_t)CFSTR("attachmentIndex(%lu) must be < %lu"), v4, v5, v6, v7, a4);
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLTileRenderPipelineColorAttachmentDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

- (uint64_t)_descriptorAtIndex:(uint64_t)result
{
  if (result)
    return *(_QWORD *)(result + 8 + 8 * a2);
  return result;
}

@end
