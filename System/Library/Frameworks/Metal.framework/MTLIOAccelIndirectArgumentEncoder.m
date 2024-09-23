@implementation MTLIOAccelIndirectArgumentEncoder

- (unint64_t)encodedLength
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setIndirectArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5.location, a5.length);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLIOAccelIndirectArgumentEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", objc_msgSend(a3, "privateICBuffer"), 0, a4);
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    do
    {
      v8 = (void *)*a3++;
      -[MTLIOAccelIndirectArgumentEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", objc_msgSend(v8, "privateICBuffer"), 0, location++);
      --length;
    }
    while (length);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLIndirectArgumentEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[MTLIOAccelIndirectArgumentEncoder setVisibleFunctionTable:atIndex:](self, "setVisibleFunctionTable:atIndex:", objc_msgSend(a3, "visibleFunctionTable"), a4);
  else
    -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x1E0C80C00];
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLIndirectArgumentEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)
  {
    if (length)
    {
      v9 = (_QWORD *)((char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0));
      v10 = length;
      do
      {
        v11 = (void *)*a3++;
        *v9++ = objc_msgSend(v11, "visibleFunctionTable");
        --v10;
      }
      while (v10);
    }
    -[MTLIOAccelIndirectArgumentEncoder setVisibleFunctionTables:withRange:](self, "setVisibleFunctionTables:withRange:", (char *)v12 - ((8 * length + 15) & 0xFFFFFFFFFFFFFFF0), location, length);
  }
  else
  {
    -[MTLIOAccelIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  }
}

@end
