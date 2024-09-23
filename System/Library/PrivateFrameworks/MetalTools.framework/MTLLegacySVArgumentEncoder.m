@implementation MTLLegacySVArgumentEncoder

- (MTLLegacySVArgumentEncoder)initWithArgumentEncoder:(id)a3 layout:(const void *)a4 device:(id)a5
{
  MTLLegacySVArgumentEncoder *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLLegacySVArgumentEncoder;
  result = -[MTLToolsObject initWithBaseObject:parent:](&v7, sel_initWithBaseObject_parent_, a3, a5);
  if (result)
    result->_layout = a4;
  return result;
}

- (void)setArgumentBuffer:(id)a3 offset:(unint64_t)a4
{
  -[MTLToolsObject setArgumentBuffer:offset:](self->super.super._baseObject, "setArgumentBuffer:offset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a3, "offset") + a4);
}

- (void)setArgumentBuffer:(id)a3 startOffset:(unint64_t)a4 arrayElement:(unint64_t)a5
{
  -[MTLToolsObject setArgumentBuffer:startOffset:arrayElement:](self->super.super._baseObject, "setArgumentBuffer:startOffset:arrayElement:", objc_msgSend(a3, "baseObject"), objc_msgSend(a3, "offset") + a4, a5);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "handleForOffset:", a4);
  *(_QWORD *)-[MTLToolsObject constantDataAtIndex:](self->super.super._baseObject, "constantDataAtIndex:", a5) = v7;
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  unsigned int v11;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    v10 = 0;
    v11 = 1;
    do
    {
      -[MTLLegacySVArgumentEncoder setBuffer:offset:atIndex:](self, "setBuffer:offset:atIndex:", a3[v10], a4[v10], v10 + location);
      v10 = v11;
    }
    while (length > v11++);
  }
}

- (void)setAccelerationStructure:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6;

  v6 = objc_msgSend(a3, "handleForOffset:", 0);
  *(_QWORD *)-[MTLToolsObject constantDataAtIndex:](self->super.super._baseObject, "constantDataAtIndex:", a4) = v6;
}

- (void)setRenderPipelineState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super._baseObject, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "baseObject"), 0, a4);
}

- (void)setRenderPipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  unsigned int v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = 0;
    v9 = 1;
    do
    {
      -[MTLLegacySVArgumentEncoder setRenderPipelineState:atIndex:](self, "setRenderPipelineState:atIndex:", a3[v8], v8 + location);
      v8 = v9;
    }
    while (length > v9++);
  }
}

- (void)setComputePipelineState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super._baseObject, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend(a3, "indirectStateBuffer"), "baseObject"), 0, a4);
}

- (void)setComputePipelineStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  unsigned int v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = 0;
    v9 = 1;
    do
    {
      -[MTLLegacySVArgumentEncoder setComputePipelineState:atIndex:](self, "setComputePipelineState:atIndex:", a3[v8], v8 + location);
      v8 = v9;
    }
    while (length > v9++);
  }
}

- (void)setIndirectCommandBuffer:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsObject setBuffer:offset:atIndex:](self->super.super._baseObject, "setBuffer:offset:atIndex:", objc_msgSend(a3, "internalICBBuffer"), 0, a4);
}

- (void)setIndirectCommandBuffers:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  unsigned int v9;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = 0;
    v9 = 1;
    do
    {
      -[MTLLegacySVArgumentEncoder setIndirectCommandBuffer:atIndex:](self, "setIndirectCommandBuffer:atIndex:", a3[v8], v8 + location);
      v8 = v9;
    }
    while (length > v9++);
  }
}

- (id)newArgumentEncoderForBufferAtIndex:(unint64_t)a3
{
  LegacySVArgumentEncoderLayout *layout;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  MTLLegacySVArgumentEncoder *v8;

  layout = (LegacySVArgumentEncoderLayout *)self->_layout;
  if (!layout)
    return 0;
  v5 = LegacySVArgumentEncoderLayout::sublayout(layout, a3);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = (void *)objc_msgSend(-[MTLToolsObject baseObject](self->super.super._device, "baseObject"), "newArgumentEncoderWithLayout:", *v5);
  v8 = -[MTLLegacySVArgumentEncoder initWithArgumentEncoder:layout:device:]([MTLLegacySVArgumentEncoder alloc], "initWithArgumentEncoder:layout:device:", v7, v6, self->super.super._device);

  return v8;
}

@end
