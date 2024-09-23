@implementation CNPhotoPickerActionsViewController

- (CNPhotoPickerActionsViewController)initWithActionsModel:(id)a3
{
  id v5;
  CNPhotoPickerActionsViewController *v6;
  CNPhotoPickerActionsViewController *v7;
  CNPhotoPickerActionsViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNPhotoPickerActionsViewController;
  v6 = -[CNPhotoPickerActionsViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionsModel, a3);
    -[CNPhotoPickerActionsModel setDelegate:](v7->_actionsModel, "setDelegate:", v7);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerActionsViewController;
  -[CNPhotoPickerActionsViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CNPhotoPickerActionsViewController actionsModel](self, "actionsModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsViewController layoutViewFromModel:](self, "layoutViewFromModel:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[CNPhotoPickerActionsViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)viewDidLayoutSubviews
{
  CNPhotoPickerActionsViewControllerLayout *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  CNPhotoPickerActionsViewControllerLayout *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CNPhotoPickerActionsViewController;
  -[CNPhotoPickerActionsViewController viewDidLayoutSubviews](&v21, sel_viewDidLayoutSubviews);
  v3 = [CNPhotoPickerActionsViewControllerLayout alloc];
  -[CNPhotoPickerActionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  -[CNPhotoPickerActionsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CNPhotoPickerActionsViewController buttonsView](self, "buttonsView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "arrangedSubviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CNPhotoPickerActionsViewControllerLayout initWithContainerSize:insets:buttonCount:](v3, "initWithContainerSize:insets:buttonCount:", objc_msgSend(v19, "count"), v6, v8, v11, v13, v15, v17);

  -[CNPhotoPickerActionsViewController applyLayout:](self, "applyLayout:", v20);
}

- (void)layoutViewFromModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
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
  char v22;
  void *v23;
  _QWORD v24[5];

  v4 = a3;
  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[CNPhotoPickerActionsViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = (void *)objc_msgSend(v6, "initWithFrame:");
    -[CNPhotoPickerActionsViewController setImageContainerView:](self, "setImageContainerView:", v8);

    v9 = objc_alloc_init(MEMORY[0x1E0CD2840]);
    -[CNPhotoPickerActionsViewController setClippingLayer:](self, "setClippingLayer:", v9);

    -[CNPhotoPickerActionsViewController clippingLayer](self, "clippingLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMask:", v10);

    -[CNPhotoPickerActionsViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

  }
  -[CNPhotoPickerActionsViewController actionsModel](self, "actionsModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "providerItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__CNPhotoPickerActionsViewController_layoutViewFromModel___block_invoke;
  v24[3] = &unk_1E204D958;
  v24[4] = self;
  objc_msgSend(v16, "thumbnailViewWithCompletion:", v24);

  -[CNPhotoPickerActionsViewController updateButtonsFromModel:](self, "updateButtonsFromModel:", v4);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone);
  -[CNPhotoPickerActionsViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRightBarButtonItem:", v17);

  -[CNPhotoPickerActionsViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setBackgroundHidden:", 1);

  -[CNPhotoPickerActionsViewController navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "navigationBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isTranslucent");

  if ((v22 & 1) == 0)
    -[CNPhotoPickerActionsViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[CNPhotoPickerActionsViewController currentLayout](self, "currentLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsViewController applyLayout:](self, "applyLayout:", v23);

}

- (void)updateButtonsFromModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "inlineActionButtons");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v8);
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setDistribution:", 1);
  objc_msgSend(v4, "setSpacing:", 10.0);
  -[CNPhotoPickerActionsViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  -[CNPhotoPickerActionsViewController buttonsView](self, "buttonsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNPhotoPickerActionsViewController buttonsView](self, "buttonsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

  }
  -[CNPhotoPickerActionsViewController setButtonsView:](self, "setButtonsView:", v4);

}

- (void)applyLayout:(id)a3
{
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
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  if (a3)
  {
    v27 = a3;
    objc_msgSend(v27, "imageContainerViewFrame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    v13 = (void *)MEMORY[0x1E0DC3508];
    -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    objc_msgSend(v13, "bezierPathWithOvalInRect:");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "CGPath");
    -[CNPhotoPickerActionsViewController clippingLayer](self, "clippingLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPath:", v16);

    objc_msgSend(v27, "actionButtonsViewFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[CNPhotoPickerActionsViewController buttonsView](self, "buttonsView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

    -[CNPhotoPickerActionsViewController setCurrentLayout:](self, "setCurrentLayout:", v27);
  }
}

- (void)didTapDone
{
  id v3;

  -[CNPhotoPickerActionsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoPickerActionsViewControllerDidFinish:", self);

}

- (void)presentDeleteConfirmationWithSourceView:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = (void *)MEMORY[0x1E0DC3450];
  v7 = a4;
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PHOTO_ACTION_DELETE"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 2, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12);
  v13 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v16);
  if (v28)
  {
    objc_msgSend(v8, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceView:", v28);

    objc_msgSend(v28, "bounds");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v8, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

    objc_msgSend(v8, "popoverPresentationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPermittedArrowDirections:", 15);

  }
  -[CNPhotoPickerActionsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)updateActionsModelWithProviderItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  -[CNPhotoPickerActionsViewController actionsModel](self, "actionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateProviderItem:", v4);

  -[CNPhotoPickerActionsViewController actionsModel](self, "actionsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CNPhotoPickerActionsViewController_updateActionsModelWithProviderItem___block_invoke;
  v8[3] = &unk_1E204D958;
  v8[4] = self;
  objc_msgSend(v7, "thumbnailViewWithCompletion:", v8);

}

- (double)duplicateScaleDuration
{
  return 0.504;
}

- (double)duplicateScaleDelay
{
  return 0.336;
}

- (double)deleteMoveInDuration
{
  return 0.42;
}

- (double)deleteMoveInDelay
{
  return 0.42;
}

- (void)performDeleteTransitionToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  CGFloat height;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v43;
  double v44;
  double v45;
  double v46;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v50[9];
  _QWORD v51[5];
  _QWORD v52[11];
  __int128 v53;
  CGRect v54;
  CGRect v55;

  v4 = a3;
  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPhotoPickerActionsViewController updateActionsModelWithProviderItem:](self, "updateActionsModelWithProviderItem:", v4);
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[CNPhotoPickerActionsViewController setTransitionContainerView:](self, "setTransitionContainerView:", v8);

  }
  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[CNPhotoPickerActionsViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;

  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v30, v23, v25, v27);

  v54.origin.x = v21;
  v54.origin.y = v23;
  v54.size.width = v25;
  v54.size.height = v27;
  v55 = CGRectInset(v54, -20.0, -20.0);
  y = v55.origin.y;
  x = v55.origin.x;
  width = v55.size.width;
  height = v55.size.height;
  -[CNPhotoPickerActionsViewController setTransitionContainerView:](self, "setTransitionContainerView:", v6);
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v21, v23, v25, v27);

  -[CNPhotoPickerActionsViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v35);

  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAlpha:", 0.0);

  v37 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke;
  v52[3] = &unk_1E204D9E8;
  v52[4] = self;
  *(CGFloat *)&v52[5] = x;
  *(CGFloat *)&v52[6] = y;
  *(CGFloat *)&v52[7] = width;
  *(CGFloat *)&v52[8] = height;
  *(double *)&v52[9] = v21 + v25 * 0.5;
  *(double *)&v52[10] = v23 + v27 * 0.5;
  __asm { FMOV            V0.2D, #1.0 }
  v53 = _Q0;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_4;
  v51[3] = &unk_1E204F320;
  v51[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v52, v51, 0.84, 0.0);
  v43 = (void *)MEMORY[0x1E0DC3F10];
  -[CNPhotoPickerActionsViewController deleteMoveInDuration](self, "deleteMoveInDuration");
  v45 = v44;
  -[CNPhotoPickerActionsViewController deleteMoveInDelay](self, "deleteMoveInDelay");
  v50[0] = v37;
  v50[1] = 3221225472;
  v50[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_27;
  v50[3] = &unk_1E204D9C0;
  v50[4] = self;
  *(double *)&v50[5] = v21;
  *(double *)&v50[6] = v23;
  *(double *)&v50[7] = v25;
  *(double *)&v50[8] = v27;
  objc_msgSend(v43, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v50, 0, v45, v46, 0.8, 0.0);

}

- (void)performDuplicateTransitionToItem:(id)a3 fromView:(id)a4 completionBlock:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  CGFloat x;
  _QWORD v50[5];
  _QWORD v51[5];
  id v52;
  _QWORD v53[13];
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGRect v57;
  CGRect v58;

  v7 = a5;
  objc_msgSend(a4, "snapshotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[CNPhotoPickerActionsViewController setTransitionContainerView:](self, "setTransitionContainerView:", v10);

    -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  }
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v58 = CGRectInset(v57, 20.0, 20.0);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;

  -[CNPhotoPickerActionsViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;

  memset(&v56, 0, sizeof(v56));
  CGAffineTransformMakeScale(&v56, 0.0, 0.0);
  -[CNPhotoPickerActionsViewController setTransitionContainerView:](self, "setTransitionContainerView:", v8);
  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

  -[CNPhotoPickerActionsViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerActionsViewController transitionContainerView](self, "transitionContainerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addSubview:", v39);

  v55 = v56;
  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v55;
  objc_msgSend(v40, "setTransform:", &v54);

  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setAlpha:", 0.0);

  v42 = MEMORY[0x1E0C809B0];
  v43 = (void *)MEMORY[0x1E0DC3F10];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke;
  v53[3] = &unk_1E204D9E8;
  v53[4] = self;
  *(CGFloat *)&v53[5] = x;
  *(CGFloat *)&v53[6] = y;
  *(CGFloat *)&v53[7] = width;
  *(CGFloat *)&v53[8] = height;
  v53[9] = v27;
  *(CGFloat *)&v53[10] = y;
  *(CGFloat *)&v53[11] = width;
  *(CGFloat *)&v53[12] = height;
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_5;
  v51[3] = &unk_1E204FB68;
  v51[4] = self;
  v52 = v7;
  v44 = v7;
  objc_msgSend(v43, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v53, v51, 0.84, 0.0);
  v45 = (void *)MEMORY[0x1E0DC3F10];
  -[CNPhotoPickerActionsViewController duplicateScaleDuration](self, "duplicateScaleDuration");
  v47 = v46;
  -[CNPhotoPickerActionsViewController duplicateScaleDelay](self, "duplicateScaleDelay");
  v50[0] = v42;
  v50[1] = 3221225472;
  v50[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_28;
  v50[3] = &unk_1E204F648;
  v50[4] = self;
  objc_msgSend(v45, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v50, 0, v47, v48, 0.6, 0.0);

}

- (void)actionsModel:(id)a3 didAssignToContact:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[CNPhotoPickerActionsViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoPickerActionsViewController:didPerformAction:withProviderItem:atIndexPath:", self, 0, v8, v7);

}

- (void)actionsModel:(id)a3 didEdit:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[CNPhotoPickerActionsViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoPickerActionsViewController:didPerformAction:withProviderItem:atIndexPath:", self, 1, v8, v7);

}

- (void)actionsModel:(id)a3 didDuplicate:(id)a4 atIndexPath:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[CNPhotoPickerActionsViewController imageContainerView](self, "imageContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__CNPhotoPickerActionsViewController_actionsModel_didDuplicate_atIndexPath_completionBlock___block_invoke;
  v16[3] = &unk_1E204E640;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  -[CNPhotoPickerActionsViewController performDuplicateTransitionToItem:fromView:completionBlock:](self, "performDuplicateTransitionToItem:fromView:completionBlock:", v15, v12, v16);

}

- (void)actionsModel:(id)a3 didDelete:(id)a4 atIndexPath:(id)a5 withSourceView:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__CNPhotoPickerActionsViewController_actionsModel_didDelete_atIndexPath_withSourceView___block_invoke;
  v13[3] = &unk_1E204F9D8;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[CNPhotoPickerActionsViewController presentDeleteConfirmationWithSourceView:withCompletion:](self, "presentDeleteConfirmationWithSourceView:withCompletion:", a6, v13);

}

- (CNPhotoPickerActionsViewControllerDelegate)delegate
{
  return (CNPhotoPickerActionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPhotoPickerActionsModel)actionsModel
{
  return self->_actionsModel;
}

- (void)setActionsModel:(id)a3
{
  objc_storeStrong((id *)&self->_actionsModel, a3);
}

- (UIStackView)buttonsView
{
  return self->_buttonsView;
}

- (void)setButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsView, a3);
}

- (UIView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainerView, a3);
}

- (UIView)transitionContainerView
{
  return self->_transitionContainerView;
}

- (void)setTransitionContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContainerView, a3);
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (CNPhotoPickerActionButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (CNPhotoPickerActionButton)duplicateButton
{
  return self->_duplicateButton;
}

- (void)setDuplicateButton:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateButton, a3);
}

- (CNPhotoPickerActionButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (CNPhotoPickerActionsViewControllerLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_duplicateButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_transitionContainerView, 0);
  objc_storeStrong((id *)&self->_imageContainerView, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __88__CNPhotoPickerActionsViewController_actionsModel_didDelete_atIndexPath_withSourceView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerActionsViewController:didPerformAction:withProviderItem:atIndexPath:", *(_QWORD *)(a1 + 32), 3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __92__CNPhotoPickerActionsViewController_actionsModel_didDuplicate_atIndexPath_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerActionsViewController:didPerformAction:withProviderItem:atIndexPath:", *(_QWORD *)(a1 + 32), 2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_2;
  v8[3] = &unk_1E204D9C0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, 0.1);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_3;
  v5[3] = &unk_1E204D9C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.2, 0.6);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_4;
  v4[3] = &unk_1E204F648;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.4, 0.5);
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_5(uint64_t a1, char a2)
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
  uint64_t v16;
  NSObject *v17;
  uint8_t v18[16];

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v3, "transitionContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "setTransitionContainerView:", 0);
    objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(void))(v16 + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEFAULT, "[CNPhotoPickerActionsViewController] Duplicate transtion interrupted unexpectedly!", v18, 2u);
    }

  }
}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_28(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __96__CNPhotoPickerActionsViewController_performDuplicateTransitionToItem_fromView_completionBlock___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_2;
  v8[3] = &unk_1E204D9C0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, 0.0, 0.1);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_3;
  v5[3] = &unk_1E204D9C0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 88);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.2, 0.3);
}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_4(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v3, "transitionContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "setTransitionContainerView:", 0);
    objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v15, OS_LOG_TYPE_DEFAULT, "[CNPhotoPickerActionsViewController] Delete transition interrupted unexpectedly!", buf, 2u);
    }

  }
}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_27(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  v5 = *(double *)(a1 + 56);
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);

}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

void __68__CNPhotoPickerActionsViewController_performDeleteTransitionToItem___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "transitionContainerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 0.0);

}

void __73__CNPhotoPickerActionsViewController_updateActionsModelWithProviderItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "imageContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_25_45434);

  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v4, "setFrame:", 0.0, 0.0, v9);

  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v4);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "actionsModel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateButtonsFromModel:", v13);

}

uint64_t __73__CNPhotoPickerActionsViewController_updateActionsModelWithProviderItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

void __58__CNPhotoPickerActionsViewController_layoutViewFromModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(*(id *)(a1 + 32), "imageContainerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v3);

}

+ (id)log
{
  if (log_cn_once_token_1_45459 != -1)
    dispatch_once(&log_cn_once_token_1_45459, &__block_literal_global_45460);
  return (id)log_cn_once_object_1_45461;
}

void __41__CNPhotoPickerActionsViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNPhotoPickerActions");
  v1 = (void *)log_cn_once_object_1_45461;
  log_cn_once_object_1_45461 = (uint64_t)v0;

}

@end
