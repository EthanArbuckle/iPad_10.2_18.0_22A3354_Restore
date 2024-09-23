@implementation AAOBInvitationSentModel

- (AAOBInvitationSentModel)initWithType:(int64_t)a3 recipientHandle:(id)a4
{
  id v7;
  AAOBInvitationSentModel *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *title;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  NSString *detailText;
  void *v20;
  uint64_t v21;
  NSString *primaryButton;
  NSString *helpLinkTitle;
  NSString *helpLinkURL;
  objc_super v26;

  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AAOBInvitationSentModel;
  v8 = -[AAOBInvitationSentModel init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a3)
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_INVITATION_SENT_TITLE"), 0, CFSTR("Localizable"));
      v11 = objc_claimAutoreleasedReturnValue();
      title = v8->_title;
      v8->_title = (NSString *)v11;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("CUSTODIAN_INVITATION_SENT_DETAIL_TEXT");
    }
    else
    {
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CUSTODIAN_INVITATION_SENT_FAMILY_TITLE"), 0, CFSTR("Localizable"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v8->_title;
      v8->_title = (NSString *)v16;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("CUSTODIAN_INVITATION_SENT_FAMILY_DETAIL_TEXT");
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, 0, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();
    detailText = v8->_detailText;
    v8->_detailText = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DONE"), 0, CFSTR("Localizable"));
    v21 = objc_claimAutoreleasedReturnValue();
    primaryButton = v8->_primaryButton;
    v8->_primaryButton = (NSString *)v21;

    objc_storeStrong((id *)&v8->_recipientHandle, a4);
    helpLinkTitle = v8->_helpLinkTitle;
    v8->_helpLinkTitle = 0;

    helpLinkURL = v8->_helpLinkURL;
    v8->_helpLinkURL = 0;

  }
  return v8;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerHandle, CFSTR("_ownerHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientHandle, CFSTR("_recipientHandle"));

}

- (AAOBInvitationSentModel)initWithCoder:(id)a3
{
  id v4;
  AAOBInvitationSentModel *v5;
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
  NSString *ownerHandle;
  uint64_t v22;
  NSString *recipientHandle;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAOBInvitationSentModel;
  v5 = -[AAOBInvitationSentModel init](&v25, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ownerHandle"));
    v20 = objc_claimAutoreleasedReturnValue();
    ownerHandle = v5->_ownerHandle;
    v5->_ownerHandle = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recipientHandle"));
    v22 = objc_claimAutoreleasedReturnValue();
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v22;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAOBInvitationSentModel *v4;
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
  NSString *ownerHandle;
  uint64_t v21;
  NSString *recipientHandle;

  v4 = objc_alloc_init(AAOBInvitationSentModel);
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

  v19 = -[NSString copy](self->_ownerHandle, "copy");
  ownerHandle = v4->_ownerHandle;
  v4->_ownerHandle = (NSString *)v19;

  v21 = -[NSString copy](self->_recipientHandle, "copy");
  recipientHandle = v4->_recipientHandle;
  v4->_recipientHandle = (NSString *)v21;

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
  -[AAOBInvitationSentModel imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel primaryButton](self, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel secondaryButton](self, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel helpLinkTitle](self, "helpLinkTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel helpLinkURL](self, "helpLinkURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel ownerHandle](self, "ownerHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInvitationSentModel recipientHandle](self, "recipientHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\n"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
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

- (void).cxx_destruct
{
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
