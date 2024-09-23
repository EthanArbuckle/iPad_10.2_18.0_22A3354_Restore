@implementation AAOBInheritanceShareAccessKeyOptionsModel

- (AAOBInheritanceShareAccessKeyOptionsModel)initWithBeneficiaryName:(id)a3
{
  return -[AAOBInheritanceShareAccessKeyOptionsModel initWithBeneficiaryName:handle:](self, "initWithBeneficiaryName:handle:", a3, &stru_1E41752F8);
}

- (AAOBInheritanceShareAccessKeyOptionsModel)initWithBeneficiaryName:(id)a3 handle:(id)a4
{
  id v7;
  id v8;
  AAOBInheritanceShareAccessKeyOptionsModel *v9;
  AAOBInheritanceShareAccessKeyOptionsModel *v10;
  NSString *imageName;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  uint64_t v16;
  NSString *detailText;
  void *v18;
  uint64_t v19;
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  NSString *primaryButton;
  NSString *secondaryButton;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_beneficiaryName, a3);
  v25.receiver = self;
  v25.super_class = (Class)AAOBInheritanceShareAccessKeyOptionsModel;
  v9 = -[AAOBInheritanceShareAccessKeyOptionsModel init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    imageName = v9->_imageName;
    v9->_imageName = 0;

    objc_storeStrong((id *)&v10->_recipientHandle, a4);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_KEY_OPTIONS_TITLE"), 0, CFSTR("Localizable"));
    v13 = objc_claimAutoreleasedReturnValue();
    title = v10->_title;
    v10->_title = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_KEY_OPTIONS_MESSAGE"), 0, CFSTR("Localizable"));
    v16 = objc_claimAutoreleasedReturnValue();
    detailText = v10->_detailText;
    v10->_detailText = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_KEY_OPTIONS_LEARNMORE_TITLE"), 0, CFSTR("Localizable"));
    v19 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v10->_helpLinkTitle;
    v10->_helpLinkTitle = (NSString *)v19;

    helpLinkURL = v10->_helpLinkURL;
    v10->_helpLinkURL = (NSString *)CFSTR("https://support.apple.com/kb/HT212360");

    primaryButton = v10->_primaryButton;
    v10->_primaryButton = 0;

    secondaryButton = v10->_secondaryButton;
    v10->_secondaryButton = 0;

  }
  return v10;
}

- (id)defaultSharingOptions
{
  return &unk_1E41A6918;
}

- (id)availableSharingOptions
{
  return &unk_1E41A6930;
}

- (void)availableSharingOptionsWithCompletion:(id)a3
{
  id v4;
  NSString *recipientHandle;
  AAMessagingDestination *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  recipientHandle = self->_recipientHandle;
  if (recipientHandle && -[NSString length](recipientHandle, "length"))
  {
    v6 = -[AAMessagingDestination initWithHandle:]([AAMessagingDestination alloc], "initWithHandle:", self->_recipientHandle);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__AAOBInheritanceShareAccessKeyOptionsModel_availableSharingOptionsWithCompletion___block_invoke;
    v9[3] = &unk_1E416ED28;
    v10 = v4;
    -[AAMessagingDestination isRegisteredToiMessageWithCompletion:](v6, "isRegisteredToiMessageWithCompletion:", v9);

  }
  else
  {
    _AALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19EACA000, v7, OS_LOG_TYPE_DEFAULT, "Handle is either nil or empty.", v8, 2u);
    }

    -[AAOBInheritanceShareAccessKeyOptionsModel defaultSharingOptions](self, "defaultSharingOptions");
    v6 = (AAMessagingDestination *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, AAMessagingDestination *))v4 + 2))(v4, v6);
  }

}

uint64_t __83__AAOBInheritanceShareAccessKeyOptionsModel_availableSharingOptionsWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t (*v6)(void);
  uint8_t v8[16];
  uint8_t buf[16];

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "The contact with is iMessage-able.", buf, 2u);
    }

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "The contact with is not iMessage-able.", v8, 2u);
    }

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v6();
}

- (id)titleForShareAccessKeyType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("INHERITANCE_SHARE_KEY_OPTION_PRINT_TITLE");
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("INHERITANCE_SHARE_KEY_OPTION_MESSAGE_TITLE");
LABEL_5:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)detailTextForShareAccessKeyType:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_KEY_OPTION_PRINT_DETAILTEXT"), 0, CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_KEY_OPTION_MESSAGE_DETAILTEXT"), 0, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, self->_beneficiaryName);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  }
  return v3;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)recipientHandle
{
  return self->_recipientHandle;
}

- (void)setRecipientHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_storeStrong((id *)&self->_beneficiaryName, 0);
}

@end
