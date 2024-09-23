@implementation BNBannerSceneComponentProvider

+ (void)registerDelegate:(id)a3 forSceneForPresentableWithUniqueIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v11 && v7)
  {
    if (registerDelegate_forSceneForPresentableWithUniqueIdentifier__onceToken != -1)
      dispatch_once(&registerDelegate_forSceneForPresentableWithUniqueIdentifier__onceToken, &__block_literal_global_267);
    v8 = (id)__presentableUniqueIDsToDelegates;
    objc_sync_enter(v8);
    objc_msgSend((id)__presentableUniqueIDsToDelegates, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BNBannerSource.m"), 723, CFSTR("Delegate already registered for scene with unique ID '%@'"), v7);

    }
    objc_msgSend((id)__presentableUniqueIDsToDelegates, "setObject:forKey:", v11, v7);
    objc_sync_exit(v8);

  }
}

void __94__BNBannerSceneComponentProvider_registerDelegate_forSceneForPresentableWithUniqueIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__presentableUniqueIDsToDelegates;
  __presentableUniqueIDsToDelegates = v0;

}

+ (void)unregisterDelegateForSceneForPresentableWithUniqueIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    v4 = (id)__presentableUniqueIDsToDelegates;
    objc_sync_enter(v4);
    objc_msgSend((id)__presentableUniqueIDsToDelegates, "removeObjectForKey:", v5);
    objc_sync_exit(v4);

    v3 = v5;
  }

}

+ (id)delegateAssociatedWithSceneForPresentableWithUniqueIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = (id)__presentableUniqueIDsToDelegates;
    objc_sync_enter(v4);
    objc_msgSend((id)__presentableUniqueIDsToDelegates, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_newSceneWindowWithRootViewController:(id)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  __objc2_class **v11;
  uint64_t v12;
  void *v13;
  void *v15;
  id v16;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v7 = objc_opt_class();
  v8 = WeakRetained;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSource.m"), 751, CFSTR("Scene is not a window scene: %@"), v16);

  }
  v11 = off_1E7043DB0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v5, "isAccessibilityIgnoringSmartInvertColors");
    if ((_DWORD)v12)
      v11 = off_1E7043DA8;
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_msgSend(objc_alloc(*v11), "initWithWindowScene:", v10);
  objc_msgSend(v13, "setAccessibilityIgnoresInvertColors:", v12);
  objc_msgSend(v13, "setRootViewController:", v5);
  objc_msgSend(v13, "setHidden:", 0);

  return v13;
}

- (BNBannerSceneComponentProvider)initWithScene:(id)a3
{
  id v4;
  BNBannerSceneComponentProvider *v5;
  BNBannerSceneComponentProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BNBannerSceneComponentProvider;
  v5 = -[BNBannerSceneComponentProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BNBannerSceneComponentProvider _setScene:](v5, "_setScene:", v4);

  return v6;
}

- (void)_setScene:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  BNBannerClientContainerViewController *v11;
  BNBannerClientContainerViewController *containerViewController;
  UIWindow *v13;
  UIWindow *sceneWindow;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained != v4)
  {
    if (!v4)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "sceneWillInvalidateForBannerSceneComponentProvider:", self);

    }
    objc_msgSend(v4, "bn_presentableUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "delegateAssociatedWithSceneForPresentableWithUniqueIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v4 || v8)
    {
      v10 = objc_storeWeak((id *)&self->_scene, v4);

      if (v4 && v9)
      {
        -[BNBannerSceneComponentProvider setDelegate:](self, "setDelegate:", v9);
        objc_msgSend((id)objc_opt_class(), "unregisterDelegateForSceneForPresentableWithUniqueIdentifier:", v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "containerViewControllerForBannerSceneComponentProvider:", self);
          v11 = (BNBannerClientContainerViewController *)objc_claimAutoreleasedReturnValue();
          containerViewController = self->_containerViewController;
          self->_containerViewController = v11;

          v13 = -[BNBannerSceneComponentProvider _newSceneWindowWithRootViewController:](self, "_newSceneWindowWithRootViewController:", self->_containerViewController);
          sceneWindow = self->_sceneWindow;
          self->_sceneWindow = v13;

        }
        else if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
        {
          -[BNBannerSceneComponentProvider _setScene:].cold.1();
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
    {
      -[BNBannerSceneComponentProvider _setScene:].cold.2();
    }

  }
}

- (void)_sceneWillInvalidate:(id)a3
{
  -[BNBannerSceneComponentProvider _setScene:](self, "_setScene:", 0);
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_containerViewController)
  {
    v9[0] = self->_containerViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      -[BNBannerSceneComponentProvider _settingsDiffActionsForScene:].cold.1();
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  return v7;
}

- (id)_actionRespondersForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_containerViewController)
  {
    v9[0] = self->_containerViewController;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      -[BNBannerSceneComponentProvider _actionRespondersForScene:].cold.1();
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  return v7;
}

- (UIWindow)sceneWindow
{
  return self->_sceneWindow;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (BNBannerSceneComponentProviderDelegate)delegate
{
  return (BNBannerSceneComponentProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BNBannerClientContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_sceneWindow, 0);
}

- (void)_setScene:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v0, (uint64_t)v0, "Delegate '%{public}@' is unable to provide a container view controller for scene: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_setScene:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B9628000, v0, v1, "No delegate registered for scene: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_settingsDiffActionsForScene:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v0, v1, "%{public}s: No container view controller for scene: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

- (void)_actionRespondersForScene:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B9628000, v0, v1, "%{public}s: No container view controller for scene: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

@end
