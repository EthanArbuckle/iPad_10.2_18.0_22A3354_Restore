@implementation SKArcadeSubscribeViewController

- (SKArcadeSubscribeViewController)initWithItemID:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  SKArcadeSubscribeViewController *v8;
  SKArcadeSubscribeViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SKArcadeSubscribeViewController;
  v8 = -[SKArcadeSubscribeViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    -[SKArcadeSubscribeViewController setItemID:](v8, "setItemID:", v6);
    -[SKArcadeSubscribeViewController setBundleID:](v9, "setBundleID:", v7);
  }

  return v9;
}

- (void)dealloc
{
  SKStoreRemoteViewController *remoteViewController;
  void *v4;
  NSExtension *extension;
  objc_super v6;

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    -[SKStoreRemoteViewController willMoveToParentViewController:](remoteViewController, "willMoveToParentViewController:", 0);
    if (-[SKStoreRemoteViewController isViewLoaded](self->_remoteViewController, "isViewLoaded"))
    {
      -[SKStoreRemoteViewController view](self->_remoteViewController, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

    }
    -[SKStoreRemoteViewController removeFromParentViewController](self->_remoteViewController, "removeFromParentViewController");
  }
  extension = self->_extension;
  if (extension)
  {
    if (self->_extensionRequestIdentifier)
    {
      -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
      extension = self->_extension;
    }
    -[NSExtension _kill:](extension, "_kill:", 9);
  }
  v6.receiver = self;
  v6.super_class = (Class)SKArcadeSubscribeViewController;
  -[SKArcadeSubscribeViewController dealloc](&v6, sel_dealloc);
}

- (void)finishExtension
{
  NSExtension *extension;

  extension = self->_extension;
  if (extension)
  {
    if (self->_extensionRequestIdentifier)
      -[NSExtension cancelExtensionRequestWithIdentifier:](extension, "cancelExtensionRequestWithIdentifier:");
  }
}

- (BOOL)prefersStatusBarHidden
{
  void *v3;
  void *v4;
  char v5;

  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "prefersStatusBarHidden");

  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  else
    -[SKArcadeSubscribeViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportedInterfaceOrientations");

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKArcadeSubscribeViewController;
  -[SKArcadeSubscribeViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SKArcadeSubscribeViewController extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[SKArcadeSubscribeViewController _loadOcelotUpsellExtension](self, "_loadOcelotUpsellExtension");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKArcadeSubscribeViewController;
  v6 = a4;
  v7 = a3;
  -[SKArcadeSubscribeViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v7, v6);
  -[_UIRemoteViewController willTransitionToTraitCollection:withTransitionCoordinator:](self->_remoteViewController, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6, v8.receiver, v8.super_class);

}

- (void)finish
{
  id v2;

  -[SKArcadeSubscribeViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishWithError:", 0);

}

- (void)_loadOcelotUpsellExtension
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.AppStore.SubscribePageExtension"), &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v4)
  {
    NSLog(CFSTR("Error instantiating jet extension: %@"), v4);
    -[SKArcadeSubscribeViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didFinishWithError:", v5);
  }
  else if (v3)
  {
    -[SKArcadeSubscribeViewController setExtension:](self, "setExtension:", v3);
    v6 = (void *)objc_opt_new();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke;
    v8[3] = &unk_1E5B267B0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    objc_msgSend(v3, "instantiateViewControllerWithInputItems:connectionHandler:", v7, v8);

    objc_destroyWeak(&v9);
  }
  else
  {
    NSLog(CFSTR("Error, no extension found"));
    -[SKArcadeSubscribeViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didFinishWithError:", 0);
  }

  objc_destroyWeak(&location);
}

void __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v9)
    NSLog(CFSTR("Error instantiating a view controller from the jet extension: %@"), v9);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke_2;
  block[3] = &unk_1E5B26788;
  block[4] = WeakRetained;
  v16 = v7;
  v11 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v18 = v11;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__SKArcadeSubscribeViewController__loadOcelotUpsellExtension__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setExtensionRequestIdentifier:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 56);
    v4 = *(id *)(a1 + 48);
    objc_msgSend(v4, "setDelegate:", v2);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v4);
    objc_msgSend(*(id *)(a1 + 32), "_setupRemoteChildViewController");
  }
  else
  {
    v3 = objc_opt_class();
    NSLog(CFSTR("Error loading remote view controller %@ doesn't match the expected type"), v3);
    objc_msgSend(*(id *)(a1 + 56), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didFinishWithError:", *(_QWORD *)(a1 + 64));
  }

}

- (void)_setupRemoteChildViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceViewControllerProxy");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  -[SKArcadeSubscribeViewController itemID](self, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SKArcadeSubscribeViewController itemID](self, "itemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("itemID"));

  }
  objc_msgSend(v15, "setupWithParameters:", v4);
  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKArcadeSubscribeViewController addChildViewController:](self, "addChildViewController:", v9);

  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKArcadeSubscribeViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v11, "setFrame:");

  objc_msgSend(v11, "setAutoresizingMask:", 18);
  -[SKArcadeSubscribeViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v11);

  -[SKArcadeSubscribeViewController remoteViewController](self, "remoteViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didMoveToParentViewController:", self);

}

- (void)storeRemoteViewControllerDidDismiss
{
  id v2;

  -[SKArcadeSubscribeViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didFinishWithError:", 0);

}

- (void)storeRemoteViewControllerTerminatedWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKArcadeSubscribeViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishWithError:", v4);

}

- (SKArcadeSubscribeViewControllerDelegate)delegate
{
  return (SKArcadeSubscribeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKStoreRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewController, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
