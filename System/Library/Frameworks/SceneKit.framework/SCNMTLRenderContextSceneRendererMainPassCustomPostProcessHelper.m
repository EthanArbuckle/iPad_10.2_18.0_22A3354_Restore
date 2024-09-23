@implementation SCNMTLRenderContextSceneRendererMainPassCustomPostProcessHelper

- (_QWORD)initWithEngineContext:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)SCNMTLRenderContextSceneRendererMainPassCustomPostProcessHelper;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = a2;
    v3[2] = C3DEngineContextGetRenderContext(a2);
  }
  return v4;
}

- (void)setCurrrentPass:(MainPassCustomPostProcessPass *)a3
{
  self->_currentPass = a3;
}

- (MTLCommandBuffer)commandBuffer
{
  return (MTLCommandBuffer *)-[SCNMTLRenderContext currentCommandBuffer]((uint64_t)self->_renderContext);
}

- (MTLRenderCommandEncoder)renderCommandEncoder
{
  return (MTLRenderCommandEncoder *)-[SCNMTLRenderContext currentRenderCommandEncoder]((uint64_t)self->_renderContext);
}

- (MTLTexture)destinationTexture
{
  void *v3;
  void *v4;
  MTLTexture *result;

  v3 = (void *)-[SCNMTLRenderContext clientRenderPassDescriptor]((uint64_t)self->_renderContext);
  if (!v3)
    return (MTLTexture *)C3D::Pass::outputTextureAtIndex((C3D::Pass *)self->_currentPass, 0);
  v4 = (void *)objc_msgSend((id)objc_msgSend(v3, "colorAttachments"), "objectAtIndexedSubscript:", 0);
  result = (MTLTexture *)objc_msgSend(v4, "resolveTexture");
  if (!result)
    return (MTLTexture *)objc_msgSend(v4, "texture");
  return result;
}

- (id)mainPassColorTextureAtIndex:(unint64_t)a3
{
  return C3D::Pass::inputTextureAtIndex((C3D::Pass *)self->_currentPass, (unsigned __int16)a3);
}

- (void)drawSceneBackgroundUsingEncoder:(id)a3 commandBuffer:(id)a4 renderPassDescriptor:(id)a5
{
  NSObject *v9;

  if (!LOBYTE(self->_currentPass[2].var4.var0))
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[SCNMTLRenderContextSceneRendererMainPassCustomPostProcessHelper drawSceneBackgroundUsingEncoder:commandBuffer:renderPassDescriptor:].cold.1(v9);
  }
  -[SCNMTLRenderContext _SCNSceneRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:commandBuffer:renderPassDescriptor:]((uint64_t *)self->_renderContext, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
}

- (void)drawSceneBackgroundUsingEncoder:(os_log_t)log commandBuffer:renderPassDescriptor:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_currentPass->mainPassUsesSpecificClearColor(NULL)";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Background was already rendered in the main pass", (uint8_t *)&v1, 0xCu);
}

@end
