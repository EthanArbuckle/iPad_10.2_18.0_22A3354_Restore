@implementation HUAvatarCollectionViewCell

- (HUAvatarCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUAvatarCollectionViewCell *v3;
  HUAvatarContentView *v4;
  void *v5;
  uint64_t v6;
  HUAvatarContentView *avatarContentView;
  void *v8;
  uint64_t v9;
  UIContentConfiguration *contentConfiguration;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUAvatarCollectionViewCell;
  v3 = -[HUAvatarCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [HUAvatarContentView alloc];
    objc_msgSend(MEMORY[0x1E0CEA718], "cellConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUAvatarContentView initWithConfiguration:](v4, "initWithConfiguration:", v5);
    avatarContentView = v3->_avatarContentView;
    v3->_avatarContentView = (HUAvatarContentView *)v6;

    -[HUAvatarCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v3->_avatarContentView);

    v3->_showAccessLevelDescription = 0;
    -[HUAvatarCollectionViewCell defaultContentConfiguration](v3, "defaultContentConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    contentConfiguration = v3->_contentConfiguration;
    v3->_contentConfiguration = (UIContentConfiguration *)v9;

    -[HUAvatarCollectionViewCell _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
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
  -[HUAvatarCollectionViewCell userHandle](self, "userHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("userHandle"));

  -[HUAvatarCollectionViewCell item](self, "item");
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
  v5.super_class = (Class)HUAvatarCollectionViewCell;
  -[HUAvatarCollectionViewCell prepareForReuse](&v5, sel_prepareForReuse);
  -[HUAvatarCollectionViewCell setUserHandle:](self, "setUserHandle:", 0);
  -[HUAvatarCollectionViewCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v3);

}

- (HFUserHandle)userHandle
{
  void *v2;
  void *v3;

  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
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
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
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

  -[HUAvatarCollectionViewCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HUAvatarCollectionViewCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HUAvatarCollectionViewCell showAccessLevelDescription](self, "showAccessLevelDescription") && v7)
    objc_msgSend(v9, "setSecondaryText:", v7);
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration:", v9);

}

- (void)setContentConfiguration:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_contentConfiguration, a3);
  v5 = a3;
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfiguration:", v5);

}

- (void)setAvatarSize:(double)a3
{
  id v4;

  self->_avatarSize = a3;
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
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
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)MEMORY[0x1E0CB3718];
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarCollectionViewCell contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarCollectionViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarCollectionViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  -[HUAvatarCollectionViewCell avatarContentView](self, "avatarContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAvatarCollectionViewCell contentView](self, "contentView");
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

- (HUAvatarContentView)avatarContentView
{
  return self->_avatarContentView;
}

- (void)setAvatarContentView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarContentView, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_avatarContentView, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
