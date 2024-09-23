@implementation MTLToolsRenderCommandEncoder

- (MTLToolsRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLToolsRenderCommandEncoder;
  return -[MTLToolsCommandEncoder initWithBaseObject:parallelRenderCommandEncoder:](&v5, sel_initWithBaseObject_parallelRenderCommandEncoder_, a3, a4);
}

- (MTLToolsRenderCommandEncoder)initWithRenderCommandEncoder:(id)a3 parent:(id)a4 descriptor:(id)a5
{
  MTLToolsRenderCommandEncoder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLToolsRenderCommandEncoder;
  v7 = -[MTLToolsCommandEncoder initWithBaseObject:parent:](&v9, sel_initWithBaseObject_parent_, a3);
  if (v7)
    objc_msgSend(a4, "retainObjectsFromRenderPassDescriptor:", a5);
  return v7;
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v11 = a3;
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  *(float *)&v14 = a6;
  objc_msgSend(v10, "setBlendColorRed:green:blue:alpha:", v11, v12, v13, v14);
}

- (void)setRenderPipelineState:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBytes:length:atIndex:", a3, a4, a5);
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBufferOffset:atIndex:", a3, a4);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBuffer:offset:attributeStride:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[288];
  uint64_t v16;

  length = a6.length;
  location = a6.location;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexBuffers:offsets:attributeStrides:withRange:", v15, a4, a5, location, length);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBufferOffset:attributeStride:atIndex:", a3, a4, a5);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeCommandsInBuffer:withRange:", objc_msgSend(a3, "baseObject"), location, length);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", objc_msgSend(a3, "baseObject"), objc_msgSend(a4, "baseObject"), a5);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  const void **v9;
  _QWORD *v10;
  NSUInteger v11;
  void *v12;
  _BYTE v13[288];
  uint64_t v14;

  length = a5.length;
  location = a5.location;
  v14 = *MEMORY[0x24BDAC8D0];
  if (a5.length)
  {
    v9 = a3;
    v10 = v13;
    v11 = a5.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v9);
      v12 = (void *)*v9++;
      *v10++ = objc_msgSend(v12, "baseObject");
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[1024];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexTextures:withRange:", v11, location, length);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[128];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexSamplerStates:withRange:", v11, location, length);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v11, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v12, a6, v13, v14);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;

  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  *(float *)&v16 = a6;
  objc_msgSend(v12, "setVertexSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:", v13, a7, v14, v15, v16);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  length = a6.length;
  location = a6.location;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setViewport:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  v5 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->var4;
  objc_msgSend(v4, "setViewport:", v6);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewports:count:", a3, a4);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setScissorRects:count:", a3, a4);
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFrontFacingWinding:", a3);
}

- (void)setCullMode:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCullMode:", a3);
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  id v8;
  double v9;
  double v10;
  double v11;

  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v9 = a3;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v8, "setDepthBias:slopeScale:clamp:", v9, v10, v11);
}

- (void)setScissorRect:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[2];

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  v5 = *(_OWORD *)&a3->var2;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  objc_msgSend(v4, "setScissorRect:", v6);
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTriangleFillMode:", a3);
}

- (void)setVertexAmplificationMode:(unint64_t)a3 value:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationMode:value:", a3, a4);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAmplificationCount:viewMappings:", a3, a4);
}

- (void)setDepthClipMode:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthClipModeSPI:", a3);
}

- (void)setDepthClipModeSPI:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthClipModeSPI:", a3);
}

- (void)setCommandDataCorruptModeSPI:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setCommandDataCorruptModeSPI:", a3);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBytes:length:atIndex:", a3, a4, a5);
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBufferOffset:atIndex:", a3, a4);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  const void **v9;
  _QWORD *v10;
  NSUInteger v11;
  void *v12;
  _QWORD v13[32];

  length = a5.length;
  location = a5.location;
  v13[31] = *MEMORY[0x24BDAC8D0];
  if (a5.length)
  {
    v9 = a3;
    v10 = v13;
    v11 = a5.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v9);
      v12 = (void *)*v9++;
      *v10++ = objc_msgSend(v12, "baseObject");
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[1024];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentTextures:withRange:", v11, location, length);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[128];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentSamplerStates:withRange:", v11, location, length);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v11, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v12, a6, v13, v14);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 lodBias:(float)a6 atIndex:(unint64_t)a7
{
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;

  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  v13 = objc_msgSend(a3, "baseObject");
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  *(float *)&v16 = a6;
  objc_msgSend(v12, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:lodBias:atIndex:", v13, a7, v14, v15, v16);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  length = a6.length;
  location = a6.location;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setDepthStencilState:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStencilState:", objc_msgSend(a3, "baseObject"));
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilReferenceValue:", *(_QWORD *)&a3);
}

- (void)setDepthCleared
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthCleared");
}

- (void)setStencilCleared
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilCleared");
}

- (void)setAlphaTestReferenceValue:(float)a3
{
  id v4;
  double v5;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setAlphaTestReferenceValue:", v5);
}

- (void)setPointSize:(float)a3
{
  id v4;
  double v5;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setPointSize:", v5);
}

- (void)setClipPlane:(float)a3 p2:(float)a4 p3:(float)a5 p4:(float)a6 atIndex:(unint64_t)a7
{
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v13 = a3;
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  *(float *)&v16 = a6;
  objc_msgSend(v12, "setClipPlane:p2:p3:p4:atIndex:", a7, v13, v14, v15, v16);
}

- (void)setViewportTransformEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setViewportTransformEnabled:", a3);
}

- (void)setProvokingVertexMode:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setProvokingVertexMode:", a3);
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPrimitiveRestartEnabled:", a3);
}

- (void)setPrimitiveRestartEnabled:(BOOL)a3 index:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setPrimitiveRestartEnabled:index:", a3, a4);
}

- (void)setTriangleFrontFillMode:(unint64_t)a3 backFillMode:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTriangleFrontFillMode:backFillMode:", a3, a4);
}

- (void)setTransformFeedbackState:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTransformFeedbackState:", a3);
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6, a7);
}

- (void)setColorResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 atIndex:(unint64_t)a7 yInvert:(BOOL)a8
{
  _BOOL8 v8;

  v8 = a8;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorResolveTexture:slice:depthPlane:level:yInvert:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v8, a7);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setDepthResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  _BOOL8 v7;

  v7 = a7;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthResolveTexture:slice:depthPlane:level:yInvert:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v7);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:", objc_msgSend(a3, "baseObject"), a4, a5, a6);
}

- (void)setStencilResolveTexture:(id)a3 slice:(unint64_t)a4 depthPlane:(unint64_t)a5 level:(unint64_t)a6 yInvert:(BOOL)a7
{
  _BOOL8 v7;

  v7 = a7;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilResolveTexture:slice:depthPlane:level:yInvert:", objc_msgSend(a3, "baseObject"), a4, a5, a6, v7);
}

- (BOOL)isMemorylessRender
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "isMemorylessRender");
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4
{
  id v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[3];
  __int128 v10;
  unint64_t var2;

  v6 = -[MTLToolsObject baseObject](self, "baseObject");
  v7 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v8 = *(_OWORD *)&a4->var0.var2;
  v9[0] = *(_OWORD *)&a4->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a4->var1.var1;
  v10 = v7;
  objc_msgSend(v6, "dispatchThreadsPerTile:inRegion:", &v10, v9);
}

- (void)dispatchThreadsPerTile:(id *)a3 inRegion:(id *)a4 withRenderTargetArrayIndex:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  unint64_t var2;

  v5 = *(_QWORD *)&a5;
  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v9 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  v10 = *(_OWORD *)&a4->var0.var2;
  v11[0] = *(_OWORD *)&a4->var0.var0;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a4->var1.var1;
  v12 = v9;
  objc_msgSend(v8, "dispatchThreadsPerTile:inRegion:withRenderTargetArrayIndex:", &v12, v11, v5);
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilFrontReferenceValue:backReferenceValue:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreAction:", a3);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreAction:", a3);
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setColorStoreActionOptions:atIndex:", a3, a4);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setDepthStoreActionOptions:", a3);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setStencilStoreActionOptions:", a3);
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibilityResultMode:offset:", a3, a4);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:", a3, a4, a5, a6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a4);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a5);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a7);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, objc_msgSend(a5, "baseObject"), a6, objc_msgSend(a7, "baseObject"), a8);
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTessellationFactorBuffer:offset:instanceStride:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setTessellationFactorScale:(float)a3
{
  id v4;
  double v5;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setTessellationFactorScale:", v5);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, a8);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a4);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5, objc_msgSend(a6, "baseObject"), a7);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"));
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a4);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a6);
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a8);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, objc_msgSend(a4, "baseObject"), a5, objc_msgSend(a6, "baseObject"), a7, objc_msgSend(a8, "baseObject"));
}

- (void)setLineWidth:(float)a3
{
  id v4;
  double v5;

  v4 = -[MTLToolsObject baseObject](self, "baseObject");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setLineWidth:", v5);
}

- (void)addSplitHandler:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "addSplitHandler:", a3);
}

- (void)setFragmentTexture:(id)a3 atTextureIndex:(unint64_t)a4 samplerState:(id)a5 atSamplerIndex:(unint64_t)a6
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a5);
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", objc_msgSend(a3, "baseObject"), a4, objc_msgSend(a5, "baseObject"), a6);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "updateFence:afterStages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "waitForFence:beforeStages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBytes:length:atIndex:", a3, a4, a5);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileBufferOffset:atIndex:", a3, a4);
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  char *v9;
  const void **v10;
  _QWORD *v11;
  NSUInteger v12;
  void *v13;
  _QWORD v14[2];

  length = a5.length;
  location = a5.location;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v9 = (char *)v14 - ((8 * a5.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5.length)
  {
    v10 = a3;
    v11 = (_QWORD *)((char *)v14 - ((8 * a5.length + 15) & 0xFFFFFFFFFFFFFFF0));
    v12 = a5.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v10);
      v13 = (void *)*v10++;
      *v11++ = objc_msgSend(v13, "baseObject");
      --v12;
    }
    while (v12);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileBuffers:offsets:withRange:", v9, a4, location, length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char *v7;
  const void **v8;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v7 = (char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4.length)
  {
    v8 = a3;
    v9 = (_QWORD *)((char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0));
    v10 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v8);
      v11 = (void *)*v8++;
      *v9++ = objc_msgSend(v11, "baseObject");
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileTextures:withRange:", v7, location, length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char *v7;
  const void **v8;
  _QWORD *v9;
  NSUInteger v10;
  void *v11;
  _QWORD v12[2];

  length = a4.length;
  location = a4.location;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v7 = (char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4.length)
  {
    v8 = a3;
    v9 = (_QWORD *)((char *)v12 - ((8 * a4.length + 15) & 0xFFFFFFFFFFFFFFF0));
    v10 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v8);
      v11 = (void *)*v8++;
      *v9++ = objc_msgSend(v11, "baseObject");
      --v10;
    }
    while (v10);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileSamplerStates:withRange:", v7, location, length);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v11, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v12, a6, v13, v14);
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  char *v11;
  const void **v12;
  _QWORD *v13;
  NSUInteger v14;
  void *v15;
  _QWORD v16[2];

  length = a6.length;
  location = a6.location;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v11 = (char *)v16 - ((8 * a6.length + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6.length)
  {
    v12 = a3;
    v13 = (_QWORD *)((char *)v16 - ((8 * a6.length + 15) & 0xFFFFFFFFFFFFFFF0));
    v14 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v12);
      v15 = (void *)*v12++;
      *v13++ = objc_msgSend(v15, "baseObject");
      --v14;
    }
    while (v14);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v11, a4, a5, location, length);
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
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResource:usage:stages:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)useRenderPipelineState:(id)a3
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useRenderPipelineState:", objc_msgSend(a3, "baseObject"));
}

- (void)useRenderPipelineStates:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto22MTLRenderPipelineState}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useRenderPipelineStates:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *__p[3];

  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v9]);
      v10 = objc_msgSend((id)a3[v9], "baseObject");
      *((_QWORD *)__p[0] + v9++) = v10;
    }
    while (a4 != v9);
  }
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v11, "useResources:count:usage:", __p[0], a4, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *__p[3];

  std::vector<objc_object  {objcproto11MTLResource}*>::vector(__p, a4);
  if (a4)
  {
    v11 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v11]);
      v12 = objc_msgSend((id)a3[v11], "baseObject");
      *((_QWORD *)__p[0] + v11++) = v12;
    }
    while (a4 != v11);
  }
  v13 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v13, "useResources:count:usage:stages:", __p[0], a4, a5, a6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:", objc_msgSend(a3, "baseObject"));
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useHeaps:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useHeap:stages:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *__p[3];

  std::vector<objc_object  {objcproto7MTLHeap}*>::vector(__p, a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v9]);
      v10 = objc_msgSend((id)a3[v9], "baseObject");
      *((_QWORD *)__p[0] + v9++) = v10;
    }
    while (a4 != v9);
  }
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v11, "useHeaps:count:stages:", __p[0], a4, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (unint64_t)tileWidth
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tileWidth");
}

- (unint64_t)tileHeight
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "tileHeight");
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "sampleCountersInBuffer:atSampleIndex:withBarrier:", objc_msgSend(a3, "baseObject"), a4, v5);
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBytes:length:atIndex:", a3, a4, a5);
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBufferOffset:atIndex:", a3, a4);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  const void **v9;
  _QWORD *v10;
  NSUInteger v11;
  void *v12;
  _QWORD v13[32];

  length = a5.length;
  location = a5.location;
  v13[31] = *MEMORY[0x24BDAC8D0];
  if (a5.length)
  {
    v9 = a3;
    v10 = v13;
    v11 = a5.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v9);
      v12 = (void *)*v9++;
      *v10++ = objc_msgSend(v12, "baseObject");
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[1024];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectTextures:withRange:", v11, location, length);
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[128];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectSamplerStates:withRange:", v11, location, length);
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v11, "setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v12, a6, v13, v14);
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  length = a6.length;
  location = a6.location;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBytes:length:atIndex:", a3, a4, a5);
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBufferOffset:atIndex:", a3, a4);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  const void **v9;
  _QWORD *v10;
  NSUInteger v11;
  void *v12;
  _QWORD v13[32];

  length = a5.length;
  location = a5.location;
  v13[31] = *MEMORY[0x24BDAC8D0];
  if (a5.length)
  {
    v9 = a3;
    v10 = v13;
    v11 = a5.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v9);
      v12 = (void *)*v9++;
      *v10++ = objc_msgSend(v12, "baseObject");
      --v11;
    }
    while (v11);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshBuffers:offsets:withRange:", v13, a4, location, length);
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshTexture:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[1024];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshTextures:withRange:", v11, location, length);
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshSamplerState:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const void **v7;
  _QWORD *v8;
  NSUInteger v9;
  void *v10;
  _BYTE v11[128];
  uint64_t v12;

  length = a4.length;
  location = a4.location;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a4.length)
  {
    v7 = a3;
    v8 = v11;
    v9 = a4.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v7);
      v10 = (void *)*v7++;
      *v8++ = objc_msgSend(v10, "baseObject");
      --v9;
    }
    while (v9);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshSamplerStates:withRange:", v11, location, length);
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v11;
  uint64_t v12;
  double v13;
  double v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  objc_msgSend(v11, "setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:", v12, a6, v13, v14);
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  const void **v11;
  _QWORD *v12;
  NSUInteger v13;
  void *v14;
  _BYTE v15[128];
  uint64_t v16;

  length = a6.length;
  location = a6.location;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a6.length)
  {
    v11 = a3;
    v12 = v15;
    v13 = a6.length;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", *v11);
      v14 = (void *)*v11++;
      *v12++ = objc_msgSend(v14, "baseObject");
      --v13;
    }
    while (v13);
  }
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject", a3), "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", v15, a4, a5, location, length);
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = *a3;
  v10 = *a4;
  v9 = *a5;
  objc_msgSend(v8, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v11, &v10, &v9);
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  id v11;
  uint64_t v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;

  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  v11 = -[MTLToolsObject baseObject](self, "baseObject");
  v12 = objc_msgSend(a3, "baseObject");
  v14 = *a5;
  v13 = *a6;
  objc_msgSend(v11, "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", v12, a4, &v14, &v13);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  id v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  v8 = -[MTLToolsObject baseObject](self, "baseObject");
  v11 = *a3;
  v10 = *a4;
  v9 = *a5;
  objc_msgSend(v8, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v11, &v10, &v9);
}

- (void)useResourceGroup:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResourceGroup:usage:stages:", a3, a4, a5);
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setVertexVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setFragmentVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setTileVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setObjectVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setMeshVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:stage:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 stage:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v11 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v11;
    }
  }
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v12, "setVisibleFunctionTables:withBufferRange:stage:", __p[0], location, length, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v7, "setVertexIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v7, "setFragmentIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v7, "setTileIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVertexAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFragmentAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setTileAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v7, "setObjectIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setObjectAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshIntersectionFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  v7 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v7, "setMeshIntersectionFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setMeshAccelerationStructure:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setIntersectionFunctionTable:atBufferIndex:stage:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4 stage:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  buildBaseVector((uint64_t)a3, a4.length, __p);
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "setIntersectionFunctionTables:withBufferRange:stage:", __p[0], location, length, a5);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4 stage:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setAccelerationStructure:atBufferIndex:stage:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "endEncodingAndRetrieveProgramAddressTable");
}

- (void)enableNullBufferBinds:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MTLToolsObject baseObject](self, "baseObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "enableNullBufferBinds:", v3);
}

- (void)useResidencySet:(id)a3
{
  -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:");
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "useResidencySet:", objc_msgSend(a3, "baseObject"));
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *__p[3];

  std::vector<objc_object  {objcproto15MTLResidencySet}*>::vector(__p, a4);
  if (a4)
  {
    v7 = 0;
    do
    {
      -[MTLToolsCommandEncoder addRetainedObject:](self, "addRetainedObject:", a3[v7]);
      v8 = objc_msgSend((id)a3[v7], "baseObject");
      *((_QWORD *)__p[0] + v7++) = v8;
    }
    while (a4 != v7);
  }
  v9 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v9, "useResidencySets:count:", __p[0], a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

@end
