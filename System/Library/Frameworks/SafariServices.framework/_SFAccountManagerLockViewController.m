@implementation _SFAccountManagerLockViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *accountManagerLockedLabel;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *lockImage;
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
  objc_super v47;
  _QWORD v48[10];

  v48[8] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)_SFAccountManagerLockViewController;
  -[_SFAccountManagerLockViewController viewDidLoad](&v47, sel_viewDidLoad);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerLockViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  -[_SFAccountManagerLockViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:", 1);

  -[_SFAccountManagerLockViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  accountManagerLockedLabel = self->_accountManagerLockedLabel;
  self->_accountManagerLockedLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_accountManagerLockedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_accountManagerLockedLabel, "setTextColor:", v10);

  -[UILabel setAdjustsFontSizeToFitWidth:](self->_accountManagerLockedLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setNumberOfLines:](self->_accountManagerLockedLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_accountManagerLockedLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_accountManagerLockedLabel, "setFont:", v11);

  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_accountManagerLockedLabel, "setText:", v12);

  objc_msgSend(v6, "addSubview:", self->_accountManagerLockedLabel);
  v13 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.fill"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
  lockImage = self->_lockImage;
  self->_lockImage = v15;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_lockImage, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_lockImage, "setTintColor:", v17);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, -1, 140.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_lockImage, "setPreferredSymbolConfiguration:", v18);

  v46 = v6;
  objc_msgSend(v6, "addSubview:", self->_lockImage);
  objc_msgSend(v6, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel centerXAnchor](self->_accountManagerLockedLabel, "centerXAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v43;
  -[UILabel topAnchor](self->_accountManagerLockedLabel, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v40;
  -[UILabel leadingAnchor](self->_accountManagerLockedLabel, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v37;
  -[UILabel trailingAnchor](self->_accountManagerLockedLabel, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v33;
  -[UILabel bottomAnchor](self->_accountManagerLockedLabel, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintLessThanOrEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v30;
  -[UIImageView centerXAnchor](self->_lockImage, "centerXAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v21;
  -[UIImageView topAnchor](self->_lockImage, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v24;
  -[UIImageView bottomAnchor](self->_lockImage, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v28);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockImage, 0);
  objc_storeStrong((id *)&self->_accountManagerLockedLabel, 0);
}

@end
