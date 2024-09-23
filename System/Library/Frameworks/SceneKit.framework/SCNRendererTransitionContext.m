@implementation SCNRendererTransitionContext

- (id)copyWithZone:(_NSZone *)a3
{
  SCNRendererTransitionContext *v4;

  v4 = objc_alloc_init(SCNRendererTransitionContext);
  -[SCNRendererTransitionContext transitionStartTime](self, "transitionStartTime");
  -[SCNRendererTransitionContext setTransitionStartTime:](v4, "setTransitionStartTime:");
  -[SCNRendererTransitionContext setTransition:](v4, "setTransition:", -[SCNRendererTransitionContext transition](self, "transition"));
  -[SCNRendererTransitionContext setOutgoingPointOfView:](v4, "setOutgoingPointOfView:", -[SCNRendererTransitionContext outgoingPointOfView](self, "outgoingPointOfView"));
  -[SCNRendererTransitionContext setOutgoingScene:](v4, "setOutgoingScene:", -[SCNRendererTransitionContext outgoingScene](self, "outgoingScene"));
  return v4;
}

- (__C3DFXPass)transitionPass
{
  __C3DFXPass *result;
  __C3DFXPass *v4;
  uint64_t FramebufferDescription;

  result = self->_transitionPass;
  if (!result)
  {
    v4 = (__C3DFXPass *)C3DFXPassCreate();
    self->_transitionPass = v4;
    C3DFXPassSetName((uint64_t)v4, CFSTR("transition pass"));
    C3DFXPassSetDrawInstruction((uint64_t)self->_transitionPass, 1);
    FramebufferDescription = C3DFXPassGetFramebufferDescription((uint64_t)self->_transitionPass);
    *(_BYTE *)(FramebufferDescription + 8) = 1;
    *(_BYTE *)(FramebufferDescription + 80) |= 8u;
    return self->_transitionPass;
  }
  return result;
}

- (id)prepareRendererAtIndex:(int)a3 withScene:(id)a4 renderSize:(CGSize)a5 pointOfView:(id)a6 parentRenderer:(id)a7
{
  double height;
  double width;
  SCNOffscreenRenderer **renderers;
  uint64_t v10;
  SCNOffscreenRenderer *v11;
  SCNOffscreenRenderer *v15;
  SCNOffscreenRenderer *v16;
  SCNOffscreenRenderer *v17;

  height = a5.height;
  width = a5.width;
  renderers = self->_renderers;
  v10 = a3;
  v11 = self->_renderers[a3];
  if (!v11)
  {
    +[SCNTransaction begin](SCNTransaction, "begin");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    if (objc_msgSend(a7, "renderingAPI"))
      v15 = +[SCNOffscreenRenderer offscreenRendererWithContext:size:](SCNOffscreenRenderer, "offscreenRendererWithContext:size:", objc_msgSend(a7, "context"), width, height);
    else
      v15 = +[SCNOffscreenRenderer offscreenRendererWithDevice:size:](SCNOffscreenRenderer, "offscreenRendererWithDevice:size:", objc_msgSend(a7, "device"), width, height);
    v16 = v15;
    renderers[v10] = v16;
    -[SCNRenderer setScene:](v16, "setScene:", a4);
    -[SCNRenderer setPointOfView:](renderers[v10], "setPointOfView:", a6);
    -[SCNRenderer setBackgroundColor:](renderers[v10], "setBackgroundColor:", objc_msgSend(a7, "backgroundColor"));
    v17 = renderers[v10];
    objc_msgSend(a7, "sceneTime");
    -[SCNRenderer setSceneTime:](v17, "setSceneTime:");
    +[SCNTransaction commit](SCNTransaction, "commit");
    v11 = renderers[v10];
  }
  -[SCNOffscreenRenderer setSize:](v11, "setSize:", width, height);
  return renderers[v10];
}

- (void)dealloc
{
  __C3DFXPass *transitionPass;
  id completionHandler;
  objc_super v5;

  transitionPass = self->_transitionPass;
  if (transitionPass)
    CFRelease(transitionPass);
  completionHandler = self->completionHandler;
  if (completionHandler)
    _Block_release(completionHandler);

  v5.receiver = self;
  v5.super_class = (Class)SCNRendererTransitionContext;
  -[SCNRendererTransitionContext dealloc](&v5, sel_dealloc);
}

- (SCNScene)outgoingScene
{
  return self->_outgoingScene;
}

- (void)setOutgoingScene:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (SKTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (double)transitionStartTime
{
  return self->_transitionStartTime;
}

- (void)setTransitionStartTime:(double)a3
{
  self->_transitionStartTime = a3;
}

- (SCNNode)outgoingPointOfView
{
  return self->_outgoingPointOfView;
}

- (void)setOutgoingPointOfView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
