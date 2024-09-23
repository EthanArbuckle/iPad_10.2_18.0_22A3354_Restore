@implementation C3DTextureSourceGetSharedRendererContext

void __C3DTextureSourceGetSharedRendererContext_block_invoke()
{
  id v0;
  id v1;

  C3DTextureSourceGetSharedRendererContext_rendererContext = (uint64_t)C3DRendererContextCreateWithOptions();
  v0 = objc_alloc(MEMORY[0x1E0CD0958]);
  v1 = (id)objc_msgSend(v0, "initWithAPI:properties:", 3, MEMORY[0x1E0C9AA70]);
  C3DRendererContextSetGLContext((__n64 *)C3DTextureSourceGetSharedRendererContext_rendererContext, v1);
}

@end
