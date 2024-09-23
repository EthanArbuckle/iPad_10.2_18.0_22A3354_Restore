@implementation INUIEditVoiceShortcutViewController

- (INUIEditVoiceShortcutViewController)initWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut
{
  INVoiceShortcut *v4;
  INUIEditVoiceShortcutViewController *v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v4 = voiceShortcut;
  v10.receiver = self;
  v10.super_class = (Class)INUIEditVoiceShortcutViewController;
  v5 = -[INUIEditVoiceShortcutViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke;
    v7[3] = &unk_1EA43A990;
    objc_copyWeak(&v8, &location);
    +[INUIVoiceShortcutHostViewController getViewControllerForEditingVoiceShortcut:completion:](INUIVoiceShortcutHostViewController, "getViewControllerForEditingVoiceShortcut:completion:", v4, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)loadView
{
  INUILoadingVoiceShortcutViewController *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)INUIEditVoiceShortcutViewController;
  -[INUIEditVoiceShortcutViewController loadView](&v4, sel_loadView);
  v3 = objc_alloc_init(INUILoadingVoiceShortcutViewController);
  -[INUIEditVoiceShortcutViewController setChildViewController:](self, "setChildViewController:", v3);

}

- (void)setChildViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[INUIEditVoiceShortcutViewController currentChildViewController](self, "currentChildViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v11, "willMoveToParentViewController:", 0);
    objc_msgSend(v11, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v11, "removeFromParentViewController");
  }
  objc_msgSend(v4, "willMoveToParentViewController:", self);
  -[INUIEditVoiceShortcutViewController addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INUIEditVoiceShortcutViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[INUIEditVoiceShortcutViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  -[INUIEditVoiceShortcutViewController setCurrentChildViewController:](self, "setCurrentChildViewController:", v4);

}

- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[INUIEditVoiceShortcutViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "editVoiceShortcutViewController:didUpdateVoiceShortcut:error:", self, v7, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didUpdateVoiceShortcut"), v7);

}

- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INUIEditVoiceShortcutViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editVoiceShortcutViewController:didDeleteVoiceShortcutWithIdentifier:", self, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didDeleteVoiceShortcut"), 0);

}

- (void)remoteViewControllerDidCancel
{
  id v3;

  -[INUIEditVoiceShortcutViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editVoiceShortcutViewControllerDidCancel:", self);

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteHostViewController;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (INUIVoiceShortcutHostViewController)_remoteHostViewController
{
  return self->_remoteHostViewController;
}

- (void)_setRemoteHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteHostViewController, a3);
}

- (UIViewController)currentChildViewController
{
  return self->_currentChildViewController;
}

- (void)setCurrentChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentChildViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentChildViewController, 0);
  objc_storeStrong((id *)&self->_remoteHostViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];
  _QWORD v13[6];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "_setRemoteHostViewController:", v5);
      objc_msgSend(v5, "setDelegate:", v8);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_2;
      v12[3] = &unk_1EA43A968;
      v12[4] = v8;
      v9 = (id *)v12;
      v10 = v5;
    }
    else
    {
      v11 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[INUIEditVoiceShortcutViewController initWithVoiceShortcut:]_block_invoke";
        v16 = 2114;
        v17 = v6;
        _os_log_error_impl(&dword_1DC055000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get view controller for editing: %{public}@", buf, 0x16u);
      }
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_4;
      v13[3] = &unk_1EA43A968;
      v13[4] = v8;
      v9 = (id *)v13;
      v10 = v6;
    }
    v9[5] = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  INIntentError();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editVoiceShortcutViewController:didUpdateVoiceShortcut:error:", v2, 0, v3);

}

uint64_t __61__INUIEditVoiceShortcutViewController_initWithVoiceShortcut___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChildViewController:", *(_QWORD *)(a1 + 40));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    INLogInitIfNeeded();
}

@end
