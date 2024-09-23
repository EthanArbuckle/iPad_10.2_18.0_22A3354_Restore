@implementation AFUIAutoFillPopoverController

- (AFUIAutoFillPopoverController)initWithDocumentTraits:(id)a3 documentState:(id)a4 textOperationsHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  AFUIAutoFillPopoverController *v12;
  AFUIAutoFillPopoverController *v13;
  uint64_t v14;
  id performTextOperations;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AFUIAutoFillPopoverController;
  v12 = -[AFUIAutoFillPopoverController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_documentTraits, a3);
    objc_storeStrong((id *)&v13->_documentState, a4);
    v14 = MEMORY[0x23B803E10](v11);
    performTextOperations = v13->_performTextOperations;
    v13->_performTextOperations = (id)v14;

  }
  return v13;
}

- (AFUIAutoFillPopoverController)initWithDocumentTraits:(id)a3 documentState:(id)a4 keyboardOutputHandler:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFUIAutoFillPopoverController;
  return -[AFUIAutoFillPopoverController init](&v6, sel_init, a3, a4, a5);
}

+ (id)presentAsPopoverFromWindow:(id)a3 documentTraits:(id)a4 documentState:(id)a5 modalUIDelegate:(id)a6 textOperationsHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  AFUIAutoFillPopoverController *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[AFUIAutoFillPopoverController initWithDocumentTraits:documentState:textOperationsHandler:]([AFUIAutoFillPopoverController alloc], "initWithDocumentTraits:documentState:textOperationsHandler:", v14, v13, v11);

  -[AFUIAutoFillPopoverController setModalUIDelegate:](v16, "setModalUIDelegate:", v12);
  -[AFUIAutoFillPopoverController view](v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v17);

  objc_msgSend(v15, "rootViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "addChildViewController:", v16);
  v19 = objc_msgSend(v14, "autofillMode");

  -[AFUIAutoFillPopoverController _presentViewControllerForAutoFillMode:](v16, "_presentViewControllerForAutoFillMode:", v19);
  return v16;
}

- (void)documentStateChanged:(id)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  _BOOL4 v40;
  int v41;
  void *v42;
  int v43;
  BOOL v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v45 = a3;
  objc_msgSend(v45, "clientFrameInWindow");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[RTIDocumentState clientFrameInWindow](self->_documentState, "clientFrameInWindow");
  v49.origin.x = v12;
  v49.origin.y = v13;
  v49.size.width = v14;
  v49.size.height = v15;
  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  if (!CGRectEqualToRect(v46, v49))
    goto LABEL_5;
  objc_msgSend(v45, "clientFrameInEntitySpace");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[RTIDocumentState clientFrameInEntitySpace](self->_documentState, "clientFrameInEntitySpace");
  v50.origin.x = v24;
  v50.origin.y = v25;
  v50.size.width = v26;
  v50.size.height = v27;
  v47.origin.x = v17;
  v47.origin.y = v19;
  v47.size.width = v21;
  v47.size.height = v23;
  if (CGRectEqualToRect(v47, v50))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_8;
  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BEBD7F8], "visiblePeripheralFrame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v45, "caretRectInWindow");
    v51.origin.x = v36;
    v51.origin.y = v37;
    v51.size.width = v38;
    v51.size.height = v39;
    v48.origin.x = v29;
    v48.origin.y = v31;
    v48.size.width = v33;
    v48.size.height = v35;
    v40 = CGRectContainsRect(v48, v51);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v40)
        goto LABEL_8;
      goto LABEL_10;
    }
    if (!v40)
      goto LABEL_10;
  }
  v41 = objc_msgSend(v45, "scrolling");
  -[AFUIAutoFillPopoverController documentState](self, "documentState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "scrolling");

  if (v41 == v43)
  {
LABEL_8:
    -[AFUIAutoFillPopoverController setDocumentState:](self, "setDocumentState:", v45);
    goto LABEL_13;
  }
LABEL_10:
  v44 = -[AFUIAutoFillPopoverController willPresentMenu](self, "willPresentMenu");
  -[AFUIAutoFillPopoverController setDocumentState:](self, "setDocumentState:", v45);
  if (!v44)
  {
    -[AFUIAutoFillPopoverController dismissMenu](self, "dismissMenu");
    if (self->_contentController)
      -[AFUIAutoFillPopoverController _displayMenuForContentController:](self, "_displayMenuForContentController:");
  }
LABEL_13:

}

- (BOOL)hasSuggestions
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[AFUIAutoFillPopoverController contentController](self, "contentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[AFUIAutoFillPopoverController contentController](self, "contentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuggestions");

  return v6;
}

- (void)dismissMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AFUIAutoFillPopoverController modalUIDelegate](self, "modalUIDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsMenuPresented:forSessionUUID:", 0, 0);

  -[AFUIAutoFillPopoverController contextMenuInteraction](self, "contextMenuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissMenu");

  -[AFUIAutoFillPopoverController contextMenuInteraction](self, "contextMenuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  -[AFUIAutoFillPopoverController setContextMenuInteraction:](self, "setContextMenuInteraction:", 0);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BEBD4F8];
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __87__AFUIAutoFillPopoverController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v12 = &unk_250857090;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredMenuElementOrder:", 2, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

id __87__AFUIAutoFillPopoverController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "menu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BEBDBB8], "defaultStyle", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredLayout:", 3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setAllowsBackgroundInteractionAcrossProccesses:", 1);
  -[AFUIAutoFillPopoverController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContainerView:", v7);

  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AFUIAutoFillPopoverController;
  -[AFUIAutoFillPopoverController viewDidLoad](&v5, sel_viewDidLoad);
  -[AFUIAutoFillPopoverController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[AFUIAutoFillPopoverController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

}

- (void)presentPassword
{
  AFUIAutoFillPasswordController *v3;
  void *v4;
  void *v5;
  void *v6;
  AFUIAutoFillPasswordController *v7;

  v3 = [AFUIAutoFillPasswordController alloc];
  -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPopoverController performTextOperations](self, "performTextOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AFUIAutoFillPasswordController initWithDocumentTraits:presentingViewController:textOperationsHandler:](v3, "initWithDocumentTraits:presentingViewController:textOperationsHandler:", v4, self, v5);

  -[AFUIAutoFillPopoverController modalUIDelegate](self, "modalUIDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPasswordController setModalUIDelegate:](v7, "setModalUIDelegate:", v6);

  -[AFUIAutoFillPopoverController _displayMenuForContentController:](self, "_displayMenuForContentController:", v7);
}

- (void)presentContacts
{
  AFUIAutofillContactsController *v3;
  void *v4;
  void *v5;
  void *v6;
  AFUIAutofillContactsController *v7;

  v3 = [AFUIAutofillContactsController alloc];
  -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPopoverController performTextOperations](self, "performTextOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AFUIAutofillContactsController initWithDocumentTraits:presentingViewController:textOperationsHandler:](v3, "initWithDocumentTraits:presentingViewController:textOperationsHandler:", v4, self, v5);

  -[AFUIAutoFillPopoverController modalUIDelegate](self, "modalUIDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutofillContactsController setModalUIDelegate:](v7, "setModalUIDelegate:", v6);

  -[AFUIAutoFillPopoverController _displayMenuForContentController:](self, "_displayMenuForContentController:", v7);
}

- (void)presentCreditCards
{
  AFUIAutoFillCreditCardController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AFUIAutoFillCreditCardController *v8;

  v3 = [AFUIAutoFillCreditCardController alloc];
  -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPopoverController documentState](self, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPopoverController performTextOperations](self, "performTextOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AFUIAutoFillCreditCardController initWithDocumentTraits:documentState:presentingViewController:textOperationsHandler:](v3, "initWithDocumentTraits:documentState:presentingViewController:textOperationsHandler:", v4, v5, self, v6);

  -[AFUIAutoFillPopoverController modalUIDelegate](self, "modalUIDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillCreditCardController setModalUIDelegate:](v8, "setModalUIDelegate:", v7);

  -[AFUIAutoFillPopoverController _displayMenuForContentController:](self, "_displayMenuForContentController:", v8);
}

- (void)_displayMenuForContentController:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[AFUIAutoFillPopoverController setContentController:](self, "setContentController:", v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke;
  v8[3] = &unk_250856820;
  objc_copyWeak(&v9, &location);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_2;
  v6[3] = &unk_250856820;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "generateInitialMenu:menuChanged:", v8, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setMenu:", v3);

  objc_msgSend(WeakRetained, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scrolling");

    if ((v6 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  objc_msgSend(WeakRetained, "contentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "hasSuggestions"))
    objc_msgSend(WeakRetained, "_displayContextMenuWhenReady");
  else
    objc_msgSend(WeakRetained, "_removeFromSuperview");

LABEL_10:
}

void __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contextMenuInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_3;
  v8[3] = &unk_2508570B8;
  objc_copyWeak(&v10, v4);
  v7 = v3;
  v9 = v7;
  objc_msgSend(v6, "updateVisibleMenuWithBlock:", v8);

  objc_destroyWeak(&v10);
}

id __66__AFUIAutoFillPopoverController__displayMenuForContentController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "menu");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v3;
  if (v5 == v3)
  {
    objc_msgSend(WeakRetained, "setMenu:", *(_QWORD *)(a1 + 32));
    v6 = *(void **)(a1 + 32);
  }
  v7 = v6;

  return v7;
}

- (void)_displayContextMenuWhenReady
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];
  id v6;
  id location;

  if (!-[AFUIAutoFillPopoverController willPresentMenu](self, "willPresentMenu"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD500]), "initWithDelegate:", self);
    -[AFUIAutoFillPopoverController setContextMenuInteraction:](self, "setContextMenuInteraction:", v3);

    -[AFUIAutoFillPopoverController setWillPresentMenu:](self, "setWillPresentMenu:", 1);
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__AFUIAutoFillPopoverController__displayContextMenuWhenReady__block_invoke;
    block[3] = &unk_250856FD0;
    objc_copyWeak(&v6, &location);
    block[4] = self;
    dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __61__AFUIAutoFillPopoverController__displayContextMenuWhenReady__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setWillPresentMenu:", 0);
  objc_msgSend(WeakRetained, "contextMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(WeakRetained, "_displayContextMenu");

}

- (void)_displayContextMenu
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[AFUIAutoFillPopoverController documentState](self, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caretRectInWindow");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AFUIAutoFillPopoverController _sourceRectInApplicationCoordinates](self, "_sourceRectInApplicationCoordinates");
  -[AFUIAutoFillPopoverController _translatedRectFromApplication:](self, "_translatedRectFromApplication:");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[AFUIAutoFillPopoverController _translatedRectFromApplication:](self, "_translatedRectFromApplication:", v5, v7, v9, v11);
  -[AFUIAutoFillPopoverController _displayContextMenuForSourceRect:caretRect:](self, "_displayContextMenuForSourceRect:caretRect:", v13, v15, v17, v19, v20, v21, v22, v23);
}

- (CGRect)_sourceRectInApplicationCoordinates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect result;

  -[AFUIAutoFillPopoverController documentState](self, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientFrameInWindow");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[AFUIAutoFillPopoverController documentState](self, "documentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "caretRectInWindow");
  if (CGRectIsNull(v23))
    goto LABEL_4;
  -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isExplicitAutoFillInvocation");

  if (v14)
  {
    -[AFUIAutoFillPopoverController documentState](self, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "caretRectInWindow");
    v5 = v15;
    v7 = v16;
    v9 = v17;
    v11 = v18;
LABEL_4:

  }
  v19 = v5;
  v20 = v7;
  v21 = v9;
  v22 = v11;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)_displayContextMenuForSourceRect:(CGRect)a3 caretRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  double MidX;
  double MidY;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v45 = *MEMORY[0x24BDAC8D0];
  -[AFUIAutoFillPopoverController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPopoverController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toCoordinateSpace:", v13, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[AFUIAutoFillPopoverController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "screen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v50.origin.x = v25;
  v50.origin.y = v26;
  v50.size.width = v27;
  v50.size.height = v28;
  v46.origin.x = v15;
  v46.origin.y = v17;
  v46.size.width = v19;
  v46.size.height = v21;
  v29 = CGRectIntersectsRect(v46, v50);

  if (width != *MEMORY[0x24BDBF148] || height != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend(MEMORY[0x24BEBD7F8], "visiblePeripheralFrame");
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    if (!CGRectContainsRect(v47, v51) && v29)
    {
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      MidX = CGRectGetMidX(v48);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      MidY = CGRectGetMidY(v49);
      if (UIPointIsDiscrete()
        && (-[AFUIAutoFillPopoverController view](self, "view"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v33, "window"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v34,
            v33,
            v34))
      {
        v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
        -[AFUIAutoFillPopoverController view](self, "view");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addSubview:", v42);

        -[AFUIAutoFillPopoverController contextMenuInteraction](self, "contextMenuInteraction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addInteraction:", v36);

        -[AFUIAutoFillPopoverController contextMenuInteraction](self, "contextMenuInteraction");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_presentMenuAtLocation:", MidX, MidY);

        -[AFUIAutoFillPopoverController modalUIDelegate](self, "modalUIDelegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setIsMenuPresented:forSessionUUID:", 1, 0);

      }
      else
      {
        AFUIAutoFillPopoverControllerOSLogFacility();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s _displayMenuForContentController: with invalid centerOfCaret"), "-[AFUIAutoFillPopoverController _displayContextMenuForSourceRect:caretRect:]");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v44 = v40;
          _os_log_impl(&dword_236DAD000, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

        }
      }
    }
  }
}

- (CGRect)_translatedRectFromApplication:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CATransform3D v39;
  CATransform3D v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CATransform3D v49;
  CGRect result;

  -[AFUIAutoFillPopoverController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_contextId");

  -[AFUIAutoFillPopoverController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetRenderId();

  memset(&v49, 0, sizeof(v49));
  BKSHIDServicesGetCALayerTransform();
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v45 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v46 = v9;
  v10 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v47 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v48 = v10;
  v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v41 = *MEMORY[0x24BDE5598];
  v42 = v11;
  v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v43 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v44 = v12;
  -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v13, "contextID");

  if ((_DWORD)v7)
  {
    -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contextID");
    -[AFUIAutoFillPopoverController documentTraits](self, "documentTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layerID");
    BKSHIDServicesGetCALayerTransform();

  }
  CA_CGRectApplyTransform();
  v40 = v49;
  CATransform3DInvert(&v39, &v40);
  CA_CGRectApplyTransform();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[AFUIAutoFillPopoverController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAutoFillPopoverController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "window");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertRect:fromView:", v26, v17, v19, v21, v23);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v28;
  v36 = v30;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)_removeFromSuperview
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  -[AFUIAutoFillPopoverController modalUIDelegate](self, "modalUIDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsMenuPresented:forSessionUUID:", 0, 0);

  -[AFUIAutoFillPopoverController performTextOperations](self, "performTextOperations");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0);

  -[AFUIAutoFillPopoverController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[AFUIAutoFillPopoverController removeFromParentViewController](self, "removeFromParentViewController");
}

- (void)_presentViewControllerForAutoFillMode:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 8uLL:
      -[AFUIAutoFillPopoverController presentPassword](self, "presentPassword");
      break;
    case 5uLL:
    case 6uLL:
    case 7uLL:
      -[AFUIAutoFillPopoverController presentContacts](self, "presentContacts");
      break;
    case 9uLL:
      -[AFUIAutoFillPopoverController presentCreditCards](self, "presentCreditCards");
      break;
    default:
      return;
  }
}

- (AFUIModalUIDelegate)modalUIDelegate
{
  return (AFUIModalUIDelegate *)objc_loadWeakRetained((id *)&self->_modalUIDelegate);
}

- (void)setModalUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_modalUIDelegate, a3);
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (void)setDocumentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_documentTraits, a3);
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (id)performTextOperations
{
  return self->_performTextOperations;
}

- (void)setPerformTextOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (UIMenu)menu
{
  return (UIMenu *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setMenu:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (AFUIAutoFillContentController)contentController
{
  return (AFUIAutoFillContentController *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setContentController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (BOOL)willPresentMenu
{
  return self->_willPresentMenu;
}

- (void)setWillPresentMenu:(BOOL)a3
{
  self->_willPresentMenu = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentController, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong(&self->_performTextOperations, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_documentTraits, 0);
  objc_destroyWeak((id *)&self->_modalUIDelegate);
}

@end
