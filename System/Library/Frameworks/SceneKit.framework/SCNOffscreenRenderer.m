@implementation SCNOffscreenRenderer

- (void)_renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x10) != 0)
    -[_SCNSceneRendererDelegate _renderer:willRenderScene:atTime:](self->_sceneRendererDelegate, "_renderer:willRenderScene:atTime:", a3, a4, a5);
}

- (void)_renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x20) != 0)
    -[_SCNSceneRendererDelegate _renderer:didRenderScene:atTime:](self->_sceneRendererDelegate, "_renderer:didRenderScene:atTime:", a3, a4, a5);
}

+ (SCNOffscreenRenderer)offscreenRendererWithDevice:(id)a3 sceneRendererDelegate:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  if (!a3)
  {
    v8 = +[SCNView deviceForOptions:](SCNView, "deviceForOptions:");
    if (!v8)
      return (SCNOffscreenRenderer *)objc_msgSend(a1, "offscreenRendererWithContext:size:", 0, width, height);
  }
  v10 = objc_msgSend(objc_alloc((Class)a1), "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", 0, 0, 0, 1, v8, 0);
  *(_QWORD *)(v10 + 448) = a4;
  if (a4)
  {
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 2;
    else
      v11 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFFD | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 4;
    else
      v12 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFFB | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 8;
    else
      v13 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFF7 | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 16;
    else
      v14 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFEF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 32;
    else
      v15 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFDF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 128;
    else
      v16 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFF7F | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 256;
    else
      v17 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFEFF | v17;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 64;
    else
      v18 = 0;
    *(_WORD *)(v10 + 456) = *(_WORD *)(v10 + 456) & 0xFFBF | v18;
    objc_msgSend((id)v10, "set_wantsSceneRendererDelegationMessages:", 1);
  }
  objc_msgSend((id)v10, "_setupOffscreenRendererWithSize:", width, height);
  return (SCNOffscreenRenderer *)(id)v10;
}

+ (SCNOffscreenRenderer)offscreenRendererWithContext:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;

  height = a4.height;
  width = a4.width;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", 0, 0, 0, 1, a3, 1);
  objc_msgSend(v6, "_setupOffscreenRendererWithSize:", width, height);
  return (SCNOffscreenRenderer *)v6;
}

+ (SCNOffscreenRenderer)offscreenRendererWithDevice:(id)a3 size:(CGSize)a4
{
  return (SCNOffscreenRenderer *)objc_msgSend(a1, "offscreenRendererWithDevice:sceneRendererDelegate:size:", a3, 0, a4.width, a4.height);
}

- (id)snapshot
{
  double v2;
  double v3;
  double width;
  double height;

  width = self->super._framebufferInfo.drawableSize.width;
  height = self->super._framebufferInfo.drawableSize.height;
  *(float *)&v2 = width;
  *(float *)&v3 = height;
  LODWORD(width) = 0;
  LODWORD(height) = 0;
  -[SCNRenderer set_viewport:](self, "set_viewport:", width, height, v2, v3);
  return -[SCNRenderer snapshotAtTime:](self, "snapshotAtTime:", 0.0);
}

- (unsigned)textureID
{
  const void *TextureWithSlot;

  -[SCNRenderer _prepareRenderTarget](self, "_prepareRenderTarget");
  TextureWithSlot = C3DFramebufferGetTextureWithSlot((uint64_t)self->super._framebufferInfo.frameBuffer, 0);
  return C3DTextureGetID((uint64_t)TextureWithSlot);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->super._framebufferInfo.drawableSize.width;
  height = self->super._framebufferInfo.drawableSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  if (a3.width != self->super._framebufferInfo.drawableSize.width
    || a3.height != self->super._framebufferInfo.drawableSize.height)
  {
    *((_BYTE *)&self->super + 129) |= 1u;
    self->super._framebufferInfo.drawableSize = a3;
  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 1) != 0)
    -[_SCNSceneRendererDelegate _renderer:updateAtTime:](self->_sceneRendererDelegate, "_renderer:updateAtTime:", a3, a4);
}

- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 2) != 0)
    -[_SCNSceneRendererDelegate _renderer:didApplyAnimationsAtTime:](self->_sceneRendererDelegate, "_renderer:didApplyAnimationsAtTime:", a3, a4);
}

- (void)_renderer:(id)a3 didSimulatePhysicsAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 4) != 0)
    -[_SCNSceneRendererDelegate _renderer:didSimulatePhysicsAtTime:](self->_sceneRendererDelegate, "_renderer:didSimulatePhysicsAtTime:", a3, a4);
}

- (void)_renderer:(id)a3 didApplyConstraintsAtTime:(double)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 8) != 0)
    -[_SCNSceneRendererDelegate _renderer:didApplyConstraintsAtTime:](self->_sceneRendererDelegate, "_renderer:didApplyConstraintsAtTime:", a3, a4);
}

- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x80) != 0)
    -[_SCNSceneRendererDelegate _renderer:didBuildSubdivDataForHash:dataProvider:](self->_sceneRendererDelegate, "_renderer:didBuildSubdivDataForHash:dataProvider:", a3, a4, a5);
}

- (id)_renderer:(id)a3 subdivDataForHash:(id)a4
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x100) != 0)
    return (id)-[_SCNSceneRendererDelegate _renderer:subdivDataForHash:](self->_sceneRendererDelegate, "_renderer:subdivDataForHash:", a3, a4);
  else
    return 0;
}

- (BOOL)_wantsCustomMainPassPostProcessForRenderer:(id)a3
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x200) != 0)
    return -[_SCNSceneRendererDelegate _wantsCustomMainPassPostProcessForRenderer:](self->_sceneRendererDelegate, "_wantsCustomMainPassPostProcessForRenderer:", a3);
  else
    return 0;
}

- (BOOL)_usesSpecificMainPassClearColorForRenderer:(id)a3 clearColor:
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x200) != 0)
    return -[_SCNSceneRendererDelegate _usesSpecificMainPassClearColorForRenderer:clearColor:](self->_sceneRendererDelegate, "_usesSpecificMainPassClearColorForRenderer:clearColor:", a3);
  else
    return 0;
}

- (void)_encodeCustomMainPassPostProcessForRenderer:(id)a3 atTime:(double)a4 helper:(id)a5
{
  if ((*(_WORD *)&self->_sceneRendererDelegateDelegationConformance & 0x200) != 0)
    -[_SCNSceneRendererDelegate _encodeCustomMainPassPostProcessForRenderer:atTime:helper:](self->_sceneRendererDelegate, "_encodeCustomMainPassPostProcessForRenderer:atTime:helper:", a3, a5, a4);
}

@end
