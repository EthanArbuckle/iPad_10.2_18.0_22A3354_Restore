@implementation MTLResourceStatePassSampleBufferAttachmentDescriptorArray

+ (MTLResourceStatePassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)+[MTLResourceStatePassSampleBufferAttachmentDescriptorArray allocWithZone:](MTLResourceStatePassSampleBufferAttachmentDescriptorArrayInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLResourceStatePassSampleBufferAttachmentDescriptorArray;
  return (MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLResourceStatePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end
