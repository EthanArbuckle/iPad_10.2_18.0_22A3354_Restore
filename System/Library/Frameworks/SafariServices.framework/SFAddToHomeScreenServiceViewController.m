@implementation SFAddToHomeScreenServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE77AA30);
}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78AD78);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_didFetchManifestData_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_didFetchWebClipMetadata_, 0, 0);

  return v2;
}

- (void)viewDidLoad
{
  SFWebAppDataProvider *provider;
  SFWebAppDataProvider *v4;
  SFWebAppDataProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFAddToHomeScreenServiceViewController;
  -[SFAddToHomeScreenServiceViewController viewDidLoad](&v10, sel_viewDidLoad);
  provider = self->_provider;
  if (!provider)
  {
    v4 = objc_alloc_init(SFWebAppDataProvider);
    v5 = self->_provider;
    self->_provider = v4;

    -[SFWebAppDataProvider setDelegate:](self->_provider, "setDelegate:", self);
    provider = self->_provider;
  }
  -[SFWebAppDataProvider activityViewController](provider, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAddToHomeScreenServiceViewController addChildViewController:](self, "addChildViewController:", v6);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAddToHomeScreenServiceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  -[SFAddToHomeScreenServiceViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "setFrame:");

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v6, "didMoveToParentViewController:", self);

}

- (void)prepareForDisplayWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;

  v4 = (void (**)(_QWORD))a3;
  -[SFAddToHomeScreenServiceViewController _hostAuditToken](self, "_hostAuditToken");
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    -[SFWebAppDataProvider setContentReadyForDisplay](self->_provider, "setContentReadyForDisplay", 0, 0, 0, 0);
    v4[2](v4);
  }
  else
  {
    -[SFAddToHomeScreenServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceViewControllerDidFinishWithResult:", 0);

  }
}

- (void)didFetchManifestData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SFAddToHomeScreenServiceViewController _hostAuditToken](self, "_hostAuditToken");
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    -[SFWebAppDataProvider prepareWithManifestData:](self->_provider, "prepareWithManifestData:", v4, 0, 0, 0, 0);
  }
  else
  {
    -[SFAddToHomeScreenServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceViewControllerDidFinishWithResult:", 0);

  }
}

- (void)didFetchWebClipMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SFAddToHomeScreenServiceViewController _hostAuditToken](self, "_hostAuditToken");
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    -[SFWebAppDataProvider updateWithWebClipMetadata:](self->_provider, "updateWithWebClipMetadata:", v4, 0, 0, 0, 0);
  }
  else
  {
    -[SFAddToHomeScreenServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", 0, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceViewControllerDidFinishWithResult:", 0);

  }
}

- (void)didReceiveWebClipIcon:(id)a3
{
  -[SFWebAppDataProvider updateWebClipIcon:](self->_provider, "updateWebClipIcon:", a3);
}

- (void)didCopyStagedCookiesToURL:(id)a3 sandboxExtensionToken:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[SFAddToHomeScreenServiceViewController _hostAuditToken](self, "_hostAuditToken");
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    -[SFWebAppDataProvider updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:](self->_provider, "updateWithStagedCookiesDirectoryURL:sandboxExtensionToken:", v6, v7, 0, 0, 0, 0);
  }
  else
  {
    -[SFAddToHomeScreenServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", 0, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceViewControllerDidFinishWithResult:", 0);

    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    sandbox_extension_consume();
    sandbox_extension_release();
  }

}

- (void)dataProvider:(id)a3 didFinishWithResult:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[SFAddToHomeScreenServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceViewControllerDidFinishWithResult:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
