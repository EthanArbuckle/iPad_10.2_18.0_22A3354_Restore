@implementation MTLAccelerationStructurePassDescriptor

+ (MTLAccelerationStructurePassDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLAccelerationStructurePassDescriptor *)+[MTLAccelerationStructurePassDescriptor allocWithZone:](MTLAccelerationStructurePassDescriptorInternal, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLAccelerationStructurePassDescriptor;
  return (MTLAccelerationStructurePassDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLAccelerationStructurePassDescriptor)init
{
  MTLAccelerationStructurePassDescriptor *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructurePassDescriptor;
  v2 = -[MTLAccelerationStructurePassDescriptor init](&v4, sel_init);
  if (v2)
    v2->_sampleBufferAttachments = objc_alloc_init(MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructurePassDescriptor;
  -[MTLAccelerationStructurePassDescriptor dealloc](&v3, sel_dealloc);
}

+ (MTLAccelerationStructurePassDescriptor)accelerationStructurePassDescriptor
{
  return (MTLAccelerationStructurePassDescriptor *)objc_alloc_init((Class)objc_opt_class());
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;

  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend((id)objc_msgSend(v5, "sampleBufferAttachments"), "copyFrom:withZone:", self->_sampleBufferAttachments, a3);
  objc_msgSend(v5, "setEnableSubstreams:", -[MTLAccelerationStructurePassDescriptor enableSubstreams](self, "enableSubstreams"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class == object_getClass(a3)
    && (v6 = -[MTLAccelerationStructurePassDescriptor enableSubstreams](self, "enableSubstreams"),
        v6 == objc_msgSend(a3, "enableSubstreams")))
  {
    return objc_msgSend((id)objc_msgSend(a3, "sampleBufferAttachments"), "isEqual:", -[MTLAccelerationStructurePassDescriptor sampleBufferAttachments](self, "sampleBufferAttachments"));
  }
  else
  {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v4;
  char v5;

  bzero(&v4, 0x10uLL);
  v5 = -[MTLAccelerationStructurePassDescriptor enableSubstreams](self, "enableSubstreams", -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray hash](self->_sampleBufferAttachments, "hash"));
  return _MTLHashState((int *)&v4, 0x10uLL);
}

- (id)convertToComputePassDescriptor
{
  return -[MTLAccelerationStructurePassDescriptor convertToComputePassDescriptorWithConcurrentDispatch:](self, "convertToComputePassDescriptorWithConcurrentDispatch:", 0);
}

- (id)convertToComputePassDescriptorWithConcurrentDispatch:(BOOL)a3
{
  MTLComputePassDescriptor *v5;
  uint64_t i;
  id v7;
  void *v8;
  MTLComputePassSampleBufferAttachmentDescriptor *v9;

  v5 = objc_alloc_init(MTLComputePassDescriptor);
  for (i = 0; i != 4; ++i)
  {
    v7 = -[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray _descriptorAtIndex:](-[MTLAccelerationStructurePassDescriptor sampleBufferAttachments](self, "sampleBufferAttachments"), "_descriptorAtIndex:", i);
    if (v7)
    {
      v8 = v7;
      v9 = -[MTLComputePassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:](-[MTLComputePassDescriptor sampleBufferAttachments](v5, "sampleBufferAttachments"), "objectAtIndexedSubscript:", i);
      -[MTLComputePassSampleBufferAttachmentDescriptor setSampleBuffer:](v9, "setSampleBuffer:", objc_msgSend(v8, "sampleBuffer"));
      -[MTLComputePassSampleBufferAttachmentDescriptor setStartOfEncoderSampleIndex:](v9, "setStartOfEncoderSampleIndex:", objc_msgSend(v8, "startOfEncoderSampleIndex"));
      -[MTLComputePassSampleBufferAttachmentDescriptor setEndOfEncoderSampleIndex:](v9, "setEndOfEncoderSampleIndex:", objc_msgSend(v8, "endOfEncoderSampleIndex"));
    }
  }
  if (a3)
    -[MTLComputePassDescriptor setDispatchType:](v5, "setDispatchType:", 1);
  return v5;
}

- (MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray)sampleBufferAttachments
{
  return self->_sampleBufferAttachments;
}

@end
