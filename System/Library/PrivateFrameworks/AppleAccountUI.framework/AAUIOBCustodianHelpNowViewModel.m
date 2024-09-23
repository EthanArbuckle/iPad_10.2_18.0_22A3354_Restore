@implementation AAUIOBCustodianHelpNowViewModel

- (AAUIOBCustodianHelpNowViewModel)initWithRecoveryCode:(id)a3 ownerName:(id)a4
{
  AAUIOBCustodianHelpNowViewModel *v4;
  AAUIOBCustodianHelpNowViewModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUIOBCustodianHelpNowViewModel;
  v4 = -[AAOBCustodianHelpNowModel initWithRecoveryCode:ownerName:](&v7, sel_initWithRecoveryCode_ownerName_, a3, a4);
  v5 = v4;
  if (v4)
    -[AAUIOBCustodianHelpNowViewModel _setupAAUIOBWelcomeControllerProtocolProperties](v4, "_setupAAUIOBWelcomeControllerProtocolProperties");
  return v5;
}

- (AAUIOBCustodianHelpNowViewModel)initWithModel:(id)a3
{
  id v4;
  AAUIOBCustodianHelpNowViewModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AAUIOBCustodianHelpNowViewModel;
  v5 = -[AAUIOBCustodianHelpNowViewModel init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "detailText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBCustodianHelpNowViewModel setDetailText:](v5, "setDetailText:", v6);

    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBCustodianHelpNowViewModel setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "primaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianHelpNowModel setPrimaryButton:](v5, "setPrimaryButton:", v8);

    objc_msgSend(v4, "secondaryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAOBCustodianHelpNowModel setSecondaryButton:](v5, "setSecondaryButton:", v9);

    objc_msgSend(v4, "imageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBCustodianHelpNowViewModel setImageName:](v5, "setImageName:", v10);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v4;
      objc_msgSend(v11, "recoveryCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAOBCustodianHelpNowModel setRecoveryCode:](v5, "setRecoveryCode:", v12);

      objc_msgSend(v11, "ownerName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[AAOBCustodianHelpNowModel setOwnerName:](v5, "setOwnerName:", v13);
    }
    -[AAUIOBCustodianHelpNowViewModel _setupAAUIOBWelcomeControllerProtocolProperties](v5, "_setupAAUIOBWelcomeControllerProtocolProperties");
  }

  return v5;
}

- (void)_setupAAUIOBWelcomeControllerProtocolProperties
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *detailText;
  AAUICustodianHelpCodeView *v15;
  UIView *v16;
  void *v17;
  UIView *contentView;

  -[AAUIOBCustodianHelpNowViewModel imageName](self, "imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0DC3870];
    -[AAUIOBCustodianHelpNowViewModel imageName](self, "imageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIOBCustodianHelpNowViewModel setImage:](self, "setImage:", v8);

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[AAUIOBCustodianHelpNowViewModel detailText](self, "detailText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel ownerName](self, "ownerName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel ownerName](self, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  detailText = self->_detailText;
  self->_detailText = v13;

  v15 = [AAUICustodianHelpCodeView alloc];
  v16 = -[AAUICustodianHelpCodeView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AAOBCustodianHelpNowModel recoveryCode](self, "recoveryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setText:](v16, "setText:", v17);

  contentView = self->_contentView;
  self->_contentView = v16;

  self->_contentViewLayout = 2;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
