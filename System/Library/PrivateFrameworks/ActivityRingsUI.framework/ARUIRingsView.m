@implementation ARUIRingsView

- (void)_updateRenderContext
{
  double v3;
  double v4;
  ARUIRenderContext *v5;
  void *v6;
  float v7;
  double v8;
  float v9;
  ARUIRenderContext *renderContext;

  -[ARUIRingsView bounds](self, "bounds");
  v5 = -[ARUIRenderContext initWithSize:]([ARUIRenderContext alloc], "initWithSize:", v3, v4);
  -[ARUIRenderContext setOpaque:](v5, "setOpaque:", -[ARUIRingsView isOpaque](self, "isOpaque"));
  -[ARUIRingsView metalLayer](self, "metalLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderContext drawableSize](v5, "drawableSize");
  v8 = v7;
  -[ARUIRenderContext drawableSize](v5, "drawableSize");
  objc_msgSend(v6, "setDrawableSize:", v8, v9);

  renderContext = self->_renderContext;
  self->_renderContext = v5;

  -[ARUIRingsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  id *v3;
  void *v4;
  void *v5;
  _BOOL4 discardBackBuffers;
  _QWORD *v7;
  void *v8;
  ARUIRenderer *renderer;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView layoutSubviews](&v15, sel_layoutSubviews);
  if (-[ARUIRingsView _shouldAllowRendering](self, "_shouldAllowRendering"))
  {
    -[ARUIRingsView metalLayer](self, "metalLayer");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isDrawableAvailable"))
    {
      -[ARUIRingsView metalLayer](self, "metalLayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nextDrawable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return;
      objc_initWeak(&location, self);
      discardBackBuffers = self->_discardBackBuffers;
      if (self->_discardBackBuffers)
      {
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __31__ARUIRingsView_layoutSubviews__block_invoke;
        v12[3] = &unk_24CEC60E0;
        v7 = v12;
        v3 = &v13;
        objc_copyWeak(&v13, &location);
      }
      else
      {
        v7 = 0;
      }
      v8 = (void *)MEMORY[0x2199A6364](v7);
      renderer = self->_renderer;
      -[ARUIRingsView _allRings](self, "_allRings");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARUIRingsView _anySpriteSheet](self, "_anySpriteSheet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARUIRenderer renderRings:spriteSheet:intoDrawable:withContext:completion:](renderer, "renderRings:spriteSheet:intoDrawable:withContext:completion:", v10, v11, v5, self->_renderContext, v8);

      if (discardBackBuffers)
        objc_destroyWeak(v3);
      objc_destroyWeak(&location);
    }
    else
    {
      v5 = v3;
    }

  }
}

- (BOOL)_shouldAllowRendering
{
  void *v2;
  char v3;

  if (!self->_shouldBypassApplicationStateChecking && self->_backgrounded
    || !self->_inViewHierarchy
    || !self->_shouldRenderOnLayout)
  {
    return 0;
  }
  if (!self->_shouldCheckDrawableAvailable)
    return 1;
  -[ARUIRingsView metalLayer](self, "metalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDrawableAvailable");

  return v3;
}

- (id)_anySpriteSheet
{
  NSArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_ringGroups;
  v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "spriteSheet", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "spriteSheet");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_allRings
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_ringGroups;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "rings", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

void __52__ARUIRingsView__sharedInitWithRingGroups_renderer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDelegate:", v2);
  objc_msgSend(v3, "setPaused:", 1);

}

- (ARUIRingsView)initWithRingGroup:(id)a3
{
  id v4;
  ARUIRingsView *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARUIRingsView;
  v5 = -[ARUIRingsView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingsView _sharedInitWithRingGroups:renderer:](v5, "_sharedInitWithRingGroups:renderer:", v6, 0);

  }
  return v5;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  self->_inViewHierarchy = a3 != 0;
  v4 = a3;
  -[ARUIRingsView _updateRingGroupPauseState](self, "_updateRingGroupPauseState");
  v5.receiver = self;
  v5.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);

}

- (void)_updateRingGroupPauseState
{
  BOOL v3;
  void *v4;
  int v5;
  NSArray *ringGroups;
  _QWORD v7[4];
  BOOL v8;

  if (self->_inViewHierarchy)
    v3 = !self->_shouldBypassApplicationStateChecking && self->_backgrounded;
  else
    v3 = 1;
  -[ARUIRingsView ringGroup](self, "ringGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "paused");

  ringGroups = self->_ringGroups;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__ARUIRingsView__updateRingGroupPauseState__block_invoke;
  v7[3] = &__block_descriptor_33_e30_v32__0__ARUIRingGroup_8Q16_B24l;
  v8 = v3;
  -[NSArray enumerateObjectsUsingBlock:](ringGroups, "enumerateObjectsUsingBlock:", v7);
  if (!v3)
  {
    if (v5)
      -[ARUIRingsView setNeedsLayout](self, "setNeedsLayout");
  }
}

void __31__ARUIRingsView_layoutSubviews__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "ringGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animating");

  if ((v4 & 1) == 0)
  {
    v5 = objc_loadWeakRetained(v1);
    objc_msgSend(v5, "_discardBackBuffers");

  }
}

- (ARUIRingGroup)ringGroup
{
  return (ARUIRingGroup *)-[NSArray firstObject](self->_ringGroups, "firstObject");
}

- (void)_sharedInitWithRingGroups:(id)a3 renderer:(id)a4
{
  ARUIRenderer *v7;
  ARUIRenderer *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];

  v12 = a3;
  v7 = (ARUIRenderer *)a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__ARUIRingsView__sharedInitWithRingGroups_renderer___block_invoke;
  v14[3] = &unk_24CEC60B8;
  v14[4] = self;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);
  objc_storeStrong((id *)&self->_ringGroups, a3);
  v8 = v7;
  if (!v7)
    v8 = objc_alloc_init(ARUIRenderer);
  objc_storeStrong((id *)&self->_renderer, v8);
  if (!v7)

  -[ARUIRingsView _updateRenderContext](self, "_updateRenderContext", v12);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "applicationState");

  self->_backgrounded = v10 == 2;
  self->_discardBackBuffers = 1;
  self->_shouldRenderOnLayout = 1;
  self->_shouldCheckDrawableAvailable = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__didEnterBackground_, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__willEnterForeground_, *MEMORY[0x24BEBE008], 0);

}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ARUIRingsView _updateRenderContext](self, "_updateRenderContext");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ARUIRingsView _updateRenderContext](self, "_updateRenderContext");
}

uint64_t __43__ARUIRingsView__updateRingGroupPauseState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:", *(unsigned __int8 *)(a1 + 32));
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (ARUIRingsView)initWithRingGroupController:(id)a3
{
  id v4;
  ARUIRingsView *v5;
  uint64_t v6;
  NSArray *ringGroupControllers;
  void *v8;
  objc_super v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARUIRingsView;
  v5 = -[ARUIRingsView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    ringGroupControllers = v5->_ringGroupControllers;
    v5->_ringGroupControllers = (NSArray *)v6;

    v11 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingsView _sharedInitWithWithRingGroupControllers:renderer:](v5, "_sharedInitWithWithRingGroupControllers:renderer:", v8, 0);

  }
  return v5;
}

- (ARUIRingsView)initWithRingGroupController:(id)a3 renderer:(id)a4
{
  id v6;
  id v7;
  ARUIRingsView *v8;
  uint64_t v9;
  NSArray *ringGroupControllers;
  void *v11;
  objc_super v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARUIRingsView;
  v8 = -[ARUIRingsView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    ringGroupControllers = v8->_ringGroupControllers;
    v8->_ringGroupControllers = (NSArray *)v9;

    v14 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingsView _sharedInitWithWithRingGroupControllers:renderer:](v8, "_sharedInitWithWithRingGroupControllers:renderer:", v11, v7);

  }
  return v8;
}

- (ARUIRingsView)initWithRingGroupControllers:(id)a3
{
  id v5;
  ARUIRingsView *v6;
  ARUIRingsView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARUIRingsView;
  v6 = -[ARUIRingsView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ringGroupControllers, a3);
    -[ARUIRingsView _sharedInitWithWithRingGroupControllers:renderer:](v7, "_sharedInitWithWithRingGroupControllers:renderer:", v5, 0);
  }

  return v7;
}

- (ARUIRingsView)initWithRingGroupControllers:(id)a3 renderer:(id)a4
{
  id v7;
  id v8;
  ARUIRingsView *v9;
  ARUIRingsView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ARUIRingsView;
  v9 = -[ARUIRingsView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ringGroupControllers, a3);
    -[ARUIRingsView _sharedInitWithWithRingGroupControllers:renderer:](v10, "_sharedInitWithWithRingGroupControllers:renderer:", v7, v8);
  }

  return v10;
}

- (ARUIRingGroupController)ringGroupController
{
  return (ARUIRingGroupController *)-[NSArray firstObject](self->_ringGroupControllers, "firstObject");
}

- (NSArray)ringGroupControllers
{
  return self->_ringGroupControllers;
}

- (void)_sharedInitWithWithRingGroupControllers:(id)a3 renderer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "ringGroup", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[ARUIRingsView _sharedInitWithRingGroups:renderer:](self, "_sharedInitWithRingGroups:renderer:", v8, v7);
}

- (ARUIRingsView)initWithRingGroup:(id)a3 renderer:(id)a4
{
  id v6;
  id v7;
  ARUIRingsView *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingsView;
  v8 = -[ARUIRingsView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARUIRingsView _sharedInitWithRingGroups:renderer:](v8, "_sharedInitWithRingGroups:renderer:", v9, v7);

  }
  return v8;
}

- (ARUIRingsView)initWithRingGroups:(id)a3
{
  id v4;
  ARUIRingsView *v5;
  ARUIRingsView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARUIRingsView;
  v5 = -[ARUIRingsView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
    -[ARUIRingsView _sharedInitWithRingGroups:renderer:](v5, "_sharedInitWithRingGroups:renderer:", v4, 0);

  return v6;
}

- (ARUIRingsView)initWithRingGroups:(id)a3 renderer:(id)a4
{
  id v6;
  id v7;
  ARUIRingsView *v8;
  ARUIRingsView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ARUIRingsView;
  v8 = -[ARUIRingsView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
    -[ARUIRingsView _sharedInitWithRingGroups:renderer:](v8, "_sharedInitWithRingGroups:renderer:", v6, v7);

  return v9;
}

- (id)ringGroups
{
  return self->_ringGroups;
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ARUIRingsView;
  -[ARUIRingsView setOpaque:](&v5, sel_setOpaque_);
  -[ARUIRenderContext setOpaque:](self->_renderContext, "setOpaque:", v3);
  -[ARUIRingsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_discardBackBuffers
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__ARUIRingsView__discardBackBuffers__block_invoke;
  block[3] = &unk_24CEC5CE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __36__ARUIRingsView__discardBackBuffers__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "metalLayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeBackBuffers");

}

- (void)_didEnterBackground:(id)a3
{
  self->_backgrounded = 1;
  -[ARUIRingsView _updateRingGroupPauseState](self, "_updateRingGroupPauseState", a3);
}

- (void)_willEnterForeground:(id)a3
{
  self->_backgrounded = 0;
  -[ARUIRingsView _updateRingGroupPauseState](self, "_updateRingGroupPauseState", a3);
}

- (void)setSynchronizesWithCA:(BOOL)a3
{
  -[ARUIRenderContext setPresentsWithTransaction:](self->_renderContext, "setPresentsWithTransaction:", a3);
}

- (BOOL)synchronizesWithCA
{
  return -[ARUIRenderContext presentsWithTransaction](self->_renderContext, "presentsWithTransaction");
}

- (UIImage)snapshot
{
  ARUIRenderer *renderer;
  void *v4;
  void *v5;
  void *v6;

  renderer = self->_renderer;
  -[ARUIRingsView _allRings](self, "_allRings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRingsView _anySpriteSheet](self, "_anySpriteSheet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARUIRenderer snapshotRings:spriteSheet:withContext:](renderer, "snapshotRings:spriteSheet:withContext:", v4, v5, self->_renderContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

- (ARUIRenderer)renderer
{
  return self->_renderer;
}

- (BOOL)shouldBypassApplicationStateChecking
{
  return self->_shouldBypassApplicationStateChecking;
}

- (void)setShouldBypassApplicationStateChecking:(BOOL)a3
{
  self->_shouldBypassApplicationStateChecking = a3;
}

- (BOOL)discardBackBuffers
{
  return self->_discardBackBuffers;
}

- (void)setDiscardBackBuffers:(BOOL)a3
{
  self->_discardBackBuffers = a3;
}

- (BOOL)shouldRenderOnLayout
{
  return self->_shouldRenderOnLayout;
}

- (void)setShouldRenderOnLayout:(BOOL)a3
{
  self->_shouldRenderOnLayout = a3;
}

- (BOOL)shouldCheckDrawableAvailable
{
  return self->_shouldCheckDrawableAvailable;
}

- (void)setShouldCheckDrawableAvailable:(BOOL)a3
{
  self->_shouldCheckDrawableAvailable = a3;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (double)emptyRingAlpha
{
  return self->_emptyRingAlpha;
}

- (void)setEmptyRingAlpha:(double)a3
{
  self->_emptyRingAlpha = a3;
}

- (unint64_t)iconTextureRows
{
  return self->_iconTextureRows;
}

- (void)setIconTextureRows:(unint64_t)a3
{
  self->_iconTextureRows = a3;
}

- (unint64_t)iconTextureColumns
{
  return self->_iconTextureColumns;
}

- (void)setIconTextureColumns:(unint64_t)a3
{
  self->_iconTextureColumns = a3;
}

- (UIImage)iconSpriteImage
{
  return self->_iconSpriteImage;
}

- (void)setIconSpriteImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconSpriteImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSpriteImage, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_ringGroupControllers, 0);
  objc_storeStrong((id *)&self->_ringGroups, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
}

+ (id)ringsViewConfiguredForThreeRingsOnWatch
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:withIcon:renderer:](ARUIRingsView, "ringsViewConfiguredForWatchOfType:withIcon:renderer:", 3, 1, 0);
}

+ (id)ringsViewConfiguredForThreeRingsOnWatchWithRenderer:(id)a3
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:withIcon:renderer:](ARUIRingsView, "ringsViewConfiguredForWatchOfType:withIcon:renderer:", 3, 1, a3);
}

+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:withIcon:renderer:](ARUIRingsView, "ringsViewConfiguredForWatchOfType:withIcon:renderer:", a3, 1, 0);
}

+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3 withRenderer:(id)a4
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:withIcon:renderer:](ARUIRingsView, "ringsViewConfiguredForWatchOfType:withIcon:renderer:", a3, 1, a4);
}

+ (id)ringsViewConfiguredForOneRingOnWatchOfType:(int64_t)a3 withIcon:(BOOL)a4
{
  return +[ARUIRingsView ringsViewConfiguredForWatchOfType:withIcon:renderer:](ARUIRingsView, "ringsViewConfiguredForWatchOfType:withIcon:renderer:", a3, a4, 0);
}

+ (id)ringsViewConfiguredForWatchOfType:(int64_t)a3 withIcon:(BOOL)a4 renderer:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  ARUIRingsView *v9;

  v5 = a4;
  v7 = a5;
  +[ARUIRingGroupController ringGroupControllerConfiguredForWatchWithRingType:withIcon:](ARUIRingGroupController, "ringGroupControllerConfiguredForWatchWithRingType:withIcon:", a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ARUIRingsView initWithRingGroupController:renderer:]([ARUIRingsView alloc], "initWithRingGroupController:renderer:", v8, v7);

  return v9;
}

+ (id)ringsViewConfiguredForThreeRingsOnCompanion
{
  return +[ARUIRingsView ringsViewConfiguredForCompanionOfType:withRenderer:](ARUIRingsView, "ringsViewConfiguredForCompanionOfType:withRenderer:", 3, 0);
}

+ (id)ringsViewConfiguredForThreeRingsOnCompanionWithRenderer:(id)a3
{
  return +[ARUIRingsView ringsViewConfiguredForCompanionOfType:withRenderer:](ARUIRingsView, "ringsViewConfiguredForCompanionOfType:withRenderer:", 3, a3);
}

+ (id)ringsViewConfiguredForOneRingOnCompanionOfType:(int64_t)a3
{
  return +[ARUIRingsView ringsViewConfiguredForCompanionOfType:withRenderer:](ARUIRingsView, "ringsViewConfiguredForCompanionOfType:withRenderer:", a3, 0);
}

+ (id)ringsViewConfiguredForCompanionOfType:(int64_t)a3 withRenderer:(id)a4
{
  id v5;
  void *v6;
  ARUIRingsView *v7;

  v5 = a4;
  +[ARUIRingGroupController ringGroupControllerConfiguredForCompanionWithRingType:withIcon:](ARUIRingGroupController, "ringGroupControllerConfiguredForCompanionWithRingType:withIcon:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ARUIRingsView initWithRingGroupController:renderer:]([ARUIRingsView alloc], "initWithRingGroupController:renderer:", v6, v5);

  return v7;
}

- (void)setActiveEnergyPercentage:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[ARUIRingsView ringGroupController](self, "ringGroupController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveEnergyPercentage:animated:", v4, a3);

}

- (void)setMovingHoursPercentage:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[ARUIRingsView ringGroupController](self, "ringGroupController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMovingHoursPercentage:animated:", v4, a3);

}

- (void)setBriskPercentage:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[ARUIRingsView ringGroupController](self, "ringGroupController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBriskPercentage:animated:", v4, a3);

}

- (void)setActiveEnergyPercentage:(double)a3 briskPercentage:(double)a4 movingHoursPercentage:(double)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;

  v7 = a6;
  v12 = a7;
  -[ARUIRingsView ringGroupController](self, "ringGroupController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActiveEnergyPercentage:briskPercentage:movingHoursPercentage:animated:completion:", v7, v12, a3, a4, a5);

}

@end
