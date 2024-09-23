@implementation AAFindMyAccountController

+ (void)addFMFChildAccountToAppleAccount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  const __CFString *v61;
  const __CFString *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  __CFString *v72;
  NSObject *v73;
  const __CFString *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  const __CFString *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_defaultStore(MEMORY[0x24BDB4398], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountTypeWithAccountTypeIdentifier_(v9, v10, *MEMORY[0x24BDB4050], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDB4380]);
  v18 = (void *)objc_msgSend_initWithAccountType_(v14, v15, (uint64_t)v13, v16, v17);
  objc_msgSend_username(v4, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_appleAccountWithUsername_(v9, v24, (uint64_t)v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend__findOrphanedAccountForAccountType_forAppleAccount_withStore_(a1, v28, (uint64_t)v13, (uint64_t)v27, (uint64_t)v9);
    v32 = objc_claimAutoreleasedReturnValue();
    v81 = v13;
    if (v32)
    {
      _AALogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v32;
        _os_log_impl(&dword_230EA3000, v33, OS_LOG_TYPE_DEFAULT, "Looks like we found an orphaned find my friends account: %@", buf, 0xCu);
      }

      v34 = v32;
      v18 = v34;
    }
    objc_msgSend_setParentAccount_(v18, v29, (uint64_t)v27, v30, v31);
    objc_msgSend_username(v27, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v18, v40, (uint64_t)v39, v41, v42);

    v82 = v4;
    objc_msgSend_credential(v4, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *MEMORY[0x24BDB4230];
    objc_msgSend_credentialItemForKey_(v47, v49, *MEMORY[0x24BDB4230], v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = *MEMORY[0x24BDB4228];
    objc_msgSend_credentialItemForKey_(v47, v54, *MEMORY[0x24BDB4228], v55, v56);
    v59 = objc_claimAutoreleasedReturnValue();
    if (v52 | v59)
    {
      _AALogSystem();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = CFSTR("NO");
        if (v52)
          v62 = CFSTR("YES");
        else
          v62 = CFSTR("NO");
        if (v59)
          v61 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v85 = (void *)v62;
        v86 = 2112;
        v87 = v61;
        _os_log_impl(&dword_230EA3000, v60, OS_LOG_TYPE_DEFAULT, "Got FMF (%@) or app (%@) tokens, creating FMF child account", buf, 0x16u);
      }

      v63 = objc_alloc_init(MEMORY[0x24BDB4388]);
      objc_msgSend_setCredentialItem_forKey_(v63, v64, v59, v53, v65);
      objc_msgSend_setCredentialItem_forKey_(v63, v66, v52, v48, v67);
      objc_msgSend_setCredential_(v18, v68, (uint64_t)v63, v69, v70);

    }
    v83 = 0;
    v71 = objc_msgSend_saveVerifiedAccount_error_(v9, v57, (uint64_t)v18, (uint64_t)&v83, v58);
    v72 = (__CFString *)v83;
    _AALogSystem();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = CFSTR("NO");
      if (v71)
        v74 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v85 = (void *)v74;
      v86 = 2112;
      v87 = v72;
      _os_log_impl(&dword_230EA3000, v73, OS_LOG_TYPE_DEFAULT, "FMF child account added successfully (%@) with error: %@", buf, 0x16u);
    }

    v13 = v81;
    v4 = v82;
  }
  else
  {
    _AALogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_230EAC870((uint64_t)v4, v32, v75, v76, v77, v78, v79, v80);
  }

}

+ (void)updateFMFChildAccountForAppleAccount:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  const __CFString *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  int v62;
  __CFString *v63;
  NSObject *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  id v68;
  uint8_t buf[4];
  const __CFString *v70;
  __int16 v71;
  const __CFString *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_credential(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB4230];
  objc_msgSend_credentialItemForKey_(v8, v10, *MEMORY[0x24BDB4230], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BDB4228];
  objc_msgSend_credentialItemForKey_(v8, v15, *MEMORY[0x24BDB4228], v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_childAccountsWithAccountTypeIdentifier_(v3, v19, *MEMORY[0x24BDB4050], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_credential(v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialItemForKey_(v32, v33, v9, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialItemForKey_(v32, v37, v14, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqualToString_(v36, v41, (uint64_t)v13, v42, v43)
    || (objc_msgSend_isEqualToString_(v40, v44, (uint64_t)v18, v46, v47) & 1) == 0)
  {
    v67 = v40;
    if (objc_msgSend_isAuthenticated(v3, v44, v45, v46, v47))
      objc_msgSend_setAuthenticated_(v27, v48, 1, v49, v50);
    _AALogSystem();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = CFSTR("YES");
      if (v13)
        v53 = CFSTR("YES");
      else
        v53 = CFSTR("NO");
      if (!v18)
        v52 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v70 = v53;
      v71 = 2112;
      v72 = v52;
      _os_log_impl(&dword_230EA3000, v51, OS_LOG_TYPE_DEFAULT, "Updating FMF account's FMF (%@) and app (%@) tokens", buf, 0x16u);
    }

    if (v18)
    {
      objc_msgSend_setCredentialItem_forKey_(v32, v54, (uint64_t)v18, v14, v55);
      if (!v13)
        goto LABEL_17;
    }
    else if (!v13)
    {
      _AALogSystem();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v59, OS_LOG_TYPE_DEFAULT, "No change to FMF child account", buf, 2u);
      }
      goto LABEL_22;
    }
    objc_msgSend_setCredentialItem_forKey_(v32, v54, (uint64_t)v13, v9, v55);
LABEL_17:
    v66 = v8;
    v58 = v36;
    objc_msgSend_defaultStore(MEMORY[0x24BDB4398], v54, v56, v57, v55);
    v59 = objc_claimAutoreleasedReturnValue();
    v68 = 0;
    v62 = objc_msgSend_saveVerifiedAccount_error_(v59, v60, (uint64_t)v27, (uint64_t)&v68, v61);
    v63 = (__CFString *)v68;
    _AALogSystem();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = CFSTR("NO");
      if (v62)
        v65 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v70 = v65;
      v71 = 2112;
      v72 = v63;
      _os_log_impl(&dword_230EA3000, v64, OS_LOG_TYPE_DEFAULT, "FMF child account updated successfully (%@) with error: %@", buf, 0x16u);
    }

    v36 = v58;
    v8 = v66;
LABEL_22:
    v40 = v67;

  }
}

+ (id)_findOrphanedAccountForAccountType:(id)a3 forAppleAccount:(id)a4 withStore:(id)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  objc_msgSend_accountsWithAccountType_(a5, v10, (uint64_t)v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230EA86C4;
  v21[3] = &unk_24FF9D0E0;
  v22 = v8;
  v23 = v9;
  v14 = v8;
  v15 = v9;
  objc_msgSend_aaf_firstObjectPassingTest_(v13, v16, (uint64_t)v21, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (void)addDeviceLocatorChildAccountToAppleAccount:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  NSObject *v34;
  __CFString *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  _BOOL4 v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  NSObject *v80;
  _BOOL4 v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  _BOOL4 v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  id v104;
  NSObject *v105;
  const __CFString *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  id v113;
  uint8_t buf[4];
  const __CFString *v115;
  __int16 v116;
  id v117;
  uint64_t v118;

  v118 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_defaultStore(MEMORY[0x24BDB4398], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountTypeWithAccountTypeIdentifier_(v9, v10, *MEMORY[0x24BDB4028], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDB4380]);
  v18 = (void *)objc_msgSend_initWithAccountType_(v14, v15, (uint64_t)v13, v16, v17);
  objc_msgSend_username(v4, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aa_appleAccountWithUsername_(v9, v24, (uint64_t)v23, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend__findOrphanedAccountForAccountType_forAppleAccount_withStore_(a1, v28, (uint64_t)v13, (uint64_t)v27, (uint64_t)v9);
    v29 = objc_claimAutoreleasedReturnValue();
    v110 = v29;
    v111 = v13;
    if (v29)
    {
      v33 = (__CFString *)v29;
      _AALogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v33;
        _os_log_impl(&dword_230EA3000, v34, OS_LOG_TYPE_DEFAULT, "Looks like we found an orphaned device locator account: %@", buf, 0xCu);
      }

      v35 = v33;
      v18 = v35;
    }
    objc_msgSend_setParentAccount_(v18, v30, (uint64_t)v27, v31, v32);
    objc_msgSend_username(v27, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUsername_(v18, v41, (uint64_t)v40, v42, v43);

    objc_msgSend_credential(v4, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_alloc_init(MEMORY[0x24BDB4388]);
    objc_msgSend_findMyiPhoneToken(v48, v50, v51, v52, v53);
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      _AALogSystem();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v58, OS_LOG_TYPE_DEFAULT, "Got an FMIP token, creating device locator child account", buf, 2u);
      }

      objc_msgSend_setToken_(v49, v59, v57, v60, v61);
    }
    v62 = *MEMORY[0x24BDB4240];
    objc_msgSend_credentialItemForKey_(v48, v54, *MEMORY[0x24BDB4240], v55, v56);
    v63 = objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
    v107 = v63;
    if (v63)
    {
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v64, OS_LOG_TYPE_DEFAULT, "Setting FMIP Siri token...", buf, 2u);
      }

      objc_msgSend_setCredentialItem_forKey_(v49, v66, v63, v62, v67, v63);
    }
    else
    {
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v64, OS_LOG_TYPE_DEFAULT, "No FMIP Siri token was found!", buf, 2u);
      }

    }
    v78 = *MEMORY[0x24BDB4360];
    objc_msgSend_credentialItemForKey_(v48, v68, *MEMORY[0x24BDB4360], v69, v70, v107);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v80 = objc_claimAutoreleasedReturnValue();
    v81 = os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
    v112 = v4;
    if (v79)
    {
      if (v81)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v80, OS_LOG_TYPE_DEFAULT, "Setting SearchParty token...", buf, 2u);
      }

      objc_msgSend_setCredentialItem_forKey_(v49, v82, (uint64_t)v79, v78, v83);
    }
    else
    {
      if (v81)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v80, OS_LOG_TYPE_DEFAULT, "No SearchParty token was found!", buf, 2u);
      }

    }
    v87 = *MEMORY[0x24BDB4238];
    objc_msgSend_credentialItemForKey_(v48, v84, *MEMORY[0x24BDB4238], v85, v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
    v109 = (void *)v57;
    if (v88)
    {
      if (v90)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v89, OS_LOG_TYPE_DEFAULT, "Setting FMIP App token...", buf, 2u);
      }

      objc_msgSend_setCredentialItem_forKey_(v49, v91, (uint64_t)v88, v87, v92);
    }
    else
    {
      if (v90)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EA3000, v89, OS_LOG_TYPE_DEFAULT, "No FMIP App token was found!", buf, 2u);
      }

    }
    objc_msgSend_setCredential_(v18, v93, (uint64_t)v49, v94, v95);
    if (objc_msgSend_isAuthenticated(v112, v96, v97, v98, v99))
      objc_msgSend_setAuthenticated_(v18, v100, 1, v101, v102);
    v113 = 0;
    v103 = objc_msgSend_saveVerifiedAccount_error_(v9, v100, (uint64_t)v18, (uint64_t)&v113, v102);
    v104 = v113;
    _AALogSystem();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = CFSTR("NO");
      if (v103)
        v106 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v115 = v106;
      v116 = 2112;
      v117 = v104;
      _os_log_impl(&dword_230EA3000, v105, OS_LOG_TYPE_DEFAULT, "Device locator child account added successfully (%@) with error: %@", buf, 0x16u);
    }

    v13 = v111;
    v4 = v112;
    v71 = v110;
  }
  else
  {
    _AALogSystem();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      sub_230EAC870((uint64_t)v4, v71, v72, v73, v74, v75, v76, v77);
  }

}

+ (void)updateDeviceLocatorChildAccountForAppleAccount:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  int v79;
  __CFString *v80;
  NSObject *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  __CFString *v88;
  id v89;
  uint8_t buf[4];
  const __CFString *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  const __CFString *v95;
  __int16 v96;
  const __CFString *v97;
  __int16 v98;
  const __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_childAccountsWithAccountTypeIdentifier_(v3, v4, *MEMORY[0x24BDB4028], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9, v10, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v87 = v3;
  objc_msgSend_credential(v3, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDB4248];
  objc_msgSend_credentialItemForKey_(v17, v19, *MEMORY[0x24BDB4248], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDB4238];
  objc_msgSend_credentialItemForKey_(v17, v24, *MEMORY[0x24BDB4238], v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *MEMORY[0x24BDB4240];
  objc_msgSend_credentialItemForKey_(v17, v29, *MEMORY[0x24BDB4240], v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x24BDB4360];
  objc_msgSend_credentialItemForKey_(v17, v34, *MEMORY[0x24BDB4360], v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v12;
  objc_msgSend_credential(v12, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialItemForKey_(v42, v43, v18, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialItemForKey_(v42, v47, v23, v48, v49);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialItemForKey_(v42, v50, v28, v51, v52);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_credentialItemForKey_(v42, v53, v33, v54, v55);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqualToString_(v46, v56, (uint64_t)v22, v57, v58)
    || !objc_msgSend_isEqualToString_(v86, v59, (uint64_t)v27, v61, v62)
    || !objc_msgSend_isEqualToString_(v85, v59, (uint64_t)v32, v61, v62)
    || (objc_msgSend_isEqualToString_(v84, v59, (uint64_t)v37, v61, v62) & 1) == 0)
  {
    v83 = v46;
    if (objc_msgSend_isAuthenticated(v87, v59, v60, v61, v62))
      objc_msgSend_setAuthenticated_(v88, v63, 1, v64, v65);
    _AALogSystem();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = CFSTR("YES");
      if (v22)
        v68 = CFSTR("YES");
      else
        v68 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v91 = v88;
      if (v27)
        v69 = CFSTR("YES");
      else
        v69 = CFSTR("NO");
      v92 = 2112;
      v93 = v68;
      if (v32)
        v70 = CFSTR("YES");
      else
        v70 = CFSTR("NO");
      v94 = 2112;
      v95 = v69;
      if (!v37)
        v67 = CFSTR("NO");
      v96 = 2112;
      v97 = v70;
      v98 = 2112;
      v99 = v67;
      _os_log_impl(&dword_230EA3000, v66, OS_LOG_TYPE_DEFAULT, "Updating device locator account (%@) tokens FMIP (%@), app (%@), Siri (%@), and SearchParty (%@) tokens", buf, 0x34u);
    }

    v75 = v22 != 0;
    if (v22)
      objc_msgSend_setToken_(v42, v71, (uint64_t)v22, v73, v74);
    if (v27)
    {
      objc_msgSend_setCredentialItem_forKey_(v42, v71, (uint64_t)v27, v23, v74);
      v75 = 1;
    }
    if (v32)
    {
      objc_msgSend_setCredentialItem_forKey_(v42, v71, (uint64_t)v32, v28, v74);
      if (!v37)
        goto LABEL_29;
    }
    else if (!v37)
    {
      if (!v75)
      {
        _AALogSystem();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_230EA3000, v76, OS_LOG_TYPE_DEFAULT, "No change to device locator account", buf, 2u);
        }
        goto LABEL_34;
      }
LABEL_29:
      objc_msgSend_defaultStore(MEMORY[0x24BDB4398], v71, v72, v73, v74);
      v76 = objc_claimAutoreleasedReturnValue();
      v89 = 0;
      v79 = objc_msgSend_saveVerifiedAccount_error_(v76, v77, (uint64_t)v88, (uint64_t)&v89, v78);
      v80 = (__CFString *)v89;
      _AALogSystem();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        v82 = CFSTR("NO");
        if (v79)
          v82 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v91 = v82;
        v92 = 2112;
        v93 = v80;
        _os_log_impl(&dword_230EA3000, v81, OS_LOG_TYPE_DEFAULT, "Device locator child account updated successfully (%@) with error: %@", buf, 0x16u);
      }

LABEL_34:
      v46 = v83;

      goto LABEL_35;
    }
    objc_msgSend_setCredentialItem_forKey_(v42, v71, (uint64_t)v37, v33, v74);
    goto LABEL_29;
  }
LABEL_35:

}

@end
