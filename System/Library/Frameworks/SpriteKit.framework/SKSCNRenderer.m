@implementation SKSCNRenderer

- (BOOL)ignoresSiblingOrder
{
  return 1;
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
  v4.super_class = (Class)SKSCNRenderer;
  -[SKSCNRenderer dealloc](&v4, sel_dealloc);
}

- (SKSCNRenderer)initWithSKCRenderer:(void *)a3
{
  SKSCNRenderer *v4;
  SKSCNRenderer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKSCNRenderer;
  v4 = -[SKSCNRenderer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_skcRenderer = a3;
    -[SKSCNRenderer _initialize](v4, "_initialize");
  }
  return v5;
}

- (void)_initialize
{
  NSMutableDictionary *v3;
  NSMutableDictionary *viewRenderOptions;
  SKScene *scene;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  viewRenderOptions = self->_viewRenderOptions;
  self->_viewRenderOptions = v3;

  self->_timePreviousUpdate = -1.0;
  *(_WORD *)&self->_hasRenderedOnce = 0;
  self->_disableInput = 0;
  scene = self->_scene;
  self->_scene = 0;

  self->_frames = 0;
  -[SKSCNRenderer setShowsSpriteBounds:](self, "setShowsSpriteBounds:", 0);
  -[SKSCNRenderer setShowsFPS:](self, "setShowsFPS:", 0);
  -[SKSCNRenderer setShowsNodeCount:](self, "setShowsNodeCount:", 0);
  self->_backingScaleFactor = 1.0;
  self->_prevBackingScaleFactor = 0.0;
}

- (void)updateAtTime:(double)a3
{
  SKScene *scene;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SKScene *v17;
  double v18;
  double v19;
  double timePreviousUpdate;
  CFTimeInterval v21;
  SKScene *v22;
  uint64_t v23;
  SKScene *v24;

  scene = self->_scene;
  if (scene)
  {
    -[SKScene size](scene, "size");
    v7 = v6;
    v9 = v8;
    if (-[SKScene scaleMode](self->_scene, "scaleMode") == SKSceneScaleModeResizeFill)
    {
      -[SKScene size](self->_scene, "size");
      v11 = v10;
      v13 = v12;
      -[SKSCNRenderer bounds](self, "bounds");
      if (v11 != v15 || v13 != v14)
      {
        v17 = self->_scene;
        -[SKSCNRenderer bounds](self, "bounds");
        -[SKScene setSize:](v17, "setSize:", v18, v19);
        -[SKScene didChangeSize:](self->_scene, "didChangeSize:", v7, v9);
      }
    }
  }
  timePreviousUpdate = self->_timePreviousUpdate;
  if (timePreviousUpdate <= 0.0)
  {
    self->_timePreviousUpdate = a3;
    timePreviousUpdate = a3;
  }
  v21 = CACurrentMediaTime();
  if (a3 - v21 < -0.025)
    a3 = v21;
  self->_timePreviousUpdate = a3;
  if (a3 - timePreviousUpdate >= 0.0)
  {
    if (a3 - timePreviousUpdate > 1.0 && (v22 = self->_scene) != 0)
    {
      v23 = -[SKNode isPaused](v22, "isPaused");
      -[SKScene setPaused:](self->_scene, "setPaused:", 1);
      skSetTime(a3);
      -[SKScene setPaused:](self->_scene, "setPaused:", 0);
      -[SKScene setPaused:](self->_scene, "setPaused:", v23);
    }
    else
    {
      skSetTime(a3);
    }
    v24 = self->_scene;
    if (v24)
    {
      if (-[SKScene _usesExplicitUpdate](v24, "_usesExplicitUpdate"))
      {
        if (!-[SKScene _needsUpdate](self->_scene, "_needsUpdate"))
          return;
        -[SKScene set_needsUpdate:](self->_scene, "set_needsUpdate:", 0);
      }
      -[SKSCNRenderer _update:](self, "_update:", a3);
    }
  }
}

- (void)renderWithEncoder:(id)a3 pass:(id)a4 commandQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  int8x16_t v26;
  int8x16_t v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  void *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  int8x16_t v46;
  int8x16_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  std::__shared_weak_count *v53;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v51);
  if ((_QWORD)v51 && (v11 = __dynamic_cast((const void *)v51, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0)) != 0)
  {
    v52 = v11;
    v53 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
    if (*((_QWORD *)&v51 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
  }
  else
  {
    v52 = 0;
    v53 = 0;
  }
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
  if (*((_QWORD *)&v51 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v52;
  if (v52)
  {
    jet_context_Metal::override_Metal_render_state();
    v51 = 0uLL;
    v18 = (*(uint64_t (**)(void *, id, id))(*(_QWORD *)v17 + 400))(v17, v8, v9);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v50, v18);
    v19 = v50;
    v50 = 0uLL;
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
    v51 = v19;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v50 + 1);
    if (*((_QWORD *)&v50 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v50 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    -[SKSCNRenderer _getDestBounds](self, "_getDestBounds");
    v47 = v26;
    -[SKSCNRenderer _getViewport](self, "_getViewport");
    v46 = v27;
    -[SKSCNRenderer _getMatrix](self, "_getMatrix");
    v44 = v29;
    v45 = v28;
    v42 = v31;
    v43 = v30;
    -[SKSCNRenderer _getOptions](self, "_getOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("renderNoCommit"));
    SKCRenderer::render((uint64_t)self->_skcRenderer, (_OWORD *)-[SKNode _backingNode](self->_scene, "_backingNode"), (unint64_t *)&v51, 0, v32, 0, 0, 0, &v48, v47, v46, v45, v44, v43, v42, 0.0);
    v33 = v49;
    if (v49)
    {
      v34 = (unint64_t *)&v49->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }

    v36 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
    if (*((_QWORD *)&v51 + 1))
    {
      v37 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
        std::__shared_weak_count::__release_weak(v36);
      }
    }
  }
  v39 = v53;
  if (v53)
  {
    v40 = (unint64_t *)&v53->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }

}

- (void)renderTransition:(id)a3 withInputTexture:(id)a4 outputTexture:(id)a5 time:(float)a6 encoder:(id)a7 pass:(id)a8 commandQueue:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t texture_2d;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int8x16_t v55;
  int8x16_t v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  std::__shared_weak_count *v74;
  unint64_t *v75;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  __n128 v80;
  __n128 v81;
  __n128 v82;
  __n128 v83;
  int8x16_t v84;
  int8x16_t v85;
  id v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  uint64_t v89;
  std::__shared_weak_count *v90;
  __int128 v91;
  __int128 v92;
  void *v93;
  std::__shared_weak_count *v94;

  v16 = a3;
  v86 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v92);
  if ((_QWORD)v92 && (v21 = __dynamic_cast((const void *)v92, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0)) != 0)
  {
    v93 = v21;
    v94 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
    if (*((_QWORD *)&v92 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v92 + 1) + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
  }
  else
  {
    v93 = 0;
    v94 = 0;
  }
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
  if (*((_QWORD *)&v92 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v92 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = v93;
  if (v93)
  {
    jet_context_Metal::override_Metal_render_state();
    v92 = 0uLL;
    if (v18)
    {
      v28 = (*(uint64_t (**)(void *, id, id))(*(_QWORD *)v27 + 400))(v27, v18, v19);
      std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v91, v28);
      v29 = v91;
      v91 = 0uLL;
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
      v92 = v29;
      if (v30)
      {
        p_shared_owners = (unint64_t *)&v30->__shared_owners_;
        do
          v32 = __ldaxr(p_shared_owners);
        while (__stlxr(v32 - 1, p_shared_owners));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
      v33 = (std::__shared_weak_count *)*((_QWORD *)&v91 + 1);
      if (*((_QWORD *)&v91 + 1))
      {
        v34 = (unint64_t *)(*((_QWORD *)&v91 + 1) + 8);
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
      v36 = v93;
    }
    else
    {
      v37 = (*(uint64_t (**)(void *))(*(_QWORD *)v27 + 112))(v27);
      std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v91, v37);
      v38 = v91;
      v91 = 0uLL;
      v39 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
      v92 = v38;
      if (v39)
      {
        v40 = (unint64_t *)&v39->__shared_owners_;
        do
          v41 = __ldaxr(v40);
        while (__stlxr(v41 - 1, v40));
        if (!v41)
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
      }
      v42 = (std::__shared_weak_count *)*((_QWORD *)&v91 + 1);
      if (*((_QWORD *)&v91 + 1))
      {
        v43 = (unint64_t *)(*((_QWORD *)&v91 + 1) + 8);
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
      v45 = v16;
      v36 = v93;
      objc_msgSend(v19, "colorAttachments");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectAtIndexedSubscript:", 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "texture");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (*(uint64_t (**)(void *, void *))(*(_QWORD *)v36 + 408))(v36, v48);
      *(_QWORD *)(v92 + 16) = v49;

      v50 = v92;
      *(_QWORD *)(v92 + 48) = 1;
      *(_OWORD *)(v50 + 32) = xmmword_1DC9217E0;
      (***(void (****)(_QWORD))(v50 + 16))(*(_QWORD *)(v50 + 16));
      (*(void (**)(_QWORD))(**(_QWORD **)(v92 + 16) + 8))(*(_QWORD *)(v92 + 16));
      texture_2d = jet_context::create_texture_2d();
      v52 = v92;
      *(_QWORD *)(v92 + 232) = texture_2d;
      *(_QWORD *)(v52 + 208) = texture_2d;
      *(_QWORD *)(v52 + 216) = 0x13F800000;
      *(_DWORD *)(v52 + 244) = 1;
      v16 = v45;
    }
    v53 = (*(uint64_t (**)(void *, id))(*(_QWORD *)v36 + 408))(v36, v17);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v91, v53);
    v54 = (*(uint64_t (**)(void *, id))(*(_QWORD *)v36 + 408))(v36, v86);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v89, v54);
    -[SKSCNRenderer _getDestBounds](self, "_getDestBounds");
    v85 = v55;
    -[SKSCNRenderer _getViewport](self, "_getViewport");
    v84 = v56;
    -[SKSCNRenderer _getMatrix](self, "_getMatrix");
    v82 = v58;
    v83 = v57;
    v80 = v60;
    v81 = v59;
    -[SKSCNRenderer _getOptions](self, "_getOptions");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v18)
      objc_msgSend(v61, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("renderNoCommit"));
    v63 = v16;
    v64 = objc_msgSend(v16, "_backingNode");
    *(float *)(v64 + 720) = a6;
    SKCTransitionNode::setIgnoreScenes(v64, 1);
    SKCTransitionNode::setInputTextures(v64, (uint64_t *)&v91, &v89);
    SKCTransitionNode::setFlipTextures(v64, 1);
    SKCRenderer::render((uint64_t)self->_skcRenderer, (_OWORD *)v64, (unint64_t *)&v92, 0, v62, 0, 0, 0, &v87, v85, v84, v83, v82, v81, v80, 0.0);
    v65 = v88;
    v16 = v63;
    if (v88)
    {
      v66 = (unint64_t *)&v88->__shared_owners_;
      do
        v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }

    v68 = v90;
    if (v90)
    {
      v69 = (unint64_t *)&v90->__shared_owners_;
      do
        v70 = __ldaxr(v69);
      while (__stlxr(v70 - 1, v69));
      if (!v70)
      {
        ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
        std::__shared_weak_count::__release_weak(v68);
      }
    }
    v71 = (std::__shared_weak_count *)*((_QWORD *)&v91 + 1);
    if (*((_QWORD *)&v91 + 1))
    {
      v72 = (unint64_t *)(*((_QWORD *)&v91 + 1) + 8);
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 - 1, v72));
      if (!v73)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
    v74 = (std::__shared_weak_count *)*((_QWORD *)&v92 + 1);
    if (*((_QWORD *)&v92 + 1))
    {
      v75 = (unint64_t *)(*((_QWORD *)&v92 + 1) + 8);
      do
        v76 = __ldaxr(v75);
      while (__stlxr(v76 - 1, v75));
      if (!v76)
      {
        ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
        std::__shared_weak_count::__release_weak(v74);
      }
    }
  }
  v77 = v94;
  if (v94)
  {
    v78 = (unint64_t *)&v94->__shared_owners_;
    do
      v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }

}

- (void)renderToTexture:(id)a3 commandQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (***v17)(_QWORD);
  unint64_t v18;
  uint64_t texture_2d;
  uint64_t v20;
  unint64_t v21;
  int8x16_t v22;
  int8x16_t v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  int8x16_t v43;
  int8x16_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t v49;
  std::__shared_weak_count *v50;
  const void *v51;
  std::__shared_weak_count *v52;
  void *v53;
  std::__shared_weak_count *v54;

  v6 = a3;
  v7 = a4;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v51);
  if (v51 && (v8 = __dynamic_cast(v51, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0)) != 0)
  {
    v53 = v8;
    v54 = v52;
    if (v52)
    {
      p_shared_owners = (unint64_t *)&v52->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
  }
  else
  {
    v53 = 0;
    v54 = 0;
  }
  v11 = v52;
  if (v52)
  {
    v12 = (unint64_t *)&v52->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v53;
  if (v53)
  {
    jet_context_Metal::override_Metal_render_state();
    v15 = (*(uint64_t (**)(void *, id))(*(_QWORD *)v14 + 408))(v14, v6);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v51, v15);
    v16 = (*(uint64_t (**)(void *))(*(_QWORD *)v14 + 112))(v14);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v49, v16);
    v17 = (void (***)(_QWORD))v51;
    v18 = v49;
    *(_QWORD *)(v49 + 16) = v51;
    *(_QWORD *)(v18 + 48) = 1;
    (**v17)(v17);
    (*(void (**)(_QWORD))(**(_QWORD **)(v49 + 16) + 8))(*(_QWORD *)(v49 + 16));
    texture_2d = jet_context::create_texture_2d();
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v47, texture_2d);
    v20 = v47;
    v21 = v49;
    *(_QWORD *)(v49 + 232) = v47;
    *(_QWORD *)(v21 + 208) = v20;
    *(_QWORD *)(v21 + 216) = 0x13F800000;
    *(_DWORD *)(v21 + 244) = 1;
    -[SKSCNRenderer _getDestBounds](self, "_getDestBounds");
    v44 = v22;
    -[SKSCNRenderer _getViewport](self, "_getViewport");
    v43 = v23;
    -[SKSCNRenderer _getMatrix](self, "_getMatrix");
    SKCRenderer::render((uint64_t)self->_skcRenderer, (_OWORD *)-[SKNode _backingNode](self->_scene, "_backingNode"), &v49, 0, 0, 0, 0, 0, &v45, v44, v43, v24, v25, v26, v27, 0.0);
    v28 = v46;
    if (v46)
    {
      v29 = (unint64_t *)&v46->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    v31 = v48;
    if (v48)
    {
      v32 = (unint64_t *)&v48->__shared_owners_;
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v34 = v50;
    if (v50)
    {
      v35 = (unint64_t *)&v50->__shared_owners_;
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    v37 = v52;
    if (v52)
    {
      v38 = (unint64_t *)&v52->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
  }
  v40 = v54;
  if (v54)
  {
    v41 = (unint64_t *)&v54->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }

}

- (void)renderToFramebuffer:(int)a3 shouldClear:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  jet_context_OpenGL *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  jet_context_OpenGL *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  int8x16_t v26;
  int8x16_t v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  void *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  int8x16_t v47;
  int8x16_t v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  __int128 v51;
  __int128 v52;
  jet_context_OpenGL *v53;
  std::__shared_weak_count *v54;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v52);
  if ((_QWORD)v52
    && (v7 = (jet_context_OpenGL *)__dynamic_cast((const void *)v52, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C8], 0)) != 0)
  {
    v53 = v7;
    v54 = (std::__shared_weak_count *)*((_QWORD *)&v52 + 1);
    if (*((_QWORD *)&v52 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v52 + 1) + 8);
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
  }
  else
  {
    v53 = 0;
    v54 = 0;
  }
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v52 + 1);
  if (*((_QWORD *)&v52 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v52 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v53;
  if (v53)
  {
    (*(void (**)(jet_context_OpenGL *))(*(_QWORD *)v53 + 360))(v53);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[SKSCNRenderer getOpenGLFramebuffer:](SKSCNRenderer, "getOpenGLFramebuffer:", v14);

    jet_context_OpenGL::synchronize_OpenGL_state(v13);
    v16 = (*(uint64_t (**)(jet_context_OpenGL *))(*(_QWORD *)v13 + 112))(v13);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v52, v16);
    v17 = (*(uint64_t (**)(jet_context_OpenGL *, uint64_t))(*(_QWORD *)v13 + 376))(v13, v5);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v51, v17);
    v18 = v51;
    v51 = 0uLL;
    v19 = (std::__shared_weak_count *)*((_QWORD *)&v52 + 1);
    v52 = v18;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    v22 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
    if (*((_QWORD *)&v51 + 1))
    {
      v23 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v25 = v52;
    *(_DWORD *)(v52 + 48) = v4;
    *(_DWORD *)(v25 + 220) = v4;
    -[SKSCNRenderer _getDestBounds](self, "_getDestBounds");
    v48 = v26;
    -[SKSCNRenderer _getViewport](self, "_getViewport");
    v47 = v27;
    -[SKSCNRenderer _getMatrix](self, "_getMatrix");
    v45 = v29;
    v46 = v28;
    v43 = v31;
    v44 = v30;
    -[SKSCNRenderer _getOptions](self, "_getOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("renderNoCommit"));
    SKCRenderer::render((uint64_t)self->_skcRenderer, (_OWORD *)-[SKNode _backingNode](self->_scene, "_backingNode"), (unint64_t *)&v52, 0, v32, 0, 0, 0, &v49, v48, v47, v46, v45, v44, v43, 0.0);
    v33 = v50;
    if (v50)
    {
      v34 = (unint64_t *)&v50->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    (*(void (**)(jet_context_OpenGL *))(*(_QWORD *)v53 + 360))(v53);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKSCNRenderer restoreDefaultOpenGLState:frameBuffer:](SKSCNRenderer, "restoreDefaultOpenGLState:frameBuffer:", v36, v15);

    v37 = (std::__shared_weak_count *)*((_QWORD *)&v52 + 1);
    if (*((_QWORD *)&v52 + 1))
    {
      v38 = (unint64_t *)(*((_QWORD *)&v52 + 1) + 8);
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
  }
  v40 = v54;
  if (v54)
  {
    v41 = (unint64_t *)&v54->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
}

- (void)render:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  EAGLContext *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  GLint params;
  void *lpsrc;
  std::__shared_weak_count *v17;
  void *v18;
  std::__shared_weak_count *v19;

  v3 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &lpsrc);
  if (lpsrc && (v5 = __dynamic_cast(lpsrc, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C8], 0)) != 0)
  {
    v18 = v5;
    v19 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  v8 = v17;
  if (v17)
  {
    v9 = (unint64_t *)&v17->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (v18)
  {
    params = -1;
    (*(void (**)(void *))(*(_QWORD *)v18 + 360))(v18);
    v11 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    glContextUse::glContextUse((glContextUse *)&lpsrc, v11);

    glGetIntegerv(0x8CA6u, &params);
    glContextUse::~glContextUse((glContextUse *)&lpsrc);
    -[SKSCNRenderer renderToFramebuffer:shouldClear:](self, "renderToFramebuffer:shouldClear:", params, v3);
  }
  v12 = v19;
  if (v19)
  {
    v13 = (unint64_t *)&v19->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)settingsForTransition:(id)a3 atTime:(double)a4 renderIncomingToTexture:(BOOL *)a5 renderOutgoingToTexture:(BOOL *)a6 renderIncomingToScreen:(BOOL *)a7 renderOutgoingToScreen:(BOOL *)a8
{
  *a5 = 1;
  *a6 = 1;
  *a7 = 0;
  *a8 = 0;
}

- (void)renderTransition:(id)a3 withInputTexture:(unsigned int)a4 outputTexture:(unsigned int)a5 inputTextureSize:(CGSize)a6 outputTextureSize:(CGSize)a7 time:(float)a8
{
  double height;
  double width;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  void *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  EAGLContext *v23;
  double v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  GLint params;
  void *lpsrc;
  std::__shared_weak_count *v30;
  void *v31;
  std::__shared_weak_count *v32;

  height = a7.height;
  width = a7.width;
  v11 = a6.height;
  v12 = a6.width;
  v13 = *(_QWORD *)&a5;
  v14 = *(_QWORD *)&a4;
  v16 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &lpsrc);
  if (lpsrc && (v17 = __dynamic_cast(lpsrc, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C8], 0)) != 0)
  {
    v31 = v17;
    v32 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
    }
  }
  else
  {
    v31 = 0;
    v32 = 0;
  }
  v20 = v30;
  if (v30)
  {
    v21 = (unint64_t *)&v30->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  if (v31)
  {
    params = -1;
    (*(void (**)(void *))(*(_QWORD *)v31 + 360))(v31);
    v23 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    glContextUse::glContextUse((glContextUse *)&lpsrc, v23);

    glGetIntegerv(0x8CA6u, &params);
    glContextUse::~glContextUse((glContextUse *)&lpsrc);
    *(float *)&v24 = a8;
    -[SKSCNRenderer renderTransition:toFramebuffer:withInputTexture:outputTexture:inputTextureSize:outputTextureSize:time:](self, "renderTransition:toFramebuffer:withInputTexture:outputTexture:inputTextureSize:outputTextureSize:time:", v16, params, v14, v13, v12, v11, width, height, v24);
  }
  v25 = v32;
  if (v32)
  {
    v26 = (unint64_t *)&v32->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }

}

- (void)renderTransition:(id)a3 toFramebuffer:(int)a4 withInputTexture:(unsigned int)a5 outputTexture:(unsigned int)a6 inputTextureSize:(CGSize)a7 outputTextureSize:(CGSize)a8 time:(float)a9
{
  double height;
  double width;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  jet_context_OpenGL *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  jet_context_OpenGL *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  std::__shared_weak_count *v31;
  unint64_t *p_shared_owners;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _DWORD *v37;
  int8x16_t v38;
  int8x16_t v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  void *v44;
  jet_context_OpenGL *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  void *v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  std::__shared_weak_count *v56;
  unint64_t *v57;
  unint64_t v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  __n128 v65;
  __n128 v66;
  __n128 v67;
  __n128 v68;
  int8x16_t v69;
  int8x16_t v70;
  uint64_t v71;
  std::__shared_weak_count *v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  __int128 v75;
  void *lpsrc[2];
  jet_context_OpenGL *v77;
  std::__shared_weak_count *v78;

  height = a8.height;
  width = a8.width;
  v12 = a7.height;
  v13 = a7.width;
  v14 = *(_QWORD *)&a6;
  v15 = *(_QWORD *)&a5;
  v16 = *(_QWORD *)&a4;
  v18 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, lpsrc);
  if (lpsrc[0]
    && (v19 = (jet_context_OpenGL *)__dynamic_cast(lpsrc[0], MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C8], 0)) != 0)
  {
    v77 = v19;
    v78 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v20 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
  }
  else
  {
    v77 = 0;
    v78 = 0;
  }
  v22 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1])
  {
    v23 = (unint64_t *)((char *)lpsrc[1] + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = v77;
  if (v77)
  {
    (*(void (**)(jet_context_OpenGL *))(*(_QWORD *)v77 + 360))(v77);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[SKSCNRenderer getOpenGLFramebuffer:](SKSCNRenderer, "getOpenGLFramebuffer:", v26);

    jet_context_OpenGL::synchronize_OpenGL_state(v25);
    v28 = (*(uint64_t (**)(jet_context_OpenGL *))(*(_QWORD *)v25 + 112))(v25);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(lpsrc, v28);
    v29 = (*(uint64_t (**)(jet_context_OpenGL *, uint64_t))(*(_QWORD *)v25 + 376))(v25, v16);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v75, v29);
    v30 = v75;
    v75 = 0uLL;
    v31 = (std::__shared_weak_count *)lpsrc[1];
    *(_OWORD *)lpsrc = v30;
    if (v31)
    {
      p_shared_owners = (unint64_t *)&v31->__shared_owners_;
      do
        v33 = __ldaxr(p_shared_owners);
      while (__stlxr(v33 - 1, p_shared_owners));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    v34 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    if (*((_QWORD *)&v75 + 1))
    {
      v35 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      if (!v36)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }
    v37 = lpsrc[0];
    *((_DWORD *)lpsrc[0] + 12) = 1;
    v37[55] = 1;
    -[SKSCNRenderer _getDestBounds](self, "_getDestBounds");
    v70 = v38;
    -[SKSCNRenderer _getViewport](self, "_getViewport");
    v69 = v39;
    -[SKSCNRenderer _getMatrix](self, "_getMatrix");
    v67 = v41;
    v68 = v40;
    v65 = v43;
    v66 = v42;
    -[SKSCNRenderer _getOptions](self, "_getOptions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("renderNoCommit"));
    v45 = v77;
    v46 = (*(uint64_t (**)(jet_context_OpenGL *, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v77 + 368))(v77, v14, v13, v12, 3, 0);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v75, v46);
    v47 = (*(uint64_t (**)(jet_context_OpenGL *, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)v45 + 368))(v45, v15, width, height, 3, 0);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v73, v47);
    v48 = objc_msgSend(v18, "_backingNode");
    *(float *)(v48 + 720) = a9;
    SKCTransitionNode::setIgnoreScenes(v48, 1);
    SKCTransitionNode::setInputTextures(v48, (uint64_t *)&v75, &v73);
    SKCTransitionNode::setFlipTextures(v48, 0);
    SKCRenderer::render((uint64_t)self->_skcRenderer, (_OWORD *)v48, (unint64_t *)lpsrc, 0, v44, 0, 0, 0, &v71, v70, v69, v68, v67, v66, v65, 0.0);
    v49 = v72;
    if (v72)
    {
      v50 = (unint64_t *)&v72->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    (*(void (**)(jet_context_OpenGL *))(*(_QWORD *)v77 + 360))(v77);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKSCNRenderer restoreDefaultOpenGLState:frameBuffer:](SKSCNRenderer, "restoreDefaultOpenGLState:frameBuffer:", v52, v27);

    v53 = v74;
    if (v74)
    {
      v54 = (unint64_t *)&v74->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
    v56 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    if (*((_QWORD *)&v75 + 1))
    {
      v57 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
      do
        v58 = __ldaxr(v57);
      while (__stlxr(v58 - 1, v57));
      if (!v58)
      {
        ((void (*)(std::__shared_weak_count *))v56->__on_zero_shared)(v56);
        std::__shared_weak_count::__release_weak(v56);
      }
    }

    v59 = (std::__shared_weak_count *)lpsrc[1];
    if (lpsrc[1])
    {
      v60 = (unint64_t *)((char *)lpsrc[1] + 8);
      do
        v61 = __ldaxr(v60);
      while (__stlxr(v61 - 1, v60));
      if (!v61)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
      }
    }
  }
  v62 = v78;
  if (v78)
  {
    v63 = (unint64_t *)&v78->__shared_owners_;
    do
      v64 = __ldaxr(v63);
    while (__stlxr(v64 - 1, v63));
    if (!v64)
    {
      ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
      std::__shared_weak_count::__release_weak(v62);
    }
  }

}

+ (int)getOpenGLFramebuffer:(id)a3
{
  GLint v3;
  _BYTE v5[20];
  GLint params;

  params = -1;
  glContextUse::glContextUse((glContextUse *)v5, (EAGLContext *)a3);
  glGetIntegerv(0x8CA6u, &params);
  v3 = params;
  glContextUse::~glContextUse((glContextUse *)v5);
  return v3;
}

+ (void)restoreDefaultOpenGLState:(id)a3 frameBuffer:(int)a4
{
  _BYTE v5[16];

  glContextUse::glContextUse((glContextUse *)v5, (EAGLContext *)a3);
  glBindFramebuffer(0x8D40u, a4);
  glDisable(0xC11u);
  glEnable(0xB71u);
  glDepthMask(1u);
  glContextUse::~glContextUse((glContextUse *)v5);
}

- (BOOL)showsSpriteBounds
{
  return 1;
}

- (BOOL)showsFPS
{
  return 1;
}

- (BOOL)showsNodeCount
{
  return 1;
}

- (BOOL)showsQuadCount
{
  return 1;
}

- (BOOL)showsDrawCount
{
  return 0;
}

- (BOOL)showsPhysics
{
  return 0;
}

- (BOOL)_showsOutlineInterior
{
  return 0;
}

- (BOOL)showsFields
{
  return 0;
}

- (SKSCNRenderer)init
{
  return -[SKSCNRenderer initWithSKCRenderer:](self, "initWithSKCRenderer:", 0);
}

+ (id)rendererWithDevice:(id)a3 options:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  SKSCNRenderer *v14;
  SKSCNRenderer *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v4 = a3;
  if (SKGetShouldEnableMetal())
  {
    SKGetGlobalMetalDevice();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      SKSetGlobalMetalDevice(v4);
    v6 = operator new();
    MEMORY[0x1DF0CF47C](v6, v4);
    std::shared_ptr<jet_context>::shared_ptr[abi:ne180100]<jet_context_Metal,void>(&v22, v6);
    v7 = operator new();
    v8 = v7;
    v20 = v22;
    v21 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    SKCRenderer::SKCRenderer(v7, &v20);
    v11 = v21;
    if (v21)
    {
      v12 = (unint64_t *)&v21->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = [SKSCNRenderer alloc];
    v15 = -[SKSCNRenderer initWithSKCRenderer:](v14, "initWithSKCRenderer:", v8, v20);
    v16 = v23;
    if (v23)
    {
      v17 = (unint64_t *)&v23->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)setPrefersOpenGL:(BOOL)a3
{
  SKSetPrefersOpenGL(a3);
}

+ (id)rendererWithContext:(id)a3 options:(id)a4
{
  id v4;
  SKSCNRenderer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  SKSCNRenderer *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;

  v4 = a3;
  SKSetPrefersOpenGL(1);
  if ((SKGetShouldEnableMetal() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = +[SKSCNRenderer getOpenGLFramebuffer:](SKSCNRenderer, "getOpenGLFramebuffer:", v4);
    v7 = operator new();
    MEMORY[0x1DF0CF4A0](v7, v4);
    std::shared_ptr<jet_context_OpenGL>::shared_ptr[abi:ne180100]<jet_context_OpenGL,void>(&v22, v7);
    v8 = operator new();
    v9 = v8;
    v20 = v22;
    v21 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    SKCRenderer::SKCRenderer(v8, &v20);
    v12 = v21;
    if (v21)
    {
      v13 = (unint64_t *)&v21->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = [SKSCNRenderer alloc];
    v5 = -[SKSCNRenderer initWithSKCRenderer:](v15, "initWithSKCRenderer:", v9, v20);
    +[SKSCNRenderer restoreDefaultOpenGLState:frameBuffer:](SKSCNRenderer, "restoreDefaultOpenGLState:frameBuffer:", v4, v6);
    v16 = v23;
    if (v23)
    {
      v17 = (unint64_t *)&v23->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }

  return v5;
}

- (BOOL)_showsSpriteBounds
{
  return 0;
}

- (BOOL)_shouldCenterStats
{
  return 0;
}

- (BOOL)_showsCoreAnimationFPS
{
  return 0;
}

- (BOOL)_showsCPUStats
{
  return 0;
}

- (BOOL)_showsGPUStats
{
  return 0;
}

- (BOOL)_showsCulledNodesInNodeCount
{
  return 0;
}

- (BOOL)_showsTotalAreaRendered
{
  return 0;
}

- (void)_showAllStats
{
  -[SKSCNRenderer setShowsDrawCount:](self, "setShowsDrawCount:", 1);
  -[SKSCNRenderer setShowsFPS:](self, "setShowsFPS:", 1);
  -[SKSCNRenderer setShowsNodeCount:](self, "setShowsNodeCount:", 1);
  -[SKSCNRenderer setShowsQuadCount:](self, "setShowsQuadCount:", 1);
  -[SKSCNRenderer set_showsCulledNodesInNodeCount:](self, "set_showsCulledNodesInNodeCount:", 1);
  -[SKSCNRenderer set_showsGPUStats:](self, "set_showsGPUStats:", 1);
  -[SKSCNRenderer set_showsCPUStats:](self, "set_showsCPUStats:", 1);
  -[SKSCNRenderer set_showsCoreAnimationFPS:](self, "set_showsCoreAnimationFPS:", 1);
  -[SKSCNRenderer set_showsTotalAreaRendered:](self, "set_showsTotalAreaRendered:", 1);
  -[SKSCNRenderer setShowsPhysics:](self, "setShowsPhysics:", 1);
  -[SKSCNRenderer setShowsFields:](self, "setShowsFields:", 1);
}

- (void)_update:(double)a3
{
  SKScene *scene;
  _BOOL4 v6;
  SKScene *v7;

  scene = self->_scene;
  if (scene)
  {
    v6 = -[SKScene _usesExplicitUpdate](scene, "_usesExplicitUpdate");
    v7 = self->_scene;
    if (v6)
    {
      if (!-[SKScene _needsUpdate](v7, "_needsUpdate"))
        return;
      -[SKScene set_needsUpdate:](self->_scene, "set_needsUpdate:", 0);
      v7 = self->_scene;
    }
    -[SKScene _update:](v7, "_update:", a3);
    self->_hasRenderedForCurrentUpdate = 0;
  }
}

- (double)_getViewport
{
  float32x4_t v2;
  double v3;
  float64x2_t v4;
  float64_t v5;
  double result;
  float64_t v7;
  float32x4_t v8;

  objc_msgSend(a1, "_getDestBounds");
  v8 = v2;
  objc_msgSend(a1, "backingScaleFactor");
  v7 = v3;
  objc_msgSend(a1, "backingScaleFactor");
  v4.f64[0] = v7;
  v4.f64[1] = v5;
  *(_QWORD *)&result = vmovn_hight_s64(0, (int64x2_t)vcvtq_u64_f64(vmulq_f64(v4, vcvt_hight_f64_f32(v8)))).u64[0];
  return result;
}

- (double)_getDestBounds
{
  double v2;
  float64x2_t v3;
  float64_t v4;
  double result;
  float64_t v6;

  objc_msgSend(a1, "bounds");
  v6 = v2;
  objc_msgSend(a1, "bounds");
  v3.f64[0] = v6;
  v3.f64[1] = v4;
  *(_QWORD *)&result = vcvt_hight_f32_f64(0, v3).u64[0];
  return result;
}

- (__n128)_getMatrix
{
  return *(__n128 *)MEMORY[0x1E0C83FF0];
}

- (id)_getOptions
{
  void *v2;
  void *v3;

  v2 = (void *)-[NSMutableDictionary mutableCopy](self->_viewRenderOptions, "mutableCopy");
  sk_get_debug_options();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  return v2;
}

- (id)_scene
{
  return self->_scene;
}

- (double)_fps
{
  return 0.0;
}

- (int)_spriteRenderCount
{
  return 0;
}

- (int)_spriteSubmitCount
{
  return 0;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (void)setBackingScaleFactor:(double)a3
{
  self->_backingScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_statsLabel, 0);
  objc_storeStrong((id *)&self->_viewRenderOptions, 0);
}

@end
