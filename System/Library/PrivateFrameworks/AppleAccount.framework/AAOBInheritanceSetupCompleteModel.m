@implementation AAOBInheritanceSetupCompleteModel

- (AAOBInheritanceSetupCompleteModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4
{
  return -[AAOBInheritanceSetupCompleteModel initWithBeneficiaryName:accessKeyShareType:inviteType:](self, "initWithBeneficiaryName:accessKeyShareType:inviteType:", a3, a4, 2);
}

- (AAOBInheritanceSetupCompleteModel)initWithBeneficiaryName:(id)a3 accessKeyShareType:(unint64_t)a4 inviteType:(unint64_t)a5
{
  id v8;
  AAOBInheritanceSetupCompleteModel *v9;
  AAOBInheritanceSetupCompleteModel *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  NSString *title;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *detailText;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *primaryButton;
  void *v34;
  uint64_t v35;
  NSString *secondaryButton;
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  objc_super v40;

  v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AAOBInheritanceSetupCompleteModel;
  v9 = -[AAOBInheritanceSetupCompleteModel init](&v40, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageName, CFSTR("legacy_contact_header"));
    if (a4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SETUP_COMPLETE_TITLE"), 0, CFSTR("Localizable"));
      v20 = objc_claimAutoreleasedReturnValue();
      title = v10->_title;
      v10->_title = (NSString *)v20;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), 0, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SETUP_COMPLETE_MESSAGE_AFTER_PRINTING"), 0, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25, v8, v17);
      v26 = objc_claimAutoreleasedReturnValue();
      detailText = v10->_detailText;
      v10->_detailText = (NSString *)v26;

    }
    else
    {
      if (a4)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SETUP_COMPLETE_DONE_TITLE"), 0, CFSTR("Localizable"));
        v32 = objc_claimAutoreleasedReturnValue();
        primaryButton = v10->_primaryButton;
        v10->_primaryButton = (NSString *)v32;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SETUP_COMPLETE_UPDATE_BIRTHDAY_TITLE"), 0, CFSTR("Localizable"));
        v35 = objc_claimAutoreleasedReturnValue();
        secondaryButton = v10->_secondaryButton;
        v10->_secondaryButton = (NSString *)v35;

        helpLinkTitle = v10->_helpLinkTitle;
        v10->_helpLinkTitle = 0;

        helpLinkURL = v10->_helpLinkURL;
        v10->_helpLinkURL = 0;

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (a5 == 1)
      {
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_COMPLETE_TITLE"), 0, CFSTR("Localizable"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v10->_title;
        v10->_title = (NSString *)v13;

        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("INHERITANCE_INVITE_COMPLETE_MESSAGE_AFTER_MESSAGING");
      }
      else
      {
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SETUP_COMPLETE_TITLE"), 0, CFSTR("Localizable"));
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v10->_title;
        v10->_title = (NSString *)v28;

        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("INHERITANCE_SETUP_COMPLETE_MESSAGE_AFTER_MESSAGING");
      }
      objc_msgSend(v16, "localizedStringForKey:value:table:", v18, 0, CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v24, v8);
      v30 = objc_claimAutoreleasedReturnValue();
      v25 = v10->_detailText;
      v10->_detailText = (NSString *)v30;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v10;
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
