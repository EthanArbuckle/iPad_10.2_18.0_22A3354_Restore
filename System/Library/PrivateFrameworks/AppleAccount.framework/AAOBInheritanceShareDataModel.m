@implementation AAOBInheritanceShareDataModel

- (AAOBInheritanceShareDataModel)initWithBeneficiaryName:(id)a3
{
  id v4;
  AAOBInheritanceShareDataModel *v5;
  AAOBInheritanceShareDataModel *v6;
  NSString *imageName;
  void *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *detailText;
  void *v16;
  uint64_t v17;
  NSString *helpLinkTitle;
  void *v19;
  uint64_t v20;
  NSString *primaryButton;
  NSString *secondaryButton;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AAOBInheritanceShareDataModel;
  v5 = -[AAOBInheritanceShareDataModel init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    imageName = v5->_imageName;
    v5->_imageName = 0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_DATA_TITLE"), 0, CFSTR("Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_DATA_MESSAGE"), 0, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13, v4);
    v14 = objc_claimAutoreleasedReturnValue();
    detailText = v6->_detailText;
    v6->_detailText = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_DATA_LEARNMORE_TITLE"), 0, CFSTR("Localizable"));
    v17 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v6->_helpLinkTitle;
    v6->_helpLinkTitle = (NSString *)v17;

    objc_storeStrong((id *)&v6->_helpLinkURL, CFSTR("https://support.apple.com/kb/HT212360"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_SHARE_DATA_CONTINUE_TITLE"), 0, CFSTR("Localizable"));
    v20 = objc_claimAutoreleasedReturnValue();
    primaryButton = v6->_primaryButton;
    v6->_primaryButton = (NSString *)v20;

    secondaryButton = v6->_secondaryButton;
    v6->_secondaryButton = 0;

  }
  return v6;
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
