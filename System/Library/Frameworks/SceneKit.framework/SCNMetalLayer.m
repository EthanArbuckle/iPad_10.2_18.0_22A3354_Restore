@implementation SCNMetalLayer

- (void)commonInit
{
  id v3;
  uint64_t v4;
  id v5;

  self->_preferredFramePerSeconds = 60;
  v3 = -[SCNMetalLayer rendererOptions](self, "rendererOptions");
  v4 = objc_msgSend((id)objc_opt_class(), "deviceForOptions:", v3);
  v5 = -[SCNRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:]([SCNRenderer alloc], "_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:", v3, 1, self, 1, v4, 0);
  -[SCNMetalLayer setRenderer:](self, "setRenderer:", v5);
  self->_lastRenderedTime = -1.0;

  -[CAMetalLayer setDevice:](self, "setDevice:", v4);
  -[CAMetalLayer setPixelFormat:](self, "setPixelFormat:", C3DMetalFramebufferPixelFormat(0));
  -[CAMetalLayer setFramebufferOnly:](self, "setFramebufferOnly:", 1);
  -[SCNMetalLayer setLoops:](self, "setLoops:", 1);
  -[SCNMetalLayer setScene:](self, "setScene:", +[SCNScene scene](SCNScene, "scene"));
  -[SCNMetalLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"), "CGColor"));
  -[SCNMetalLayer setNeedsDisplayOnBoundsChange:](self, "setNeedsDisplayOnBoundsChange:", 1);
}

- (SCNMetalLayer)initWithLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNMetalLayer;
  return -[SCNMetalLayer initWithLayer:](&v4, sel_initWithLayer_, a3);
}

- (SCNMetalLayer)init
{
  SCNMetalLayer *v2;
  SCNMetalLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNMetalLayer;
  v2 = -[CAMetalLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SCNMetalLayer commonInit](v2, "commonInit");
  return v3;
}

- (void)dealloc
{
  int v3;
  SCNDisplayLink *displayLink;
  objc_super v5;
  _QWORD block[5];

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[SCNDisplayLink invalidate](self->_displayLink, "invalidate");
  v3 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  displayLink = self->_displayLink;
  if (v3)
  {

    self->_displayLink = 0;
  }
  else
  {
    self->_displayLink = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__SCNMetalLayer_dealloc__block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = displayLink;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNMetalLayer;
  -[CAMetalLayer dealloc](&v5, sel_dealloc);
}

void __24__SCNMetalLayer_dealloc__block_invoke(uint64_t a1)
{

}

- (BOOL)canDrawConcurrently
{
  return 1;
}

- (id)rendererOptions
{
  return 0;
}

- (void)setShowsStatistics:(BOOL)a3
{
  -[SCNRenderer setShowsStatistics:](self->_renderer, "setShowsStatistics:", a3);
}

- (BOOL)showsStatistics
{
  return -[SCNRenderer showsStatistics](self->_renderer, "showsStatistics");
}

- (CGRect)currentViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SCNRenderer currentViewport](self->_renderer, "currentViewport");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return -[SCNRenderer isTemporalAntialiasingEnabled](self->_renderer, "isTemporalAntialiasingEnabled");
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  -[SCNRenderer setTemporalAntialiasingEnabled:](self->_renderer, "setTemporalAntialiasingEnabled:", a3);
}

- (BOOL)usesReverseZ
{
  return -[SCNRenderer usesReverseZ](self->_renderer, "usesReverseZ");
}

- (void)setUsesReverseZ:(BOOL)a3
{
  -[SCNRenderer setUsesReverseZ:](self->_renderer, "setUsesReverseZ:", a3);
}

- (id)displayLink
{
  id result;
  SCNDisplayLink *v4;
  double v5;

  result = self->_displayLink;
  if (!result)
  {
    v4 = (SCNDisplayLink *)-[NSObject SCN_setupDisplayLinkWithQueue:screen:policy:](self, "SCN_setupDisplayLinkWithQueue:screen:policy:", -[SCNRenderer _renderingQueue](self->_renderer, "_renderingQueue"), 0, 0);
    self->_displayLink = v4;
    -[SCNDisplayLink setPaused:](v4, "setPaused:", 0);
    *(float *)&v5 = (float)self->_preferredFramePerSeconds;
    -[SCNDisplayLink setPreferredFrameRate:](self->_displayLink, "setPreferredFrameRate:", v5);
    return self->_displayLink;
  }
  return result;
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  _BOOL4 v3;
  id v4;

  v3 = -[SCNMetalLayer isPlaying](self, "isPlaying");
  v4 = -[SCNMetalLayer displayLink](self, "displayLink");
  -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
  return objc_msgSend(v4, "setPaused:nextFrameTimeHint:lastUpdate:", !v3);
}

- (int64_t)preferredFramesPerSecond
{
  id v3;
  float v4;

  v3 = -[SCNMetalLayer displayLink](self, "displayLink");
  if (v3)
    objc_msgSend(v3, "preferredFrameRate");
  else
    return (uint64_t)(float)self->_preferredFramePerSeconds;
  return (uint64_t)v4;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  id v5;
  double v6;

  v5 = -[SCNMetalLayer displayLink](self, "displayLink");
  if (v5)
  {
    *(float *)&v6 = (float)a3;
    objc_msgSend(v5, "setPreferredFrameRate:", v6);
  }
  self->_preferredFramePerSeconds = a3;
}

- (void)pauseDisplayLink
{
  -[SCNJitterer stopIfNeeded](self->_jitterer, "stopIfNeeded");
  objc_msgSend(-[SCNMetalLayer displayLink](self, "displayLink"), "setPaused:", 1);
}

- (void)resumeDisplayLink
{
  id v3;
  uint64_t v4;

  v3 = -[SCNMetalLayer displayLink](self, "displayLink");
  v4 = -[SCNMetalLayer isPlaying](self, "isPlaying") ^ 1;
  -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
  objc_msgSend(v3, "setPaused:nextFrameTimeHint:lastUpdate:", v4);
}

- (void)setPointOfView:(id)a3
{
  objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPointOfView:", a3);
  -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (SCNNode)pointOfView
{
  return (SCNNode *)objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "pointOfView");
}

- (void)setPointOfCulling:(id)a3
{
  NSObject *v5;

  if (-[SCNMetalLayer pointOfCulling](self, "pointOfCulling") != a3)
  {
    if (!objc_msgSend(a3, "scene"))
    {
      v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[SCNMetalLayer setPointOfCulling:].cold.1(v5);
    }
    objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPointOfCulling:", a3);
    -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)pointOfCulling
{
  return (id)objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "pointOfCulling");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  SCNScene *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[SCNMetalLayer scene](self, "scene");
  -[SCNMetalLayer sceneTime](self, "sceneTime");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p | scene=%@ sceneTime=%f pointOfView=%@>"), v5, self, v6, v7, -[SCNMetalLayer pointOfView](self, "pointOfView"));
}

- (BOOL)autoenablesDefaultLighting
{
  return objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "autoenablesDefaultLighting");
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setAutoenablesDefaultLighting:", a3);
  -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)rendersIntoMaterial
{
  return self->_rendersIntoMaterial;
}

- (void)setRendersIntoMaterial:(BOOL)a3
{
  self->_rendersIntoMaterial = a3;
}

- (SCNVector4)_viewport
{
  double v2;
  float v3;
  double v4;
  float v5;
  float v6;
  float v7;
  SCNVector4 result;

  -[SCNMetalLayer bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  result.w = v5;
  result.z = v3;
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  double y;
  double x;
  id v8;

  y = a3.y;
  x = a3.x;
  v8 = -[SCNMetalLayer renderer](self, "renderer");
  -[SCNMetalLayer bounds](self, "bounds");
  return (id)objc_msgSend(v8, "_hitTest:viewport:options:", a4, x, y);
}

- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5
{
  float z;
  float y;
  float x;
  float v9;
  float v10;
  float v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  z = a4.z;
  y = a4.y;
  x = a4.x;
  v9 = a3.z;
  v10 = a3.y;
  v11 = a3.x;
  v12 = -[SCNMetalLayer renderer](self, "renderer");
  *(float *)&v13 = v11;
  *(float *)&v14 = v10;
  *(float *)&v15 = v9;
  *(float *)&v16 = x;
  *(float *)&v17 = y;
  *(float *)&v18 = z;
  return (id)objc_msgSend(v12, "hitTestWithSegmentFromPoint:toPoint:options:", a5, v13, v14, v15, v16, v17, v18);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  id v7;

  v7 = -[SCNMetalLayer renderer](self, "renderer");
  -[SCNMetalLayer _viewport](self, "_viewport");
  return objc_msgSend(v7, "_isNodeInsideFrustum:withPointOfView:viewport:", a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  id v5;

  v5 = -[SCNMetalLayer renderer](self, "renderer");
  -[SCNMetalLayer _viewport](self, "_viewport");
  return (id)objc_msgSend(v5, "_nodesInsideFrustumWithPointOfView:viewport:", a3);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  return objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "prepareObject:shouldAbortBlock:", a3, a4);
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "prepareObjects:withCompletionHandler:", a3, a4);
}

- (void)projectPoints:(SCNVector3 *)a3 count:(unint64_t)a4
{
  id v7;

  v7 = -[SCNMetalLayer renderer](self, "renderer");
  -[SCNMetalLayer _viewport](self, "_viewport");
  objc_msgSend(v7, "_projectPoints:count:viewport:", a3, a4);
}

- (SCNVector3)projectPoint:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  SCNVector3 result;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v7 = -[SCNMetalLayer renderer](self, "renderer");
  -[SCNMetalLayer _viewport](self, "_viewport");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  *(float *)&v16 = x;
  *(float *)&v17 = y;
  *(float *)&v18 = z;
  LODWORD(v19) = v9;
  LODWORD(v20) = v11;
  LODWORD(v21) = v13;
  LODWORD(v22) = v15;
  objc_msgSend(v7, "_projectPoint:viewport:", v16, v17, v18, v19, v20, v21, v22);
  result.z = v25;
  result.y = v24;
  result.x = v23;
  return result;
}

- (SCNVector3)unprojectPoint:(SCNVector3)a3
{
  float z;
  float y;
  float x;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  SCNVector3 result;

  z = a3.z;
  y = a3.y;
  x = a3.x;
  v7 = -[SCNMetalLayer renderer](self, "renderer");
  -[SCNMetalLayer _viewport](self, "_viewport");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  *(float *)&v16 = x;
  *(float *)&v17 = y;
  *(float *)&v18 = z;
  LODWORD(v19) = v9;
  LODWORD(v20) = v11;
  LODWORD(v21) = v13;
  LODWORD(v22) = v15;
  objc_msgSend(v7, "_unprojectPoint:viewport:", v16, v17, v18, v19, v20, v21, v22);
  result.z = v25;
  result.y = v24;
  result.x = v23;
  return result;
}

- (void)setDelegate:(id)a3
{
  -[SCNRenderer setDelegate:](self->_renderer, "setDelegate:", a3);
}

- (SCNSceneRendererDelegate)delegate
{
  return -[SCNRenderer delegate](self->_renderer, "delegate");
}

- (void)setRenderer:(id)a3
{
  SCNRenderer *renderer;

  renderer = self->_renderer;
  if (renderer != a3)
  {

    self->_renderer = (SCNRenderer *)a3;
  }
}

- (id)renderer
{
  return self->_renderer;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNMetalLayer;
  -[SCNMetalLayer setBackgroundColor:](&v10, sel_setBackgroundColor_);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", a3);
  v8 = 0;
  v9 = 0;
  v6 = 0.0;
  v7 = 0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
  -[SCNMetalLayer setOpaque:](self, "setOpaque:", v6 >= 1.0, v6);
  -[SCNRenderer setBackgroundColor:](self->_renderer, "setBackgroundColor:", v5);
  -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (unint64_t)renderingAPI
{
  return 0;
}

- (CGColorSpace)workingColorSpace
{
  return -[SCNRenderer workingColorSpace](self->_renderer, "workingColorSpace");
}

- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6
{
  SCNScene *scene;
  SCNNode *v12;

  scene = self->_scene;
  v12 = -[SCNMetalLayer pointOfView](self, "pointOfView");
  +[SCNTransaction begin](SCNTransaction, "begin");
  +[SCNTransaction setAnimationDuration:](SCNTransaction, "setAnimationDuration:", 0.0);
  +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
  -[SCNMetalLayer setScene:](self, "setScene:", a3);
  -[SCNMetalLayer setPointOfView:](self, "setPointOfView:", a5);
  if (a4)
    -[SCNRenderer _prepareForTransition:outgoingScene:outgoingPointOfView:completionHandler:](self->_renderer, "_prepareForTransition:outgoingScene:outgoingPointOfView:completionHandler:", a4, scene, v12, a6);
  +[SCNTransaction commit](SCNTransaction, "commit");
}

- (void)setScene:(id)a3
{
  SCNRenderer *renderer;
  _QWORD v6[5];

  if (-[SCNMetalLayer scene](self, "scene") != a3)
  {

    self->_scene = (SCNScene *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("kC3DSceneDidUpdateNotification"), 0);
    renderer = self->_renderer;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__SCNMetalLayer_setScene___block_invoke;
    v6[3] = &unk_1EA59E288;
    v6[4] = self;
    -[SCNRenderer setScene:completionHandler:](renderer, "setScene:completionHandler:", a3, v6);
    if (a3)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__sceneDidUpdate_, CFSTR("kC3DSceneDidUpdateNotification"), objc_msgSend(a3, "sceneRef"));
    -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
  }
}

uint64_t __26__SCNMetalLayer_setScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (SCNScene)scene
{
  return self->_scene;
}

- (double)sceneTime
{
  double result;

  -[SCNRenderer sceneTime](self->_renderer, "sceneTime");
  return result;
}

- (void)setSceneTime:(double)a3
{
  -[SCNRenderer setSceneTime:](self->_renderer, "setSceneTime:", a3);
  -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)play:(id)a3
{
  -[SCNMetalLayer setPlaying:](self, "setPlaying:", 1);
}

- (void)pause:(id)a3
{
  -[SCNMetalLayer setPlaying:](self, "setPlaying:", 0);
}

- (void)stop:(id)a3
{
  -[SCNMetalLayer setPlaying:](self, "setPlaying:", 0);
  objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "_stop");
}

- (BOOL)isPlaying
{
  return -[SCNRenderer isPlaying](self->_renderer, "isPlaying");
}

- (void)setPlaying:(BOOL)a3
{
  _BOOL8 v3;
  double v5;

  v3 = a3;
  if (-[SCNMetalLayer isPlaying](self, "isPlaying") != a3)
  {
    -[SCNRenderer setPlaying:](self->_renderer, "setPlaying:", v3);
    if (v3)
    {
      objc_msgSend(-[SCNMetalLayer displayLink](self, "displayLink"), "setPaused:", 0);
    }
    else
    {
      -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
      if (v5 - CACurrentMediaTime() > 2.0)
        -[SCNJitterer restart](self->_jitterer, "restart");
    }
  }
}

- (BOOL)loops
{
  return -[SCNRenderer loops](self->_renderer, "loops");
}

- (void)setLoops:(BOOL)a3
{
  -[SCNRenderer setLoops:](self->_renderer, "setLoops:", a3);
}

- (SKScene)overlaySKScene
{
  return -[SCNRenderer overlaySKScene](self->_renderer, "overlaySKScene");
}

- (void)setOverlaySKScene:(id)a3
{
  -[SCNRenderer setOverlaySKScene:](self->_renderer, "setOverlaySKScene:", a3);
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return -[SCNRenderer currentRenderPassDescriptor](self->_renderer, "currentRenderPassDescriptor");
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  return -[SCNRenderer currentRenderCommandEncoder](self->_renderer, "currentRenderCommandEncoder");
}

- (MTLCommandQueue)commandQueue
{
  return -[SCNRenderer commandQueue](self->_renderer, "commandQueue");
}

- (AVAudioEngine)audioEngine
{
  return -[SCNRenderer audioEngine](self->_renderer, "audioEngine");
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return -[SCNRenderer audioEnvironmentNode](self->_renderer, "audioEnvironmentNode");
}

- (SCNNode)audioListener
{
  return -[SCNRenderer audioListener](self->_renderer, "audioListener");
}

- (void)setAudioListener:(id)a3
{
  -[SCNRenderer setAudioListener:](self->_renderer, "setAudioListener:", a3);
}

- (void)setTechnique:(id)a3
{
  -[SCNRenderer setTechnique:](self->_renderer, "setTechnique:", a3);
}

- (SCNTechnique)technique
{
  return -[SCNRenderer technique](self->_renderer, "technique");
}

- (BOOL)_isGLLayerBacked
{
  return 0;
}

- (void)context
{
  return 0;
}

- (void)setNeedsDisplay
{
  objc_super v2;

  self->_lastRenderedTime = -1.0;
  v2.receiver = self;
  v2.super_class = (Class)SCNMetalLayer;
  -[SCNMetalLayer setNeedsDisplay](&v2, sel_setNeedsDisplay);
}

- (void)display
{
  -[SCNMetalLayer _drawAtTime:](self, "_drawAtTime:", 0.0);
}

- (void)SCN_displayLinkCallback:(double)a3
{
  SCNMetalLayer *v5;
  _QWORD block[5];

  v5 = self;
  -[SCNMetalLayer _drawAtTime:](self, "_drawAtTime:", a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SCNMetalLayer_SCN_displayLinkCallback___block_invoke;
  block[3] = &unk_1EA59E288;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __41__SCNMetalLayer_SCN_displayLinkCallback___block_invoke(uint64_t a1)
{

}

- (void)_drawAtTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;

  -[SCNMetalLayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0);
  *(float *)&v5 = v5;
  v6 = *(float *)&v5;
  if (!C3DIsRunningInEditor() || self->_lastRenderedTime != v6)
  {
    self->_lastRenderedTime = v6;
    if (self->_syncTimeWithCoreAnimation)
    {
      objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPlaying:", 0);
      +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
      objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setSceneTime:", v6);
      +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 0);
      a3 = v6;
    }
    -[SCNJitterer stopIfNeeded](self->_jitterer, "stopIfNeeded");
    -[SCNRenderer _displayLinkStatsTick](self->_renderer, "_displayLinkStatsTick");
    -[SCNMetalLayer bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    -[SCNMetalLayer contentsScale](self, "contentsScale");
    if (v11 == 1.0 || v11 == 0.0)
      v11 = 1.0;
    v13 = v10 * v11;
    v14 = v8 * v11;
    -[SCNRenderer _setBackingSize:](self->_renderer, "_setBackingSize:", v14, v13);
    *(float *)&v15 = v14;
    *(float *)&v16 = v13;
    LODWORD(v17) = 0;
    LODWORD(v18) = 0;
    -[SCNRenderer set_viewport:](self->_renderer, "set_viewport:", v17, v18, v15, v16);
    if (v14 != 0.0 && v13 != 0.0)
    {
      -[SCNRenderer lock](self->_renderer, "lock");
      -[SCNRenderer _getFrameIndex](self->_renderer, "_getFrameIndex");
      v19 = kdebug_trace();
      v20 = (void *)MEMORY[0x1DF0D4CF4](v19);
      -[SCNRenderer _beginFrame](self->_renderer, "_beginFrame");
      +[SCNTransaction lock](SCNTransaction, "lock");
      -[SCNRenderer _drawAtTime:](self->_renderer, "_drawAtTime:", a3);
      -[SCNRenderer _presentFramebuffer](self->_renderer, "_presentFramebuffer");
      +[SCNTransaction unlock](SCNTransaction, "unlock");
      objc_autoreleasePoolPop(v20);
      kdebug_trace();
      -[SCNRenderer _nextFrameTime](self->_renderer, "_nextFrameTime");
      v22 = v21;
      v23 = CACurrentMediaTime();
      -[SCNRenderer unlock](self->_renderer, "unlock");
      if (C3DIsRunningInEditor())
      {
        objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPlaying:", 1);
        objc_msgSend(-[SCNMetalLayer displayLink](self, "displayLink"), "setPaused:", 0);
      }
      else if (-[SCNMetalLayer _checkAndUpdateDisplayLinkStateIfNeeded](self, "_checkAndUpdateDisplayLinkStateIfNeeded")&& !-[SCNMetalLayer isPlaying](self, "isPlaying")&& !self->_drawForJittering)
      {
        v24 = v22 - v23;
        if (v22 - v23 > 2.0)
          -[SCNJitterer restart](self->_jitterer, "restart", v24);
      }
      -[SCNRenderer _displayLinkStatsTack](self->_renderer, "_displayLinkStatsTack", v24);
    }
  }
}

- (void)_systemTimeAnimationStarted:(id)a3
{
  objc_msgSend(-[SCNMetalLayer displayLink](self, "displayLink", a3), "setPaused:", 0);
}

- (void)_sceneDidUpdate:(id)a3
{
  self->_lastUpdate = CACurrentMediaTime();
  -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
}

+ (id)_kvoKeysForwardedToRenderer
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("pointOfView"), CFSTR("sceneTime"), CFSTR("playing"), CFSTR("loops"), CFSTR("autoenablesDefaultLighting"), CFSTR("jitteringEnabled"), CFSTR("technique"), 0);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SCNMetalLayer;
  v5 = objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_);
  if (objc_msgSend((id)objc_msgSend(a1, "_kvoKeysForwardedToRenderer"), "containsObject:", a3))
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("renderer.%@"), a3)), "setByAddingObjectsFromSet:", v5);
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend((id)objc_msgSend(a1, "_kvoKeysForwardedToRenderer"), "containsObject:", a3) & 1) != 0)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SCNMetalLayer;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)contentLayer
{
  return 0;
}

- (BOOL)scn_inLiveResize
{
  return 0;
}

- (void)_jitterRedisplay
{
  self->_drawForJittering = 1;
  -[SCNMetalLayer display](self, "display");
  self->_drawForJittering = 0;
}

- (BOOL)_canJitter
{
  return 0;
}

- (BOOL)_supportsJitteringSyncRedraw
{
  return 0;
}

- (BOOL)isJitteringEnabled
{
  return -[SCNJitterer isEnabled](self->_jitterer, "isEnabled");
}

- (void)setJitteringEnabled:(BOOL)a3
{
  NSLog(CFSTR("Jittering is not supported on SCNMetalLayer"), a2, a3);
}

- (unint64_t)antialiasingMode
{
  return -[SCNRenderer _antialiasingMode](self->_renderer, "_antialiasingMode");
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  -[SCNRenderer set_antialiasingMode:](self->_renderer, "set_antialiasingMode:", a3);
  -[SCNMetalLayer setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)play
{
  -[SCNMetalLayer play:](self, "play:", 0);
}

- (void)stop
{
  -[SCNMetalLayer stop:](self, "stop:", 0);
}

- (void)pause
{
  -[SCNMetalLayer pause:](self, "pause:", 0);
}

- (void)setDebugOptions:(unint64_t)a3
{
  -[SCNRenderer setDebugOptions:](self->_renderer, "setDebugOptions:", a3);
}

- (unint64_t)debugOptions
{
  return -[SCNRenderer debugOptions](self->_renderer, "debugOptions");
}

- (BOOL)_showsAuthoringEnvironment
{
  return -[SCNRenderer _showsAuthoringEnvironment](self->_renderer, "_showsAuthoringEnvironment");
}

- (void)set_showsAuthoringEnvironment:(BOOL)a3
{
  -[SCNRenderer set_showsAuthoringEnvironment:](self->_renderer, "set_showsAuthoringEnvironment:", a3);
}

- (id)_authoringEnvironment
{
  return -[SCNRenderer _authoringEnvironment](self->_renderer, "_authoringEnvironment");
}

- (BOOL)syncTimeWithCoreAnimation
{
  return self->_syncTimeWithCoreAnimation;
}

- (void)setSyncTimeWithCoreAnimation:(BOOL)a3
{
  self->_syncTimeWithCoreAnimation = a3;
}

- (void)setPointOfCulling:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "pointOfCulling.scene";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

@end
