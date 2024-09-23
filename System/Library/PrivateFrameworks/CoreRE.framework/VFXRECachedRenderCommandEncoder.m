@implementation VFXRECachedRenderCommandEncoder

- (VFXRECachedRenderCommandEncoder)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXRECachedRenderCommandEncoder;
  return -[VFXRECachedRenderCommandEncoder init](&v3, sel_init);
}

- (void)setEncoder:(id)a3 state:(void *)a4
{
  id v7;
  re *v8[2];

  objc_storeStrong((id *)&self->_encoder, a3);
  v7 = a3;
  re::mtl::RenderCommandEncoder::RenderCommandEncoder(v8, v7);

  re::ObjCObject::operator=((id *)&self->_encoderCPP.m_object, (id *)v8);
  re::mtl::RenderEncoderImpCache::build((re::mtl::RenderEncoderImpCache *)self->_encoderCPP.var0, self->_encoderCPP.m_object);
  re::mtl::RenderCommandEncoder::~RenderCommandEncoder((re::mtl::RenderCommandEncoder *)v8);
  self->_encoderState = a4;
}

- (MTLDevice)device
{
  return (MTLDevice *)-[MTLRenderCommandEncoder device](self->_encoder, "device");
}

- (NSString)label
{
  return (NSString *)-[MTLRenderCommandEncoder label](self->_encoder, "label");
}

- (void)setLabel:(id)a3
{
  -[MTLRenderCommandEncoder setLabel:](self->_encoder, "setLabel:", a3);
}

- (unint64_t)tileWidth
{
  return -[MTLRenderCommandEncoder tileWidth](self->_encoder, "tileWidth");
}

- (unint64_t)tileHeight
{
  return -[MTLRenderCommandEncoder tileHeight](self->_encoder, "tileHeight");
}

- (void)setCullMode:(unint64_t)a3
{
  re::EncoderState::setCullMode((uint64_t)self->_encoderState, a3, (uint64_t)&self->_encoderCPP);
}

- (void)setTriangleFillMode:(unint64_t)a3
{
  re::EncoderState::setTriangleFillMode((uint64_t)self->_encoderState, a3, (uint64_t)&self->_encoderCPP);
}

- (void)setStencilReferenceValue:(unsigned int)a3
{
  re::EncoderState::setStencilReferenceValues((uint64_t)self->_encoderState, a3, a3, &self->_encoderCPP);
}

- (void)setStencilFrontReferenceValue:(unsigned int)a3 backReferenceValue:(unsigned int)a4
{
  re::EncoderState::setStencilReferenceValues((uint64_t)self->_encoderState, a3, a4, &self->_encoderCPP);
}

- (void)setFrontFacingWinding:(unint64_t)a3
{
  char v3;
  _BYTE *encoderState;

  v3 = a3;
  encoderState = self->_encoderState;
  if ((*(_WORD *)encoderState & 0x10) == 0 || encoderState[20] != a3)
  {
    (*((void (**)(_QWORD, char *, _QWORD))self->_encoderCPP.var0 + 17))(*(_QWORD *)self->_encoderCPP.var0, sel_setFrontFacingWinding_, a3);
    encoderState[20] = v3;
    *(_WORD *)encoderState |= 0x10u;
  }
}

- (void)setDepthStencilState:(id)a3
{
  id v4;

  v4 = a3;
  re::EncoderState::setDepthStencilState((void **)self->_encoderState, &v4, (uint64_t)&self->_encoderCPP);

}

- (void)setRenderPipelineState:(id)a3
{
  id v4;
  void **encoderState;
  id v6;
  id v7;

  v4 = a3;
  encoderState = (void **)self->_encoderState;
  v7 = v4;
  v6 = v4;
  re::EncoderState::setRenderPipelineState(encoderState, &v7, (uint64_t)&self->_encoderCPP);
  if (v7)

}

- (void)endEncoding
{
  -[MTLRenderCommandEncoder endEncoding](self->_encoder, "endEncoding");
}

- (void)insertDebugSignpost:(id)a3
{
  -[MTLRenderCommandEncoder insertDebugSignpost:](self->_encoder, "insertDebugSignpost:", a3);
}

- (void)popDebugGroup
{
  -[MTLRenderCommandEncoder popDebugGroup](self->_encoder, "popDebugGroup");
}

- (void)pushDebugGroup:(id)a3
{
  -[MTLRenderCommandEncoder pushDebugGroup:](self->_encoder, "pushDebugGroup:", a3);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7
{
  -[MTLRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:](self->_encoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8
{
  -[MTLRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:](self->_encoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexCount:(unint64_t)a4 indexType:(unint64_t)a5 indexBuffer:(id)a6 indexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseVertex:(int64_t)a9 baseInstance:(unint64_t)a10
{
  -[MTLRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:](self->_encoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPrimitives:(unint64_t)a3 indexType:(unint64_t)a4 indexBuffer:(id)a5 indexBufferOffset:(unint64_t)a6 indirectBuffer:(id)a7 indirectBufferOffset:(unint64_t)a8
{
  -[MTLRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:](self->_encoder, "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
}

- (void)drawPrimitives:(unint64_t)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:](self->_encoder, "drawPrimitives:indirectBuffer:indirectBufferOffset:", a3, a4, a5);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5
{
  -[MTLRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:](self->_encoder, "drawPrimitives:vertexStart:vertexCount:", a3, a4, a5);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6
{
  -[MTLRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:](self->_encoder, "drawPrimitives:vertexStart:vertexCount:instanceCount:", a3, a4, a5, a6);
}

- (void)drawPrimitives:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 instanceCount:(unint64_t)a6 baseInstance:(unint64_t)a7
{
  -[MTLRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:](self->_encoder, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", a3, a4, a5, a6, a7);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 controlPointIndexBuffer:(id)a6 controlPointIndexBufferOffset:(unint64_t)a7 indirectBuffer:(id)a8 indirectBufferOffset:(unint64_t)a9
{
  -[MTLRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:](self->_encoder, "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7, a8);
}

- (void)drawIndexedPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 controlPointIndexBuffer:(id)a8 controlPointIndexBufferOffset:(unint64_t)a9 instanceCount:(unint64_t)a10 baseInstance:(unint64_t)a11
{
  -[MTLRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:](self->_encoder, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  MTLRenderCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  encoder = self->_encoder;
  v8 = *a3;
  v7 = *a4;
  v6 = *a5;
  -[MTLRenderCommandEncoder drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](encoder, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v8, &v7, &v6);
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  MTLRenderCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  encoder = self->_encoder;
  v8 = *a5;
  v7 = *a6;
  -[MTLRenderCommandEncoder drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](encoder, "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", a3, a4, &v8, &v7);
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  MTLRenderCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8;

  encoder = self->_encoder;
  v8 = *a3;
  v7 = *a4;
  v6 = *a5;
  -[MTLRenderCommandEncoder drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:](encoder, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", &v8, &v7, &v6);
}

- (void)drawPatches:(unint64_t)a3 patchIndexBuffer:(id)a4 patchIndexBufferOffset:(unint64_t)a5 indirectBuffer:(id)a6 indirectBufferOffset:(unint64_t)a7
{
  -[MTLRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:](self->_encoder, "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", a3, a4, a5, a6, a7);
}

- (void)drawPatches:(unint64_t)a3 patchStart:(unint64_t)a4 patchCount:(unint64_t)a5 patchIndexBuffer:(id)a6 patchIndexBufferOffset:(unint64_t)a7 instanceCount:(unint64_t)a8 baseInstance:(unint64_t)a9
{
  -[MTLRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:](self->_encoder, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", a3, a4, a5, a6, a7, a8);
}

- (void)setBlendColorRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  -[MTLRenderCommandEncoder setBlendColorRed:green:blue:alpha:](self->_encoder, "setBlendColorRed:green:blue:alpha:");
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setColorStoreAction:atIndex:](self->_encoder, "setColorStoreAction:atIndex:", a3, a4);
}

- (void)setColorStoreActionOptions:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setColorStoreActionOptions:atIndex:](self->_encoder, "setColorStoreActionOptions:atIndex:", a3, a4);
}

- (void)setDepthBias:(float)a3 slopeScale:(float)a4 clamp:(float)a5
{
  -[MTLRenderCommandEncoder setDepthBias:slopeScale:clamp:](self->_encoder, "setDepthBias:slopeScale:clamp:");
}

- (void)setDepthClipMode:(unint64_t)a3
{
  -[MTLRenderCommandEncoder setDepthClipMode:](self->_encoder, "setDepthClipMode:", a3);
}

- (void)setDepthStoreAction:(unint64_t)a3
{
  -[MTLRenderCommandEncoder setDepthStoreAction:](self->_encoder, "setDepthStoreAction:", a3);
}

- (void)setDepthStoreActionOptions:(unint64_t)a3
{
  -[MTLRenderCommandEncoder setDepthStoreActionOptions:](self->_encoder, "setDepthStoreActionOptions:", a3);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setVertexBytes:length:atIndex:](self->_encoder, "setVertexBytes:length:atIndex:", a3, a4, a5);
}

- (void)setScissorRect:(id *)a3
{
  MTLRenderCommandEncoder *encoder;
  __int128 v4;
  _OWORD v5[2];

  encoder = self->_encoder;
  v4 = *(_OWORD *)&a3->var2;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  -[MTLRenderCommandEncoder setScissorRect:](encoder, "setScissorRect:", v5);
}

- (void)setScissorRects:(id *)a3 count:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setScissorRects:count:](self->_encoder, "setScissorRects:count:", a3, a4);
}

- (void)setStencilStoreAction:(unint64_t)a3
{
  -[MTLRenderCommandEncoder setStencilStoreAction:](self->_encoder, "setStencilStoreAction:", a3);
}

- (void)setStencilStoreActionOptions:(unint64_t)a3
{
  -[MTLRenderCommandEncoder setStencilStoreActionOptions:](self->_encoder, "setStencilStoreActionOptions:", a3);
}

- (void)setFragmentBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setFragmentBuffer:offset:atIndex:](self->_encoder, "setFragmentBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setFragmentBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setFragmentBufferOffset:atIndex:](self->_encoder, "setFragmentBufferOffset:atIndex:", a3, a4);
}

- (void)setFragmentBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLRenderCommandEncoder setFragmentBuffers:offsets:withRange:](self->_encoder, "setFragmentBuffers:offsets:withRange:", a3, a4, a5.location, a5.length);
}

- (void)setFragmentBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setFragmentBytes:length:atIndex:](self->_encoder, "setFragmentBytes:length:atIndex:", a3, a4, a5);
}

- (void)setFragmentSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setFragmentSamplerState:atIndex:](self->_encoder, "setFragmentSamplerState:atIndex:", a3, a4);
}

- (void)setFragmentSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_encoder, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6);
}

- (void)setFragmentSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[MTLRenderCommandEncoder setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_encoder, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)setFragmentSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setFragmentSamplerStates:withRange:](self->_encoder, "setFragmentSamplerStates:withRange:", a3, a4.location, a4.length);
}

- (void)setFragmentTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setFragmentTexture:atIndex:](self->_encoder, "setFragmentTexture:atIndex:", a3, a4);
}

- (void)setFragmentTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setFragmentTextures:withRange:](self->_encoder, "setFragmentTextures:withRange:", a3, a4.location, a4.length);
}

- (void)setVertexAmplificationCount:(unint64_t)a3 viewMappings:(id *)a4
{
  -[MTLRenderCommandEncoder setVertexAmplificationCount:viewMappings:](self->_encoder, "setVertexAmplificationCount:viewMappings:", a3, a4);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setVertexBuffer:offset:atIndex:](self->_encoder, "setVertexBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setVertexBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVertexBufferOffset:atIndex:](self->_encoder, "setVertexBufferOffset:atIndex:", a3, a4);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLRenderCommandEncoder setVertexBuffers:offsets:withRange:](self->_encoder, "setVertexBuffers:offsets:withRange:", a3, a4, a5.location, a5.length);
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:](self->_encoder, "setVertexBuffer:offset:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
  -[MTLRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:](self->_encoder, "setVertexBuffers:offsets:attributeStrides:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setVertexBufferOffset:attributeStride:atIndex:](self->_encoder, "setVertexBufferOffset:attributeStride:atIndex:", a3, a4, a5);
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setVertexBytes:length:attributeStride:atIndex:](self->_encoder, "setVertexBytes:length:attributeStride:atIndex:", a3, a4, a5, a6);
}

- (void)setVertexSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVertexSamplerState:atIndex:](self->_encoder, "setVertexSamplerState:atIndex:", a3, a4);
}

- (void)setVertexSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_encoder, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6);
}

- (void)setVertexSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[MTLRenderCommandEncoder setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_encoder, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)setVertexSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setVertexSamplerStates:withRange:](self->_encoder, "setVertexSamplerStates:withRange:", a3, a4.location, a4.length);
}

- (void)setVertexTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVertexTexture:atIndex:](self->_encoder, "setVertexTexture:atIndex:", a3, a4);
}

- (void)setVertexTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setVertexTextures:withRange:](self->_encoder, "setVertexTextures:withRange:", a3, a4.location, a4.length);
}

- (void)setViewport:(id *)a3
{
  MTLRenderCommandEncoder *encoder;
  __int128 v4;
  _OWORD v5[3];

  encoder = self->_encoder;
  v4 = *(_OWORD *)&a3->var2;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->var4;
  -[MTLRenderCommandEncoder setViewport:](encoder, "setViewport:", v5);
}

- (void)setViewports:(id *)a3 count:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setViewports:count:](self->_encoder, "setViewports:count:", a3, a4);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4
{
  -[MTLRenderCommandEncoder useResource:usage:stages:](self->_encoder, "useResource:usage:stages:", a3, a4, 3);
}

- (void)useResource:(id)a3 usage:(unint64_t)a4 stages:(unint64_t)a5
{
  -[MTLRenderCommandEncoder useResource:usage:stages:](self->_encoder, "useResource:usage:stages:", a3, a4, a5);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5
{
  -[MTLRenderCommandEncoder useResources:count:usage:stages:](self->_encoder, "useResources:count:usage:stages:", a3, a4, a5, 3);
}

- (void)useResources:(const void *)a3 count:(unint64_t)a4 usage:(unint64_t)a5 stages:(unint64_t)a6
{
  -[MTLRenderCommandEncoder useResources:count:usage:stages:](self->_encoder, "useResources:count:usage:stages:", a3, a4, a5, a6);
}

- (void)dispatchThreadsPerTile:(id *)a3
{
  MTLRenderCommandEncoder *encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v4;

  encoder = self->_encoder;
  v4 = *a3;
  -[MTLRenderCommandEncoder dispatchThreadsPerTile:](encoder, "dispatchThreadsPerTile:", &v4);
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  -[MTLRenderCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:](self->_encoder, "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", a3, a4, a5);
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder executeCommandsInBuffer:withRange:](self->_encoder, "executeCommandsInBuffer:withRange:", a3, a4.location, a4.length);
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4 afterStages:(unint64_t)a5 beforeStages:(unint64_t)a6
{
  -[MTLRenderCommandEncoder memoryBarrierWithResources:count:afterStages:beforeStages:](self->_encoder, "memoryBarrierWithResources:count:afterStages:beforeStages:", a3, a4, a5, a6);
}

- (void)memoryBarrierWithScope:(unint64_t)a3 afterStages:(unint64_t)a4 beforeStages:(unint64_t)a5
{
  -[MTLRenderCommandEncoder memoryBarrierWithScope:afterStages:beforeStages:](self->_encoder, "memoryBarrierWithScope:afterStages:beforeStages:", a3, a4, a5);
}

- (void)sampleCountersInBuffer:(id)a3 atSampleIndex:(unint64_t)a4 withBarrier:(BOOL)a5
{
  -[MTLRenderCommandEncoder sampleCountersInBuffer:atSampleIndex:withBarrier:](self->_encoder, "sampleCountersInBuffer:atSampleIndex:withBarrier:", a3, a4, a5);
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setFragmentAccelerationStructure:atBufferIndex:](self->_encoder, "setFragmentAccelerationStructure:atBufferIndex:", a3, a4);
}

- (void)setFragmentIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setFragmentIntersectionFunctionTable:atBufferIndex:](self->_encoder, "setFragmentIntersectionFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setFragmentIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setFragmentIntersectionFunctionTables:withBufferRange:](self->_encoder, "setFragmentIntersectionFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (void)setFragmentVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setFragmentVisibleFunctionTable:atBufferIndex:](self->_encoder, "setFragmentVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setFragmentVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setFragmentVisibleFunctionTables:withBufferRange:](self->_encoder, "setFragmentVisibleFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setMeshBuffer:offset:atIndex:](self->_encoder, "setMeshBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setMeshBufferOffset:atIndex:](self->_encoder, "setMeshBufferOffset:atIndex:", a3, a4);
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLRenderCommandEncoder setMeshBuffers:offsets:withRange:](self->_encoder, "setMeshBuffers:offsets:withRange:", a3, a4, a5.location, a5.length);
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setMeshBytes:length:atIndex:](self->_encoder, "setMeshBytes:length:atIndex:", a3, a4, a5);
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setMeshSamplerState:atIndex:](self->_encoder, "setMeshSamplerState:atIndex:", a3, a4);
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_encoder, "setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6);
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[MTLRenderCommandEncoder setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_encoder, "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setMeshSamplerStates:withRange:](self->_encoder, "setMeshSamplerStates:withRange:", a3, a4.location, a4.length);
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setMeshTexture:atIndex:](self->_encoder, "setMeshTexture:atIndex:", a3, a4);
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setMeshTextures:withRange:](self->_encoder, "setMeshTextures:withRange:", a3, a4.location, a4.length);
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setObjectBuffer:offset:atIndex:](self->_encoder, "setObjectBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setObjectBufferOffset:atIndex:](self->_encoder, "setObjectBufferOffset:atIndex:", a3, a4);
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLRenderCommandEncoder setObjectBuffers:offsets:withRange:](self->_encoder, "setObjectBuffers:offsets:withRange:", a3, a4, a5.location, a5.length);
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setObjectBytes:length:atIndex:](self->_encoder, "setObjectBytes:length:atIndex:", a3, a4, a5);
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setObjectSamplerState:atIndex:](self->_encoder, "setObjectSamplerState:atIndex:", a3, a4);
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_encoder, "setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6);
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[MTLRenderCommandEncoder setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_encoder, "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setObjectSamplerStates:withRange:](self->_encoder, "setObjectSamplerStates:withRange:", a3, a4.location, a4.length);
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setObjectTextures:withRange:](self->_encoder, "setObjectTextures:withRange:", a3, a4.location, a4.length);
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setObjectTexture:atIndex:](self->_encoder, "setObjectTexture:atIndex:", a3, a4);
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setObjectThreadgroupMemoryLength:atIndex:](self->_encoder, "setObjectThreadgroupMemoryLength:atIndex:", a3, a4);
}

- (void)setTessellationFactorBuffer:(id)a3 offset:(unint64_t)a4 instanceStride:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setTessellationFactorBuffer:offset:instanceStride:](self->_encoder, "setTessellationFactorBuffer:offset:instanceStride:", a3, a4, a5);
}

- (void)setTessellationFactorScale:(float)a3
{
  -[MTLRenderCommandEncoder setTessellationFactorScale:](self->_encoder, "setTessellationFactorScale:");
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setThreadgroupMemoryLength:offset:atIndex:](self->_encoder, "setThreadgroupMemoryLength:offset:atIndex:", a3, a4, a5);
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setTileAccelerationStructure:atBufferIndex:](self->_encoder, "setTileAccelerationStructure:atBufferIndex:", a3, a4);
}

- (void)setTileBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setTileBuffer:offset:atIndex:](self->_encoder, "setTileBuffer:offset:atIndex:", a3, a4, a5);
}

- (void)setTileBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setTileBufferOffset:atIndex:](self->_encoder, "setTileBufferOffset:atIndex:", a3, a4);
}

- (void)setTileBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  -[MTLRenderCommandEncoder setTileBuffers:offsets:withRange:](self->_encoder, "setTileBuffers:offsets:withRange:", a3, a4, a5.location, a5.length);
}

- (void)setTileBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  -[MTLRenderCommandEncoder setTileBytes:length:atIndex:](self->_encoder, "setTileBytes:length:atIndex:", a3, a4, a5);
}

- (void)setTileIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setTileIntersectionFunctionTable:atBufferIndex:](self->_encoder, "setTileIntersectionFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setTileIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setTileIntersectionFunctionTables:withBufferRange:](self->_encoder, "setTileIntersectionFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (void)setTileSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setTileSamplerState:atIndex:](self->_encoder, "setTileSamplerState:atIndex:", a3, a4);
}

- (void)setTileSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  -[MTLRenderCommandEncoder setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:](self->_encoder, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", a3, a6);
}

- (void)setTileSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
  -[MTLRenderCommandEncoder setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:](self->_encoder, "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)setTileSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setTileSamplerStates:withRange:](self->_encoder, "setTileSamplerStates:withRange:", a3, a4.location, a4.length);
}

- (void)setTileTexture:(id)a3 atIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setTileTexture:atIndex:](self->_encoder, "setTileTexture:atIndex:", a3, a4);
}

- (void)setTileTextures:(const void *)a3 withRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setTileTextures:withRange:](self->_encoder, "setTileTextures:withRange:", a3, a4.location, a4.length);
}

- (void)setTileVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setTileVisibleFunctionTable:atBufferIndex:](self->_encoder, "setTileVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setTileVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setTileVisibleFunctionTables:withBufferRange:](self->_encoder, "setTileVisibleFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVertexAccelerationStructure:atBufferIndex:](self->_encoder, "setVertexAccelerationStructure:atBufferIndex:", a3, a4);
}

- (void)setVertexIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVertexIntersectionFunctionTable:atBufferIndex:](self->_encoder, "setVertexIntersectionFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setVertexIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setVertexIntersectionFunctionTables:withBufferRange:](self->_encoder, "setVertexIntersectionFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (void)setVertexVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVertexVisibleFunctionTable:atBufferIndex:](self->_encoder, "setVertexVisibleFunctionTable:atBufferIndex:", a3, a4);
}

- (void)setVertexVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  -[MTLRenderCommandEncoder setVertexVisibleFunctionTables:withBufferRange:](self->_encoder, "setVertexVisibleFunctionTables:withBufferRange:", a3, a4.location, a4.length);
}

- (void)setVisibilityResultMode:(unint64_t)a3 offset:(unint64_t)a4
{
  -[MTLRenderCommandEncoder setVisibilityResultMode:offset:](self->_encoder, "setVisibilityResultMode:offset:", a3, a4);
}

- (void)updateFence:(id)a3 afterStages:(unint64_t)a4
{
  -[MTLRenderCommandEncoder updateFence:afterStages:](self->_encoder, "updateFence:afterStages:", a3, a4);
}

- (void)useHeap:(id)a3
{
  -[MTLRenderCommandEncoder useHeap:stages:](self->_encoder, "useHeap:stages:", a3, 3);
}

- (void)useHeap:(id)a3 stages:(unint64_t)a4
{
  -[MTLRenderCommandEncoder useHeap:stages:](self->_encoder, "useHeap:stages:", a3, a4);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4
{
  -[MTLRenderCommandEncoder useHeaps:count:stages:](self->_encoder, "useHeaps:count:stages:", a3, a4, 3);
}

- (void)useHeaps:(const void *)a3 count:(unint64_t)a4 stages:(unint64_t)a5
{
  -[MTLRenderCommandEncoder useHeaps:count:stages:](self->_encoder, "useHeaps:count:stages:", a3, a4, a5);
}

- (void)waitForFence:(id)a3 beforeStages:(unint64_t)a4
{
  -[MTLRenderCommandEncoder waitForFence:beforeStages:](self->_encoder, "waitForFence:beforeStages:", a3, a4);
}

- (void).cxx_destruct
{
  re::mtl::RenderCommandEncoder::~RenderCommandEncoder((re::mtl::RenderCommandEncoder *)&self->_encoderCPP);
  objc_storeStrong((id *)&self->_encoder, 0);
}

- (id).cxx_construct
{
  uint64_t *v3;
  uint64_t v4;

  self->_encoderCPP.m_object = 0;
  v3 = re::globalAllocators((re *)self);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3[2] + 32))(v3[2], 264, 8);
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_OWORD *)(v4 + 112) = 0u;
  *(_OWORD *)(v4 + 128) = 0u;
  *(_OWORD *)(v4 + 144) = 0u;
  *(_OWORD *)(v4 + 160) = 0u;
  *(_OWORD *)(v4 + 176) = 0u;
  *(_OWORD *)(v4 + 192) = 0u;
  *(_OWORD *)(v4 + 208) = 0u;
  *(_OWORD *)(v4 + 224) = 0u;
  *(_OWORD *)(v4 + 240) = 0u;
  *(_QWORD *)(v4 + 256) = 0;
  self->_encoderCPP.var0 = (RenderEncoderImpCache *)v4;
  return self;
}

@end
