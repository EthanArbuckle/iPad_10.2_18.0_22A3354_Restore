@implementation MTLToolsArgumentEncoder

- (NSString)label
{
  return (NSString *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "label");
}

- (void)setLabel:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
}

- (unint64_t)encodedLength
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "encodedLength");
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  return (void *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "constantDataAtIndex:", a3);
}

- (unint64_t)alignment
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "alignment");
}

- (MTLDevice)device
{
  do
    self = (MTLToolsArgumentEncoder *)self->super._parent;
  while (!-[MTLToolsArgumentEncoder conformsToProtocol:](self, "conformsToProtocol:", &unk_255C67E08));
  return (MTLDevice *)self;
}

- (_MTLIndirectArgumentBufferLayout)layout
{
  return (_MTLIndirectArgumentBufferLayout *)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "layout");
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setArgumentBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setArgumentBuffer:startOffset:arrayElement:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *__p[3];

  length = a5.length;
  location = a5.location;
  std::vector<objc_object  {objcproto9MTLBuffer}*>::vector(__p, a5.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v11 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v11;
    }
  }
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v12, "setBuffers:offsets:withRange:", __p[0], a4, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto10MTLTexture}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setTextures:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto15MTLSamplerState}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setSamplerStates:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setRenderPipelineState:atIndex:](self, "setRenderPipelineState:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setComputePipelineState:atIndex:](self, "setComputePipelineState:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIndirectCommandBuffer:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setIndirectCommandBuffer:atIndex:](self, "setIndirectCommandBuffer:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  id result;
  id v5;
  MTLToolsArgumentEncoder *v6;

  result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newArgumentEncoderForBufferAtIndex:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[MTLToolsObject initWithBaseObject:parent:]([MTLToolsArgumentEncoder alloc], "initWithBaseObject:parent:", result, self);

    return v6;
  }
  return result;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setAccelerationStructure:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setVisibleFunctionTable:atBufferIndex:](self, "setVisibleFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setIntersectionFunctionTable:atBufferIndex:](self, "setIntersectionFunctionTable:atBufferIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setVisibleFunctionTable:atIndex:](self, "setVisibleFunctionTable:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (uint64_t)*a3++;
      -[MTLToolsArgumentEncoder setIntersectionFunctionTable:atIndex:](self, "setIntersectionFunctionTable:atIndex:", v8, location++);
      --length;
    }
    while (length);
  }
}

@end
