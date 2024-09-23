@implementation MTLTileRenderPipelineColorAttachmentDescriptorArray

+ (MTLTileRenderPipelineColorAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLTileRenderPipelineColorAttachmentDescriptorArray *)+[MTLTileRenderPipelineColorAttachmentDescriptorArray allocWithZone:](MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLTileRenderPipelineColorAttachmentDescriptorArray;
  return (MTLTileRenderPipelineColorAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLTileRenderPipelineColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end
