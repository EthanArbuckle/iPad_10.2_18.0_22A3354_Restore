@implementation RPBroadcastActivityViewController

+ (void)loadBroadcastActivityViewControllerWithPreferredExtension:(NSString *)preferredExtension handler:(void *)handler
{
  +[RPBroadcastActivityViewController loadBroadcastActivityViewControllerWithPreferredExtension:handler:broadcastActivitiesNotInstalledAlertTitle:broadcastActivitiesNotInstalledAlertMessage:atPoint:fromWindow:](RPBroadcastActivityViewController, "loadBroadcastActivityViewControllerWithPreferredExtension:handler:broadcastActivitiesNotInstalledAlertTitle:broadcastActivitiesNotInstalledAlertMessage:atPoint:fromWindow:", preferredExtension, handler, 0, 0, 0, 0.0, 0.0);
}

+ (void)loadBroadcastActivityViewControllerWithHandler:(void *)handler
{
  +[RPBroadcastActivityViewController loadBroadcastActivityViewControllerWithPreferredExtension:handler:broadcastActivitiesNotInstalledAlertTitle:broadcastActivitiesNotInstalledAlertMessage:atPoint:fromWindow:](RPBroadcastActivityViewController, "loadBroadcastActivityViewControllerWithPreferredExtension:handler:broadcastActivitiesNotInstalledAlertTitle:broadcastActivitiesNotInstalledAlertMessage:atPoint:fromWindow:", 0, handler, 0, 0, 0, 0.0, 0.0);
}

+ (void)loadBroadcastActivityViewControllerWithPreferredExtension:(id)a3 handler:(id)a4 broadcastActivitiesNotInstalledAlertTitle:(id)a5 broadcastActivitiesNotInstalledAlertMessage:(id)a6 atPoint:(CGPoint)a7 fromWindow:(id)a8
{
  id v11;
  void (**v12)(id, _QWORD, id);
  RPBroadcastActivityViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  UIImage *v26;
  UIImage *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  RPBroadcastActivityViewController *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  RPBroadcastActivityViewController *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  RPBroadcastActivityViewController *v49;
  id v50;
  void (**v51)(id, _QWORD, id);
  id v52;
  id v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = (void (**)(id, _QWORD, id))a4;
  v47 = a5;
  v46 = a6;
  v13 = objc_alloc_init(RPBroadcastActivityViewController);
  -[RPBroadcastActivityViewController setDidFinishHandler:](v13, "setDidFinishHandler:", v12);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "infoDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CFBundleIcons"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CFBundlePrimaryIcon"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v45 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("CFBundleIconFiles"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v17;
    else
      v19 = 0;
  }
  v55[0] = CFSTR("RPBroadcastExtensionKeyExtensionHostInfoAppName");
  objc_msgSend(v14, "_rpLocalizedAppName");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_24D15E550;
  v55[1] = CFSTR("RPBroadcastExtensionKeyExtensionHostInfoBundleID");
  v56[0] = v22;
  objc_msgSend(v14, "bundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");

  v43 = v19;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", v19);
  v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    UIImagePNGRepresentation(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("RPBroadcastExtensionKeyExtensionHostInfoAppIcon"));

  }
  v30 = v46;
  v29 = v47;
  if (v47)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v47, CFSTR("RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertTitle"));
  if (v46)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v46, CFSTR("RPBroadcastExtensionKeyExtensionHostInfoBroadcastActivitiesNotInstalledAlertMessage"));
  if (v11)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v11, CFSTR("RPBroadcastExtensionKeyExtensionHostInfoPreferredExtension"));
  v44 = v17;
  v52 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.ReplayKit.RPBroadcastActivityViewControllerExtension"), &v52);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v52;
  if (v32)
  {
    v12[2](v12, 0, v32);
    v33 = v45;
  }
  else
  {
    v34 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPBroadcastExtensionKeyExtensionHostInfo"), 0);
    objc_msgSend(v34, "setAttributedTitle:", v35);

    v36 = objc_alloc(MEMORY[0x24BDD15F0]);
    v37 = (void *)objc_msgSend(v36, "initWithItem:typeIdentifier:", v25, *MEMORY[0x24BDC1748]);
    v54 = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
    v42 = v11;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAttachments:", v38);

    v39 = objc_opt_class();
    v53 = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke;
    v48[3] = &unk_24D15E290;
    v33 = v45;
    v49 = v45;
    v50 = 0;
    v51 = v12;
    v41 = (void *)v39;
    v30 = v46;
    objc_msgSend(v41, "viewControllerForExtension:inputItems:completionHandler:", v31, v40, v48);

    v11 = v42;
    v29 = v47;
  }

}

void __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke_2;
  v5[3] = &unk_24D15E268;
  v6 = v3;
  v7 = a1[4];
  v9 = a1[6];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __208__RPBroadcastActivityViewController_loadBroadcastActivityViewControllerWithPreferredExtension_handler_broadcastActivitiesNotInstalledAlertTitle_broadcastActivitiesNotInstalledAlertMessage_atPoint_fromWindow___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v2 = *(void **)(a1 + 40);
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v2, "setModalPresentationStyle:", 6);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(*(id *)(a1 + 40), "setHostViewController:", v17);
  objc_msgSend(v17, "setBroadcastActivityViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v17, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  objc_msgSend(*(id *)(a1 + 40), "addChildViewController:", v17);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  objc_msgSend(v17, "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v7 = a3;
  v8 = a5;
  if (v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __93__RPBroadcastActivityViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke;
    v9[3] = &unk_24D15E2B8;
    v10 = v7;
    v11 = v8;
    objc_msgSend(v10, "instantiateViewControllerWithInputItems:connectionHandler:", a4, v9);

  }
}

void __93__RPBroadcastActivityViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v7 = a3;
  v8 = a4;
  v11 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHostViewController:", v11);
  if (v8)
  {
    NSLog(CFSTR("Error instantiating remote view controller for extension: %i"), objc_msgSend(v8, "code"));
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }

}

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  RPBroadcastController *v15;
  void *v16;
  void *v17;
  RPBroadcastActivityViewController *v18;
  RPBroadcastController *v19;
  void *v20;
  id v21;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:options:completionHandler:", v21, MEMORY[0x24BDBD1B8], 0);

  }
  -[RPBroadcastActivityViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    if (a6)
    {
      -[RPBroadcastActivityViewController delegate](self, "delegate");
      v15 = (RPBroadcastController *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5801, MEMORY[0x24BDBD1B8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v15;
      v18 = self;
      v19 = 0;
      v20 = v16;
    }
    else
    {
      v15 = -[RPBroadcastController initWithExtensionBundleID:broadcastURL:]([RPBroadcastController alloc], "initWithExtensionBundleID:broadcastURL:", v11, v10);
      -[RPBroadcastActivityViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v17;
      v18 = self;
      v19 = v15;
      v20 = 0;
    }
    objc_msgSend(v17, "broadcastActivityViewController:didFinishWithBroadcastController:error:", v18, v19, v20);

  }
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  id v4;
  objc_super v5;

  if (a3 == 7)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6CA8]), "initWithPresentedViewController:presentingViewController:", self->_hostViewController, self);
    -[RPBroadcastActivityViewController setPopoverPresentationControllerProxy:](self, "setPopoverPresentationControllerProxy:", v4);

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)RPBroadcastActivityViewController;
    -[RPBroadcastActivityViewController setModalPresentationStyle:](&v5, sel_setModalPresentationStyle_);
  }
}

- (id)popoverPresentationController
{
  return self->_popoverPresentationControllerProxy;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__RPBroadcastActivityViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_24D15D798;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

id __78__RPBroadcastActivityViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)RPBroadcastActivityViewController;
  return objc_msgSendSuper2(&v3, sel_dismissViewControllerAnimated_completion_, 0, v1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (UIPopoverPresentationController)popoverPresentationControllerProxy
{
  return self->_popoverPresentationControllerProxy;
}

- (void)setPopoverPresentationControllerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_popoverPresentationControllerProxy, a3);
}

- (RPBroadcastActivityHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
}

- (id)didFinishHandler
{
  return self->_didFinishHandler;
}

- (void)setDidFinishHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didFinishHandler, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_popoverPresentationControllerProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
