@implementation SKRenderer

+ (SKRenderer)rendererWithDevice:(id)device
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  SKRenderer *v13;
  SKRenderer *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v3 = device;
  SKGetGlobalMetalDevice();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    SKSetGlobalMetalDevice(v3);
  v5 = operator new();
  MEMORY[0x1DF0CF47C](v5, v3);
  std::shared_ptr<jet_context>::shared_ptr[abi:ne180100]<jet_context_Metal,void>(&v21, v5);
  v6 = operator new();
  v7 = v6;
  v19 = v21;
  v20 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  SKCRenderer::SKCRenderer(v6, &v19);
  v10 = v20;
  if (v20)
  {
    v11 = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = [SKRenderer alloc];
  v14 = -[SKRenderer initWithSKCRenderer:](v13, "initWithSKCRenderer:", v7, v19);
  v15 = v22;
  if (v22)
  {
    v16 = (unint64_t *)&v22->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  return v14;
}

- (SKRenderer)initWithSKCRenderer:(void *)a3
{
  SKRenderer *v4;
  SKRenderer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKRenderer;
  v4 = -[SKRenderer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_skcRenderer = a3;
    -[SKRenderer _initialize](v4, "_initialize");
  }
  return v5;
}

- (void)_initialize
{
  NSMutableDictionary *v3;
  NSMutableDictionary *renderOptions;
  void *v5;
  uint64_t v6;

  -[SKRenderer setScene:](self, "setScene:", 0);
  self->_hasRenderedForCurrentUpdate = 0;
  *(_WORD *)&self->_needsInitialUpdate = 1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  renderOptions = self->_renderOptions;
  self->_renderOptions = v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:", v5, CFSTR("debugDrawStats_BGColor"));

  v6 = MEMORY[0x1E0C9AAB0];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("debugDisablePresentationTime"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:", v6, CFSTR("cullNonVisibleNodes"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ignoresSiblingOrder"));
}

- (void)dealloc
{
  SKCRenderer *skcRenderer;
  objc_super v4;

  skcRenderer = (SKCRenderer *)self->_skcRenderer;
  if (skcRenderer)
  {
    SKCRenderer::~SKCRenderer(skcRenderer);
    MEMORY[0x1DF0CF560]();
    self->_skcRenderer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKRenderer;
  -[SKRenderer dealloc](&v4, sel_dealloc);
}

- (void)renderWithViewport:(CGRect)viewport renderCommandEncoder:(id)renderCommandEncoder renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor commandQueue:(id)commandQueue
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  MTLRenderPassDescriptor *v14;
  id v15;
  void *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  float v42;
  void *v43;
  void *skcRenderer;
  _OWORD *v45;
  int8x16_t v46;
  int8x16_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  __n128 v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  __int128 v66;
  void *lpsrc[2];
  void *v68;
  std::__shared_weak_count *v69;

  height = viewport.size.height;
  width = viewport.size.width;
  y = viewport.origin.y;
  x = viewport.origin.x;
  v13 = renderCommandEncoder;
  v14 = renderPassDescriptor;
  v15 = commandQueue;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, lpsrc);
  if (lpsrc[0] && (v16 = __dynamic_cast(lpsrc[0], MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0)) != 0)
  {
    v68 = v16;
    v69 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v17 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
  }
  else
  {
    v68 = 0;
    v69 = 0;
  }
  v19 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v20 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v68;
  if (v68)
  {
    jet_context_Metal::override_Metal_render_state();
    lpsrc[0] = 0;
    lpsrc[1] = 0;
    v23 = (*(uint64_t (**)(void *, id, MTLRenderPassDescriptor *))(*(_QWORD *)v22 + 400))(v22, v13, v14);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v66, v23);
    v24 = v66;
    v66 = 0uLL;
    v25 = (std::__shared_weak_count *)lpsrc[1];
    *(_OWORD *)lpsrc = v24;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v28 = (std::__shared_weak_count *)*((_QWORD *)&v66 + 1);
    if (*((_QWORD *)&v66 + 1))
    {
      v29 = (unint64_t *)(*((_QWORD *)&v66 + 1) + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    if (!lpsrc[0])
    {
      v51 = (std::__shared_weak_count *)lpsrc[1];
      if (!lpsrc[1])
        goto LABEL_39;
      v54 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v53 = __ldaxr(v54);
      while (__stlxr(v53 - 1, v54));
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "nativeScale");
    v33 = v32;

    -[MTLRenderPassDescriptor colorAttachments](v14, "colorAttachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "texture");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "width");

    -[MTLRenderPassDescriptor colorAttachments](v14, "colorAttachments");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "texture");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "height");
    v42 = (float)(int)v33;
    *(float *)&v62 = (float)v37 / v42;
    *(float *)&v63 = (float)v41 / v42;

    self->_renderBounds.origin.x = 0.0;
    self->_renderBounds.origin.y = 0.0;
    self->_renderBounds.size.width = *(float *)&v62;
    self->_renderBounds.size.height = *(float *)&v63;
    v60 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 16);
    v61 = *(__n128 *)MEMORY[0x1E0C83FF0];
    v58 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 48);
    v59 = *(__n128 *)(MEMORY[0x1E0C83FF0] + 32);
    -[SKRenderer _getOptions](self, "_getOptions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKRenderer _notifyWillRenderContent](self, "_notifyWillRenderContent");
    skcRenderer = self->_skcRenderer;
    v45 = -[SKNode _backingNode](self->_scene, "_backingNode");
    v46.i64[0] = 0;
    v46.i64[1] = __PAIR64__(v63, v62);
    v47.i32[0] = x;
    v47.i32[1] = y;
    v47.i32[2] = width;
    v47.i32[3] = height;
    SKCRenderer::render((uint64_t)skcRenderer, v45, (unint64_t *)lpsrc, 0, v43, 0, 0, 0, &v64, v46, v47, v61, v60, v59, v58, 0.0);
    v48 = v65;
    if (v65)
    {
      v49 = (unint64_t *)&v65->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }

    v51 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v52 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
LABEL_37:
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
  }
LABEL_39:
  v55 = v69;
  if (v69)
  {
    v56 = (unint64_t *)&v69->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }

}

- (void)renderWithViewport:(CGRect)viewport commandBuffer:(id)commandBuffer renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
{
  double height;
  double width;
  double y;
  double x;
  MTLRenderPassDescriptor *v11;
  void *v12;
  void *v13;
  id v14;

  height = viewport.size.height;
  width = viewport.size.width;
  y = viewport.origin.y;
  x = viewport.origin.x;
  v14 = commandBuffer;
  v11 = renderPassDescriptor;
  objc_msgSend(v14, "commandQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderCommandEncoderWithDescriptor:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("SKRenderer Pass"));
  -[SKRenderer renderWithViewport:renderCommandEncoder:renderPassDescriptor:commandQueue:](self, "renderWithViewport:renderCommandEncoder:renderPassDescriptor:commandQueue:", v13, v11, v12, x, y, width, height);
  objc_msgSend(v13, "endEncoding");

}

- (void)_notifyWillRenderContent
{
  SKScene *scene;
  uint64_t v4;
  void *v5;
  char v6;
  SKScene *nextScene;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  id v14;

  scene = self->_scene;
  if (scene)
  {
    -[SKScene delegate](scene, "delegate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v11 = (id)v4;
      -[SKScene delegate](self->_scene, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[SKScene delegate](self->_scene, "delegate");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "willRenderContentForScene:", self->_scene);

      }
    }
  }
  nextScene = self->_nextScene;
  if (nextScene)
  {
    -[SKScene delegate](nextScene, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v13 = (id)v8;
      -[SKScene delegate](self->_nextScene, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[SKScene delegate](self->_nextScene, "delegate");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "willRenderContentForScene:", self->_nextScene);

      }
    }
  }
}

- (void)updateAtTime:(NSTimeInterval)currentTime
{
  if (sk_debug_get_optional())
    kdebug_trace();
  if (currentTime <= 0.0)
    currentTime = CACurrentMediaTime();
  -[SKRenderer _update:](self, "_update:", currentTime);
  kdebug_trace();
}

- (void)_update:(double)a3
{
  SKScene **p_scene;
  double v6;
  double v7;
  float v9;
  SKScene *scene;
  SKScene *nextScene;
  _BOOL8 v12;
  _BOOL8 v13;
  double currentTime;
  double v15;
  SKTransition *transition;
  uint64_t v17;
  float *v18;
  float v19;
  float v20;
  SKScene *v21;
  SKTransition *v22;
  NSMapTable *touchMap;
  SKScene *v24;
  SKScene *v25;
  SKScene *v26;
  SKScene *v27;
  SKTransition *v28;

  p_scene = &self->_scene;
  if (-[SKScene scaleMode](self->_scene, "scaleMode") == SKSceneScaleModeResizeFill)
  {
    -[SKScene size](self->_scene, "size");
    if (v7 != self->_renderBounds.size.width || v6 != self->_renderBounds.size.height)
      -[SKScene setSize:](*p_scene, "setSize:");
  }
  if (-[SKNode isPaused](*p_scene, "isPaused") && !self->_needsInitialUpdate)
    goto LABEL_50;
  v9 = a3 - self->_previousTime;
  if (v9 < 0.0)
    return;
  if (v9 <= 1.0)
  {
    currentTime = self->_currentTime;
    self->_currentTime = a3;
    self->_previousTime = currentTime;
    goto LABEL_21;
  }
  scene = self->_scene;
  nextScene = self->_nextScene;
  if (!scene)
  {
    v12 = 0;
    if (nextScene)
      goto LABEL_13;
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v12 = -[SKNode isPaused](self->_scene, "isPaused");
  -[SKScene setPaused:](*p_scene, "setPaused:", 1);
  if (!nextScene)
    goto LABEL_16;
LABEL_13:
  v13 = -[SKNode isPaused](self->_nextScene, "isPaused");
  -[SKScene setPaused:](self->_nextScene, "setPaused:", 1);
LABEL_17:
  v15 = self->_currentTime;
  self->_currentTime = a3;
  self->_previousTime = v15;
  if (scene)
  {
    -[SKScene setPaused:](*p_scene, "setPaused:", 0);
    -[SKScene setPaused:](*p_scene, "setPaused:", v12);
  }
  if (nextScene)
  {
    -[SKScene setPaused:](self->_nextScene, "setPaused:", 0);
    -[SKScene setPaused:](self->_nextScene, "setPaused:", v13);
  }
LABEL_21:
  transition = self->_transition;
  if (transition)
  {
    v17 = -[SKTransition _backingNode](transition, "_backingNode");
    *(float *)(v17 + 584) = *(float *)(v17 + 584) + v9;
    v18 = -[SKTransition _backingNode](self->_transition, "_backingNode");
    v19 = *(float *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 584);
    v18[180] = v19 / *(float *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 580);
    v20 = *(float *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 584);
    if (v20 >= *(float *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 580))
    {
      if (*(_BYTE *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 576))
        -[SKScene setPaused:](*p_scene, "setPaused:", 0);
      -[SKScene _willMoveFromView:](self->_scene, "_willMoveFromView:", self);
      objc_storeStrong((id *)p_scene, self->_nextScene);
      v21 = self->_nextScene;
      self->_nextScene = 0;

      self->_disableInput = 0;
      if (*(_BYTE *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 577))
        -[SKScene setPaused:](*p_scene, "setPaused:", 0);
      v22 = self->_transition;
      self->_transition = 0;

      touchMap = self->_touchMap;
      if (touchMap)
        -[NSMapTable removeAllObjects](touchMap, "removeAllObjects");
      if (!*p_scene)
      {
        v25 = 0;
        goto LABEL_38;
      }
      SKCNode::setDirty((SKCNode *)-[SKNode _backingNode](*p_scene, "_backingNode"));
    }
  }
  v24 = *p_scene;
  v25 = v24;
  if (v24 && !-[SKNode isPaused](v24, "isPaused"))
  {
    if (!-[SKScene _usesExplicitUpdate](v25, "_usesExplicitUpdate"))
    {
LABEL_36:
      -[SKScene _update:](v25, "_update:", a3);
      self->_hasRenderedForCurrentUpdate = 0;
      goto LABEL_38;
    }
    if (-[SKScene _needsUpdate](v25, "_needsUpdate"))
    {
      -[SKScene set_needsUpdate:](v25, "set_needsUpdate:", 0);
      goto LABEL_36;
    }
  }
LABEL_38:
  v26 = self->_nextScene;
  v27 = v26;
  if (v26 && !-[SKNode isPaused](v26, "isPaused"))
  {
    if (!-[SKScene _usesExplicitUpdate](v27, "_usesExplicitUpdate"))
    {
LABEL_43:
      -[SKScene _update:](v27, "_update:", a3);
      self->_hasRenderedForCurrentUpdate = 0;
      goto LABEL_44;
    }
    if (-[SKScene _needsUpdate](v27, "_needsUpdate"))
    {
      -[SKScene set_needsUpdate:](v27, "set_needsUpdate:", 0);
      goto LABEL_43;
    }
  }
LABEL_44:

  if (self->_needsInitialUpdate)
  {
    v28 = self->_transition;
    if (v28)
    {
      if (*(_BYTE *)(-[SKTransition _backingNode](v28, "_backingNode") + 576))
        -[SKScene setPaused:](*p_scene, "setPaused:", 1);
      if (*(_BYTE *)(-[SKTransition _backingNode](self->_transition, "_backingNode") + 577))
        -[SKScene setPaused:](self->_nextScene, "setPaused:", 1);
    }
  }
LABEL_50:
  self->_needsInitialUpdate = 0;
}

- (id)_getOptions
{
  void *v2;
  void *v3;

  v2 = (void *)-[NSMutableDictionary mutableCopy](self->_renderOptions, "mutableCopy");
  sk_get_debug_options();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  return v2;
}

- (void)setShouldCullNonVisibleNodes:(BOOL)shouldCullNonVisibleNodes
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", shouldCullNonVisibleNodes);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)shouldCullNonVisibleNodes
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_renderOptions, "objectForKeyedSubscript:", CFSTR("cullNonVisibleNodes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setIgnoresSiblingOrder:(BOOL)ignoresSiblingOrder
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ignoresSiblingOrder);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)ignoresSiblingOrder
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_renderOptions, "objectForKeyedSubscript:", CFSTR("ignoresSiblingOrder"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsPhysics:(BOOL)showsPhysics
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsPhysics);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)showsPhysics
{
  void *v2;
  char v3;

  -[NSMutableDictionary valueForKey:](self->_renderOptions, "valueForKey:", CFSTR("debugDrawPhysics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsFields:(BOOL)showsFields
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsFields);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)showsFields
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_renderOptions, "objectForKeyedSubscript:", CFSTR("debugDrawPhysicsFields"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsQuadCount:(BOOL)showsQuadCount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsQuadCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)showsQuadCount
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_renderOptions, "objectForKeyedSubscript:", CFSTR("debugDrawStats_QuadCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsNodeCount:(BOOL)showsNodeCount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsNodeCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)showsNodeCount
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_renderOptions, "objectForKeyedSubscript:", CFSTR("debugDrawStats_NodeCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setShowsDrawCount:(BOOL)showsDrawCount
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", showsDrawCount);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");

}

- (BOOL)showsDrawCount
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_renderOptions, "objectForKeyedSubscript:", CFSTR("debugDrawStats_DrawCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(SKScene *)scene
{
  objc_storeStrong((id *)&self->_scene, scene);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderOptions, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_nextScene, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
