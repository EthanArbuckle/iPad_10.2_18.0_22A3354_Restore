@implementation AAOBInheritanceInvitationModel

- (AAOBInheritanceInvitationModel)initWithBenefactorInfo:(id)a3
{
  id v5;
  AAOBInheritanceInvitationModel *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *ownerHandle;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *primaryButton;
  void *v16;
  uint64_t v17;
  NSString *secondaryButton;
  void *v19;
  uint64_t v20;
  NSString *title;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *detailText;
  void *v29;
  uint64_t v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSString *v37;
  void *v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *helpLinkTitle;
  void *v45;
  uint64_t v46;
  NSString *helpLinkURL;
  NSString *recipientHandle;
  void *v50;
  uint64_t v51;
  NSString *v52;
  void *v53;
  uint64_t v54;
  NSString *v55;
  id obj;
  void *v57;
  objc_super v58;

  v5 = a3;
  v58.receiver = self;
  v58.super_class = (Class)AAOBInheritanceInvitationModel;
  v6 = -[AAOBInheritanceInvitationModel init](&v58, sel_init);
  if (v6)
  {
    obj = a3;
    if (v5)
      v7 = objc_msgSend(v5, "status");
    else
      v7 = 2;
    objc_msgSend(v5, "ownerHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    ownerHandle = v6->_ownerHandle;
    v6->_ownerHandle = (NSString *)v8;

    +[AAOBModelHelper contactInfoForHandle:](AAOBModelHelper, "contactInfoForHandle:", v6->_ownerHandle);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstNameOrHandleForDisplay");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
    v14 = objc_claimAutoreleasedReturnValue();
    primaryButton = v6->_primaryButton;
    v6->_primaryButton = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_MANAGE_BUTTON"), 0, CFSTR("Localizable"));
    v17 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v6->_secondaryButton;
    v6->_secondaryButton = (NSString *)v17;

    v57 = (void *)v11;
    if (v7 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_INVITED_TITLE"), 0, CFSTR("Localizable"));
      v20 = objc_claimAutoreleasedReturnValue();
      title = v6->_title;
      v6->_title = (NSString *)v20;

      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_INVITED_DETAIL_TEXT"), 0, CFSTR("Localizable"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v11;
      v26 = (void *)v24;
      objc_msgSend(v22, "stringWithFormat:", v24, v25, v12, obj);
      v27 = objc_claimAutoreleasedReturnValue();
      detailText = v6->_detailText;
      v6->_detailText = (NSString *)v27;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v6->_primaryButton;
      v6->_primaryButton = (NSString *)v30;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_DECLINE_BUTTON"), 0, CFSTR("Localizable"));
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v6->_secondaryButton;
      v6->_secondaryButton = (NSString *)v33;
    }
    else
    {
      if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        v41 = (void *)v12;
        if (v7 != 2)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_TITLE"), 0, CFSTR("Localizable"));
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v6->_title;
        v6->_title = (NSString *)v51;

        v53 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)v12;
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_DETAIL_TEXT"), 0, CFSTR("Localizable"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", v34, v11, v12, obj);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v6->_detailText;
        v6->_detailText = (NSString *)v54;

LABEL_10:
LABEL_11:
        objc_storeStrong((id *)&v6->_imageName, CFSTR("legacy_contact_header"));
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_HELP_LINK_TEXT"), 0, CFSTR("Localizable"));
        v43 = objc_claimAutoreleasedReturnValue();
        helpLinkTitle = v6->_helpLinkTitle;
        v6->_helpLinkTitle = (NSString *)v43;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_HELP_URL"), 0, CFSTR("Localizable"));
        v46 = objc_claimAutoreleasedReturnValue();
        helpLinkURL = v6->_helpLinkURL;
        v6->_helpLinkURL = (NSString *)v46;

        objc_storeStrong((id *)&v6->_custodianshipInfo, obj);
        recipientHandle = v6->_recipientHandle;
        v6->_recipientHandle = 0;

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("BENEFICIARY_DECLINED_INVITE_TITLE"), 0, CFSTR("Localizable"));
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v6->_title;
      v6->_title = (NSString *)v36;

      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("BENEFICIARY_DECLINED_INVITE_DETAIL_TEXT"), 0, CFSTR("Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", v34, v11);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v6->_detailText;
      v6->_detailText = (NSString *)v39;

    }
    v41 = (void *)v12;
    goto LABEL_10;
  }
LABEL_12:

  return v6;
}

- (AAOBInheritanceInvitationModel)initWithAcceptedViewForBenefactorInfo:(id)a3
{
  id v5;
  AAOBInheritanceInvitationModel *v6;
  uint64_t v7;
  NSString *ownerHandle;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *primaryButton;
  void *v13;
  uint64_t v14;
  NSString *secondaryButton;
  void *v16;
  uint64_t v17;
  NSString *title;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *detailText;
  void *v24;
  uint64_t v25;
  NSString *helpLinkTitle;
  void *v27;
  uint64_t v28;
  NSString *helpLinkURL;
  NSString *recipientHandle;
  void *v32;
  objc_super v33;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)AAOBInheritanceInvitationModel;
  v6 = -[AAOBInheritanceInvitationModel init](&v33, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "ownerHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    ownerHandle = v6->_ownerHandle;
    v6->_ownerHandle = (NSString *)v7;

    +[AAOBModelHelper contactInfoForHandle:](AAOBModelHelper, "contactInfoForHandle:", v6->_ownerHandle);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
    v11 = objc_claimAutoreleasedReturnValue();
    primaryButton = v6->_primaryButton;
    v6->_primaryButton = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_MANAGE_BUTTON"), 0, CFSTR("Localizable"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v6->_secondaryButton;
    v6->_secondaryButton = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("BENEFICIARY_ACCEPTED_INVITE_TITLE"), 0, CFSTR("Localizable"));
    v17 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v17;

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("BENEFICIARY_ACCEPTED_INVITE_DETAIL_TEXT"), 0, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v9);
    v22 = objc_claimAutoreleasedReturnValue();
    detailText = v6->_detailText;
    v6->_detailText = (NSString *)v22;

    objc_storeStrong((id *)&v6->_imageName, CFSTR("legacy_contact_header"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_HELP_LINK_TEXT"), 0, CFSTR("Localizable"));
    v25 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v6->_helpLinkTitle;
    v6->_helpLinkTitle = (NSString *)v25;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("INHERITANCE_BENEFICIARY_ADDED_HELP_URL"), 0, CFSTR("Localizable"));
    v28 = objc_claimAutoreleasedReturnValue();
    helpLinkURL = v6->_helpLinkURL;
    v6->_helpLinkURL = (NSString *)v28;

    objc_storeStrong((id *)&v6->_custodianshipInfo, a3);
    recipientHandle = v6->_recipientHandle;
    v6->_recipientHandle = 0;

  }
  return v6;
}

- (AAOBInheritanceInvitationModel)initWithModel:(id)a3
{
  id v4;
  AAOBInheritanceInvitationModel *v5;
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
  AACustodianshipInfo *custodianshipInfo;
  uint64_t v24;
  NSString *recipientHandle;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AAOBInheritanceInvitationModel;
  v5 = -[AAOBInheritanceInvitationModel init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "imageName");
    v6 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

    objc_msgSend(v4, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "detailText");
    v10 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    objc_msgSend(v4, "primaryButton");
    v12 = objc_claimAutoreleasedReturnValue();
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v12;

    objc_msgSend(v4, "secondaryButton");
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v14;

    objc_msgSend(v4, "helpLinkTitle");
    v16 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = (NSString *)v16;

    objc_msgSend(v4, "helpLinkURL");
    v18 = objc_claimAutoreleasedReturnValue();
    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = (NSString *)v18;

    objc_msgSend(v4, "ownerHandle");
    v20 = objc_claimAutoreleasedReturnValue();
    ownerHandle = v5->_ownerHandle;
    v5->_ownerHandle = (NSString *)v20;

    objc_msgSend(v4, "custodianshipInfo");
    v22 = objc_claimAutoreleasedReturnValue();
    custodianshipInfo = v5->_custodianshipInfo;
    v5->_custodianshipInfo = (AACustodianshipInfo *)v22;

    objc_msgSend(v4, "recipientHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    recipientHandle = v5->_recipientHandle;
    v5->_recipientHandle = (NSString *)v24;

  }
  return v5;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianshipInfo, CFSTR("_custodianshipInfo"));

}

- (AAOBInheritanceInvitationModel)initWithCoder:(id)a3
{
  id v4;
  AAOBInheritanceInvitationModel *v5;
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
  AACustodianshipInfo *custodianshipInfo;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAOBInheritanceInvitationModel;
  v5 = -[AAOBInheritanceInvitationModel init](&v25, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianshipInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    custodianshipInfo = v5->_custodianshipInfo;
    v5->_custodianshipInfo = (AACustodianshipInfo *)v22;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAOBInheritanceInvitationModel *v4;
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
  AACustodianshipInfo *custodianshipInfo;

  v4 = objc_alloc_init(AAOBInheritanceInvitationModel);
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

  v21 = -[AACustodianshipInfo copy](self->_custodianshipInfo, "copy");
  custodianshipInfo = v4->_custodianshipInfo;
  v4->_custodianshipInfo = (AACustodianshipInfo *)v21;

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
  -[AAOBInheritanceInvitationModel imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel primaryButton](self, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel secondaryButton](self, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel helpLinkTitle](self, "helpLinkTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel helpLinkURL](self, "helpLinkURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel ownerHandle](self, "ownerHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBInheritanceInvitationModel custodianshipInfo](self, "custodianshipInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\ncustodianshipInfo: %@\n"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
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

- (AACustodianshipInfo)custodianshipInfo
{
  return self->_custodianshipInfo;
}

- (void)setCustodianshipInfo:(id)a3
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
  objc_storeStrong((id *)&self->_custodianshipInfo, 0);
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
