@implementation SFAvailableAppTableViewCell

- (SFAvailableAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFAvailableAppTableViewCell *v4;
  SFAvailableAppTableViewCell *v5;
  void *v6;
  UIStackView *v7;
  UIStackView *stackView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFAvailableAppTableViewCell *v17;
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
  objc_super v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)SFAvailableAppTableViewCell;
  v4 = -[SFAvailableAppTableViewCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFAvailableAppTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    stackView = v5->_stackView;
    v5->_stackView = v7;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v5->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v5->_stackView, "setAxis:", 1);
    objc_msgSend(v6, "addSubview:", v5->_stackView);
    v21 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView topAnchor](v5->_stackView, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    -[UIStackView bottomAnchor](v5->_stackView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v20;
    -[UIStackView leadingAnchor](v5->_stackView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v11;
    -[UIStackView trailingAnchor](v5->_stackView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v16);

    v17 = v5;
  }

  return v5;
}

- (void)setLockupView:(id)a3
{
  ASCLockupView **p_lockupView;
  ASCLockupView *lockupView;
  id v7;

  v7 = a3;
  p_lockupView = &self->_lockupView;
  lockupView = self->_lockupView;
  if (lockupView
    && -[ASCLockupView isDescendantOfView:](lockupView, "isDescendantOfView:", self->_stackView))
  {
    -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", *p_lockupView);
    -[ASCLockupView removeFromSuperview](*p_lockupView, "removeFromSuperview");
  }
  objc_storeStrong((id *)&self->_lockupView, a3);
  if (*p_lockupView)
  {
    -[ASCLockupView setTranslatesAutoresizingMaskIntoConstraints:](*p_lockupView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", *p_lockupView);
  }

}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
