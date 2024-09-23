@implementation AXSSImageDescriptionViewController

- (AXSSImageDescriptionViewController)initWithContentSnapshot:(id)a3
{
  id v5;
  AXSSImageDescriptionViewController *v6;
  AXSSImageDescriptionViewController *v7;
  uint64_t v8;
  UIColor *contentBackgroundColor;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXSSImageDescriptionViewController;
  v6 = -[AXSSImageDescriptionViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentSnapshot, a3);
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v8 = objc_claimAutoreleasedReturnValue();
    contentBackgroundColor = v7->_contentBackgroundColor;
    v7->_contentBackgroundColor = (UIColor *)v8;

  }
  return v7;
}

- (void)setContentSnapshot:(id)a3
{
  UIView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AXSSImagePreviewViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v5 = (UIView *)a3;
  if (self->_contentSnapshot != v5)
  {
    objc_storeStrong((id *)&self->_contentSnapshot, a3);
    if (-[AXSSImageDescriptionViewController isUIReady](self, "isUIReady"))
    {
      -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

        -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromParentViewController");

        -[AXSSImageDescriptionViewController setImagePreviewController:](self, "setImagePreviewController:", 0);
      }
      if (v5)
      {
        v10 = -[AXSSImagePreviewViewController initWithContentSnapshot:]([AXSSImagePreviewViewController alloc], "initWithContentSnapshot:", v5);
        -[AXSSImagePreviewViewController setDelegate:](v10, "setDelegate:", self);
        -[AXSSImageDescriptionViewController addChildViewController:](self, "addChildViewController:", v10);
        -[AXSSImageDescriptionViewController view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSImagePreviewViewController view](v10, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSSImageDescriptionViewController navBar](self, "navBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertSubview:belowSubview:", v12, v13);

        -[AXSSImageDescriptionViewController setImagePreviewController:](self, "setImagePreviewController:", v10);
      }
      -[AXSSImageDescriptionViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsUpdateConstraints");

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __57__AXSSImageDescriptionViewController_setContentSnapshot___block_invoke;
      v15[3] = &unk_24E077190;
      v15[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v15, 0, 0.18, 0.0);
    }
  }

}

void __57__AXSSImageDescriptionViewController_setContentSnapshot___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)setContentBackgroundColor:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
  -[AXSSImageDescriptionViewController contentBackgroundView](self, "contentBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXSSImageDescriptionViewController contentBackgroundView](self, "contentBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
}

- (void)setImageDescription:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_imageDescription, a3);
  v5 = a3;
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void)saveChanges:(id)a3
{
  void *v4;
  id v5;

  if (!-[AXSSImageDescriptionViewController isSavingOrCancelling](self, "isSavingOrCancelling", a3))
  {
    -[AXSSImageDescriptionViewController setIsSavingOrCancelling:](self, "setIsSavingOrCancelling:", 1);
    -[AXSSImageDescriptionViewController _modifiedImageDescription](self, "_modifiedImageDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController setImageDescription:](self, "setImageDescription:", v4);

    -[AXSSImageDescriptionViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "imageDescriptionViewControllerDidSave:", self);
    -[AXSSImageDescriptionViewController setIsSavingOrCancelling:](self, "setIsSavingOrCancelling:", 0);

  }
}

- (void)cancelChanges:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(void *, _QWORD);
  void *v7;
  int v8;
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
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  char v34;
  _QWORD aBlock[4];
  id v36;
  id location[2];

  v4 = a3;
  if (!-[AXSSImageDescriptionViewController isSavingOrCancelling](self, "isSavingOrCancelling"))
  {
    -[AXSSImageDescriptionViewController setIsSavingOrCancelling:](self, "setIsSavingOrCancelling:", 1);
    objc_initWeak(location, self);
    v5 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke;
    aBlock[3] = &unk_24E0771B8;
    objc_copyWeak(&v36, location);
    v6 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    -[AXSSImageDescriptionViewController textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFirstResponder");

    if (v8)
    {
      -[AXSSImageDescriptionViewController textView](self, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resignFirstResponder");

    }
    if (-[AXSSImageDescriptionViewController _hasChanges](self, "_hasChanges"))
    {
      v32[0] = v5;
      v32[1] = 3221225472;
      v32[2] = __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_2;
      v32[3] = &unk_24E0771E0;
      v34 = v8;
      objc_copyWeak(&v33, location);
      v29 = _Block_copy(v32);
      v30[0] = v5;
      v30[1] = 3221225472;
      v30[2] = __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_3;
      v30[3] = &unk_24E0771B8;
      objc_copyWeak(&v31, location);
      v28 = _Block_copy(v30);
      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSImageDescriptionViewController navBar](self, "navBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "items");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leftBarButtonItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "popoverPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBarButtonItem:", v14);

      v16 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24E0835B0, CFSTR("AccessibilitySharedUISupport"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v19);

      v20 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Discard Changes"), &stru_24E0835B0, CFSTR("AccessibilitySharedUISupport"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 2, v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v23);

      v24 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24E0835B0, CFSTR("AccessibilitySharedUISupport"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v27);

      -[AXSSImageDescriptionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&v33);
    }
    else
    {
      v6[2](v6, 0);
    }
    -[AXSSImageDescriptionViewController setIsSavingOrCancelling:](self, "setIsSavingOrCancelling:", 0);

    objc_destroyWeak(&v36);
    objc_destroyWeak(location);
  }

}

void __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "imageDescriptionViewControllerDidCancel:", WeakRetained);

}

void __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "textView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "becomeFirstResponder");

  }
}

void __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "saveChanges:", WeakRetained);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[AXSSImageDescriptionViewController _imageDescriptionViewControllerSetupUI](self, "_imageDescriptionViewControllerSetupUI");
  -[AXSSImageDescriptionViewController _imageDescriptionViewControllerSetupConstraints](self, "_imageDescriptionViewControllerSetupConstraints");
  -[AXSSImageDescriptionViewController presentationController](self, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  v7[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)-[AXSSImageDescriptionViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v4, sel_traitEnvironment_didChangeTraitCollection_);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[AXSSImageDescriptionViewController imageDescription](self, "imageDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24E0835B0;
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, *MEMORY[0x24BEBE010], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__adjustViewToKeyboardFrame_, *MEMORY[0x24BEBE578], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__adjustViewToKeyboardFrame_, *MEMORY[0x24BEBE580], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canBecomeFirstResponder");

  if (v5)
  {
    -[AXSSImageDescriptionViewController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectedRange:", v9, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE010], 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstResponder");

  if (v9)
  {
    -[AXSSImageDescriptionViewController textScrollViewBottomConstraint](self, "textScrollViewBottomConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConstant:", -16.0);

    -[AXSSImageDescriptionViewController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resignFirstResponder");

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __89__AXSSImageDescriptionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v12[3] = &unk_24E077208;
    v12[4] = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v12);
  }

}

void __89__AXSSImageDescriptionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "textView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  -[AXSSImageDescriptionViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v12, "CGColor");
    -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v9);

  }
}

- (CGSize)preferredContentSize
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController preferredContentSize](&v13, sel_preferredContentSize);
  v4 = v3;
  v6 = v5;
  if (-[AXSSImageDescriptionViewController _hasFormView](self, "_hasFormView"))
  {
    -[AXSSImageDescriptionViewController _textViewMaxHeight](self, "_textViewMaxHeight");
    v8 = v7 + 32.0;
    -[AXSSImageDescriptionViewController navBar](self, "navBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v6 = v8 + CGRectGetHeight(v15);

    *(double *)&v4 = 600.0;
  }
  -[AXSSImageDescriptionViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsUpdateConstraints");

  v11 = *(double *)&v4;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateViewConstraints
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController updateViewConstraints](&v14, sel_updateViewConstraints);
  v3 = -[AXSSImageDescriptionViewController _hasFormView](self, "_hasFormView");
  -[AXSSImageDescriptionViewController textScrollViewFixedHeightConstraint](self, "textScrollViewFixedHeightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setActive:", 1);

    -[AXSSImageDescriptionViewController textScrollViewExpandingHeightConstraint](self, "textScrollViewExpandingHeightConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActive:", 1);

    -[AXSSImageDescriptionViewController textBackgroundViewFixedTopConstraint](self, "textBackgroundViewFixedTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "setActive:", 0);

    -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;
    v12 = v10 != 0;

    -[AXSSImageDescriptionViewController textScrollViewExpandingHeightConstraint](self, "textScrollViewExpandingHeightConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", v12);

    -[AXSSImageDescriptionViewController textBackgroundViewFixedTopConstraint](self, "textBackgroundViewFixedTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v11;
  }
  objc_msgSend(v7, "setActive:", v9);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[AXSSImageDescriptionViewController _layoutImagePreview](self, "_layoutImagePreview");
  -[AXSSImageDescriptionViewController _layoutContentBackground](self, "_layoutContentBackground");
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return !-[AXSSImageDescriptionViewController _hasChanges](self, "_hasChanges", a3);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  -[AXSSImageDescriptionViewController cancelChanges:](self, "cancelChanges:", self);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  -[AXSSImageDescriptionViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "imageDescriptionViewControllerDidDismiss:", self);

}

- (void)imagePreviewShouldExpand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[AXSSImageDescriptionViewController _hideKeyboard](self, "_hideKeyboard");
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__AXSSImageDescriptionViewController_textViewDidChange___block_invoke;
    v6[3] = &unk_24E077190;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v6);
  }
}

uint64_t __56__AXSSImageDescriptionViewController_textViewDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollTextViewCaretToVisibleRegion");
}

- (void)_adjustViewToKeyboardFrame:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  float v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  _QWORD v61[6];
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -16.0;
    if (!-[AXSSImageDescriptionViewController _hasFormView](self, "_hasFormView"))
    {
      objc_msgSend(v4, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEBE468]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGRectValue");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[AXSSImageDescriptionViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "convertRect:fromView:", 0, v10, v12, v14, v16);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      -[AXSSImageDescriptionViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSImageDescriptionViewController view](self, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      -[AXSSImageDescriptionViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "convertRect:fromView:", v38, v31, v33, v35, v37);
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;

      v62.origin.x = v40;
      v6 = -16.0;
      v62.origin.y = v42;
      v62.size.width = v44;
      v62.size.height = v46;
      v65.origin.x = v20;
      v65.origin.y = v22;
      v65.size.width = v24;
      v65.size.height = v26;
      v63 = CGRectIntersection(v62, v65);
      x = v63.origin.x;
      y = v63.origin.y;
      width = v63.size.width;
      height = v63.size.height;
      if (!CGRectIsNull(v63))
      {
        v64.origin.x = x;
        v64.origin.y = y;
        v64.size.width = width;
        v64.size.height = height;
        v6 = -16.0 - CGRectGetHeight(v64);
      }
    }
    -[AXSSImageDescriptionViewController textScrollViewBottomConstraint](self, "textScrollViewBottomConstraint");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constant");
    v53 = v52;

    if (v53 != v6)
    {
      objc_msgSend(v4, "userInfo");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", *MEMORY[0x24BEBE408]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "floatValue");
      v57 = v56;

      objc_msgSend(v4, "userInfo");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "objectForKey:", *MEMORY[0x24BEBE400]);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v59, "integerValue");

      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __65__AXSSImageDescriptionViewController__adjustViewToKeyboardFrame___block_invoke;
      v61[3] = &unk_24E077230;
      v61[4] = self;
      *(double *)&v61[5] = v6;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v60 << 16, v61, 0, v57, 0.0);
    }
  }

}

void __65__AXSSImageDescriptionViewController__adjustViewToKeyboardFrame___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textScrollViewBottomConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_modifiedImageDescription
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  -[AXSSImageDescriptionViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_24E0835B0;
  v7 = v6;

  return v7;
}

- (BOOL)_hasFormView
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AXSSImageDescriptionViewController presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "horizontalSizeClass") == 2 && objc_msgSend(v3, "verticalSizeClass") == 2;
  return v4;
}

- (BOOL)_hasChanges
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  char v8;

  -[AXSSImageDescriptionViewController imageDescription](self, "imageDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_24E0835B0;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  -[AXSSImageDescriptionViewController _modifiedImageDescription](self, "_modifiedImageDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", v7);

  return v8 ^ 1;
}

- (void)_hideKeyboard
{
  void *v3;
  int v4;
  id v5;

  -[AXSSImageDescriptionViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    -[AXSSImageDescriptionViewController textView](self, "textView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (void)_updateTextScrollViewConstraints
{
  uint64_t v3;
  _QWORD v4[6];

  -[AXSSImageDescriptionViewController _textViewMaxHeight](self, "_textViewMaxHeight");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__AXSSImageDescriptionViewController__updateTextScrollViewConstraints__block_invoke;
  v4[3] = &unk_24E077230;
  v4[4] = self;
  v4[5] = v3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, 0.18, 0.0);
}

void __70__AXSSImageDescriptionViewController__updateTextScrollViewConstraints__block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;
  id v6;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textScrollViewExpandingHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  v4 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "textScrollViewFixedHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (double)_textViewMaxHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;
  objc_msgSend(v3, "leading");
  v7 = v5 + v6;
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textContainerInset");
  v10 = v9 + v7 * 4.5;
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContainerInset");
  v13 = v10 + v12;

  return ceil(v13);
}

- (void)_layoutImagePreview
{
  void *v3;
  void *v4;
  double MinY;
  void *v6;
  double Width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    MinY = CGRectGetMinY(v14);

    -[AXSSImageDescriptionViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    Width = CGRectGetWidth(v15);

    -[AXSSImageDescriptionViewController navBar](self, "navBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEdgeInsets:", v10, 0.0, 0.0, 0.0);

    -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, fmax(MinY, 0.0));

  }
}

- (void)_layoutContentBackground
{
  void *v3;
  void *v4;
  double MinY;
  double v6;
  void *v7;
  double Width;
  void *v9;
  double Height;
  id v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  -[AXSSImageDescriptionViewController contentBackgroundView](self, "contentBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    MinY = CGRectGetMinY(v12);

    v6 = fmax(MinY, 0.0);
    -[AXSSImageDescriptionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    Width = CGRectGetWidth(v13);

    -[AXSSImageDescriptionViewController navBar](self, "navBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    Height = CGRectGetHeight(v14);

    -[AXSSImageDescriptionViewController contentBackgroundView](self, "contentBackgroundView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", 0.0, Height, Width, fmax(v6 - Height, 0.0));

  }
}

- (void)_imageDescriptionViewControllerSetupUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXSSImagePreviewViewController *v18;
  void *v19;
  AXSSImagePreviewViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  AXSSScrollViewEnclosedTextView *v39;
  AXSSScrollViewEnclosedTextView *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  -[AXSSImageDescriptionViewController contentBackgroundView](self, "contentBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AXSSImageDescriptionViewController contentBackgroundColor](self, "contentBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[AXSSImageDescriptionViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", v5, 0);

    -[AXSSImageDescriptionViewController setContentBackgroundView:](self, "setContentBackgroundView:", v5);
  }
  -[AXSSImageDescriptionViewController navBar](self, "navBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc(MEMORY[0x24BEBD788]);
    v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setDelegate:", self);
    v11 = objc_alloc(MEMORY[0x24BEBD7A8]);
    -[AXSSImageDescriptionViewController title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTitle:", v12);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_saveChanges_);
    objc_msgSend(v13, "setRightBarButtonItem:", v14);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelChanges_);
    objc_msgSend(v13, "setLeftBarButtonItem:", v15);

    v52[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItems:", v16);

    objc_msgSend(v10, "updateConstraintsIfNeeded");
    -[AXSSImageDescriptionViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v10);

    -[AXSSImageDescriptionViewController setNavBar:](self, "setNavBar:", v10);
  }
  -[AXSSImageDescriptionViewController imagePreviewController](self, "imagePreviewController");
  v18 = (AXSSImagePreviewViewController *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[AXSSImageDescriptionViewController contentSnapshot](self, "contentSnapshot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_9;
    v20 = [AXSSImagePreviewViewController alloc];
    -[AXSSImageDescriptionViewController contentSnapshot](self, "contentSnapshot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[AXSSImagePreviewViewController initWithContentSnapshot:](v20, "initWithContentSnapshot:", v21);

    -[AXSSImagePreviewViewController setDelegate:](v18, "setDelegate:", self);
    -[AXSSImageDescriptionViewController addChildViewController:](self, "addChildViewController:", v18);
    -[AXSSImageDescriptionViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImagePreviewViewController view](v18, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController navBar](self, "navBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertSubview:belowSubview:", v23, v24);

    -[AXSSImageDescriptionViewController setImagePreviewController:](self, "setImagePreviewController:", v18);
  }

LABEL_9:
  -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v26 = objc_alloc(MEMORY[0x24BEBDB00]);
    v27 = (void *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    objc_msgSend(v27, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderColor:", v29);

    objc_msgSend(v27, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v32);

    -[AXSSImageDescriptionViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v27);

    -[AXSSImageDescriptionViewController setTextBackgroundView:](self, "setTextBackgroundView:", v27);
  }
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    v35 = objc_alloc(MEMORY[0x24BEBD918]);
    v36 = (void *)objc_msgSend(v35, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v36);

    -[AXSSImageDescriptionViewController setTextScrollView:](self, "setTextScrollView:", v36);
  }
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    v39 = [AXSSScrollViewEnclosedTextView alloc];
    v40 = -[AXSSScrollViewEnclosedTextView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AXSSScrollViewEnclosedTextView setTranslatesAutoresizingMaskIntoConstraints:](v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AXSSScrollViewEnclosedTextView setAdjustsFontForContentSizeCategory:](v40, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSScrollViewEnclosedTextView setBackgroundColor:](v40, "setBackgroundColor:", v41);

    -[AXSSScrollViewEnclosedTextView setTextContainerInset:](v40, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSScrollViewEnclosedTextView setTextColor:](v40, "setTextColor:", v42);

    v43 = (void *)MEMORY[0x24BEBB520];
    v44 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "preferredFontForTextStyle:compatibleWithTraitCollection:", v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSScrollViewEnclosedTextView setFont:](v40, "setFont:", v46);

    -[AXSSScrollViewEnclosedTextView setScrollEnabled:](v40, "setScrollEnabled:", 0);
    -[AXSSScrollViewEnclosedTextView setDelegate:](v40, "setDelegate:", self);
    v47 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("Add Image Description"), &stru_24E0835B0, CFSTR("AccessibilitySharedUISupport"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v47, "initWithString:", v49);
    -[AXSSScrollViewEnclosedTextView setAttributedPlaceholder:](v40, "setAttributedPlaceholder:", v50);

    -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSubview:", v40);

    -[AXSSImageDescriptionViewController setTextView:](self, "setTextView:", v40);
  }
  -[AXSSImageDescriptionViewController setIsUIReady:](self, "setIsUIReady:", 1);
}

- (void)_imageDescriptionViewControllerSetupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
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
  double v31;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  _QWORD v89[12];

  v89[10] = *MEMORY[0x24BDAC8D0];
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = 1144733696;
  objc_msgSend(v7, "setPriority:", v8);
  -[AXSSImageDescriptionViewController textScrollViewExpandingHeightConstraint](self, "textScrollViewExpandingHeightConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController setTextScrollViewExpandingHeightConstraint:](self, "setTextScrollViewExpandingHeightConstraint:", v12);

    -[AXSSImageDescriptionViewController textScrollViewExpandingHeightConstraint](self, "textScrollViewExpandingHeightConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1148829696;
    objc_msgSend(v13, "setPriority:", v14);

  }
  -[AXSSImageDescriptionViewController textBackgroundViewFixedTopConstraint](self, "textBackgroundViewFixedTopConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController navBar](self, "navBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController setTextBackgroundViewFixedTopConstraint:](self, "setTextBackgroundViewFixedTopConstraint:", v20);

  }
  -[AXSSImageDescriptionViewController textScrollViewFixedHeightConstraint](self, "textScrollViewFixedHeightConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController setTextScrollViewFixedHeightConstraint:](self, "setTextScrollViewFixedHeightConstraint:", v24);

  }
  -[AXSSImageDescriptionViewController textScrollViewBottomConstraint](self, "textScrollViewBottomConstraint");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -16.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v31) = 1148829696;
    objc_msgSend(v30, "setPriority:", v31);
    -[AXSSImageDescriptionViewController setTextScrollViewBottomConstraint:](self, "setTextScrollViewBottomConstraint:", v30);

  }
  -[AXSSImageDescriptionViewController _updateTextScrollViewConstraints](self, "_updateTextScrollViewConstraints");
  v65 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[AXSSImageDescriptionViewController navBar](self, "navBar");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "topAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "safeAreaLayoutGuide");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "topAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v84);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v83;
  -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "topAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController view](self, "view");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "safeAreaLayoutGuide");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintGreaterThanOrEqualToAnchor:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v77;
  -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController view](self, "view");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v71;
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v64, 16.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v63;
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "safeAreaLayoutGuide");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v58, 16.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v89[4] = v57;
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController textBackgroundView](self, "textBackgroundView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "safeAreaLayoutGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, -16.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v89[5] = v51;
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "safeAreaLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:constant:", v32, -16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v89[6] = v33;
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v89[7] = v38;
  -[AXSSImageDescriptionViewController textScrollViewBottomConstraint](self, "textScrollViewBottomConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v89[8] = v39;
  v89[9] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v89, 10);
  v75 = v7;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "initWithArray:", v40);

  _NSDictionaryOfVariableBindings(CFSTR("_navBar, _textBackgroundView, _textView"), self->_navBar, self->_textBackgroundView, self->_textView, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_navBar]|"), 0, 0, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v42);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_textBackgroundView]|"), 0, 0, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v43);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_textView]|"), 0, 0, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v44);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_textView]|"), 0, 0, v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v45);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v66);
  -[AXSSImageDescriptionViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutIfNeeded");

}

- (void)_scrollTextViewCaretToVisibleRegion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  CGRect v26;

  -[AXSSImageDescriptionViewController textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSImageDescriptionViewController textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "caretRectForPosition:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  if (!CGRectIsEmpty(v26))
  {
    -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSImageDescriptionViewController textView](self, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[AXSSImageDescriptionViewController textScrollView](self, "textScrollView");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scrollRectToVisible:animated:", 0, v18, v20, v22, v24);

  }
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (AXSSImageDescriptionViewControllerDelegate)delegate
{
  return (AXSSImageDescriptionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (AXSSScrollViewEnclosedTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (AXSSImagePreviewViewController)imagePreviewController
{
  return self->_imagePreviewController;
}

- (void)setImagePreviewController:(id)a3
{
  objc_storeStrong((id *)&self->_imagePreviewController, a3);
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (UIScrollView)textScrollView
{
  return self->_textScrollView;
}

- (void)setTextScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_textScrollView, a3);
}

- (UIView)contentBackgroundView
{
  return self->_contentBackgroundView;
}

- (void)setContentBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundView, a3);
}

- (UIView)textBackgroundView
{
  return self->_textBackgroundView;
}

- (void)setTextBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_textBackgroundView, a3);
}

- (NSLayoutConstraint)textBackgroundViewBottomConstraint
{
  return self->_textBackgroundViewBottomConstraint;
}

- (void)setTextBackgroundViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textBackgroundViewBottomConstraint, a3);
}

- (NSLayoutConstraint)textBackgroundViewFixedTopConstraint
{
  return self->_textBackgroundViewFixedTopConstraint;
}

- (void)setTextBackgroundViewFixedTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textBackgroundViewFixedTopConstraint, a3);
}

- (NSLayoutConstraint)textScrollViewBottomConstraint
{
  return self->_textScrollViewBottomConstraint;
}

- (void)setTextScrollViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textScrollViewBottomConstraint, a3);
}

- (NSLayoutConstraint)textScrollViewExpandingHeightConstraint
{
  return self->_textScrollViewExpandingHeightConstraint;
}

- (void)setTextScrollViewExpandingHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textScrollViewExpandingHeightConstraint, a3);
}

- (NSLayoutConstraint)textScrollViewFixedHeightConstraint
{
  return self->_textScrollViewFixedHeightConstraint;
}

- (void)setTextScrollViewFixedHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textScrollViewFixedHeightConstraint, a3);
}

- (BOOL)isSavingOrCancelling
{
  return self->_isSavingOrCancelling;
}

- (void)setIsSavingOrCancelling:(BOOL)a3
{
  self->_isSavingOrCancelling = a3;
}

- (BOOL)isUIReady
{
  return self->_isUIReady;
}

- (void)setIsUIReady:(BOOL)a3
{
  self->_isUIReady = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textScrollViewFixedHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textScrollViewExpandingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textBackgroundViewFixedTopConstraint, 0);
  objc_storeStrong((id *)&self->_textBackgroundViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_textScrollView, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_imagePreviewController, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageDescription, 0);
}

@end
