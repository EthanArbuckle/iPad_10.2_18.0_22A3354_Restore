@implementation ASVInlineHostViewController

- (ASVInlineHostViewController)initWithUUID:(id)a3 child:(id)a4 fullscreenInlineService:(id)a5 canonicalWebPageURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ASVInlineHostViewController *v15;
  ASVInlineHostViewController *v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ASVInlineHostViewController;
  v15 = -[ASVInlineHostViewController init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_childVC, a4);
    objc_storeStrong((id *)&v16->_fullscreenService, a5);
    objc_storeStrong((id *)&v16->_canonicalWebPageURL, a6);
  }
  -[ASVInlineHostViewController queryShowShareSheetAndNotifyDidDismiss:](v16, "queryShowShareSheetAndNotifyDidDismiss:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel_handleConnectionInterrupted, CFSTR("ASVConnectionInterrupted"), 0);

  return v16;
}

- (void)viewDidLoad
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
  void *v15;
  objc_super v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)ASVInlineHostViewController;
  -[ASVInlineHostViewController viewDidLoad](&v16, sel_viewDidLoad);
  -[ASVInlineHostViewController addChildViewController:](self, "addChildViewController:", self->_childVC);
  -[ASVInlineHostViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_childVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[UIViewController didMoveToParentViewController:](self->_childVC, "didMoveToParentViewController:", self);
  -[UIViewController view](self->_childVC, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[ASVInlineHostViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3718];
  v19 = CFSTR("childView");
  -[UIViewController view](self->_childVC, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[childView]|"), 0, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v10);

  -[ASVInlineHostViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3718];
  v17 = CFSTR("childView");
  -[UIViewController view](self->_childVC, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[childView]|"), 0, 0, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConstraints:", v15);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ASVInlineHostViewController;
  v7 = a4;
  -[ASVInlineHostViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__ASVInlineHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E9F0CAD0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_3, v8);

}

uint64_t __82__ASVInlineHostViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestNewShareSheetFrame");
}

- (void)handleConnectionInterrupted
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__ASVInlineHostViewController_handleConnectionInterrupted__block_invoke;
  v2[3] = &unk_1E9F0C8A0;
  v2[4] = self;
  ASVRunInMainThread(v2);
}

uint64_t __58__ASVInlineHostViewController_handleConnectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)requestNewShareSheetFrame
{
  ARQLInlineService2 *fullscreenService;
  NSUUID *uuid;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  fullscreenService = self->_fullscreenService;
  uuid = self->_uuid;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke;
  v5[3] = &unk_1E9F0C960;
  objc_copyWeak(&v6, &location);
  -[ARQLInlineService2 sendARQLEvent:forUUID:completion:](fullscreenService, "sendARQLEvent:forUUID:completion:", &unk_1E9F29EA0, uuid, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke_2;
  v8[3] = &unk_1E9F0C938;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7 = v5;
  v9 = v7;
  ASVRunInMainThread(v8);

  objc_destroyWeak(&v10);
}

void __56__ASVInlineHostViewController_requestNewShareSheetFrame__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSString *v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  CGRect v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (WeakRetained[124])
    {
      v15 = WeakRetained;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("frame"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v15;
      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("frame"));
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        v16 = CGRectFromString(v4);
        x = v16.origin.x;
        y = v16.origin.y;
        width = v16.size.width;
        height = v16.size.height;

        objc_msgSend(v15, "presentedViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        WeakRetained = v15;
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v15, "presentedViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "popoverPresentationController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setSourceRect:", x, y, width, height);

          objc_msgSend(v15, "presentedViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "popoverPresentationController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "containerViewWillLayoutSubviews");

          WeakRetained = v15;
        }
      }
    }
  }

}

- (void)queryShowShareSheetAndNotifyDidDismiss:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  ARQLInlineService2 *fullscreenService;
  NSUUID *uuid;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location[2];

  if (self->_canonicalWebPageURL)
  {
    v3 = a3;
    v5 = (void *)objc_msgSend(&unk_1E9F29EC8, "mutableCopy");
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("didDismissActivityViewController"));
    objc_initWeak(location, self);
    fullscreenService = self->_fullscreenService;
    uuid = self->_uuid;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke;
    v10[3] = &unk_1E9F0C960;
    objc_copyWeak(&v11, location);
    -[ARQLInlineService2 sendARQLEvent:forUUID:completion:](fullscreenService, "sendARQLEvent:forUUID:completion:", v6, uuid, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);

  }
  else
  {
    v9 = _asvLogHandle;
    if (!_asvLogHandle)
    {
      ASVInitLogging();
      v9 = _asvLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D93A7000, v9, OS_LOG_TYPE_ERROR, "#Inline: No canonical web page provided, cannot show share sheet", (uint8_t *)location, 2u);
    }
  }
}

void __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke_2;
  v8[3] = &unk_1E9F0C938;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7 = v5;
  v9 = v7;
  ASVRunInMainThread(v8);

  objc_destroyWeak(&v10);
}

void __70__ASVInlineHostViewController_queryShowShareSheetAndNotifyDidDismiss___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSString *v3;
  double x;
  double y;
  double width;
  double height;
  _QWORD *WeakRetained;
  CGRect v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("frame"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("frame"));
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = CGRectFromString(v3);
      x = v9.origin.x;
      y = v9.origin.y;
      width = v9.size.width;
      height = v9.size.height;

      objc_msgSend(WeakRetained, "showShareSheet:frame:", WeakRetained[123], x, y, width, height);
    }
  }

}

- (void)showShareSheet:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  UIDocumentInteractionController *v10;
  UIDocumentInteractionController *documentInteractionController;
  UIDocumentInteractionController *v12;
  id v13;

  if (!self->_documentInteractionController)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v9 = a3;
    v10 = (UIDocumentInteractionController *)objc_opt_new();
    documentInteractionController = self->_documentInteractionController;
    self->_documentInteractionController = v10;

    -[UIDocumentInteractionController setURL:](self->_documentInteractionController, "setURL:", v9);
    -[UIDocumentInteractionController setDelegate:](self->_documentInteractionController, "setDelegate:", self);
    v12 = self->_documentInteractionController;
    -[ASVInlineHostViewController view](self, "view");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[UIDocumentInteractionController presentOptionsMenuFromRect:inView:animated:](v12, "presentOptionsMenuFromRect:inView:animated:", v13, 1, x, y, width, height);

  }
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(id)a3
{
  UIDocumentInteractionController *documentInteractionController;

  documentInteractionController = self->_documentInteractionController;
  self->_documentInteractionController = 0;

  -[ASVInlineHostViewController queryShowShareSheetAndNotifyDidDismiss:](self, "queryShowShareSheetAndNotifyDidDismiss:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullscreenService, 0);
  objc_storeStrong((id *)&self->_documentInteractionController, 0);
  objc_storeStrong((id *)&self->_canonicalWebPageURL, 0);
  objc_storeStrong((id *)&self->_childVC, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
