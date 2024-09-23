@implementation AFUIPanel

- (AFUIPanel)initWithDocumentPid:(int)a3 sessionUUID:(id)a4
{
  uint64_t v5;
  id v7;
  AFUIPanel *v8;
  AFUIPanelState *v9;
  AFUIPanelState *panelState;
  void *v11;
  objc_super v13;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AFUIPanel;
  v8 = -[AFUIPanel init](&v13, sel_init);
  if (v8)
  {
    v9 = -[AFUIPanelState initNotDisplayed]([AFUIPanelState alloc], "initNotDisplayed");
    panelState = v8->_panelState;
    v8->_panelState = v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__sceneWillEnterForeground_, *MEMORY[0x24BEBE710], 0);

    -[AFUIPanel _monitorDocumentProcessVisibility:](v8, "_monitorDocumentProcessVisibility:", v5);
    objc_storeStrong((id *)&v8->_sessionUUID, a4);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE710], 0);

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)AFUIPanel;
  -[AFUIPanel dealloc](&v4, sel_dealloc);
}

- (void)_monitorDocumentProcessVisibility:(int)a3
{
  void *v5;
  RBSProcessMonitor *v6;
  RBSProcessMonitor *processMonitor;
  _QWORD v8[4];
  id v9;
  int v10;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BE80CC8];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke;
  v8[3] = &unk_250857198;
  v10 = a3;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "monitorWithConfiguration:", v8);
  v6 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  processMonitor = self->_processMonitor;
  self->_processMonitor = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValues:", 5);
  v13[0] = *MEMORY[0x24BE38348];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndowmentNamespaces:", v5);

  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(v3, "setServiceClass:", 33);
  v6 = (void *)MEMORY[0x24BE80CD8];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", *(unsigned int *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateMatchingIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v9);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_2;
  v10[3] = &unk_250857170;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  objc_msgSend(v3, "setUpdateHandler:", v10);
  objc_destroyWeak(&v11);

}

void __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  char v7;
  _QWORD block[4];
  id v9;

  objc_msgSend(a4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endowmentNamespaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x24BE38348]);

  if ((v7 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_3;
    block[3] = &unk_250856D60;
    objc_copyWeak(&v9, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v9);
  }
}

void __47__AFUIPanel__monitorDocumentProcessVisibility___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hide");

}

- (void)_applyPanelState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__AFUIPanel__applyPanelState__block_invoke;
  block[3] = &unk_250856B30;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __29__AFUIPanel__applyPanelState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "panelState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isDisplayed");
    AFUIPanelOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
        __29__AFUIPanel__applyPanelState__block_invoke_cold_1(v3);

      v7 = *(void **)(a1 + 32);
      objc_msgSend(v3, "documentTraits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "documentState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textOperationsHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayForDocumentTraits:documentState:textOperationsHandler:", v8, v9, v10);

    }
    else
    {
      if (v6)
        __29__AFUIPanel__applyPanelState__block_invoke_cold_2(v3);

      objc_msgSend(*(id *)(a1 + 32), "hide");
    }
  }

}

- (void)displayForDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  AFUIClientSession *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  int v23;
  AFUIExplicitAutoFillController *v24;
  AFUIExplicitAutoFillController *explicitAutoFillController;
  AFUIExplicitAutoFillController *v26;
  void *v27;
  void *v28;
  id WeakRetained;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AFUIPanelOSLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "appId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%s appId:%@"), "-[AFUIPanel displayForDocumentTraits:documentState:textOperationsHandler:]", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v14;
    _os_log_impl(&dword_236DAD000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v15 = -[AFUIPanelState initDisplayed:documentTraits:documentState:textOperationsHandler:]([AFUIPanelState alloc], "initDisplayed:documentTraits:documentState:textOperationsHandler:", 1, v8, v9, v10);
  -[AFUIPanel setPanelState:](self, "setPanelState:", v15);

  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "usesInputSystemUIForAutoFillOnly"))
  {
    -[AFUIPanel clientSession](self, "clientSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      v18 = objc_alloc_init(AFUIClientSession);
      -[AFUIPanel setClientSession:](self, "setClientSession:", v18);

    }
    -[AFUIPanel clientSession](self, "clientSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke;
    v30[3] = &unk_2508571E8;
    v31 = v10;
    objc_msgSend(v19, "displayForDocumentTraits:documentState:textOperationsHandler:", v8, v9, v30);

    v20 = v31;
  }
  else
  {
    -[AFUIPanel _presentingWindow](self, "_presentingWindow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[AFUIPanel _hide](self, "_hide");
      v21 = objc_msgSend(v8, "autofillMode");
      v22 = objc_msgSend(v8, "_isExplicitAutoFillInvocation");
      if (v21 == 9)
        v23 = 0;
      else
        v23 = v22;
      if (v23 == 1)
      {
        v24 = -[AFUIExplicitAutoFillController initWithDocumentTraits:documentState:textOperationsHandler:]([AFUIExplicitAutoFillController alloc], "initWithDocumentTraits:documentState:textOperationsHandler:", v8, v9, v10);
        explicitAutoFillController = self->_explicitAutoFillController;
        self->_explicitAutoFillController = v24;

        -[AFUIExplicitAutoFillController setDelegate:](self->_explicitAutoFillController, "setDelegate:", self);
        v26 = self->_explicitAutoFillController;
        objc_msgSend(v20, "rootViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[AFUIExplicitAutoFillController presentFromViewController:](v26, "presentFromViewController:", v27);

      }
      else
      {
        objc_initWeak((id *)buf, self);
        +[AFUIAutoFillPopoverController presentAsPopoverFromWindow:documentTraits:documentState:modalUIDelegate:textOperationsHandler:](AFUIAutoFillPopoverController, "presentAsPopoverFromWindow:documentTraits:documentState:modalUIDelegate:textOperationsHandler:", v20, v8, v9, self, v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)buf);
        objc_msgSend(WeakRetained, "setPopoverController:", v28);

        objc_destroyWeak((id *)buf);
      }
    }
  }

}

void __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2;
  v6[3] = &unk_2508571C0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __74__AFUIPanel_displayForDocumentTraits_documentState_textOperationsHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)documentStateChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  AFUIPanelState *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[AFUIPanel panelState](self, "panelState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AFUIPanelOSLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AFUIPanel documentStateChanged:].cold.1(v5);

  if (v5)
  {
    v7 = [AFUIPanelState alloc];
    v8 = objc_msgSend(v5, "isDisplayed");
    objc_msgSend(v5, "documentTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textOperationsHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AFUIPanelState initDisplayed:documentTraits:documentState:textOperationsHandler:](v7, "initDisplayed:documentTraits:documentState:textOperationsHandler:", v8, v9, v10, v11);
    -[AFUIPanel setPanelState:](self, "setPanelState:", v12);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "usesInputSystemUIForAutoFillOnly"))
  {
    -[AFUIPanel clientSession](self, "clientSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AFUIPanel popoverController](self, "popoverController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v13, "documentStateChanged:", v4);

}

- (void)transientHide
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  AFUIPanelOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[AFUIPanel panelState](self, "panelState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s appId:%@"), "-[AFUIPanel transientHide]", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_236DAD000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  if (!self->_explicitAutoFillController)
    goto LABEL_5;
  -[AFUIPanel _presentingWindow](self, "_presentingWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = +[AFUIPasswordsController isPasswordPickerViewControllerAuthenticating:](AFUIPasswordsController, "isPasswordPickerViewControllerAuthenticating:", v11);
  if ((v10 & 1) == 0)
LABEL_5:
    -[AFUIPanel hide](self, "hide");
}

- (void)transientUnhide
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  AFUIPanelOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[AFUIPanel panelState](self, "panelState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s appId:%@"), "-[AFUIPanel transientUnhide]", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v8;
    _os_log_impl(&dword_236DAD000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
}

- (void)hide
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = -[AFUIPanelState initNotDisplayed]([AFUIPanelState alloc], "initNotDisplayed");
  -[AFUIPanel setPanelState:](self, "setPanelState:", v3);

  AFUIPanelOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[AFUIPanel panelState](self, "panelState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%s appId:%@"), "-[AFUIPanel hide]", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_236DAD000, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "usesInputSystemUIForAutoFillOnly"))
  {
    -[AFUIPanel clientSession](self, "clientSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hide");

    -[AFUIPanel setClientSession:](self, "setClientSession:", 0);
  }
  else
  {
    -[AFUIPanel _hide](self, "_hide");
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AFUIPanel popoverController](self, "popoverController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[AFUIPanel setPopoverController:](self, "setPopoverController:", 0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (id)_presentingWindow
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__AFUIPanel__presentingWindow__block_invoke;
  v6[3] = &unk_250857210;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  objc_msgSend(MEMORY[0x24BEBDA40], "sharedTextEffectsWindowForWindowScene:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__AFUIPanel__presentingWindow__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "activationState"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_hide
{
  void *v3;
  void *v4;
  AFUIExplicitAutoFillController *explicitAutoFillController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_explicitAutoFillController)
  {
    -[AFUIPanel _presentingWindow](self, "_presentingWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    explicitAutoFillController = self->_explicitAutoFillController;
    self->_explicitAutoFillController = 0;

  }
  else
  {
    -[AFUIPanel popoverController](self, "popoverController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissMenu");

    -[AFUIPanel popoverController](self, "popoverController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

    -[AFUIPanel popoverController](self, "popoverController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[AFUIPanel popoverController](self, "popoverController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");

    -[AFUIPanel setPopoverController:](self, "setPopoverController:", 0);
  }
}

- (void)dismissMenu
{
  id v2;

  -[AFUIPanel popoverController](self, "popoverController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMenu");

}

- (void)authenticationWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AFUIPanel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationWillBeginForSessionUUID:completion:", v6, v5);

}

- (void)authenticationDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AFUIPanel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationDidEndForSessionUUID:completion:", v6, v5);

}

- (void)contactsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AFUIPanel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactsUIWillBeginForSessionUUID:completion:", v6, v5);

}

- (void)contactsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AFUIPanel hide](self, "hide");
  -[AFUIPanel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contactsUIDidEndForSessionUUID:completion:", v6, v5);

}

- (void)passwordsUIWillBeginForSessionUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AFUIPanel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passwordsUIWillBeginForSessionUUID:completion:", v6, v5);

}

- (void)passwordsUIDidEndForSessionUUID:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[AFUIPanel hide](self, "hide");
  -[AFUIPanel delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passwordsUIDidEndForSessionUUID:completion:", v6, v5);

}

- (void)setIsMenuPresented:(BOOL)a3 forSessionUUID:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[AFUIPanel delegate](self, "delegate", a3, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AFUIPanel sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsMenuPresented:forSessionUUID:", v4, v6);

}

- (AFUIModalUIDelegate)delegate
{
  return (AFUIModalUIDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AFUIAutoFillPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
  objc_storeStrong((id *)&self->_popoverController, a3);
}

- (AFUIClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
  objc_storeStrong((id *)&self->_clientSession, a3);
}

- (AFUIExplicitAutoFillController)explicitAutoFillController
{
  return self->_explicitAutoFillController;
}

- (void)setExplicitAutoFillController:(id)a3
{
  objc_storeStrong((id *)&self->_explicitAutoFillController, a3);
}

- (AFUIPanelState)panelState
{
  return self->_panelState;
}

- (void)setPanelState:(id)a3
{
  objc_storeStrong((id *)&self->_panelState, a3);
}

- (RBSProcessMonitor)processMonitor
{
  return (RBSProcessMonitor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProcessMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_panelState, 0);
  objc_storeStrong((id *)&self->_explicitAutoFillController, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __29__AFUIPanel__applyPanelState__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "documentTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s action:DisplayPanel appId:%@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_236DAD000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIPanel _applyPanelState]_block_invoke", (uint64_t)v3, 2u);

  OUTLINED_FUNCTION_3();
}

void __29__AFUIPanel__applyPanelState__block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "documentTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s action:HidePanel appId:%@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_236DAD000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIPanel _applyPanelState]_block_invoke", (uint64_t)v3, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)documentStateChanged:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "documentTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%s appId:%@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_236DAD000, v5, v6, "%@", v7, v8, v9, v10, (uint64_t)"-[AFUIPanel documentStateChanged:]", (uint64_t)v3, 2u);

  OUTLINED_FUNCTION_3();
}

@end
