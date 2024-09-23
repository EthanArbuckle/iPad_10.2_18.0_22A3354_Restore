@implementation AAOBAddTrustedContactsModel

- (AAOBAddTrustedContactsModel)init
{
  AAOBAddTrustedContactsModel *v2;
  void *v3;
  uint64_t v4;
  NSString *title;
  void *v6;
  uint64_t v7;
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AAOBAddTrustedContactsModel;
  v2 = -[AAOBAddTrustedContactsModel init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADD_ACCOUNT_CONTACTS"), 0, CFSTR("Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();
    title = v2->_title;
    v2->_title = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_ACCOUNT_CONTACTS_LEARN_MORE"), 0, CFSTR("Localizable"));
    v7 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v2->_helpLinkTitle;
    v2->_helpLinkTitle = (NSString *)v7;

    helpLinkURL = v2->_helpLinkURL;
    v2->_helpLinkURL = (NSString *)CFSTR("www.apple.com");

  }
  return v2;
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
