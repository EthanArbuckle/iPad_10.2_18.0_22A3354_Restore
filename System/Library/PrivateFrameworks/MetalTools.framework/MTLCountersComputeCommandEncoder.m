@implementation MTLCountersComputeCommandEncoder

- (MTLCountersComputeCommandEncoder)initWithComputeCommandEncoder:(id)a3 commandBuffer:(id)a4 descriptor:(id)a5
{
  MTLCountersComputeCommandEncoder *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLCountersComputeCommandEncoder;
  v6 = -[MTLToolsComputeCommandEncoder initWithComputeCommandEncoder:parent:descriptor:](&v8, sel_initWithComputeCommandEncoder_parent_descriptor_, a3, a4, a5);
  if (v6)
  {
    v6->_traceEncoder = (MTLCountersTraceComputeCommandEncoder *)(id)objc_msgSend((id)objc_msgSend(a4, "traceBuffer"), "computeCommandEncoder");
    *(&v6->_APITimingEnabled + 4) = objc_msgSend((id)objc_msgSend(a4, "device"), "APITimingEnabled");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCountersComputeCommandEncoder;
  -[MTLToolsObject dealloc](&v3, sel_dealloc);
}

- (void)insertDebugSignpost:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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

- (void)setComputePipelineState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setComputePipelineState:", a3);
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
  -[MTLCountersTraceComputeCommandEncoder setComputePipelineState:](self->_traceEncoder, "setComputePipelineState:", a3);
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBytes:length:atIndex:", a3, a4, a5);
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
  -[MTLCountersTraceComputeCommandEncoder setBytes:length:atIndex:](self->_traceEncoder, "setBytes:length:atIndex:", a3, a4, a5);
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v12;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", a3, a4, a5);
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
  -[MTLCountersTraceComputeCommandEncoder setBuffer:offset:atIndex:](self->_traceEncoder, "setBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBufferOffset:atIndex:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setBufferOffset:atIndex:](self->_traceEncoder, "setBufferOffset:atIndex:", a3, a4);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v13;

  length = a5.length;
  location = a5.location;
  if (*(&self->_APITimingEnabled + 4))
    v10 = mach_absolute_time();
  else
    v10 = 0;
  self->_traceEncoder->super._timer = v10;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffers:offsets:withRange:", a3, a4, location, length);
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
  -[MTLCountersTraceComputeCommandEncoder setBuffers:offsets:withRange:](self->_traceEncoder, "setBuffers:offsets:withRange:", a3, a4, location, length);
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTexture:atIndex:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setTexture:atIndex:](self->_traceEncoder, "setTexture:atIndex:", a3, a4);
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTextures:withRange:", a3, location, length);
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
  -[MTLCountersTraceComputeCommandEncoder setTextures:withRange:](self->_traceEncoder, "setTextures:withRange:", a3, location, length);
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerState:atIndex:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setSamplerState:atIndex:](self->_traceEncoder, "setSamplerState:atIndex:", a3, a4);
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerStates:withRange:", a3, location, length);
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
  -[MTLCountersTraceComputeCommandEncoder setSamplerStates:withRange:](self->_traceEncoder, "setSamplerStates:withRange:", a3, location, length);
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v19;

  if (*(&self->_APITimingEnabled + 4))
    v11 = mach_absolute_time();
  else
    v11 = 0;
  self->_traceEncoder->super._timer = v11;
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v12, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v13, v14);
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
  -[MTLCountersTraceComputeCommandEncoder setSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_traceEncoder, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6, v15, v16);
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  uint64_t v13;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v15;

  length = a6.length;
  location = a6.location;
  if (*(&self->_APITimingEnabled + 4))
    v12 = mach_absolute_time();
  else
    v12 = 0;
  self->_traceEncoder->super._timer = v12;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
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
  -[MTLCountersTraceComputeCommandEncoder setSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_traceEncoder, "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, location, length);
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setThreadgroupMemoryLength:atIndex:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setThreadgroupMemoryLength:atIndex:](self->_traceEncoder, "setThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (void)setImageBlockWidth:(unint64_t)a3 height:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setImageBlockWidth:height:", a3, a4);
}

- (void)setStageInRegion:(id *)a3
{
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;
  MTLCountersTraceComputeCommandEncoder *v11;
  __int128 v12;
  _OWORD v13[3];
  _OWORD v14[3];

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v7 = *(_OWORD *)&a3->var0.var2;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v7;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v6, "setStageInRegion:", v14);
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
  v12 = *(_OWORD *)&a3->var0.var2;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v12;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  -[MTLCountersTraceComputeCommandEncoder setStageInRegion:](v11, "setStageInRegion:", v13);
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setStageInRegionWithIndirectBuffer:indirectBufferOffset:](self->_traceEncoder, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", a3, a4);
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v11;
  MTLCountersTraceComputeCommandEncoder *v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  __int128 v19;
  unint64_t var2;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v17 = *(_OWORD *)&a4->var0;
  v18 = a4->var2;
  objc_msgSend(v8, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
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
  v12 = self->_traceEncoder;
  v15 = *(_OWORD *)&a3->var0;
  v16 = a3->var2;
  v13 = *(_OWORD *)&a4->var0;
  v14 = a4->var2;
  -[MTLCountersTraceComputeCommandEncoder dispatchThreadgroups:threadsPerThreadgroup:](v12, "dispatchThreadgroups:threadsPerThreadgroup:", &v15, &v13);
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v13;
  MTLCountersTraceComputeCommandEncoder *v14;
  __int128 v15;
  unint64_t v16;
  __int128 v17;
  unint64_t var2;

  if (*(&self->_APITimingEnabled + 4))
    v9 = mach_absolute_time();
  else
    v9 = 0;
  self->_traceEncoder->super._timer = v9;
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  v17 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  objc_msgSend(v10, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a3, a4, &v17);
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
  v14 = self->_traceEncoder;
  v15 = *(_OWORD *)&a5->var0;
  v16 = a5->var2;
  -[MTLCountersTraceComputeCommandEncoder dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:](v14, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a3, a4, &v15);
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v11;
  MTLCountersTraceComputeCommandEncoder *v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  __int128 v19;
  unint64_t var2;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v19 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v17 = *(_OWORD *)&a4->var0;
  v18 = a4->var2;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", &v19, &v17);
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
  v12 = self->_traceEncoder;
  v15 = *(_OWORD *)&a3->var0;
  v16 = a3->var2;
  v13 = *(_OWORD *)&a4->var0;
  v14 = a4->var2;
  -[MTLCountersTraceComputeCommandEncoder dispatchThreads:threadsPerThreadgroup:](v12, "dispatchThreads:threadsPerThreadgroup:", &v15, &v13);
}

- (void)dispatchThreadsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder dispatchThreadsWithIndirectBuffer:indirectBufferOffset:](self->_traceEncoder, "dispatchThreadsWithIndirectBuffer:indirectBufferOffset:", a3, a4);
}

- (void)updateFence:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:", a3);
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
  -[MTLCountersTraceComputeCommandEncoder updateFence:](self->_traceEncoder, "updateFence:", a3);
}

- (void)waitForFence:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:", a3);
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
  -[MTLCountersTraceComputeCommandEncoder waitForFence:](self->_traceEncoder, "waitForFence:", a3);
}

- (void)endEncoding
{
  uint64_t v3;
  uint64_t v4;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  -[MTLCountersTraceComputeCommandEncoder useResource:usage:](self->_traceEncoder, "useResource:usage:", a3, a4);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  -[MTLCountersTraceComputeCommandEncoder useResources:count:usage:](self->_traceEncoder, "useResources:count:usage:", a3, a4, a5);
}

- (void)useHeap:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  -[MTLCountersTraceComputeCommandEncoder useHeap:](self->_traceEncoder, "useHeap:", a3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
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
  -[MTLCountersTraceComputeCommandEncoder useHeaps:count:](self->_traceEncoder, "useHeaps:count:", a3, a4);
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v8;

  if (*(&self->_APITimingEnabled + 4))
    v5 = mach_absolute_time();
  else
    v5 = 0;
  self->_traceEncoder->super._timer = v5;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithScope:", a3);
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
  -[MTLCountersTraceComputeCommandEncoder memoryBarrierWithScope:](self->_traceEncoder, "memoryBarrierWithScope:", a3);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "memoryBarrierWithResources:count:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder memoryBarrierWithResources:count:](self->_traceEncoder, "memoryBarrierWithResources:count:", a3, a4);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setVisibleFunctionTable:atBufferIndex:](self->_traceEncoder, "setVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTables:withBufferRange:", a3, location, length);
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
  -[MTLCountersTraceComputeCommandEncoder setVisibleFunctionTables:withBufferRange:](self->_traceEncoder, "setVisibleFunctionTables:withBufferRange:", a3, location, length);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v10;

  if (*(&self->_APITimingEnabled + 4))
    v7 = mach_absolute_time();
  else
    v7 = 0;
  self->_traceEncoder->super._timer = v7;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:", a3, a4);
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
  -[MTLCountersTraceComputeCommandEncoder setIntersectionFunctionTable:atBufferIndex:](self->_traceEncoder, "setIntersectionFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  MTLCountersTraceComputeCommandEncoder *traceEncoder;
  unint64_t v11;

  length = a4.length;
  location = a4.location;
  if (*(&self->_APITimingEnabled + 4))
    v8 = mach_absolute_time();
  else
    v8 = 0;
  self->_traceEncoder->super._timer = v8;
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTables:withBufferRange:", a3, location, length);
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
  -[MTLCountersTraceComputeCommandEncoder setIntersectionFunctionTables:withBufferRange:](self->_traceEncoder, "setIntersectionFunctionTables:withBufferRange:", a3, location, length);
}

@end
