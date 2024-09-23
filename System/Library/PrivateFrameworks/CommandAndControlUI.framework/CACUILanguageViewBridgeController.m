@implementation CACUILanguageViewBridgeController

- (CACUILanguageViewBridgeController)init
{
  CACUILanguageViewBridgeController *v2;
  _TtC19CommandAndControlUI21CACLanguageViewBridge *v3;
  _TtC19CommandAndControlUI21CACLanguageViewBridge *viewBridge;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACUILanguageViewBridgeController;
  v2 = -[CACUILanguageViewBridgeController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC19CommandAndControlUI21CACLanguageViewBridge);
    viewBridge = v2->_viewBridge;
    v2->_viewBridge = v3;

    -[CACLanguageViewBridge setDelegate:](v2->_viewBridge, "setDelegate:", v2);
  }
  return v2;
}

- (id)createLanguageViewController
{
  return -[CACUILanguageViewBridgeController createLanguageViewControllerWithLocales:](self, "createLanguageViewControllerWithLocales:", 0);
}

- (id)createLanguageViewControllerWithLocales:(id)a3
{
  UIViewController *v4;
  UIViewController *trueViewController;

  if (!self->_trueViewController)
  {
    -[CACLanguageViewBridge makeLanguageUIWithLocales:](self->_viewBridge, "makeLanguageUIWithLocales:", a3);
    v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    trueViewController = self->_trueViewController;
    self->_trueViewController = v4;

  }
  return -[CACUILanguageViewBridgeController trueViewController](self, "trueViewController", a3);
}

- (void)updateInstallationStatus:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__CACUILanguageViewBridgeController_updateInstallationStatus___block_invoke;
  v6[3] = &unk_24F643DC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __62__CACUILanguageViewBridgeController_updateInstallationStatus___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateInstallationStatusWith:", *(_QWORD *)(a1 + 40));

}

- (void)updateDownloadStatus:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__CACUILanguageViewBridgeController_updateDownloadStatus___block_invoke;
  v6[3] = &unk_24F643DC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__CACUILanguageViewBridgeController_updateDownloadStatus___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDownloadStatusWith:", *(_QWORD *)(a1 + 40));

}

- (void)setSelectedLanguageIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__CACUILanguageViewBridgeController_setSelectedLanguageIdentifier___block_invoke;
  v6[3] = &unk_24F643DC8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __67__CACUILanguageViewBridgeController_setSelectedLanguageIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSelectedWithLanguageIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)downloadLanguageWithIdentifier:(id)a3
{
  RXObjectSetProperty();
}

- (void)cancelDownloadWithIdentifier:(id)a3
{
  RXObjectSetProperty();
}

- (void)selectedLanguageWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACUILanguageViewBridgeController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedLanguageWithIdentifier:", v4);

}

- (CACLanguageViewBridgeDelegate)delegate
{
  return (CACLanguageViewBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)installationStatus
{
  return self->_installationStatus;
}

- (_TtC19CommandAndControlUI21CACLanguageViewBridge)viewBridge
{
  return self->_viewBridge;
}

- (void)setViewBridge:(id)a3
{
  objc_storeStrong((id *)&self->_viewBridge, a3);
}

- (UIViewController)trueViewController
{
  return self->_trueViewController;
}

- (void)setTrueViewController:(id)a3
{
  objc_storeStrong((id *)&self->_trueViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueViewController, 0);
  objc_storeStrong((id *)&self->_viewBridge, 0);
  objc_storeStrong((id *)&self->_installationStatus, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
