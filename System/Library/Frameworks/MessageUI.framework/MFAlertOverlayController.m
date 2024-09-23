@implementation MFAlertOverlayController

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__MFAlertOverlayController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __31__MFAlertOverlayController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.messageui", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (MFAlertOverlayController)initWithWindowScene:(id)a3
{
  id v5;
  MFAlertOverlayController *v6;
  MFAlertOverlayController *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAlertOverlayController.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

  }
  v10.receiver = self;
  v10.super_class = (Class)MFAlertOverlayController;
  v6 = -[MFAlertOverlayController init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_scene, v5);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MFAlertOverlayController _teardownOverlayWindow](self, "_teardownOverlayWindow");
  v3.receiver = self;
  v3.super_class = (Class)MFAlertOverlayController;
  -[MFAlertOverlayController dealloc](&v3, sel_dealloc);
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[MFAlertOverlayController _topmostViewController](self, "_topmostViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[MFAlertOverlayController scene](self, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAlertOverlayController _setupOverlayWindowWithScene:](self, "_setupOverlayWindowWithScene:", v11);
    -[MFAlertOverlayController overlayWindow](self, "overlayWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__handlePresentationDismissalNotification_, *MEMORY[0x1E0DC5218], v8);

  +[MFAlertOverlayController log](MFAlertOverlayController, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "Presenting alert %@ from %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v10, "presentViewController:animated:completion:", v8, v6, v9);
}

- (BOOL)isPresentingAlert
{
  void *v2;
  BOOL v3;

  -[MFAlertOverlayController _bottomPresentedAlert](self, "_bottomPresentedAlert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIAlertController)topmostPresentedAlert
{
  void *v2;
  id v3;

  -[MFAlertOverlayController _topmostViewController](self, "_topmostViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UIAlertController *)v3;
}

- (id)_topmostViewController
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[MFAlertOverlayController overlayWindow](self, "overlayWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  do
  {
    v4 = (void *)v3;

    objc_msgSend(v4, "presentedViewController");
    v3 = objc_claimAutoreleasedReturnValue();
    v2 = v4;
  }
  while (v3);
  return v4;
}

- (id)_bottomPresentedAlert
{
  void *v2;
  void *v3;
  void *v4;

  -[MFAlertOverlayController overlayWindow](self, "overlayWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setupOverlayWindowWithScene:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[MFAlertOverlayController log](MFAlertOverlayController, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_INFO, "Setting up alert overlay window...", (uint8_t *)&v11, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F98]), "initWithWindowScene:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v6, "setRootViewController:", v7);

  +[MFAlertOverlayController log](MFAlertOverlayController, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_INFO, "Succesfully set up alert overlay window in scene %@: %@", (uint8_t *)&v11, 0x16u);

  }
  -[MFAlertOverlayController setOverlayWindow:](self, "setOverlayWindow:", v6);
  objc_msgSend(v6, "makeKeyAndVisible");

}

- (void)_teardownOverlayWindow
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a2, a3, "Found presented alert while tearing down alert overlay window. Dismissing it before continuing with teardown. Presented: %@", (uint8_t *)&v3);
}

- (void)_handlePresentationDismissalNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFAlertOverlayController _bottomPresentedAlert](self, "_bottomPresentedAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFAlertOverlayController log](MFAlertOverlayController, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1AB96A000, v9, OS_LOG_TYPE_DEFAULT, "Alert controller dismissed: %@", (uint8_t *)&v12, 0xCu);
    }

    if (v8 == v5)
LABEL_10:
      -[MFAlertOverlayController _teardownOverlayWindow](self, "_teardownOverlayWindow");
  }
  else
  {
    +[MFAlertOverlayController log](MFAlertOverlayController, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAlertOverlayController _handlePresentationDismissalNotification:].cold.1(v11, (uint64_t)&v12, v10);
    }

    if (!v5 || objc_msgSend(v5, "isBeingDismissed"))
      goto LABEL_10;
  }

}

- (UIWindowScene)scene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (UIWindow)overlayWindow
{
  return self->_overlayWindow;
}

- (void)setOverlayWindow:(id)a3
{
  objc_storeStrong((id *)&self->_overlayWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayWindow, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)_handlePresentationDismissalNotification:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a3, (uint64_t)a3, "Received unexpected dismissal notification for unknown object: %@", (uint8_t *)a2);

}

@end
