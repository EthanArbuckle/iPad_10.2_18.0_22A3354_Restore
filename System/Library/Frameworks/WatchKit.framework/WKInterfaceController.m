@implementation WKInterfaceController

+ (double)screenScale
{
  void *v2;
  double v3;
  double v4;

  +[WKInterfaceDevice currentDevice](WKInterfaceDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenScale");
  v4 = v3;

  return v4;
}

+ (CGRect)screenBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  +[WKInterfaceDevice currentDevice](WKInterfaceDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screenBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (WKInterfaceController)init
{
  WKInterfaceController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKInterfaceController;
  v2 = -[WKInterfaceController init](&v8, sel_init);
  -[WKInterfaceController setViewControllerID:](v2, "setViewControllerID:", __viewControllerID);
  -[WKInterfaceController setContentFrame:](v2, "setContentFrame:", __contentFrame, *(double *)&qword_254DED118, unk_254DED120);
  -[WKInterfaceController setProperties:](v2, "setProperties:", __properties);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceController setGestureRecognizers:](v2, "setGestureRecognizers:", v3);

  if (init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceController setUninstalledGestureIDs:](v2, "setUninstalledGestureIDs:", v4);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceController setPendingGestureInstallationFinishedBlocks:](v2, "setPendingGestureInstallationFinishedBlocks:", v5);

  +[SPRemoteInterface controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:](SPRemoteInterface, "controller:setupProperties:viewControllerID:tableIndex:rowIndex:classForType:", v2, __properties, __viewControllerID, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, _WKInterfaceObjectClassWithType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceController setTopLevelObjects:](v2, "setTopLevelObjects:", v6);

  (*(void (**)(uint64_t, WKInterfaceController *))(__remoteSetup + 16))(__remoteSetup, v2);
  return v2;
}

void __29__WKInterfaceController_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.watchKit.WKInterfaceControllerGestureRecognizers", MEMORY[0x24BDAC9C0]);
  v1 = (void *)__gestureRecognizersQueue;
  __gestureRecognizersQueue = (uint64_t)v0;

}

- (void)didRegisterWithRemoteInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[WKInterfaceController topLevelObjects](self, "topLevelObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "didRegisterWithRemoteInterface");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_handleActionWithIdentifier:(id)a3 forNotification:(id)a4 remoteNotification:(id)a5 localNotification:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  WKInterfaceController *v19;
  id v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  WKInterfaceController *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_class();
  if (spUtils_subclassForObjectOverridesSelectorFromSuperclass(self, (uint64_t)sel_handleActionWithIdentifier_forNotification_, v14))
  {
    wk_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136446978;
      v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
      v24 = 1024;
      v25 = 276;
      v26 = 2114;
      v27 = self;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_215918000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
    }

    -[WKInterfaceController handleActionWithIdentifier:forNotification:](self, "handleActionWithIdentifier:forNotification:", v10, v11);
  }
  else if (v13)
  {
    wk_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136446978;
      v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
      v24 = 1024;
      v25 = 283;
      v26 = 2114;
      v27 = self;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_215918000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forLocalNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
    }

    -[WKInterfaceController handleActionWithIdentifier:forLocalNotification:](self, "handleActionWithIdentifier:forLocalNotification:", v10, v13);
  }
  else
  {
    wk_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v18)
      {
        v22 = 136446978;
        v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
        v24 = 1024;
        v25 = 286;
        v26 = 2114;
        v27 = self;
        v28 = 2114;
        v29 = v10;
        _os_log_impl(&dword_215918000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forRemoteNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
      }

      v19 = self;
      v20 = v10;
      v21 = v12;
    }
    else
    {
      if (v18)
      {
        v22 = 136446978;
        v23 = "-[WKInterfaceController _handleActionWithIdentifier:forNotification:remoteNotification:localNotification:]";
        v24 = 1024;
        v25 = 289;
        v26 = 2114;
        v27 = self;
        v28 = 2114;
        v29 = v10;
        _os_log_impl(&dword_215918000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling handleActionWithIdentifier:forRemoteNotification: on %{public}@ with identifier %{public}@", (uint8_t *)&v22, 0x26u);
      }

      v21 = (id)MEMORY[0x24BDBD1B8];
      v19 = self;
      v20 = v10;
    }
    -[WKInterfaceController handleActionWithIdentifier:forRemoteNotification:](v19, "handleActionWithIdentifier:forRemoteNotification:", v20, v21);
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__WKInterfaceController_setTitle___block_invoke;
  v8[3] = &unk_24D3BB3D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v8);
  if (isRunningOnMainQueue())
  {
    v6[2](v6);
  }
  else
  {
    wk_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController setTitle:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v6);
  }

}

void __34__WKInterfaceController_setTitle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v3, CFSTR("#title"), &stru_24D3BD200, v2);

}

- (void)pushControllerWithName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__WKInterfaceController_pushControllerWithName_context___block_invoke;
  v12[3] = &unk_24D3BB358;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController pushControllerWithName:context:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __56__WKInterfaceController_pushControllerWithName_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  +[SPRemoteInterface controller:pushInterfaceController:context:](SPRemoteInterface, "controller:pushInterfaceController:context:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (void)popController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __38__WKInterfaceController_popController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerPop:](SPRemoteInterface, "controllerPop:", *(_QWORD *)(a1 + 32));
}

- (void)popToRootController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __44__WKInterfaceController_popToRootController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerPopToRoot:](SPRemoteInterface, "controllerPopToRoot:", *(_QWORD *)(a1 + 32));
}

+ (void)reloadRootControllersWithNames:(id)a3 contexts:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke;
  v11[3] = &unk_24D3BB3D0;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v11);
  if (isRunningOnMainQueue())
  {
    v9[2](v9);
  }
  else
  {
    wk_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[WKInterfaceController reloadRootControllersWithNames:contexts:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v9);
  }

}

void __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    +[SPRemoteInterface reloadRootControllersWithNames:contexts:](SPRemoteInterface, "reloadRootControllersWithNames:contexts:", v4, v2);

  }
  else
  {
    wk_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke_cold_1();

  }
}

+ (void)_insertPageControllersAtIndexes:(id)a3 withNames:(id)a4 contexts:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_msgSend(v11, "copy");
    v10 = (void *)objc_msgSend(v7, "copy");
    +[SPRemoteInterface insertPageControllerAtIndexes:withNames:contexts:](SPRemoteInterface, "insertPageControllerAtIndexes:withNames:contexts:", v9, v10, v8);

  }
}

+ (void)_movePageControllerAtIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  +[SPRemoteInterface movePageControllerAtIndex:toIndex:](SPRemoteInterface, "movePageControllerAtIndex:toIndex:", a3, a4);
}

+ (void)_removePageControllersAtIndexes:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "copy");
  +[SPRemoteInterface removePageControllerAtIndexes:](SPRemoteInterface, "removePageControllerAtIndexes:", v3);

}

- (void)becomeCurrentPage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __42__WKInterfaceController_becomeCurrentPage__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerBecomeCurrentPage:](SPRemoteInterface, "controllerBecomeCurrentPage:", *(_QWORD *)(a1 + 32));
}

- (void)presentControllerWithName:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__WKInterfaceController_presentControllerWithName_context___block_invoke;
  v12[3] = &unk_24D3BB358;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController presentControllerWithName:context:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __59__WKInterfaceController_presentControllerWithName_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  +[SPRemoteInterface controller:presentInterfaceController:context:](SPRemoteInterface, "controller:presentInterfaceController:context:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (void)presentControllerWithNames:(id)a3 contexts:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__WKInterfaceController_presentControllerWithNames_contexts___block_invoke;
  v12[3] = &unk_24D3BB358;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController presentControllerWithNames:contexts:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __61__WKInterfaceController_presentControllerWithNames_contexts___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  +[SPRemoteInterface controller:presentInterfaceControllers:contexts:](SPRemoteInterface, "controller:presentInterfaceControllers:contexts:", v2, v4, v3);

}

- (void)dismissController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __42__WKInterfaceController_dismissController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerDismiss:](SPRemoteInterface, "controllerDismiss:", *(_QWORD *)(a1 + 32));
}

- (void)presentTextInputControllerWithSuggestions:(id)a3 allowedInputMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke;
  v14[3] = &unk_24D3BC518;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a4;
  v10 = v8;
  v11 = v9;
  v12 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController presentTextInputControllerWithSuggestions:allowedInputMode:completion:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }

}

void __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPRemoteInterface controller:presentTextInputControllerWithSuggestions:allowedInputMode:completion:](SPRemoteInterface, "controller:presentTextInputControllerWithSuggestions:allowedInputMode:completion:", v2, v5, v3, *(_QWORD *)(a1 + 48));

  }
  else
  {
    wk_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke_cold_1();

  }
}

- (void)presentTextInputControllerWithSuggestionsForLanguage:(id)a3 allowedInputMode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke;
  v14[3] = &unk_24D3BC540;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = a4;
  v10 = v8;
  v11 = v9;
  v12 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }

}

void __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id v5;

  if (a1[5])
  {
    v2 = a1[4];
    v3 = a1[6];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[7]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[SPRemoteInterface controller:presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion:](SPRemoteInterface, "controller:presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion:", v2, v3, v5, a1[5]);

  }
  else
  {
    wk_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke_cold_1();

  }
}

- (void)dismissTextInputController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __51__WKInterfaceController_dismissTextInputController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerDismissTextInputController:](SPRemoteInterface, "controllerDismissTextInputController:", *(_QWORD *)(a1 + 32));
}

- (void)presentAddPassesControllerWithPasses:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__WKInterfaceController_presentAddPassesControllerWithPasses_completion___block_invoke;
  v12[3] = &unk_24D3BC3D0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController presentAddPassesControllerWithPasses:completion:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

uint64_t __73__WKInterfaceController_presentAddPassesControllerWithPasses_completion___block_invoke(_QWORD *a1)
{
  return +[SPRemoteInterface controller:presentAddPassesControllerWithPasses:completion:](SPRemoteInterface, "controller:presentAddPassesControllerWithPasses:completion:", a1[4], a1[5], a1[6]);
}

- (void)dismissAddPassesController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __51__WKInterfaceController_dismissAddPassesController__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface controllerDismissAddPassesController:](SPRemoteInterface, "controllerDismissAddPassesController:", *(_QWORD *)(a1 + 32));
}

- (id)contextForSegueWithIdentifier:(id)a3
{
  return 0;
}

- (id)contextForSegueWithIdentifier:(id)a3 inTable:(id)a4 rowIndex:(int64_t)a5
{
  return 0;
}

- (id)contextsForSegueWithIdentifier:(id)a3
{
  return 0;
}

- (id)contextsForSegueWithIdentifier:(id)a3 inTable:(id)a4 rowIndex:(int64_t)a5
{
  return 0;
}

- (void)animateWithDuration:(double)a3 animations:(id)a4
{
  id v6;
  void *v7;
  _QWORD block[5];
  id v9;
  double v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__WKInterfaceController_animateWithDuration_animations___block_invoke;
    block[3] = &unk_24D3BC568;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __56__WKInterfaceController_animateWithDuration_animations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v2, CFSTR("#animateBegin"), &stru_24D3BD200, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "viewControllerID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v4, CFSTR("#animateCommit"), &stru_24D3BD200, 0);

}

- (void)addMenuItemWithImage:(id)a3 title:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WKInterfaceController *v17;
  SEL v18;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke;
  v14[3] = &unk_24D3BC590;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a5;
  v10 = v9;
  v11 = v8;
  v12 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController addMenuItemWithImage:title:action:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }

}

void __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!*(_QWORD *)(a1 + 32) || (*(_QWORD *)(a1 + 40) ? (v4 = v2 == 0) : (v4 = 1), v4))
  {
    wk_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "viewControllerID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy", *(_QWORD *)(a1 + 32));
    v8[1] = v6;
    v8[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v5, CFSTR("#item"), &stru_24D3BD200, v7);

  }
}

- (void)addMenuItemWithImageNamed:(id)a3 title:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WKInterfaceController *v17;
  SEL v18;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke;
  v14[3] = &unk_24D3BC590;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = a5;
  v10 = v9;
  v11 = v8;
  v12 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v14);
  if (isRunningOnMainQueue())
  {
    v12[2](v12);
  }
  else
  {
    wk_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController addMenuItemWithImageNamed:title:action:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }

}

void __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!*(_QWORD *)(a1 + 32) || (*(_QWORD *)(a1 + 40) ? (v4 = v2 == 0) : (v4 = 1), v4))
  {
    wk_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "viewControllerID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy", v6);
    v9[1] = v7;
    v9[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v5, CFSTR("#item"), &stru_24D3BD200, v8);

  }
}

- (void)addMenuItemWithItemIcon:(int64_t)a3 title:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  WKInterfaceController *v14;
  SEL v15;
  int64_t v16;

  v8 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke;
  v12[3] = &unk_24D3BB468;
  v13 = v8;
  v14 = self;
  v15 = a5;
  v16 = a3;
  v9 = v8;
  v10 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController addMenuItemWithItemIcon:title:action:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (*(_QWORD *)(a1 + 32))
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4)
  {
    wk_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "viewControllerID");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy", v6);
    v9[1] = v7;
    v9[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v5, CFSTR("#item"), &stru_24D3BD200, v8);

  }
}

- (void)clearAllMenuItems
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __42__WKInterfaceController_clearAllMenuItems__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewControllerID");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v1, CFSTR("#item"), &stru_24D3BD200, 0);

}

- (void)updateUserActivity:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke;
  v12[3] = &unk_24D3BB358;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v12);
  if (isRunningOnMainQueue())
  {
    v10[2](v10);
  }
  else
  {
    wk_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController updateUserActivity:userInfo:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  wk_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke_cold_1();

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v3, "updateUserActivity:userInfo:webpageURL:", v4, v5, 0);

}

- (void)updateUserActivity:(id)a3 userInfo:(id)a4 webpageURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  WKInterfaceController *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke;
  v16[3] = &unk_24D3BB3A8;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = self;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = (void (**)(_QWORD))MEMORY[0x2199E8B48](v16);
  if (isRunningOnMainQueue())
  {
    v14[2](v14);
  }
  else
  {
    wk_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[WKInterfaceController updateUserActivity:userInfo:webpageURL:].cold.1();

    dispatch_async(MEMORY[0x24BDAC9B8], v14);
  }

}

void __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "length") && (*(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48)))
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    +[SPRemoteInterface updateUserActivity:userInfo:webpageURL:interfaceController:](SPRemoteInterface, "updateUserActivity:userInfo:webpageURL:interfaceController:", v7, v2, v3, *(_QWORD *)(a1 + 56));

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    wk_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
        __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_2();
    }
    else if (v6)
    {
      __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_1();
    }

  }
}

- (void)invalidateUserActivity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __47__WKInterfaceController_invalidateUserActivity__block_invoke(uint64_t a1)
{
  return +[SPRemoteInterface updateUserActivity:userInfo:webpageURL:interfaceController:](SPRemoteInterface, "updateUserActivity:userInfo:webpageURL:interfaceController:", 0, 0, 0, *(_QWORD *)(a1 + 32));
}

+ (BOOL)openParentApplication:(id)a3 reply:(id)a4
{
  return 0;
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (WKCrownSequencer)crownSequencer
{
  return self->_crownSequencer;
}

- (NSArray)topLevelObjects
{
  return self->_topLevelObjects;
}

- (void)setTopLevelObjects:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelObjects, a3);
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)viewControllerID
{
  return self->_viewControllerID;
}

- (void)setViewControllerID:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerID, a3);
}

- (NSMutableDictionary)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void)setGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizers, a3);
}

- (NSMutableArray)uninstalledGestureIDs
{
  return self->_uninstalledGestureIDs;
}

- (void)setUninstalledGestureIDs:(id)a3
{
  objc_storeStrong((id *)&self->_uninstalledGestureIDs, a3);
}

- (NSMutableArray)pendingGestureInstallationFinishedBlocks
{
  return self->_pendingGestureInstallationFinishedBlocks;
}

- (void)setPendingGestureInstallationFinishedBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingGestureInstallationFinishedBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingGestureInstallationFinishedBlocks, 0);
  objc_storeStrong((id *)&self->_uninstalledGestureIDs, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_viewControllerID, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_topLevelObjects, 0);
  objc_storeStrong((id *)&self->_crownSequencer, 0);
}

- (void)setTitle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)pushControllerWithName:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)reloadRootControllersWithNames:contexts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __65__WKInterfaceController_reloadRootControllersWithNames_contexts___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - reloadRootControllersWithNames:contexts: requires names to be non-nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)presentControllerWithName:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)presentControllerWithNames:contexts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)presentTextInputControllerWithSuggestions:allowedInputMode:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __95__WKInterfaceController_presentTextInputControllerWithSuggestions_allowedInputMode_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - presentTextInputControllerWithSuggestions:allowedInputMode:completion: requires a non-NULL completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __106__WKInterfaceController_presentTextInputControllerWithSuggestionsForLanguage_allowedInputMode_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - presentTextInputControllerWithSuggestionsForLanguage:allowedInputMode:completion: requires a non-NULL completion block", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)presentAddPassesControllerWithPasses:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)addMenuItemWithImage:title:action:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __59__WKInterfaceController_addMenuItemWithImage_title_action___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - addMenuItemWithImage:title:action requires a non-nil image and title and valid action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)addMenuItemWithImageNamed:title:action:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __64__WKInterfaceController_addMenuItemWithImageNamed_title_action___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - addMenuItemWithImageNamed:title:action requires a non-nil image name and title and valid action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)addMenuItemWithItemIcon:title:action:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __62__WKInterfaceController_addMenuItemWithItemIcon_title_action___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - addMenuItemWithItemIcon:title:action requires a non-nil title and valid action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)updateUserActivity:userInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __53__WKInterfaceController_updateUserActivity_userInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: -[WKInterfaceController updateUserActivity:userInfo:] has been deprecated. Please use the new -[WKInterfaceController updateUserActivity:userInfo:webpageURL:] instead. This call will go away soon and calling it will crash.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)updateUserActivity:userInfo:webpageURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_215918000, v0, v1, "%{public}s:%d: %{public}s: called from queue other than main. This is not supported and may fail in the future.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - updateUserActivity requires a non-empty type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __64__WKInterfaceController_updateUserActivity_userInfo_webpageURL___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_215918000, v0, v1, "%{public}s:%d: Error - updateUserActivity requires either userInfo or webpageURL to be non-nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
