@implementation CKAppContainerTitleView

- (CKAppContainerTitleView)init
{
  CKAppContainerTitleView *v2;
  CKAppContainerTitleView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAppContainerTitleView;
  v2 = -[CKAppContainerTitleView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKAppContainerTitleView setup](v2, "setup");
  return v3;
}

- (void)setup
{
  UIImageView *v3;
  UIImageView *iconImageView;
  UILabel *v5;
  UILabel *label;
  void *v7;
  void *v8;
  UIButton *v9;
  UIButton *closeButton;
  UILabel *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *iconWidthConstraint;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *iconHeightConstraint;
  NSLayoutConstraint *v19;
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
  _QWORD v43[5];
  _QWORD v44[9];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v3;

  -[UIImageView setContentMode:](self->_iconImageView, "setContentMode:", 1);
  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
  label = self->_label;
  self->_label = v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_label, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 7);
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v9;

  v11 = self->_label;
  v45[0] = self->_iconImageView;
  v45[1] = v11;
  v45[2] = self->_closeButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __32__CKAppContainerTitleView_setup__block_invoke;
  v43[3] = &unk_1E2755790;
  v43[4] = self;
  objc_msgSend(v12, "__imForEach:", v43);

  -[UIImageView widthAnchor](self->_iconImageView, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 40.0);
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  iconWidthConstraint = self->_iconWidthConstraint;
  self->_iconWidthConstraint = v14;

  -[UIImageView heightAnchor](self->_iconImageView, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToConstant:", 30.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  iconHeightConstraint = self->_iconHeightConstraint;
  self->_iconHeightConstraint = v17;

  v34 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView leadingAnchor](self->_iconImageView, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppContainerTitleView leadingAnchor](self, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = self->_iconWidthConstraint;
  v44[0] = v40;
  v44[1] = v19;
  v44[2] = self->_iconHeightConstraint;
  -[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppContainerTitleView centerYAnchor](self, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v37;
  -[UILabel leadingAnchor](self->_label, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_iconImageView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v35, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v33;
  -[UILabel centerYAnchor](self->_label, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView centerYAnchor](self->_iconImageView, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v30;
  -[UILabel trailingAnchor](self->_label, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton leadingAnchor](self->_closeButton, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v22;
  -[UIButton centerYAnchor](self->_closeButton, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppContainerTitleView centerYAnchor](self, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v25;
  -[UIButton trailingAnchor](self->_closeButton, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAppContainerTitleView trailingAnchor](self, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44[8] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v29);

}

void __32__CKAppContainerTitleView_setup__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);

}

- (UIImage)iconImage
{
  void *v2;
  void *v3;

  -[CKAppContainerTitleView iconImageView](self, "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setIconImage:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CKAppContainerTitleView iconImageView](self, "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v13);

  if (v13)
  {
    objc_msgSend(v13, "size");
    v6 = v5;
    objc_msgSend(v13, "size");
    v8 = v6 == v7;
    if (v6 == v7)
      v9 = 36.0;
    else
      v9 = 30.0;
    if (v8)
      v10 = 36.0;
    else
      v10 = 40.0;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[CKAppContainerTitleView iconWidthConstraint](self, "iconWidthConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

  -[CKAppContainerTitleView iconHeightConstraint](self, "iconHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v9);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (NSLayoutConstraint)iconWidthConstraint
{
  return self->_iconWidthConstraint;
}

- (void)setIconWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconWidthConstraint, a3);
}

- (NSLayoutConstraint)iconHeightConstraint
{
  return self->_iconHeightConstraint;
}

- (void)setIconHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_iconHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
