@implementation HUAvatarContentView

- (HUAvatarContentView)initWithConfiguration:(id)a3
{
  id v4;
  HUAvatarContentView *v5;
  HUAvatarContentView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CNAvatarViewController *avatarViewController;
  void *v13;
  void *v14;
  uint64_t v15;
  UIListContentView *listContentView;
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
  double v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)HUAvatarContentView;
  v5 = -[HUAvatarContentView initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    -[HUAvatarContentView setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 1);
    v6->_avatarSize = 37.0;
    v7 = (void *)MEMORY[0x1E0C97480];
    objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backingStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settingsWithContactStore:threeDTouchEnabled:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97470]), "initWithSettings:", v10);
    avatarViewController = v6->_avatarViewController;
    v6->_avatarViewController = (CNAvatarViewController *)v11;

    -[HUAvatarContentView avatarView](v6, "avatarView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUAvatarContentView avatarView](v6, "avatarView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView addSubview:](v6, "addSubview:", v14);

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA720]), "initWithConfiguration:", v4);
    listContentView = v6->_listContentView;
    v6->_listContentView = (UIListContentView *)v15;

    -[UIListContentView setTranslatesAutoresizingMaskIntoConstraints:](v6->_listContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUAvatarContentView addSubview:](v6, "addSubview:", v6->_listContentView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView avatarView](v6, "avatarView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView centerYAnchor](v6, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v21);

    -[HUAvatarContentView avatarView](v6, "avatarView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView avatarView](v6, "avatarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v26);

    -[HUAvatarContentView avatarView](v6, "avatarView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", v6->_avatarSize);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView setAvatarWidth:](v6, "setAvatarWidth:", v29);

    -[HUAvatarContentView avatarWidth](v6, "avatarWidth");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v30);

    -[HUAvatarContentView listContentView](v6, "listContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView topAnchor](v6, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v34);

    -[HUAvatarContentView listContentView](v6, "listContentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView bottomAnchor](v6, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v38);

    -[HUAvatarContentView listContentView](v6, "listContentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView layoutMarginsGuide](v6, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v43);

    -[HUAvatarContentView listContentView](v6, "listContentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "heightAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintGreaterThanOrEqualToConstant:", 60.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v47) = 1148829696;
    objc_msgSend(v46, "setPriority:", v47);
    objc_msgSend(v17, "addObject:", v46);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);

  }
  return v6;
}

- (void)setConfiguration:(id)a3
{
  id v4;
  UIContentConfiguration *v5;
  UIContentConfiguration *configuration;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
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
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (UIContentConfiguration *)objc_msgSend(v4, "copyWithZone:", 0);
  configuration = self->_configuration;
  self->_configuration = v5;

  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
    goto LABEL_14;
  objc_msgSend(v9, "text");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HUAvatarContentView userHandle](self, "userHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      objc_msgSend(v9, "image");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_10;
      v31 = (void *)MEMORY[0x1E0C97360];
      objc_msgSend(v9, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "contactWithDisplayName:emailOrPhoneNumber:", v32, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAvatarContentView avatarViewController](self, "avatarViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setContacts:", v33);

    }
  }
LABEL_10:
  -[HUAvatarContentView listContentView](self, "listContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setConfiguration:", v9);

  v15 = (void *)MEMORY[0x1E0CB3718];
  -[HUAvatarContentView dynamicConstraints](self, "dynamicConstraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deactivateConstraints:", v16);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAvatarContentView avatarView](self, "avatarView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    objc_msgSend(v19, "setHidden:", 1);

    -[HUAvatarContentView listContentView](self, "listContentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView leadingAnchor](self, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v24);
  }
  else
  {
    objc_msgSend(v19, "setHidden:", 0);

    -[HUAvatarContentView avatarView](self, "avatarView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView layoutMarginsGuide](self, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v29);

    -[HUAvatarContentView avatarView](self, "avatarView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView listContentView](self, "listContentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v30);

  }
  -[HUAvatarContentView setDynamicConstraints:](self, "setDynamicConstraints:", v17);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v17);

LABEL_14:
}

- (void)setUserHandle:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_userHandle, a3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView avatarViewController](self, "avatarViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptorForRequiredKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactForUserHandle:withKeys:", v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvatarContentView avatarViewController](self, "avatarViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContacts:", v11);

  }
  else
  {
    -[HUAvatarContentView avatarViewController](self, "avatarViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContacts:", MEMORY[0x1E0C9AA60]);

  }
}

- (UIView)avatarView
{
  void *v2;
  void *v3;

  -[HUAvatarContentView avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setAvatarSize:(double)a3
{
  id v4;

  self->_avatarSize = a3;
  -[HUAvatarContentView avatarWidth](self, "avatarWidth");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", a3);

}

- (UIContentConfiguration)configuration
{
  return self->_configuration;
}

- (HFUserHandle)userHandle
{
  return self->_userHandle;
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (double)avatarSize
{
  return self->_avatarSize;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicConstraints, a3);
}

- (NSLayoutConstraint)avatarWidth
{
  return self->_avatarWidth;
}

- (void)setAvatarWidth:(id)a3
{
  objc_storeStrong((id *)&self->_avatarWidth, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarWidth, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
