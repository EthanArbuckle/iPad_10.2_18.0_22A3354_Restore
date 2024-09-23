@implementation CNVisualIdentityItemEditorViewController

- (CNVisualIdentityItemEditorViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7;
  id v8;
  CNVisualIdentityItemEditorViewController *v9;
  CNVisualIdentityItemEditorViewController *v10;
  CNVisualIdentityItemEditorViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVisualIdentityItemEditorViewController;
  v9 = -[CNVisualIdentityItemEditorViewController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_providerItem, a3);
    objc_storeStrong((id *)&v10->_variantsManager, a4);
    v10->_canCancel = 1;
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityItemEditorViewController;
  -[CNVisualIdentityItemEditorViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[CNVisualIdentityItemEditorViewController setupBarButtonItems](self, "setupBarButtonItems");
  -[CNVisualIdentityItemEditorViewController setupEditableAvatarViewController](self, "setupEditableAvatarViewController");
  -[CNVisualIdentityItemEditorViewController setupSegmentedControl](self, "setupSegmentedControl");
  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setupViewWithProviderItem:](self, "setupViewWithProviderItem:", v3);

  +[CNUIColorRepository visualIdentityEditorBackgroundColor](CNUIColorRepository, "visualIdentityEditorBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityItemEditorViewController;
  -[CNVisualIdentityItemEditorViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CNVisualIdentityItemEditorViewController setCanBeginEditing:](self, "setCanBeginEditing:", 1);
  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setUpFirstResponderForProviderItem:](self, "setUpFirstResponderForProviderItem:", v4);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNVisualIdentityItemEditorViewController;
  -[CNVisualIdentityItemEditorViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CNVisualIdentityItemEditorViewController updateFlowLayoutItemSize](self, "updateFlowLayoutItemSize");
}

- (void)keyboardWillShow:(id)a3
{
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

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNVisualIdentityItemEditorViewController adjustAvatarViewConstraintsForKeyboardFrame:](self, "adjustAvatarViewConstraintsForKeyboardFrame:", v7, v9, v11, v13);
}

- (void)adjustAvatarViewConstraintsForKeyboardFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
  {
    -[CNVisualIdentityItemEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConstant:", 200.0);

    -[CNVisualIdentityItemEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConstant:", 64.0);

    if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
    {
      if (-[CNVisualIdentityItemEditorViewController isEmojiProviderItemType](self, "isEmojiProviderItemType"))
      {
        -[CNVisualIdentityItemEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setConstant:", 32.0);

      }
      if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
      {
        -[CNVisualIdentityItemEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setConstant:", 120.0);

        -[CNVisualIdentityItemEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setConstant:", 42.0);

        if (-[CNVisualIdentityItemEditorViewController editorViewOverlapsWindowBasedKeyboardRect:](self, "editorViewOverlapsWindowBasedKeyboardRect:", v11, v13, v15, v17))
        {
          if (-[CNVisualIdentityItemEditorViewController isEmojiProviderItemType](self, "isEmojiProviderItemType"))
          {
            -[CNVisualIdentityItemEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setConstant:", 24.0);

          }
        }
      }
    }
    -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constant");
    -[CNVisualIdentityItemEditorViewController fontSizeForContainerSize:](self, "fontSizeForContainerSize:");
    objc_msgSend(v25, "updateTextFieldFontSize:");

  }
}

- (double)editorViewBottomYForAvatarSize:(double)a3 withContainerTopMargin:(double)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v9 - v11;

  v13 = 30.0;
  if (a3 <= 200.0)
    v13 = 20.0;
  v14 = v13 + v12 + a4 + a3;
  -[CNVisualIdentityItemEditorViewController segmentedControlHeightConstraint](self, "segmentedControlHeightConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constant");
  v17 = v16 + v14;

  return v17;
}

- (BOOL)editorViewOverlapsWindowBasedKeyboardRect:(CGRect)a3
{
  double y;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  y = a3.origin.y;
  -[CNVisualIdentityItemEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constant");
  v7 = v6;
  -[CNVisualIdentityItemEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constant");
  -[CNVisualIdentityItemEditorViewController editorViewBottomYForAvatarSize:withContainerTopMargin:](self, "editorViewBottomYForAvatarSize:withContainerTopMargin:", v7, v9);
  v11 = v10;

  return v11 > y;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNVisualIdentityItemEditorViewController;
  -[CNVisualIdentityItemEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (void)setupBarButtonItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  if (-[CNVisualIdentityItemEditorViewController canCancel](self, "canCancel"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didTapCancel);
    -[CNVisualIdentityItemEditorViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
  v5 = *MEMORY[0x1E0D13850];
  -[CNVisualIdentityItemEditorViewController doneButtonTitle](self, "doneButtonTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v8 = v7;
  if ((_DWORD)v5)
  {
    -[CNVisualIdentityItemEditorViewController doneButtonTitle](self, "doneButtonTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, self, sel_didTapDone);
    -[CNVisualIdentityItemEditorViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

  }
  else
  {
    v9 = (void *)objc_msgSend(v7, "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone);
    -[CNVisualIdentityItemEditorViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);
  }

  -[CNVisualIdentityItemEditorViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setBackgroundHidden:", 1);

  -[CNVisualIdentityItemEditorViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isTranslucent");

  if ((v15 & 1) == 0)
    -[CNVisualIdentityItemEditorViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
}

- (void)updateDoneButtonEnabledStateForText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x1E0D13850];
  objc_msgSend(a3, "_cn_trimmedString");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v8);
  -[CNVisualIdentityItemEditorViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

}

- (void)setupEditableAvatarViewController
{
  CNVisualIdentityEditablePrimaryAvatarViewController *v3;
  void *v4;
  void *v5;
  CNVisualIdentityEditablePrimaryAvatarViewController *v6;
  void *v7;
  double v8;
  double v9;
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
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  v3 = [CNVisualIdentityEditablePrimaryAvatarViewController alloc];
  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController variantsManager](self, "variantsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNVisualIdentityEditablePrimaryAvatarViewController initWithProviderItem:variantsManager:](v3, "initWithProviderItem:variantsManager:", v4, v5);
  -[CNVisualIdentityItemEditorViewController setEditableAvatarViewController:](self, "setEditableAvatarViewController:", v6);

  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[CNVisualIdentityItemEditorViewController textFieldFontSize](self, "textFieldFontSize");
  v9 = v8;
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDesiredFontSize:", v9);

  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController addChildViewController:](self, "addChildViewController:", v13);

  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v16);

  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "didMoveToParentViewController:", self);

  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController editableAvatarViewEdgeLength](self, "editableAvatarViewEdgeLength");
  objc_msgSend(v20, "constraintEqualToConstant:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setAvatarViewSizeConstraint:](self, "setAvatarViewSizeConstraint:", v21);

  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setAvatarViewTopConstraint:](self, "setAvatarViewTopConstraint:", v27);

  -[CNVisualIdentityItemEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v46;
  -[CNVisualIdentityItemEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v45;
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v30;
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v40);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapEditableAvatar_);
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addGestureRecognizer:", v37);

}

- (void)didTapEditableAvatar:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  if (v5 == 1)
  {
    -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEnabledForSegmentAtIndex:", 0);

    if (v7)
      -[CNVisualIdentityItemEditorViewController switchEditorToMode:](self, "switchEditorToMode:", 0);
  }
  else if (!v5)
  {
    if (-[CNVisualIdentityItemEditorViewController isEmojiProviderItemType](self, "isEmojiProviderItemType"))
      -[CNVisualIdentityItemEditorViewController forceEmojiKeyboardIfNeeded](self, "forceEmojiKeyboardIfNeeded");
    else
      -[CNVisualIdentityItemEditorViewController beginEditingAvatar](self, "beginEditingAvatar");
  }
}

- (void)forceEmojiKeyboardIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4F38]) & 1) == 0)
  {
    -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEditing");

  }
  -[CNVisualIdentityItemEditorViewController beginEditingAvatar](self, "beginEditingAvatar");

}

- (void)beginEditingAvatar
{
  id v3;

  if (-[CNVisualIdentityItemEditorViewController shouldBeginEditing](self, "shouldBeginEditing"))
  {
    -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginEditing");

  }
}

- (BOOL)shouldBeginEditing
{
  void *v3;
  char v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  char v10;

  if (-[CNVisualIdentityItemEditorViewController canBeginEditing](self, "canBeginEditing"))
  {
    -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsTextInputForCurrentEditorType");

  }
  else
  {
    v4 = 0;
  }
  -[CNVisualIdentityItemEditorViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    -[CNVisualIdentityItemEditorViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    v10 = objc_msgSend(v9, "isDisplayingTrapView");
    return v10 ^ 1;
  }
  return v4;
}

- (void)switchEditorToMode:(unint64_t)a3
{
  void *v5;
  id v6;

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedSegmentIndex:", a3);

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController didTapSegmentedControl:](self, "didTapSegmentedControl:", v6);

}

- (void)setupSegmentedControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
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
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE033250))
    v4 = v3;
  else
    v4 = 0;

  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVisualIdentityItemEditorSegmentedControl segmentedControlForItemType:](CNVisualIdentityItemEditorSegmentedControl, "segmentedControlForItemType:", objc_msgSend(v5, "imageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setSegmentedControl:](self, "setSegmentedControl:", v6);

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = 30.0;
  else
    v9 = 0.0;
  objc_msgSend(v7, "setHidden:", v4 == 0);

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_didTapSegmentedControl_, 4096);

  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setSegmentedControlHeightConstraint:](self, "setSegmentedControlHeightConstraint:", v15);

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController segmentedControlTopMargin](self, "segmentedControlTopMargin");
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v35;
  -[CNVisualIdentityItemEditorViewController segmentedControlHeightConstraint](self, "segmentedControlHeightConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v29;
  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v18;
  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
  -[CNVisualIdentityItemEditorViewController setupStyleCollectionView](self, "setupStyleCollectionView");

}

- (void)setupStyleCollectionView
{
  void *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
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
  double v37;
  double v38;
  double v39;
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
  void *v65;
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
  _QWORD v83[10];

  v83[8] = *MEMORY[0x1E0C80C00];
  if (-[CNVisualIdentityItemEditorViewController shouldShowStyleCollectionView](self, "shouldShowStyleCollectionView"))
  {
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DC3610]);
      objc_msgSend(v4, "setMinimumLineSpacing:", 8.0);
      objc_msgSend(v4, "setScrollDirection:", 0);
      v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
      v6 = *MEMORY[0x1E0C9D648];
      v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v10 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], v7, v8, v9);
      -[CNVisualIdentityItemEditorViewController setStyleCollectionView:](self, "setStyleCollectionView:", v10);

      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", self);

      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDataSource:", self);

      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", v15, v16);

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBackgroundColor:", v17);

      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlwaysBounceVertical:", 1);

      -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setContentInsetAdjustmentBehavior:", 3);

      -[CNVisualIdentityItemEditorViewController updateFlowLayoutItemSize](self, "updateFlowLayoutItemSize");
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
      -[CNVisualIdentityItemEditorViewController setStyleDividerView:](self, "setStyleDividerView:", v21);

      -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      +[CNUIColorRepository visualIdentityEditorDividerColor](CNUIColorRepository, "visualIdentityEditorDividerColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBackgroundColor:", v23);

      +[CNUIColorRepository photoPickerBackgroundShadowColor](CNUIColorRepository, "photoPickerBackgroundShadowColor");
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "CGColor");
      -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setShadowColor:", v26);

      -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = 1.0;
      objc_msgSend(v30, "setShadowOpacity:", v31);

      -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setShadowOffset:", 0.0, 1.0);

      -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setShadowRadius:", 0.5);

    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "scale");
    v38 = v37;

    if (v38 <= 0.0)
      v39 = 1.0;
    else
      v39 = 1.0 / v38;
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSubview:", v41);

    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addSubview:", v43);

    -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController styleContainerTopMargin](self, "styleContainerTopMargin");
    objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v78;
    -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v73;
    -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v68;
    -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "heightAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToConstant:", v39);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v83[3] = v65;
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 12.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v83[4] = v59;
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v83[5] = v54;
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v83[6] = v47;
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v83[7] = v52;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 8);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v60);
    -[CNVisualIdentityItemEditorViewController generateProviderItems](self, "generateProviderItems");

  }
}

- (void)setupViewWithProviderItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE033250))
    v5 = v4;
  else
    v5 = 0;
  v8 = v5;

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "setTextAndStyleMode");

    objc_msgSend(v8, "itemText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController updateDoneButtonEnabledStateForText:](self, "updateDoneButtonEnabledStateForText:", v6);
  }
  else
  {
    objc_msgSend(v6, "setStyleOnlyMode");
  }

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController didTapSegmentedControl:](self, "didTapSegmentedControl:", v7);

}

- (void)setUpFirstResponderForProviderItem:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE033250))
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
    -[CNVisualIdentityItemEditorViewController beginEditingAvatar](self, "beginEditingAvatar");

}

- (void)hideStyleCollectionView
{
  void *v3;
  id v4;

  -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CNVisualIdentityItemEditorViewController styleDividerView](self, "styleDividerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (BOOL)shouldShowStyleCollectionView
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityItemEditorViewController segmentedControl](self, "segmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSegmentIndex") == 1;

  return v3;
}

- (void)updateFlowLayoutItemSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  if (-[CNVisualIdentityItemEditorViewController shouldShowStyleCollectionView](self, "shouldShowStyleCollectionView"))
  {
    -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionViewLayout");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v4 = -[CNVisualIdentityItemEditorViewController numberOfItemsPerRow](self, "numberOfItemsPerRow");
    -[CNVisualIdentityItemEditorViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = (v6 + (double)(v4 + 1) * -20.0) / (double)v4;

    objc_msgSend(v8, "setItemSize:", v7, v7);
    objc_msgSend(v8, "invalidateLayout");

  }
}

- (int64_t)numberOfItemsPerRow
{
  void *v2;
  double v3;
  int64_t v4;

  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v3 <= 460.0)
    v4 = 4;
  else
    v4 = 6;

  return v4;
}

- (id)updatedProviderItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE033250))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatedProviderItemWithText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "copy");
  }

  return v8;
}

- (BOOL)isEmojiProviderItemType
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageType") == 4;

  return v3;
}

- (void)didTapCancel
{
  void *v3;
  id v4;

  -[CNVisualIdentityItemEditorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNVisualIdentityItemEditorViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualIdentityEditorControllerDidCancel:", self);

  }
  else
  {
    -[CNVisualIdentityItemEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)didTapDone
{
  void *v3;
  void *v4;
  id v5;

  -[CNVisualIdentityItemEditorViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNVisualIdentityItemEditorViewController updatedProviderItem](self, "updatedProviderItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visualIdentityEditorController:didFinishWithProviderItem:", self, v5);

  }
  else
  {
    -[CNVisualIdentityItemEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)didTapSegmentedControl:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "selectedSegmentIndex");
  if (v4 == 1)
  {
    -[CNVisualIdentityItemEditorViewController updatedProviderItem](self, "updatedProviderItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController setProviderItem:](self, "setProviderItem:", v5);

    -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endEditing");

    -[CNVisualIdentityItemEditorViewController setupStyleCollectionView](self, "setupStyleCollectionView");
  }
  else if (!v4)
  {
    -[CNVisualIdentityItemEditorViewController beginEditingAvatar](self, "beginEditingAvatar");
    -[CNVisualIdentityItemEditorViewController hideStyleCollectionView](self, "hideStyleCollectionView");
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return -[CNVisualIdentityItemEditorViewController shouldShowStyleCollectionView](self, "shouldShowStyleCollectionView", a3);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNVisualIdentityItemEditorViewController variantProviderItems](self, "variantProviderItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = a3;
  +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setCellStyle:", 1);
  if (v12)
  {
    -[CNVisualIdentityItemEditorViewController variantProviderItems](self, "variantProviderItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__CNVisualIdentityItemEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v19[3] = &unk_1E204D958;
    v15 = v12;
    v20 = v15;
    objc_msgSend(v14, "thumbnailViewWithCompletion:", v19);
    v16 = v15;

  }
  else
  {
    v17 = v10;
  }

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  -[CNVisualIdentityItemEditorViewController variantProviderItems](self, "variantProviderItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController setProviderItem:](self, "setProviderItem:", v8);

  objc_opt_class();
  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v14 = v10;

  if (v14)
    v11 = (id)objc_msgSend(v14, "generateImageDataIfNeeded");
  -[CNVisualIdentityItemEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithProviderItem:", v13);

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[CNVisualIdentityItemEditorViewController view](self, "view", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMargins");
  v8 = v7;
  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  v11 = v10;

  v12 = 0.0;
  v13 = 0.0;
  v14 = v8;
  v15 = v11;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

- (void)generateProviderItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conformsToProtocol:", &unk_1EE033250);

  -[CNVisualIdentityItemEditorViewController providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityItemEditorViewController variantsManager](self, "variantsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createVariantsItemsWithVariantsManager:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CNVisualIdentityItemEditorViewController_generateProviderItems__block_invoke;
  v8[3] = &unk_1E204C1A8;
  v8[4] = self;
  objc_msgSend(v7, "_cn_each:", v8);
  -[CNVisualIdentityItemEditorViewController setVariantProviderItems:](self, "setVariantProviderItems:", v7);
  -[CNVisualIdentityItemEditorViewController styleCollectionView](self, "styleCollectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)providerItemDidUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[CNVisualIdentityItemEditorViewController variantProviderItems](self, "variantProviderItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__CNVisualIdentityItemEditorViewController_providerItemDidUpdate___block_invoke;
    v9[3] = &unk_1E2050400;
    v9[4] = self;
    v10 = v7;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE033250))
    v5 = v9;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "itemText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityItemEditorViewController updateDoneButtonEnabledStateForText:](self, "updateDoneButtonEnabledStateForText:", v8);

  }
}

- (double)editableAvatarViewEdgeLength
{
  void *v2;
  double v3;
  double v4;

  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v3 <= 667.0)
    v4 = 200.0;
  else
    v4 = 240.0;

  return v4;
}

- (double)textFieldFontSize
{
  double result;

  -[CNVisualIdentityItemEditorViewController editableAvatarViewEdgeLength](self, "editableAvatarViewEdgeLength");
  -[CNVisualIdentityItemEditorViewController fontSizeForContainerSize:](self, "fontSizeForContainerSize:");
  return result;
}

- (double)fontSizeForContainerSize:(double)a3
{
  double result;

  if (-[CNVisualIdentityItemEditorViewController isEmojiProviderItemType](self, "isEmojiProviderItemType"))
    return a3 * 0.631578947;
  if (a3 == 240.0)
    return 120.0;
  result = 60.0;
  if (a3 == 200.0)
    return 100.0;
  return result;
}

- (double)segmentedControlTopMargin
{
  void *v2;
  double v3;
  double v4;

  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v3 <= 667.0)
    v4 = 20.0;
  else
    v4 = 30.0;

  return v4;
}

- (double)styleContainerTopMargin
{
  void *v2;
  double v3;
  double v4;

  -[CNVisualIdentityItemEditorViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  if (v3 <= 667.0)
    v4 = 36.0;
  else
    v4 = 43.0;

  return v4;
}

- (CNVisualIdentityItemEditorViewControllerDelegate)delegate
{
  return (CNVisualIdentityItemEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonTitle, a3);
}

- (BOOL)canCancel
{
  return self->_canCancel;
}

- (void)setCanCancel:(BOOL)a3
{
  self->_canCancel = a3;
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)editableAvatarViewController
{
  return self->_editableAvatarViewController;
}

- (void)setEditableAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_editableAvatarViewController, a3);
}

- (CNVisualIdentityItemEditorSegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (NSLayoutConstraint)avatarViewSizeConstraint
{
  return self->_avatarViewSizeConstraint;
}

- (void)setAvatarViewSizeConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewSizeConstraint, a3);
}

- (NSLayoutConstraint)avatarViewTopConstraint
{
  return self->_avatarViewTopConstraint;
}

- (void)setAvatarViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewTopConstraint, a3);
}

- (NSLayoutConstraint)segmentedControlHeightConstraint
{
  return self->_segmentedControlHeightConstraint;
}

- (void)setSegmentedControlHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControlHeightConstraint, a3);
}

- (UICollectionView)styleCollectionView
{
  return self->_styleCollectionView;
}

- (void)setStyleCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_styleCollectionView, a3);
}

- (UIView)styleDividerView
{
  return self->_styleDividerView;
}

- (void)setStyleDividerView:(id)a3
{
  objc_storeStrong((id *)&self->_styleDividerView, a3);
}

- (CNPhotoPickerVariantsManager)variantsManager
{
  return self->_variantsManager;
}

- (void)setVariantsManager:(id)a3
{
  objc_storeStrong((id *)&self->_variantsManager, a3);
}

- (NSArray)variantProviderItems
{
  return self->_variantProviderItems;
}

- (void)setVariantProviderItems:(id)a3
{
  objc_storeStrong((id *)&self->_variantProviderItems, a3);
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (void)setProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_providerItem, a3);
}

- (BOOL)canBeginEditing
{
  return self->_canBeginEditing;
}

- (void)setCanBeginEditing:(BOOL)a3
{
  self->_canBeginEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerItem, 0);
  objc_storeStrong((id *)&self->_variantProviderItems, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_styleDividerView, 0);
  objc_storeStrong((id *)&self->_styleCollectionView, 0);
  objc_storeStrong((id *)&self->_segmentedControlHeightConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewSizeConstraint, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_editableAvatarViewController, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __66__CNVisualIdentityItemEditorViewController_providerItemDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "styleCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadItemsAtIndexPaths:", v3);

}

void __65__CNVisualIdentityItemEditorViewController_generateProviderItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v10;
  else
    v7 = 0;
  v8 = v7;

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v6, "originalImageSize");
    objc_msgSend(v8, "setOriginalImageSize:");
  }
  objc_msgSend(v10, "setDelegate:", *(_QWORD *)(a1 + 32));

}

uint64_t __82__CNVisualIdentityItemEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithView:animation:", a2, 1);
}

@end
