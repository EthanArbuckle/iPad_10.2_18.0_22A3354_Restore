@implementation AAUISignInViewControllerTableFooterView

- (AAUISignInViewControllerTableFooterView)initWithReuseIdentifier:(id)a3
{
  AAUISignInViewControllerTableFooterView *v3;
  NSObject *v4;
  UIStackView *v5;
  UIStackView *mainStack;
  UIView *v7;
  UIView *expandableView;
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
  uint64_t v29;
  NSLayoutConstraint *expandableHeight;
  void *v31;
  uint8_t v33[16];
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)AAUISignInViewControllerTableFooterView;
  v3 = -[AAUISignInViewControllerTableFooterView initWithReuseIdentifier:](&v34, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Initializing AAUISignInViewControllerTableFooterView", v33, 2u);
    }

    v5 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    mainStack = v3->_mainStack;
    v3->_mainStack = v5;

    -[UIStackView setAxis:](v3->_mainStack, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_mainStack, "setAlignment:", 3);
    -[UIStackView setDistribution:](v3->_mainStack, "setDistribution:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_mainStack, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    expandableView = v3->_expandableView;
    v3->_expandableView = v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_expandableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_mainStack, "addArrangedSubview:", v3->_expandableView);
    -[AAUISignInViewControllerTableFooterView contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_mainStack);

    -[UIStackView leadingAnchor](v3->_mainStack, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIStackView trailingAnchor](v3->_mainStack, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView contentView](v3, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UIStackView topAnchor](v3->_mainStack, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 15.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIStackView bottomAnchor](v3->_mainStack, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUISignInViewControllerTableFooterView contentView](v3, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[UIView heightAnchor](v3->_expandableView, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 10.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIView heightAnchor](v3->_expandableView, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 0.0);
    v29 = objc_claimAutoreleasedReturnValue();
    expandableHeight = v3->_expandableHeight;
    v3->_expandableHeight = (NSLayoutConstraint *)v29;

    -[AAUISignInViewControllerTableFooterView contentView](v3, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setNeedsLayout");

  }
  return v3;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
  id v4;
  OBPrivacyLinkController *v5;
  OBPrivacyLinkController *privacyLinkController;
  void *v7;
  UIStackView *mainStack;
  void *v9;
  void *v10;
  OBPrivacyLinkController *v11;
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
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") && !self->_privacyLinkController)
  {
    objc_msgSend(MEMORY[0x1E0D65190], "linkWithBundleIdentifiers:", v4);
    v5 = (OBPrivacyLinkController *)objc_claimAutoreleasedReturnValue();
    privacyLinkController = self->_privacyLinkController;
    self->_privacyLinkController = v5;

    -[OBPrivacyLinkController view](self->_privacyLinkController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    mainStack = self->_mainStack;
    -[OBPrivacyLinkController view](self->_privacyLinkController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](mainStack, "addArrangedSubview:", v9);

    -[AAUISignInViewControllerTableFooterView parentForPrivacyController](self, "parentForPrivacyController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addChildViewController:", self->_privacyLinkController);

    v11 = self->_privacyLinkController;
    -[AAUISignInViewControllerTableFooterView parentForPrivacyController](self, "parentForPrivacyController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPrivacyLinkController didMoveToParentViewController:](v11, "didMoveToParentViewController:", v12);

    -[OBPrivacyLinkController view](self->_privacyLinkController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_mainStack, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    -[OBPrivacyLinkController view](self->_privacyLinkController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_mainStack, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBPrivacyLinkController setAccessibilityIdentifier:](self->_privacyLinkController, "setAccessibilityIdentifier:", CFSTR("privacy-view"));
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
    -[AAUISignInViewControllerTableFooterView contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNeedsLayout");

  }
}

- (void)setExpandableViewToHeight:(double)a3
{
  -[NSLayoutConstraint setActive:](self->_expandableHeight, "setActive:", 0);
  -[NSLayoutConstraint setConstant:](self->_expandableHeight, "setConstant:", a3);
  -[NSLayoutConstraint setActive:](self->_expandableHeight, "setActive:", 1);
}

- (double)naturalHeight
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

  v3 = *MEMORY[0x1E0DC4FF8];
  v4 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  -[UIStackView systemLayoutSizeFittingSize:](self->_actionButtonStackView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], v4);
  v6 = v5;
  -[OBPrivacyLinkController view](self->_privacyLinkController, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v3, v4);
  v9 = v8;

  -[UIStackView systemLayoutSizeFittingSize:](self->_continueButtonStackView, "systemLayoutSizeFittingSize:", v3, v4);
  v11 = 10.0;
  if (!self->_privacyLinkController)
    v11 = 0.0;
  return v6 + v9 + v10 + v11;
}

- (double)totalHeight
{
  double v3;
  double v4;

  -[UIStackView systemLayoutSizeFittingSize:](self->_mainStack, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v4 = 10.0;
  if (!self->_privacyLinkController)
    v4 = 0.0;
  return v3 + v4;
}

- (void)addActionButtonStackView:(id)a3
{
  id v5;
  UIStackView **p_actionButtonStackView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_actionButtonStackView = &self->_actionButtonStackView;
  if (!self->_actionButtonStackView)
  {
    objc_storeStrong((id *)&self->_actionButtonStackView, a3);
    -[UIStackView insertArrangedSubview:atIndex:](self->_mainStack, "insertArrangedSubview:atIndex:", *p_actionButtonStackView, 0);
    -[UIStackView leadingAnchor](*p_actionButtonStackView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_mainStack, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    -[UIStackView trailingAnchor](*p_actionButtonStackView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_mainStack, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
    -[AAUISignInViewControllerTableFooterView contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)addContinueButton:(id)a3
{
  id v4;
  UIStackView *v5;
  UIStackView *continueButtonStackView;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AAUISignInViewControllerTableFooterView setContinueButton:](self, "setContinueButton:", v4);
  if (!self->_continueButtonStackView)
  {
    v5 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    continueButtonStackView = self->_continueButtonStackView;
    self->_continueButtonStackView = v5;

    -[UIStackView setAxis:](self->_continueButtonStackView, "setAxis:", 1);
    -[UIStackView setAlignment:](self->_continueButtonStackView, "setAlignment:", 0);
    -[UIStackView setDistribution:](self->_continueButtonStackView, "setDistribution:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_continueButtonStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (self->_privacyLinkController)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v7, "heightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToConstant:", 10.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setActive:", 1);
      LODWORD(v10) = 1148846080;
      objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v10);
      -[UIStackView addArrangedSubview:](self->_mainStack, "addArrangedSubview:", v7);

    }
    -[UIStackView addArrangedSubview:](self->_continueButtonStackView, "addArrangedSubview:", v4);
    -[UIStackView addArrangedSubview:](self->_mainStack, "addArrangedSubview:", self->_continueButtonStackView);
    -[UIStackView leadingAnchor](self->_continueButtonStackView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView leadingAnchor](self->_mainStack, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    -[UIStackView trailingAnchor](self->_continueButtonStackView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView trailingAnchor](self->_mainStack, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
    -[AAUISignInViewControllerTableFooterView contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

  }
}

- (void)addOtherButton:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0DC3F10];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[UIStackView addArrangedSubview:](self->_continueButtonStackView, "addArrangedSubview:", v8);
  -[UIStackView addArrangedSubview:](self->_continueButtonStackView, "addArrangedSubview:", v5);

}

- (NSArray)privacyLinkIdentifiers
{
  return self->_privacyLinkIdentifiers;
}

- (UIViewController)parentForPrivacyController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentForPrivacyController);
}

- (void)setParentForPrivacyController:(id)a3
{
  objc_storeWeak((id *)&self->_parentForPrivacyController, a3);
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (void)setPrivacyLinkController:(id)a3
{
  objc_storeStrong((id *)&self->_privacyLinkController, a3);
}

- (UIView)expandableView
{
  return self->_expandableView;
}

- (void)setExpandableView:(id)a3
{
  objc_storeStrong((id *)&self->_expandableView, a3);
}

- (UIButton)continueButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_continueButton);
}

- (void)setContinueButton:(id)a3
{
  objc_storeWeak((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_continueButton);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_destroyWeak((id *)&self->_parentForPrivacyController);
  objc_storeStrong((id *)&self->_privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandableHeight, 0);
  objc_storeStrong((id *)&self->_continueButtonStackView, 0);
  objc_storeStrong((id *)&self->_actionButtonStackView, 0);
  objc_storeStrong((id *)&self->_expandableView, 0);
  objc_storeStrong((id *)&self->_mainStack, 0);
}

@end
