@implementation MFPhotoPickerSectionHeaderView

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("PhotoPickerSectionHeaderIdentifier");
}

- (MFPhotoPickerSectionHeaderView)initWithFrame:(CGRect)a3
{
  MFPhotoPickerSectionHeaderView *v3;
  id v4;
  uint64_t v5;
  UILabel *titleLabel;
  void *v7;
  void *v8;
  uint64_t v9;
  UIButton *actionButton;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  void *v22;
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
  objc_super v36;
  _QWORD v37[7];

  v37[5] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)MFPhotoPickerSectionHeaderView;
  v3 = -[MFPhotoPickerSectionHeaderView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFPhotoPickerSectionHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[MFPhotoPickerSectionHeaderView addSubview:](v3, "addSubview:", v3->_actionButton);
    v11 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPhotoPickerSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", 8.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v29;
    -[MFPhotoPickerSectionHeaderView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v3->_actionButton, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", 8.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v26;
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton leadingAnchor](v3->_actionButton, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:constant:", 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v24;
    -[UILabel centerYAnchor](v3->_titleLabel, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPhotoPickerSectionHeaderView centerYAnchor](v3, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v13;
    -[UIButton centerYAnchor](v3->_actionButton, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFPhotoPickerSectionHeaderView centerYAnchor](v3, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activateConstraints:", v17);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PHOTO_PICKER_RECENT_PHOTOS"), &stru_1E5A6A588, CFSTR("Main"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_titleLabel, "setText:", v19);

    v20 = v3->_actionButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("PHOTO_PICKER_ALL_PHOTOS"), &stru_1E5A6A588, CFSTR("Main"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v20, "setTitle:forState:", v22, 0);

  }
  return v3;
}

- (void)addAllPhotosTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[MFPhotoPickerSectionHeaderView actionButton](self, "actionButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", v7, a4, 64);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
