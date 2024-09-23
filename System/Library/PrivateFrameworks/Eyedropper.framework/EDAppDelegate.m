@implementation EDAppDelegate

- (EDAppDelegate)init
{
  EDAppDelegate *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *mousePointerServiceAssertionByDisplayIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EDAppDelegate;
  v2 = -[EDAppDelegate init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__sceneWillConnect_, *MEMORY[0x24BDF7D30], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__sceneDidDisconnect_, *MEMORY[0x24BDF7D20], 0);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    mousePointerServiceAssertionByDisplayIdentifier = v2->_mousePointerServiceAssertionByDisplayIdentifier;
    v2->_mousePointerServiceAssertionByDisplayIdentifier = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)_sceneWillConnect:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *sceneDelegateByDisplayIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EDDisplayIdentifierForWindowScene(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sceneDelegateByDisplayIdentifier = self->_sceneDelegateByDisplayIdentifier;
  if (!sceneDelegateByDisplayIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sceneDelegateByDisplayIdentifier;
    self->_sceneDelegateByDisplayIdentifier = v7;

    sceneDelegateByDisplayIdentifier = self->_sceneDelegateByDisplayIdentifier;
  }
  -[NSMutableDictionary setObject:forKey:](sceneDelegateByDisplayIdentifier, "setObject:forKey:", v4, v5);

}

- (void)_sceneDidDisconnect:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  EDDisplayIdentifierForWindowScene(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_sceneDelegateByDisplayIdentifier, "removeObjectForKey:", v4);

}

- (id)mainScreenWindow
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_sceneDelegateByDisplayIdentifier, "objectForKey:", EDEmbeddedDisplayIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mainScreenLensView
{
  void *v2;
  void *v3;
  void *v4;

  -[EDAppDelegate mainScreenWindow](self, "mainScreenWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lensView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EDLensView)activeLensView
{
  EDLensView *activeLensView;

  activeLensView = self->_activeLensView;
  if (activeLensView)
    return activeLensView;
  -[EDAppDelegate mainScreenLensView](self, "mainScreenLensView");
  return (EDLensView *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  NSXPCListener *v5;
  NSXPCListener *serviceListener;
  NSMutableArray *v7;
  NSMutableArray *liveConnections;
  PSPointerClientController *v9;
  PSPointerClientController *pointerClientController;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.uikit.eyedropperd.service"));
  serviceListener = self->_serviceListener;
  self->_serviceListener = v5;

  -[NSXPCListener setDelegate:](self->_serviceListener, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  liveConnections = self->_liveConnections;
  self->_liveConnections = v7;

  v9 = (PSPointerClientController *)objc_opt_new();
  pointerClientController = self->_pointerClientController;
  self->_pointerClientController = v9;

  v11 = MEMORY[0x24BDAC760];
  v12 = (void *)*MEMORY[0x24BDF74F8];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke;
  v15[3] = &unk_24F24FB70;
  v15[4] = self;
  objc_msgSend(v12, "_performBlockAfterCATransactionCommits:", v15);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke_2;
  v14[3] = &unk_24F24FB98;
  v14[4] = self;
  notify_register_dispatch("com.apple.springboard.lockstate", &self->_notifyTokenLocked, MEMORY[0x24BDAC9B8], v14);
  return 1;
}

uint64_t __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
}

uint64_t __59__EDAppDelegate_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lockStateChanged");
}

- (void)lockStateChanged
{
  void *v3;

  if (self->_notifyTokenLocked != -1)
  {
    if (SBSGetScreenLockStatus())
    {
      -[EDAppDelegate cancelShowingEyeDropper](self, "cancelShowingEyeDropper");
      v3 = &__block_literal_global;
    }
    else
    {
      v3 = &__block_literal_global_15;
    }
    -[EDAppDelegate performOnAllWindows:](self, "performOnAllWindows:", v3);
  }
}

uint64_t __33__EDAppDelegate_lockStateChanged__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 1);
}

uint64_t __33__EDAppDelegate_lockStateChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHidden:", 0);
}

- (void)performOnAllWindows:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_sceneDelegateByDisplayIdentifier, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_mousePointerServiceAssertionByDisplayIdentifier, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          -[NSMutableDictionary objectForKey:](self->_sceneDelegateByDisplayIdentifier, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v4)
          {
            objc_msgSend(v12, "window");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v14);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A6ADC8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255A6AEC8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  -[NSMutableArray addObject:](self->_liveConnections, "addObject:", v7);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24F24FC20;
  objc_copyWeak(&v16, &from);
  objc_msgSend(v7, "setInterruptionHandler:", v15);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_24F24FC48;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  objc_msgSend(v7, "setInvalidationHandler:", v12);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __52__EDAppDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2)
    objc_msgSend(WeakRetained[4], "removeObject:", v2);

}

- (void)_enumerateRemoteClientsUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_liveConnections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "remoteObjectProxy", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)scene:(id)a3 didUpdateWithDiff:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v7 = a6;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)*MEMORY[0x24BDF74F8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__EDAppDelegate_scene_didUpdateWithDiff_transitionContext_completion___block_invoke;
    v10[3] = &unk_24F24FC70;
    v11 = v7;
    objc_msgSend(v9, "_scheduleSceneEventResponseForScene:withResponseBlock:", a3, v10);

  }
}

void __70__EDAppDelegate_scene_didUpdateWithDiff_transitionContext_completion___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BE38510]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)hideSystemPointer:(BOOL)a3
{
  BSInvalidatable *hidePointerAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;

  hidePointerAssertion = self->_hidePointerAssertion;
  if (!a3)
  {
    -[BSInvalidatable invalidate](hidePointerAssertion, "invalidate");
    v5 = 0;
LABEL_6:
    v6 = self->_hidePointerAssertion;
    self->_hidePointerAssertion = v5;

    return;
  }
  if (!hidePointerAssertion)
  {
    -[PSPointerClientController persistentlyHidePointerAssertionForReason:](self->_pointerClientController, "persistentlyHidePointerAssertionForReason:", 5);
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
}

- (CGPoint)_startingPointForWindow:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a3, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  v9 = MidX;
  result.y = MidY;
  result.x = v9;
  return result;
}

- (void)beginShowingEyeDropper:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (!v4)
    v4 = (id)EDEmbeddedDisplayIdentifier;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__EDAppDelegate_beginShowingEyeDropper___block_invoke;
  v6[3] = &unk_24F24FCB8;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__EDAppDelegate_beginShowingEyeDropper___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  double v4;
  double v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "performOnAllWindows:", &__block_literal_global_68);
    objc_msgSend(WeakRetained[11], "objectForKey:", *(_QWORD *)(a1 + 40));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lensView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPosition");
    if (v5 == *MEMORY[0x24BDBEFB0] && v4 == *(double *)(MEMORY[0x24BDBEFB0] + 8))
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_startingPointForWindow:", v8);
      objc_msgSend(v3, "setLastPosition:");

    }
    v33 = a1;
    *((_BYTE *)WeakRetained + 56) = 0;
    *((_BYTE *)WeakRetained + 57) = 0;
    objc_msgSend(v3, "setFloatingMode:", 0, v3);
    if (!WeakRetained[6])
    {
      v9 = objc_alloc(MEMORY[0x24BE0B6F8]);
      objc_msgSend(WeakRetained, "mainScreenWindow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_contextId");
      v12 = (void *)objc_opt_new();
      v13 = objc_msgSend(v9, "initWithContextID:displayUUID:identifier:policy:", v11, 0, 2, v12);
      v14 = WeakRetained[6];
      WeakRetained[6] = (id)v13;

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(WeakRetained[11], "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
      v18 = 0x255A53000uLL;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v21 = *(int *)(v18 + 3496);
          objc_msgSend(*(id *)((char *)WeakRetained + v21), "objectForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            objc_msgSend(WeakRetained[11], "objectForKey:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v23;
            objc_msgSend(MEMORY[0x24BE0B6C0], "sharedInstance");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "isEqualToString:", EDEmbeddedDisplayIdentifier))
              v25 = 0;
            else
              v25 = v20;
            objc_msgSend(v23, "window");
            v26 = v16;
            v27 = v17;
            v28 = WeakRetained;
            v29 = v18;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "requestGlobalMouseEventsForDisplay:targetContextID:", v25, objc_msgSend(v30, "_contextId"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v18 = v29;
            WeakRetained = v28;
            v17 = v27;
            v16 = v26;

            objc_msgSend(*(id *)((char *)WeakRetained + v21), "setObject:forKey:", v22, v20);
          }

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v16);
    }

    objc_msgSend(*(id *)(v33 + 32), "hideSystemPointer:", 1);
  }

}

uint64_t __40__EDAppDelegate_beginShowingEyeDropper___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "makeKeyAndVisible");
}

- (void)cancelShowingEyeDropper
{
  _QWORD v3[4];
  id v4;
  id location;

  -[EDAppDelegate hideSystemPointer:](self, "hideSystemPointer:", 0);
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__EDAppDelegate_cancelShowingEyeDropper__block_invoke;
  v3[3] = &unk_24F24FC20;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__EDAppDelegate_cancelShowingEyeDropper__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissEyedropper");
    *((_BYTE *)v2 + 56) = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*((id *)v2 + 11), "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "resetTouchesBeganTime");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)_updateLastDisplayLocation:(CGPoint)a3 forLensView:(id)a4
{
  double y;
  double x;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lastDisplayLocationByDisplayIdentifier;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v15 = v7;
  if (!self->_lastDisplayLocationByDisplayIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    lastDisplayLocationByDisplayIdentifier = self->_lastDisplayLocationByDisplayIdentifier;
    self->_lastDisplayLocationByDisplayIdentifier = v8;

    v7 = v15;
  }
  objc_msgSend(v7, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  EDDisplayIdentifierForWindowScene(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = self->_lastDisplayLocationByDisplayIdentifier;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, v12);

  }
}

- (CGPoint)_lastDisplayLocationForLensView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  objc_msgSend(a3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  EDDisplayIdentifierForWindowScene(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_lastDisplayLocationByDisplayIdentifier, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGPointValue");
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v9 = *MEMORY[0x24BDBEFB0];
    v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)floatEyeDropper
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__EDAppDelegate_floatEyeDropper__block_invoke;
  block[3] = &unk_24F24FCE0;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __32__EDAppDelegate_floatEyeDropper__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 57))
    {
      objc_msgSend(WeakRetained, "activeLensView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isActive");

      if ((v5 & 1) == 0)
      {
        objc_msgSend(v3, "hideSystemPointer:", 0);
        *((_BYTE *)v3 + 56) = 1;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v3[11], "allValues", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v37 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v11, "lensView");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setFloatingMode:", 1);

              objc_msgSend(v11, "window");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "layer");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setHitTestsAsOpaque:", 1);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          }
          while (v8);
        }

        objc_msgSend(v3, "activeLensView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "screen");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        v19 = v18;
        v21 = v20;

        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        if (v22 - *((double *)v3 + 8) >= 10.0)
        {
          v25 = v19 * 0.5;
          v27 = v21 * 0.5;
        }
        else
        {
          objc_msgSend(v3, "activeLensView");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_lastDisplayLocationForLensView:", v23);
          v25 = v24;
          v27 = v26;

        }
        if (v25 == *MEMORY[0x24BDBEFB0] && v27 == *(double *)(MEMORY[0x24BDBEFB0] + 8))
        {
          v28 = *(void **)(a1 + 32);
          objc_msgSend(v3, "activeLensView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "window");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_startingPointForWindow:", v30);
          v25 = v31;
          v27 = v32;

        }
        objc_msgSend(v3, "activeLensView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "updateCenterOffsetAtTouchDown:", v25, v27);

        objc_msgSend(v3, "activeLensView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "presentAtLocation:", v25, v27);

        objc_msgSend(v3, "activeLensView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setActive:", 1);

      }
    }
  }

}

- (void)lensView:(id)a3 didSelectColor:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  self->_selectedColor = 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__EDAppDelegate_lensView_didSelectColor___block_invoke;
  v9[3] = &unk_24F24FD08;
  v10 = v6;
  v7 = v6;
  v8 = a3;
  -[EDAppDelegate _enumerateRemoteClientsUsingBlock:](self, "_enumerateRemoteClientsUsingBlock:", v9);
  objc_msgSend(v8, "lastPosition");
  -[EDAppDelegate _updateLastDisplayLocation:forLensView:](self, "_updateLastDisplayLocation:forLensView:", v8);

}

uint64_t __41__EDAppDelegate_lensView_didSelectColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eyedropperDidSelectColor:", *(_QWORD *)(a1 + 32));
}

- (void)lensViewDidActivate:(id)a3
{
  id v5;
  id *p_activeLensView;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  id v15;

  v5 = a3;
  p_activeLensView = (id *)&self->_activeLensView;
  v7 = *p_activeLensView;
  if (*p_activeLensView != v5)
  {
    v15 = v5;
    v8 = *MEMORY[0x24BDBEFB0];
    v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v10 = v9;
    v11 = *MEMORY[0x24BDBEFB0];
    if (v7)
    {
      objc_msgSend(v7, "centerOffsetAtTouchDown");
      v11 = v12;
      v10 = v13;
      objc_msgSend(*p_activeLensView, "setActive:", 0);
    }
    objc_storeStrong(p_activeLensView, a3);
    v14 = v11 == v8 && v10 == v9;
    v5 = v15;
    if (!v14)
    {
      objc_msgSend(*p_activeLensView, "setCenterOffsetAtTouchDown:", v11, v10);
      v5 = v15;
    }
  }

}

- (void)dismissEyedropper
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  BKSTouchStream *touchStream;
  BKSTouchStream *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!self->_selectedColor)
    -[EDAppDelegate _enumerateRemoteClientsUsingBlock:](self, "_enumerateRemoteClientsUsingBlock:", &__block_literal_global_75);
  -[EDAppDelegate activeLensView](self, "activeLensView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_lastDismissedTime = v4;
  if (self->_isFloating)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSMutableDictionary allValues](self->_sceneDelegateByDisplayIdentifier, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "window");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setHitTestsAsOpaque:", 0);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v7);
    }

  }
  -[EDAppDelegate hideSystemPointer:](self, "hideSystemPointer:", 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_liveConnections;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "invalidate");
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v14);
  }

  touchStream = self->_touchStream;
  if (touchStream)
  {
    -[BKSTouchStream invalidate](touchStream, "invalidate");
    v18 = self->_touchStream;
    self->_touchStream = 0;

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allKeys](self->_sceneDelegateByDisplayIdentifier, "allKeys", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * k);
        -[NSMutableDictionary objectForKey:](self->_mousePointerServiceAssertionByDisplayIdentifier, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
        {
          objc_msgSend(v25, "invalidate");
          -[NSMutableDictionary removeObjectForKey:](self->_mousePointerServiceAssertionByDisplayIdentifier, "removeObjectForKey:", v24);
        }

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v21);
  }

}

uint64_t __34__EDAppDelegate_dismissEyedropper__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eyedropperDidSelectColor:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLensView, 0);
  objc_storeStrong((id *)&self->_lastDisplayLocationByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_mousePointerServiceAssertionByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneDelegateByDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_hidePointerAssertion, 0);
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_liveConnections, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
}

@end
