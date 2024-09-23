@implementation CKAppContainerNavigationController

- (CKAppContainerNavigationController)initWithRemoteViewController:(id)a3
{
  id v5;
  CKAppContainerNavigationController *v6;
  CKAppContainerNavigationController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CKAppContainerTitleView *v12;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKAppContainerNavigationController;
  v6 = -[CKAppContainerNavigationController initWithRootViewController:](&v32, sel_initWithRootViewController_, v5);
  v7 = v6;
  if (v6)
  {
    -[CKAppContainerNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
    -[CKAppContainerNavigationController presentationController](v7, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA9A8], "mediumDetent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v9;
    objc_msgSend(MEMORY[0x1E0CEA9A8], "largeDetent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDetents:", v11);

    objc_msgSend(v8, "setDelegate:", v7);
    objc_msgSend(v8, "setPrefersGrabberVisible:", 1);
    v12 = objc_alloc_init(CKAppContainerTitleView);
    objc_msgSend(v5, "balloonPlugin");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppContainerNavigationController traitCollection](v7, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v14, "userInterfaceStyle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAppContainerTitleView setIconImage:](v12, "setIconImage:", v15);
    objc_msgSend(v5, "balloonPlugin");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "browserDisplayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAppContainerTitleView label](v12, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    -[CKAppContainerTitleView closeButton](v12, "closeButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forEvents:", v7, sel_closeButtonPressed_, 0x2000);

    objc_msgSend(v5, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitleView:", v12);

    -[CKAppContainerNavigationController navigationBar](v7, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_opt_new();
    objc_msgSend(v21, "setShadowImage:", v22);

    -[CKAppContainerNavigationController navigationBar](v7, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTranslucent:", 0);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v24 = objc_claimAutoreleasedReturnValue();
    -[CKAppContainerNavigationController view](v7, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v24);

    objc_msgSend(v5, "setSendDelegate:", v7);
    objc_storeStrong((id *)&v7->_browserVC, a3);
    -[CKAppContainerNavigationController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 2);
    -[CKAppContainerNavigationController presentationController](v7, "presentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v24) = objc_opt_isKindOfClass();

    if ((v24 & 1) != 0)
    {
      -[CKAppContainerNavigationController presentationController](v7, "presentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA9A8], "mediumDetent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v28;
      objc_msgSend(MEMORY[0x1E0CEA9A8], "largeDetent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDetents:", v30);

      objc_msgSend(v27, "setDelegate:", v7);
      objc_msgSend(v27, "setPrefersGrabberVisible:", 1);

    }
    -[CKAppContainerNavigationController transitionBrowserToMediumDetent](v7, "transitionBrowserToMediumDetent");

  }
  return v7;
}

- (void)closeButtonPressed:(id)a3
{
  -[CKAppContainerNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_sheetPresentationController:(id)a3 didChangeIndexOfCurrentDetent:(int64_t)a4
{
  if (a4 == 1)
    -[CKAppContainerNavigationController transitionBrowserToLargeDetent](self, "transitionBrowserToLargeDetent", a3);
  else
    -[CKAppContainerNavigationController transitionBrowserToMediumDetent](self, "transitionBrowserToMediumDetent", a3);
}

- (void)transitionBrowserToLargeDetent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CKAppContainerNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 0);
  -[CKBrowserViewControllerProtocol setAdditionalSafeAreaInsets:](self->_browserVC, "setAdditionalSafeAreaInsets:", 0.0, 0.0, 0.0, 0.0);
  -[CKAppContainerNavigationController browserVC](self, "browserVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKAppContainerNavigationController browserVC](self, "browserVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewWillTransitionToExpandedPresentation");

  }
  -[CKAppContainerNavigationController browserVC](self, "browserVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKAppContainerNavigationController browserVC](self, "browserVC");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewDidTransitionToExpandedPresentation");

  }
}

- (void)transitionBrowserToMediumDetent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[CKAppContainerNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
  -[CKBrowserViewControllerProtocol setAdditionalSafeAreaInsets:](self->_browserVC, "setAdditionalSafeAreaInsets:", 15.0, 0.0, 0.0, 0.0);
  -[CKAppContainerNavigationController browserVC](self, "browserVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKAppContainerNavigationController browserVC](self, "browserVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewWillTransitionToCompactPresentation");

  }
  -[CKAppContainerNavigationController browserVC](self, "browserVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[CKAppContainerNavigationController browserVC](self, "browserVC");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewDidTransitionToCompactPresentation");

  }
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a3;
  -[CKAppContainerNavigationController presentationController](self, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setSelectedDetentIdentifier:", *MEMORY[0x1E0CEBBB0]);
    -[CKAppContainerNavigationController transitionBrowserToLargeDetent](self, "transitionBrowserToLargeDetent");
  }
  else
  {
    objc_msgSend(v5, "setSelectedDetentIdentifier:", *MEMORY[0x1E0CEBBB8]);
    -[CKAppContainerNavigationController transitionBrowserToMediumDetent](self, "transitionBrowserToMediumDetent");
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__CKAppContainerNavigationController_requestPresentationStyleExpanded___block_invoke;
  v7[3] = &unk_1E274A208;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v7, 0.5);

}

void __71__CKAppContainerNavigationController_requestPresentationStyleExpanded___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (CKBrowserViewControllerProtocol)browserVC
{
  return self->_browserVC;
}

- (void)setBrowserVC:(id)a3
{
  objc_storeStrong((id *)&self->_browserVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserVC, 0);
}

@end
