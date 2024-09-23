@implementation AAUISignInFlowController

- (AAUISignInFlowController)init
{
  AAUISignInFlowController *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  NSMutableDictionary *v5;
  NSMutableDictionary *cdpContextsByAccountID;
  NSLock *v7;
  NSLock *cdpContextsByAccountIDLock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AAUISignInFlowController;
  v2 = -[AAUISignInFlowController init](&v10, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cdpContextsByAccountID = v2->_cdpContextsByAccountID;
    v2->_cdpContextsByAccountID = v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    cdpContextsByAccountIDLock = v2->_cdpContextsByAccountIDLock;
    v2->_cdpContextsByAccountIDLock = v7;

  }
  return v2;
}

- (BOOL)shouldHideActivationLockAlert
{
  return -[AAUISignInFlowController activationAction](self, "activationAction") != 0;
}

- (void)setShouldHideActivationLockAlert:(BOOL)a3
{
  -[AAUISignInFlowController setActivationAction:](self, "setActivationAction:", a3);
}

- (void)signInWithIDMSAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int AppBooleanValue;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  BOOL v33;
  char v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  unint64_t Nanoseconds;
  NSObject *v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  int v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSMutableDictionary *cdpContextsByAccountID;
  void *v50;
  NSObject *v51;
  os_signpost_id_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  ACAccountStore *accountStore;
  void *v59;
  int v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  _QWORD *v65;
  NSObject *v66;
  id v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  id v81;
  id v82;
  os_signpost_id_t v83;
  uint64_t v84;
  _QWORD block[5];
  id v86;
  id v87;
  _QWORD aBlock[4];
  id v89;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  os_signpost_id_t v92;
  __int16 v93;
  double v94;
  __int16 v95;
  int v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v69 = _os_activity_create(&dword_1DB4ED000, "appleaccountui/signin-with-IDMSauthresults", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v69, &state);
  v72 = objc_alloc_init(MEMORY[0x1E0DC5EF0]);
  if (objc_msgSend(v72, "isEnterprisePersona"))
  {
    objc_msgSend(v72, "userPersonaUniqueString");
    v8 = objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:].cold.3(v8, v9);
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:].cold.4();
    v75 = 0;
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke;
  aBlock[3] = &unk_1EA2DC368;
  v67 = v7;
  v89 = v67;
  v76 = _Block_copy(aBlock);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "stringValue");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)v10;
  _AAUISignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = _AAUISignpostCreate(v11);
  v70 = v13;
  v14 = v12;

  _AAUISignpostLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "GetLocalAppleAccount", " enableTelemetry=YES ", buf, 2u);
  }

  _AAUISignpostLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v92 = v14;
    _os_log_impl(&dword_1DB4ED000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: GetLocalAppleAccount  enableTelemetry=YES ", buf, 0xCu);
  }

  if (v78)
  {
    -[ACAccountStore aa_appleAccountWithPersonID:](self->_accountStore, "aa_appleAccountWithPersonID:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E0CFAE78], (CFStringRef)*MEMORY[0x1E0CFAB68], 0);
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACAccountStore aa_dataSeparatedAccounts](self->_accountStore, "aa_dataSeparatedAccounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v18)
  {
    _AAUILogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v92 = (os_signpost_id_t)v78;
      _os_log_impl(&dword_1DB4ED000, v23, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: found an existing account with DSID %@.", buf, 0xCu);
    }

    -[AAUISignInFlowController _updateAppleAccountIfNecessary:withAltDSID:rawPassword:](self, "_updateAppleAccountIfNecessary:withAltDSID:rawPassword:", v18, v73, v77);
    if (v20)
    {
      _AAUILogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v92 = (os_signpost_id_t)v18;
        _os_log_impl(&dword_1DB4ED000, v24, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: cannot promote existing account %@.", buf, 0xCu);
      }

      -[AAUISignInFlowController _messageForErrorAlert:](self, "_messageForErrorAlert:", -9002);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v103 = *MEMORY[0x1E0CB2D50];
      v104[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9002, v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v75)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFC8]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25
          || (objc_msgSend(MEMORY[0x1E0CFACE8], "findEnterprisePersonaIdentifier"),
              v59 = (void *)objc_claimAutoreleasedReturnValue(),
              v60 = objc_msgSend(v25, "isEqualToString:", v59),
              v59,
              !v60))
        {
          _AAUILogSystem();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v92 = (os_signpost_id_t)v18;
            _os_log_impl(&dword_1DB4ED000, v66, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: promoting existing account %@ to primary.", buf, 0xCu);
          }

          objc_msgSend(v18, "aa_setAccountClass:", *MEMORY[0x1E0CFAAE8]);
          objc_msgSend(v18, "setAccountDescription:", CFSTR("iCloud"));
          v39 = 0;
          goto LABEL_39;
        }
        _AAUILogSystem();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v92 = (os_signpost_id_t)v18;
          _os_log_impl(&dword_1DB4ED000, v61, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: cannot promote existing data separated account %@.", buf, 0xCu);
        }

        -[AAUISignInFlowController _messageForErrorAlert:](self, "_messageForErrorAlert:", -9011);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)MEMORY[0x1E0CB35C8];
        v99 = *MEMORY[0x1E0CB2D50];
        v100 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9011, v63);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
LABEL_39:

        goto LABEL_40;
      }
      _AAUILogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v92 = (os_signpost_id_t)v78;
        _os_log_impl(&dword_1DB4ED000, v35, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: found an existing account with DSID %@, but we're running in the enterprise persona.", buf, 0xCu);
      }

      -[AAUISignInFlowController _messageForErrorAlert:](self, "_messageForErrorAlert:", -9010);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      v102 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9010, v27);
      v28 = objc_claimAutoreleasedReturnValue();
    }
LABEL_37:
    v39 = (void *)v28;
    goto LABEL_38;
  }
  _AAUILogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v92 = (os_signpost_id_t)v74;
    _os_log_impl(&dword_1DB4ED000, v29, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: will sign in new iCloud account for %@.", buf, 0xCu);
  }

  v30 = objc_alloc(MEMORY[0x1E0C8F298]);
  -[AAUISignInFlowController _appleAccountType](self, "_appleAccountType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v30, "initWithAccountType:", v31);

  objc_msgSend(v18, "setUsername:", v74);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v78);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccountProperty:forKey:", v32, CFSTR("personID"));
  v33 = v22 == 0;

  if (v75)
    v34 = v33;
  else
    v34 = 1;
  if (!(v34 & 1 | (AppBooleanValue != 0)))
  {
    _AAUILogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:].cold.2();

    -[AAUISignInFlowController _messageForErrorAlert:](self, "_messageForErrorAlert:", -9012);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v97 = *MEMORY[0x1E0CB2D50];
    v98 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9012, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (v75)
  {
    objc_msgSend(v18, "setAccountDescription:", v74);
    objc_msgSend(v18, "aa_setAccountClass:", *MEMORY[0x1E0CFAAE0]);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v75, *MEMORY[0x1E0C8EFC8]);
  }
  else
  {
    if (v20)
    {
      objc_msgSend(v18, "setAccountDescription:", v74);
      if (AppBooleanValue)
      {
        _AAUILogSystem();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          -[AAUISignInFlowController signInWithIDMSAuthenticationResults:completion:].cold.1();

        v65 = (_QWORD *)MEMORY[0x1E0CFAAE0];
      }
      else
      {
        v65 = (_QWORD *)MEMORY[0x1E0CFAAD8];
      }
    }
    else
    {
      objc_msgSend(v18, "setAccountDescription:", CFSTR("iCloud"));
      v65 = (_QWORD *)MEMORY[0x1E0CFAAE8];
    }
    objc_msgSend(v18, "aa_setAccountClass:", *v65);
  }
  v39 = 0;
LABEL_40:
  Nanoseconds = _AAUISignpostGetNanoseconds(v14, v70);
  _AAUISignpostLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    v43 = objc_msgSend(v39, "code");
    *(_DWORD *)buf = 67240192;
    LODWORD(v92) = v43;
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v42, OS_SIGNPOST_INTERVAL_END, v14, "GetLocalAppleAccount", " Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 8u);
  }

  _AAUISignpostLogSystem();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = objc_msgSend(v39, "code");
    *(_DWORD *)buf = 134218496;
    v92 = v14;
    v93 = 2048;
    v94 = (double)Nanoseconds / 1000000000.0;
    v95 = 1026;
    v96 = v45;
    _os_log_impl(&dword_1DB4ED000, v44, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: GetLocalAppleAccount  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x1Cu);
  }

  if (v39)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_48;
    block[3] = &unk_1EA2DC000;
    block[4] = self;
    v86 = v39;
    v87 = v76;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B0], "credentialWithPassword:", v71);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCredential:", v46);
    objc_msgSend(v18, "_aa_setRawPassword:", v77);
    if (objc_msgSend(v18, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]))
    {
      +[AAUICDPHelper cdpContextForPrimaryAccountWithAuthenticationResults:](AAUICDPHelper, "cdpContextForPrimaryAccountWithAuthenticationResults:", v6);
      v47 = objc_claimAutoreleasedReturnValue();
      -[AAUISignInFlowController messageSession](self, "messageSession");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setSharingChannel:](v47, "setSharingChannel:", v48);

      -[NSObject set_ignoreLockAssertErrors:](v47, "set_ignoreLockAssertErrors:", -[AAUISignInFlowController ignoreLockAssertErrors](self, "ignoreLockAssertErrors"));
      -[NSLock lock](self->_cdpContextsByAccountIDLock, "lock");
      cdpContextsByAccountID = self->_cdpContextsByAccountID;
      objc_msgSend(v18, "identifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](cdpContextsByAccountID, "setObject:forKeyedSubscript:", v47, v50);

      -[NSLock unlock](self->_cdpContextsByAccountIDLock, "unlock");
    }
    else
    {
      _AAUILogSystem();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v92 = (os_signpost_id_t)v18;
        _os_log_impl(&dword_1DB4ED000, v47, OS_LOG_TYPE_DEFAULT, "AAUISignInFlowController: HSA 2 account %@ is secondary, so no iCDP checks will be made.", buf, 0xCu);
      }
    }

    _AAUISignpostLogSystem();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = _AAUISignpostCreate(v51);
    v54 = v53;

    _AAUISignpostLogSystem();
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SignInRegisterAccount", " enableTelemetry=YES ", buf, 2u);
    }

    _AAUISignpostLogSystem();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v92 = v52;
      _os_log_impl(&dword_1DB4ED000, v57, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInRegisterAccount  enableTelemetry=YES ", buf, 0xCu);
    }

    accountStore = self->_accountStore;
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_53;
    v79[3] = &unk_1EA2DC408;
    v83 = v52;
    v84 = v54;
    v79[4] = self;
    v80 = v18;
    v82 = v76;
    v81 = v6;
    -[ACAccountStore aa_registerAppleAccount:withCompletion:](accountStore, "aa_registerAppleAccount:withCompletion:", v80, v79);

  }
  os_activity_scope_leave(&state);

}

uint64_t __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_48(uint64_t a1)
{
  id WeakRetained;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_presentExistingAccountAlert:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  _BYTE v23[10];
  double v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AAUISignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AAUISignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v23 = a2;
    *(_WORD *)&v23[4] = 1026;
    *(_DWORD *)&v23[6] = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignInRegisterAccount", " Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  _AAUISignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = *(_QWORD *)(a1 + 64);
    v13 = objc_msgSend(v5, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v23 = v12;
    *(_WORD *)&v23[8] = 2048;
    v24 = v11;
    v25 = 1026;
    v26 = a2;
    v27 = 1026;
    v28 = v13;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInRegisterAccount  Authenticated=%{public,signpost.telemetry:number1,name=Authenticated}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_54;
  v18[3] = &unk_1EA2DC3E0;
  v16 = *(id *)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 32);
  v21 = v16;
  v18[4] = v17;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v14, "_verifyLoginResponseForiCloudAccount:withSuccess:response:error:completion:", v15, a2, 0, v5, v18);

}

void __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_54(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_2;
    v11[3] = &unk_1EA2DC3B8;
    v11[4] = v9;
    v12 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = 1;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v9, "_stashLoginResponseWithAuthenticationResults:completion:", v10, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;
  uint8_t buf[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Successfully authenticated account, attempting to enable FindMy if possible...", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_55;
  v5[3] = &unk_1EA2DC390;
  v8 = *(id *)(a1 + 64);
  v9 = *(_BYTE *)(a1 + 72);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "_promptToEnableFindMyIfPossibleWithAccount:completion:", v4, v5);

}

uint64_t __75__AAUISignInFlowController_signInWithIDMSAuthenticationResults_completion___block_invoke_55(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Result of enabling FindMy, didPrompt: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_updateAppleAccountIfNecessary:(id)a3 withAltDSID:(id)a4 rawPassword:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Checking to see if we should update altDSID on iCloud account %@", (uint8_t *)&v17, 0xCu);
  }

  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v8, "aa_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    _AAUILogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "iCloud account already has altDSID, ignoring...", (uint8_t *)&v17, 2u);
      }

    }
    else
    {
      if (v15)
      {
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Updating iCloud account with altDSID: %@", (uint8_t *)&v17, 0xCu);
      }

      objc_msgSend(v8, "_aa_setAltDSID:", v9);
      objc_msgSend(v8, "_aa_setRawPassword:", v10);
      -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](self->_accountStore, "saveVerifiedAccount:withCompletionHandler:", v8, 0);
    }
  }
  else
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "No altDSID provided, nothing to do...", (uint8_t *)&v17, 2u);
    }

  }
}

- (void)_verifyLoginResponseForiCloudAccount:(id)a3 withSuccess:(BOOL)a4 response:(id)a5 error:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *cdpContextsByAccountID;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void **v25;
  id *v26;
  _QWORD v27[4];
  id v28;
  AAUISignInFlowController *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD block[5];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  if (!a4)
  {
    objc_msgSend(v12, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CFAE30]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    _AAUILogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_1DB4ED000, v24, OS_LOG_TYPE_DEFAULT, "Account is not valid: handling error %@", buf, 0xCu);
    }

    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CFAE50]))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke;
      block[3] = &unk_1EA2DC000;
      block[4] = self;
      v25 = &v36;
      v36 = v11;
      v26 = &v37;
      v37 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2;
      v31[3] = &unk_1EA2DB8B8;
      v31[4] = self;
      v25 = &v32;
      v32 = v12;
      v26 = &v33;
      v33 = v11;
      v34 = v13;
      dispatch_async(MEMORY[0x1E0C80D38], v31);

    }
    v22 = *v25;
    goto LABEL_18;
  }
  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v14, OS_LOG_TYPE_DEFAULT, "Account is valid: finish account setup", buf, 2u);
  }

  objc_msgSend(v11, "aa_password");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "We have a password, setAuthenticated to NO and grab delegate tokens", buf, 2u);
    }

    objc_msgSend(v11, "setAuthenticated:", 0);
  }
  -[NSLock lock](self->_cdpContextsByAccountIDLock, "lock");
  cdpContextsByAccountID = self->_cdpContextsByAccountID;
  objc_msgSend(v11, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cdpContextsByAccountID, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_cdpContextsByAccountIDLock, "unlock");
  _AAUILogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "Finished auth'ing account and must validate iCDP state.", buf, 2u);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_62;
    v27[3] = &unk_1EA2DC430;
    v28 = v11;
    v29 = self;
    v30 = v13;
    -[AAUISignInFlowController _validateCDPStateForAccount:withCDPContext:completion:](self, "_validateCDPStateForAccount:withCDPContext:completion:", v28, v19, v27);

    v22 = v28;
LABEL_18:

    goto LABEL_19;
  }
  if (v21)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "Finished auth'ing without a queued CDP context. No need to validate iCDP state.", buf, 2u);
  }

  -[AAUISignInFlowController _saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:](self, "_saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:", v11, v13);
LABEL_19:

}

uint64_t __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showGenericTermsUIforAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentValidationErrorAlert:forAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_62(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "refresh");
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Validating iCDP succeeded! Proceeding with iCloud sign-in...", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_62_cold_1((uint64_t)v5, v7);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_63;
    block[3] = &unk_1EA2DC000;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_63(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldDisplayToUser"))
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB2D68]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_FAILED_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
    }

    objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v10);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2_73;
    v12[3] = &unk_1EA2DB110;
    v14 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v6, 1, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_2_73(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)_validateCDPStateForAccount:(id)a3 withCDPContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  ACAccountStore *accountStore;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  AAUISignInFlowController *v35;
  id v36;
  id v37;
  os_signpost_id_t v38;
  uint64_t v39;
  _QWORD aBlock[5];
  id v41;
  uint8_t buf[4];
  os_signpost_id_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D15780];
  v11 = a4;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithContext:", v11);

  v13 = objc_alloc(MEMORY[0x1E0D157C8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v15 = (void *)objc_msgSend(v13, "initWithPresentingViewController:", WeakRetained);

  v16 = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_opt_class();
  LOBYTE(WeakRetained) = objc_opt_isKindOfClass();

  if ((WeakRetained & 1) != 0)
    objc_msgSend(v15, "setForceInlinePresentation:", 1);
  objc_msgSend(v12, "setUiProvider:", v15);
  v17 = v8;
  v18 = v17;
  v19 = v17;
  if (!self->_shouldAutomaticallySaveSignInResults)
  {
    v19 = (void *)objc_msgSend(v17, "copy");

    -[ACAccountStore setNotificationsEnabled:](self->_accountStore, "setNotificationsEnabled:", 0);
  }
  objc_msgSend(v19, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F3C0]);
  objc_msgSend(v19, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F3C8]);
  objc_msgSend(v19, "setEnabled:forDataclass:", 1, *MEMORY[0x1E0C8F398]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke;
  aBlock[3] = &unk_1EA2DC458;
  aBlock[4] = self;
  v41 = v9;
  v20 = v9;
  v21 = _Block_copy(aBlock);
  _AAUISignpostLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = _AAUISignpostCreate(v22);
  v25 = v24;

  _AAUISignpostLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v23, "SignInPreflightSave", " enableTelemetry=YES ", buf, 2u);
  }

  _AAUISignpostLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v43 = v23;
    _os_log_impl(&dword_1DB4ED000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInPreflightSave  enableTelemetry=YES ", buf, 0xCu);
  }

  accountStore = self->_accountStore;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_77;
  v33[3] = &unk_1EA2DC4D0;
  v38 = v23;
  v39 = v25;
  v34 = v12;
  v35 = self;
  v36 = v19;
  v37 = v21;
  v30 = v19;
  v31 = v12;
  v32 = v21;
  -[ACAccountStore saveAccount:withCompletionHandler:](accountStore, "saveAccount:withCompletionHandler:", v30, v33);

}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a3;
  objc_msgSend(v4, "setNotificationsEnabled:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_77(uint64_t a1, int a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  os_signpost_id_t v28;
  uint64_t v29;
  uint8_t buf[4];
  _BYTE v31[10];
  double v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AAUISignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AAUISignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v31 = a2;
    *(_WORD *)&v31[4] = 1026;
    *(_DWORD *)&v31[6] = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignInPreflightSave", " DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  _AAUISignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = *(_QWORD *)(a1 + 64);
    v13 = objc_msgSend(v5, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v31 = v12;
    *(_WORD *)&v31[8] = 2048;
    v32 = v11;
    v33 = 1026;
    v34 = a2;
    v35 = 1026;
    v36 = v13;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInPreflightSave  DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  if ((a2 & 1) != 0)
  {
    _AAUISignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = _AAUISignpostCreate(v14);
    v17 = v16;

    _AAUISignpostLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SignInValidateCDP", " enableTelemetry=YES ", buf, 2u);
    }

    _AAUISignpostLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v31 = v15;
      _os_log_impl(&dword_1DB4ED000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInValidateCDP  enableTelemetry=YES ", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_78;
    v25[3] = &unk_1EA2DC4A8;
    v28 = v15;
    v29 = v17;
    v21 = *(void **)(a1 + 32);
    v25[4] = *(_QWORD *)(a1 + 40);
    v27 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 48);
    objc_msgSend(v21, "handleCloudDataProtectionStateWithCompletion:", v25);

  }
  else
  {
    _AAUILogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v31 = v5;
      _os_log_impl(&dword_1DB4ED000, v22, OS_LOG_TYPE_DEFAULT, "iCDP preflighting failed because we could not save the iCloud account! Error: %@", buf, 0xCu);
    }

    v23 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9004, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

  }
}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_78(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  unint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  int v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;
  uint8_t buf[4];
  _BYTE v26[10];
  double v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  Nanoseconds = _AAUISignpostGetNanoseconds(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  _AAUISignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v26 = a3;
    *(_WORD *)&v26[4] = 1026;
    *(_DWORD *)&v26[6] = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SignInValidateCDP", " Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0xEu);
  }

  _AAUISignpostLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (double)Nanoseconds / 1000000000.0;
    v14 = *(_QWORD *)(a1 + 56);
    v15 = objc_msgSend(v7, "code");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)v26 = v14;
    *(_WORD *)&v26[8] = 2048;
    v27 = v13;
    v28 = 1026;
    v29 = a3;
    v30 = 1026;
    v31 = v15;
    _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInValidateCDP  Enabled=%{public,signpost.telemetry:number1,name=Enabled}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", buf, 0x22u);
  }

  if (a2 && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v16 = v7;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v17 = v7;
    _AAUILogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up temporary account state created during iCDP validation.", buf, 2u);
    }

    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_79;
    v21[3] = &unk_1EA2DC480;
    v23 = *(id *)(a1 + 48);
    v24 = a2;
    v22 = v17;
    objc_msgSend(v20, "removeAccount:withCompletionHandler:", v19, v21);

  }
}

void __82__AAUISignInFlowController__validateCDPStateForAccount_withCDPContext_completion___block_invoke_79(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Failed to clean up after iCDP! Error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_saveAccount:(id)a3 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id pendingCompletion;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, int, uint64_t, void *);
  void *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t *v30;
  id v31[3];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  AAUISignInOperationManager *v37;
  uint8_t buf[4];
  char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v7;
  if (self->_shouldAutomaticallySaveSignInResults)
  {
    if (self->_pendingCompletion)
    {
      _AAUILogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AAUISignInFlowController _saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:].cold.2();

      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v8)[2](v8, 0, 0, v10);

    }
    else
    {
      -[AAUISignInFlowController presentingViewController](self, "presentingViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v32 = 0;
        v33 = &v32;
        v34 = 0x3032000000;
        v35 = __Block_byref_object_copy__7;
        v36 = __Block_byref_object_dispose__7;
        v37 = -[AAUISignInOperationManager initWithPresentingViewController:]([AAUISignInOperationManager alloc], "initWithPresentingViewController:", v11);
        objc_msgSend((id)v33[5], "setDelegate:", self);
        _AAUISignpostLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (char *)_AAUISignpostCreate(v12);
        v15 = v14;

        _AAUISignpostLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "SignInEnableDataclasses", " enableTelemetry=YES ", buf, 2u);
        }

        _AAUISignpostLogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v39 = v13;
          _os_log_impl(&dword_1DB4ED000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignInEnableDataclasses  enableTelemetry=YES ", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __91__AAUISignInFlowController__saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
        v27 = &unk_1EA2DC4F8;
        v31[1] = v13;
        v31[2] = v15;
        v29 = v8;
        v19 = v6;
        v28 = v19;
        objc_copyWeak(v31, (id *)buf);
        v30 = &v32;
        v20 = _Block_copy(&v24);
        pendingCompletion = self->_pendingCompletion;
        self->_pendingCompletion = v20;

        objc_msgSend((id)v33[5], "signInAccount:enablingDataclasses:", v19, 1, v24, v25, v26, v27);
        objc_destroyWeak(v31);

        objc_destroyWeak((id *)buf);
        _Block_object_dispose(&v32, 8);

      }
      else
      {
        _AAUILogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[AAUISignInFlowController _saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:].cold.1();

        objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, _QWORD, void *))v8)[2](v8, 0, 0, v23);

      }
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, id, _QWORD))v7 + 2))(v7, 1, v6, 0);
  }

}

void __91__AAUISignInFlowController__saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  unint64_t Nanoseconds;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  id WeakRetained;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  _BYTE v23[10];
  double v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  Nanoseconds = _AAUISignpostGetNanoseconds(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  _AAUISignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v22 = 67240448;
    *(_DWORD *)v23 = a2;
    *(_WORD *)&v23[4] = 1026;
    *(_DWORD *)&v23[6] = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SignInEnableDataclasses", " DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0xEu);
  }

  _AAUISignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (double)Nanoseconds / 1000000000.0;
    v13 = *(_QWORD *)(a1 + 64);
    v14 = objc_msgSend(v6, "code");
    v22 = 134218752;
    *(_QWORD *)v23 = v13;
    *(_WORD *)&v23[8] = 2048;
    v24 = v12;
    v25 = 1026;
    v26 = a2;
    v27 = 1026;
    v28 = v14;
    _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignInEnableDataclasses  DidSave=%{public,signpost.telemetry:number1,name=DidSave}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v22, 0x22u);
  }

  _AAUILogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = CFSTR("NO");
    if (a2)
      v16 = CFSTR("YES");
    v22 = 138412546;
    *(_QWORD *)v23 = v16;
    *(_WORD *)&v23[8] = 2112;
    v24 = *(double *)&v6;
    _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "iCloud account save completed with success: %@, error: %@", (uint8_t *)&v22, 0x16u);
  }

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_presentUnableToSaveAccountAlert");
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9004, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v18 + 16))(v18, 0, 0, v19);

  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

}

- (void)_stashLoginResponseWithAuthenticationResults:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void (*v21)(void);
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t Nanoseconds;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void (**v38)(_QWORD);
  uint8_t buf[4];
  os_signpost_id_t v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_shouldStashLoginResponse)
  {
    v38 = (void (**)(_QWORD))a4;
    _AAUISignpostLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _AAUISignpostCreate(v7);
    v37 = v9;

    _AAUISignpostLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v8, "StashLoginResponse", " enableTelemetry=YES ", buf, 2u);
    }

    _AAUISignpostLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v40 = v8;
      _os_log_impl(&dword_1DB4ED000, v12, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: StashLoginResponse  enableTelemetry=YES ", buf, 0xCu);
    }

    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.5();

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      _AAUILogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.4();

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      _AAUILogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.3();

    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAD30]), "initWithAppleID:altDSID:", v14, v16);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v18, "setDSID:", v19);
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF78]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        objc_msgSend(v18, "setBeneficiaryLogin:", 1);
    }
    else
    {
      _AAUILogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.2();

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v18, "setRawPassword:", v23);
    }
    else
    {
      _AAUILogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[AAUISignInFlowController _stashLoginResponseWithAuthenticationResults:completion:].cold.1();

    }
    -[ACAccountStore aa_authKitAccountForAltDSID:](self->_accountStore, "aa_authKitAccountForAltDSID:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "credential");
      v27 = objc_claimAutoreleasedReturnValue();
      _AAUILogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = (os_signpost_id_t)v26;
        _os_log_impl(&dword_1DB4ED000, v28, OS_LOG_TYPE_DEFAULT, "Trying to add CK and PRK for %@ to login context...", buf, 0xCu);
      }

      -[NSObject credentialItemForKey:](v27, "credentialItemForKey:", *MEMORY[0x1E0C8F190]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setContinuationKey:", v29);

      -[NSObject credentialItemForKey:](v27, "credentialItemForKey:", *MEMORY[0x1E0C8F238]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPasswordResetKey:", v30);

    }
    else
    {
      _AAUILogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = (os_signpost_id_t)v16;
        _os_log_impl(&dword_1DB4ED000, v27, OS_LOG_TYPE_DEFAULT, "No AuthKit account to grab CK and PRK from for altDSID: %@", buf, 0xCu);
      }
    }

    objc_msgSend(MEMORY[0x1E0CFACA0], "sharedManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setStashedContext:", v18);

    objc_msgSend(MEMORY[0x1E0CFACA0], "sharedManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "persistStashedContext");

    Nanoseconds = _AAUISignpostGetNanoseconds(v8, v37);
    _AAUISignpostLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v35, OS_SIGNPOST_INTERVAL_END, v8, "StashLoginResponse", ", buf, 2u);
    }

    _AAUISignpostLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v40 = v8;
      v41 = 2048;
      v42 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl(&dword_1DB4ED000, v36, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: StashLoginResponse ", buf, 0x16u);
    }

    v38[2](v38);
  }
  else
  {
    v21 = (void (*)(void))*((_QWORD *)a4 + 2);
    v14 = a4;
    v21();
  }

}

- (void)_promptToEnableFindMyIfPossibleWithAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(id, _QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (-[AAUISignInFlowController activationAction](self, "activationAction") == 2)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Activation lock explicitly disabled, not enabling FindMy...";
LABEL_14:
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!-[AAUISignInFlowController shouldAutomaticallySaveSignInResults](self, "shouldAutomaticallySaveSignInResults"))
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Automatic sign in result save disabled, not enabling FindMy...";
      goto LABEL_14;
    }
LABEL_15:

    v7[2](v7, 0);
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8])
    || (objc_msgSend(v6, "aa_isPrimaryEmailVerified") & 1) == 0)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Account is not a primary with email verified...";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3A8]) & 1) == 0)
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v9 = "Account is not provisioned for FindMy...";
    goto LABEL_14;
  }
  -[AAUISignInFlowController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke;
    v12[3] = &unk_1EA2DC590;
    v12[4] = self;
    v14 = v7;
    v13 = v10;
    -[AAUISignInFlowController _hasActivationLockSupportedWatchWithCompletion:](self, "_hasActivationLockSupportedWatchWithCompletion:", v12);

  }
  else
  {
    _AAUILogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AAUISignInFlowController _promptToEnableFindMyIfPossibleWithAccount:completion:].cold.1();

    v7[2](v7, 0);
  }

LABEL_16:
}

void __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD aBlock[4];
  char v16;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2;
  aBlock[3] = &__block_descriptor_33_e5_v8__0l;
  v16 = a2;
  v7 = _Block_copy(aBlock);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_86;
  v10[3] = &unk_1EA2DC568;
  v10[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Enabling FindMy for newly added account, hasWatch: %{public}@.", (uint8_t *)&v6, 0xCu);
  }

  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userNotifiedOfActivationLockForAllPairedDevices");

  }
  +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableInContext:", 3);

}

void __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_86(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  _QWORD v12[4];
  id v13;

  if (objc_msgSend(*(id *)(a1 + 32), "activationAction") == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DEVICE_LOCATOR_TITLE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", v3, &stru_1EA2E2A18, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v4, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2_90;
    v12[3] = &unk_1EA2DC540;
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v8, "actionWithTitle:style:handler:", v6, 0, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v9);

    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Presenting activation lock enable alert...", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v7, 1, *(_QWORD *)(a1 + 56));
  }
}

uint64_t __82__AAUISignInFlowController__promptToEnableFindMyIfPossibleWithAccount_completion___block_invoke_2_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_hasActivationLockSupportedWatchWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke;
  aBlock[3] = &unk_1EA2DC5B8;
  v6 = v4;
  aBlock[4] = self;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("02168E84-5DD8-4B19-9204-A79F04B33A32"));
  v11 = objc_msgSend(v9, "supportsCapability:", v10);

  if (v11)
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke_2;
    v12[3] = &unk_1EA2DC5E0;
    v13 = v7;
    +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:](AAUIDeviceLocatorConfirmationUtilities, "checkIfWatchHasAppleIDAccount:", v12);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
  }

}

void __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  __CFString *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      v4 = CFSTR("DEVICE_LOCATOR_MESSAGE_WATCH");
      if ((objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE_WATCH"), "containsString:", CFSTR("REBRAND")) & 1) != 0
        || !_os_feature_enabled_impl())
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE_WATCH"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v5 = 1;
      }
      objc_msgSend(v11, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 1, v8);

      if ((v5 & 1) == 0)
        goto LABEL_16;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0DC3708];
      v4 = CFSTR("DEVICE_LOCATOR_MESSAGE");
      if ((objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
        || !_os_feature_enabled_impl())
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v7 = 1;
      }
      objc_msgSend(v6, "modelSpecificLocalizedStringKeyForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_1EA2E2A18, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v10);

      if (!v7)
        goto LABEL_16;
    }

LABEL_16:
  }
}

uint64_t __75__AAUISignInFlowController__hasActivationLockSupportedWatchWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentUnableToSaveAccountAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SAVE_FAILED_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertWithTitle:message:", v5, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v9);

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)_showGenericTermsUIforAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  id pendingCompletion;
  id v12;
  char isKindOfClass;
  id v14;
  void *v15;
  uint64_t v16;
  AAUIGenericTermsRemoteUI *v17;
  AAUIGenericTermsRemoteUI *genericTermsRemoteUI;
  void *v19;
  uint8_t v20[16];

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    if (self->_pendingCompletion)
    {
      _AAUILogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Error! A pending completion for sign-in already exists and we are about to overwrite it!", v20, 2u);
      }

    }
    v10 = _Block_copy(v7);
    pendingCompletion = self->_pendingCompletion;
    self->_pendingCompletion = v10;

    v12 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v14 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v15 = v14;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v14, "topViewController");
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    v17 = -[AAUIGenericTermsRemoteUI initWithAccount:inStore:]([AAUIGenericTermsRemoteUI alloc], "initWithAccount:inStore:", v6, self->_accountStore);
    genericTermsRemoteUI = self->_genericTermsRemoteUI;
    self->_genericTermsRemoteUI = v17;

    -[AAUIGenericTermsRemoteUI setDelegate:](self->_genericTermsRemoteUI, "setDelegate:", self);
    -[AAUIGenericTermsRemoteUI presentFromViewController:modal:](self->_genericTermsRemoteUI, "presentFromViewController:modal:", v15, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9005, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v19);

  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  id v6;
  AAUIGenericTermsRemoteUI *genericTermsRemoteUI;
  void *v8;
  id pendingCompletion;
  ACAccountStore *accountStore;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  genericTermsRemoteUI = self->_genericTermsRemoteUI;
  self->_genericTermsRemoteUI = 0;

  v8 = _Block_copy(self->_pendingCompletion);
  pendingCompletion = self->_pendingCompletion;
  self->_pendingCompletion = 0;

  if (a4)
  {
    accountStore = self->_accountStore;
    objc_msgSend(v6, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__AAUISignInFlowController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke;
    v13[3] = &unk_1EA2DC430;
    v13[4] = self;
    v14 = v6;
    v15 = v8;
    -[ACAccountStore aa_registerAppleAccount:withCompletion:](accountStore, "aa_registerAppleAccount:withCompletion:", v11, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AAUISignInErrors"), -9006, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v12);

  }
}

void __70__AAUISignInFlowController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = a3;
  objc_msgSend(v6, "account");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_verifyLoginResponseForiCloudAccount:withSuccess:response:error:completion:", v8, a2, 0, v7, a1[6]);

}

- (void)_presentValidationErrorAlert:(id)a3 forAccount:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id WeakRetained;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  AAUISignInFlowController *v52;
  AAUISignInFlowController *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  _QWORD v58[4];
  _QWORD v59[2];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;

  v8 = a3;
  v57 = a4;
  v9 = a5;
  objc_msgSend(v8, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v54 = v9;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CFAE30]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v8, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0CFAE60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CFAE38]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CFAE68]);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0CFAE28]);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_9;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  -[AAUISignInFlowController _titleForError:account:](self, "_titleForError:account:", v8, v57);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v56 = (void *)v16;
  if (!v15)
  {
    v18 = (void *)*MEMORY[0x1E0CFAE48];
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CFAE48]))
    {
      v49 = v17;
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = self;
      if ((objc_msgSend(v18, "containsString:", CFSTR("REBRAND")) & 1) != 0
        || !_os_feature_enabled_impl())
      {
        v21 = v12;
        v22 = 0;
      }
      else
      {
        v21 = v12;
        objc_msgSend(v18, "stringByAppendingString:", CFSTR("_REBRAND"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 1;
      }
      objc_msgSend(v20, "localizedStringForKey:value:table:", v18, &stru_1EA2E2A18, CFSTR("Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "username");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v23, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      v12 = v21;
      v17 = v49;
      self = v52;
      v16 = (uint64_t)v56;
    }
    else
    {
      objc_msgSend(v8, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v16, v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v14;
  if (objc_msgSend(v8, "code") == 403 && objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CFAE58]))
  {
    v50 = (void *)MEMORY[0x1E0DC3448];
    v26 = (void *)v17;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v48 = v12;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v53 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke;
    v66[3] = &unk_1EA2DC608;
    v29 = v54;
    v30 = v54;
    v68 = v30;
    v31 = v8;
    v67 = v31;
    objc_msgSend(v50, "actionWithTitle:style:handler:", v28, 0, v66);
    v51 = v11;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v32);

    v33 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_115;
    v63[3] = &unk_1EA2DC608;
    v64 = v31;
    v65 = v30;
    v36 = v31;
    v37 = v30;
    v38 = v33;
    v12 = v48;
    objc_msgSend(v38, "actionWithTitle:style:handler:", v35, 1, v63);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v39);

    v11 = v51;
    self = v53;

    v40 = &v68;
  }
  else
  {
    v26 = (void *)v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v42 = (void *)MEMORY[0x1E0DC3448];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_3;
    v58[3] = &unk_1EA2DC630;
    v40 = (id *)v59;
    v59[0] = v12;
    v59[1] = self;
    v43 = v57;
    v29 = v54;
    v61 = v8;
    v62 = v54;
    v60 = v43;
    v44 = v8;
    v45 = v54;
    objc_msgSend(v42, "actionWithTitle:style:handler:", v26, 1, v58);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addAction:", v46);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v25, 1, 0);

}

uint64_t __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed Unsupported Device alert.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_115(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (void *)*MEMORY[0x1E0DC4730];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.me.com/findmyiphone/account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_2;
  v4[3] = &unk_1EA2DC5B8;
  v6 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v2, "openURL:withCompletionHandler:", v3, v4);

}

uint64_t __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79__AAUISignInFlowController__presentValidationErrorAlert_forAccount_completion___block_invoke_3(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E0CFAE48]))
    return objc_msgSend(*(id *)(a1 + 40), "_showGenericTermsUIforAccount:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (id)_messageForErrorAlert:(int64_t)a3
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (unint64_t)(a3 + 9011) > 9 || ((1 << (a3 + 51)) & 0x203) == 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_VALIDATE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("ALREADY_EXISTING_ACCOUNT_DESC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1EA2E2A18, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v7, CFSTR("iCloud"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_presentExistingAccountAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  id v17;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v17, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15);

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v11, 1, 0);

}

- (id)_titleForError:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (v9 = *MEMORY[0x1E0CFAE30],
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CFAE30]),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    objc_msgSend(v8, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v5, "code");
  switch(v12)
  {
    case 403:
      if (!v11)
        goto LABEL_12;
      if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CFAE40]))
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", CFSTR("_DYNAMIC_TITLE"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", v18, &stru_1EA2E2A18, CFSTR("Localizable"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      break;
    case 402:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("MOBILEME_PAID_ACCOUNT_LAPSED_TITLE");
      goto LABEL_14;
    case 401:
      break;
    default:
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("VERIFICATION_FAILED_TITLE");
LABEL_14:
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1EA2E2A18, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
  }
  objc_msgSend(v6, "aa_displayName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v13;
}

- (id)_appleAccountType
{
  ACAccountType *appleAccountType;
  ACAccountType *v4;
  ACAccountType *v5;

  appleAccountType = self->_appleAccountType;
  if (!appleAccountType)
  {
    -[ACAccountStore accountTypeWithAccountTypeIdentifier:](self->_accountStore, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
    v4 = (ACAccountType *)objc_claimAutoreleasedReturnValue();
    v5 = self->_appleAccountType;
    self->_appleAccountType = v4;

    appleAccountType = self->_appleAccountType;
  }
  return appleAccountType;
}

- (void)prewarmOperationsWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFAD08], "sharedServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke;
  v6[3] = &unk_1EA2DC680;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "configurationWithCompletion:", v6);

}

void __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  NSObject *v13;

  v3 = a2;
  objc_msgSend(CFSTR("PREWARM"), "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  objc_msgSend(v3, "absintheEnable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  v8 = MEMORY[0x1E0C809B0];
  if (v7 == 1)
  {
    dispatch_group_enter(v5);
    objc_msgSend(MEMORY[0x1E0CFABA0], "sharedSigner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_2;
    v12[3] = &unk_1EA2DC658;
    v13 = v5;
    objc_msgSend(v9, "signatureForData:completion:", v4, v12);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_3;
    v10[3] = &unk_1EA2DB0E8;
    v11 = *(id *)(a1 + 32);
    dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v10);

  }
}

void __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__AAUISignInFlowController_prewarmOperationsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5
{
  void (**pendingCompletion)(id, BOOL, id, id);
  id v7;
  NSObject *v8;

  pendingCompletion = (void (**)(id, BOOL, id, id))self->_pendingCompletion;
  if (pendingCompletion)
  {
    pendingCompletion[2](pendingCompletion, a4 != 0, a4, a5);
    v7 = self->_pendingCompletion;
    self->_pendingCompletion = 0;

  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUISignInFlowController signInOperationManager:didSaveAccount:error:].cold.1();

  }
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (BOOL)shouldAutomaticallySaveSignInResults
{
  return self->_shouldAutomaticallySaveSignInResults;
}

- (void)setShouldAutomaticallySaveSignInResults:(BOOL)a3
{
  self->_shouldAutomaticallySaveSignInResults = a3;
}

- (BOOL)ignoreLockAssertErrors
{
  return self->_ignoreLockAssertErrors;
}

- (void)setIgnoreLockAssertErrors:(BOOL)a3
{
  self->_ignoreLockAssertErrors = a3;
}

- (CUMessageSession)messageSession
{
  return self->_messageSession;
}

- (void)setMessageSession:(id)a3
{
  objc_storeStrong((id *)&self->_messageSession, a3);
}

- (unint64_t)activationAction
{
  return self->_activationAction;
}

- (void)setActivationAction:(unint64_t)a3
{
  self->_activationAction = a3;
}

- (BOOL)shouldStashLoginResponse
{
  return self->_shouldStashLoginResponse;
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  self->_shouldStashLoginResponse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_cdpContextsByAccountIDLock, 0);
  objc_storeStrong((id *)&self->_cdpContextsByAccountID, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_appleAccountType, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Multiple full accounts allowed! Setting account class to full!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Having multiple full accounts is not a supported configuration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInWithIDMSAuthenticationResults:(uint64_t)a1 completion:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Enterprise persona detected: %@", (uint8_t *)&v2, 0xCu);
}

- (void)signInWithIDMSAuthenticationResults:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "We're not running in Enterprise Persona.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __103__AAUISignInFlowController__verifyLoginResponseForiCloudAccount_withSuccess_response_error_completion___block_invoke_62_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Validating iCDP failed with error %@! Blocking iCloud sign-in...", (uint8_t *)&v2, 0xCu);
}

- (void)_saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Attempt to save without a valid presenting view controller!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Attempt to save account while another save is mid-flight!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Login response results missing rp!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Login response results missing DSID!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Login response results missing altDSID!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Login response results missing username!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_stashLoginResponseWithAuthenticationResults:completion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Stashing login response because caller said so...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_promptToEnableFindMyIfPossibleWithAccount:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Failed to enable FindMy, no presentingViewController found!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInOperationManager:didSaveAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, v0, v1, "Sign in operation manager completed without a callback!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
