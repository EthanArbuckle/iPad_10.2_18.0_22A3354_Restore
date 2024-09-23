@implementation AAOBCustodianHelpNowModel

- (AAOBCustodianHelpNowModel)initWithRecoveryCode:(id)a3 ownerName:(id)a4
{
  id v7;
  id v8;
  AAOBCustodianHelpNowModel *v9;
  AAOBCustodianHelpNowModel *v10;
  void *v11;
  uint64_t v12;
  NSString *title;
  void *v14;
  uint64_t v15;
  NSString *detailText;
  void *v17;
  uint64_t v18;
  NSString *primaryButton;
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  NSString *imageName;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AAOBCustodianHelpNowModel;
  v9 = -[AAOBCustodianHelpNowModel init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recoveryCode, a3);
    objc_storeStrong((id *)&v10->_ownerName, a4);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_HELP_NOW_TITLE"), 0, CFSTR("Localizable"));
    v12 = objc_claimAutoreleasedReturnValue();
    title = v10->_title;
    v10->_title = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_HELP_NOW_TEXT"), 0, CFSTR("Localizable"));
    v15 = objc_claimAutoreleasedReturnValue();
    detailText = v10->_detailText;
    v10->_detailText = (NSString *)v15;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_HELP_NOW_DONE_BUTTON"), 0, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();
    primaryButton = v10->_primaryButton;
    v10->_primaryButton = (NSString *)v18;

    helpLinkTitle = v10->_helpLinkTitle;
    v10->_helpLinkTitle = 0;

    helpLinkURL = v10->_helpLinkURL;
    v10->_helpLinkURL = 0;

    imageName = v10->_imageName;
    v10->_imageName = (NSString *)CFSTR("recovery_contact_shield");

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *imageName;
  id v5;

  imageName = self->_imageName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", imageName, CFSTR("_imageName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailText, CFSTR("_detailText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryButton, CFSTR(" _primaryButton"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryButton, CFSTR("_secondaryButton"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_helpLinkTitle, CFSTR("_helpLinkTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_helpLinkURL, CFSTR("_helpLinkURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recoveryCode, CFSTR("_recoveryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerName, CFSTR("_ownerName"));

}

- (AAOBCustodianHelpNowModel)initWithCoder:(id)a3
{
  id v4;
  AAOBCustodianHelpNowModel *v5;
  uint64_t v6;
  NSString *imageName;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *detailText;
  uint64_t v12;
  NSString *primaryButton;
  uint64_t v14;
  NSString *secondaryButton;
  uint64_t v16;
  NSString *helpLinkTitle;
  uint64_t v18;
  NSString *helpLinkURL;
  uint64_t v20;
  NSString *recoveryCode;
  uint64_t v22;
  NSString *ownerName;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAOBCustodianHelpNowModel;
  v5 = -[AAOBCustodianHelpNowModel init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageName"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_detailText"));
    v10 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR(" _primaryButton"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secondaryButton"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_helpLinkTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_helpLinkURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recoveryCode"));
    v20 = objc_claimAutoreleasedReturnValue();
    recoveryCode = v5->_recoveryCode;
    v5->_recoveryCode = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerName"));
    v22 = objc_claimAutoreleasedReturnValue();
    ownerName = v5->_ownerName;
    v5->_ownerName = (NSString *)v22;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAOBCustodianHelpNowModel *v4;
  uint64_t v5;
  NSString *imageName;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *detailText;
  uint64_t v11;
  NSString *primaryButton;
  uint64_t v13;
  NSString *secondaryButton;
  uint64_t v15;
  NSString *helpLinkTitle;
  uint64_t v17;
  NSString *helpLinkURL;
  uint64_t v19;
  NSString *recoveryCode;
  uint64_t v21;
  NSString *ownerName;

  v4 = objc_alloc_init(AAOBCustodianHelpNowModel);
  v5 = -[NSString copy](self->_imageName, "copy");
  imageName = v4->_imageName;
  v4->_imageName = (NSString *)v5;

  v7 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v7;

  v9 = -[NSString copy](self->_detailText, "copy");
  detailText = v4->_detailText;
  v4->_detailText = (NSString *)v9;

  v11 = -[NSString copy](self->_primaryButton, "copy");
  primaryButton = v4->_primaryButton;
  v4->_primaryButton = (NSString *)v11;

  v13 = -[NSString copy](self->_secondaryButton, "copy");
  secondaryButton = v4->_secondaryButton;
  v4->_secondaryButton = (NSString *)v13;

  v15 = -[NSString copy](self->_helpLinkTitle, "copy");
  helpLinkTitle = v4->_helpLinkTitle;
  v4->_helpLinkTitle = (NSString *)v15;

  v17 = -[NSString copy](self->_helpLinkURL, "copy");
  helpLinkURL = v4->_helpLinkURL;
  v4->_helpLinkURL = (NSString *)v17;

  v19 = -[NSString copy](self->_recoveryCode, "copy");
  recoveryCode = v4->_recoveryCode;
  v4->_recoveryCode = (NSString *)v19;

  v21 = -[NSString copy](self->_ownerName, "copy");
  ownerName = v4->_ownerName;
  v4->_ownerName = (NSString *)v21;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AAOBCustodianHelpNowModel imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel primaryButton](self, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel secondaryButton](self, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel helpLinkTitle](self, "helpLinkTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel helpLinkURL](self, "helpLinkURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel recoveryCode](self, "recoveryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianHelpNowModel ownerName](self, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nrecoveryCode: %@\nownerName: %@\n"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
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

- (NSString)recoveryCode
{
  return self->_recoveryCode;
}

- (void)setRecoveryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_recoveryCode, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
