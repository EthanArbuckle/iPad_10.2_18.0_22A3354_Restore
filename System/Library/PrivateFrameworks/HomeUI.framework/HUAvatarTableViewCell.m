@implementation HUAvatarTableViewCell

- (HUAvatarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUAvatarTableViewCell *v4;
  HUAvatarContentView *v5;
  void *v6;
  uint64_t v7;
  HUAvatarContentView *avatarContentView;
  void *v9;
  uint64_t v10;
  UIContentConfiguration *contentConfiguration;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUAvatarTableViewCell;
  v4 = -[HUAvatarTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [HUAvatarContentView alloc];
    objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUAvatarContentView initWithConfiguration:](v5, "initWithConfiguration:", v6);
    avatarContentView = v4->_avatarContentView;
    v4->_avatarContentView = (HUAvatarContentView *)v7;

    -[HUAvatarTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_avatarContentView);

    v4->_showAccessLevelDescription = 0;
    -[HUAvatarTableViewCell defaultContentConfiguration](v4, "defaultContentConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
    contentConfiguration = v4->_contentConfiguration;
    v4->_contentConfiguration = (UIContentConfiguration *)v10;

    -[HUAvatarTableViewCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell userHandle](self, "userHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("userHandle"));

  -[HUAvatarTableViewCell item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("item"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAvatarTableViewCell;
  -[HUAvatarTableViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUAvatarTableViewCell setUserHandle:](self, "setUserHandle:", 0);
  -[HUAvatarTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v3);

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUAvatarTableViewCell;
  -[HUAvatarTableViewCell layoutSubviews](&v22, sel_layoutSubviews);
  v3 = -[HUAvatarTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "listContentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v16, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;

  if (v3 == 1)
  {
    -[HUAvatarTableViewCell bounds](self, "bounds");
    v18 = v21 - (v18 + v20);
  }
  -[HUAvatarTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v18, 0.0, 0.0);
}

- (HFUserHandle)userHandle
{
  void *v2;
  void *v3;

  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFUserHandle *)v3;
}

- (void)setUserHandle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserHandle:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUAvatarTableViewCell defaultContentConfiguration](self, "defaultContentConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUListContentConfigurationUtilities labelConfiguration:forItem:](HUListContentConfigurationUtilities, "labelConfiguration:forItem:", v4, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUAvatarTableViewCell item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D38]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUAvatarTableViewCell showAccessLevelDescription](self, "showAccessLevelDescription") && v8)
    objc_msgSend(v9, "setSecondaryText:", v8);
  -[HUAvatarTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v9);

}

- (void)setContentConfiguration:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_contentConfiguration, a3);
  v5 = a3;
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfiguration:", v5);

}

- (void)setAvatarSize:(double)a3
{
  id v4;

  self->_avatarSize = a3;
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvatarSize:", a3);

}

- (void)_setupConstraints
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)MEMORY[0x1E0CB3718];
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  -[HUAvatarTableViewCell avatarContentView](self, "avatarContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v13);

}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (id)contentConfiguration
{
  return self->_contentConfiguration;
}

- (double)avatarSize
{
  return self->_avatarSize;
}

- (BOOL)showAccessLevelDescription
{
  return self->_showAccessLevelDescription;
}

- (void)setShowAccessLevelDescription:(BOOL)a3
{
  self->_showAccessLevelDescription = a3;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (UIView)avatarView
{
  return self->_avatarView;
}

- (HUAvatarContentView)avatarContentView
{
  return self->_avatarContentView;
}

- (void)setAvatarContentView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarContentView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
