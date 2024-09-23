@implementation _SFICSPreviewViewController

- (_SFICSPreviewViewController)initWithFilePath:(id)a3 sourceURL:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  UIBarButtonItem *v21;
  UIBarButtonItem *activityBarButtonItem;
  UIBarButtonItem *v23;
  UIBarButtonItem *doneBarButtonItem;
  _SFICSPreviewViewController *v25;
  id obj;
  id v28;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v9 = v7;
    v10 = v8;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v9);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v12 = (void *)getEKEventStoreClass_softClass;
    v38 = getEKEventStoreClass_softClass;
    if (!getEKEventStoreClass_softClass)
    {
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __getEKEventStoreClass_block_invoke;
      v33 = &unk_1E4ABFC78;
      v34 = &v35;
      __getEKEventStoreClass_block_invoke((uint64_t)&v30);
      v12 = (void *)v36[3];
    }
    obj = a4;
    v28 = v8;
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v35, 8);
    v14 = objc_alloc_init(v13);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isURLManaged:", v10))
      v16 = 2;
    else
      v16 = 1;

    objc_msgSend(v14, "setSourceAccountManagement:", v16);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v17 = (void *)getEKICSPreviewControllerClass_softClass;
    v38 = getEKICSPreviewControllerClass_softClass;
    if (!getEKICSPreviewControllerClass_softClass)
    {
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __getEKICSPreviewControllerClass_block_invoke;
      v33 = &unk_1E4ABFC78;
      v34 = &v35;
      __getEKICSPreviewControllerClass_block_invoke((uint64_t)&v30);
      v17 = (void *)v36[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v35, 8);
    v19 = (void *)objc_msgSend([v18 alloc], "initWithData:eventStore:", v11, v14);
    objc_msgSend(v19, "setAllowsEditing:", 1);
    objc_msgSend(v19, "setAllowsImport:", 1);

    if (v19)
    {
      objc_msgSend(v19, "viewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29.receiver = self;
      v29.super_class = (Class)_SFICSPreviewViewController;
      self = -[_SFICSPreviewViewController initWithRootViewController:](&v29, sel_initWithRootViewController_, v20);

      v8 = v28;
      if (self)
      {
        objc_storeStrong((id *)&self->_filePath, a3);
        objc_storeStrong((id *)&self->_sourceURL, obj);
        objc_storeStrong((id *)&self->_icsController, v19);
        -[EKICSPreviewController setPreviewDelegate:](self->_icsController, "setPreviewDelegate:", self);
        v21 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__presentActivityViewController_);
        activityBarButtonItem = self->_activityBarButtonItem;
        self->_activityBarButtonItem = v21;

        v23 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
        doneBarButtonItem = self->_doneBarButtonItem;
        self->_doneBarButtonItem = v23;

        self = self;
        v25 = self;
      }
      else
      {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
      v8 = v28;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFICSPreviewViewController;
  -[_SFICSPreviewViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[_SFICSPreviewViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
}

- (void)viewWillDisappear:(BOOL)a3
{
  id beforeDismissHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFICSPreviewViewController;
  -[_SFICSPreviewViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (self->_beforeDismissHandler)
  {
    if (-[_SFICSPreviewViewController isBeingDismissed](self, "isBeingDismissed"))
    {
      (*((void (**)(void))self->_beforeDismissHandler + 2))();
      beforeDismissHandler = self->_beforeDismissHandler;
      self->_beforeDismissHandler = 0;

    }
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFICSPreviewViewController;
  -[_SFICSPreviewViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFICSPreviewViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFICSPreviewViewController;
  -[_SFICSPreviewViewController popViewControllerAnimated:](&v9, sel_popViewControllerAnimated_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_SFDeviceIsPad() & 1) == 0 && !v5)
  {
    -[_SFICSPreviewViewController topViewController](self, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFICSPreviewViewController bottomViewController](self, "bottomViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      -[_SFICSPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
  }
  return v5;
}

- (void)icsPreviewControllerWantsDismissal:(id)a3
{
  -[_SFICSPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentActivityViewController:(id)a3
{
  id v4;
  _SFOpenInOtherAppActivityViewController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, int);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = -[_SFOpenInOtherAppActivityViewController initWithFilePath:UTI:sourceURL:]([_SFOpenInOtherAppActivityViewController alloc], "initWithFilePath:UTI:sourceURL:", self->_filePath, CFSTR("com.apple.ical.ics"), self->_sourceURL);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __62___SFICSPreviewViewController__presentActivityViewController___block_invoke;
  v10 = &unk_1E4AC1878;
  objc_copyWeak(&v11, &location);
  -[_SFOpenInOtherAppActivityViewController setCompletionWithItemsHandler:](v5, "setCompletionWithItemsHandler:", &v7);
  -[_SFOpenInOtherAppActivityViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7, v7, v8, v9, v10);
  -[_SFOpenInOtherAppActivityViewController popoverPresentationController](v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonItem:", v4);

  -[_SFICSPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_done:(id)a3
{
  -[_SFICSPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_ensureLeftBarButtonItemsIncludesActivityItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (+[_SFOpenInOtherAppActivityViewController canOpenWithFilePath:UTI:sourceURL:](_SFOpenInOtherAppActivityViewController, "canOpenWithFilePath:UTI:sourceURL:", self->_filePath, CFSTR("com.apple.ical.ics"), self->_sourceURL))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftBarButtonItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "addObject:", v5);
    if ((objc_msgSend(v4, "containsObject:", self->_activityBarButtonItem) & 1) == 0)
      objc_msgSend(v4, "insertObject:atIndex:", self->_activityBarButtonItem, 0);
    objc_msgSend(v6, "setLeftBarButtonItems:", v4);

  }
}

- (void)_ensureLeftBarButtonItemsIncludesDoneItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  if ((objc_msgSend(v4, "containsObject:", self->_doneBarButtonItem) & 1) == 0)
    objc_msgSend(v4, "insertObject:atIndex:", self->_doneBarButtonItem, 0);
  objc_msgSend(v6, "setLeftBarButtonItems:", v4);

}

- (void)_updateNavigationBarItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[_SFICSPreviewViewController bottomViewController](self, "bottomViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");

  -[_SFICSPreviewViewController _ensureLeftBarButtonItemsIncludesActivityItem:](self, "_ensureLeftBarButtonItemsIncludesActivityItem:", v4);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v5 = (void *)getEKEventViewControllerClass_softClass;
  v11 = getEKEventViewControllerClass_softClass;
  if (!getEKEventViewControllerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getEKEventViewControllerClass_block_invoke;
    v7[3] = &unk_1E4ABFC78;
    v7[4] = &v8;
    __getEKEventViewControllerClass_block_invoke((uint64_t)v7);
    v5 = (void *)v9[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v8, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setShowsDoneButton:", 1);
  else
    -[_SFICSPreviewViewController _ensureLeftBarButtonItemsIncludesDoneItem:](self, "_ensureLeftBarButtonItemsIncludesDoneItem:", v4);

}

- (id)beforeDismissHandler
{
  return self->_beforeDismissHandler;
}

- (void)setBeforeDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beforeDismissHandler, 0);
  objc_storeStrong((id *)&self->_icsController, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
