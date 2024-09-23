@implementation HUPresenceUserCell

- (HUPresenceUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  HUPresenceUserCell *v7;
  HUTitleDescriptionContentView *v8;
  HUTitleDescriptionContentView *titleDescriptionView;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CNAvatarViewController *avatarViewController;
  HULayoutContainerView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HULayoutContainerView *avatarContainerView;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  UIImageView *v34;
  UIImageView *checkmarkImageView;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  id location;
  objc_super v45;

  v6 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HUPresenceUserCell;
  v7 = -[HUPresenceUserCell initWithStyle:reuseIdentifier:](&v45, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = objc_alloc_init(HUTitleDescriptionContentView);
    titleDescriptionView = v7->_titleDescriptionView;
    v7->_titleDescriptionView = v8;

    -[HUTitleDescriptionContentView setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleDescriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPresenceUserCell contentView](v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7->_titleDescriptionView);

    v11 = (void *)MEMORY[0x1E0C97480];
    objc_msgSend(MEMORY[0x1E0D31320], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "settingsWithContactStore:threeDTouchEnabled:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97470]), "initWithSettings:", v14);
    avatarViewController = v7->_avatarViewController;
    v7->_avatarViewController = (CNAvatarViewController *)v15;

    objc_initWeak(&location, v7);
    v17 = [HULayoutContainerView alloc];
    -[HUPresenceUserCell avatarViewController](v7, "avatarViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __52__HUPresenceUserCell_initWithStyle_reuseIdentifier___block_invoke;
    v42 = &unk_1E6F57428;
    objc_copyWeak(&v43, &location);
    v20 = -[HULayoutContainerView initWithContentView:layoutBlock:](v17, "initWithContentView:layoutBlock:", v19, &v39);
    avatarContainerView = v7->_avatarContainerView;
    v7->_avatarContainerView = (HULayoutContainerView *)v20;

    -[HULayoutContainerView setTranslatesAutoresizingMaskIntoConstraints:](v7->_avatarContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v39, v40, v41, v42);
    -[HUPresenceUserCell contentView](v7, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v7->_avatarContainerView);

    v23 = (void *)objc_opt_new();
    -[HUPresenceUserCell setBackgroundView:](v7, "setBackgroundView:", v23);

    -[HUPresenceUserCell bounds](v7, "bounds");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[HUPresenceUserCell backgroundView](v7, "backgroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    -[HUPresenceUserCell backgroundView](v7, "backgroundView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAutoresizingMask:", 18);

    v34 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    checkmarkImageView = v7->_checkmarkImageView;
    v7->_checkmarkImageView = v34;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_checkmarkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUPresenceUserCell contentView](v7, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v7->_checkmarkImageView);

    -[HUPresenceUserCell checkmarkImageView](v7, "checkmarkImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell hu_configureCheckmarkForImageView:checked:](v7, "hu_configureCheckmarkForImageView:checked:", v37, 0);

    -[HUPresenceUserCell _setupConstraints](v7, "_setupConstraints");
    -[HUPresenceUserCell _updateCustomSeparatorInset](v7, "_updateCustomSeparatorInset");
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __52__HUPresenceUserCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCustomSeparatorInset");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPresenceUserCell;
  -[HUPresenceUserCell prepareForReuse](&v3, sel_prepareForReuse);
  -[HUPresenceUserCell setUserName:](self, "setUserName:", 0);
  -[HUPresenceUserCell setUserHandle:](self, "setUserHandle:", 0);
  -[HUPresenceUserCell setDeviceName:](self, "setDeviceName:", 0);
  -[HUPresenceUserCell setDisabled:](self, "setDisabled:", 0);
  -[HUPresenceUserCell setChecked:](self, "setChecked:", 0);
  -[HUPresenceUserCell setLocationUnavailable:](self, "setLocationUnavailable:", 0);
}

- (void)setUserName:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_userName, a3);
  v5 = a3;
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleText:", v5);

}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
  -[HUPresenceUserCell _updateDescriptionText](self, "_updateDescriptionText");
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
    -[HUPresenceUserCell avatarViewController](self, "avatarViewController");
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
    -[HUPresenceUserCell avatarViewController](self, "avatarViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContacts:", v11);

  }
  else
  {
    -[HUPresenceUserCell avatarViewController](self, "avatarViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContacts:", MEMORY[0x1E0C9AA60]);

  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_disabled = a3;
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisabled:", v3);

}

- (void)setLocationUnavailable:(BOOL)a3
{
  self->_locationUnavailable = a3;
  -[HUPresenceUserCell _updateDescriptionText](self, "_updateDescriptionText");
}

- (void)_updateDescriptionText
{
  void *v3;
  id v4;

  if (-[HUPresenceUserCell isLocationUnavailable](self, "isLocationUnavailable"))
    _HULocalizedStringWithDefaultValue(CFSTR("HUPresenceEventUnsupportedUserDescriptionText"), CFSTR("HUPresenceEventUnsupportedUserDescriptionText"), 1);
  else
    -[HUPresenceUserCell deviceName](self, "deviceName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDescriptionText:", v4);

}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_checked != a3)
  {
    v3 = a3;
    self->_checked = a3;
    -[HUPresenceUserCell checkmarkImageView](self, "checkmarkImageView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell hu_configureCheckmarkForImageView:checked:](self, "hu_configureCheckmarkForImageView:checked:", v5, v3);

  }
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[14];

  v64[12] = *MEMORY[0x1E0C80C00];
  -[HUPresenceUserCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintGreaterThanOrEqualToConstant:", 60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = 1148829696;
  v63 = v5;
  objc_msgSend(v5, "setPriority:", v6);
  v39 = (void *)MEMORY[0x1E0CB3718];
  v64[0] = v5;
  -[HUPresenceUserCell checkmarkImageView](self, "checkmarkImageView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "layoutMarginsGuide");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 28.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v57;
  -[HUPresenceUserCell checkmarkImageView](self, "checkmarkImageView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "centerYAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layoutMarginsGuide");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v51;
  -[HUPresenceUserCell checkmarkImageView](self, "checkmarkImageView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v46;
  -[HUPresenceUserCell avatarContainerView](self, "avatarContainerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell checkmarkImageView](self, "checkmarkImageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 15.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v41;
  -[HUPresenceUserCell avatarContainerView](self, "avatarContainerView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "centerYAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v35;
  -[HUPresenceUserCell avatarContainerView](self, "avatarContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToConstant:", 37.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v32;
  -[HUPresenceUserCell avatarContainerView](self, "avatarContainerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 37.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v29;
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell avatarContainerView](self, "avatarContainerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 12.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v24;
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v19;
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v9;
  -[HUPresenceUserCell titleDescriptionView](self, "titleDescriptionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPresenceUserCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readableContentGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activateConstraints:", v16);

}

- (void)_updateCustomSeparatorInset
{
  double v3;
  id v4;

  -[HUPresenceUserCell avatarContainerView](self, "avatarContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[HUPresenceUserCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v3, 0.0, 0.0);

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (HFUserHandle)userHandle
{
  return self->_userHandle;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (BOOL)isLocationUnavailable
{
  return self->_locationUnavailable;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (HUTitleDescriptionContentView)titleDescriptionView
{
  return self->_titleDescriptionView;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (HULayoutContainerView)avatarContainerView
{
  return self->_avatarContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarContainerView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_titleDescriptionView, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_userName, 0);
}

@end
