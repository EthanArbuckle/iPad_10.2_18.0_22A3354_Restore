@implementation AAOBInheritanceInviteMessageModel

- (AAOBInheritanceInviteMessageModel)initWithBeneficiaryName:(id)a3
{
  id v5;
  AAOBInheritanceInviteMessageModel *v6;
  AAOBInheritanceInviteMessageModel *v7;
  NSString *imageName;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *title;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *detailText;
  void *v19;
  uint64_t v20;
  NSString *primaryButton;
  void *v22;
  uint64_t v23;
  NSString *secondaryButton;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *bubbleText;
  objc_super v31;

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AAOBInheritanceInviteMessageModel;
  v6 = -[AAOBInheritanceInviteMessageModel init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    imageName = v6->_imageName;
    v6->_imageName = 0;

    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_MESSAGE_TITLE"), 0, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v5);
    v12 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_ADDED_MESSAGE_DETAIL_TEXT"), 0, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    detailText = v7->_detailText;
    v7->_detailText = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_MESSAGE_SEND"), 0, CFSTR("Localizable"));
    v20 = objc_claimAutoreleasedReturnValue();
    primaryButton = v7->_primaryButton;
    v7->_primaryButton = (NSString *)v20;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_MESSAGE_EDIT_MESSAGE"), 0, CFSTR("Localizable"));
    v23 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v7->_secondaryButton;
    v7->_secondaryButton = (NSString *)v23;

    objc_storeStrong((id *)&v7->_recipientHandle, a3);
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY"), 0, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v27, v5);
    v28 = objc_claimAutoreleasedReturnValue();
    bubbleText = v7->_bubbleText;
    v7->_bubbleText = (NSString *)v28;

  }
  return v7;
}

- (AAOBInheritanceInviteMessageModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4
{
  id v7;
  AAOBInheritanceInviteMessageModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *detailText;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  NSString *bubbleText;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *title;
  void *v31;
  uint64_t v32;
  NSString *primaryButton;
  void *v34;
  uint64_t v35;
  NSString *secondaryButton;
  void *v38;
  objc_super v39;

  v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)AAOBInheritanceInviteMessageModel;
  v8 = -[AAOBInheritanceInviteMessageModel init](&v39, sel_init);
  if (v8)
  {
    +[AAOBModelHelper contactInfoForHandle:](AAOBModelHelper, "contactInfoForHandle:", v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3 == 2)
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_ADDED_MESSAGE_DETAIL_TEXT"), 0, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v13, v9);
      v14 = objc_claimAutoreleasedReturnValue();
      detailText = v8->_detailText;
      v8->_detailText = (NSString *)v14;

      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("INHERITANCE_ADDED_MESSAGES_BUBBLE_BODY");
    }
    else
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITED_MESSAGE_DETAIL_TEXT"), 0, CFSTR("Localizable"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v20, v9);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v8->_detailText;
      v8->_detailText = (NSString *)v21;

      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = CFSTR("INHERITANCE_INVITED_MESSAGES_BUBBLE_BODY");
    }
    objc_msgSend(v17, "localizedStringForKey:value:table:", v19, 0, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v23, v9);
    v24 = objc_claimAutoreleasedReturnValue();
    bubbleText = v8->_bubbleText;
    v8->_bubbleText = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_MESSAGE_TITLE"), 0, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v28, v9);
    v29 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v29;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_MESSAGE_SEND"), 0, CFSTR("Localizable"));
    v32 = objc_claimAutoreleasedReturnValue();
    primaryButton = v8->_primaryButton;
    v8->_primaryButton = (NSString *)v32;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_INVITE_MESSAGE_EDIT_MESSAGE"), 0, CFSTR("Localizable"));
    v35 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v8->_secondaryButton;
    v8->_secondaryButton = (NSString *)v35;

    objc_storeStrong((id *)&v8->_recipientHandle, a4);
  }

  return v8;
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

- (NSString)ownerHandle
{
  return self->_ownerHandle;
}

- (void)setOwnerHandle:(id)a3
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

- (NSString)bubbleText
{
  return self->_bubbleText;
}

- (void)setBubbleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleText, 0);
  objc_storeStrong((id *)&self->_recipientHandle, 0);
  objc_storeStrong((id *)&self->_ownerHandle, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
