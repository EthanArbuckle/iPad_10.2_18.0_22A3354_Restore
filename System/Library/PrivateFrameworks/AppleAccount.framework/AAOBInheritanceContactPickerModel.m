@implementation AAOBInheritanceContactPickerModel

- (AAOBInheritanceContactPickerModel)init
{
  AAOBInheritanceContactPickerModel *v2;
  AAOBInheritanceContactPickerModel *v3;
  NSString *imageName;
  void *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  NSString *detailText;
  NSString *primaryButton;
  NSString *secondaryButton;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AAOBInheritanceContactPickerModel;
  v2 = -[AAOBInheritanceContactPickerModel init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    imageName = v2->_imageName;
    v2->_imageName = 0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_CONTACT_PICKER_TITLE"), 0, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v3->_title;
    v3->_title = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_CONTACT_PICKER_MESSAGE"), 0, CFSTR("Localizable"));
    v9 = objc_claimAutoreleasedReturnValue();
    detailText = v3->_detailText;
    v3->_detailText = (NSString *)v9;

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
