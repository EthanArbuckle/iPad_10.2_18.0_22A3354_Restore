@implementation CNSensitiveContentHelpButtonView

- (CNSensitiveContentHelpButtonView)initWithManager:(id)a3
{
  id v5;
  CNSensitiveContentHelpButtonView *v6;
  CNSensitiveContentHelpButtonView *v7;
  void *v8;
  CNSensitiveContentHelpButtonView *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNSensitiveContentHelpButtonView;
  v6 = -[CNSensitiveContentHelpButtonView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensitiveContentAnalysisManager, a3);
    -[CNSensitiveContentHelpButtonView configureButton](v7, "configureButton");
    -[CNSensitiveContentHelpButtonView configureVibrancyView](v7, "configureVibrancyView");
    -[UIVisualEffectView contentView](v7->_vibrancyView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v7->_button);

    -[CNSensitiveContentHelpButtonView addSubview:](v7, "addSubview:", v7->_vibrancyView);
    -[CNSensitiveContentHelpButtonView configureConstraints](v7, "configureConstraints");
    v9 = v7;
  }

  return v7;
}

- (void)configureButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIButton *v7;
  UIButton *button;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBaseForegroundColor:", v3);

  objc_msgSend(v9, "setButtonSize:", 2);
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SENSITIVE_CONTENT_HELP_BUTTON_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v5);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v6);

  objc_msgSend(v9, "setImagePadding:", 2.0);
  objc_msgSend(v9, "setContentInsets:", 6.0, 10.0, 6.0, 10.0);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, 0);
  v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, sel_didTapButton, 64);
  button = self->_button;
  self->_button = v7;

}

- (void)configureVibrancyView
{
  UIVisualEffectView *v3;
  void *v4;
  void *v5;
  UIVisualEffectView *vibrancyView;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 16);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v7);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", 1);

  -[UIVisualEffectView layer](v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 18.0);

  vibrancyView = self->_vibrancyView;
  self->_vibrancyView = v3;

}

- (void)configureConstraints
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
  _QWORD v37[10];

  v37[8] = *MEMORY[0x1E0C80C00];
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[CNSensitiveContentHelpButtonView vibrancyView](self, "vibrancyView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView topAnchor](self, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  -[CNSensitiveContentHelpButtonView vibrancyView](self, "vibrancyView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView bottomAnchor](self, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v29;
  -[CNSensitiveContentHelpButtonView vibrancyView](self, "vibrancyView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView leadingAnchor](self, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v25;
  -[CNSensitiveContentHelpButtonView vibrancyView](self, "vibrancyView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v20;
  -[CNSensitiveContentHelpButtonView button](self, "button");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView topAnchor](self, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v16;
  -[CNSensitiveContentHelpButtonView button](self, "button");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView bottomAnchor](self, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v3;
  -[CNSensitiveContentHelpButtonView button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView leadingAnchor](self, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v7;
  -[CNSensitiveContentHelpButtonView button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v12);

}

- (id)hidePhotoAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SENSITIVE_CONTENT_ACTION_HIDE_PHOTO_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CNSensitiveContentHelpButtonView_hidePhotoAction__block_invoke;
  v8[3] = &unk_1E204F7F0;
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:style:handler:", v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)hideContent
{
  id v3;

  -[CNSensitiveContentHelpButtonView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensitiveContentHelpButtonView:didSetContentHidden:", self, 1);

}

- (int64_t)menuOptions
{
  void *v3;
  int v4;
  void *v5;
  unsigned int v6;

  -[CNSensitiveContentHelpButtonView sensitiveContentAnalysisManager](self, "sensitiveContentAnalysisManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canShowBlockContactUI");

  if (!v4)
    return 0;
  -[CNSensitiveContentHelpButtonView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canSensitiveContentHelpButtonBlockContact:", self);

  return v6;
}

- (void)presentMoreHelpMenu
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D8C9F8], "menuWithOptions:", -[CNSensitiveContentHelpButtonView menuOptions](self, "menuOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSensitiveContentHelpButtonView setMoreHelpMenu:](self, "setMoreHelpMenu:", v3);

  -[CNSensitiveContentHelpButtonView moreHelpMenu](self, "moreHelpMenu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMenuDelegate:", self);

  -[CNSensitiveContentHelpButtonView addHidePhotoActionIfNeeded](self, "addHidePhotoActionIfNeeded");
  -[CNSensitiveContentHelpButtonView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensitiveContentHelpButtonView:didRequestToPresentMenu:", self, self->_moreHelpMenu);

}

- (void)addHidePhotoActionIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[CNSensitiveContentHelpButtonView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canSensitiveContentHelpButtonViewHidePhoto:", self);

  -[CNSensitiveContentHelpButtonView moreHelpMenu](self, "moreHelpMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSensitiveContentHelpButtonView hidePhotoAction](self, "hidePhotoAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_cn_containsObject:", v8);

    if ((v9 & 1) != 0)
      return;
    -[CNSensitiveContentHelpButtonView moreHelpMenu](self, "moreHelpMenu");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSensitiveContentHelpButtonView hidePhotoAction](self, "hidePhotoAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSensitiveContentHelpButtonView moreHelpMenu](self, "moreHelpMenu");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setActions:", v14);

  }
  else
  {
    -[CNSensitiveContentHelpButtonView moreHelpMenu](self, "moreHelpMenu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__CNSensitiveContentHelpButtonView_addHidePhotoActionIfNeeded__block_invoke;
    v15[3] = &unk_1E204A410;
    v15[4] = self;
    objc_msgSend(v11, "_cn_filter:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setActions:", v12);
  }

}

- (void)didBlockContact:(id)a3
{
  id v4;

  -[CNSensitiveContentHelpButtonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensitiveContentHelpButtonView:didRequestToBlockContact:", self, 1);

}

- (void)didAskForMoreHelp:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0D8CA08]);
  -[CNSensitiveContentHelpButtonView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensitiveContentHelpButtonView:didRequestToPresentMoreHelp:", self, v5);

}

- (CNSensitiveContentHelpButtonViewDelegate)delegate
{
  return (CNSensitiveContentHelpButtonViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNSensitiveContentAnalysisManager)sensitiveContentAnalysisManager
{
  return self->_sensitiveContentAnalysisManager;
}

- (void)setSensitiveContentAnalysisManager:(id)a3
{
  objc_storeStrong((id *)&self->_sensitiveContentAnalysisManager, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (SCUIMoreHelpMenu)moreHelpMenu
{
  return self->_moreHelpMenu;
}

- (void)setMoreHelpMenu:(id)a3
{
  objc_storeStrong((id *)&self->_moreHelpMenu, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreHelpMenu, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_sensitiveContentAnalysisManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __62__CNSensitiveContentHelpButtonView_addHidePhotoActionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "hidePhotoAction");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 != v3;
}

uint64_t __51__CNSensitiveContentHelpButtonView_hidePhotoAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hideContent");
}

@end
