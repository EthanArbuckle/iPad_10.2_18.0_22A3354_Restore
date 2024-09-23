@implementation CNVisualIdentityAvatarStyleEditorViewController

- (CNVisualIdentityAvatarStyleEditorViewController)initWithProviderItem:(id)a3 variantsManager:(id)a4
{
  id v7;
  id v8;
  CNVisualIdentityAvatarStyleEditorViewController *v9;
  CNVisualIdentityAvatarStyleEditorViewController *v10;
  CNVisualIdentityAvatarStyleEditorViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNVisualIdentityAvatarStyleEditorViewController;
  v9 = -[CNVisualIdentityAvatarStyleEditorViewController init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_providerItem, a3);
    objc_storeStrong((id *)&v10->_variantsManager, a4);
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNVisualIdentityAvatarStyleEditorViewController;
  -[CNVisualIdentityAvatarStyleEditorViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[CNVisualIdentityAvatarStyleEditorViewController setupEditableAvatarViewController](self, "setupEditableAvatarViewController");
  -[CNVisualIdentityAvatarStyleEditorViewController setupStyleCollectionView](self, "setupStyleCollectionView");
  +[CNUIColorRepository visualIdentityEditorBackgroundColor](CNUIColorRepository, "visualIdentityEditorBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)setupEditableAvatarViewController
{
  CNVisualIdentityEditablePrimaryAvatarViewController *v3;
  void *v4;
  void *v5;
  CNVisualIdentityEditablePrimaryAvatarViewController *v6;
  CNVisualIdentityEditablePrimaryAvatarViewController *editableAvatarViewController;
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
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v3 = [CNVisualIdentityEditablePrimaryAvatarViewController alloc];
  -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController variantsManager](self, "variantsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNVisualIdentityEditablePrimaryAvatarViewController initWithProviderItem:variantsManager:](v3, "initWithProviderItem:variantsManager:", v4, v5);
  editableAvatarViewController = self->_editableAvatarViewController;
  self->_editableAvatarViewController = v6;

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDesiredFontSize:", 110.0);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController addChildViewController:](self, "addChildViewController:", v12);

  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v15);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didMoveToParentViewController:", self);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 240.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController setAvatarViewSizeConstraint:](self, "setAvatarViewSizeConstraint:", v20);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 24.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController setAvatarViewTopConstraint:](self, "setAvatarViewTopConstraint:", v26);

  -[CNVisualIdentityAvatarStyleEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v45;
  -[CNVisualIdentityAvatarStyleEditorViewController avatarViewTopConstraint](self, "avatarViewTopConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v44;
  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v29;
  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerXAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v39);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapEditableAvatar_);
  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addGestureRecognizer:", v36);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;

  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v5 + v7;

  -[CNVisualIdentityAvatarStyleEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 >= 490.0)
  {
    objc_msgSend(v9, "setConstant:", 240.0);

    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 110.0;
  }
  else
  {
    objc_msgSend(v9, "setConstant:", 200.0);

    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = 90.0;
  }
  objc_msgSend(v11, "setDesiredFontSize:", v13);

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateTextFieldFontSize:", v13);

  -[CNVisualIdentityAvatarStyleEditorViewController avatarViewSizeConstraint](self, "avatarViewSizeConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  v16.receiver = self;
  v16.super_class = (Class)CNVisualIdentityAvatarStyleEditorViewController;
  -[CNVisualIdentityAvatarStyleEditorViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
}

- (void)setupStyleCollectionView
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3610]);
    objc_msgSend(v4, "setMinimumLineSpacing:", 16.0);
    v45 = v4;
    objc_msgSend(v4, "setScrollDirection:", 0);
    v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNVisualIdentityAvatarStyleEditorViewController setStyleCollectionView:](self, "setStyleCollectionView:", v6);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDataSource:", self);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    +[CNPhotoPickerCollectionViewCell cellIdentifier](CNPhotoPickerCollectionViewCell, "cellIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v12);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    v15 = *MEMORY[0x1E0DC48A8];
    +[CNVisualIdentityAvatarStyleSectionHeaderView reuseID](CNVisualIdentityAvatarStyleSectionHeaderView, "reuseID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v14, v15, v16);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlwaysBounceVertical:", 1);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentInsetAdjustmentBehavior:", 2);

    -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v22);

    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 24.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v39;
    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 20.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v34;
    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -20.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v26;
    -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
    -[CNVisualIdentityAvatarStyleEditorViewController generateProviderItems](self, "generateProviderItems");

  }
}

- (void)generateProviderItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conformsToProtocol:", &unk_1EE033250);

  -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setMonogramText:", &stru_1E20507A8);
    objc_msgSend(v4, "visualIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAbbreviatedName:", CFSTR(" "));

LABEL_5:
    v9 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v9, "copyWithStringRepresentation:", &stru_1E20507A8);
    goto LABEL_5;
  }
LABEL_6:
  -[CNVisualIdentityAvatarStyleEditorViewController variantsManager](self, "variantsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createVariantsItemsWithVariantsManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVisualIdentityAvatarStyleEditorViewController setVariantProviderItems:](self, "setVariantProviderItems:", v7);
  -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (id)updatedProviderItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE033250))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatedProviderItemWithText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "copy");
  }

  return v8;
}

- (void)didTapEditableAvatar:(id)a3
{
  if (-[CNVisualIdentityAvatarStyleEditorViewController isEmojiProviderItemType](self, "isEmojiProviderItemType", a3))
    -[CNVisualIdentityAvatarStyleEditorViewController dismissTextKeyboardIfNeeded](self, "dismissTextKeyboardIfNeeded");
  else
    -[CNVisualIdentityAvatarStyleEditorViewController dismissEmojiKeyboardIfNeeded](self, "dismissEmojiKeyboardIfNeeded");
  -[CNVisualIdentityAvatarStyleEditorViewController beginEditingAvatar](self, "beginEditingAvatar");
}

- (void)dismissTextKeyboardIfNeeded
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
    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEditing");

  }
}

- (void)dismissEmojiKeyboardIfNeeded
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

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC4F38]))
  {
    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEditing");

  }
}

- (void)beginEditingAvatar
{
  id v3;

  if (-[CNVisualIdentityAvatarStyleEditorViewController shouldBeginEditing](self, "shouldBeginEditing"))
  {
    -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginEditing");

  }
}

- (BOOL)shouldBeginEditing
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  char v8;

  -[CNVisualIdentityAvatarStyleEditorViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 1;
  objc_opt_class();
  -[CNVisualIdentityAvatarStyleEditorViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "isDisplayingTrapView");
  return v8 ^ 1;
}

- (BOOL)isEmojiProviderItemType
{
  void *v2;
  BOOL v3;

  -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "imageType") == 4;

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNVisualIdentityAvatarStyleEditorViewController variantProviderItems](self, "variantProviderItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = 86.0;
  v6 = 86.0;
  result.height = v6;
  result.width = v5;
  return result;
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
    -[CNVisualIdentityAvatarStyleEditorViewController variantProviderItems](self, "variantProviderItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__CNVisualIdentityAvatarStyleEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke;
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

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[CNVisualIdentityAvatarStyleEditorViewController calculateSectionSideInset](self, "calculateSectionSideInset", a3, a4, a5);
  v6 = v5;
  v7 = 12.0;
  v8 = 24.0;
  v9 = v6;
  result.right = v9;
  result.bottom = v8;
  result.left = v6;
  result.top = v7;
  return result;
}

- (double)calculateSectionSideInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setItemSize:", 86.0, 86.0);
  objc_msgSend(v4, "itemSize");
  v6 = v5 * 4.0 + 48.0;
  -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = (v8 - v6) * 0.5;

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v7 = a5;
  v8 = a4;
  -[CNVisualIdentityAvatarStyleEditorViewController styleCollectionView](self, "styleCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVisualIdentityAvatarStyleSectionHeaderView reuseID](CNVisualIdentityAvatarStyleSectionHeaderView, "reuseID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CNContactsUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PHOTO_TEXT_STYLE_EDITOR_STYLE_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  -[CNVisualIdentityAvatarStyleEditorViewController calculateSectionSideInset](self, "calculateSectionSideInset");
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 0.0, v15 + 24.0, 0.0, 0.0);
  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  if (a5)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PHOTO_TEXT_STYLE_EDITOR_STYLE_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNVisualIdentityAvatarStyleSectionHeaderView sizeWithText:](CNVisualIdentityAvatarStyleSectionHeaderView, "sizeWithText:", v8);
    v5 = v9;
    v6 = v10;

  }
  v11 = v5;
  v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CNPhotoPickerProviderItem *v10;
  void *v11;
  uint64_t v12;
  CNPhotoPickerProviderItem *providerItem;
  void *v14;
  void *v15;
  CNPhotoPickerProviderItem *v16;

  v16 = self->_providerItem;
  v6 = a4;
  -[CNVisualIdentityAvatarStyleEditorViewController variantProviderItems](self, "variantProviderItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (CNPhotoPickerProviderItem *)objc_msgSend(v9, "copy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNPhotoPickerProviderItem monogramText](v16, "monogramText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerProviderItem setMonogramText:](v10, "setMonogramText:", v11);
LABEL_7:

      goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CNPhotoPickerProviderItem stringRepresentation](v16, "stringRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CNPhotoPickerProviderItem copyWithStringRepresentation:](v10, "copyWithStringRepresentation:", v11);

      v10 = (CNPhotoPickerProviderItem *)v12;
      goto LABEL_7;
    }
  }
LABEL_8:
  providerItem = self->_providerItem;
  self->_providerItem = v10;

  -[CNVisualIdentityAvatarStyleEditorViewController editableAvatarViewController](self, "editableAvatarViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVisualIdentityAvatarStyleEditorViewController providerItem](self, "providerItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateWithProviderItem:", v15);

}

- (void)editableAvatarViewController:(id)a3 didUpdateWithProviderItem:(id)a4
{
  void *v5;
  id v6;
  CNPhotoPickerProviderItem *v7;
  CNPhotoPickerProviderItem *providerItem;
  id WeakRetained;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE033250))
    v5 = v10;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = (CNPhotoPickerProviderItem *)objc_msgSend(v10, "copy");
    providerItem = self->_providerItem;
    self->_providerItem = v7;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "avatarStyleEditor:didUpdateItem:", self, self->_providerItem);

  }
}

- (BOOL)editableAvatarViewControllerShouldBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNVisualIdentityAvatarStyleEditorViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_msgSend(v6, "isHidden") & 1) == 0
      && -[CNVisualIdentityAvatarStyleEditorViewController shouldBeginEditing](self, "shouldBeginEditing");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNPhotoPickerProviderItem)providerItem
{
  return self->_providerItem;
}

- (CNVisualIdentityEditablePrimaryAvatarViewController)editableAvatarViewController
{
  return self->_editableAvatarViewController;
}

- (CNVisualIdentityAvatarStyleEditorViewControllerDelegate)delegate
{
  return (CNVisualIdentityAvatarStyleEditorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionView)styleCollectionView
{
  return self->_styleCollectionView;
}

- (void)setStyleCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_styleCollectionView, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantProviderItems, 0);
  objc_storeStrong((id *)&self->_variantsManager, 0);
  objc_storeStrong((id *)&self->_avatarViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_avatarViewSizeConstraint, 0);
  objc_storeStrong((id *)&self->_styleCollectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editableAvatarViewController, 0);
  objc_storeStrong((id *)&self->_providerItem, 0);
}

uint64_t __89__CNVisualIdentityAvatarStyleEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithView:animation:", a2, 1);
}

@end
