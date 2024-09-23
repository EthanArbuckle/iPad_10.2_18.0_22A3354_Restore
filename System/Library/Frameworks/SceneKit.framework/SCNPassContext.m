@implementation SCNPassContext

- (double)time
{
  return C3DEngineContextGetNextFrameTime((uint64_t)self->_context->var3);
}

- (MTLCommandQueue)commandQueue
{
  uint64_t RenderContext;

  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_context->var3);
  return (MTLCommandQueue *)-[SCNMTLRenderContext commandQueue](RenderContext);
}

- (MTLCommandBuffer)commandBuffer
{
  uint64_t RenderContext;

  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_context->var3);
  return (MTLCommandBuffer *)-[SCNMTLRenderContext currentCommandBuffer](RenderContext);
}

- (MTLDevice)device
{
  uint64_t RenderContext;

  RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_context->var3);
  return (MTLDevice *)-[SCNMTLRenderContext device](RenderContext);
}

- (id)inputTextureWithName:(id)a3
{
  return C3DPassGetInputTextureNamed((C3D::Pass *)self->_context->var0[1].var5, (char *)objc_msgSend(a3, "UTF8String"));
}

- (id)outputTextureWithName:(id)a3
{
  return C3DPassGetOutputTextureNamed((C3D::Pass *)self->_context->var0[1].var5, (char *)objc_msgSend(a3, "UTF8String"));
}

@end
