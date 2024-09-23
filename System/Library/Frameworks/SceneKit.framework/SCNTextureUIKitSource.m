@implementation SCNTextureUIKitSource

- (SCNTextureUIKitSource)init
{
  SCNTextureUIKitSource *result;
  unsigned int v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNTextureUIKitSource;
  result = -[SCNTextureUIKitSource init](&v4, sel_init);
  if (result)
  {
    do
      v3 = __ldaxr((unsigned int *)&gSCNTextureUIKitSourceInstanceCount);
    while (__stlxr(v3 + 1, (unsigned int *)&gSCNTextureUIKitSourceInstanceCount));
  }
  return result;
}

- (BOOL)supportsMetal
{
  return 0;
}

- (BOOL)shouldFlip
{
  return 1;
}

- (BOOL)requiresMainThreadUpdates
{
  return 1;
}

- (void)dealloc
{
  unsigned int v3;
  UIWindow *uiWindow;
  UIView *uiView;
  objc_super v6;
  _QWORD block[6];

  do
    v3 = __ldaxr((unsigned int *)&gSCNTextureUIKitSourceInstanceCount);
  while (__stlxr(v3 - 1, (unsigned int *)&gSCNTextureUIKitSourceInstanceCount));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  uiWindow = self->_uiWindow;
  uiView = self->_uiView;
  self->_uiWindow = 0;
  self->_uiView = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SCNTextureUIKitSource_dealloc__block_invoke;
  block[3] = &unk_1EA59F420;
  block[4] = uiWindow;
  block[5] = uiView;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v6.receiver = self;
  v6.super_class = (Class)SCNTextureUIKitSource;
  -[SCNTextureCoreAnimationSource dealloc](&v6, sel_dealloc);
}

void __32__SCNTextureUIKitSource_dealloc__block_invoke(uint64_t a1)
{

}

- (void)setup
{
  CALayer *v3;

  v3 = -[CALayer superlayer](self->_uiWindowLayer, "superlayer");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__layerTreeDidUpdate, CFSTR("SCNLayerTreeDidChange"), v3);
}

- (void)cleanup:(__C3DRendererContext *)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNTextureUIKitSource;
  -[SCNTextureCoreAnimationSource cleanup:](&v3, sel_cleanup_, a3);
}

- (id)layerToFocusForRenderedLayer:(id)a3
{
  return self->_uiWindowLayer;
}

- (float)clearValue
{
  unsigned int v2;

  LOBYTE(v2) = self->_isOpaque;
  return (float)v2;
}

- (id)layer
{
  return -[CALayer superlayer](self->_uiWindowLayer, "superlayer");
}

- (double)layerContentsScaleFactor
{
  double result;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
  return result;
}

- (CGSize)layerSizeInPixels
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CALayer bounds](self->_uiWindowLayer, "bounds");
  v4 = v3;
  v6 = v5;
  -[SCNTextureUIKitSource layerContentsScaleFactor](self, "layerContentsScaleFactor");
  if (v7 == 0.0)
    v7 = 1.0;
  v8 = v6 * v7;
  v9 = v4 * v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (__C3DTexture)textureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5
{
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  v10.receiver = self;
  v10.super_class = (Class)SCNTextureUIKitSource;
  return -[SCNTextureCoreAnimationSource textureWithEngineContext:textureSampler:nextFrameTime:](&v10, sel_textureWithEngineContext_textureSampler_nextFrameTime_, a3, a4, a5);
}

- (void)_layerTreeDidUpdate
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SCNUITreeDidChange"), self->_source);
}

- (UIWindow)uiWindow
{
  return self->_uiWindow;
}

- (void)setUiWindow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CALayer)uiWindowLayer
{
  return self->_uiWindowLayer;
}

- (void)setUiWindowLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (UIView)uiView
{
  return self->_uiView;
}

- (void)setUiView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (id)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

@end
