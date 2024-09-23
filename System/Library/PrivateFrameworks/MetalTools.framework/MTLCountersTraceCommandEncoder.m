@implementation MTLCountersTraceCommandEncoder

- (id)init:(BinaryBuffer *)a3 flags:(unint64_t)a4
{
  MTLCountersTraceCommandEncoder *v6;
  MTLCountersTraceCommandEncoder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLCountersTraceCommandEncoder;
  v6 = -[MTLCountersTraceCommandEncoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_stream = a3;
    v6->_flags = a4;
    v6->_segment.location = ((uint64_t (*)(BinaryBuffer *))*a3->_vptr$AppendBuffer)(a3);
  }
  return v7;
}

- (void)insertDebugSignpost:(id)a3
{
  id v3;

  v3 = a3;
  BinaryBuffer::Append<NSString *>((AppendBuffer *)self->_stream, 112, &v3);
}

- (void)pushDebugGroup:(id)a3
{
  id v3;

  v3 = a3;
  BinaryBuffer::Append<NSString *>((AppendBuffer *)self->_stream, 113, &v3);
}

- (void)popDebugGroup
{
  AppendBuffer *stream;
  __int16 __src;
  char v4;
  _BYTE v5[5];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  stream = (AppendBuffer *)self->_stream;
  v6[1] = v6;
  __src = 29185;
  v4 = 16;
  v6[0] = v5;
  AppendBuffer::WriteBytes(stream, &stream->stream, &__src, 3uLL);
}

- (void)setLabel:(id)a3
{
  id v3;

  v3 = a3;
  BinaryBuffer::Append<NSString *>((AppendBuffer *)self->_stream, 115, &v3);
}

- (void)endEncoding
{
  self->_segment.length = ((uint64_t (*)(BinaryBuffer *, SEL))*self->_stream->_vptr$AppendBuffer)(self->_stream, a2)- self->_segment.location;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (_NSRange)segment
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_segment.length;
  location = self->_segment.location;
  result.length = length;
  result.location = location;
  return result;
}

@end
