@implementation CKDebugSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v7 = a3;
  objc_msgSend(a5, "userActivities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.Messages.ShowMessageInspector"));

  if (v11)
  {
    objc_msgSend(v9, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("message-guid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__CKDebugSceneDelegate_scene_willConnectToSession_options___block_invoke;
    v19[3] = &unk_1E2750670;
    v19[4] = self;
    v20 = v7;
    objc_msgSend(v14, "loadMessageWithGUID:completionBlock:", v13, v19);

  }
  else
  {
    +[DebugInspectorContainerViewControllerFactory debugMenuViewController](_TtC7ChatKit44DebugInspectorContainerViewControllerFactory, "debugMenuViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDebugSceneDelegate displayViewController:forScene:title:](self, "displayViewController:forScene:title:", v15, v7, CFSTR("Messages Debug Menu"));

  }
  v16 = objc_alloc_init(MEMORY[0x1E0CEA920]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCanActivateForTargetContentIdentifierPredicate:", v17);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPrefersToActivateForTargetContentIdentifierPredicate:", v18);

  objc_msgSend(v7, "setActivationConditions:", v16);
}

void __59__CKDebugSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  +[DebugInspectorContainerViewControllerFactory inspectorViewControllerForMessage:](_TtC7ChatKit44DebugInspectorContainerViewControllerFactory, "inspectorViewControllerForMessage:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayViewController:forScene:title:", v4, *(_QWORD *)(a1 + 40), CFSTR("Message"));

}

- (void)displayViewController:(id)a3 forScene:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v15, "sizeRestrictions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumSize:", 300.0, 200.0);

  objc_msgSend(v15, "sizeRestrictions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaximumSize:", 440.0, 720.0);

  objc_msgSend(v15, "setTitle:", v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC18]), "initWithWindowScene:", v15);
  -[CKDebugSceneDelegate setWindow:](self, "setWindow:", v12);

  -[CKDebugSceneDelegate window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRootViewController:", v9);

  -[CKDebugSceneDelegate window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "makeKeyAndVisible");

}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
