@implementation IMDAccountController

- (id)accountsForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[IMDAccountController accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D141B26C;
  v9[3] = &unk_1E9227D78;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isAccountActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMDAccountController _isAccountActive:forService:](self, "_isAccountActive:forService:", v4, v6);

  return (char)self;
}

- (BOOL)_isAccountActive:(id)a3 forService:(id)a4
{
  NSMutableDictionary *activeAccounts;
  id v6;
  void *v7;
  void *v8;
  char v9;

  activeAccounts = self->_activeAccounts;
  v6 = a3;
  objc_msgSend(a4, "internalName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeAccounts, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  return v9;
}

- (id)accountForAccountID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_accounts, "objectForKey:", a3);
}

+ (IMDAccountController)sharedInstance
{
  if (qword_1ED935C40 != -1)
    dispatch_once(&qword_1ED935C40, &unk_1E9227D28);
  return (IMDAccountController *)(id)qword_1ED935D60;
}

- (BOOL)networkDataAvailable
{
  return self->_networkDataAvailable;
}

- (NSArray)activeAccounts
{
  void *v2;
  void *v3;

  -[IMDAccountController accounts](self, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &unk_1E9227DB8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)activeAccountsForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D141B228;
  v9[3] = &unk_1E9227D78;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)accounts
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_accounts, "allValues");
}

- (IMDAccountController)init
{
  IMDAccountController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMDAccountController;
  v2 = -[IMDAccountController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__daemonWillShutdown_, CFSTR("__kIMDaemonWillShutdownNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_accounts;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "idsAccount");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeDelegate:", self);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)IMDAccountController;
  -[IMDAccountController dealloc](&v10, sel_dealloc);
}

- (void)load
{
  NSMutableDictionary *activeAccounts;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  IMDAccountController *v9;
  IMDAccountController *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  char v17;
  void *v18;
  NSObject *v19;
  IMDAccountController *v20;
  NSObject *v21;
  IMDAccountController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  IMDAccountController *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  IMDAccountController *v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  IMDAccount *v46;
  void *v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  IMDAccount *v51;
  uint64_t v52;
  NSObject *v53;
  IMDAccountController *v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  IMDAccountController *v58;
  void *v59;
  NSObject *v60;
  IMDAccountController *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  IMDAccountController *v65;
  IMDAccountController *v66;
  int v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  IMDAccountController *v73;
  NSObject *v74;
  NSObject *v75;
  IMDAccount *v76;
  NSObject *v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  uint64_t v87;
  uint64_t v88;
  IMDAccountController *v89;
  uint64_t v90;
  void *v91;
  id v92;
  IMDAccountController *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint8_t v113[128];
  uint8_t buf[4];
  IMDAccountController *v115;
  __int16 v116;
  void *v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  self->_isLoading = 1;
  activeAccounts = self->_activeAccounts;
  self->_isFirstLoad = activeAccounts == 0;
  if (!activeAccounts)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v5 = self->_activeAccounts;
    self->_activeAccounts = Mutable;

  }
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[IMDServiceController sharedController](IMDServiceController, "sharedController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allServices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByApplyingSelector:", sel_internalName);
      v9 = (IMDAccountController *)(id)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("YES");
      if (!self->_isFirstLoad)
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v115 = v9;
      v116 = 2112;
      v117 = (void *)v11;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Loading services: %@ (First load: %@)", buf, 0x16u);

    }
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allServices");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
  v88 = v13;
  if (v13)
  {
    v87 = *(_QWORD *)v107;
    v83 = *MEMORY[0x1E0D36E48];
    v82 = *MEMORY[0x1E0D361A8];
    v84 = *MEMORY[0x1E0D36EF8];
    v85 = *MEMORY[0x1E0D36E58];
    do
    {
      v90 = 0;
      do
      {
        if (*(_QWORD *)v107 != v87)
          objc_enumerationMutation(obj);
        v93 = *(IMDAccountController **)(*((_QWORD *)&v106 + 1) + 8 * v90);
        if (IMOSLoggingEnabled(v13))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v115 = v93;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Loading service: %@", buf, 0xCu);
          }

        }
        v15 = -[IMDAccountController isDiscontinued](v93, "isDiscontinued");
        if ((_DWORD)v15)
        {
          if (IMOSLoggingEnabled(v15))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v115 = self;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "service: %@ has been discontinued. Loading default disabled account", buf, 0xCu);
            }

          }
          -[IMDAccountController createDiscontinuedAccount](v93, "createDiscontinuedAccount");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDAccountController addAccount:](self, "addAccount:", v91);
          goto LABEL_126;
        }
        v17 = -[IMDAccountController isIDSBased](v93, "isIDSBased");
        -[IMDAccountController serviceDefaults](v93, "serviceDefaults");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v18;
        if ((v17 & 1) != 0)
        {
          if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v115 = v93;
              _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, " Not loading accounts from defaults, appears to be IDS Based: %@", buf, 0xCu);
            }

          }
          -[IMDAccountController accountsLoadedFromIdentityServices](v93, "accountsLoadedFromIdentityServices");
          v20 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled(v20))
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v115 = v20;
              _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, " Found accounts: %@", buf, 0xCu);
            }

          }
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v22 = v20;
          v23 = -[IMDAccountController countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
          v24 = v23;
          if (v23)
          {
            v25 = *(_QWORD *)v99;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v99 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(IMDAccountController **)(*((_QWORD *)&v98 + 1) + 8 * v26);
                if (IMOSLoggingEnabled(v23))
                {
                  OSLogHandleForIMFoundationCategory();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v115 = v27;
                    _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, " Loading: %@", buf, 0xCu);
                  }

                }
                -[IMDAccountController setLoading:](v27, "setLoading:", 1);
                -[IMDAccountController addAccount:](self, "addAccount:", v27);
                v23 = IMOSLoggingEnabled(-[IMDAccountController setLoading:](v27, "setLoading:", 0));
                if ((_DWORD)v23)
                {
                  OSLogHandleForIMFoundationCategory();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, " Done", buf, 2u);
                  }

                }
                ++v26;
              }
              while (v24 != v26);
              v23 = -[IMDAccountController countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
              v24 = v23;
            }
            while (v23);
          }

          -[IMDAccountController activeAccountsFromIdentityServices](v93, "activeAccountsFromIdentityServices");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "count"))
            -[IMDAccountController activateAccounts:](self, "activateAccounts:", v30);
          v92 = 0;
        }
        else
        {
          objc_msgSend(v18, "objectForKey:", v83);
          v92 = (id)objc_claimAutoreleasedReturnValue();

          -[IMDAccountController accountsForService:](self, "accountsForService:", v93);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "count");

          v33 = -[IMDAccountController requiresSingleAccount](v93, "requiresSingleAccount");
          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          objc_msgSend(v92, "allKeys");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v103;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v103 != v36)
                  objc_enumerationMutation(v34);
                v38 = *(IMDAccountController **)(*((_QWORD *)&v102 + 1) + 8 * i);
                -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v39 != 0;

                if (v32 > 0)
                  v42 = v33;
                else
                  v42 = 0;
                if (((v40 | v42) & 1) == 0)
                {
                  if (IMOSLoggingEnabled(v41))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v43 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v115 = v38;
                      _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "   Creating account with ID: %@", buf, 0xCu);
                    }

                  }
                  objc_msgSend(v92, "objectForKey:", v38);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v44, "count"))
                  {
                    -[IMDAccountController defaultAccountSettings](v93, "defaultAccountSettings");
                    v45 = objc_claimAutoreleasedReturnValue();

                    v44 = (void *)v45;
                  }
                  v46 = -[IMDAccount initWithAccountID:defaults:service:]([IMDAccount alloc], "initWithAccountID:defaults:service:", v38, v44, v93);
                  -[IMDAccount setLoading:](v46, "setLoading:", 1);
                  -[IMDAccountController addAccount:](self, "addAccount:", v46);
                  -[IMDAccount setLoading:](v46, "setLoading:", 0);

                  ++v32;
                }
              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
            }
            while (v35);
          }

          if (objc_msgSend(v92, "count"))
            goto LABEL_84;
          if (v32 > 0)
            goto LABEL_84;
          -[IMDAccountController serviceProperties](v93, "serviceProperties");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKey:", v82);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "intValue") == 0;

          if (v49)
            goto LABEL_84;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
          v22 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled(v22))
          {
            OSLogHandleForIMFoundationCategory();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v115 = v22;
              _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "   Creating persistent session with ID: %@", buf, 0xCu);
            }

          }
          -[IMDAccountController defaultAccountSettings](v93, "defaultAccountSettings");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = -[IMDAccount initWithAccountID:defaults:service:]([IMDAccount alloc], "initWithAccountID:defaults:service:", v22, v30, v93);
          -[IMDAccountController addAccount:](self, "addAccount:", v51);
          v52 = -[IMDAccountController shouldCreateActiveAccounts](v93, "shouldCreateActiveAccounts");
          if ((_DWORD)v52)
          {
            if (IMOSLoggingEnabled(v52))
            {
              OSLogHandleForIMFoundationCategory();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v115 = v22;
                _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "  Service wants new accounts active, setting active: %@", buf, 0xCu);
              }

            }
            -[IMDAccountController activateAccount:](self, "activateAccount:", v22);
          }

        }
LABEL_84:
        objc_msgSend(v91, "objectForKey:", v85);
        v54 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectForKey:", v84);
        v89 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled(v89))
        {
          OSLogHandleForIMFoundationCategory();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v115 = v54;
            _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "  Setting active accounts: %@", buf, 0xCu);
          }

        }
        if (v54)
          -[IMDAccountController activateAccounts:](self, "activateAccounts:", v54);
        if ((-[IMDAccountController disallowDeactivation](v93, "disallowDeactivation") & 1) != 0
          || (v56 = -[IMDAccountController shouldForceAccountsActive](v93, "shouldForceAccountsActive"), (_DWORD)v56))
        {
          v56 = objc_msgSend(v92, "count");
          if (v56)
          {
            if (IMOSLoggingEnabled(v56))
            {
              OSLogHandleForIMFoundationCategory();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v92, "allKeys");
                v58 = (IMDAccountController *)(id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v115 = v58;
                _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "  Service wants accounts always active, setting active: %@", buf, 0xCu);

              }
            }
            objc_msgSend(v92, "allKeys");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDAccountController activateAccounts:](self, "activateAccounts:", v59);

          }
        }
        if (v89)
        {
          if (IMOSLoggingEnabled(v56))
          {
            OSLogHandleForIMFoundationCategory();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v115 = v89;
              _os_log_impl(&dword_1D1413000, v60, OS_LOG_TYPE_INFO, "Logging in previously logged in accounts: %@", buf, 0xCu);
            }

          }
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v61 = v89;
          v62 = -[IMDAccountController countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
          if (v62)
          {
            v63 = *(_QWORD *)v95;
            do
            {
              for (j = 0; j != v62; ++j)
              {
                if (*(_QWORD *)v95 != v63)
                  objc_enumerationMutation(v61);
                v65 = *(IMDAccountController **)(*((_QWORD *)&v94 + 1) + 8 * j);
                -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v65);
                v66 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
                v67 = IMOSLoggingEnabled(v66);
                if (v66)
                {
                  if (v67)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v68 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v115 = v66;
                      _os_log_impl(&dword_1D1413000, v68, OS_LOG_TYPE_INFO, "  * Logging in previously logged in account: %@", buf, 0xCu);
                    }

                  }
                  -[IMDAccountController createSessionIfNecessary](v66, "createSessionIfNecessary");
                  -[IMDAccountController session](v66, "session");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "login");

                }
                else if (v67)
                {
                  OSLogHandleForIMFoundationCategory();
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v115 = v65;
                    _os_log_impl(&dword_1D1413000, v70, OS_LOG_TYPE_INFO, "  * No account found for account ID: %@", buf, 0xCu);
                  }

                }
              }
              v62 = -[IMDAccountController countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
            }
            while (v62);
          }

        }
        if (IMOSLoggingEnabled(v56))
        {
          OSLogHandleForIMFoundationCategory();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v115 = v93;
            _os_log_impl(&dword_1D1413000, v71, OS_LOG_TYPE_INFO, "Done loading service: %@", buf, 0xCu);
          }

        }
LABEL_126:

        ++v90;
      }
      while (v90 != v88);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      v88 = v13;
    }
    while (v13);
  }

  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "serviceWithName:", *MEMORY[0x1E0D38F68]);
  v73 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    -[IMDAccountController accountsForService:](self, "accountsForService:", v73);
    v74 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v115 = v73;
      v116 = 2112;
      v117 = v74;
      _os_log_impl(&dword_1D1413000, v75, OS_LOG_TYPE_DEFAULT, "iMessage service found: %@    accounts: %@", buf, 0x16u);
    }

    if (-[NSObject count](v74, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v76 = (IMDAccount *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v76->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, &v76->super, OS_LOG_TYPE_DEFAULT, "   We have iMessage acounts, good to go", buf, 2u);
      }
      goto LABEL_145;
    }
    v76 = -[IMDAccount initWithAccountID:defaults:service:]([IMDAccount alloc], "initWithAccountID:defaults:service:", CFSTR("PlaceholderAccount"), 0, v73);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v115 = (IMDAccountController *)v76;
      _os_log_impl(&dword_1D1413000, v77, OS_LOG_TYPE_DEFAULT, "   Empty iMessage accounts, created one: %@", buf, 0xCu);
    }

    if (v76)
    {
      -[IMDAccountController addAccount:](self, "addAccount:", v76);
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v79 = "   Added, and moving along";
LABEL_143:
        _os_log_impl(&dword_1D1413000, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v79 = "   No account created";
        goto LABEL_143;
      }
    }

LABEL_145:
    goto LABEL_146;
  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1413000, v74, OS_LOG_TYPE_DEFAULT, "No iMessage service found", buf, 2u);
  }
LABEL_146:

  if (IMOSLoggingEnabled(v80))
  {
    OSLogHandleForIMFoundationCategory();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v81, OS_LOG_TYPE_INFO, "Done loading all services", buf, 2u);
    }

  }
  *(_WORD *)&self->_isLoading = 0;
  -[IMDAccountController _checkPowerAssertion](self, "_checkPowerAssertion");

}

- (void)deferredSave
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_save, 0);
  -[IMDAccountController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_save, 0, 10.0);
}

- (void)save
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_save, 0);
  if (!self->_isLoading)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    +[IMDServiceController sharedController](IMDServiceController, "sharedController", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "saveSettings");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)activateAccount:(id)a3
{
  id v4;

  if (a3)
  {
    IMSingleObjectArray();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDAccountController activateAccounts:](self, "activateAccounts:", v4);

  }
}

- (void)activateAccounts:(id)a3
{
  IMDAccountController *v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t i;
  IMDAccountController *v9;
  IMDAccountController *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  IMDAccountController *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSMutableDictionary *activeAccounts;
  void *v19;
  void *v20;
  IMDAccountController *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  IMDAccountController *v27;
  NSObject *v28;
  void *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  IMDAccountController *v51;
  __int128 v52;
  id v53;
  IMDAccountController *obj;
  id v55;
  id v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  IMDAccountController *v68;
  __int16 v69;
  IMDAccountController *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = (IMDAccountController *)a3;
  if (self->_isFirstLoad)
    v53 = 0;
  else
    v53 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v4;
    _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_DEFAULT, "Activating accounts: %@", buf, 0xCu);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v4;
  v6 = -[IMDAccountController countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v6)
  {
    v55 = *(id *)v63;
    *(_QWORD *)&v7 = 138412546;
    v52 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(id *)v63 != v55)
          objc_enumerationMutation(obj);
        v9 = *(IMDAccountController **)(*((_QWORD *)&v62 + 1) + 8 * i);
        -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v9, v52);
        v10 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled(v10))
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v10;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "   Found account: %@", buf, 0xCu);
          }

        }
        if (v10)
        {
          v12 = -[IMDAccountController isDisabled](v10, "isDisabled");
          if ((_DWORD)v12)
          {
            if (IMOSLoggingEnabled(v12))
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "      => Disabled, continuing", buf, 2u);
              }

            }
          }
          else
          {
            -[IMDAccountController service](v10, "service");
            v14 = (IMDAccountController *)objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled(v14))
            {
              OSLogHandleForIMFoundationCategory();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v68 = v14;
                _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "      Found service: %@", buf, 0xCu);
              }

            }
            v16 = -[IMDAccountController isDiscontinued](v14, "isDiscontinued");
            if ((_DWORD)v16)
            {
              if (IMOSLoggingEnabled(v16))
              {
                OSLogHandleForIMFoundationCategory();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "      => Service discontinued, skipping.", buf, 2u);
                }

              }
            }
            else
            {
              activeAccounts = self->_activeAccounts;
              -[IMDAccountController internalName](v14, "internalName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](activeAccounts, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (IMDAccountController *)objc_msgSend(v20, "mutableCopy");

              if (!v21)
                v21 = (IMDAccountController *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v22 = -[IMDAccountController containsObject:](v21, "containsObject:", v9);
              if ((v22 & 1) == 0)
              {
                if (IMOSLoggingEnabled(v22))
                {
                  OSLogHandleForIMFoundationCategory();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = v52;
                    v68 = v9;
                    v69 = 2112;
                    v70 = v21;
                    _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "      Adding account: %@ to active set: %@", buf, 0x16u);
                  }

                }
                if (-[IMDAccountController supportsOneSessionForAllAccounts](v14, "supportsOneSessionForAllAccounts")&& -[IMDAccountController count](v21, "count"))
                {
                  -[IMDAccountController lastObject](v21, "lastObject");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v25, "session");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v27 = (IMDAccountController *)v26;
                  if (v26)
                  {
                    if (IMOSLoggingEnabled(v26))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v28 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v68 = v27;
                        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Reusing session: %@", buf, 0xCu);
                      }

                    }
                    -[IMDAccountController setSession:](v10, "setSession:", v27);
                    -[IMDAccountController addAccount:](v27, "addAccount:", v10);
                    -[IMDAccountController sessionDidBecomeActive](v27, "sessionDidBecomeActive");
                    -[IMDAccountController service](v10, "service");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v29, "shouldForceAccountsConnected");

                    if (v30)
                    {
                      if (IMOSLoggingEnabled(v31))
                      {
                        OSLogHandleForIMFoundationCategory();
                        v32 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          v68 = self;
                          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "%@: Forcing login", buf, 0xCu);
                        }

                      }
                      -[IMDAccountController session](v10, "session");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "loginWithAccount:", v10);

                    }
                  }

                }
                -[IMDAccountController addObject:](v21, "addObject:", v9);
                if (IMOSLoggingEnabled(objc_msgSend(v53, "addObject:", v14)))
                {
                  OSLogHandleForIMFoundationCategory();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v68 = v21;
                    _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "      Active account set is: %@", buf, 0xCu);
                  }

                }
                v35 = self->_activeAccounts;
                if (!v35)
                {
                  Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                  v37 = self->_activeAccounts;
                  self->_activeAccounts = Mutable;

                  v35 = self->_activeAccounts;
                }
                -[IMDAccountController internalName](v14, "internalName");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:", v21, v38);

                if (IMOSLoggingEnabled(v39))
                {
                  OSLogHandleForIMFoundationCategory();
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "      Building sesssion", buf, 2u);
                  }

                }
                if (IMOSLoggingEnabled(-[IMDAccountController createSessionIfNecessary](v10, "createSessionIfNecessary")))
                {
                  OSLogHandleForIMFoundationCategory();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "      Enable the associated account", buf, 2u);
                  }

                }
                -[IMDAccountController enableAccount:](v14, "enableAccount:", v10);
              }

            }
          }
        }

      }
      v6 = -[IMDAccountController countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v6);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = v53;
  v42 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v56);
        v45 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "broadcasterForListenersSupportingService:", v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDAccountController activeAccountsForService:](self, "activeAccountsForService:", v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "arrayByApplyingSelector:", sel_accountID);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "internalName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "activeAccountsChanged:forService:", v49, v50);

      }
      v42 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v42);
  }

  if (objc_msgSend(v56, "count"))
    -[IMDAccountController _rebuildOperationalAccountsCache](self, "_rebuildOperationalAccountsCache");
  v51 = self;
  if (!self->_isLoading)
  {
    -[IMDAccountController save](self, "save");
    v51 = self;
  }
  -[IMDAccountController _checkPowerAssertion](v51, "_checkPowerAssertion");

}

- (void)deactivateAccounts:(id)a3 force:(BOOL)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *activeAccounts;
  void *v16;
  void *v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  id v36;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = v5;
    _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_DEFAULT, "Deactivating accounts: %@", buf, 0xCu);
  }

  if (self->_isFirstLoad)
    v36 = 0;
  else
    v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v45;
    *(_QWORD *)&v8 = 138412290;
    v35 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v11, v35);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v12)
        {
          if (!IMOSLoggingEnabled(v13))
            goto LABEL_34;
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            v51 = v11;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Tried to deactivate an account, but found no account: %@", buf, 0xCu);
          }
LABEL_33:

          goto LABEL_34;
        }
        if (!v13)
        {
          if (!IMOSLoggingEnabled(0))
            goto LABEL_34;
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            v51 = v11;
            _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Tried to deactivate an account, but found no service; %@",
              buf,
              0xCu);
          }
          goto LABEL_33;
        }
        if (a4 || (objc_msgSend(v13, "shouldForceAccountsActive") & 1) == 0)
        {
          activeAccounts = self->_activeAccounts;
          objc_msgSend(v14, "internalName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](activeAccounts, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (id)objc_msgSend(v17, "mutableCopy");

          if (!v18)
            v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if ((objc_msgSend(v18, "containsObject:", v11) & 1) != 0
            || objc_msgSend(v12, "isAccountKeyCDPSyncingOrWaitingForUser"))
          {
            objc_msgSend(v18, "removeObject:", v11);
            objc_msgSend(v36, "addObject:", v14);
            v19 = self->_activeAccounts;
            if (!v19)
            {
              Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              v21 = self->_activeAccounts;
              self->_activeAccounts = Mutable;

              v19 = self->_activeAccounts;
            }
            objc_msgSend(v14, "internalName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v18, v22);

            objc_msgSend(v12, "session");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23 && (unint64_t)objc_msgSend(v12, "loginStatus") >= 3)
            {
              objc_msgSend(v12, "session");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "logout");

            }
            objc_msgSend(v14, "disableAccount:", v12);
            objc_msgSend(v23, "removeAccount:", v12);
            objc_msgSend(v12, "releaseSession");

          }
        }
LABEL_34:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v7);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = v36;
  v26 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v38);
        v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "broadcasterForListenersSupportingService:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDAccountController activeAccountsForService:](self, "activeAccountsForService:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "arrayByApplyingSelector:", sel_accountID);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "internalName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "activeAccountsChanged:forService:", v33, v34);

      }
      v26 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v26);
  }

  if (objc_msgSend(v38, "count"))
    -[IMDAccountController _rebuildOperationalAccountsCache](self, "_rebuildOperationalAccountsCache");
  if (!self->_isLoading)
    -[IMDAccountController save](self, "save");
  -[IMDAccountController _checkPowerAssertion](self, "_checkPowerAssertion");

}

- (void)deactivateAccount:(id)a3
{
  id v4;

  if (a3)
  {
    IMSingleObjectArray();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDAccountController deactivateAccounts:](self, "deactivateAccounts:", v4);

  }
}

- (void)deactivateAccounts:(id)a3
{
  -[IMDAccountController deactivateAccounts:force:](self, "deactivateAccounts:force:", a3, 0);
}

- (void)deactivateAccount:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (a3)
  {
    v4 = a4;
    IMSingleObjectArray();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[IMDAccountController deactivateAccounts:force:](self, "deactivateAccounts:force:", v6, v4);

  }
}

- (void)addAccount:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *accounts;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  BOOL v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v5;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Add account: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v5, "accountID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = v44;
      objc_msgSend(v5, "accountDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "writeAccountDefaults:", v8);

    }
    else
    {
      accounts = self->_accounts;
      if (!accounts)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v11 = self->_accounts;
        self->_accounts = Mutable;

        accounts = self->_accounts;
      }
      objc_msgSend(v5, "accountID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](accounts, "setObject:forKey:", v5, v12);

      v45 = v5;
    }
    if (!self->_isFirstLoad)
    {
      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "broadcasterForListenersSupportingService:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "accountID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "accountDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "service");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "internalName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accountAdded:defaults:service:", v16, v17, v19);

      -[IMDAccountController _rebuildOperationalAccountsCache](self, "_rebuildOperationalAccountsCache");
      objc_msgSend(v45, "writeAccountDefaults:", 0);
      objc_msgSend(v45, "postAccountCapabilities");
      if (!self->_isFirstLoad && !self->_isLoading)
      {
        objc_msgSend(v5, "service");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "accountAdded:", v5);

        +[IMDServiceController sharedController](IMDServiceController, "sharedController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "serviceWithName:", *MEMORY[0x1E0D38F68]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "service");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = v22 == v43;

        if ((_DWORD)v21)
        {
          -[IMDAccountController accountsForService:](self, "accountsForService:", v43);
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v51;
            while (2)
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v51 != v25)
                  objc_enumerationMutation(v23);
                v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                objc_msgSend(v27, "loginID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (!objc_msgSend(v28, "length"))
                {

LABEL_26:
                  v31 = v27;

                  if (v31)
                    v32 = v31 == v5;
                  else
                    v32 = 1;
                  if (!v32)
                  {
                    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v57 = v31;
                      _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_DEFAULT, "*** Removing placeholder account: %@", buf, 0xCu);
                    }

                    -[IMDAccountController removeAccount:](self, "removeAccount:", v31);
                  }
                  goto LABEL_33;
                }
                objc_msgSend(v27, "accountID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isEqualToIgnoringCase:", CFSTR("PlaceholderAccount"));

                if ((v30 & 1) != 0)
                  goto LABEL_26;
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
              if (v24)
                continue;
              break;
            }
          }

          v31 = 0;
LABEL_33:

        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        -[IMDAccountController accounts](self, "accounts");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v35)
        {
          v36 = *(_QWORD *)v47;
          v37 = MEMORY[0x1E0C80D38];
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v47 != v36)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v39, "idsAccount");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "addDelegate:queue:", self, v37);

              }
            }
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v35);
        }

      }
    }
    objc_msgSend(v5, "service");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "shouldForceAccountsActive"))
    {
      objc_msgSend(v5, "accountID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDAccountController activateAccount:](self, "activateAccount:", v42);

    }
  }

}

- (void)removeAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  NSMutableDictionary *accounts;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Remove account: %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    -[NSMutableDictionary allKeysForObject:](self->_accounts, "allKeysForObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v4, "service");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[IMDAccountController _isAccountActive:forService:](self, "_isAccountActive:forService:", v11, v12);

            if (v13)
              -[IMDAccountController deactivateAccount:force:](self, "deactivateAccount:force:", v11, 1);
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v8);
      }
      -[NSMutableDictionary removeObjectsForKeys:](self->_accounts, "removeObjectsForKeys:", v7);
      if (!-[NSMutableDictionary count](self->_accounts, "count"))
      {
        accounts = self->_accounts;
        self->_accounts = 0;

      }
      if (!self->_isLoading)
      {
        objc_msgSend(v4, "writeAccountDefaults:", 0);
        +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "service");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "broadcasterForListenersSupportingService:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accountRemoved:", v18);

        -[IMDAccountController _rebuildOperationalAccountsCache](self, "_rebuildOperationalAccountsCache");
        objc_msgSend(v4, "service");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accountRemoved:", v4);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "idsAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeDelegate:", self);

      }
    }
    -[IMDAccountController save](self, "save");

  }
  -[IMDAccountController _checkPowerAssertion](self, "_checkPowerAssertion");

}

- (id)accountsForLoginID:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[IMDAccountController accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D1428548;
  v13[3] = &unk_1E9227D50;
  v14 = v7;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accountForHandle:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = (_QWORD *)MEMORY[0x1E0D38F68];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "internalName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *v9);

        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "idsAccount");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "aliasStrings");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v25;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v25 != v20)
                    objc_enumerationMutation(v17);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "isEqualToString:", v4) & 1) != 0)
                  {
                    v22 = v11;

                    goto LABEL_22;
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
                if (v19)
                  continue;
                break;
              }
            }

            v9 = (_QWORD *)MEMORY[0x1E0D38F68];
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v22 = 0;
    }
    while (v7);
  }
  else
  {
    v22 = 0;
  }
LABEL_22:

  return v22;
}

- (id)activeAccountsWithServiceCapability:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D14288B0;
  v9[3] = &unk_1E9227DE0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)connectedAccounts
{
  void *v2;
  void *v3;

  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &unk_1E9227E00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)connectedAccountsForService:(id)a3
{
  void *v3;
  void *v4;

  -[IMDAccountController activeAccountsForService:](self, "activeAccountsForService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &unk_1E9227E20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)connectingAccounts
{
  void *v2;
  void *v3;

  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByFilteringWithBlock:", &unk_1E9227E40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)connectingAccountsForService:(id)a3
{
  void *v3;
  void *v4;

  -[IMDAccountController activeAccountsForService:](self, "activeAccountsForService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &unk_1E9227E60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accountAssociatedWithHandle:(id)a3
{
  void *v3;
  BOOL v4;

  -[IMDAccountController accountForHandle:](self, "accountForHandle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)accountForIDSAccountUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMDAccountController accounts](self, "accounts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "idsAccount");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uniqueID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "caseInsensitiveCompare:", v4);

          if (!v12)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSArray)activeSessions
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByApplyingBlock:filter:", &unk_1E9227EA0, &unk_1E9227EC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "activeSessions = %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return (NSArray *)v3;
}

- (id)sessionForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableDictionary *accounts;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  NSMutableDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDAccountController accountForAccountID:](self, "accountForAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDServiceSession existingServiceSessionForService:](IMDServiceSession, "existingServiceSessionForService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8
      || (objc_msgSend(v5, "createSessionIfNecessary"),
          objc_msgSend(v5, "session"),
          v9 = objc_claimAutoreleasedReturnValue(),
          (v6 = (void *)v9) == 0))
    {
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          accounts = self->_accounts;
          v13 = 138412802;
          v14 = v4;
          v15 = 2112;
          v16 = v5;
          v17 = 2112;
          v18 = accounts;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Could not find a service session for string: %@, account: %@, allAccounts: %@", (uint8_t *)&v13, 0x20u);
        }

      }
      v6 = 0;
    }
  }

  return v6;
}

- (id)anySessionForServiceName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceWithName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeAccountsForService:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__imFirstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = 138412290;
          v23 = v9;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "IMDAccountController: Could not find a session for account: %@", (uint8_t *)&v22, 0xCu);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accountsForService:", v5);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "accounts");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412802;
          v23 = v3;
          v24 = 2112;
          v25 = v17;
          v26 = 2112;
          v27 = v19;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "IMDAccountController: Could not find an account for serviceString: %@, accountsForService: %@, accounts: %@", (uint8_t *)&v22, 0x20u);

        }
      }
      v12 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v3;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "IMDAccountController: Could not find a service for string: %@", (uint8_t *)&v22, 0xCu);
      }

    }
    v12 = 0;
  }

  return v12;
}

- (id)sessionForReplicationSourceServiceName:(id)a3 replicatingAccount:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v33 = a4;
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceWithName:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[IMDAccountController activeAccountsForService:](self, "activeAccountsForService:", v32);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v29)
    {
      v8 = *(_QWORD *)v39;
      v27 = *(_QWORD *)v39;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v39 != v8)
          {
            v10 = v9;
            objc_enumerationMutation(obj);
            v9 = v10;
          }
          v28 = v9;
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v11, "replicationSessions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v35;
            while (2)
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v35 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                objc_msgSend(v16, "replicationService");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "internalName");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "service");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "internalName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v18, "isEqualToString:", v20);

                if (v21)
                {
                  if (IMOSLoggingEnabled(v22))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v25 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v43 = v16;
                      v44 = 2112;
                      v45 = v33;
                      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Found source session %@ for replicating account %@", buf, 0x16u);
                    }

                  }
                  v24 = v16;

                  goto LABEL_28;
                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v13)
                continue;
              break;
            }
          }

          v9 = v28 + 1;
          v8 = v27;
        }
        while (v28 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        v8 = v27;
      }
      while (v29);
    }

  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v31;
      v44 = 2112;
      v45 = v33;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "IMDAccountController: No source session on service %@ for replicating account %@", buf, 0x16u);
    }

  }
  v24 = 0;
LABEL_28:

  return v24;
}

- (void)_rebuildOperationalAccountsCache
{
  NSSet *v3;
  NSSet *operationalAccountsCache;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v12;
  NSSet *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = self->_operationalAccountsCache;
  operationalAccountsCache = self->_operationalAccountsCache;
  self->_operationalAccountsCache = 0;

  -[IMDAccountController _operationalAccounts](self, "_operationalAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Rebuilding operational accounts, old: (%@)  new: (%@)", (uint8_t *)&v12, 0x16u);
    }

  }
  v7 = objc_msgSend(v5, "count");
  v8 = -[NSSet count](v3, "count");
  if (v7 != v8 || (v8 = objc_msgSend(v5, "isEqualToSet:", v3), (v8 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Removing replication sessions due to account rebuild", (uint8_t *)&v12, 2u);
      }

    }
    if (IMOSLoggingEnabled(-[IMDAccountController _resetAccountReplicationSessions](self, "_resetAccountReplicationSessions")))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Operational accounts changed", (uint8_t *)&v12, 2u);
      }

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kIMDBadgeUtilitiesOperationalAccountsChangedNotification"), 0, 0, 1u);
  }

}

- (void)_resetAccountReplicationSessions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[IMDAccountController activeAccounts](self, "activeAccounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resetReplicationSessions");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_operationalAccounts
{
  NSSet *operationalAccountsCache;
  NSSet **p_operationalAccountsCache;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_operationalAccountsCache = &self->_operationalAccountsCache;
  operationalAccountsCache = self->_operationalAccountsCache;
  if (operationalAccountsCache)
    return operationalAccountsCache;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMDAccountController activeAccounts](self, "activeAccounts", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[IMDAccountController _isOperationalForAccount:](self, "_isOperationalForAccount:", v12))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_storeStrong((id *)p_operationalAccountsCache, v6);
  return v6;
}

- (BOOL)_isOperationalForAccount:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = a3;
  if (objc_msgSend(v3, "isActive"))
  {
    objc_msgSend(v3, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsRegistration");

    v8 = !v5
      || objc_msgSend(v3, "accountType") != 2
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || (objc_msgSend(v3, "idsAccount"),
           v6 = (void *)objc_claimAutoreleasedReturnValue(),
           v7 = objc_msgSend(v6, "profileValidationStatus"),
           v6,
           v7 != 3))
      || objc_msgSend(v3, "registrationStatus") == 5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_nicknameController
{
  return +[IMDNicknameController sharedInstance](IMDNicknameController, "sharedInstance");
}

- (void)account:(id)a3 isActiveChanged:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "serviceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.madrid"));

  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v6, "canSend");
      v12 = CFSTR("NO");
      if (v4)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      *(_DWORD *)v18 = 138413058;
      *(_QWORD *)&v18[4] = v6;
      if (v11)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      *(_QWORD *)&v18[14] = v13;
      *(_WORD *)&v18[12] = 2112;
      *(_WORD *)&v18[22] = 2112;
      if (v8)
        v12 = CFSTR("YES");
      v19 = v14;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "IDS account %@ is active %@ can send %@ is madrid account %@", v18, 0x2Au);
    }

  }
  if (v8)
  {
    -[IMDAccountController _nicknameController](self, "_nicknameController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v4)
      objc_msgSend(v15, "newDeviceDidSignIntoiMessage");
    else
      objc_msgSend(v15, "deviceSignedOutOfiMessage");

  }
  +[IMDBadgeUtilities sharedInstance](IMDBadgeUtilities, "sharedInstance", *(_OWORD *)v18, *(_QWORD *)&v18[16]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateBadgeInCaseOfMistakenLoginInvalidation");

}

- (void)setNetworkDataAvailable:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = IMOSLoggingEnabled(self);
  if ((_DWORD)v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "calling setNetwork %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (self->_networkDataAvailable != v3)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "  => broadcasting", (uint8_t *)&v11, 2u);
      }

    }
    self->_networkDataAvailable = v3;
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "broadcasterForAllListeners");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "networkDataAvailabilityChanged:", v3);

  }
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalAccountsCache, 0);
  objc_storeStrong((id *)&self->_activeAccounts, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
}

- (id)activeAliases
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDAccountController activeAccountsWithServiceCapability:](self, "activeAccountsWithServiceCapability:", *MEMORY[0x1E0D38E28]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "idsAccount");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "aliasStrings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
                if (objc_msgSend(v16, "length")
                  && ((IMStringIsEmail() & 1) != 0 || MEMORY[0x1D17EA35C](v16)))
                {
                  objc_msgSend(v3, "addObject:", v16);
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v13);
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }
  objc_msgSend(v3, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)activeAccountsAreEligibleForHawking
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "service");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "internalName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D38F40]);

          if ((v10 & 1) == 0)
          {
            objc_msgSend(v7, "idsAccount");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "regionID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(MEMORY[0x1E0D39AF8], "accountRegionIsCandidateForHawking:", v12) & 1) != 0)
            {
LABEL_22:

              v20 = 1;
              goto LABEL_24;
            }
            objc_msgSend(v7, "idsAccount");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "aliasStrings");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v15 = v14;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v23;
              while (2)
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v23 != v18)
                    objc_enumerationMutation(v15);
                  if ((objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForHawking:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j)) & 1) != 0)
                  {

                    goto LABEL_22;
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v17)
                  continue;
                break;
              }
            }

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v20 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_24:

  return v20;
}

- (BOOL)receiverIsCandidateForHawking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t isKindOfClass;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    IMChatCanonicalIDSIDsForAddress();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1D17EA374]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39AF8], "mapID:usingKey:", v6, *MEMORY[0x1E0D39C40]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (MEMORY[0x1D17EA35C](v7))
    {
      IMCountryCodeForNumber();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("cn"));
      v10 = IMOSLoggingEnabled(v9);
      if ((_DWORD)v9)
      {
        if (v10)
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v19 = 138412546;
            v20 = v7;
            v21 = 2112;
            v22 = v8;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for spam filtering.", (uint8_t *)&v19, 0x16u);
          }
          goto LABEL_30;
        }
      }
      else if (v10)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v19 = 138412546;
          v20 = v7;
          v21 = 2112;
          v22 = v8;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is not a candidate for spam filtering.", (uint8_t *)&v19, 0x16u);
        }
        goto LABEL_30;
      }
LABEL_31:

      goto LABEL_32;
    }
    if (!IMStringIsEmail())
    {
      LOBYTE(v9) = 0;
LABEL_32:

      goto LABEL_33;
    }
    -[IMDAccountController accountForHandle:](self, "accountForHandle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      if (IMOSLoggingEnabled(isKindOfClass))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v19 = 138412546;
          v20 = v8;
          v21 = 2112;
          v22 = (id)objc_opt_class();
          v17 = v22;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Found an account (%@) that isn't IMDIDS (%@), can't determien region -- falling through.", (uint8_t *)&v19, 0x16u);

        }
      }
      LOBYTE(v9) = 0;
      goto LABEL_31;
    }
    objc_msgSend(v8, "idsAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "regionID");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(MEMORY[0x1E0D39AF8], "accountRegionIsCandidateForHawking:", v11);
    v14 = IMOSLoggingEnabled(v9);
    if ((_DWORD)v9)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v19 = 138412546;
          v20 = v7;
          v21 = 2112;
          v22 = v11;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Receiving id (%@) with region (%@) is a candidate for spam filtering.", (uint8_t *)&v19, 0x16u);
        }
LABEL_29:

      }
    }
    else if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v19 = 138412546;
        v20 = v7;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Receiving id (%@) with region (%@) is not a candidate for spam filtering.", (uint8_t *)&v19, 0x16u);
      }
      goto LABEL_29;
    }
LABEL_30:

    goto LABEL_31;
  }
  LOBYTE(v9) = 0;
LABEL_33:

  return v9;
}

- (BOOL)hasActivePhoneAccount
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[IMDAccountController activeAccounts](self, "activeAccounts");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v6 = (_QWORD *)MEMORY[0x1E0D38F40];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "service");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "internalName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *v6);

        if ((v11 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "idsAccount");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "aliasStrings");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = 0u;
            v24 = 0u;
            v21 = 0u;
            v22 = 0u;
            v14 = v13;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v22;
              while (2)
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v22 != v17)
                    objc_enumerationMutation(v14);
                  if ((MEMORY[0x1D17EA35C](*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j)) & 1) != 0)
                  {

                    v19 = 1;
                    goto LABEL_22;
                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
                if (v16)
                  continue;
                break;
              }
            }

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v19 = 0;
    }
    while (v4);
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

- (BOOL)receiverIsCandidateForJunk:(id)a3 forAccount:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    MEMORY[0x1D17EA374](v5);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39AF8], "mapID:usingKey:", v7, *MEMORY[0x1E0D39628]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1D17EA35C]())
    {
      IMCountryCodeForNumber();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v8;
          v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Receiving ID: %@ has country code: %@", buf, 0x16u);
        }

      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(MEMORY[0x1E0D39AF8], "telephonyCountryCodesEligibleForJunkFiltering");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v35 != v13)
              objc_enumerationMutation(v11);
            v15 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "isEqualToString:", v9);
            if ((_DWORD)v15)
            {
              if (IMOSLoggingEnabled(v15))
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v41 = v8;
                  v42 = 2112;
                  v43 = v9;
                  _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for Oscar filtering.", buf, 0x16u);
                }

              }
              LOBYTE(v12) = 1;
              goto LABEL_39;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_39:

    }
    else
    {
      if (IMStringIsEmail())
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v6, "idsAccount");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "regionID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (IMOSLoggingEnabled(v19))
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v41 = v8;
              v42 = 2112;
              v43 = v18;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Receiving ID: %@ has region: %@", buf, 0x16u);
            }

          }
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(MEMORY[0x1E0D39AF8], "accountRegionsEligibleForJunkFiltering", 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v12)
          {
            v22 = *(_QWORD *)v31;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v31 != v22)
                  objc_enumerationMutation(v21);
                v24 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "isEqualToString:", v18);
                if ((_DWORD)v24)
                {
                  if (IMOSLoggingEnabled(v24))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v41 = v18;
                      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Region (%@) is a candidate for Oscar filtering.", buf, 0xCu);
                    }

                  }
                  LOBYTE(v12) = 1;
                  goto LABEL_50;
                }
              }
              v12 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              if (v12)
                continue;
              break;
            }
          }
LABEL_50:

          goto LABEL_51;
        }
        if (IMOSLoggingEnabled(isKindOfClass))
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v6;
            v42 = 2112;
            v43 = (id)objc_opt_class();
            v27 = v43;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Found an account (%@) that isn't IMDIDS (%@), can't determine region -- falling through.", buf, 0x16u);

          }
        }
      }
      LOBYTE(v12) = 0;
    }
LABEL_51:

    goto LABEL_52;
  }
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_1D1665BA0((uint64_t)v5, v7);
  LOBYTE(v12) = 0;
LABEL_52:

  return v12;
}

@end
