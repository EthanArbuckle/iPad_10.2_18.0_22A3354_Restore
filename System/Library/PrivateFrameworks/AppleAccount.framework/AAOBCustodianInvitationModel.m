@implementation AAOBCustodianInvitationModel

- (AAOBCustodianInvitationModel)initWithType:(int64_t)a3 ownerHandle:(id)a4
{
  id v7;
  AAOBCustodianInvitationModel *v8;
  AAOBCustodianInvitationModel *v9;
  NSString *imageName;
  void *v11;
  uint64_t v12;
  NSString *detailText;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v17;
  uint64_t v18;
  NSString *primaryButton;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *secondaryButton;
  void *v34;
  uint64_t v35;
  NSString *helpLinkTitle;
  void *v37;
  uint64_t v38;
  NSString *helpLinkURL;
  void *v40;
  uint64_t v41;
  NSString *v42;
  void *v43;
  uint64_t v44;
  NSString *v45;
  void *v46;
  uint64_t v47;
  NSString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSString *v52;
  void *v53;
  uint64_t v54;
  NSString *v55;
  void *v56;
  uint64_t v57;
  NSString *v58;
  void *v59;
  uint64_t v60;
  NSString *v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  uint64_t v66;
  NSString *v67;
  void *v68;
  uint64_t v69;
  NSString *v70;
  uint64_t v71;
  objc_super v73;

  v7 = a4;
  v73.receiver = self;
  v73.super_class = (Class)AAOBCustodianInvitationModel;
  v8 = -[AAOBCustodianInvitationModel init](&v73, sel_init);
  v9 = v8;
  if (v8)
  {
    imageName = v8->_imageName;
    v8->_imageName = (NSString *)CFSTR("recovery_contact_shield");

    v9->_type = a3;
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_DETAIL_TEXT"), 0, CFSTR("Localizable"));
        v12 = objc_claimAutoreleasedReturnValue();
        detailText = v9->_detailText;
        v9->_detailText = (NSString *)v12;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONTACT_TITLE"), 0, CFSTR("Localizable"));
        v15 = objc_claimAutoreleasedReturnValue();
        title = v9->_title;
        v9->_title = (NSString *)v15;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
        v18 = objc_claimAutoreleasedReturnValue();
        primaryButton = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v18;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("INVITED_OTHER_DECLINE_BUTTON");
        goto LABEL_5;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_DETAIL_TEXT"), 0, CFSTR("Localizable"));
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v9->_detailText;
        v9->_detailText = (NSString *)v24;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_CONTACT_TITLE"), 0, CFSTR("Localizable"));
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v9->_title;
        v9->_title = (NSString *)v27;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v30;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = CFSTR("ADDED_AS_MANAGE_BUTTON");
LABEL_5:
        objc_msgSend(v20, "localizedStringForKey:value:table:", v22, 0, CFSTR("Localizable"));
        v32 = objc_claimAutoreleasedReturnValue();
        secondaryButton = v9->_secondaryButton;
        v9->_secondaryButton = (NSString *)v32;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_ELIPSES"), 0, CFSTR("Localizable"));
        v35 = objc_claimAutoreleasedReturnValue();
        helpLinkTitle = v9->_helpLinkTitle;
        v9->_helpLinkTitle = (NSString *)v35;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_LEARN_URL"), 0, CFSTR("Localizable"));
        v38 = objc_claimAutoreleasedReturnValue();
        helpLinkURL = v9->_helpLinkURL;
        v9->_helpLinkURL = (NSString *)v38;
        goto LABEL_9;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONTACT_ACCEPTED_DETAIL_TEXT"), 0, CFSTR("Localizable"));
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v9->_detailText;
        v9->_detailText = (NSString *)v41;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONTACT_ACCEPTED_TITLE"), 0, CFSTR("Localizable"));
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v9->_title;
        v9->_title = (NSString *)v44;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("OK"), 0, CFSTR("Localizable"));
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v47;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONTACT_ACCEPTED_MANAGE_BUTTON"), 0, CFSTR("Localizable"));
        v49 = objc_claimAutoreleasedReturnValue();
        helpLinkURL = v9->_secondaryButton;
        v9->_secondaryButton = (NSString *)v49;
        goto LABEL_9;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_DETAILS"), 0, CFSTR("Localizable"));
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v9->_detailText;
        v9->_detailText = (NSString *)v51;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_TITLE"), 0, CFSTR("Localizable"));
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v9->_title;
        v9->_title = (NSString *)v54;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_LEARN"), 0, CFSTR("Localizable"));
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = v9->_helpLinkTitle;
        v9->_helpLinkTitle = (NSString *)v57;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_LEARN_URL"), 0, CFSTR("Localizable"));
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v9->_helpLinkURL;
        v9->_helpLinkURL = (NSString *)v60;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("OK"), 0, CFSTR("Localizable"));
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v63;

        goto LABEL_8;
      case 4:
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("DECLINED_CUSTODIAN_DETAILS"), 0, CFSTR("Localizable"));
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v9->_detailText;
        v9->_detailText = (NSString *)v66;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("DECLINED_CUSTODIAN_TITLE"), 0, CFSTR("Localizable"));
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v9->_title;
        v9->_title = (NSString *)v69;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("OK"), 0, CFSTR("Localizable"));
        v71 = objc_claimAutoreleasedReturnValue();
        helpLinkURL = v9->_primaryButton;
        v9->_primaryButton = (NSString *)v71;
LABEL_9:

        break;
      default:
        break;
    }
    objc_storeStrong((id *)&v9->_ownerHandle, a4);
  }

  return v9;
}

- (AAOBCustodianInvitationModel)initWithCustodianshipInfo:(id)a3
{
  id v5;
  AAOBCustodianInvitationModel *v6;
  AAOBCustodianInvitationModel *v7;
  NSString *imageName;
  void *v9;
  uint64_t v10;
  NSString *detailText;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  uint64_t v16;
  NSString *primaryButton;
  void *v18;
  uint64_t v19;
  NSString *secondaryButton;
  void *v21;
  uint64_t v22;
  NSString *helpLinkTitle;
  void *v24;
  uint64_t v25;
  NSString *helpLinkURL;
  uint64_t v27;
  uint64_t v28;
  NSString *ownerHandle;
  void *v30;
  uint64_t v31;
  NSString *v32;
  void *v33;
  uint64_t v34;
  NSString *v35;
  void *v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  uint64_t v40;
  NSString *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSString *v45;
  void *v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  uint64_t v50;
  NSString *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSString *v55;
  void *v56;
  uint64_t v57;
  NSString *v58;
  void *v59;
  uint64_t v60;
  NSString *v61;
  void *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  uint64_t v66;
  NSString *v67;
  uint64_t v68;
  objc_super v70;

  v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)AAOBCustodianInvitationModel;
  v6 = -[AAOBCustodianInvitationModel init](&v70, sel_init);
  v7 = v6;
  if (v6)
  {
    imageName = v6->_imageName;
    v6->_imageName = (NSString *)CFSTR("recovery_contact_shield");

    switch(objc_msgSend(v5, "status"))
    {
      case 1:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_DETAIL_TEXT"), 0, CFSTR("Localizable"));
        v10 = objc_claimAutoreleasedReturnValue();
        detailText = v7->_detailText;
        v7->_detailText = (NSString *)v10;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONTACT_TITLE"), 0, CFSTR("Localizable"));
        v13 = objc_claimAutoreleasedReturnValue();
        title = v7->_title;
        v7->_title = (NSString *)v13;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
        v16 = objc_claimAutoreleasedReturnValue();
        primaryButton = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v16;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("INVITED_OTHER_DECLINE_BUTTON"), 0, CFSTR("Localizable"));
        v19 = objc_claimAutoreleasedReturnValue();
        secondaryButton = v7->_secondaryButton;
        v7->_secondaryButton = (NSString *)v19;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_ELIPSES"), 0, CFSTR("Localizable"));
        v22 = objc_claimAutoreleasedReturnValue();
        helpLinkTitle = v7->_helpLinkTitle;
        v7->_helpLinkTitle = (NSString *)v22;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_LEARN_URL"), 0, CFSTR("Localizable"));
        v25 = objc_claimAutoreleasedReturnValue();
        helpLinkURL = v7->_helpLinkURL;
        v7->_helpLinkURL = (NSString *)v25;

        objc_msgSend(v5, "ownerHandle");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = 0;
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v27;
        goto LABEL_7;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_DETAIL_TEXT"), 0, CFSTR("Localizable"));
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v7->_detailText;
        v7->_detailText = (NSString *)v31;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_CONTACT_TITLE"), 0, CFSTR("Localizable"));
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v7->_title;
        v7->_title = (NSString *)v34;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_CONFIRM_BUTTON"), 0, CFSTR("Localizable"));
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v37;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("ADDED_AS_MANAGE_BUTTON"), 0, CFSTR("Localizable"));
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v7->_secondaryButton;
        v7->_secondaryButton = (NSString *)v40;

        objc_msgSend(v5, "ownerHandle");
        v42 = objc_claimAutoreleasedReturnValue();
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v42;
        v28 = 1;
        goto LABEL_7;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("DECLINED_CUSTODIAN_DETAILS"), 0, CFSTR("Localizable"));
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = v7->_detailText;
        v7->_detailText = (NSString *)v44;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("DECLINED_CUSTODIAN_TITLE"), 0, CFSTR("Localizable"));
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v7->_title;
        v7->_title = (NSString *)v47;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("OK"), 0, CFSTR("Localizable"));
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v50;

        objc_msgSend(v5, "ownerHandle");
        v52 = objc_claimAutoreleasedReturnValue();
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v52;
        v28 = 4;
        goto LABEL_7;
      case 5:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_DETAILS"), 0, CFSTR("Localizable"));
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v7->_detailText;
        v7->_detailText = (NSString *)v54;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_TITLE"), 0, CFSTR("Localizable"));
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = v7->_title;
        v7->_title = (NSString *)v57;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("OK"), 0, CFSTR("Localizable"));
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v7->_primaryButton;
        v7->_primaryButton = (NSString *)v60;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_LEARN"), 0, CFSTR("Localizable"));
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = v7->_helpLinkTitle;
        v7->_helpLinkTitle = (NSString *)v63;

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("INELIGIBLE_CUSTODIAN_LEARN_URL"), 0, CFSTR("Localizable"));
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v7->_helpLinkURL;
        v7->_helpLinkURL = (NSString *)v66;

        objc_msgSend(v5, "ownerHandle");
        v68 = objc_claimAutoreleasedReturnValue();
        ownerHandle = v7->_ownerHandle;
        v7->_ownerHandle = (NSString *)v68;
        v28 = 3;
LABEL_7:

        objc_storeStrong((id *)&v7->_custodianshipInfo, a3);
        v7->_type = v28;
        break;
      default:
        break;
    }
  }

  return v7;
}

- (id)detailsTextWithFirstName:(id)a3 fullName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *detailText;
  __CFString *v10;
  NSString *v11;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  switch(-[AAOBCustodianInvitationModel type](self, "type"))
  {
    case 0:
      v8 = (void *)MEMORY[0x1E0CB3940];
      detailText = self->_detailText;
      v14 = v6;
      goto LABEL_5;
    case 1:
    case 2:
      v8 = (void *)MEMORY[0x1E0CB3940];
      detailText = self->_detailText;
LABEL_5:
      objc_msgSend(v8, "stringWithFormat:", detailText, v7, v6, v14);
      goto LABEL_8;
    case 3:
      v11 = self->_detailText;
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", self->_detailText, v7, v13, v14);
LABEL_8:
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (__CFString *)v11;
      break;
    default:
      v10 = &stru_1E41752F8;
      break;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerHandle, CFSTR("_ownerHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientHandle, CFSTR("_recipientHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_custodianshipInfo, CFSTR("_custodianshipInfo"));

}

- (AAOBCustodianInvitationModel)initWithCoder:(id)a3
{
  id v4;
  AAOBCustodianInvitationModel *v5;
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
  uint64_t v24;
  AACustodianshipInfo *custodianshipInfo;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AAOBCustodianInvitationModel;
  v5 = -[AAOBCustodianInvitationModel init](&v27, sel_init);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_custodianshipInfo"));
    v24 = objc_claimAutoreleasedReturnValue();
    custodianshipInfo = v5->_custodianshipInfo;
    v5->_custodianshipInfo = (AACustodianshipInfo *)v24;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAOBCustodianInvitationModel *v4;
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
  uint64_t v23;
  AACustodianshipInfo *custodianshipInfo;

  v4 = objc_alloc_init(AAOBCustodianInvitationModel);
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

  v23 = -[AACustodianshipInfo copy](self->_custodianshipInfo, "copy");
  custodianshipInfo = v4->_custodianshipInfo;
  v4->_custodianshipInfo = (AACustodianshipInfo *)v23;

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
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[AAOBCustodianInvitationModel imageName](self, "imageName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel detailText](self, "detailText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel primaryButton](self, "primaryButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel secondaryButton](self, "secondaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel helpLinkTitle](self, "helpLinkTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel helpLinkURL](self, "helpLinkURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel ownerHandle](self, "ownerHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel recipientHandle](self, "recipientHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAOBCustodianInvitationModel custodianshipInfo](self, "custodianshipInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\ncustodianshipInfo: %@\n"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
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

- (AACustodianshipInfo)custodianshipInfo
{
  return self->_custodianshipInfo;
}

- (void)setCustodianshipInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianshipInfo, 0);
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
