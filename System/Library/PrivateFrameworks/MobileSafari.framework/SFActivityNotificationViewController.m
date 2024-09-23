@implementation SFActivityNotificationViewController

- (SFActivityNotificationViewController)initWithTitleText:(id)a3 messageText:(id)a4
{
  id v6;
  id v7;
  SFActivityNotificationViewController *v8;
  uint64_t v9;
  NSString *titleText;
  uint64_t v11;
  NSString *messageText;
  SFActivityNotificationViewController *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFActivityNotificationViewController;
  v8 = -[SFActivityNotificationViewController init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    titleText = v8->_titleText;
    v8->_titleText = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    messageText = v8->_messageText;
    v8->_messageText = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  UIStackView *v4;
  UIStackView *containerStackView;
  id v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *containerLeadingConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *containerTrailingContraint;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)SFActivityNotificationViewController;
  -[SFActivityNotificationViewController viewDidLoad](&v35, sel_viewDidLoad);
  -[SFActivityNotificationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  objc_msgSend(v3, "setLayoutMargins:", 8.0, 8.0, 8.0, 8.0);
  v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  containerStackView = self->_containerStackView;
  self->_containerStackView = v4;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_containerStackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_containerStackView, "setSpacing:", 8.0);
  v31 = v3;
  objc_msgSend(v3, "addSubview:", self->_containerStackView);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v6, "setAxis:", 1);
  objc_msgSend(v6, "setAlignment:", 3);
  LODWORD(v7) = 1148846080;
  objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v7);
  -[UIStackView addArrangedSubview:](self->_containerStackView, "addArrangedSubview:", v6);
  v34 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v8 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1420]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTextColor:", v10);

  objc_msgSend(v34, "setText:", self->_titleText);
  v33 = v6;
  objc_msgSend(v6, "addArrangedSubview:", v34);
  v32 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", v8, *MEMORY[0x1E0DC1438]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v12);

  objc_msgSend(v32, "setText:", self->_messageText);
  objc_msgSend(v6, "addArrangedSubview:", v32);
  objc_msgSend(v3, "layoutMarginsGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_containerStackView, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 24.0);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerLeadingConstraint = self->_containerLeadingConstraint;
  self->_containerLeadingConstraint = v16;

  objc_msgSend(v13, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_containerStackView, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 24.0);
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerTrailingContraint = self->_containerTrailingContraint;
  self->_containerTrailingContraint = v20;

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_containerStackView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v24;
  -[UIStackView bottomAnchor](self->_containerStackView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self->_containerLeadingConstraint;
  v36[1] = v27;
  v36[2] = v28;
  v36[3] = self->_containerTrailingContraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v29);

  -[SFActivityNotificationViewController _arrangeAndConfigureLeadingAccessoryView](self, "_arrangeAndConfigureLeadingAccessoryView");
  -[SFActivityNotificationViewController _arrangeAndConfigureTrailingAccessoryView](self, "_arrangeAndConfigureTrailingAccessoryView");
  objc_msgSend(v31, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[SFActivityNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)setLeadingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *leadingAccessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  leadingAccessoryView = self->_leadingAccessoryView;
  if (leadingAccessoryView != v5)
  {
    v7 = v5;
    if (leadingAccessoryView)
      -[UIStackView removeArrangedSubview:](self->_containerStackView, "removeArrangedSubview:");
    objc_storeStrong((id *)&self->_leadingAccessoryView, a3);
    -[SFActivityNotificationViewController _arrangeAndConfigureLeadingAccessoryView](self, "_arrangeAndConfigureLeadingAccessoryView");
    v5 = v7;
  }

}

- (void)setTrailingAccessoryView:(id)a3
{
  UIView *v5;
  UIView *trailingAccessoryView;
  UIView *v7;

  v5 = (UIView *)a3;
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView != v5)
  {
    v7 = v5;
    if (trailingAccessoryView)
      -[UIStackView removeArrangedSubview:](self->_containerStackView, "removeArrangedSubview:");
    objc_storeStrong((id *)&self->_trailingAccessoryView, a3);
    -[SFActivityNotificationViewController _arrangeAndConfigureTrailingAccessoryView](self, "_arrangeAndConfigureTrailingAccessoryView");
    v5 = v7;
  }

}

- (void)_arrangeAndConfigureLeadingAccessoryView
{
  double v3;
  UIView *leadingAccessoryView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (!self->_leadingAccessoryView)
    v3 = 24.0;
  -[NSLayoutConstraint setConstant:](self->_containerLeadingConstraint, "setConstant:", v3);
  leadingAccessoryView = self->_leadingAccessoryView;
  if (leadingAccessoryView)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[UIView widthAnchor](leadingAccessoryView, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 32.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[UIView heightAnchor](self->_leadingAccessoryView, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 32.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v10);

    -[UIStackView insertArrangedSubview:atIndex:](self->_containerStackView, "insertArrangedSubview:atIndex:", self->_leadingAccessoryView, 0);
  }
}

- (void)_arrangeAndConfigureTrailingAccessoryView
{
  double v3;
  UIView *trailingAccessoryView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (!self->_trailingAccessoryView)
    v3 = 24.0;
  -[NSLayoutConstraint setConstant:](self->_containerTrailingContraint, "setConstant:", v3);
  trailingAccessoryView = self->_trailingAccessoryView;
  if (trailingAccessoryView)
  {
    v5 = (void *)MEMORY[0x1E0CB3718];
    -[UIView widthAnchor](trailingAccessoryView, "widthAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToConstant:", 32.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    -[UIView heightAnchor](self->_trailingAccessoryView, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 32.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateConstraints:", v10);

    -[UIStackView addArrangedSubview:](self->_containerStackView, "addArrangedSubview:", self->_trailingAccessoryView);
  }
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (UIView)leadingAccessoryView
{
  return self->_leadingAccessoryView;
}

- (UIView)trailingAccessoryView
{
  return self->_trailingAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryView, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_containerTrailingContraint, 0);
  objc_storeStrong((id *)&self->_containerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
}

@end
