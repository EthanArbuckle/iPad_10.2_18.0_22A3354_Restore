@implementation MTLAttributeDescriptorInternal

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_vertexFormat;
  *((_QWORD *)result + 2) = self->_offset;
  *((_QWORD *)result + 3) = self->_bufferIndex;
  return result;
}

- (unint64_t)format
{
  return self->_vertexFormat;
}

- (void)setFormat:(unint64_t)a3
{
  self->_vertexFormat = a3;
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (void)setBufferIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a3 >= 0x1F)
    MTLReportFailure(0, "-[MTLAttributeDescriptorInternal setBufferIndex:]", 348, (uint64_t)CFSTR("buffer index (%lu) must be < %lu."), v3, v4, v5, v6, a3);
  self->_bufferIndex = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

@end
