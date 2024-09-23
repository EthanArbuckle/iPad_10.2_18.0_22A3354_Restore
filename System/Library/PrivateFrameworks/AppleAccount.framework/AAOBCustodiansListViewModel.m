@implementation AAOBCustodiansListViewModel

- (AAOBCustodiansListViewModel)init
{
  AAOBCustodiansListViewModel *v2;
  void *v3;
  uint64_t v4;
  NSString *title;
  void *v6;
  uint64_t v7;
  NSString *detailText;
  void *v9;
  uint64_t v10;
  NSString *primaryButton;
  void *v12;
  uint64_t v13;
  NSString *secondaryButton;
  uint64_t v15;
  AAContactsManager *contactsManager;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AAOBCustodiansListViewModel;
  v2 = -[AAOBCustodiansListViewModel init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_LIST_VIEW_TITLE"), 0, CFSTR("Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();
    title = v2->_title;
    v2->_title = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_LIST_VIEW_DETAIL_TEXT"), 0, CFSTR("Localizable"));
    v7 = objc_claimAutoreleasedReturnValue();
    detailText = v2->_detailText;
    v2->_detailText = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_LIST_VIEW_PRIMARY_BUTTON"), 0, CFSTR("Localizable"));
    v10 = objc_claimAutoreleasedReturnValue();
    primaryButton = v2->_primaryButton;
    v2->_primaryButton = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_LIST_VIEW_SECONDARY_BUTTON"), 0, CFSTR("Localizable"));
    v13 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v2->_secondaryButton;
    v2->_secondaryButton = (NSString *)v13;

    v15 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (AAContactsManager *)v15;

  }
  return v2;
}

- (AAOBCustodiansListViewModel)initWithContacts:(id)a3
{
  id v5;
  AAOBCustodiansListViewModel *v6;
  AAOBCustodiansListViewModel *v7;

  v5 = a3;
  v6 = -[AAOBCustodiansListViewModel init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contacts, a3);
    -[AAOBCustodiansListViewModel _updatePrimaryButtonTitle](v7, "_updatePrimaryButtonTitle");
  }

  return v7;
}

- (id)contacts
{
  return (id)-[NSArray copy](self->_contacts, "copy");
}

- (void)_updatePrimaryButtonTitle
{
  void *v3;
  AAContactsManager *contactsManager;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSString *primaryButton;
  id v12;

  if (-[NSArray count](self->_contacts, "count") == 1)
  {
    -[NSArray firstObject](self->_contacts, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    contactsManager = self->_contactsManager;
    v12 = v3;
    objc_msgSend(v3, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAContactsManager contactForHandle:](contactsManager, "contactForHandle:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "phoneNumbers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_LIST_VIEW_PRIMARY_BUTTON_CONTINUE"), 0, CFSTR("Localizable"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        primaryButton = self->_primaryButton;
        self->_primaryButton = v10;

      }
    }

  }
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
