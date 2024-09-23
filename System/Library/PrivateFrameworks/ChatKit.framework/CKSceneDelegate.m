@implementation CKSceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v6;
      v11 = 2080;
      v12 = "-[CKSceneDelegate sceneWillEnterForeground:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v6;
      v11 = 2080;
      v12 = "-[CKSceneDelegate sceneDidBecomeActive:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistentIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v14;
      v30 = 2080;
      v31 = "-[CKSceneDelegate scene:willConnectToSession:options:]";
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "%@: %s %@", buf, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Session: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "stateRestorationActivity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activityType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stateRestorationActivity");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Session state restoration activity: %@ %@", buf, 0x16u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v11;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Connection options: %@", buf, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSceneDelegate.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[scene isKindOfClass:[UIWindowScene class]]"));

  }
  v23 = objc_storeWeak((id *)&self->_scene, v9);
  -[CKSceneDelegate installDebugHandlerForScene:](self, "installDebugHandlerForScene:", v9);

  -[CKSceneDelegate window](self, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(v24, "setWindowScene:", WeakRetained);

  -[CKSceneDelegate window](self, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "makeKeyAndVisible");

}

- (UIWindow)window
{
  return self->_window;
}

- (void)installDebugHandlerForScene:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      location = 0;
      objc_initWeak(&location, self);
      v9 = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v10, &location);
      objc_msgSend(v7, "statusBarManager", v9, 3221225472, __47__CKSceneDelegate_installDebugHandlerForScene___block_invoke, &unk_1E274B548);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDebugMenuHandler:", &v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);

    }
  }

}

- (CKSceneDelegate)init
{
  CKSceneDelegate *v2;
  void *v3;
  UIWindow *v4;
  UIWindow *window;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSceneDelegate;
  v2 = -[CKSceneDelegate init](&v7, sel_init);
  if (v2)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (UIWindow *)objc_alloc_init((Class)objc_msgSend(v3, "windowClass"));
    window = v2->_window;
    v2->_window = v4;

  }
  return v2;
}

+ (id)stateFromUserInfoDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CKCanvasStateRestorationContainerState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Didn't find scene state data in userInfo dictionary: %@", buf, 0xCu);
      }

    }
    goto LABEL_12;
  }
  v5 = (void *)MEMORY[0x1E0CB3710];
  +[CKSceneDelegateState unarchivingClasses](CKSceneDelegateState, "unarchivingClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Failed unarchiving scene state data: %@", buf, 0xCu);
      }

    }
LABEL_12:
    v7 = 0;
  }

  return v7;
}

+ (Class)containerClassForType:(int64_t)a3
{
  void *v6;

  if (a3 && a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKSceneDelegate.m"), 68, CFSTR("+containerClassForType: should not be called for scene delegate type: %zd"), a3);

  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)type
{
  return -1;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  CKMacToolbarController *toolbarController;
  CKMacToolbarController *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persistentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v7;
      v15 = 2080;
      v16 = "-[CKSceneDelegate sceneDidDisconnect:]";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v13, 0x20u);

    }
  }
  toolbarController = self->_toolbarController;
  if (toolbarController)
  {
    -[CKMacToolbarController removeItemProviders](toolbarController, "removeItemProviders");
    v11 = self->_toolbarController;
    self->_toolbarController = 0;

  }
  -[CKSceneDelegate window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWindowScene:", 0);

  objc_storeWeak((id *)&self->_scene, 0);
}

- (void)sceneWillResignActive:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v6;
      v11 = 2080;
      v12 = "-[CKSceneDelegate sceneWillResignActive:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v6;
      v11 = 2080;
      v12 = "-[CKSceneDelegate sceneDidEnterBackground:]";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

void __47__CKSceneDelegate_installDebugHandlerForScene___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showDebugMenu");

}

- (void)showDebugMenu
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    +[DebugInspectorContainerViewControllerFactory debugMenuViewController](_TtC7ChatKit44DebugInspectorContainerViewControllerFactory, "debugMenuViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (void)showInspectorViewForMessage:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if (v5)
  {
    +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForMessage:](_TtC7ChatKit44DebugInspectorContainerViewControllerFactory, "inspectorViewControllerForMessage:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)showInspectorViewForConversations:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalInstall");

  if (v5)
  {
    +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForConversations:](_TtC7ChatKit44DebugInspectorContainerViewControllerFactory, "inspectorViewControllerForConversations:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate window](self, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)showInspectorViewForChatItems:(id)a3 parallelIndexes:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInternalInstall");

  if (v8)
  {
    +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForChatItems:parallelIndexes:](_TtC7ChatKit44DebugInspectorContainerViewControllerFactory, "inspectorViewControllerForChatItems:parallelIndexes:", v12, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2080;
      v16 = "-[CKSceneDelegate scene:openURLContexts:]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v13, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "URL Contexts: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2080;
      v16 = "-[CKSceneDelegate _scene:openItemProviders:]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v13, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Item Providers: %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "session");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persistentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v7;
      v18 = 2080;
      v19 = "-[CKSceneDelegate stateRestorationActivityForScene:]";
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%@: %s %@", buf, 0x20u);

    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.Messages.StateRestoration"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CKSceneDelegate type](self, "type", CFSTR("CKCanvasStateRestorationContainerType")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addUserInfoEntriesFromDictionary:", v12);
  return v10;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v9;
      v16 = 2080;
      v17 = "-[CKSceneDelegate scene:continueUserActivity:]";
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "%@: %s %@", (uint8_t *)&v14, 0x20u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "activityType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = (const char *)v6;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "User activity: %@ %@", (uint8_t *)&v14, 0x16u);

    }
  }

}

+ (id)userInfoDictionaryForState:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v3;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Failed archiving scene state: %@, error: %@", buf, 0x16u);
      }

    }
    v7 = 0;
  }
  else
  {
    v14 = CFSTR("CKCanvasStateRestorationContainerState");
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)updateSceneActivationConditions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CKSceneDelegate *v11;
  NSObject *v12;
  CKSceneDelegate *v13;
  void *v14;
  int v15;
  CKSceneDelegate *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKSceneDelegate scene](self, "scene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "persistentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Updating scene activation conditions for scene: %@ %@", (uint8_t *)&v15, 0x16u);

    }
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CEA920]);
  -[CKSceneDelegate canActivatePredicate](self, "canActivatePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCanActivateForTargetContentIdentifierPredicate:", v8);

  -[CKSceneDelegate prefersToActivatePredicate](self, "prefersToActivatePredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefersToActivateForTargetContentIdentifierPredicate:", v9);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "canActivateForTargetContentIdentifierPredicate");
      v11 = (CKSceneDelegate *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "canActivateForTargetContentIdentifierPredicate: %@", (uint8_t *)&v15, 0xCu);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "prefersToActivateForTargetContentIdentifierPredicate");
      v13 = (CKSceneDelegate *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "prefersToActivateForTargetContentIdentifierPredicate: %@", (uint8_t *)&v15, 0xCu);

    }
  }
  -[CKSceneDelegate scene](self, "scene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActivationConditions:", v7);

}

- (id)canActivatePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

- (id)prefersToActivatePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
}

- (id)predicateMatchingConversation:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Creating preferred activation predicate for conversation: %@", buf, 0xCu);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sms:%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self beginswith[cd] %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("groupid=%@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self beginswith[c] 'sms://' AND (self contains[cd] %@ OR self contains[cd] %@)"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  objc_msgSend(v3, "recipient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "recipient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultIMHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recipient=%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("recipient=%@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self beginswith[c] 'sms://' AND (self contains[cd] %@ OR self contains[cd] %@)"), v17, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v22);

  }
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)updateSceneTitleForConversation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasDisplayName"))
    objc_msgSend(v4, "displayName");
  else
    objc_msgSend(v4, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[CKSceneDelegate scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

}

- (UIWindowScene)scene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (CKMacToolbarController)toolbarController
{
  return self->_toolbarController;
}

- (void)setToolbarController:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarController, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
