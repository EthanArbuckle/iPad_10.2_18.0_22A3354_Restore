@implementation _SFContactPreviewViewController

- (_SFContactPreviewViewController)initWithFilePath:(id)a3 sourceURL:(id)a4 deleteFileWhenDone:(BOOL)a5 beforeDismissHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _SFContactPreviewViewController *v22;
  _SFContactPreviewViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id beforeDismissHandler;
  BOOL v31;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (objc_msgSend(v11, "length"))
  {
    v14 = (objc_class *)MEMORY[0x1E0C99D50];
    v15 = v11;
    v16 = (void *)objc_msgSend([v14 alloc], "initWithContentsOfFile:", v15);

    objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = a5;
    if (objc_msgSend(v17, "count"))
    {
      v18 = (void *)MEMORY[0x1E0C974D8];
      objc_msgSend(v17, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "viewControllerForUnknownContact:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setActions:", 32);
      objc_msgSend(v20, "setAllowsEditing:", 0);
      v21 = objc_alloc_init(MEMORY[0x1E0C97298]);
      objc_msgSend(v20, "setContactStore:", v21);

      objc_msgSend(v20, "setDisplayMode:", 1);
    }
    else
    {
      v20 = 0;
    }

    if (v20
      && (v32.receiver = self,
          v32.super_class = (Class)_SFContactPreviewViewController,
          v23 = -[_SFContactPreviewViewController initWithRootViewController:](&v32, sel_initWithRootViewController_, v20), (self = v23) != 0))
    {
      objc_storeStrong((id *)&v23->_filePath, a3);
      objc_storeStrong((id *)&self->_sourceURL, a4);
      objc_storeStrong((id *)&self->_contactViewController, v20);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__presentActivityViewController_);
      -[CNContactViewController navigationItem](self->_contactViewController, "navigationItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRightBarButtonItem:", v24);

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
      -[CNContactViewController navigationItem](self->_contactViewController, "navigationItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setLeftBarButtonItem:", v26);

      v28 = (void *)MEMORY[0x1A8598C40](v13);
      beforeDismissHandler = self->_beforeDismissHandler;
      self->_beforeDismissHandler = v28;

      self->_deleteFileWhenDone = v31;
      self = self;
      v22 = self;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_deleteFileWhenDone)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_web_removeFileOnlyAtPath:", self->_filePath);

  }
  v4.receiver = self;
  v4.super_class = (Class)_SFContactPreviewViewController;
  -[_SFContactPreviewViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void (**beforeDismissHandler)(void);
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFContactPreviewViewController;
  -[_SFContactPreviewViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  beforeDismissHandler = (void (**)(void))self->_beforeDismissHandler;
  if (beforeDismissHandler)
  {
    beforeDismissHandler[2]();
    v5 = self->_beforeDismissHandler;
    self->_beforeDismissHandler = 0;

  }
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
  v5 = -[_SFOpenInOtherAppActivityViewController initWithFilePath:UTI:sourceURL:]([_SFOpenInOtherAppActivityViewController alloc], "initWithFilePath:UTI:sourceURL:", self->_filePath, CFSTR("public.vcard"), self->_sourceURL);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __66___SFContactPreviewViewController__presentActivityViewController___block_invoke;
  v10 = &unk_1E4AC1878;
  objc_copyWeak(&v11, &location);
  -[_SFOpenInOtherAppActivityViewController setCompletionWithItemsHandler:](v5, "setCompletionWithItemsHandler:", &v7);
  -[_SFOpenInOtherAppActivityViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7, v7, v8, v9, v10);
  -[_SFOpenInOtherAppActivityViewController popoverPresentationController](v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonItem:", v4);

  -[_SFContactPreviewViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_done:(id)a3
{
  -[_SFContactPreviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beforeDismissHandler, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
