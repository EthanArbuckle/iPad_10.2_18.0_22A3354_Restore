@implementation SCNMTLBufferAllocatorSubBuffer

- (SCNMTLBufferAllocatorSubBuffer)initWithPage:(id)a3 allocator:(id)a4
{
  SCNMTLBufferAllocatorSubBuffer *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNMTLBufferAllocatorSubBuffer;
  result = -[SCNMTLBufferAllocatorSubBuffer init](&v6, sel_init, a3, a4);
  if (result)
    result->_parentPage = (SCNFixedSizePage *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SCNFixedSizePage deallocateElementAtOffset:](self->_parentPage, "deallocateElementAtOffset:", -[SCNMTLBuffer offset](self, "offset"));
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBufferAllocatorSubBuffer;
  -[SCNMTLBuffer dealloc](&v3, sel_dealloc);
}

@end
