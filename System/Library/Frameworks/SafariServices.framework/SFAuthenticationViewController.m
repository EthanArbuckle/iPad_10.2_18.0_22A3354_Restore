@implementation SFAuthenticationViewController

- (SFAuthenticationViewController)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 presentationContextWindow:(id)a6
{
  return -[SFAuthenticationViewController initWithURL:callbackURLScheme:usingEphemeralSession:jitEnabled:presentationContextWindow:](self, "initWithURL:callbackURLScheme:usingEphemeralSession:jitEnabled:presentationContextWindow:", a3, a4, a5, 1, a6);
}

- (SFAuthenticationViewController)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 presentationContextWindow:(id)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  void *v12;
  id v13;
  id v14;
  void *v15;
  SFAuthenticationViewController *v16;

  v7 = a6;
  v8 = a5;
  v12 = (void *)MEMORY[0x1E0C925F0];
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "callbackWithCustomScheme:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SFAuthenticationViewController initWithURL:callback:storageMode:jitEnabled:presentationContextWindow:additionalHeaderFields:proxiedAssociatedDomains:](self, "initWithURL:callback:storageMode:jitEnabled:presentationContextWindow:additionalHeaderFields:proxiedAssociatedDomains:", v14, v15, v8, v7, v13, 0, 0);

  return v16;
}

- (SFAuthenticationViewController)initWithURL:(id)a3 callback:(id)a4 storageMode:(unint64_t)a5 jitEnabled:(BOOL)a6 presentationContextWindow:(id)a7 additionalHeaderFields:(id)a8 proxiedAssociatedDomains:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  SFSafariViewControllerConfiguration *v19;
  SFAuthenticationViewController *v20;
  uint64_t v21;
  NSArray *proxiedAssociatedDomains;
  void *v23;
  void *v24;
  void *v25;
  SFAuthenticationViewController *v26;
  id v29;
  objc_super v30;

  v11 = a6;
  v15 = a4;
  v29 = a7;
  v16 = a8;
  v17 = a9;
  v18 = a3;
  v19 = objc_alloc_init(SFSafariViewControllerConfiguration);
  -[SFSafariViewControllerConfiguration setEntersReaderIfAvailable:](v19, "setEntersReaderIfAvailable:", 0);
  -[SFSafariViewControllerConfiguration setBarCollapsingEnabled:](v19, "setBarCollapsingEnabled:", 0);
  -[SFSafariViewControllerConfiguration set_storageModeForAuthenticationSession:](v19, "set_storageModeForAuthenticationSession:", a5);
  -[SFSafariViewControllerConfiguration _setJITEnabled:](v19, "_setJITEnabled:", v11);
  v30.receiver = self;
  v30.super_class = (Class)SFAuthenticationViewController;
  v20 = -[SFSafariViewController initWithURL:configuration:](&v30, sel_initWithURL_configuration_, v18, v19);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_presentationContextWindow, a7);
    objc_storeStrong((id *)&v20->_callback, a4);
    v21 = objc_msgSend(v17, "copy");
    proxiedAssociatedDomains = v20->_proxiedAssociatedDomains;
    v20->_proxiedAssociatedDomains = (NSArray *)v21;

    -[SFSafariViewController serviceProxy](v20, "serviceProxy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSafariViewController initialURL](v20, "initialURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "decideCookieSharingForURL:callback:proxiedAssociatedDomains:", v24, v15, v20->_proxiedAssociatedDomains);

    if (objc_msgSend(v16, "count"))
    {
      -[SFSafariViewController serviceProxy](v20, "serviceProxy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAdditionalHeaderFieldsForInitialLoad:", v16);

    }
    -[SFSafariViewController setDismissButtonStyle:](v20, "setDismissButtonStyle:", 2, a4, v29);
    -[SFSafariViewController setTransitioningDelegate:](v20, "setTransitioningDelegate:", v20);
    -[SFAuthenticationViewController setDefersAddingRemoteViewController:](v20, "setDefersAddingRemoteViewController:", 1);
    -[SFAuthenticationViewController setModalInPresentation:](v20, "setModalInPresentation:", 1);
    v26 = v20;
  }

  return v20;
}

- (void)setDefersAddingRemoteViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[SFSafariViewController defersAddingRemoteViewController](self, "defersAddingRemoteViewController") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SFAuthenticationViewController;
    -[SFSafariViewController setDefersAddingRemoteViewController:](&v7, sel_setDefersAddingRemoteViewController_, v3);
    if (!v3)
    {
      -[SFSafariViewController _addRemoteViewControllerIfNeeded](self, "_addRemoteViewControllerIfNeeded");
      -[SFSafariViewController serviceProxy](self, "serviceProxy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSafariViewController initialURL](self, "initialURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loadURL:", v6);

    }
  }
}

- (void)_presentViewController
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_FAULT, "Attempted to present SFAuthenticationViewController from a view controller that is being dismissed: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  SFAuthenticationViewController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __75__SFAuthenticationViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_1E4AC1338;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)SFAuthenticationViewController;
  v7[0] = MEMORY[0x1E0C809B0];
  v5 = v9;
  -[SFAuthenticationViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

void __75__SFAuthenticationViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 1248))
  {
    v4 = *(_QWORD *)(v3 + 1288);
    if (v4)
    {
      (*(void (**)(void))(v4 + 16))();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 1248);
      *(_QWORD *)(v5 + 1248) = 0;

    }
  }
}

- (void)_restartServiceViewController
{
  void *v3;
  void *v4;
  id v5;

  -[SFSafariViewController serviceProxy](self, "serviceProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSafariViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v3);

  objc_msgSend(v5, "setDismissButtonStyle:", -[SFSafariViewController dismissButtonStyle](self, "dismissButtonStyle"));
  -[SFSafariViewController initialURL](self, "initialURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decideCookieSharingForURL:callback:proxiedAssociatedDomains:", v4, self->_callback, self->_proxiedAssociatedDomains);

  -[SFAuthenticationViewController setDefersAddingRemoteViewController:](self, "setDefersAddingRemoteViewController:", 1);
}

+ (BOOL)_supportsPrewarming
{
  return 0;
}

- (void)remoteViewController:(id)a3 hostApplicationOpenURL:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SFSafariViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "safariViewController:hostApplicationOpenURL:", self, v6);

}

- (void)remoteViewController:(id)a3 didDecideCookieSharingForURL:(id)a4 shouldCancel:(BOOL)a5 withError:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v12 = a4;
  v9 = a6;
  -[SFSafariViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "safariViewController:didDecideCookieSharingForURL:shouldCancel:withError:", self, v12, v7, v9);
  -[SFAuthenticationViewController presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v11)
      -[SFAuthenticationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    if (!v11)
      -[SFAuthenticationViewController _presentViewController](self, "_presentViewController");
    -[SFAuthenticationViewController setDefersAddingRemoteViewController:](self, "setDefersAddingRemoteViewController:", 0);
  }

}

- (SFAuthenticationViewControllerPresentationDelegate)presentationDelegate
{
  return (SFAuthenticationViewControllerPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_presentationContextWindow, 0);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_fallbackPresentationViewController, 0);
}

@end
