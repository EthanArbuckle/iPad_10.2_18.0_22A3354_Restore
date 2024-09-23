@implementation AAOBCustodianContactSelectorModel

- (AAOBCustodianContactSelectorModel)init
{
  AAOBCustodianContactSelectorModel *v2;
  AAOBCustodianContactSelectorModel *v3;
  NSString *imageName;
  void *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *detailText;
  NSString *primaryButton;
  NSString *secondaryButton;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AAOBCustodianContactSelectorModel;
  v2 = -[AAOBCustodianContactSelectorModel init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    imageName = v2->_imageName;
    v2->_imageName = 0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_CONTACT_SELECTOR_TITLE"), 0, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v3->_title;
    v3->_title = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryAuthKitAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ageOfMajorityForAccount:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_DEFAULT_AGE_OF_MAJORITY"), 0, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_CONTACT_SELECTOR_MESSAGE"), 0, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v17;

    primaryButton = v3->_primaryButton;
    v3->_primaryButton = 0;

    secondaryButton = v3->_secondaryButton;
    v3->_secondaryButton = 0;

  }
  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
