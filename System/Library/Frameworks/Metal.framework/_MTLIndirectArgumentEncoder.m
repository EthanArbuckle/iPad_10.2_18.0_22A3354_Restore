@implementation _MTLIndirectArgumentEncoder

- (void)dealloc
{
  objc_super v3;

  self->_device = 0;
  self->_layout = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLIndirectArgumentEncoder;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (_MTLIndirectArgumentEncoder)initWithLayout:(id)a3 device:(id)a4
{
  _MTLIndirectArgumentEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MTLIndirectArgumentEncoder;
  v6 = -[_MTLObjectWithLabel init](&v8, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)a4;
    v6->_layout = (_MTLIndirectArgumentBufferLayout *)a3;
  }
  return v6;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setBuffer:offset:atIndex:]", 929, (uint64_t)CFSTR("Unreachable code"), a5, v5, v6, v7, v8);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setBuffers:offsets:withRange:]", 934, (uint64_t)CFSTR("Unreachable code"), a5.location, a5.length, v5, v6, v7);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setTexture:atIndex:]", 939, (uint64_t)CFSTR("Unreachable code"), v4, v5, v6, v7, v8);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setTextures:withRange:]", 944, (uint64_t)CFSTR("Unreachable code"), a4.length, v4, v5, v6, v7);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setSamplerState:atIndex:]", 949, (uint64_t)CFSTR("Unreachable code"), v4, v5, v6, v7, v8);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setSamplerStates:withRange:]", 954, (uint64_t)CFSTR("Unreachable code"), a4.length, v4, v5, v6, v7);
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setRenderPipelineState:atIndex:]", 960, (uint64_t)CFSTR("Unreachable code"), v4, v5, v6, v7, v8);
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setRenderPipelineStates:withRange:]", 965, (uint64_t)CFSTR("Unreachable code"), a4.length, v4, v5, v6, v7);
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setComputePipelineState:atIndex:]", 970, (uint64_t)CFSTR("Unreachable code"), v4, v5, v6, v7, v8);
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setComputePipelineStates:withRange:]", 975, (uint64_t)CFSTR("Unreachable code"), a4.length, v4, v5, v6, v7);
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setIndirectCommandBuffer:atIndex:]", 980, (uint64_t)CFSTR("Unreachable code"), v4, v5, v6, v7, v8);
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder setIndirectCommandBuffers:withRange:]", 985, (uint64_t)CFSTR("Unreachable code"), a4.length, v4, v5, v6, v7);
}

- (void)constantDataAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  MTLReportFailure(0, "-[_MTLIndirectArgumentEncoder constantDataAtIndex:]", 990, (uint64_t)CFSTR("Unreachable code"), v3, v4, v5, v6, vars0);
  return 0;
}

- (void)setIndirectArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  abort();
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  -[_MTLIndirectArgumentEncoder setArgumentBuffer:offset:](self, "setArgumentBuffer:offset:", a3, a4 + -[_MTLIndirectArgumentEncoder encodedLength](self, "encodedLength") * a5);
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  id result;

  result = -[_MTLIndirectArgumentBufferLayout bufferLayoutForResourceAtIndex:](self->_layout, "bufferLayoutForResourceAtIndex:", a3);
  if (result)
    return (id)-[MTLDevice newArgumentEncoderWithLayout:](self->_device, "newArgumentEncoderWithLayout:", result);
  return result;
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  if ((-[MTLDevice requiresRaytracingEmulation](-[_MTLIndirectArgumentEncoder device](self, "device"), "requiresRaytracingEmulation") & 1) != 0)-[_MTLIndirectArgumentEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", objc_msgSend(a3, "buffer"), objc_msgSend(a3, "bufferOffset"), a4);
  else
    -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setVisibleFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (void)setIntersectionFunctionTable:(id)a3 atIndex:(unint64_t)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withRange:(_NSRange)a4
{
  -[_MTLIndirectArgumentEncoder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4.location, a4.length);
}

- (_MTLIndirectArgumentBufferLayout)layout
{
  return self->_layout;
}

@end
