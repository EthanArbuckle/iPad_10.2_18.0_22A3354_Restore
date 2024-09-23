@implementation MTLComputePassSampleBufferAttachmentDescriptorArray

+ (MTLComputePassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLComputePassSampleBufferAttachmentDescriptorArray *)+[MTLComputePassSampleBufferAttachmentDescriptorArray allocWithZone:](MTLComputePassSampleBufferAttachmentDescriptorArrayInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLComputePassSampleBufferAttachmentDescriptorArray;
  return (MTLComputePassSampleBufferAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLComputePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end
