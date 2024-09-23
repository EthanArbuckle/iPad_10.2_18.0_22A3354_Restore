@implementation HURoomListItemCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HURoomListItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HURoomListItemCell *v4;
  UILabel *v5;
  UILabel *nameLabel;
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
  objc_super v39;
  _QWORD v40[7];

  v40[5] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)HURoomListItemCell;
  v4 = -[HURoomListItemCell initWithStyle:reuseIdentifier:](&v39, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_nameLabel, "setFont:", v7);

    -[HURoomListItemCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_nameLabel);

    v27 = (void *)MEMORY[0x1E0CB3718];
    -[HURoomListItemCell contentView](v4, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v36;
    -[HURoomListItemCell nameLabel](v4, "nameLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURoomListItemCell contentView](v4, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v30;
    -[HURoomListItemCell nameLabel](v4, "nameLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURoomListItemCell contentView](v4, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v23;
    -[HURoomListItemCell nameLabel](v4, "nameLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURoomListItemCell contentView](v4, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v10;
    -[HURoomListItemCell nameLabel](v4, "nameLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "heightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURoomListItemCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v17);

  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[HURoomListItemCell setRoomName:](self, "setRoomName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HURoomListItemCell;
  -[HURoomListItemCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (NSString)roomName
{
  void *v2;
  void *v3;

  -[HURoomListItemCell nameLabel](self, "nameLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRoomName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HURoomListItemCell nameLabel](self, "nameLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (HFIconDescriptor)roomIconDescriptor
{
  return self->_roomIconDescriptor;
}

- (void)setRoomIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_roomIconDescriptor, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_roomIconDescriptor, 0);
}

@end
