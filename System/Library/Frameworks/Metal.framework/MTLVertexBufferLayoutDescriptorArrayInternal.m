@implementation MTLVertexBufferLayoutDescriptorArrayInternal

- (void)dealloc
{
  uint64_t v3;
  MTLVertexBufferLayoutDescriptorInternal **descriptors;
  objc_super v5;

  v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 31);
  v5.receiver = self;
  v5.super_class = (Class)MTLVertexBufferLayoutDescriptorArrayInternal;
  -[MTLVertexBufferLayoutDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLVertexBufferLayoutDescriptorInternal **descriptors;
  id result;

  if (a3 >= 0x1F)
    MTLReportFailure(0, "-[MTLVertexBufferLayoutDescriptorArrayInternal objectAtIndexedSubscript:]", 250, (uint64_t)CFSTR("bufferIndex(%lu) must be < %lu."), v3, v4, v5, v6, a3);
  descriptors = self->_descriptors;
  result = descriptors[a3];
  if (!result)
  {
    result = objc_alloc_init(MTLVertexBufferLayoutDescriptorInternal);
    descriptors[a3] = (MTLVertexBufferLayoutDescriptorInternal *)result;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLVertexBufferLayoutDescriptorInternal **descriptors;
  uint64_t v12;
  MTLVertexBufferLayoutDescriptorInternal *v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLVertexBufferLayoutDescriptorArrayInternal setObject:atIndexedSubscript:]", 260, (uint64_t)CFSTR("bufferDesc is not a MTLVertexBufferLayoutDescriptor."), v4, v5, v6, v7, v12);
  }
  if (a4 >= 0x1F)
    MTLReportFailure(0, "-[MTLVertexBufferLayoutDescriptorArrayInternal setObject:atIndexedSubscript:]", 262, (uint64_t)CFSTR("bufferIndex(%lu) must be < %lu."), v4, v5, v6, v7, a4);
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLVertexBufferLayoutDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

@end
