@implementation MTLVertexAttributeDescriptorArrayInternal

- (void)dealloc
{
  uint64_t v3;
  MTLVertexAttributeDescriptorInternal **descriptors;
  objc_super v5;

  v3 = 0;
  descriptors = self->_descriptors;
  do

  while (v3 != 31);
  v5.receiver = self;
  v5.super_class = (Class)MTLVertexAttributeDescriptorArrayInternal;
  -[MTLVertexAttributeDescriptorArrayInternal dealloc](&v5, sel_dealloc);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  MTLVertexAttributeDescriptorInternal **descriptors;
  id result;

  if (a3 >= 0x1F)
    MTLReportFailure(0, "-[MTLVertexAttributeDescriptorArrayInternal objectAtIndexedSubscript:]", 394, (uint64_t)CFSTR("vertex attribute index (%lu) must be < %lu."), v3, v4, v5, v6, a3);
  descriptors = self->_descriptors;
  result = descriptors[a3];
  if (!result)
  {
    result = objc_alloc_init(MTLVertexAttributeDescriptorInternal);
    descriptors[a3] = (MTLVertexAttributeDescriptorInternal *)result;
  }
  return result;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  MTLVertexAttributeDescriptorInternal **descriptors;
  uint64_t v12;
  MTLVertexAttributeDescriptorInternal *v13;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLVertexAttributeDescriptorArrayInternal setObject:atIndexedSubscript:]", 404, (uint64_t)CFSTR("attributeDesc is not a MTLVertexAttributeDescriptor."), v4, v5, v6, v7, v12);
  }
  if (a4 >= 0x1F)
    MTLReportFailure(0, "-[MTLVertexAttributeDescriptorArrayInternal setObject:atIndexedSubscript:]", 406, (uint64_t)CFSTR("vertex attribute index (%lu) must be < %lu."), v4, v5, v6, v7, a4);
  descriptors = self->_descriptors;
  if (descriptors[a4] != a3)
  {
    v13 = descriptors[a4];
    descriptors[a4] = (MTLVertexAttributeDescriptorInternal *)objc_msgSend(a3, "copy");

  }
}

@end
