@implementation CNPhotoPickerHeaderView

- (CNPhotoPickerHeaderView)initWithContact:(id)a3
{
  id v4;
  CNVisualIdentity *v5;
  CNPhotoPickerHeaderView *v6;

  v4 = a3;
  v5 = -[CNVisualIdentity initWithContact:]([CNVisualIdentity alloc], "initWithContact:", v4);

  v6 = -[CNPhotoPickerHeaderView initWithVisualIdentity:](self, "initWithVisualIdentity:", v5);
  return v6;
}

- (CNPhotoPickerHeaderView)initWithVisualIdentity:(id)a3
{
  id v4;
  CNVisualIdentityAvatarViewController *v5;
  CNPhotoPickerHeaderView *v6;

  v4 = a3;
  v5 = -[CNVisualIdentityAvatarViewController initWithVisualIdentity:]([CNVisualIdentityAvatarViewController alloc], "initWithVisualIdentity:", v4);
  v6 = -[CNPhotoPickerHeaderView initWithVisualIdentity:avatarViewController:](self, "initWithVisualIdentity:avatarViewController:", v4, v5);

  return v6;
}

- (CNPhotoPickerHeaderView)initWithVisualIdentity:(id)a3 avatarViewController:(id)a4
{
  id v7;
  id v8;
  CNPhotoPickerHeaderView *v9;
  CNPhotoPickerHeaderView *v10;
  void *v11;
  void *v12;
  CNPhotoPickerHeaderView *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerHeaderView;
  v9 = -[CNPhotoPickerHeaderView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avatarViewController, a4);
    objc_storeStrong((id *)&v10->_visualIdentity, a3);
    -[CNPhotoPickerHeaderView avatarViewController](v10, "avatarViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView setupHeaderViewWithPhotoView:](v10, "setupHeaderViewWithPhotoView:", v12);

    -[CNPhotoPickerHeaderView updatePhotoViewWithUpdatedIdentity:](v10, "updatePhotoViewWithUpdatedIdentity:", v7);
    -[CNPhotoPickerHeaderView setupDragAndDrop](v10, "setupDragAndDrop");
    v13 = v10;
  }

  return v10;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerHeaderView;
  -[CNPhotoPickerHeaderView layoutSubviews](&v3, sel_layoutSubviews);
  -[CNPhotoPickerHeaderView updateIdentityNameTextFieldMaxWidth](self, "updateIdentityNameTextFieldMaxWidth");
}

- (void)setupDragAndDrop
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", self);
  -[CNPhotoPickerHeaderView addInteraction:](self, "addInteraction:", v3);

}

- (BOOL)resignFirstResponder
{
  void *v3;
  objc_super v5;

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerHeaderView;
  return -[CNPhotoPickerHeaderView resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (void)setupHeaderViewWithPhotoView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNPhotoPickerHeaderView addSubview:](self, "addSubview:", v4);

  -[CNPhotoPickerHeaderView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView setBackgroundColor:](self, "setBackgroundColor:", v6);

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapHeaderView);
  objc_msgSend(v7, "setDelegate:", self);
  -[CNPhotoPickerHeaderView addGestureRecognizer:](self, "addGestureRecognizer:", v7);
  -[CNPhotoPickerHeaderView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v7);
  -[CNPhotoPickerHeaderView setupIdentityNameTextFieldAndClearButton](self, "setupIdentityNameTextFieldAndClearButton");

}

- (void)setupIdentityNameTextFieldAndClearButton
{
  CNPhotoPickerHeaderViewTextField *v3;
  CNPhotoPickerHeaderViewTextField *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = [CNPhotoPickerHeaderViewTextField alloc];
  v4 = -[CNPhotoPickerHeaderViewTextField initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNPhotoPickerHeaderView setIdentityNameTextField:](self, "setIdentityNameTextField:", v4);

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  +[CNUIFontRepository visualIdentityPickerHeaderTitleFont](CNUIFontRepository, "visualIdentityPickerHeaderTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNPhotoPickerHeaderView setupIdentityNameClearButtonIfNecessary](self, "setupIdentityNameClearButtonIfNecessary");
  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView addSubview:](self, "addSubview:", v10);

}

- (void)updateIdentityNameTextFieldMaxWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[CNPhotoPickerHeaderView layoutMargins](self, "layoutMargins");
  v4 = v3;
  -[CNPhotoPickerHeaderView layoutMargins](self, "layoutMargins");
  v6 = v4 + v5;
  -[CNPhotoPickerHeaderView clearIdentityNameButton](self, "clearIdentityNameButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  -[CNPhotoPickerHeaderView bounds](self, "bounds");
  v11 = v10 - v6 - v9;
  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaxWidth:", v11);

}

- (void)setupIdentityNameClearButtonIfNecessary
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[CNPhotoPickerHeaderView visualIdentity](self, "visualIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canUpdateGroupName");

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView setClearIdentityNameButton:](self, "setClearIdentityNameButton:", v5);

    v6 = (void *)MEMORY[0x1E0DC3870];
    v7 = *MEMORY[0x1E0DC4CD0];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("xmark.circle.fill"), v7, 4, v8, 1, *MEMORY[0x1E0DC4B58]);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[CNPhotoPickerHeaderView clearIdentityNameButton](self, "clearIdentityNameButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:forState:", v15, 0);

    -[CNPhotoPickerHeaderView clearIdentityNameButton](self, "clearIdentityNameButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentEdgeInsets:", 0.0, 5.0, 0.0, 0.0);

    -[CNPhotoPickerHeaderView clearIdentityNameButton](self, "clearIdentityNameButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel_didTapClearIdentityNameButton, 64);

    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView clearIdentityNameButton](self, "clearIdentityNameButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightView:", v13);

    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightViewMode:", 3);

  }
  else
  {
    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 0);
  }

}

- (void)updateConstraints
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
  objc_super v44;
  _QWORD v45[5];
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  -[CNPhotoPickerHeaderView subviewsConstraints](self, "subviewsConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v43 = (void *)objc_opt_new();
    -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView topAnchor](self, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v36;
    objc_msgSend(v5, "centerXAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView centerXAnchor](self, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v8;
    objc_msgSend(v5, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    v42 = v5;
    objc_msgSend(v5, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v12;
    objc_msgSend(v10, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 115.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObjectsFromArray:", v15);

    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v34;
    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v29;
    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView centerXAnchor](self, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v25;
    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 12.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v19;
    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerHeaderView bottomAnchor](self, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -6.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObjectsFromArray:", v24);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);
    -[CNPhotoPickerHeaderView setSubviewsConstraints:](self, "setSubviewsConstraints:", v43);

  }
  v44.receiver = self;
  v44.super_class = (Class)CNPhotoPickerHeaderView;
  -[CNPhotoPickerHeaderView updateConstraints](&v44, sel_updateConstraints);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerHeaderView;
  -[CNPhotoPickerHeaderView didMoveToWindow](&v5, sel_didMoveToWindow);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[CNPhotoPickerHeaderView subviewsConstraints](self, "subviewsConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[CNPhotoPickerHeaderView setSubviewsConstraints:](self, "setSubviewsConstraints:", 0);
  -[CNPhotoPickerHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updatePhotoViewWithUpdatedIdentity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[CNPhotoPickerHeaderView setVisualIdentity:](self, "setVisualIdentity:", v4);

  -[CNPhotoPickerHeaderView visualIdentity](self, "visualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView updateImageViewWithIdentity:](self, "updateImageViewWithIdentity:", v5);

  -[CNPhotoPickerHeaderView visualIdentity](self, "visualIdentity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView updateIdentityNameTextFieldWithIdentity:](self, "updateIdentityNameTextFieldWithIdentity:", v6);

}

- (CGSize)sizeOfPrimaryAvatar
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
  CGSize result;

  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarFrameForFocusedAvatarInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)updateImageViewWithIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "avatarImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CNPhotoPickerHeaderView placeholderProviderItem](self, "placeholderProviderItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateVisualIdentity:", v7);

  }
  -[CNPhotoPickerHeaderView setClearAvatarImageButtonHidden:](self, "setClearAvatarImageButtonHidden:", v4 == 0);
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visualIdentityDidUpdate:", v7);

}

- (void)updateIdentityNameTextFieldWithIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView updateIdentityNameTextFieldPlaceholderWithText:](self, "updateIdentityNameTextFieldPlaceholderWithText:", v6);

}

- (void)setClearAvatarImageButtonHidden:(BOOL)a3
{
  id v3;

  if (a3)
  {
    -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBadgeImage:", 0);

  }
  else
  {
    -[CNPhotoPickerHeaderView setupClearAvatarImageButton](self, "setupClearAvatarImageButton");
  }
}

- (void)setupClearAvatarImageButton
{
  void *v3;
  void *v4;
  void *v5;
  CNBadgingAvatarBadgeStyleSettings *v6;
  void *v7;
  CNBadgingAvatarBadgeStyleSettings *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBadgeImage:", v3);

  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBadgeTarget:action:", self, sel_didTapClearAvatarImageButton);

  v6 = [CNBadgingAvatarBadgeStyleSettings alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNBadgingAvatarBadgeStyleSettings initWithPosition:color:backgroundColor:cropStyle:](v6, "initWithPosition:color:backgroundColor:cropStyle:", 0, v10, v7, 0);
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBadgeStyleSettings:", v8);

}

- (void)didTapClearAvatarImageButton
{
  id v3;

  -[CNPhotoPickerHeaderView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoPickerHeaderViewDidTapClearAvatarImageButton:", self);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "length");
  v14 = objc_msgSend(v12, "length");
  if (v14 < 0x401)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      -[CNPhotoPickerHeaderView didTapClearIdentityNameButton](self, "didTapClearIdentityNameButton");
    else
      -[CNPhotoPickerHeaderView updateIdentityNameTextFieldPlaceholderWithText:](self, "updateIdentityNameTextFieldPlaceholderWithText:", v12);
    -[CNPhotoPickerHeaderView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "photoPickerHeaderView:didUpdateIdentityNameTextField:withText:", self, v9, v12);
    goto LABEL_9;
  }
  if (v13)
  {
    objc_msgSend(v9, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (length == v16)
    {
      objc_msgSend(v12, "substringToIndex:", 1024);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v17);
      -[CNPhotoPickerHeaderView delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "photoPickerHeaderView:didUpdateIdentityNameTextField:withText:", self, v9, v17);

LABEL_9:
    }
  }

  return v14 < 0x401;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNPhotoPickerHeaderView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoPickerHeaderView:didUpdateIdentityNameTextField:withText:", self, v4, v5);

}

- (void)didTapHeaderView
{
  id v2;

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)didTapClearIdentityNameButton
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[CNPhotoPickerHeaderView updateIdentityNameTextFieldPlaceholderWithText:](self, "updateIdentityNameTextFieldPlaceholderWithText:", 0);
  -[CNPhotoPickerHeaderView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoPickerHeaderView:didUpdateIdentityNameTextField:withText:", self, v5, 0);

  -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

}

- (void)updateIdentityNameTextFieldPlaceholderWithText:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPhotoPickerHeaderView visualIdentity](self, "visualIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canUpdateGroupName");

  if (v6)
  {
    v7 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
    -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "setRightView:", 0);

      v18 = *MEMORY[0x1E0DC1138];
      +[CNUIFontRepository visualIdentityPickerHeaderPlaceholderFont](CNUIFontRepository, "visualIdentityPickerHeaderPlaceholderFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x1E0CB3498]);
      CNContactsUIBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PHOTO_HEADER_TEXTFIELD_GROUP_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v14, v11);
      -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAttributedPlaceholder:", v15);

    }
    else
    {
      objc_msgSend(v8, "setPlaceholder:", 0);

      -[CNPhotoPickerHeaderView identityNameTextField](self, "identityNameTextField");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPhotoPickerHeaderView clearIdentityNameButton](self, "clearIdentityNameButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRightView:", v17);

    }
  }

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  void (__cdecl *v4)();
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v4 = (void (__cdecl *)())getkUTTypePNG_54064;
  v5 = a4;
  v4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  getkUTTypeJPEG_54067();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CA5BB0];
  v12[1] = v7;
  v12[2] = v8;
  v9 = *MEMORY[0x1E0CA5B90];
  v12[3] = *MEMORY[0x1E0CA5AE0];
  v12[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v10);

  return (char)v4;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CGPoint v26;
  CGRect v27;

  v5 = a4;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") != 1)
  {

    goto LABEL_5;
  }
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v18);
  v26.x = v19;
  v26.y = v20;
  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  v21 = CGRectContainsPoint(v27, v26);

  if (!v21)
  {
LABEL_5:
    -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endDropAppearance");
    v23 = 0;
    goto LABEL_6;
  }
  -[CNPhotoPickerHeaderView avatarViewController](self, "avatarViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "beginDropAppearance");
  v23 = 2;
LABEL_6:

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v23);
  return v24;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v5 = a4;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x1E0CA5B90];
    objc_msgSend(v9, "itemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke;
    v13[3] = &unk_1E204EAA8;
    v13[4] = self;
    v12 = (id)objc_msgSend(v11, "loadDataRepresentationForTypeIdentifier:completionHandler:", v10, v13);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[CNPhotoPickerHeaderView tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (CNPhotoPickerHeaderViewDelegate)delegate
{
  return (CNPhotoPickerHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPhotoPickerProviderItem)placeholderProviderItem
{
  return self->_placeholderProviderItem;
}

- (void)setPlaceholderProviderItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderProviderItem, a3);
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setVisualIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_visualIdentity, a3);
}

- (NSArray)subviewsConstraints
{
  return self->_subviewsConstraints;
}

- (void)setSubviewsConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_subviewsConstraints, a3);
}

- (CNVisualIdentityAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (UIButton)clearAvatarImageButton
{
  return self->_clearAvatarImageButton;
}

- (void)setClearAvatarImageButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearAvatarImageButton, a3);
}

- (UIView)clearAvatarImageButtonBackground
{
  return self->_clearAvatarImageButtonBackground;
}

- (void)setClearAvatarImageButtonBackground:(id)a3
{
  objc_storeStrong((id *)&self->_clearAvatarImageButtonBackground, a3);
}

- (CAShapeLayer)clearAvatarImageButtonClippingLayer
{
  return self->_clearAvatarImageButtonClippingLayer;
}

- (void)setClearAvatarImageButtonClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clearAvatarImageButtonClippingLayer, a3);
}

- (CNPhotoPickerHeaderViewTextField)identityNameTextField
{
  return self->_identityNameTextField;
}

- (void)setIdentityNameTextField:(id)a3
{
  objc_storeStrong((id *)&self->_identityNameTextField, a3);
}

- (UIButton)clearIdentityNameButton
{
  return self->_clearIdentityNameButton;
}

- (void)setClearIdentityNameButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearIdentityNameButton, a3);
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_clearIdentityNameButton, 0);
  objc_storeStrong((id *)&self->_identityNameTextField, 0);
  objc_storeStrong((id *)&self->_clearAvatarImageButtonClippingLayer, 0);
  objc_storeStrong((id *)&self->_clearAvatarImageButtonBackground, 0);
  objc_storeStrong((id *)&self->_clearAvatarImageButton, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_subviewsConstraints, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_placeholderProviderItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPhotoPickerHeaderView.m", 465, 3, CFSTR("Unable to copy data for photo picker header photo drop operation: %@"), v8, v9, v10, v11, (uint64_t)v7);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke_2;
    block[3] = &unk_1E2050400;
    block[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoPickerHeaderViewDidReceiveDroppedImageData:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "avatarViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDropAppearance");

}

@end
