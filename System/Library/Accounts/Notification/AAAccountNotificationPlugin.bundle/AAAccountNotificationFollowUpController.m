@implementation AAAccountNotificationFollowUpController

- (AAAccountNotificationFollowUpController)init
{
  AAAccountNotificationFollowUpController *v2;
  AAFollowUpController *v3;
  AAFollowUpController *followUpController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAAccountNotificationFollowUpController;
  v2 = -[AAAccountNotificationFollowUpController init](&v6, sel_init);
  if (v2)
  {
    v3 = (AAFollowUpController *)objc_alloc_init(MEMORY[0x24BE049A0]);
    followUpController = v2->_followUpController;
    v2->_followUpController = v3;

  }
  return v2;
}

- (void)updateStartUsingiCloudFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
  MEMORY[0x24BEDD108](self, sel__updateStartUsingiCloudFollowupForAccountStore_account_oldAccount_, a3, a4, a5);
}

- (void)updateVerifyTermsFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
  MEMORY[0x24BEDD108](self, sel__updateVerifyTermsFollowupForAccountStore_account_oldAccount_, a3, a4, a5);
}

- (void)dismissAllFollowupsForAccount:(id)a3
{
  MEMORY[0x24BEDD108](self->_followUpController, sel_dismissFollowUpsForAccount_identifiers_completion_, a3, 0, 0);
}

- (void)_updateStartUsingiCloudFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  _QWORD v74[5];
  _QWORD v75[5];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = v10;
  if (v9)
    v10 = v9;
  objc_msgSend_accountType(v10, v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x24BE047F0];
  if (objc_msgSend_aa_isAccountClass_(v9, v23, *MEMORY[0x24BE047F0], v24, v25)
    && (objc_msgSend_aa_isAccountClass_(v15, v26, v22, v27, v28) & 1) == 0)
  {
    _AALogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v29, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): iCloud account added or became primary", buf, 2u);
    }

    objc_msgSend__dismissStartUsingFollowUp(self, v30, v31, v32, v33);
  }
  if (objc_msgSend__didAddAccount_oldAccount_(self, v26, (uint64_t)v9, (uint64_t)v15, v28))
  {
    v36 = (void *)objc_opt_class();
    objc_msgSend__secondaryAccountTypes(v36, v37, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_containsObject_(v41, v42, (uint64_t)v21, v43, v44);

    if (v45)
    {
      _AALogSystem();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v46, OS_LOG_TYPE_DEFAULT, "Spyglass account type added, looking for primary apple account...", buf, 2u);
      }

      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = sub_230EABEE0;
      v75[3] = &unk_24FF9D328;
      v75[4] = self;
      objc_msgSend_aa_primaryAppleAccountWithCompletion_(v8, v47, (uint64_t)v75, v48, v49);
    }
  }
  if (objc_msgSend__didDeleteAccount_oldAccount_(self, v34, (uint64_t)v9, (uint64_t)v15, v35))
  {
    v50 = (void *)objc_opt_class();
    objc_msgSend__secondaryAccountTypes(v50, v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend_containsObject_(v55, v56, (uint64_t)v21, v57, v58);

    if (v59)
    {
      _AALogSystem();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v60, OS_LOG_TYPE_DEFAULT, "Detected secondary account deletion, determining if we should remove StartUsing follow up...", buf, 2u);
      }

      v61 = (void *)objc_opt_class();
      objc_msgSend__secondaryAccountTypes(v61, v62, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_allObjects(v66, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = MEMORY[0x24BDAC760];
      v74[1] = 3221225472;
      v74[2] = sub_230EAC000;
      v74[3] = &unk_24FF9D350;
      v74[4] = self;
      objc_msgSend_accountsWithAccountTypeIdentifiers_completion_(v8, v72, (uint64_t)v71, (uint64_t)v74, v73);

    }
  }

}

- (void)_updateVerifyTermsFollowupForAccountStore:(id)a3 account:(id)a4 oldAccount:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int hasOptionalTerms;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  const __CFString *v47;
  NSObject *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v53;
  id v54;
  AAAccountNotificationFollowUpController *v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v50 = MEMORY[0x24BDAC760];
  v51 = 3221225472;
  v52 = sub_230EAC51C;
  v53 = &unk_24FF9D278;
  v11 = v8;
  v54 = v11;
  v55 = self;
  v12 = (void (**)(_QWORD))MEMORY[0x2348C6804](&v50);
  if (objc_msgSend_aa_needsToVerifyTerms(v9, v13, v14, v15, v16, v50, v51, v52, v53))
    v21 = objc_msgSend_aa_needsToVerifyTerms(v10, v17, v18, v19, v20) ^ 1;
  else
    v21 = 0;
  if (objc_msgSend_aa_hasOptionalTerms(v9, v17, v18, v19, v20))
    v26 = objc_msgSend_aa_hasOptionalTerms(v10, v22, v23, v24, v25) ^ 1;
  else
    v26 = 0;
  if ((v21 | v26) == 1)
  {
    _AALogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v27, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): needs to verify terms", buf, 2u);
    }

    objc_msgSend_postFollowUpWithIdentifier_forAccount_userInfo_completion_(self->_followUpController, v28, *MEMORY[0x24BE04848], (uint64_t)v9, 0, 0);
  }
  if ((objc_msgSend_aa_needsToVerifyTerms(v9, v22, v23, v24, v25) & 1) != 0)
    hasOptionalTerms = 1;
  else
    hasOptionalTerms = objc_msgSend_aa_hasOptionalTerms(v9, v29, v30, v31, v32);
  if ((objc_msgSend_aa_needsToVerifyTerms(v10, v29, v30, v31, v32) & 1) != 0)
  {
    v38 = 1;
    if (!v9)
      goto LABEL_27;
  }
  else
  {
    v38 = objc_msgSend_aa_hasOptionalTerms(v10, v34, v35, v36, v37);
    if (!v9)
      goto LABEL_27;
  }
  if (hasOptionalTerms != v38)
  {
    _AALogSystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_username(v9, v40, v41, v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = (void *)v44;
      v46 = CFSTR("NO");
      if (v38)
        v47 = CFSTR("YES");
      else
        v47 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v57 = v44;
      v59 = v47;
      v58 = 2112;
      if (hasOptionalTerms)
        v46 = CFSTR("YES");
      v60 = 2112;
      v61 = v46;
      _os_log_impl(&dword_230EA3000, v39, OS_LOG_TYPE_DEFAULT, "Terms changed for %@ from %@ to %@", buf, 0x20u);

    }
  }
LABEL_27:
  if (((v38 ^ 1 | hasOptionalTerms) & 1) == 0)
  {
    _AALogSystem();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v48, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): terms verified", buf, 2u);
    }

    v12[2](v12);
  }
  if (objc_msgSend__didDeleteAccount_oldAccount_(self, v34, (uint64_t)v9, (uint64_t)v10, v37))
  {
    _AALogSystem();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230EA3000, v49, OS_LOG_TYPE_DEFAULT, "Notification Plugin (didChangeWithType): did delete account", buf, 2u);
    }

    v12[2](v12);
  }

}

- (void)_dismissStartUsingFollowUp
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_dismissFollowUpWithIdentifier_completion_(self->_followUpController, a2, *MEMORY[0x24BE04840], 0, v2);
  MEMORY[0x24BEDD108](AABridgeFollowUpController, sel_dismissBridgeAppleIDFollowUp, v3, v4, v5);
}

+ (id)_secondaryAccountTypes
{
  if (qword_255EAA4D8 != -1)
    dispatch_once(&qword_255EAA4D8, &unk_24FF9D3B0);
  return (id)qword_255EAA4D0;
}

- (BOOL)_didAddAccount:(id)a3 oldAccount:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v5 = a4;
  if (objc_msgSend_isActive(a3, v6, v7, v8, v9))
    v14 = objc_msgSend_isActive(v5, v10, v11, v12, v13) ^ 1;
  else
    LOBYTE(v14) = 0;

  return v14;
}

- (BOOL)_didDeleteAccount:(id)a3 oldAccount:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char isActive;

  v5 = a4;
  if ((objc_msgSend_isActive(a3, v6, v7, v8, v9) & 1) != 0)
    isActive = 0;
  else
    isActive = objc_msgSend_isActive(v5, v10, v11, v12, v13);

  return isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end
