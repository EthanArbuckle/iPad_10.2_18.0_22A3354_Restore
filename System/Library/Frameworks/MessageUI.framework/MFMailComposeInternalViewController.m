@implementation MFMailComposeInternalViewController

- (MFMailComposeInternalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  MFMailComposeInternalViewController *v8;
  MFMailComposeInternalViewController *v9;
  MFMailComposeInternalViewController *v10;
  void *v11;
  MFMailCompositionValues *v12;
  MFMailCompositionValues *compositionValues;
  _QWORD v15[4];
  MFMailComposeInternalViewController *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MFMailComposeInternalViewController;
  v8 = -[MFMailComposeInternalViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__MFMailComposeInternalViewController_initWithNibName_bundle___block_invoke;
    v15[3] = &unk_1E5A689C8;
    v10 = v8;
    v16 = v10;
    +[MFMailComposeRemoteViewController requestViewControllerWithConnectionHandler:](MFMailComposeRemoteViewController, "requestViewControllerWithConnectionHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v10->_cancellationInvocation, v11);
    v10->_defaultContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
    v12 = objc_alloc_init(MFMailCompositionValues);
    compositionValues = v10->_compositionValues;
    v10->_compositionValues = v12;

  }
  return v9;
}

uint64_t __62__MFMailComposeInternalViewController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceViewControllerReady:error:", a2, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[MFMailComposeRemoteViewController setDelegate:](self->_serviceViewController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeInternalViewController;
  -[MFMailComposeInternalViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeInternalViewController;
  -[MFMailComposeInternalViewController loadView](&v3, sel_loadView);
  -[MFMailComposeInternalViewController _loadContentViewControllerForcingPlaceholder:](self, "_loadContentViewControllerForcingPlaceholder:", 0);
}

- (void)_loadContentViewControllerForcingPlaceholder:(BOOL)a3
{
  MFMailComposePlaceholderViewController *v5;
  id *p_serviceViewController;
  id serviceViewController;
  NSObject *v8;
  MFMailComposePlaceholderViewController *placeholderViewController;
  uint64_t v10;
  NSObject *v11;
  id v12;
  MFMailComposePlaceholderViewController *v13;
  id v14;
  id v15;
  MFMailComposeInternalViewController *v16;
  MFMailComposeInternalViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  uint8_t buf[16];

  if ((-[MFMailComposeInternalViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    if ((*((_BYTE *)self + 1072) & 8) == 0)
      goto LABEL_3;
    p_serviceViewController = (id *)&self->_serviceViewController;
    serviceViewController = self->_serviceViewController;
    if (serviceViewController && !a3)
    {
      if (!self->_placeholderViewController)
      {
        v5 = 0;
        v10 = 1;
        goto LABEL_18;
      }
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_INFO, "#CompositionServices Removing placeholder view controller", buf, 2u);
      }

      v5 = self->_placeholderViewController;
      placeholderViewController = self->_placeholderViewController;
      self->_placeholderViewController = 0;

      v10 = 1;
      goto LABEL_17;
    }
    if (serviceViewController)
    {
      MFLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_1AB96A000, v11, OS_LOG_TYPE_INFO, "#CompositionServices Removing service view controller", v27, 2u);
      }

      v5 = (MFMailComposePlaceholderViewController *)*p_serviceViewController;
      v12 = *p_serviceViewController;
      *p_serviceViewController = 0;

    }
    else
    {
LABEL_3:
      v5 = 0;
    }
    p_serviceViewController = (id *)&self->_placeholderViewController;
    serviceViewController = self->_placeholderViewController;
    if (serviceViewController)
    {
      v10 = 0;
LABEL_18:
      v15 = serviceViewController;
      if (v5
        && (-[MFMailComposePlaceholderViewController parentViewController](v5, "parentViewController"),
            v16 = (MFMailComposeInternalViewController *)objc_claimAutoreleasedReturnValue(),
            v16,
            v16 == self))
      {
        -[MFMailComposePlaceholderViewController willMoveToParentViewController:](v5, "willMoveToParentViewController:", 0);
        -[MFMailComposePlaceholderViewController view](v5, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "superview");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailComposeInternalViewController view](self, "view");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25 == v26)
          objc_msgSend(v24, "removeFromSuperview");
        -[MFMailComposePlaceholderViewController removeFromParentViewController](v5, "removeFromParentViewController");

        if (!v15)
          goto LABEL_25;
      }
      else if (!v15)
      {
LABEL_25:
        -[MFMailComposeInternalViewController navigationController](self, "navigationController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setNavigationBarHidden:animated:", v10, 0);

        return;
      }
      objc_msgSend(v15, "parentViewController");
      v17 = (MFMailComposeInternalViewController *)objc_claimAutoreleasedReturnValue();

      if (v17 != self)
      {
        -[MFMailComposeInternalViewController addChildViewController:](self, "addChildViewController:", v15);
        objc_msgSend(v15, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "superview");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailComposeInternalViewController view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 != v20)
        {
          -[MFMailComposeInternalViewController view](self, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addSubview:", v18);

          -[MFMailComposeInternalViewController view](self, "view");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bounds");
          objc_msgSend(v18, "setFrame:");

        }
        objc_msgSend(v15, "didMoveToParentViewController:", self);

      }
      goto LABEL_25;
    }
    v13 = objc_alloc_init(MFMailComposePlaceholderViewController);
    v14 = *p_serviceViewController;
    *p_serviceViewController = v13;

    objc_msgSend(*p_serviceViewController, "setSubject:", self->_placeholderSubject);
    v10 = 0;
LABEL_17:
    serviceViewController = *p_serviceViewController;
    goto LABEL_18;
  }
}

- (void)_setPlaceHolderSubject:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *placeholderSubject;
  NSString *v7;

  v4 = (NSString *)a3;
  if (self->_placeholderSubject != v4)
  {
    v7 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    placeholderSubject = self->_placeholderSubject;
    self->_placeholderSubject = v5;

    v4 = v7;
  }

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *placeholderSubject;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeInternalViewController;
  -[MFMailComposeInternalViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[MFMailComposeInternalViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isSmallPhone"))
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "_initWithFilledSystemImageNamed:fillColor:", CFSTR("arrow.up.circle.fill"), v5);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v6, 0, 0, 0);
    objc_msgSend(v7, "setEnabled:", 0);
    -[MFMailComposeInternalViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:", v7);

  }
  else
  {
    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrefersLargeTitles:", 1);

    objc_msgSend(v3, "setLargeTitleDisplayMode:", 1);
    +[MFComposeSendAccessoryButton buttonWithType:](MFComposeSendAccessoryButton, "buttonWithType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setLargeTitleAccessoryView:alignToBaseline:", v6, 0);
  }

  v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, sel__cancelComposition_);

  -[MFMailComposeInternalViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLeftBarButtonItem:", v14);

  if (-[NSString length](self->_placeholderSubject, "length"))
  {
    placeholderSubject = self->_placeholderSubject;
    -[MFMailComposeInternalViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", placeholderSubject);
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE_LONG"), &stru_1E5A6A588, CFSTR("Main"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeInternalViewController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", v18);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeInternalViewController;
  -[MFMailComposeInternalViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((*((_BYTE *)self + 1072) & 0x10) == 0)
    *((_BYTE *)self + 1072) |= 0x10u;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeInternalViewController;
  -[MFMailComposeInternalViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if ((*((_BYTE *)self + 1072) & 0x20) == 0)
  {
    *((_BYTE *)self + 1072) &= ~0x10u;
    *((_BYTE *)self + 1072) |= 0x20u;
    -[MFMailComposeInternalViewController _loadContentViewControllerForcingPlaceholder:](self, "_loadContentViewControllerForcingPlaceholder:", 0);
    if ((*((_BYTE *)self + 1072) & 0x40) != 0)
      -[MFMailComposeInternalViewController _notifyCompositionDidFinish](self, "_notifyCompositionDidFinish");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPPTAvailable");

    if (v5)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_21);
  }
}

void __53__MFMailComposeInternalViewController_viewDidAppear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("MFMailShareComposeViewDidShow"), 0, 0, 1);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  char v6;

  if (!objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
    return 1;
  -[MFMailComposeInternalViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldAutorotateToInterfaceOrientation:", a3);

  return v6;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeInternalViewController;
  -[MFMailComposeInternalViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);
  if (v4 && (*((_BYTE *)self + 1072) & 8) == 0)
    -[MFMailComposeInternalViewController _beginDelayingCompositionPresenation](self, "_beginDelayingCompositionPresenation");

}

- (void)_beginDelayingCompositionPresenation
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint8_t buf[16];

  if ((*((_BYTE *)self + 1072) & 1) == 0)
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_INFO, "#CompositionServices Began delaying composition presentation", buf, 2u);
    }

    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __75__MFMailComposeInternalViewController__beginDelayingCompositionPresenation__block_invoke;
      v6[3] = &unk_1E5A689F0;
      v6[4] = self;
      v6[5] = 0x3FE6666666666666;
      objc_msgSend(v4, "_beginDelayingPresentation:cancellationHandler:", v6, 0.7);
      self->_presentationDelayBeganTimestamp = CFAbsoluteTimeGetCurrent();
      *((_BYTE *)self + 1072) |= 1u;
    }

  }
}

uint64_t __75__MFMailComposeInternalViewController__beginDelayingCompositionPresenation__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 134217984;
      v7 = v4;
      _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_INFO, "#CompositionServices Delayed presentation timed out (%f.1 seconds)", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_didEndDelayingCompositionPresentation");
  return 1;
}

- (void)_endDelayingCompositionPresentation
{
  id v4;
  id v5;

  if ((*((_BYTE *)self + 1072) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 324, CFSTR("should have delayed presentation"));

  }
  if ((*((_BYTE *)self + 1072) & 2) == 0)
  {
    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v4, "_endDelayingPresentation");
    -[MFMailComposeInternalViewController _didEndDelayingCompositionPresentation](self, "_didEndDelayingCompositionPresentation");

  }
}

- (void)_didEndDelayingCompositionPresentation
{
  NSObject *v3;
  CFAbsoluteTime v4;
  void *v6;
  uint8_t buf[4];
  CFAbsoluteTime v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 1072) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_didEndDelayedPresentation"));

  }
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = CFAbsoluteTimeGetCurrent() - self->_presentationDelayBeganTimestamp;
    *(_DWORD *)buf = 134217984;
    v8 = v4;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_INFO, "#CompositionServices Ended delaying composition presentation (%.2f seconds)", buf, 0xCu);
  }

  *((_BYTE *)self + 1072) |= 2u;
}

- (void)_serviceViewControllerReady:(id)a3 error:(id)a4
{
  id v8;
  id v9;
  _UIAsyncInvocation *cancellationInvocation;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (self->_serviceViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_serviceViewController"));

  }
  cancellationInvocation = self->_cancellationInvocation;
  self->_cancellationInvocation = 0;

  if (v9)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailComposeInternalViewController _serviceViewControllerReady:error:].cold.1();
    }

  }
  if (v8)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1AB96A000, v12, OS_LOG_TYPE_INFO, "#CompositionServices Connected to view service: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_serviceViewController, a3);
    -[MFMailComposeRemoteViewController setDelegate:](self->_serviceViewController, "setDelegate:", self);
    if ((*((_BYTE *)self + 1072) & 4) != 0)
      -[MFMailComposeInternalViewController _configureRemoteViewContoller](self, "_configureRemoteViewContoller");
  }
  else
  {
    -[MFMailComposeInternalViewController _finishServiceViewControllerRequestWithSuccess:](self, "_finishServiceViewControllerRequestWithSuccess:", 0);
  }

}

- (id)placeholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 proxy:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__MFMailComposeInternalViewController_placeholderForFileName_fileSize_mimeType_contentID_proxy___block_invoke;
  v20[3] = &unk_1E5A67B88;
  v16 = v15;
  v21 = v16;
  objc_msgSend(v14, "serializedPlaceholderForFileName:fileSize:mimeType:contentID:withReply:", v11, a4, v12, v13, v20);
  objc_msgSend(v16, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "result:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __96__MFMailComposeInternalViewController_placeholderForFileName_fileSize_mimeType_contentID_proxy___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4D528], "placeholderFromSerializedRepresentation:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");

}

- (id)securityScopeForURL:(id)a3 proxy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __65__MFMailComposeInternalViewController_securityScopeForURL_proxy___block_invoke;
  v16 = &unk_1E5A68A18;
  v8 = v5;
  v17 = v8;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v6, "securityScopeForURL:withReply:", v8, &v13);
  objc_msgSend(v9, "future", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "result:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __65__MFMailComposeInternalViewController_securityScopeForURL_proxy___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D4D538], "securityScopedURL:withToken:", *(_QWORD *)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:");

}

- (void)_processAttachmentsViaProxy:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(2, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke;
  block[3] = &unk_1E5A65940;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke(_QWORD *a1)
{
  void *v1;
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  unsigned int (**v49)(void *, uint64_t);
  uint64_t v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD aBlock[6];
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D508], "capabilitiesDictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D4D4A8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D4D4A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke_2;
  aBlock[3] = &unk_1E5A68A40;
  v57 = v2;
  aBlock[4] = &v58;
  aBlock[5] = v4;
  v49 = (unsigned int (**)(void *, uint64_t))_Block_copy(aBlock);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(a1[4] + 1032);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v5)
  {
    v50 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v53 != v50)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "fileSize");
        objc_msgSend(v7, "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0D4D538];
          objc_msgSend(v7, "fileURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "securityScopedURL:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49[2](v49, v8))
          {
            objc_msgSend(v12, "startReadAccess");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)a1[4];
            objc_msgSend(v13, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "mimeType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "placeholderForFileName:fileSize:mimeType:contentID:proxy:", v15, v8, v16, v17, a1[5]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = (void *)a1[4];
            objc_msgSend(v18, "fileURL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "securityScopeForURL:proxy:", v20, a1[5]);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "startWriteAccess");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D4D528], "cloneFileAtURL:toPlaceholderURL:", v13, v22);
            v23 = (void *)a1[5];
            objc_msgSend(v18, "serializedRepresentation");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addAttachmentWithPlaceholderData:", v24);

            objc_msgSend(v12, "stopAccess");
            objc_msgSend(v21, "stopAccess");
          }
          else
          {
            objc_msgSend(v12, "startReadAccess");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "data");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)a1[5];
            objc_msgSend(v7, "mimeType");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lastPathComponent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addAttachmentWithData:mimeType:fileName:hostIdentifier:", v30, v32, v33, v34);

            objc_msgSend(v12, "stopAccess");
            v21 = 0;
          }
        }
        else
        {
          objc_msgSend(v7, "itemProvider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)a1[5];
            objc_msgSend(v7, "itemProvider");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "mimeType");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "fileName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addAttachmentWithItemProvider:mimeType:filename:hostIdentifier:", v12, v21, v27, v28);
LABEL_17:

            goto LABEL_18;
          }
          if (!v49[2](v49, v8))
          {
            v46 = (void *)a1[5];
            objc_msgSend(v7, "data");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "mimeType");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "fileName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addAttachmentWithData:mimeType:fileName:hostIdentifier:", v12, v21, v27, v28);
            goto LABEL_17;
          }
          v35 = (void *)a1[4];
          objc_msgSend(v7, "fileName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "mimeType");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "placeholderForFileName:fileSize:mimeType:contentID:proxy:", v36, v8, v37, v38, a1[5]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = (void *)a1[4];
          objc_msgSend(v12, "fileURL");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "securityScopeForURL:proxy:", v40, a1[5]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "startWriteAccess");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x1E0D4D528];
          objc_msgSend(v7, "data");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = objc_msgSend(v42, "writeData:forURL:", v43, v41);

          if ((_DWORD)v42)
          {
            v44 = (void *)a1[5];
            objc_msgSend(v12, "serializedRepresentation");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "addAttachmentWithPlaceholderData:", v45);

          }
          objc_msgSend(v21, "stopAccess");
        }
LABEL_18:

        v59[3] += v8;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(a1[6] + 16))();
  _Block_object_dispose(&v58, 8);

}

BOOL __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke_2(uint64_t a1, unint64_t a2)
{
  if (!*(_BYTE *)(a1 + 48))
    return 0;
  if (*(_QWORD *)(a1 + 40) >= a2)
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + a2 > 0x500000;
  return 1;
}

- (void)_configureRemoteViewContoller
{
  MFMailComposeRemoteViewController *serviceViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  if ((*((_BYTE *)self + 1072) & 4) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 485, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_compositionValuesAreFinalized"));

  }
  if ((*((_BYTE *)self + 1072) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_remoteViewControllerIsConfigured"));

  }
  serviceViewController = self->_serviceViewController;
  if (serviceViewController)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](serviceViewController, "serviceViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailCompositionValues dictionaryRepresentation](self->_compositionValues, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositionValues:", v6);

    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mf_dataForUICustomization");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUICustomizationData:", v8);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke;
    v11[3] = &unk_1E5A65480;
    v11[4] = self;
    -[MFMailComposeInternalViewController _processAttachmentsViaProxy:withHandler:](self, "_processAttachmentsViaProxy:withHandler:", v5, v11);

  }
}

void __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2;
  aBlock[3] = &unk_1E5A67BB0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceViewControllerProxyWithErrorHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2_94;
  v6[3] = &unk_1E5A66780;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "commitCompositionValuesWithReply:", v6);

}

void __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  const __CFString *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = "succeeded";
    if (v3)
      v5 = "failed";
    v6 = "";
    if (v3)
      v6 = " with error: ";
    *(_DWORD *)buf = 136315650;
    v11 = v5;
    v7 = &stru_1E5A6A588;
    if (v3)
      v7 = v3;
    v12 = 2080;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Committing composition values %s%s%@", buf, 0x20u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1072) |= 8u;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_92;
  v8[3] = &unk_1E5A65D00;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3 != 0;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_92(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishServiceViewControllerRequestWithSuccess:", *(_BYTE *)(a1 + 40) == 0);
}

uint64_t __68__MFMailComposeInternalViewController__configureRemoteViewContoller__block_invoke_2_94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_finishServiceViewControllerRequestWithSuccess:(BOOL)a3
{
  void *v5;

  if (a3)
  {
    if ((*((_BYTE *)self + 1072) & 8) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_remoteViewControllerIsConfigured"));

    }
    -[MFMailComposeInternalViewController _notifyBodyDidFinishLoadingWithResult:](self, "_notifyBodyDidFinishLoadingWithResult:", 1);
  }
  else
  {
    -[MFMailComposeInternalViewController _notifyBodyDidFinishLoadingWithResult:](self, "_notifyBodyDidFinishLoadingWithResult:");
    -[MFMailComposeInternalViewController compositionFinishedWithResult:error:](self, "compositionFinishedWithResult:error:", 0, 0);
  }
  if ((*((_BYTE *)self + 1072) & 0x10) == 0)
    -[MFMailComposeInternalViewController _loadContentViewControllerForcingPlaceholder:](self, "_loadContentViewControllerForcingPlaceholder:", 0);
  -[MFMailComposeInternalViewController _endDelayingCompositionPresentation](self, "_endDelayingCompositionPresentation");
}

- (void)_cancelComposition:(id)a3
{
  -[MFMailComposeInternalViewController _cancelRemoteServiceViewControllerRequest](self, "_cancelRemoteServiceViewControllerRequest", a3);
  -[MFMailComposeInternalViewController compositionFinishedWithResult:error:](self, "compositionFinishedWithResult:error:", 0, 0);
}

- (void)_cancelRemoteServiceViewControllerRequest
{
  _UIAsyncInvocation *cancellationInvocation;
  id v4;
  _UIAsyncInvocation *v5;

  cancellationInvocation = self->_cancellationInvocation;
  if (cancellationInvocation)
  {
    v4 = (id)-[_UIAsyncInvocation invoke](cancellationInvocation, "invoke");
    v5 = self->_cancellationInvocation;
    self->_cancellationInvocation = 0;

  }
}

- (void)compositionFinishedWithResult:(int64_t)a3 error:(id)a4
{
  int v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((*((_BYTE *)self + 1072) & 0x40) == 0)
  {
    *((_BYTE *)self + 1072) |= 0x40u;
    self->_composeResult = a3;
    objc_storeStrong((id *)&self->_composeResultError, a4);
    v7 = objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad") ^ 1;
    if (a3 != 2)
      LOBYTE(v7) = 1;
    if ((v7 & 1) == 0)
    {
      -[MFMailComposeInternalViewController parentViewController](self, "parentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setModalTransitionStyle:", 13);

    }
    if ((*((_BYTE *)self + 1072) & 0x20) != 0)
      -[MFMailComposeInternalViewController _notifyCompositionDidFinish](self, "_notifyCompositionDidFinish");
  }

}

- (void)compositionRequestsSendWithBody:(id)a3 recipients:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mailComposeController:shouldSendMail:toRecipients:completion:", v11, v12, v8, v9);

  }
  else
  {
    v9[2](v9, 1);
  }

}

- (void)setMailComposeDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mailComposeDelegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 0x80;
    else
      v6 = 0;
    *((_BYTE *)self + 1072) = v6 & 0x80 | *((_BYTE *)self + 1072) & 0x7F;
    v5 = obj;
  }

}

- (void)_notifyCompositionDidFinish
{
  NSObject *v4;
  int64_t composeResult;
  NSError *composeResultError;
  const __CFString *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  int64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  NSError *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 1072) & 0x40) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_didFinish"));

  }
  if ((*((_BYTE *)self + 1072) & 0x20) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 590, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_didAppear"));

  }
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    composeResult = self->_composeResult;
    composeResultError = self->_composeResultError;
    v7 = CFSTR(", error: ");
    if (!composeResultError)
      v7 = &stru_1E5A6A588;
    *(_DWORD *)buf = 134218498;
    if (!composeResultError)
      composeResultError = (NSError *)&stru_1E5A6A588;
    v13 = composeResult;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = composeResultError;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Notifying delegate that composition finished with result %ld%@%@", buf, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mailComposeController:didFinishWithResult:error:", v9, self->_composeResult, self->_composeResultError);

  }
}

- (void)_notifyBodyDidFinishLoadingWithResult:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  id WeakRetained;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "DID NOT";
    if (v3)
      v6 = "DID";
    v9 = 136315138;
    v10 = v6;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_INFO, "#CompositionServices Notifying delegate that composition message body %s finish loading", (uint8_t *)&v9, 0xCu);
  }

  if (*((char *)self + 1072) < 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
    -[MFMailComposeInternalViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "mailComposeController:bodyFinishedLoadingWithResult:error:", v8, v3, 0);

  }
}

- (void)compositionViewServiceTerminatedWithError:(id)a3
{
  -[MFMailComposeInternalViewController _cancelRemoteServiceViewControllerRequest](self, "_cancelRemoteServiceViewControllerRequest", a3);
  -[MFMailComposeInternalViewController _loadContentViewControllerForcingPlaceholder:](self, "_loadContentViewControllerForcingPlaceholder:", 1);
  -[MFMailComposeInternalViewController compositionFinishedWithResult:error:](self, "compositionFinishedWithResult:error:", 0, 0);
}

- (void)setURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MFMailCompositionValues setMailtoURL:](self->_compositionValues, "setMailtoURL:");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1C8]), "initWithURL:", v7);
  objc_msgSend(v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "subject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeInternalViewController _setPlaceHolderSubject:](self, "_setPlaceHolderSubject:", v6);

  }
}

- (void)setAutosaveIdentifier:(id)a3
{
  -[MFMailCompositionValues setAutosaveIdentifier:](self->_compositionValues, "setAutosaveIdentifier:", a3);
}

- (void)setSubject:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[MFMailCompositionValues setSubject:](self->_compositionValues, "setSubject:");
  -[MFMailComposeInternalViewController _setPlaceHolderSubject:](self, "_setPlaceHolderSubject:", v4);

}

- (void)setMessageBody:(id)a3 isHTML:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[MFMailCompositionValues setMessageBody:](self->_compositionValues, "setMessageBody:", v6);
    -[MFMailCompositionValues setIsHTML:](self->_compositionValues, "setIsHTML:", v4);
  }

}

- (void)setToRecipients:(id)a3
{
  -[MFMailCompositionValues setToRecipients:](self->_compositionValues, "setToRecipients:", a3);
}

- (void)setHideMyEmailFrom:(id)a3
{
  -[MFMailCompositionValues setHideMyEmailFrom:](self->_compositionValues, "setHideMyEmailFrom:", a3);
}

- (void)setCcRecipients:(id)a3
{
  -[MFMailCompositionValues setCcRecipients:](self->_compositionValues, "setCcRecipients:", a3);
}

- (void)setBccRecipients:(id)a3
{
  -[MFMailCompositionValues setBccRecipients:](self->_compositionValues, "setBccRecipients:", a3);
}

- (void)setPreferredSendingEmailAddress:(id)a3
{
  -[MFMailCompositionValues setPreferredSendingEmailAddress:](self->_compositionValues, "setPreferredSendingEmailAddress:", a3);
}

- (void)setShowKeyboardImmediately:(BOOL)a3
{
  -[MFMailCompositionValues setShowKeyboardImmediately:](self->_compositionValues, "setShowKeyboardImmediately:", a3);
}

- (void)setSourceAccountManagement:(int)a3
{
  -[MFMailCompositionValues setSourceAccountManagement:](self->_compositionValues, "setSourceAccountManagement:", *(_QWORD *)&a3);
}

- (void)setContentVisible:(BOOL)a3
{
  MFMailComposeRemoteViewController *serviceViewController;
  _QWORD v4[5];
  BOOL v5;

  serviceViewController = self->_serviceViewController;
  if (serviceViewController)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57__MFMailComposeInternalViewController_setContentVisible___block_invoke;
    v4[3] = &unk_1E5A65D00;
    v4[4] = self;
    v5 = a3;
    -[_UIRemoteViewController synchronizeAnimationsInActions:](serviceViewController, "synchronizeAnimationsInActions:", v4);
  }
  else
  {
    -[MFMailCompositionValues setShowContentImmediately:](self->_compositionValues, "setShowContentImmediately:", a3);
  }
}

void __57__MFMailComposeInternalViewController_setContentVisible___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "serviceViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentVisible:", *(unsigned __int8 *)(a1 + 40));

}

- (void)setCaretPosition:(unint64_t)a3
{
  -[MFMailCompositionValues setCaretPosition:](self->_compositionValues, "setCaretPosition:", a3);
}

- (id)addContentVariationWithName:(id)a3
{
  -[MFMailCompositionValues addContentVariationWithName:](self->_compositionValues, "addContentVariationWithName:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDefaultContentVariation:(id)a3
{
  unint64_t v4;
  BOOL v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_contentVariations, "indexOfObject:");
  if (self->_contentVariations)
    v5 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  self->_defaultContentVariationIndex = v4;

}

- (void)setUTITypes:(id)a3
{
  -[MFMailCompositionValues setUTITypes:](self->_compositionValues, "setUTITypes:", a3);
}

- (NSArray)UTITypes
{
  return -[MFMailCompositionValues UTITypes](self->_compositionValues, "UTITypes");
}

- (void)setPhotoIDs:(id)a3
{
  -[MFMailCompositionValues setPhotoIDs:](self->_compositionValues, "setPhotoIDs:", a3);
}

- (NSArray)photoIDs
{
  return -[MFMailCompositionValues photoIDs](self->_compositionValues, "photoIDs");
}

- (void)setCloudPhotoIDs:(id)a3
{
  -[MFMailCompositionValues setCloudPhotoIDs:](self->_compositionValues, "setCloudPhotoIDs:", a3);
}

- (NSArray)cloudPhotoIDs
{
  return -[MFMailCompositionValues cloudPhotoIDs](self->_compositionValues, "cloudPhotoIDs");
}

- (void)setContentText:(id)a3
{
  -[MFMailCompositionValues setContentText:](self->_compositionValues, "setContentText:", a3);
}

- (NSArray)contentText
{
  return -[MFMailCompositionValues contentText](self->_compositionValues, "contentText");
}

- (void)setContentURLs:(id)a3
{
  -[MFMailCompositionValues setContentURLs:](self->_compositionValues, "setContentURLs:", a3);
}

- (NSArray)contentURLs
{
  return -[MFMailCompositionValues contentURLs](self->_compositionValues, "contentURLs");
}

- (void)setShareSheetSessionID:(id)a3
{
  -[MFMailCompositionValues setShareSheetSessionID:](self->_compositionValues, "setShareSheetSessionID:", a3);
}

- (NSString)shareSheetSessionID
{
  return -[MFMailCompositionValues shareSheetSessionID](self->_compositionValues, "shareSheetSessionID");
}

- (void)_setCKShareURLWrapper:(id)a3 share:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v11 = a3;
  v10 = a4;
  -[MFMailCompositionValues setSharingSandboxingURLWrapper:](self->_compositionValues, "setSharingSandboxingURLWrapper:", v11);
  -[MFMailCompositionValues setCkShare:](self->_compositionValues, "setCkShare:", v10);
  -[MFMailCompositionValues setCkSharePermissionType:](self->_compositionValues, "setCkSharePermissionType:", a5);
  -[MFMailCompositionValues setCkShareAllowOthersToInvite:](self->_compositionValues, "setCkShareAllowOthersToInvite:", v6);

}

- (void)_setCKShare:(id)a3 setupContainerInfo:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a6;
  v11 = a3;
  v10 = a4;
  -[MFMailCompositionValues setCkShare:](self->_compositionValues, "setCkShare:", v11);
  -[MFMailCompositionValues setCkContainerSetupInfo:](self->_compositionValues, "setCkContainerSetupInfo:", v10);
  -[MFMailCompositionValues setCkSharePermissionType:](self->_compositionValues, "setCkSharePermissionType:", a5);
  -[MFMailCompositionValues setCkShareAllowOthersToInvite:](self->_compositionValues, "setCkShareAllowOthersToInvite:", v6);

}

- (id)addAttachmentFileURL:(id)a3 mimeType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSMutableArray *attachments;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 768, CFSTR("%s fileURL must not be nil."), "-[MFMailComposeInternalViewController addAttachmentFileURL:mimeType:]");

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 769, CFSTR("%s mimeType must not be nil."), "-[MFMailComposeInternalViewController addAttachmentFileURL:mimeType:]");

LABEL_3:
  +[MFMailComposeAttachmentWrapper wrapperWithFileURL:mimeType:](MFMailComposeAttachmentWrapper, "wrapperWithFileURL:mimeType:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  attachments = self->_attachments;
  if (!attachments)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = self->_attachments;
    self->_attachments = v12;

    attachments = self->_attachments;
  }
  -[NSMutableArray addObject:](attachments, "addObject:", v10);
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)addAttachmentData:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *attachments;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 784, CFSTR("%s mimeType must not be nil."), "-[MFMailComposeInternalViewController addAttachmentData:mimeType:fileName:]");

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 783, CFSTR("%s attachment must not be nil."), "-[MFMailComposeInternalViewController addAttachmentData:mimeType:fileName:]");

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 785, CFSTR("%s filename must not be nil."), "-[MFMailComposeInternalViewController addAttachmentData:mimeType:fileName:]");

LABEL_4:
  +[MFMailComposeAttachmentWrapper wrapperWithData:mimeType:fileName:](MFMailComposeAttachmentWrapper, "wrapperWithData:mimeType:fileName:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  attachments = self->_attachments;
  if (!attachments)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = self->_attachments;
    self->_attachments = v14;

    attachments = self->_attachments;
  }
  -[NSMutableArray addObject:](attachments, "addObject:", v12);
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)addAttachmentItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSMutableArray *attachments;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeInternalViewController.m"), 799, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemProvider"));

  }
  +[MFMailComposeAttachmentWrapper wrapperWithItemProvider:mimeType:fileName:](MFMailComposeAttachmentWrapper, "wrapperWithItemProvider:mimeType:fileName:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  attachments = self->_attachments;
  if (!attachments)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = self->_attachments;
    self->_attachments = v14;

    attachments = self->_attachments;
  }
  -[NSMutableArray addObject:](attachments, "addObject:", v12);
  objc_msgSend(v12, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)finalizeCompositionValues
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if ((*((_BYTE *)self + 1072) & 4) == 0)
  {
    v3 = (void *)-[NSMutableArray copy](self->_contentVariations, "copy");
    -[MFMailCompositionValues setContentVariations:](self->_compositionValues, "setContentVariations:", v3);

    -[MFMailCompositionValues setDefaultContentVariationIndex:](self->_compositionValues, "setDefaultContentVariationIndex:", self->_defaultContentVariationIndex);
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Finalizing composition values", v5, 2u);
    }

    *((_BYTE *)self + 1072) |= 4u;
    -[MFMailComposeInternalViewController _configureRemoteViewContoller](self, "_configureRemoteViewContoller");
  }
}

+ (BOOL)_canSendMailInNewScene
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad");
  if (v2)
    LOBYTE(v2) = MSCanSendMail();
  return v2;
}

- (void)_presentComposeInNewWindowFromComposeViewController:(id)a3 completion:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion___block_invoke;
  v4[3] = &unk_1E5A65480;
  v4[4] = self;
  -[MFMailComposeInternalViewController _presentComposeInNewWindowFromComposeViewController:completion:dissmisal:](self, "_presentComposeInNewWindowFromComposeViewController:completion:dissmisal:", a3, a4, v4);
}

void __102__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 1080);
  *(_QWORD *)(v1 + 1080) = 0;

}

- (void)_presentComposeInNewWindowFromComposeViewController:(id)a3 completion:(id)a4 dissmisal:(id)a5
{
  void *v5;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSXPCListener *listener;
  NSXPCListener *v15;
  NSXPCListener *v16;
  void *v17;
  id sceneDismissal;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[MFMailComposeInternalViewController mailComposeDelegate](self, "mailComposeDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    listener = self->_listener;
    if (!listener)
    {
      objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
      v15 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
      v16 = self->_listener;
      self->_listener = v15;

      -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
      -[NSXPCListener resume](self->_listener, "resume");
      listener = self->_listener;
    }
    -[NSXPCListener endpoint](listener, "endpoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = _Block_copy(v12);
    sceneDismissal = self->_sceneDismissal;
    self->_sceneDismissal = v17;

    objc_storeStrong((id *)&self->_composeViewController, a3);
  }
  v19 = objc_alloc(MEMORY[0x1E0D46AC8]);
  -[MFMailCompositionValues autosaveIdentifier](self->_compositionValues, "autosaveIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MFMailCompositionValues dictionaryRepresentation](self->_compositionValues, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithAutosaveIdentifier:compositionValues:attachments:", v21, v22, self->_attachments);

  if (!v20)
  {

  }
  MFLogGeneral();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v23, "autosaveIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v25;
    _os_log_impl(&dword_1AB96A000, v24, OS_LOG_TYPE_INFO, "#CompositionServices Present compose in new window with identifier: %{public}@", buf, 0xCu);

  }
  v26 = (void *)MEMORY[0x1E0D46AC0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion_dissmisal___block_invoke;
  v28[3] = &unk_1E5A67E90;
  v27 = v11;
  v29 = v27;
  objc_msgSend(v26, "presentNewMailWithContext:delegateEndpoint:completion:", v23, v13, v28);

}

void __112__MFMailComposeInternalViewController__presentComposeInNewWindowFromComposeViewController_completion_dissmisal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "ef_publicDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_INFO, "#CompositionServices Present compose in new window failed with error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);

}

- (void)composeShouldSendMail:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  MFMailComposeInternalViewController *v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v15, 3221225472, __85__MFMailComposeInternalViewController_composeShouldSendMail_toRecipients_completion___block_invoke, &unk_1E5A68A68, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performBlock:", &v15);

}

void __85__MFMailComposeInternalViewController_composeShouldSendMail_toRecipients_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mailComposeDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mailComposeController:shouldSendMail:toRecipients:completion:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)composeFinishedWithResult:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", MEMORY[0x1E0C809B0], 3221225472, __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke, &unk_1E5A65590, self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBlock:", &v4);

}

void __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = (uint64_t *)(a1 + 40);
  v3 = MFMailComposeResultMake(*(_QWORD *)(a1 + 40));
  if (v3 != *v2)
  {
    MFLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke_cold_1(v2, v4, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "mailComposeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailComposeController:didFinishWithResult:error:", v7, v3, 0);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 1080);
  if (v9)
  {
    (*(void (**)(void))(v9 + 16))();
    v8 = *(_QWORD *)(a1 + 32);
  }
  v10 = *(void **)(v8 + 976);
  *(_QWORD *)(v8 + 976) = 0;

  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 968);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setDelegate:", 0);
    objc_msgSend(v12, "invalidate");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 968);
    *(_QWORD *)(v13 + 968) = 0;

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.mobilemail.mailservices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    MSDEntitledOpenComposeProtocolDelegateXPCInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "resume");
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)requestFramesForAttachmentsWithIdentifiers:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MFMailComposeRemoteViewController *serviceViewController;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[5];
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_serviceViewController)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke;
    v24[3] = &unk_1E5A65EF8;
    v24[4] = &v25;
    v11 = objc_msgSend(v9, "beginBackgroundTaskWithExpirationHandler:", v24);

    v26[3] = v11;
    aBlock[0] = v10;
    aBlock[1] = 3221225472;
    aBlock[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_133;
    aBlock[3] = &unk_1E5A68AB8;
    aBlock[4] = self;
    v22 = v8;
    v23 = &v25;
    v12 = _Block_copy(aBlock);
    serviceViewController = self->_serviceViewController;
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_2;
    v19[3] = &unk_1E5A67E90;
    v14 = v12;
    v20 = v14;
    -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](serviceViewController, "serviceViewControllerProxyWithErrorHandler:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_3;
    v17[3] = &unk_1E5A68AE0;
    v16 = v14;
    v18 = v16;
    objc_msgSend(v15, "framesForAttachmentsWithIdentifiers:withReply:", v6, v17);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (requestFramesForAttachmentsWithIdentifiers)", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_133_cold_1();
    }

  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_135;
    v16[3] = &unk_1E5A68A90;
    v12 = v9;
    v17 = v12;
    v13 = v10;
    v18 = v13;
    v14 = v11;
    v19 = v14;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_135(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "CGRectValue");
  objc_msgSend(v6, "convertRect:fromView:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v7, v8);

}

uint64_t __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)autosaveWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MFMailComposeRemoteViewController *serviceViewController;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[4];
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;

  v4 = a3;
  v5 = v4;
  if (self->_serviceViewController)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0xAAAAAAAAAAAAAAAALL;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke;
    v21[3] = &unk_1E5A65EF8;
    v21[4] = &v22;
    v8 = objc_msgSend(v6, "beginBackgroundTaskWithExpirationHandler:", v21);

    v23[3] = v8;
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_140;
    aBlock[3] = &unk_1E5A68B08;
    v19 = v5;
    v20 = &v22;
    v9 = _Block_copy(aBlock);
    serviceViewController = self->_serviceViewController;
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_142;
    v16[3] = &unk_1E5A67E90;
    v11 = v9;
    v17 = v11;
    -[_UIRemoteViewController serviceViewControllerProxyWithErrorHandler:](serviceViewController, "serviceViewControllerProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_2;
    v14[3] = &unk_1E5A68B30;
    v13 = v11;
    v15 = v13;
    objc_msgSend(v12, "autosaveWithReply:", v14);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_INFO, "#CompositionServices Background task expired (autosaveWithHandler)", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

void __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_140(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_140_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

uint64_t __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)remoteViewController
{
  return self->_serviceViewController;
}

- (MFMailComposeViewControllerDelegate)mailComposeDelegate
{
  return (MFMailComposeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_mailComposeDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mailComposeDelegate);
  objc_storeStrong(&self->_sceneDismissal, 0);
  objc_storeStrong((id *)&self->_composeResultError, 0);
  objc_storeStrong((id *)&self->_placeholderSubject, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_compositionValues, 0);
  objc_storeStrong((id *)&self->_contentVariations, 0);
  objc_storeStrong((id *)&self->_cancellationInvocation, 0);
  objc_storeStrong((id *)&self->_serviceViewController, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_serviceViewControllerReady:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#CompositionServices _serviceViewControllerReady: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __79__MFMailComposeInternalViewController__processAttachmentsViaProxy_withHandler___block_invoke_cold_1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_1();
  *v1 = 138412290;
  *v3 = v2;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v5, (uint64_t)v3, "Failed to write placeholder for [%@]", v4);

  OUTLINED_FUNCTION_2_0();
}

void __65__MFMailComposeInternalViewController_composeFinishedWithResult___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, a2, a3, "#CompositionServices Remote compose window returned invalid result: %ld", (uint8_t *)&v4);
}

void __96__MFMailComposeInternalViewController_requestFramesForAttachmentsWithIdentifiers_resultHandler___block_invoke_133_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#CompositionServices requestFramesForAttachmentsWithIdentifiers: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __59__MFMailComposeInternalViewController_autosaveWithHandler___block_invoke_140_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#CompositionServices autosaveWithHandler: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

@end
