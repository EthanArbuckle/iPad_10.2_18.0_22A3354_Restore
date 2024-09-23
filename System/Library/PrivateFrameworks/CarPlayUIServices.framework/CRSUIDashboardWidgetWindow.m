@implementation CRSUIDashboardWidgetWindow

- (CRSUIDashboardWidgetWindow)initWithWindowScene:(id)a3
{
  id v4;
  CRSUIDashboardWidgetWindow *v5;
  CRSUIDashboardWidgetWindow *v6;
  CRSUIDashboardWidgetWindowProxy *v7;
  CRSUIDashboardWidgetWindowProxy *exportedObject;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;
  _QWORD v32[4];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRSUIDashboardWidgetWindow;
  v5 = -[CRSUIWindow initWithWindowScene:](&v31, sel_initWithWindowScene_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = -[CRSUIDashboardWidgetWindowProxy initWithDelegate:]([CRSUIDashboardWidgetWindowProxy alloc], "initWithDelegate:", v5);
    exportedObject = v6->_exportedObject;
    v6->_exportedObject = v7;

    objc_opt_class();
    objc_msgSend(v4, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "settings");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (v11)
    {
      v25 = objc_alloc_init(MEMORY[0x24BDD19A0]);
      objc_msgSend(v11, "endpoint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_setEndpoint:", v12);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v25);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E2A28);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDBCF20];
      v15 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_clientSetFocusableItems_, 0, 0);

      objc_msgSend(v13, "setRemoteObjectInterface:", v24);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D8300);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDBCF20];
      v32[0] = objc_opt_class();
      v32[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_hostSetWidgetSizes_, 0, 0);

      objc_msgSend(v13, "setExportedInterface:", v17);
      objc_msgSend(v13, "setExportedObject:", v6->_exportedObject);
      objc_initWeak(&location, v6);
      v21 = MEMORY[0x24BDAC760];
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke;
      v28[3] = &unk_24C769F10;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v13, "setInterruptionHandler:", v28);
      v26[0] = v21;
      v26[1] = 3221225472;
      v26[2] = __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke_2;
      v26[3] = &unk_24C769F10;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v13, "setInvalidationHandler:", v26);
      objc_msgSend(v13, "resume");
      -[CRSUIDashboardWidgetWindow setDashboardWindowServiceConnection:](v6, "setDashboardWindowServiceConnection:", v13);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObserver:selector:name:object:", v6, sel__windowDidCreateContext_, CFSTR("_UIWindowDidCreateContextNotification"), v6);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

    }
  }

  return v6;
}

void __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

void __50__CRSUIDashboardWidgetWindow_initWithWindowScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateConnection");

}

- (BOOL)invalidated
{
  CRSUIDashboardWidgetWindow *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setInvalidated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  CRSUIDashboardWidgetWindow *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = -[CRSUIDashboardWidgetWindow invalidated](self, "invalidated");
  CRSUILogForCategory(3uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Window: %{public}@ already invalidated", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    if (v5)
    {
      v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating window: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    -[CRSUIDashboardWidgetWindow setInvalidated:](self, "setInvalidated:", 1);
    os_unfair_lock_lock(&self->_lock);
    -[CRSUIDashboardWidgetWindow _lock_invalidateCurrentFocusableItems](self, "_lock_invalidateCurrentFocusableItems");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[CRSUIDashboardWidgetWindow _lock_invalidateConnection](self, "_lock_invalidateConnection");
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  CRSUIDashboardWidgetWindow *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!-[CRSUIDashboardWidgetWindow invalidated](self, "invalidated"))
  {
    CRSUILogForCategory(3uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v6 = self;
      _os_log_impl(&dword_20D6CC000, v3, OS_LOG_TYPE_DEFAULT, "Window: %{public}@ not invalidated in dealloc", buf, 0xCu);
    }

    -[CRSUIDashboardWidgetWindow invalidate](self, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)CRSUIDashboardWidgetWindow;
  -[CRSUIDashboardWidgetWindow dealloc](&v4, sel_dealloc);
}

- (void)setFocusableViews:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  CRSUIDashboardWidgetWindow *v22;
  id v23;

  v4 = a3;
  if (-[CRSUIDashboardWidgetWindow invalidated](self, "invalidated"))
  {
    CRSUILogForCategory(3uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CRSUIDashboardWidgetWindow setFocusableViews:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[CRSUIDashboardWidgetWindow _lock_invalidateCurrentFocusableItems](self, "_lock_invalidateCurrentFocusableItems");
    os_unfair_lock_unlock(&self->_lock);
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __48__CRSUIDashboardWidgetWindow_setFocusableViews___block_invoke;
    v21 = &unk_24C769F38;
    v22 = self;
    v23 = v13;
    v14 = v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v18);
    os_unfair_lock_lock(&self->_lock);
    -[CRSUIDashboardWidgetWindow setFocusableItems:](self, "setFocusableItems:", v14, v18, v19, v20, v21, v22);
    -[CRSUIDashboardWidgetWindow dashboardWindowServiceConnection](self, "dashboardWindowServiceConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientSetFocusableItems:", v17);

    os_unfair_lock_unlock(&self->_lock);
    -[CRSUIDashboardWidgetWindow setContentReady](self, "setContentReady");

  }
}

void __48__CRSUIDashboardWidgetWindow_setFocusableViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CRSDashboardFocusableItem *v13;

  v3 = a2;
  v13 = -[CRSDashboardFocusableItem initWithFocusableView:]([CRSDashboardFocusableItem alloc], "initWithFocusableView:", v3);
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("frame"), 1, 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "convertRect:fromView:", v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[CRSDashboardFocusableItem setFrameInWindow:](v13, "setFrameInWindow:", v6, v8, v10, v12);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

}

- (UIColor)focusHighlightColor
{
  if (-[CRSUIDashboardWidgetWindow useSystemPrimaryFocusColor](self, "useSystemPrimaryFocusColor"))
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setNeedsLargeSize:(BOOL)a3 animationSettings:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[CRSUIDashboardWidgetWindow dashboardWindowServiceConnection](self, "dashboardWindowServiceConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF7000], "_synchronizedDrawingFence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientSetWantsLargeSize:fenceHandle:animationSettings:", v4, v8, v6);

}

- (void)setContentReady
{
  OUTLINED_FUNCTION_0(&dword_20D6CC000, a1, a3, "Attempting to set content ready after invalidation, ignoring.", a5, a6, a7, a8, 0);
}

- (void)_windowDidCreateContext:(id)a3
{
  CRSUIDashboardWidgetWindow *v4;
  void *v5;
  void *v6;
  CRSUIDashboardWidgetWindow *v7;

  objc_msgSend(a3, "object");
  v4 = (CRSUIDashboardWidgetWindow *)objc_claimAutoreleasedReturnValue();
  if (v4 == self)
  {
    v7 = v4;
    -[CRSUIDashboardWidgetWindow dashboardWindowServiceConnection](self, "dashboardWindowServiceConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateContextId:", -[CRSUIDashboardWidgetWindow _contextId](self, "_contextId"));

    v4 = v7;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("frame")))
  {
    objc_opt_class();
    v13 = v11;
    if (v13 && (objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    -[CRSUIDashboardWidgetWindow _focusableItemForClientItem:](self, "_focusableItemForClientItem:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[CRSUIDashboardWidgetWindow convertRect:fromView:](self, "convertRect:fromView:", v14);
    objc_msgSend(v15, "setFrameInWindow:");
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[CRSUIDashboardWidgetWindow dashboardWindowServiceConnection](self, "dashboardWindowServiceConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "remoteObjectProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientSetFocusableItems:", v19);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CRSUIDashboardWidgetWindow;
    -[CRSUIDashboardWidgetWindow observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)hostFocusableItem:(id)a3 focused:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CRSUIDashboardWidgetWindow_hostFocusableItem_focused___block_invoke;
  block[3] = &unk_24C769F60;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __56__CRSUIDashboardWidgetWindow_hostFocusableItem_focused___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_clientFocusableItemForItem:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "focusableItemFocused:", *(unsigned __int8 *)(a1 + 48));
    v2 = v3;
  }

}

- (void)hostFocusableItem:(id)a3 pressed:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CRSUIDashboardWidgetWindow_hostFocusableItem_pressed___block_invoke;
  block[3] = &unk_24C769F60;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __56__CRSUIDashboardWidgetWindow_hostFocusableItem_pressed___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_clientFocusableItemForItem:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "focusableItemPressed:", *(unsigned __int8 *)(a1 + 48));
    v2 = v3;
  }

}

- (void)hostSelectedFocusableItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__CRSUIDashboardWidgetWindow_hostSelectedFocusableItem___block_invoke;
  v6[3] = &unk_24C7699F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __56__CRSUIDashboardWidgetWindow_hostSelectedFocusableItem___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_clientFocusableItemForItem:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "focusableItemSelected");
    v1 = v2;
  }

}

- (void)hostSetWidgetSizes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__CRSUIDashboardWidgetWindow_hostSetWidgetSizes___block_invoke;
  v6[3] = &unk_24C7699F8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __49__CRSUIDashboardWidgetWindow_hostSetWidgetSizes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWidgetSizes:", *(_QWORD *)(a1 + 40));
}

- (void)hostSetUseSystemPrimaryFocusColor:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD block[5];

  v3 = a3;
  if (-[CRSUIDashboardWidgetWindow useSystemPrimaryFocusColor](self, "useSystemPrimaryFocusColor") != a3)
  {
    -[CRSUIDashboardWidgetWindow setUseSystemPrimaryFocusColor:](self, "setUseSystemPrimaryFocusColor:", v3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__CRSUIDashboardWidgetWindow_hostSetUseSystemPrimaryFocusColor___block_invoke;
    block[3] = &unk_24C769C98;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __64__CRSUIDashboardWidgetWindow_hostSetUseSystemPrimaryFocusColor___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CRSUIDashboardWidgetWindowFocusHighlightColorDidChangeNotification, *(_QWORD *)(a1 + 32));

}

- (id)_focusableItemForClientItem:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__CRSUIDashboardWidgetWindow__focusableItemForClientItem___block_invoke;
  v12[3] = &unk_24C769F88;
  v13 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v12);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

BOOL __58__CRSUIDashboardWidgetWindow__focusableItemForClientItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "focusProvidingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_clientFocusableItemForItem:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__CRSUIDashboardWidgetWindow__clientFocusableItemForItem___block_invoke;
  v13[3] = &unk_24C769F88;
  v14 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "focusProvidingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

uint64_t __58__CRSUIDashboardWidgetWindow__clientFocusableItemForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

- (void)_lock_invalidateCurrentFocusableItems
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  CRSUILogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6CC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating focusable items", buf, 2u);
  }

  -[CRSUIDashboardWidgetWindow focusableItems](self, "focusableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__CRSUIDashboardWidgetWindow__lock_invalidateCurrentFocusableItems__block_invoke;
  v5[3] = &unk_24C769FB0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  -[CRSUIDashboardWidgetWindow setFocusableItems:](self, "setFocusableItems:", 0);
}

void __67__CRSUIDashboardWidgetWindow__lock_invalidateCurrentFocusableItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "focusProvidingItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("frame"));

}

- (void)_invalidateConnection
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[CRSUIDashboardWidgetWindow _lock_invalidateConnection](self, "_lock_invalidateConnection");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_invalidateConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  CRSUILogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20D6CC000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection", v6, 2u);
  }

  -[CRSUIDashboardWidgetWindow dashboardWindowServiceConnection](self, "dashboardWindowServiceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedObject:", 0);

  -[CRSUIDashboardWidgetWindow dashboardWindowServiceConnection](self, "dashboardWindowServiceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[CRSUIDashboardWidgetWindow setDashboardWindowServiceConnection:](self, "setDashboardWindowServiceConnection:", 0);
}

- (NSArray)widgetSizes
{
  return self->_widgetSizes;
}

- (void)setWidgetSizes:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSizes, a3);
}

- (NSXPCConnection)dashboardWindowServiceConnection
{
  return self->_dashboardWindowServiceConnection;
}

- (void)setDashboardWindowServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardWindowServiceConnection, a3);
}

- (NSArray)focusableItems
{
  return self->_focusableItems;
}

- (void)setFocusableItems:(id)a3
{
  objc_storeStrong((id *)&self->_focusableItems, a3);
}

- (BOOL)useSystemPrimaryFocusColor
{
  return self->_useSystemPrimaryFocusColor;
}

- (void)setUseSystemPrimaryFocusColor:(BOOL)a3
{
  self->_useSystemPrimaryFocusColor = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (CRSUIDashboardWidgetWindowProxy)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong((id *)&self->_exportedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_focusableItems, 0);
  objc_storeStrong((id *)&self->_dashboardWindowServiceConnection, 0);
  objc_storeStrong((id *)&self->_widgetSizes, 0);
}

- (void)setFocusableViews:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D6CC000, a1, a3, "Attempting to set new focusable views after invalidation, ignoring.", a5, a6, a7, a8, 0);
}

@end
