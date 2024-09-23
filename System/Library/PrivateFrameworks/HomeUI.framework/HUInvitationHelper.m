@implementation HUInvitationHelper

- (HUInvitationHelper)initWithMode:(unint64_t)a3
{
  HUInvitationHelper *v4;
  HUInvitationHelper *v5;
  CNContactFormatter *v6;
  CNContactFormatter *contactsFormatter;
  id v8;
  void *v9;
  uint64_t v10;
  HFContactController *contactsController;
  NSArray *familyMembers;
  HFContactController *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HUInvitationHelper;
  v4 = -[HUInvitationHelper init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactsFormatter = v5->_contactsFormatter;
    v5->_contactsFormatter = v6;

    v8 = objc_alloc(MEMORY[0x1E0D31318]);
    -[HUInvitationHelper requiredKeyDescriptors](v5, "requiredKeyDescriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithKeyDescriptors:", v9);
    contactsController = v5->_contactsController;
    v5->_contactsController = (HFContactController *)v10;

    -[HFContactController setDelegate:](v5->_contactsController, "setDelegate:", v5);
    familyMembers = v5->_familyMembers;
    v5->_familyMembers = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_initWeak(&location, v5);
    v13 = v5->_contactsController;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __35__HUInvitationHelper_initWithMode___block_invoke;
    v15[3] = &unk_1E6F4DE30;
    objc_copyWeak(&v16, &location);
    -[HFContactController fetchFamilyMembersWithCompletion:](v13, "fetchFamilyMembersWithCompletion:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __35__HUInvitationHelper_initWithMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_debug_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEBUG, "Fetched family members: %@", (uint8_t *)&v13, 0xCu);
  }

  v6 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(WeakRetained, "setFamilyMembers:", v6);

  objc_msgSend(WeakRetained, "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(WeakRetained, "_updateInviterContactInfo");
    objc_msgSend(WeakRetained, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(WeakRetained, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invitationUtilityDidUpdateInformation:", WeakRetained);

      }
    }
  }

}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
  if (a3)
  {
    -[HUInvitationHelper _updateInviterContactInfo](self, "_updateInviterContactInfo");
  }
  else
  {
    -[HUInvitationHelper setInviterContact:](self, "setInviterContact:", 0);
    -[HUInvitationHelper setIsUnknownContact:](self, "setIsUnknownContact:", 1);
  }
}

- (void)_updateInviterContactInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HUInvitationHelper requiredKeyDescriptors](self, "requiredKeyDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInvitationHelper invitation](self, "invitation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inviter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[HUInvitationHelper invitation](self, "invitation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "inviter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hf_prettyDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v24;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "Inviter userID is nil - %@", buf, 0xCu);

    }
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("mailto")))
  {

  }
  else
  {
    objc_msgSend(v7, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("tel"));

    if (!v12)
      goto LABEL_9;
  }
  objc_msgSend(v7, "path");
  v13 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v13;
LABEL_9:
  -[HUInvitationHelper setInviterID:](self, "setInviterID:", v6);
  -[HUInvitationHelper familyMembers](self, "familyMembers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __47__HUInvitationHelper__updateInviterContactInfo__block_invoke;
  v25[3] = &unk_1E6F4DE58;
  v10 = v6;
  v26 = v10;
  objc_msgSend(v14, "na_firstObjectPassingTest:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0D31318], "contactForAppleID:keyDescriptors:", v10, v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInvitationHelper setInviterContact:](self, "setInviterContact:", v20);

LABEL_14:
    -[HUInvitationHelper inviterContact](self, "inviterContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "givenName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInvitationHelper setIsUnknownContact:](self, "setIsUnknownContact:", objc_msgSend(v10, "isEqualToString:", v21));

    goto LABEL_15;
  }
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Inviter matches a family member", buf, 2u);
  }

  -[HUInvitationHelper contactsController](self, "contactsController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dsid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contactForFamilyMemberWithDsid:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInvitationHelper setInviterContact:](self, "setInviterContact:", v19);

  -[HUInvitationHelper setIsUnknownContact:](self, "setIsUnknownContact:", 0);
LABEL_15:

}

uint64_t __47__HUInvitationHelper__updateInviterContactInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "memberPhoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "appleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

- (NSString)homeInvitationTitle
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = -[HUInvitationHelper isUnknownContact](self, "isUnknownContact");
  v4 = -[HUInvitationHelper mode](self, "mode");
  v5 = v4;
  if (v3)
  {
    if (v4 == 1)
      v6 = CFSTR("HUUserManagementInvitation_UnknownInviteHomeName_Onboarding");
    else
      v6 = CFSTR("HUUserManagementInvitation_UnknownInviteHomeName_HomeSettings");
    goto LABEL_8;
  }
  -[HUInvitationHelper invitation](self, "invitation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    objc_msgSend(v7, "homeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitation_HomeSettingsCell_HomeName"), CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v10;
  }
  v9 = objc_msgSend(v7, "isInviteeRestrictedGuest");

  if (!v9)
  {
    -[HUInvitationHelper invitation](self, "invitation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitation_Onboarding_HomeName"), CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v11);
    goto LABEL_11;
  }
  v6 = CFSTR("HUUserManagementInvitation_Onboarding_RestrictedGuest");
LABEL_8:
  _HULocalizedStringWithDefaultValue(v6, v6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSString *)v10;
}

- (NSString)detailText
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;

  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setDateStyle:", 1);
  objc_msgSend(v4, "setTimeStyle:", 0);
  objc_msgSend(v4, "setDoesRelativeDateFormatting:", 1);
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "setDateStyle:", 0);
  objc_msgSend(v5, "setTimeStyle:", 1);
  -[HUInvitationHelper invitation](self, "invitation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "startOfDayForDate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_dateByAddingDays:toDate:", -1, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v79 = (void *)v12;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v9);
  v78 = v13;
  if (-[HUInvitationHelper mode](self, "mode"))
  {
    if (-[HUInvitationHelper isUnknownContact](self, "isUnknownContact"))
    {
      if (objc_msgSend(v13, "containsDate:", v7))
      {
        objc_msgSend(v4, "stringFromDate:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromDate:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInvitationHelper inviterID](self, "inviterID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_RelativeDate_UnknownContact"), CFSTR("%@ %@ %@"), v16, v17, v18, v19, v20, v21, (uint64_t)v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v3, "stringFromDate:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInvitationHelper inviterID](self, "inviterID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_OtherDate_UnknownContact"), CFSTR("%@ %@"), v52, v53, v54, v55, v56, v57, (uint64_t)v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_16;
    }
    v75 = v8;
    -[HUInvitationHelper invitation](self, "invitation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "isInviteeRestrictedGuest");

    if (v43)
    {
      -[HUInvitationHelper contactsFormatter](self, "contactsFormatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInvitationHelper inviterContact](self, "inviterContact");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromContact:", v15);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInvitationHelper invitation](self, "invitation");
      v77 = v7;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "homeName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_RestrictedGuest"), CFSTR("%@ %@"), v46, v47, v48, v49, v50, v51, (uint64_t)v44);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v77;
    }
    else
    {
      if (!objc_msgSend(v13, "containsDate:", v7))
      {
        objc_msgSend(v3, "stringFromDate:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUInvitationHelper inviterID](self, "inviterID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_OtherDate"), CFSTR("%@ %@"), v64, v65, v66, v67, v68, v69, (uint64_t)v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(v4, "stringFromDate:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringFromDate:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUInvitationHelper inviterID](self, "inviterID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_RelativeDate"), CFSTR("%@ %@ %@"), v58, v59, v60, v61, v62, v63, (uint64_t)v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_15:
    v8 = v75;
    goto LABEL_16;
  }
  v76 = v7;
  -[HUInvitationHelper contactsFormatter](self, "contactsFormatter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUInvitationHelper inviterContact](self, "inviterContact");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringFromContact:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_HomeSettings"), CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUInvitationHelper invitation](self, "invitation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = objc_msgSend(v32, "isInviteeRestrictedGuest");

  if ((_DWORD)v25)
  {
    -[HUInvitationHelper contactsFormatter](self, "contactsFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInvitationHelper inviterContact](self, "inviterContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromContact:", v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUInvitationHelper invitation](self, "invitation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "homeName");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUserManagementInvitationInfo_HomeSettings_RestrictedGuest"), CFSTR("%@ %@"), v35, v36, v37, v38, v39, v40, (uint64_t)v33);
    v74 = v3;
    v41 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v41;
    v3 = v74;
    v7 = v76;
LABEL_16:

    goto LABEL_17;
  }
  v7 = v76;
LABEL_17:

  return (NSString *)v22;
}

- (void)contactController:(id)a3 didFinishDownloadingFamilyMemberAvatar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;

  v6 = a3;
  objc_msgSend(a4, "dsid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactForFamilyMemberWithDsid:", v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[HUInvitationHelper inviterContact](self, "inviterContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    -[HUInvitationHelper setInviterContact:](self, "setInviterContact:", v17);
    -[HUInvitationHelper delegate](self, "delegate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[HUInvitationHelper delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        -[HUInvitationHelper delegate](self, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "invitationUtilityDidUpdateInformation:", self);

      }
    }
  }

}

+ (id)dateFormatter
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)_dateFormatter
{
  if (qword_1ED580A58 != -1)
    dispatch_once(&qword_1ED580A58, &__block_literal_global_23);
  return (id)_MergedGlobals_614;
}

uint64_t __36__HUInvitationHelper__dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_614;
  _MergedGlobals_614 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_614, "setTimeStyle:", 0);
  objc_msgSend((id)_MergedGlobals_614, "setDateStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_614, "setLocale:", v2);

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_614, "setTimeZone:", v3);

  return objc_msgSend((id)_MergedGlobals_614, "setFormattingContext:", 5);
}

- (id)requiredKeyDescriptors
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97468], "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C966A8];
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HUInvitationHelperDelegate)delegate
{
  return (HUInvitationHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (CNContact)inviterContact
{
  return self->_inviterContact;
}

- (void)setInviterContact:(id)a3
{
  objc_storeStrong((id *)&self->_inviterContact, a3);
}

- (BOOL)isUnknownContact
{
  return self->_isUnknownContact;
}

- (void)setIsUnknownContact:(BOOL)a3
{
  self->_isUnknownContact = a3;
}

- (HFContactController)contactsController
{
  return self->_contactsController;
}

- (void)setContactsController:(id)a3
{
  objc_storeStrong((id *)&self->_contactsController, a3);
}

- (NSString)inviterID
{
  return self->_inviterID;
}

- (void)setInviterID:(id)a3
{
  objc_storeStrong((id *)&self->_inviterID, a3);
}

- (CNContactFormatter)contactsFormatter
{
  return self->_contactsFormatter;
}

- (void)setContactsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactsFormatter, a3);
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_contactsFormatter, 0);
  objc_storeStrong((id *)&self->_inviterID, 0);
  objc_storeStrong((id *)&self->_contactsController, 0);
  objc_storeStrong((id *)&self->_inviterContact, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
