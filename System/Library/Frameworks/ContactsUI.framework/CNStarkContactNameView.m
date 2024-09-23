@implementation CNStarkContactNameView

- (CNStarkContactNameView)initWithName:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CNStarkContactNameView *v10;
  CNStarkContactNameView *v11;
  uint64_t v12;
  UILabel *nameLabel;
  CNAvatarViewController *v14;
  void *v15;
  uint64_t v16;
  CNAvatarViewController *avatarViewController;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNStarkContactNameView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[CNStarkContactNameView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_contact, a3);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
    nameLabel = v11->_nameLabel;
    v11->_nameLabel = (UILabel *)v12;

    v14 = [CNAvatarViewController alloc];
    +[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CNAvatarViewController initWithSettings:](v14, "initWithSettings:", v15);
    avatarViewController = v11->_avatarViewController;
    v11->_avatarViewController = (CNAvatarViewController *)v16;

    -[CNStarkContactNameView setupNameLabel](v11, "setupNameLabel");
    -[CNStarkContactNameView setupAvatar](v11, "setupAvatar");
    -[CNStarkContactNameView setupConstraints](v11, "setupConstraints");
  }

  return v11;
}

- (void)setupNameLabel
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
  id v16;

  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  +[CNUIFontRepository carPlayNavigationBarContactNameFont](CNUIFontRepository, "carPlayNavigationBarContactNameFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  +[CNUIColorRepository carPlayNavigationBarContactNameTextColor](CNUIColorRepository, "carPlayNavigationBarContactNameTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 2);

  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 4);

  v12 = (void *)MEMORY[0x1E0C97218];
  -[CNStarkContactNameView contact](self, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromContact:style:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView addSubview:](self, "addSubview:", v16);

}

- (void)setupAvatar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNStarkContactNameView contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContacts:", v6);

  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView addSubview:](self, "addSubview:", v9);

}

- (void)setupConstraints
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
  _QWORD v39[2];
  _QWORD v40[4];
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView centerYAnchor](self, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v30;
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "rightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v6, -8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v7;
  -[CNStarkContactNameView nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView widthAnchor](self, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v10, 1.0, -38.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView centerYAnchor](self, "centerYAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v29;
  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView rightAnchor](self, "rightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v12;
  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", 30.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v16;
  -[CNStarkContactNameView avatarViewController](self, "avatarViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "heightAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 30.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = v38;
  v39[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_cn_flatten");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactNameView addConstraints:](self, "addConstraints:", v22);

}

- (CNContact)contact
{
  return self->_contact;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
