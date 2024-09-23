@implementation AAAccountContactPromptModel

- (AAAccountContactPromptModel)init
{
  AAAccountContactPromptModel *v2;
  void *v3;
  uint64_t v4;
  NSString *doneButtonTitle;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAAccountContactPromptModel;
  v2 = -[AAAccountContactPromptModel init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DONE"), 0, CFSTR("Localizable"));
    v4 = objc_claimAutoreleasedReturnValue();
    doneButtonTitle = v2->_doneButtonTitle;
    v2->_doneButtonTitle = (NSString *)v4;

  }
  return v2;
}

- (AALocalContactInfo)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)detailsSubtitle
{
  return self->_detailsSubtitle;
}

- (void)setDetailsSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryActionText
{
  return self->_primaryActionText;
}

- (void)setPrimaryActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)secondaryActionText
{
  return self->_secondaryActionText;
}

- (void)setSecondaryActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)destructiveActionText
{
  return self->_destructiveActionText;
}

- (void)setDestructiveActionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)destructiveActionSheetTitle
{
  return self->_destructiveActionSheetTitle;
}

- (void)setDestructiveActionSheetTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)destructiveActionSheetDetails
{
  return self->_destructiveActionSheetDetails;
}

- (void)setDestructiveActionSheetDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)destructiveActionSheetCancelText
{
  return self->_destructiveActionSheetCancelText;
}

- (void)setDestructiveActionSheetCancelText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)primaryActionRequiresAuth
{
  return self->_primaryActionRequiresAuth;
}

- (void)setPrimaryActionRequiresAuth:(BOOL)a3
{
  self->_primaryActionRequiresAuth = a3;
}

- (BOOL)destructiveActionRequiresAuth
{
  return self->_destructiveActionRequiresAuth;
}

- (void)setDestructiveActionRequiresAuth:(BOOL)a3
{
  self->_destructiveActionRequiresAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_destructiveActionSheetCancelText, 0);
  objc_storeStrong((id *)&self->_destructiveActionSheetDetails, 0);
  objc_storeStrong((id *)&self->_destructiveActionSheetTitle, 0);
  objc_storeStrong((id *)&self->_destructiveActionText, 0);
  objc_storeStrong((id *)&self->_secondaryActionText, 0);
  objc_storeStrong((id *)&self->_primaryActionText, 0);
  objc_storeStrong((id *)&self->_detailsSubtitle, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
