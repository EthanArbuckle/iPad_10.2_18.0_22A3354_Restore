@implementation AXHearingAidDisplayController

- (void)dealloc
{
  objc_super v3;

  -[AXHearingAidDisplayController setModuleUIController:](self, "setModuleUIController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidDisplayController;
  -[AXHearingAidDisplayController dealloc](&v3, sel_dealloc);
}

- (void)dismissWithCompletion:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BE4BE48];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterUpdateListener:", self);

  -[AXHearingAidDisplayController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 17, v5);
  -[AXHearingAidDisplayController moduleUIController](self, "moduleUIController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  -[AXHearingAidDisplayController moduleUIController](self, "moduleUIController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromParentViewController");

  -[AXHearingAidDisplayController setModuleUIController:](self, "setModuleUIController:", 0);
  -[AXHearingAidDisplayController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 1);

}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXHearingAidDisplayController;
  -[AXHearingAidDisplayController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXHearingAidDisplayController;
  -[AXHearingAidDisplayController loadView](&v4, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4BDE8]), "initWithDelegate:", self);
  objc_msgSend(v3, "setDelegate:", self);
  -[AXHearingAidDisplayController setModuleUIController:](self, "setModuleUIController:", v3);

}

- (void)didMoveToParentViewController:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXHearingAidDisplayController;
  -[AXHearingAidDisplayController didMoveToParentViewController:](&v12, sel_didMoveToParentViewController_, a3);
  -[AXHearingAidDisplayController parentViewController](self, "parentViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[AXHearingAidDisplayController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[AXHearingAidDisplayController moduleUIController](self, "moduleUIController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4BDE8]), "initWithDelegate:", self);
        objc_msgSend(v8, "setDelegate:", self);
        -[AXHearingAidDisplayController setModuleUIController:](self, "setModuleUIController:", v8);

      }
      -[AXHearingAidDisplayController moduleUIController](self, "moduleUIController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __63__AXHearingAidDisplayController_didMoveToParentViewController___block_invoke;
      v11[3] = &unk_24FEF0C60;
      v11[4] = self;
      -[AXHearingAidDisplayController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v11);

    }
  }
  -[AXHearingAidDisplayController moduleUIController](self, "moduleUIController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

}

void __63__AXHearingAidDisplayController_didMoveToParentViewController___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x24BDF7328];
  objc_msgSend(*(id *)(a1 + 32), "moduleUIController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (HearingAidUIServer)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  self->_parentController = (HearingAidUIServer *)a3;
}

- (HACCShortcutViewController)moduleUIController
{
  return self->_moduleUIController;
}

- (void)setModuleUIController:(id)a3
{
  objc_storeStrong((id *)&self->_moduleUIController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleUIController, 0);
}

@end
