@implementation AAWalrusRecoveryContactRemovedScreenModel

- (AAWalrusRecoveryContactRemovedScreenModel)initWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  AAWalrusRecoveryContactRemovedScreenModel *v6;
  AAWalrusRecoveryContactRemovedScreenModel *v7;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAWalrusRecoveryContactRemovedScreenModel;
  v6 = -[AAWalrusRecoveryContactRemovedScreenModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[AAWalrusRecoveryContactRemovedScreenModel _setupModelWithHasRecoveryContact:hasRecoveryKey:](v6, "_setupModelWithHasRecoveryContact:hasRecoveryKey:", v5, v4);
  return v7;
}

- (void)_setupModelWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RECOVERY_CONTACT_REMOVED_TITLE_IOS"), 0, CFSTR("Localizable-Walrus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAWalrusRecoveryContactRemovedScreenModel setTitle:](self, "setTitle:", v8);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
  {
    v11 = CFSTR("REMOVE_RECOVERY_CONTACT_DETAIL_HAS_ANOTHER_RC");
  }
  else
  {
    if (!a4)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_DETAIL_DEFAULT"), 0, CFSTR("Localizable-Walrus"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAWalrusRecoveryContactRemovedScreenModel setDetailText:](self, "setDetailText:", v14);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_PRIMARY_BUTTON"), 0, CFSTR("Localizable-Walrus"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAWalrusRecoveryContactRemovedScreenModel setPrimaryButton:](self, "setPrimaryButton:", v16);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_SECOND_BUTTON"), 0, CFSTR("Localizable-Walrus"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAWalrusRecoveryContactRemovedScreenModel setSecondaryButton:](self, "setSecondaryButton:", v18);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_NOT_NOW_BUTTON"), 0, CFSTR("Localizable-Walrus"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAWalrusRecoveryContactRemovedScreenModel setLeftBarButton:](self, "setLeftBarButton:", v13);
      goto LABEL_7;
    }
    v11 = CFSTR("REMOVE_RECOVERY_CONTACT_DETAIL_HAS_RK");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, 0, CFSTR("Localizable-Walrus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAWalrusRecoveryContactRemovedScreenModel setDetailText:](self, "setDetailText:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECOVERY_CONTACT_DONE_BUTTON"), 0, CFSTR("Localizable-Walrus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAWalrusRecoveryContactRemovedScreenModel setPrimaryButton:](self, "setPrimaryButton:", v13);
LABEL_7:

}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)leftBarButton
{
  return self->_leftBarButton;
}

- (void)setLeftBarButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftBarButton, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
