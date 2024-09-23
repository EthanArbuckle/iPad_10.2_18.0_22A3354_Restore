@implementation MTLCountersRenderCommandEncoder

- (void)_initWithCommandBuffer:(id)a3
{
  *(&self->_APITimingEnabled + 4) = objc_msgSend((id)objc_msgSend(a3, "device"), "APITimingEnabled");
  self->_traceEncoder = (MTLCountersTraceRenderCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a3, "traceBuffer"), "renderCommandEncoder");
}

- (MTLCountersRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4
{
  MTLCountersRenderCommandEncoder *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLCountersRenderCommandEncoder;
  v5 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:](&v7, sel_initWithRenderCommandEncoder_parent_, a3);
  if (v5)
    -[MTLCountersRenderCommandEncoder _initWithCommandBuffer:](v5, "_initWithCommandBuffer:", objc_msgSend(a4, "commandBuffer"));
  return v5;
}

- (MTLCountersRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLCountersRenderCommandEncoder *v6;
  MTLCountersRenderCommandEncoder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLCountersRenderCommandEncoder;
  v6 = -[MTLToolsRenderCommandEncoder initWithRenderCommandEncoder:parent:descriptor:](&v9, sel_initWithRenderCommandEncoder_parent_descriptor_, a3, a4, a5);
  v7 = v6;
  if (v6)
    -[MTLCountersRenderCommandEncoder _initWithCommandBuffer:](v6, "_initWithCommandBuffer:", a4);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCountersRenderCommandEncoder;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void)insertDebugSignpost:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "insertDebugSignpost:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceCommandEncoder insertDebugSignpost:](self->_traceEncoder, "insertDebugSignpost:", a3);
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "pushDebugGroup:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceCommandEncoder pushDebugGroup:](self->_traceEncoder, "pushDebugGroup:", a3);
}

- (void)popDebugGroup
{
  uint64_t v3;
  uint64_t v4;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v6;

  if (*(&self->_APITimingEnabled + 4))
    v3 = mach_absolute_time();
  else
    v3 = 0;
  self->_traceEncoder->super._timer = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "popDebugGroup");
  if (*(&self->_APITimingEnabled + 4))
  {
    v4 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v6 = v4 - traceEncoder->super._timer;
  }
  else
  {
    v6 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v6;
  -[MTLCountersTraceCommandEncoder popDebugGroup](self->_traceEncoder, "popDebugGroup");
}

- (void)setLabel:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setLabel:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceCommandEncoder setLabel:](self->_traceEncoder, "setLabel:", a3);
}

- (void)setRenderPipelineState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setRenderPipelineState:](self->_traceEncoder, "setRenderPipelineState:", a3);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setVertexBytes:length:atIndex:](self->_traceEncoder, "setVertexBytes:length:atIndex:", a3, a4, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setVertexBuffer:offset:atIndex:](self->_traceEncoder, "setVertexBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setVertexBufferOffset:atIndex:](self->_traceEncoder, "setVertexBufferOffset:atIndex:", a3, a4);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v13;

  length = a5.length;
  location = a5.location;
  if (*(&self->_APITimingEnabled + 4))
    v10 = mach_absolute_time();
  else
    v10 = 0;
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  -[MTLCountersTraceRenderCommandEncoder setVertexBuffers:offsets:withRange:](self->_traceEncoder, "setVertexBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v14;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  -[MTLCountersTraceRenderCommandEncoder setVertexBytes:length:attributeStride:atIndex:](self->_traceEncoder, "setVertexBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v14;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  -[MTLCountersTraceRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:](self->_traceEncoder, "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBufferOffset:attributeStride:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setVertexBufferOffset:attributeStride:atIndex:](self->_traceEncoder, "setVertexBufferOffset:attributeStride:atIndex:", a3, a4, a5);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v15;

  length = a6.length;
  location = a6.location;
  if (*(&self->_APITimingEnabled + 4))
    v12 = mach_absolute_time();
  else
    v12 = 0;
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  -[MTLCountersTraceRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](self->_traceEncoder, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, a5, location, length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTexture:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setVertexTexture:atIndex:](self->_traceEncoder, "setVertexTexture:atIndex:", a3, a4);
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTextures:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  -[MTLCountersTraceRenderCommandEncoder setVertexTextures:withRange:](self->_traceEncoder, "setVertexTextures:withRange:", a3, location, length);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerState:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setVertexSamplerState:atIndex:](self->_traceEncoder, "setVertexSamplerState:atIndex:", a3, a4);
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerStates:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  -[MTLCountersTraceRenderCommandEncoder setVertexSamplerStates:withRange:](self->_traceEncoder, "setVertexSamplerStates:withRange:", a3, location, length);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v19;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v12, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v13, v14);
  if (*(&self->_APITimingEnabled + 4))
  {
    v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  -[MTLCountersTraceRenderCommandEncoder setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_traceEncoder, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v15, v16);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v15;

  length = a6.length;
  location = a6.location;
  if (*(&self->_APITimingEnabled + 4))
    v12 = mach_absolute_time();
  else
    v12 = 0;
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  -[MTLCountersTraceRenderCommandEncoder setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_traceEncoder, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setFragmentBytes:length:atIndex:](self->_traceEncoder, "setFragmentBytes:length:atIndex:", a3, a4, a5);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setFragmentBuffer:offset:atIndex:](self->_traceEncoder, "setFragmentBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setFragmentBufferOffset:atIndex:](self->_traceEncoder, "setFragmentBufferOffset:atIndex:", a3, a4);
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v13;

  length = a5.length;
  location = a5.location;
  if (*(&self->_APITimingEnabled + 4))
    v10 = mach_absolute_time();
  else
    v10 = 0;
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  -[MTLCountersTraceRenderCommandEncoder setFragmentBuffers:offsets:withRange:](self->_traceEncoder, "setFragmentBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setFragmentTexture:atIndex:](self->_traceEncoder, "setFragmentTexture:atIndex:", a3, a4);
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTextures:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  -[MTLCountersTraceRenderCommandEncoder setFragmentTextures:withRange:](self->_traceEncoder, "setFragmentTextures:withRange:", a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerState:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setFragmentSamplerState:atIndex:](self->_traceEncoder, "setFragmentSamplerState:atIndex:", a3, a4);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerStates:withRange:", a3, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  -[MTLCountersTraceRenderCommandEncoder setFragmentSamplerStates:withRange:](self->_traceEncoder, "setFragmentSamplerStates:withRange:", a3, location, length);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v19;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v12, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v13, v14);
  if (*(&self->_APITimingEnabled + 4))
  {
    v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  -[MTLCountersTraceRenderCommandEncoder setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_traceEncoder, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v15, v16);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v15;

  length = a6.length;
  location = a6.location;
  if (*(&self->_APITimingEnabled + 4))
    v12 = mach_absolute_time();
  else
    v12 = 0;
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v13 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v15 = v13 - traceEncoder->super._timer;
  }
  else
  {
    v15 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v15;
  -[MTLCountersTraceRenderCommandEncoder setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_traceEncoder, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", a3, a4, a5, a6);
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBytes:length:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setTileBytes:length:atIndex:](self->_traceEncoder, "setTileBytes:length:atIndex:", a3, a4, a5);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffer:offset:atIndex:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setTileBuffer:offset:atIndex:](self->_traceEncoder, "setTileBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBufferOffset:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setTileBufferOffset:atIndex:](self->_traceEncoder, "setTileBufferOffset:atIndex:", a3, a4);
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v13;

  length = a5.length;
  location = a5.location;
  if (*(&self->_APITimingEnabled + 4))
    v10 = mach_absolute_time();
  else
    v10 = 0;
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffers:offsets:withRange:", a3, a4, location, length);
  if (*(&self->_APITimingEnabled + 4))
  {
    v11 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v13 = v11 - traceEncoder->super._timer;
  }
  else
  {
    v13 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v13;
  -[MTLCountersTraceRenderCommandEncoder setTileBuffers:offsets:withRange:](self->_traceEncoder, "setTileBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileTexture:atIndex:", a3, a4);
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileTextures:withRange:", a3, a4.location, a4.length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileSamplerState:atIndex:", a3, a4);
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileSamplerStates:withRange:", a3, a4.location, a4.length);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v10;
  double v11;
  double v12;

  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v11, v12);
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  id v4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  v5 = *a3;
  objc_msgSend(v4, "dispatchThreadsPerTile:", &v5);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:offset:atIndex:", a3, a4, a5);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder useResource:usage:](self->_traceEncoder, "useResource:usage:", a3, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResources:count:usage:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder useResources:count:usage:](self->_traceEncoder, "useResources:count:usage:", a3, a4, a5);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:stages:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder useResource:usage:stages:](self->_traceEncoder, "useResource:usage:stages:", a3, a4, a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v14;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResources:count:usage:stages:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  -[MTLCountersTraceRenderCommandEncoder useResources:count:usage:stages:](self->_traceEncoder, "useResources:count:usage:stages:", a3, a4, a5, a6);
}

- (void)useHeap:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder useHeap:](self->_traceEncoder, "useHeap:", a3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeaps:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder useHeaps:count:](self->_traceEncoder, "useHeaps:count:", a3, a4);
}

- (void)setViewport:(id *)a3
{
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;
  MTLCountersTraceRenderCommandEncoder *v11;
  __int128 v12;
  _OWORD v13[3];
  _OWORD v14[3];

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v7 = *(_OWORD *)&a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v7;
  v14[2] = *(_OWORD *)&a3->var4;
  objc_msgSend(v6, "setViewport:", v14);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  v11 = self->_traceEncoder;
  v12 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a3->var4;
  -[MTLCountersTraceRenderCommandEncoder setViewport:](v11, "setViewport:", v13);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewports:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setViewports:count:](self->_traceEncoder, "setViewports:count:", a3, a4);
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFrontFacingWinding:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setFrontFacingWinding:](self->_traceEncoder, "setFrontFacingWinding:", a3);
}

- (void)setCullMode:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCullMode:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setCullMode:](self->_traceEncoder, "setCullMode:", a3);
}

- (void)setDepthClipMode:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthClipMode:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setDepthClipMode:](self->_traceEncoder, "setDepthClipMode:", a3);
}

- (void)setLineWidth:(float)a3
{
  id v4;
  double v5;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setLineWidth:", v5);
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v19;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v11 = a3;
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  objc_msgSend(v10, "setDepthBias:slopeScale:clamp:", v11, v12, v13);
  if (*(&self->_APITimingEnabled + 4))
  {
    v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  *(float *)&v14 = a3;
  *(float *)&v15 = a4;
  *(float *)&v16 = a5;
  -[MTLCountersTraceRenderCommandEncoder setDepthBias:slopeScale:clamp:](self->_traceEncoder, "setDepthBias:slopeScale:clamp:", v14, v15, v16);
}

- (void)setScissorRect:(id *)a3
{
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;
  MTLCountersTraceRenderCommandEncoder *v11;
  __int128 v12;
  _OWORD v13[2];
  _OWORD v14[2];

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v7 = *(_OWORD *)&a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v7;
  objc_msgSend(v6, "setScissorRect:", v14);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  v11 = self->_traceEncoder;
  v12 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v12;
  -[MTLCountersTraceRenderCommandEncoder setScissorRect:](v11, "setScissorRect:", v13);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setScissorRects:count:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setScissorRects:count:](self->_traceEncoder, "setScissorRects:count:", a3, a4);
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationMode:value:", a3, a4);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationCount:viewMappings:", a3, a4);
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTriangleFillMode:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setTriangleFillMode:](self->_traceEncoder, "setTriangleFillMode:", a3);
}

- (void)setDepthStencilState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStencilState:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setDepthStencilState:](self->_traceEncoder, "setDepthStencilState:", a3);
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  v3 = *(_QWORD *)&a3;
  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilReferenceValue:", v3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setStencilReferenceValue:](self->_traceEncoder, "setStencilReferenceValue:", v3);
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilFrontReferenceValue:backReferenceValue:", v5, v4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setStencilFrontReferenceValue:backReferenceValue:](self->_traceEncoder, "setStencilFrontReferenceValue:backReferenceValue:", v5, v4);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setColorStoreAction:atIndex:](self->_traceEncoder, "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreAction:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setDepthStoreAction:](self->_traceEncoder, "setDepthStoreAction:", a3);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreAction:", a3);
  if (*(&self->_APITimingEnabled + 4))
  {
    v6 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v8 = v6 - traceEncoder->super._timer;
  }
  else
  {
    v8 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v8;
  -[MTLCountersTraceRenderCommandEncoder setStencilStoreAction:](self->_traceEncoder, "setStencilStoreAction:", a3);
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibilityResultMode:offset:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder setVisibilityResultMode:offset:](self->_traceEncoder, "setVisibilityResultMode:offset:", a3, a4);
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v23;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  *(float *)&v16 = a6;
  objc_msgSend(v12, "setBlendColorRed:green:blue:alpha:", v13, v14, v15, v16);
  if (*(&self->_APITimingEnabled + 4))
  {
    v21 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v23 = v21 - traceEncoder->super._timer;
  }
  else
  {
    v23 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v23;
  *(float *)&v17 = a3;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  *(float *)&v20 = a6;
  -[MTLCountersTraceRenderCommandEncoder setBlendColorRed:green:blue:alpha:](self->_traceEncoder, "setBlendColorRed:green:blue:alpha:", v17, v18, v19, v20);
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:atIndex:", a3, a4, a5, a6, a7);
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7 atIndex:(unint64_t)a8
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:", a3, a4, a5, a6, a7, a8);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:", a3, a4, a5, a6);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:yInvert:", a3, a4, a5, a6, a7);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:", a3, a4, a5, a6);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:yInvert:", a3, a4, a5, a6, a7);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v14;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  -[MTLCountersTraceRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:](self->_traceEncoder, "drawPrimitives:vertexStart:vertexCount:instanceCount:", a3, a4, a5, a6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:](self->_traceEncoder, "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  uint64_t v15;
  uint64_t v16;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v18;

  if (*(&self->_APITimingEnabled + 4))
    v15 = mach_absolute_time();
  else
    v15 = 0;
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, a6, a7, a8);
  if (*(&self->_APITimingEnabled + 4))
  {
    v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  -[MTLCountersTraceRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:](self->_traceEncoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v16;

  if (*(&self->_APITimingEnabled + 4))
    v13 = mach_absolute_time();
  else
    v13 = 0;
  self->_traceEncoder->super._timer = v13;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, a6, a7);
  if (*(&self->_APITimingEnabled + 4))
  {
    v14 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v16 = v14 - traceEncoder->super._timer;
  }
  else
  {
    v16 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v16;
  -[MTLCountersTraceRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:](self->_traceEncoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, a6, a7);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v16;

  if (*(&self->_APITimingEnabled + 4))
    v13 = mach_absolute_time();
  else
    v13 = 0;
  self->_traceEncoder->super._timer = v13;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
  if (*(&self->_APITimingEnabled + 4))
  {
    v14 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v16 = v14 - traceEncoder->super._timer;
  }
  else
  {
    v16 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v16;
  -[MTLCountersTraceRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:](self->_traceEncoder, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  uint64_t v16;
  uint64_t v17;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v19;

  if (*(&self->_APITimingEnabled + 4))
    v16 = mach_absolute_time();
  else
    v16 = 0;
  self->_traceEncoder->super._timer = v16;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, a6, a7, a8, a9, a10);
  if (*(&self->_APITimingEnabled + 4))
  {
    v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  -[MTLCountersTraceRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:](self->_traceEncoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:](self->_traceEncoder, "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, a4, a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  uint64_t v15;
  uint64_t v16;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v18;

  if (*(&self->_APITimingEnabled + 4))
    v15 = mach_absolute_time();
  else
    v15 = 0;
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
  if (*(&self->_APITimingEnabled + 4))
  {
    v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  -[MTLCountersTraceRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:](self->_traceEncoder, "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:afterStages:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder updateFence:afterStages:](self->_traceEncoder, "updateFence:afterStages:", a3, a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:beforeStages:", a3, a4);
  if (*(&self->_APITimingEnabled + 4))
  {
    v8 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v10 = v8 - traceEncoder->super._timer;
  }
  else
  {
    v10 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v10;
  -[MTLCountersTraceRenderCommandEncoder waitForFence:beforeStages:](self->_traceEncoder, "waitForFence:beforeStages:", a3, a4);
}

- (void)endEncoding
{
  uint64_t v3;
  uint64_t v4;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v6;

  if (*(&self->_APITimingEnabled + 4))
    v3 = mach_absolute_time();
  else
    v3 = 0;
  self->_traceEncoder->super._timer = v3;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncoding");
  if (*(&self->_APITimingEnabled + 4))
  {
    v4 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v6 = v4 - traceEncoder->super._timer;
  }
  else
  {
    v6 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v6;
  -[MTLCountersTraceCommandEncoder endEncoding](self->_traceEncoder, "endEncoding");
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTessellationFactorBuffer:offset:instanceStride:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder setTessellationFactorBuffer:offset:instanceStride:](self->_traceEncoder, "setTessellationFactorBuffer:offset:instanceStride:", a3, a4, a5);
}

- (void)setTessellationFactorScale:(float)a3
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v11;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setTessellationFactorScale:", v7);
  if (*(&self->_APITimingEnabled + 4))
  {
    v9 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v11 = v9 - traceEncoder->super._timer;
  }
  else
  {
    v11 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v11;
  *(float *)&v8 = a3;
  -[MTLCountersTraceRenderCommandEncoder setTessellationFactorScale:](self->_traceEncoder, "setTessellationFactorScale:", v8);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  uint64_t v15;
  uint64_t v16;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v18;

  if (*(&self->_APITimingEnabled + 4))
    v15 = mach_absolute_time();
  else
    v15 = 0;
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8, a9);
  if (*(&self->_APITimingEnabled + 4))
  {
    v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  -[MTLCountersTraceRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:](self->_traceEncoder, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  uint64_t v13;
  uint64_t v14;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v16;

  if (*(&self->_APITimingEnabled + 4))
    v13 = mach_absolute_time();
  else
    v13 = 0;
  self->_traceEncoder->super._timer = v13;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7);
  if (*(&self->_APITimingEnabled + 4))
  {
    v14 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v16 = v14 - traceEncoder->super._timer;
  }
  else
  {
    v16 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v16;
  -[MTLCountersTraceRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:](self->_traceEncoder, "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  uint64_t v16;
  uint64_t v17;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v19;

  if (*(&self->_APITimingEnabled + 4))
    v16 = mach_absolute_time();
  else
    v16 = 0;
  self->_traceEncoder->super._timer = v16;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8, a9, a10, a11);
  if (*(&self->_APITimingEnabled + 4))
  {
    v17 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v19 = v17 - traceEncoder->super._timer;
  }
  else
  {
    v19 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v19;
  -[MTLCountersTraceRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:](self->_traceEncoder, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  uint64_t v15;
  uint64_t v16;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v18;

  if (*(&self->_APITimingEnabled + 4))
    v15 = mach_absolute_time();
  else
    v15 = 0;
  self->_traceEncoder->super._timer = v15;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8, a9);
  if (*(&self->_APITimingEnabled + 4))
  {
    v16 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v18 = v16 - traceEncoder->super._timer;
  }
  else
  {
    v18 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v18;
  -[MTLCountersTraceRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:](self->_traceEncoder, "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:afterStages:beforeStages:", a3, a4, a5);
  if (*(&self->_APITimingEnabled + 4))
  {
    v10 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v12 = v10 - traceEncoder->super._timer;
  }
  else
  {
    v12 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v12;
  -[MTLCountersTraceRenderCommandEncoder memoryBarrierWithScope:afterStages:beforeStages:](self->_traceEncoder, "memoryBarrierWithScope:afterStages:beforeStages:", a3, a4, a5);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  MTLCountersTraceRenderCommandEncoder *traceEncoder;
  unint64_t v14;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithResources:count:afterStages:beforeStages:", a3, a4, a5, a6);
  if (*(&self->_APITimingEnabled + 4))
  {
    v12 = mach_absolute_time();
    traceEncoder = self->_traceEncoder;
    v14 = v12 - traceEncoder->super._timer;
  }
  else
  {
    v14 = 0;
    traceEncoder = self->_traceEncoder;
  }
  traceEncoder->super._timer = v14;
  -[MTLCountersTraceRenderCommandEncoder memoryBarrierWithResources:count:afterStages:beforeStages:](self->_traceEncoder, "memoryBarrierWithResources:count:afterStages:beforeStages:", a3, a4, a5, a6);
}

@end
