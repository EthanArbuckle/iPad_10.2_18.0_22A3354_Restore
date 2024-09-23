@implementation CNContactCardFieldPickerPhotoCell

- (CNContactCardFieldPickerPhotoCell)init
{
  CNContactCardFieldPickerPhotoCell *v2;
  CNContactCardFieldPickerPhotoCell *v3;
  CNContactCardFieldPickerPhotoCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactCardFieldPickerPhotoCell;
  v2 = -[CNContactCardFieldPickerPhotoCell init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactCardFieldPickerPhotoCell;
  -[CNContactCardFieldPickerPhotoCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[CNContactCardFieldPickerPhotoCell setConfiguration](self, "setConfiguration");
}

- (void)setConfiguration
{
  const __CFString *v3;
  void *v4;
  id v5;

  -[CNContactCardFieldPickerPhotoCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CNContactCardFieldPickerPhotoCell isSelected](self, "isSelected"))
    v3 = CFSTR("checkmark.circle.fill");
  else
    v3 = CFSTR("circle");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

  -[CNContactCardFieldPickerPhotoCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (void)prepareCellWithContact:(id)a3
{
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
  id v31;
  _QWORD v32[4];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  -[CNContactCardFieldPickerPhotoCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPickerPhotoCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContacts:", v5);

  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v22 = v4;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v19;
  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v11;
  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageToTextPadding");
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);
}

- (CNAvatarView)avatarView
{
  CNAvatarView *avatarView;
  CNAvatarView *v4;
  CNAvatarView *v5;
  CNAvatarView *v6;
  void *v7;

  avatarView = self->_avatarView;
  if (!avatarView)
  {
    v4 = [CNAvatarView alloc];
    v5 = -[CNAvatarView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_avatarView;
    self->_avatarView = v5;

    -[CNContactCardFieldPickerPhotoCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_avatarView);

    avatarView = self->_avatarView;
  }
  return avatarView;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactCardFieldPickerPhotoCell;
  -[CNContactCardFieldPickerPhotoCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CNContactCardFieldPickerPhotoCell avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CNContactCardFieldPickerPhotoCell setAvatarView:](self, "setAvatarView:", 0);
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
