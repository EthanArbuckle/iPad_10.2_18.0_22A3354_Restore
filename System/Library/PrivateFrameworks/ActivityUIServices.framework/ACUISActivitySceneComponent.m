@implementation ACUISActivitySceneComponent

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

+ (void)load
{
  BSDispatchMain();
}

- (ACUISActivitySceneComponent)initWithScene:(id)a3
{
  id v4;
  ACUISActivitySceneComponent *v5;
  ACUISActivitySceneComponent *v6;
  uint64_t v7;
  NSMapTable *dependencyRecognizersPerWindow;
  uint64_t v9;
  NSMapTable *recognizersPerWindow;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivitySceneComponent;
  v5 = -[ACUISActivitySceneComponent init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    dependencyRecognizersPerWindow = v6->_dependencyRecognizersPerWindow;
    v6->_dependencyRecognizersPerWindow = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    recognizersPerWindow = v6->_recognizersPerWindow;
    v6->_recognizersPerWindow = (NSMapTable *)v9;

    if (-[ACUISActivitySceneComponent isActivityScene:](v6, "isActivityScene:", v4))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel__windowDidBecomeVisible_, *MEMORY[0x24BEBE9E0], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__windowBecameHidden_, *MEMORY[0x24BEBE9D0], 0);

    }
  }

  return v6;
}

- (BOOL)isActivityScene:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ActivitySceneSessionRoleListItem")) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ActivitySceneSessionRoleAmbient"));

  return v5;
}

void __35__ACUISActivitySceneComponent_load__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == objc_opt_class())
  {
    v3 = (void *)MEMORY[0x24BEBD8D8];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_registerSceneComponentClass:withKey:predicate:", v4, CFSTR("ACUISActivitySceneComponentKey"), v5);

  }
}

- (void)dealloc
{
  BSAbsoluteMachTimer *delayedGestureActionTimer;
  objc_super v4;

  -[NSMapTable removeAllObjects](self->_dependencyRecognizersPerWindow, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_recognizersPerWindow, "removeAllObjects");
  -[BSAbsoluteMachTimer invalidate](self->_delayedGestureActionTimer, "invalidate");
  delayedGestureActionTimer = self->_delayedGestureActionTimer;
  self->_delayedGestureActionTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)ACUISActivitySceneComponent;
  -[ACUISActivitySceneComponent dealloc](&v4, sel_dealloc);
}

- (void)_windowDidBecomeVisible:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  ACUISDependencyGestureRecognizer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ACUISGestureRecognizer *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];

  v4 = a3;
  _sceneComponentLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D80B000, v5, OS_LOG_TYPE_DEFAULT, "windowBecameVisible", buf, 2u);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSMapTable objectForKey:](self->_dependencyRecognizersPerWindow, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v8 = -[ACUISDependencyGestureRecognizer initWithTarget:action:]([ACUISDependencyGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleGestureDependencyChange_);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", NSClassFromString(CFSTR("MRUSlider")), 0);
        -[ACUISDependencyGestureRecognizer setObservedControlClasses:](v8, "setObservedControlClasses:", v9);

        objc_msgSend(v6, "rootViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addGestureRecognizer:", v8);

        -[NSMapTable setObject:forKey:](self->_dependencyRecognizersPerWindow, "setObject:forKey:", v8, v6);
      }
      -[NSMapTable objectForKey:](self->_recognizersPerWindow, "objectForKey:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v13 = -[ACUISGestureRecognizer initWithTarget:action:]([ACUISGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleGestureChange_);
        objc_msgSend(v6, "rootViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addGestureRecognizer:", v13);

        -[NSMapTable setObject:forKey:](self->_recognizersPerWindow, "setObject:forKey:", v13, v6);
      }

    }
  }

}

- (void)_windowBecameHidden:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  _sceneComponentLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22D80B000, v5, OS_LOG_TYPE_DEFAULT, "_windowBecameHidden", v10, 2u);
  }

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_dependencyRecognizersPerWindow, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", v7);

    -[NSMapTable removeObjectForKey:](self->_dependencyRecognizersPerWindow, "removeObjectForKey:", v6);
  }

}

- (void)_handleGestureDependencyChange:(id)a3
{
  NSObject *v4;
  void *v5;
  ACUISActivitySceneAction *v6;
  void *v7;
  uint8_t v8[16];

  if (objc_msgSend(a3, "state") == 3)
  {
    _sceneComponentLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22D80B000, v4, OS_LOG_TYPE_DEFAULT, "UIControl was tapped", v8, 2u);
    }

    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = -[ACUISActivitySceneAction initWithCommand:]([ACUISActivitySceneAction alloc], "initWithCommand:", 1);
    objc_msgSend(v5, "setWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACUISActivitySceneComponent _sendActions:](self, "_sendActions:", v7);
  }
}

- (void)_handleGestureState:(int64_t)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  void *v8;
  ACUISActivitySceneAction *v9;
  uint64_t v10;
  ACUISActivitySceneAction *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[2];
  __int16 v15;

  if (a3 == 3)
  {
    _sceneComponentLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22D80B000, v7, OS_LOG_TYPE_DEFAULT, "Gesture ended", v13, 2u);
    }

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = [ACUISActivitySceneAction alloc];
    v10 = 3;
    goto LABEL_13;
  }
  if (a3 != 2)
  {
    if (a3 != 1)
      return;
    _sceneComponentLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v15 = 0;
    v5 = "Gesture began";
    v6 = (uint8_t *)&v15;
    goto LABEL_11;
  }
  _sceneComponentLogger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v5 = "Gesture changed";
    v6 = buf;
LABEL_11:
    _os_log_impl(&dword_22D80B000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }
LABEL_12:

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = [ACUISActivitySceneAction alloc];
  v10 = 2;
LABEL_13:
  v11 = -[ACUISActivitySceneAction initWithCommand:](v9, "initWithCommand:", v10);
  objc_msgSend(v8, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACUISActivitySceneComponent _sendActions:](self, "_sendActions:", v12);
}

- (void)_handleGestureChange:(id)a3
{
  id v4;
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *delayedGestureActionTimer;
  BSAbsoluteMachTimer *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v16 = objc_msgSend(v4, "state");
  if ((v14[3] | 2) == 3)
  {
    -[ACUISActivitySceneComponent _handleGestureState:](self, "_handleGestureState:");
  }
  else if (!self->_delayedGestureActionTimer)
  {
    objc_initWeak(&location, self);
    v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BD78]), "initWithIdentifier:", CFSTR("ACUISActivitySceneComponent.delayedGestureActionTimer"));
    delayedGestureActionTimer = self->_delayedGestureActionTimer;
    self->_delayedGestureActionTimer = v5;

    v7 = self->_delayedGestureActionTimer;
    v8 = MEMORY[0x24BDAC9B8];
    v9 = MEMORY[0x24BDAC9B8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__ACUISActivitySceneComponent__handleGestureChange___block_invoke;
    v10[3] = &unk_24F9499F0;
    objc_copyWeak(&v11, &location);
    v10[4] = &v13;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", v8, v10, 1.0, 0.0);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v13, 8);

}

void __52__ACUISActivitySceneComponent__handleGestureChange___block_invoke(uint64_t a1)
{
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleGestureState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[4], "invalidate");
    v2 = WeakRetained[4];
    WeakRetained[4] = 0;

  }
}

- (void)_sendActions:(id)a3
{
  UIScene **p_scene;
  id v4;
  void *v5;
  id WeakRetained;

  p_scene = &self->_scene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(WeakRetained, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendActions:", v4);

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (NSMapTable)dependencyRecognizersPerWindow
{
  return self->_dependencyRecognizersPerWindow;
}

- (void)setDependencyRecognizersPerWindow:(id)a3
{
  objc_storeStrong((id *)&self->_dependencyRecognizersPerWindow, a3);
}

- (NSMapTable)recognizersPerWindow
{
  return self->_recognizersPerWindow;
}

- (void)setRecognizersPerWindow:(id)a3
{
  objc_storeStrong((id *)&self->_recognizersPerWindow, a3);
}

- (BSAbsoluteMachTimer)delayedGestureActionTimer
{
  return self->_delayedGestureActionTimer;
}

- (void)setDelayedGestureActionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayedGestureActionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedGestureActionTimer, 0);
  objc_storeStrong((id *)&self->_recognizersPerWindow, 0);
  objc_storeStrong((id *)&self->_dependencyRecognizersPerWindow, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
