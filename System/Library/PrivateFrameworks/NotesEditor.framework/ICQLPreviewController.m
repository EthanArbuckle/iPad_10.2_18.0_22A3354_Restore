@implementation ICQLPreviewController

- (ICQLPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ICQLPreviewController *v4;
  ICQLPreviewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQLPreviewController;
  v4 = -[QLPreviewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[ICQLPreviewController commonInit](v4, "commonInit");
  return v5;
}

- (ICQLPreviewController)initWithCoder:(id)a3
{
  ICQLPreviewController *v3;
  ICQLPreviewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQLPreviewController;
  v3 = -[ICQLPreviewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICQLPreviewController commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_hideViewOnlyButton, 1, 1, 5.0);
  -[ICQLPreviewController setHideViewOnlyDocumentButtonSelectorDelayer:](self, "setHideViewOnlyDocumentButtonSelectorDelayer:", v3);

  -[ICQLPreviewController registerForTraitChanges](self, "registerForTraitChanges");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICQLPreviewController;
  -[QLPreviewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[QLPreviewController internalNavigationController](self, "internalNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHidesShadow:", 1);

  -[QLPreviewController toolbarController](self, "toolbarController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalToolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setHidesShadow:", 1);

  -[QLPreviewController toolbarController](self, "toolbarController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "customToolbar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setHidesShadow:", 1);

  -[ICQLPreviewController updateBackgroundColor](self, "updateBackgroundColor");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQLPreviewController;
  -[QLPreviewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[ICQLPreviewController hideViewOnlyDocumentButtonSelectorDelayer](self, "hideViewOnlyDocumentButtonSelectorDelayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFire");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQLPreviewController;
  -[QLPreviewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[ICQLPreviewController viewOnlyDocumentButtonIsVisible](self, "viewOnlyDocumentButtonIsVisible"))
  {
    -[ICQLPreviewController viewOnlyDocumentButton](self, "viewOnlyDocumentButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
}

- (void)updateBackgroundColor
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[ICQLPreviewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_appearanceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDark");

  if (v5)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "ICBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[QLPreviewController setBackgroundColor:](self, "setBackgroundColor:", v6);

}

- (void)registerForTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)-[ICQLPreviewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v3, sel_updateBackgroundColor);

}

- (UIButton)viewOnlyDocumentButton
{
  UIButton *viewOnlyDocumentButton;
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
  UIButton *v16;
  UIButton *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  viewOnlyDocumentButton = self->_viewOnlyDocumentButton;
  if (!viewOnlyDocumentButton)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3428];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __47__ICQLPreviewController_viewOnlyDocumentButton__block_invoke;
    v22 = &unk_1EA7DF3F8;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v4, "actionWithHandler:", &v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", v19, v20, v21, v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("This document is view only."), &stru_1EA7E9860, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBaseForegroundColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "background");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "background");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStrokeColor:", v12);

    objc_msgSend(v8, "background");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStrokeWidth:", 1.0);

    objc_msgSend(v8, "setCornerStyle:", 4);
    objc_msgSend(v8, "setButtonSize:", 1);
    objc_msgSend(v8, "setTitleAlignment:", 1);
    objc_msgSend(v8, "setTitle:", v7);
    objc_msgSend(v8, "setAccessibilityLabel:", v7);
    objc_msgSend(v8, "contentInsets");
    objc_msgSend(v8, "setContentInsets:", 6.0, 12.0, 6.0, 12.0);
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_largeSystemImageNamed:", CFSTR("info.circle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v15);

    objc_msgSend(v8, "setImagePadding:", 4.0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v8, v5);
    v16 = (UIButton *)objc_claimAutoreleasedReturnValue();
    -[UIButton ic_applyShadow](v16, "ic_applyShadow");
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = self->_viewOnlyDocumentButton;
    self->_viewOnlyDocumentButton = v16;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    viewOnlyDocumentButton = self->_viewOnlyDocumentButton;
  }
  return viewOnlyDocumentButton;
}

void __47__ICQLPreviewController_viewOnlyDocumentButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showViewOnlyDocumentPopover");

}

- (void)hideViewOnlyButton
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__ICQLPreviewController_hideViewOnlyButton__block_invoke;
  v3[3] = &unk_1EA7DD2D8;
  v3[4] = self;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__ICQLPreviewController_hideViewOnlyButton__block_invoke_2;
  v2[3] = &unk_1EA7DE700;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v3, v2, 0.25);
}

void __43__ICQLPreviewController_hideViewOnlyButton__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewOnlyDocumentButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __43__ICQLPreviewController_hideViewOnlyButton__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewOnlyDocumentButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 1);

    objc_msgSend(*(id *)(a1 + 32), "viewOnlyDocumentButton");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

  }
}

- (BOOL)viewOnlyDocumentButtonIsVisible
{
  UIButton *viewOnlyDocumentButton;
  void *v3;
  BOOL v4;

  viewOnlyDocumentButton = self->_viewOnlyDocumentButton;
  if (!viewOnlyDocumentButton)
    return 0;
  -[UIButton window](viewOnlyDocumentButton, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__ICQLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1EA7DD1E8;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, 0);
  v8.receiver = self;
  v8.super_class = (Class)ICQLPreviewController;
  -[QLPreviewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

void __76__ICQLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "bottomButtonSpacing");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "bottomButtonConstraint");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", v3);

}

- (double)bottomButtonSpacing
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  -[ICQLPreviewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_hasCompactSize");

  -[ICQLPreviewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  result = -40.0;
  if ((v4 & (v9 > v7)) != 0)
    return -100.0;
  return result;
}

- (void)showViewOnlyWarning
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
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!-[ICQLPreviewController viewOnlyDocumentButtonIsVisible](self, "viewOnlyDocumentButtonIsVisible"))
  {
    -[ICQLPreviewController viewOnlyDocumentButton](self, "viewOnlyDocumentButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

    -[ICQLPreviewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLPreviewController viewOnlyDocumentButton](self, "viewOnlyDocumentButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[ICQLPreviewController viewOnlyDocumentButton](self, "viewOnlyDocumentButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLPreviewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLPreviewController bottomButtonSpacing](self, "bottomButtonSpacing");
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLPreviewController setBottomButtonConstraint:](self, "setBottomButtonConstraint:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[ICQLPreviewController viewOnlyDocumentButton](self, "viewOnlyDocumentButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLPreviewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    -[ICQLPreviewController bottomButtonConstraint](self, "bottomButtonConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v18);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__ICQLPreviewController_showViewOnlyWarning__block_invoke;
    v19[3] = &unk_1EA7DD2D8;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v19, 0, 0.25);
  }
}

void __44__ICQLPreviewController_showViewOnlyWarning__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewOnlyDocumentButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)showViewOnlyDocumentPopover
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICQLPreviewController hideViewOnlyDocumentButtonSelectorDelayer](self, "hideViewOnlyDocumentButtonSelectorDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  -[ICQLPreviewController viewOnlyDocumentButton](self, "viewOnlyDocumentButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICViewOnlyPopoverViewController viewOnlyPopoverViewController:sourceView:](ICViewOnlyPopoverViewController, "viewOnlyPopoverViewController:sourceView:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLPreviewController setViewOnlyPopoverController:](self, "setViewOnlyPopoverController:", v5);

  -[ICQLPreviewController viewOnlyPopoverController](self, "viewOnlyPopoverController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"), 0);

}

- (void)popoverDidDismiss
{
  void *v3;
  id v4;

  -[ICQLPreviewController viewOnlyPopoverController](self, "viewOnlyPopoverController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromParentViewController");

  -[ICQLPreviewController hideViewOnlyDocumentButtonSelectorDelayer](self, "hideViewOnlyDocumentButtonSelectorDelayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestFire");

}

- (void)setViewOnlyDocumentButton:(id)a3
{
  objc_storeStrong((id *)&self->_viewOnlyDocumentButton, a3);
}

- (ICSelectorDelayer)hideViewOnlyDocumentButtonSelectorDelayer
{
  return self->_hideViewOnlyDocumentButtonSelectorDelayer;
}

- (void)setHideViewOnlyDocumentButtonSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_hideViewOnlyDocumentButtonSelectorDelayer, a3);
}

- (CGRect)viewOnlyDocumentButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_viewOnlyDocumentButtonFrame.origin.x;
  y = self->_viewOnlyDocumentButtonFrame.origin.y;
  width = self->_viewOnlyDocumentButtonFrame.size.width;
  height = self->_viewOnlyDocumentButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSLayoutConstraint)bottomButtonConstraint
{
  return self->_bottomButtonConstraint;
}

- (void)setBottomButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomButtonConstraint, a3);
}

- (ICViewOnlyPopoverViewController)viewOnlyPopoverController
{
  return self->_viewOnlyPopoverController;
}

- (void)setViewOnlyPopoverController:(id)a3
{
  objc_storeStrong((id *)&self->_viewOnlyPopoverController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewOnlyPopoverController, 0);
  objc_storeStrong((id *)&self->_bottomButtonConstraint, 0);
  objc_storeStrong((id *)&self->_hideViewOnlyDocumentButtonSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_viewOnlyDocumentButton, 0);
}

@end
