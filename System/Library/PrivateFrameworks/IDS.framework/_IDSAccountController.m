@implementation _IDSAccountController

- (void)daemonDisconnected
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF7DC();

  }
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_1907EF778();

  *(_WORD *)&self->_accountsLoaded = 256;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionIDToHandlersMap, 0);
  objc_storeStrong((id *)&self->_pendingAccountsToRemove, 0);
  objc_storeStrong((id *)&self->_enabledAccounts, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_delegateToInfo, 0);
  objc_storeStrong(&self->_delegateContext, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:", self->_serviceToken);

  v4.receiver = self;
  v4.super_class = (Class)_IDSAccountController;
  -[_IDSAccountController dealloc](&v4, sel_dealloc);
}

- (void)accountsChanged:(id)a3 forTopic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSMutableSet *cachedAccounts;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  NSString *service;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id obj;
  uint64_t v56;
  _QWORD v57[5];
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[5];
  NSObject *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  NSString *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907F0698();

  }
  if (objc_msgSend(v7, "isEqualToIgnoringCase:", self->_service))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    v49 = v6;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      service = self->_service;
      -[NSMutableSet __imSetByApplyingBlock:](self->_cachedAccounts, "__imSetByApplyingBlock:", &unk_1E2C60090);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v76 = v49;
      v77 = 2112;
      v78 = v7;
      v79 = 2112;
      v80 = service;
      v6 = v49;
      v81 = 2112;
      v82 = v47;
      _os_log_debug_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEBUG, "Received accounts changed %@ for topic %@  service: %@  (Cached: %@)", buf, 0x2Au);

    }
    v53 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v13 = (void *)objc_msgSend(v6, "_copyForEnumerating");
    cachedAccounts = self->_cachedAccounts;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = sub_19075A7D0;
    v71[3] = &unk_1E2C62E90;
    v48 = v12;
    v72 = v48;
    -[NSMutableSet enumerateObjectsUsingBlock:](cachedAccounts, "enumerateObjectsUsingBlock:", v71);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v68;
      v18 = *MEMORY[0x1E0D34CA0];
      v56 = *MEMORY[0x1E0D35228];
      v50 = *MEMORY[0x1E0D35138];
      v51 = *(_QWORD *)v68;
      v52 = *MEMORY[0x1E0D34CA0];
      do
      {
        v19 = 0;
        v54 = v16;
        do
        {
          if (*(_QWORD *)v68 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
          v21 = v7;
          if (-[NSString isEqualToString:](self->_service, "isEqualToString:", v18)
            || objc_msgSend(v21, "isEqualToString:", self->_service))
          {
            objc_msgSend(v20, "objectForKey:", v56);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              objc_msgSend(v53, "addObject:", v22);
              -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v22);
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v23)
              {
                v25 = v7;
                -[NSObject _internal](v23, "_internal");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "accountInfo");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = IMAreObjectsLogicallySame();

                if ((v28 & 1) == 0)
                {
                  -[NSObject _internal](v24, "_internal");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "setAccountInfo:", v20);

                  v65[0] = MEMORY[0x1E0C809B0];
                  v65[1] = 3221225472;
                  v65[2] = sub_19075A824;
                  v65[3] = &unk_1E2C62E48;
                  v65[4] = self;
                  v24 = v24;
                  v66 = v24;
                  -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v65);

                }
                v7 = v25;
                v17 = v51;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v76 = v22;
                  _os_log_debug_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEBUG, "Did not find an existing account to update with unique ID %@", buf, 0xCu);
                }

                objc_msgSend(v20, "objectForKey:", v50);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "intValue");

                if ((IDSIsValidAccountType() & 1) != 0)
                {
                  v33 = -[IDSAccount _initWithDictionary:uniqueID:serviceName:]([IDSAccount alloc], "_initWithDictionary:uniqueID:serviceName:", v20, v22, v21);
                  if (v33)
                  {
                    objc_msgSend(v33, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v22));
                    -[NSMutableSet addObject:](self->_cachedAccounts, "addObject:", v33);
                    v63[0] = MEMORY[0x1E0C809B0];
                    v63[1] = 3221225472;
                    v63[2] = sub_19075A88C;
                    v63[3] = &unk_1E2C62E48;
                    v63[4] = self;
                    v64 = v33;
                    -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v63);

                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v76 = v20;
                      _os_log_error_impl(&dword_1906E0000, v35, OS_LOG_TYPE_ERROR, "Could not create IDSAccount with info %@", buf, 0xCu);
                    }

                  }
                }
                else
                {
                  +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v76) = v32;
                    _os_log_error_impl(&dword_1906E0000, v34, OS_LOG_TYPE_ERROR, "Account changed was of unknown account type %d, ignoring...", buf, 8u);
                  }

                }
              }
              v18 = v52;
              v16 = v54;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v76 = v20;
                _os_log_debug_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEBUG, "No uniqueID for account %@, ignoring...", buf, 0xCu);
              }
            }

          }
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v48, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        sub_1907F0638();

    }
    if (objc_msgSend(v53, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        sub_1907F05D8();

    }
    objc_msgSend(v48, "minusSet:", v53);
    if (objc_msgSend(v48, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        sub_1907F0578();

    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v39 = v48;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
    if (v40)
    {
      v41 = v40;
      v42 = 0;
      v43 = *(_QWORD *)v60;
      do
      {
        v44 = 0;
        v45 = v42;
        do
        {
          if (*(_QWORD *)v60 != v43)
            objc_enumerationMutation(v39);
          -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v44));
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            -[NSMutableSet removeObject:](self->_cachedAccounts, "removeObject:", v42);
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = sub_19075A8F4;
            v57[3] = &unk_1E2C62E48;
            v57[4] = self;
            v58 = v42;
            -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v57);

          }
          ++v44;
          v45 = v42;
        }
        while (v41 != v44);
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
      }
      while (v41);

    }
    -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility");

    v6 = v49;
  }

}

- (NSSet)accounts
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 isLocalAccountVisible;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF2C0();

  }
  -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
  -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility");
  v6 = (void *)-[NSMutableSet mutableCopy](self->_cachedAccounts, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_cachedAccounts;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "_internal", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "accountType") == 2)
        {
          isLocalAccountVisible = self->_isLocalAccountVisible;

          if (!isLocalAccountVisible)
            objc_msgSend(v6, "removeObject:", v12);
        }
        else
        {

        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return (NSSet *)v6;
}

- (void)_updateLocalAccountVisibility
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  _IDSAccountController *v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EFEC8();

  }
  v6 = (void *)-[NSMutableSet copy](self->_cachedAccounts, "copy");
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = v8;
    v32 = self;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v42;
    do
    {
      v13 = 0;
      v33 = v9;
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
        objc_msgSend(v14, "_internal", v32);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "accountType");

        if (v16 == 2)
        {
          v17 = v14;

          v11 = v17;
        }
        else
        {
          objc_msgSend(v14, "_internal");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "_isEnabled"))
          {
            objc_msgSend(v14, "_internal");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "registrationStatus") == 5)
            {
              objc_msgSend(v14, "_internal");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "aliases");
              v21 = v12;
              v22 = v10;
              v23 = v11;
              v24 = v7;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "count") != 0;

              v7 = v24;
              v11 = v23;
              v10 = v22;
              v12 = v21;
              v9 = v33;

            }
            else
            {
              v26 = 0;
            }

          }
          else
          {
            v26 = 0;
          }

          v10 |= v26;
        }
        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v9);

    if (v11)
    {
      if ((v10 & 1) != 0)
      {
        if (v32->_isLocalAccountVisible)
        {
          v32->_isLocalAccountVisible = 0;
          objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "We have a real account registered, hiding local account", buf, 2u);
          }

          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = sub_1907595D8;
          v38[3] = &unk_1E2C62E48;
          v38[4] = v32;
          v11 = v11;
          v39 = v11;
          -[_IDSAccountController _callDelegatesWithBlock:](v32, "_callDelegatesWithBlock:", v38);
          v28 = v39;
LABEL_32:

        }
      }
      else if (!v32->_isLocalAccountVisible)
      {
        v32->_isLocalAccountVisible = 1;
        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "We don't have a real account registered, adding and enabling local account", buf, 2u);
        }

        v30 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = sub_190759640;
        v36[3] = &unk_1E2C62E48;
        v36[4] = v32;
        v31 = v11;
        v37 = v31;
        -[_IDSAccountController _callDelegatesWithBlock:](v32, "_callDelegatesWithBlock:", v36);
        v34[0] = v30;
        v34[1] = 3221225472;
        v34[2] = sub_1907596A8;
        v34[3] = &unk_1E2C62E48;
        v34[4] = v32;
        v11 = v31;
        v35 = v11;
        -[_IDSAccountController _callDelegatesWithBlock:](v32, "_callDelegatesWithBlock:", v34);

        v28 = v37;
        goto LABEL_32;
      }
    }
  }
  else
  {

    v11 = 0;
  }

}

- (void)_loadCachedAccounts
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet **p_enabledAccounts;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableSet *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EFA68();

  }
  if (!self->_accountsLoaded)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blockUntilConnected");

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_cachedAccounts);
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listener");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountDictionariesForService:", self->_service);
    v9 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v9;
    -[_IDSAccountController _loadCachedAccountsWithDictionaries:](self, "_loadCachedAccountsWithDictionaries:", v9);
    p_enabledAccounts = &self->_enabledAccounts;
    v11 = (void *)-[NSMutableSet copy](self->_enabledAccounts, "copy");
    -[NSMutableSet removeAllObjects](self->_enabledAccounts, "removeAllObjects");
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "listener");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enabledAccountsForService:", self->_service);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
      -[NSMutableSet addObjectsFromArray:](*p_enabledAccounts, "addObjectsFromArray:", v14);
    if ((objc_msgSend(v11, "isEqualToSet:", *p_enabledAccounts) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_1907EFA08();

    }
    v26 = v14;
    v27 = v11;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = self->_cachedAccounts;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v22 = *p_enabledAccounts;
          objc_msgSend(v21, "_internal", v26, v27);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "uniqueID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_setIsEnabled:", -[NSMutableSet containsObject:](v22, "containsObject:", v24));

        }
        v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_cachedAccounts);
    -[_IDSAccountController _updateDelegatesWithOldAccounts:newAccounts:](self, "_updateDelegatesWithOldAccounts:newAccounts:", v29, v25);

  }
}

- (_IDSAccountController)initWithService:(id)a3 delegateContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _IDSAccountController *v11;
  uint64_t v12;
  id delegateContext;
  uint64_t v14;
  NSString *service;
  uint64_t v16;
  NSString *serviceToken;
  NSMutableSet *v18;
  NSMutableSet *cachedAccounts;
  NSMutableSet *v20;
  NSMutableSet *enabledAccounts;
  NSMutableDictionary *v22;
  NSMutableDictionary *pendingAccountsToRemove;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EF234();

  }
  v28.receiver = self;
  v28.super_class = (Class)_IDSAccountController;
  v11 = -[_IDSAccountController init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    delegateContext = v11->_delegateContext;
    v11->_delegateContext = (id)v12;

    v14 = objc_msgSend(v6, "copy");
    service = v11->_service;
    v11->_service = (NSString *)v14;

    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "copyStringGUIDForObject:", v11);
    serviceToken = v11->_serviceToken;
    v11->_serviceToken = (NSString *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cachedAccounts = v11->_cachedAccounts;
    v11->_cachedAccounts = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    enabledAccounts = v11->_enabledAccounts;
    v11->_enabledAccounts = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingAccountsToRemove = v11->_pendingAccountsToRemove;
    v11->_pendingAccountsToRemove = v22;

    v11->_isLocalAccountVisible = 1;
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "listener");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addHandler:", v11);

    -[_IDSAccountController _connect](v11, "_connect");
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_1907EF1D0();

  }
  return v11;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSMapTable *v12;
  NSMapTable *delegateToInfo;
  id v14;

  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907EF4F0();

  }
  if (v6)
  {
    if (v7)
    {
      -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        if (!self->_delegateToInfo)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          delegateToInfo = self->_delegateToInfo;
          self->_delegateToInfo = v12;

        }
        v14 = objc_alloc_init(MEMORY[0x1E0D34D00]);
        objc_msgSend(v14, "setQueue:", v7);
        -[NSMapTable setObject:forKey:](self->_delegateToInfo, "setObject:forKey:", v14, v6);

      }
    }
  }

}

- (void)_updateDelegatesWithOldAccounts:(id)a3 newAccounts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[6];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "Updating delegates of account changes", buf, 2u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v6);
  objc_msgSend(v9, "minusSet:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);
  objc_msgSend(v10, "minusSet:", v6);
  v31 = v7;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);
  v32 = v6;
  objc_msgSend(v11, "intersectSet:", v6);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  v14 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v45;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17);
        v43[0] = v14;
        v43[1] = 3221225472;
        v43[2] = sub_190758478;
        v43[3] = &unk_1E2C62E48;
        v43[4] = self;
        v43[5] = v18;
        -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v43);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v15);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v19 = v10;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v23);
        v38[0] = v14;
        v38[1] = 3221225472;
        v38[2] = sub_1907584E0;
        v38[3] = &unk_1E2C62E48;
        v38[4] = self;
        v38[5] = v24;
        -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v38);
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v21);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v25 = v11;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v35;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v29);
        v33[0] = v14;
        v33[1] = 3221225472;
        v33[2] = sub_190758548;
        v33[3] = &unk_1E2C62E48;
        v33[4] = self;
        v33[5] = v30;
        -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v33);
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v27);
  }

}

- (void)_loadCachedAccountsWithDictionaries:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSString *service;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSMutableSet **p_cachedAccounts;
  NSMutableSet *cachedAccounts;
  NSObject *v26;
  uint64_t v27;
  NSMutableSet *v28;
  NSObject *v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  NSString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EF97C();

  }
  self->_accountsLoaded = 1;
  +[IDSLogging Accounts](IDSLogging, "Accounts");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412546;
    v39 = service;
    v40 = 2112;
    v41 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_INFO, "Re-loading cached accounts for service: %@ with dictionaries %@", buf, 0x16u);
  }

  v31 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_msgSend(v4, "_copyForEnumerating");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v30 = v4;
    v12 = 0;
    v13 = *(_QWORD *)v34;
    v14 = *MEMORY[0x1E0D35228];
    v15 = *MEMORY[0x1E0D35138];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v17 = v12;
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKey:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "objectForKey:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "intValue");

        if ((IDSIsValidAccountType() & 1) != 0)
        {
          -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v12);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = v21;
            -[NSObject _internal](v21, "_internal");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setAccountInfo:", v18);

          }
          else
          {
            v22 = -[IDSAccount _initWithDictionary:uniqueID:serviceName:]([IDSAccount alloc], "_initWithDictionary:uniqueID:serviceName:", v18, v12, self->_service);
          }
          -[NSObject _setIsEnabled:](v22, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v12));
          objc_msgSend(v31, "addObject:", v22);
        }
        else
        {
          +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v39) = v20;
            _os_log_error_impl(&dword_1906E0000, v22, OS_LOG_TYPE_ERROR, "Account loaded was of unknown account type %d, ignoring...", buf, 8u);
          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v11);

    v4 = v30;
  }

  cachedAccounts = self->_cachedAccounts;
  p_cachedAccounts = &self->_cachedAccounts;
  if ((-[NSMutableSet isEqualToSet:](cachedAccounts, "isEqualToSet:", v31) & 1) == 0)
  {
    if (-[NSMutableSet count](*p_cachedAccounts, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        sub_1907EF8F0((id *)p_cachedAccounts, v26);

    }
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v31);
    v28 = *p_cachedAccounts;
    *p_cachedAccounts = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      sub_1907EF868(v31, v29);

  }
}

- (void)_connect
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSString *serviceToken;
  void *v11;
  NSObject *v12;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF6EC();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasListenerForID:", self->_serviceToken);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1907EF688();

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    serviceToken = self->_serviceToken;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_service);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(serviceToken) = objc_msgSend(v9, "addListenerID:services:", serviceToken, v11);

    if ((serviceToken & 1) == 0)
    {
      +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907EF608();

    }
  }
}

- (void)accountEnabled:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  _IDSAccountController *v20;
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907F08C8();

  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907F07B0();
    goto LABEL_23;
  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907F07DC();
    goto LABEL_23;
  }
  if (self->_service
    && ((objc_msgSend(v7, "isEqualToString:") & 1) != 0
     || -[NSString isEqualToString:](self->_service, "isEqualToString:", *MEMORY[0x1E0D34CA0])))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F0868();

    -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      -[NSObject _setIsEnabled:](v12, "_setIsEnabled:", 1);
      -[NSMutableSet addObject:](self->_enabledAccounts, "addObject:", v6);
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_1907F0808();

      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = sub_19075ADB0;
      v19 = &unk_1E2C62E48;
      v20 = self;
      v13 = v13;
      v21 = v13;
      -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v16);
      -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility", v16, v17, v18, v19, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Did not find an existing account to enable with unique ID %@", buf, 0xCu);
      }

    }
LABEL_23:

  }
}

- (NSSet)internalAccounts
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF34C();

  }
  -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
  -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility");
  return (NSSet *)(id)-[NSMutableSet copy](self->_cachedAccounts, "copy");
}

- (NSSet)enabledAccounts
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 isLocalAccountVisible;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF3D8();

  }
  -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
  -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility");
  v6 = (void *)-[NSMutableSet mutableCopy](self->_enabledAccounts, "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_enabledAccounts;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v12, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "accountType") == 2)
        {
          isLocalAccountVisible = self->_isLocalAccountVisible;

          if (!isLocalAccountVisible)
            objc_msgSend(v6, "removeObject:", v12);
        }
        else
        {

        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return (NSSet *)v6;
}

- (NSString)serviceName
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF464();

  }
  return (NSString *)(id)-[NSString copy](self->_service, "copy");
}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSUInteger v5;
  NSMapTable *delegateToInfo;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSMapTable removeObjectForKey:](self->_delegateToInfo, "removeObjectForKey:", v4);
    v5 = -[NSMapTable count](self->_delegateToInfo, "count");
    v4 = v7;
    if (!v5)
    {
      delegateToInfo = self->_delegateToInfo;
      self->_delegateToInfo = 0;

      v4 = v7;
    }
  }

}

- (void)_callDelegatesWithBlock:(id)a3
{
  -[_IDSAccountController _callDelegatesWithBlock:group:](self, "_callDelegatesWithBlock:group:", a3, 0);
}

- (void)_callDelegatesWithBlock:(id)a3 group:(id)a4
{
  -[_IDSAccountController _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", 0, 0, a3, 0, a4);
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6
{
  -[_IDSAccountController _callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:](self, "_callDelegatesRespondingToSelector:withPreCallbacksBlock:callbackBlock:postCallbacksBlock:group:", a3, a4, a5, a6, 0);
}

- (void)_callDelegatesRespondingToSelector:(SEL)a3 withPreCallbacksBlock:(id)a4 callbackBlock:(id)a5 postCallbacksBlock:(id)a6 group:(id)a7
{
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  NSMapTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  dispatch_block_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *context;
  void (**v48)(id, uint64_t);
  void (**v49)(id, uint64_t);
  void (**v50)(_QWORD, _QWORD);
  NSObject *group;
  _QWORD v52[4];
  id v53;
  id v54;
  void (**v55)(id, uint64_t);
  void (**v56)(_QWORD, _QWORD);
  void (**v57)(id, uint64_t);
  SEL v58;
  char v59;
  BOOL v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v49 = (void (**)(id, uint64_t))a4;
  v12 = a5;
  v48 = (void (**)(id, uint64_t))a6;
  v13 = a7;
  v14 = v13;
  v50 = (void (**)(_QWORD, _QWORD))v12;
  if (v12)
  {
    group = v13;
    +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "assertQueueIsCurrent");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1907EF57C();

    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    context = (void *)MEMORY[0x19400FC60]();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v20 = self->_delegateToInfo;
    v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v62 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_delegateToInfo, "objectForKey:", v25, context);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (!v28 && (!a3 || (objc_opt_respondsToSelector() & 1) != 0))
          {
            objc_msgSend(v18, "addObject:", v25);
            objc_msgSend(v19, "addObject:", v27);
          }

        }
        v22 = -[NSMapTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v22);
    }

    objc_autoreleasePoolPop(context);
    v14 = group;
    if (objc_msgSend(v18, "count"))
    {
      v29 = 1;
      do
      {
        v30 = (void *)MEMORY[0x19400FC60]();
        objc_msgSend(v18, "objectAtIndex:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndex:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectAtIndex:", 0);
        objc_msgSend(v19, "removeObjectAtIndex:", 0);
        objc_autoreleasePoolPop(v30);
        v33 = objc_msgSend(v18, "count");
        objc_msgSend(v32, "queue");
        v34 = objc_claimAutoreleasedReturnValue();
        if (v14)
          dispatch_group_enter(v14);
        +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", context);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "queue");
        v36 = objc_claimAutoreleasedReturnValue();

        if (v34 == v36)
        {
          if (a3)
          {
            v14 = group;
            if (v49 != 0 && (v29 & 1) != 0)
              v49[2](v49, 1);
            ((void (**)(_QWORD, void *))v50)[2](v50, v31);
            if (v48 && !v33)
              v48[2](v48, 1);
          }
          else
          {
            ((void (**)(_QWORD, void *))v50)[2](v50, v31);
            v14 = group;
          }
          v43 = (id)objc_opt_self();
          v44 = (id)objc_opt_self();
          if (!v14)
            goto LABEL_42;
        }
        else if (v34)
        {
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = sub_1907583D8;
          v52[3] = &unk_1E2C62948;
          v58 = a3;
          v59 = v29 & 1;
          v55 = v49;
          v56 = v50;
          v53 = v31;
          v60 = v33 == 0;
          v57 = v48;
          v54 = v32;
          v37 = (void *)MEMORY[0x19400FE1C](v52);
          v38 = v37;
          if (v34 == MEMORY[0x1E0C80D38])
            v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v37);
          else
            v39 = (dispatch_block_t)objc_msgSend(v37, "copy");
          v42 = v39;

          v14 = group;
          if (group)
            dispatch_group_async(group, v34, v42);
          else
            dispatch_async(v34, v42);

          if (!group)
            goto LABEL_42;
        }
        else
        {
          v40 = (id)objc_opt_self();
          v41 = (id)objc_opt_self();
          v14 = group;
          if (!group)
            goto LABEL_42;
        }
        dispatch_group_leave(v14);
LABEL_42:

        v29 = 0;
      }
      while (objc_msgSend(v18, "count"));
    }
    v45 = (id)objc_opt_self();
    v46 = (id)objc_opt_self();

  }
}

- (id)accountWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EFAF4();

  }
  -[_IDSAccountController internalAccounts](self, "internalAccounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v8, "allObjects", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "_internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uniqueID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToIgnoringCase:", v4);

        if ((v16 & 1) != 0)
        {
          v10 = v13;
          goto LABEL_15;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  return v10;
}

- (id)accountWithLoginID:(id)a3 service:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907EFB80();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[_IDSAccountController internalAccounts](self, "internalAccounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "_internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "loginID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((IMAreEmailsLogicallyTheSame() & 1) != 0)
        {
          objc_msgSend(v13, "_internal");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "serviceName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToIgnoringCase:", v20);

          if ((v18 & 1) != 0)
          {
            v10 = v13;
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v10 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }
LABEL_16:

  return v10;
}

- (void)_setupAccountWithLoginID:(id)a3 accountConfig:(id)a4 authToken:(id)a5 password:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *transactionIDToHandlersMap;
  void *v23;
  void *v24;
  NSObject *v25;
  NSString *service;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "assertQueueIsCurrent");

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1907EFC0C();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_transactionIDToHandlersMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    transactionIDToHandlersMap = self->_transactionIDToHandlersMap;
    self->_transactionIDToHandlersMap = Mutable;

  }
  v23 = (void *)objc_msgSend(v14, "copy");
  v24 = (void *)MEMORY[0x19400FE1C]();
  if (v24)
    CFDictionarySetValue((CFMutableDictionaryRef)self->_transactionIDToHandlersMap, v20, v24);

  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138413058;
    v29 = v12;
    v30 = 2112;
    v31 = service;
    v32 = 2112;
    v33 = v20;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1906E0000, v25, OS_LOG_TYPE_DEFAULT, "Requesting setup of account: %@   service: %@  transaction: %@  accountConfig: %@", buf, 0x2Au);
  }

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setupAccountWithLoginID:serviceName:accountType:accountConfig:authToken:password:transactionID:", v12, self->_service, 1, v13, v16, v15, v20);

}

- (void)setupAccountWithLoginID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_setupAccountWithLoginID_aliases_password_completionHandler_);
}

- (void)setupAccountWithLoginID:(id)a3 aliases:(id)a4 password:(id)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFDictionary *theDict;
  id v27;
  id v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v9 = a4;
  v29 = a5;
  v27 = a6;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "assertQueueIsCurrent");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EFC98();

  }
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v9;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v33;
    v17 = *MEMORY[0x1E0D35148];
    v18 = *MEMORY[0x1E0D35150];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v20, v17, v22, v18, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v23);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v13, "count") && v13)
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35158], v13);
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(obj, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "arrayByApplyingSelector:", sel_lowercaseString);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35240], v25);

  }
  -[_IDSAccountController _setupAccountWithLoginID:accountConfig:authToken:password:completionHandler:](self, "_setupAccountWithLoginID:accountConfig:authToken:password:completionHandler:", v30, theDict, 0, v29, v27);

}

- (void)setupAccountWithSetupParameters:(id)a3 aliases:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFDictionary *theDict;
  void *v24;
  void *v25;
  void *value;
  void *v28;
  id v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29 = a5;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D34438]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D34460]);
  value = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D34440]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D34468]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("uri"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    v14 = *MEMORY[0x1E0D35148];
    v15 = *MEMORY[0x1E0D35150];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v17 = (void *)MEMORY[0x1E0C99D80];
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "lowercaseString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, v14, v19, v15, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0D34450]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "__imArrayByApplyingBlock:", &unk_1E2C5F170);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (value)
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35168], value);
  if (v28)
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35160], v28);
  if (objc_msgSend(v24, "length") && v24)
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35200], v24);
  if (objc_msgSend(v22, "count") && v22)
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35240], v22);
  if (objc_msgSend(v10, "count") && v10)
    CFDictionarySetValue(theDict, (const void *)*MEMORY[0x1E0D35158], v10);
  -[_IDSAccountController _setupAccountWithLoginID:accountConfig:authToken:password:completionHandler:](self, "_setupAccountWithLoginID:accountConfig:authToken:password:completionHandler:", v28, theDict, v25, 0, v29);

}

- (void)addAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _IDSAccountController *v14;
  void *v15;
  void *v16;
  NSString *service;
  void *v18;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EFD24();

  }
  if (v4)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "loginID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    service = self->_service;
    objc_msgSend(v4, "_internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_internal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "accountType");
    objc_msgSend(v4, "_internal");
    v14 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAccountWithLoginID:serviceName:uniqueID:accountType:accountInfo:", v9, service, v11, v13, v16);

    -[_IDSAccountController _loadCachedAccounts](v14, "_loadCachedAccounts");
    -[NSMutableSet addObject:](v14->_cachedAccounts, "addObject:", v4);
  }

}

- (void)_removeAndDeregisterAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EFDB0();

  }
  if (v4)
  {
    objc_msgSend(v4, "_internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_removeAndDeregisterAccount:", v9);

    -[NSMutableDictionary setObject:forKey:](self->_pendingAccountsToRemove, "setObject:forKey:", v4, v9);
    -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
    -[NSMutableSet removeObject:](self->_cachedAccounts, "removeObject:", v4);

  }
}

- (void)_removeAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EFE3C();

  }
  if (v4)
  {
    -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_removeAccount:", v4);

      -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
      -[NSMutableSet removeObject:](self->_cachedAccounts, "removeObject:", v8);
    }

  }
}

- (void)enableAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableSet *enabledAccounts;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EFF54();

  }
  objc_msgSend(v4, "_internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v9 && (-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Client request to enable account ID: %@", (uint8_t *)&v18, 0xCu);

    }
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "enableAccount:", v9);

    -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
    enabledAccounts = self->_enabledAccounts;
    objc_msgSend(v4, "_internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](enabledAccounts, "addObject:", v16);

    objc_msgSend(v4, "_setIsEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      sub_1907EFA08();

  }
}

- (void)disableAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableSet *enabledAccounts;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableSet *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907EFFE0();

  }
  objc_msgSend(v4, "_internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "registrationError");
  if (v4 && v9 && (-[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v9) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_internal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v13;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "Client request to disable account ID: %@", (uint8_t *)&v28, 0xCu);

    }
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "disableAccount:", v16);

    -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
    enabledAccounts = self->_enabledAccounts;
    objc_msgSend(v4, "_internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](enabledAccounts, "removeObject:", v19);

    objc_msgSend(v4, "_setIsEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    goto LABEL_16;
  }
  if ((v10 - 27) <= 2)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "KeyTransparency");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v9;
      _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "Account has KT error, we're going to force disable it. { accountID: %@ }", (uint8_t *)&v28, 0xCu);
    }

    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_internal");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uniqueID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "forceDisableAccount:", v24);

    -[_IDSAccountController _loadCachedAccounts](self, "_loadCachedAccounts");
    v25 = self->_enabledAccounts;
    objc_msgSend(v4, "_internal");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uniqueID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v25, "removeObject:", v27);

    objc_msgSend(v4, "_setIsEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
LABEL_16:
    sub_1907EFA08();
LABEL_17:

  }
}

- (void)accountAdded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  _IDSAccountController *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *);
  void *v36;
  _IDSAccountController *v37;
  NSObject *v38;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F0130();

  }
  v8 = *MEMORY[0x1E0D35218];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35218]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4
    && self->_service
    && ((objc_msgSend(v9, "isEqualToString:") & 1) != 0
     || -[NSString isEqualToString:](self->_service, "isEqualToString:", *MEMORY[0x1E0D34CA0])))
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35228]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35138]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");

    if ((IDSIsValidAccountType() & 1) != 0)
    {
      if (objc_msgSend(v11, "length"))
      {
        -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;
          objc_msgSend(v15, "_internal");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAccountInfo:", v4);

          v27 = MEMORY[0x1E0C809B0];
          v28 = 3221225472;
          v29 = sub_190759FE8;
          v30 = &unk_1E2C62E48;
          v31 = self;
          v18 = v16;
          v32 = v18;
          v19 = &v27;
        }
        else
        {
          v26 = -[IDSAccount _initWithDictionary:uniqueID:serviceName:]([IDSAccount alloc], "_initWithDictionary:uniqueID:serviceName:", v4, v11, v12);
          objc_msgSend(v26, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v11));
          -[NSMutableSet addObject:](self->_cachedAccounts, "addObject:", v26);
          v33 = MEMORY[0x1E0C809B0];
          v34 = 3221225472;
          v35 = sub_190759F80;
          v36 = &unk_1E2C62E48;
          v37 = self;
          v18 = v26;
          v38 = v18;
          v19 = &v33;
        }
        -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v19, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);

        -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility");
      }
      else
      {
        +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_1907F006C();
      }
    }
    else
    {
      +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1907F00CC(v14, v18, v20, v21, v22, v23, v24, v25);
    }

  }
}

- (void)accountRemoved:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  _IDSAccountController *v18;
  id v19;

  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F02DC();

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35218]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4
    && self->_service
    && ((objc_msgSend(v8, "isEqualToString:") & 1) != 0
     || -[NSString isEqualToString:](self->_service, "isEqualToString:", *MEMORY[0x1E0D34CA0])))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1907F027C();

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35228]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAccountsToRemove, "objectForKeyedSubscript:", v11), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[NSMutableSet removeObject:](self->_cachedAccounts, "removeObject:", v12);
        -[NSMutableDictionary removeObjectForKey:](self->_pendingAccountsToRemove, "removeObjectForKey:", v11);
        v14 = MEMORY[0x1E0C809B0];
        v15 = 3221225472;
        v16 = sub_19075A294;
        v17 = &unk_1E2C62E48;
        v18 = self;
        v19 = v12;
        v13 = v12;
        -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v14);
        -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility", v14, v15, v16, v17, v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          sub_1907F021C();
      }
    }
    else
    {
      +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1907F01BC();
    }

  }
}

- (void)accountUpdated:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  _IDSAccountController *v34;
  id v35;
  _QWORD v36[5];
  NSObject *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907F04EC();

  }
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35218]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4
    && self->_service
    && ((objc_msgSend(v8, "isEqualToString:") & 1) != 0
     || -[NSString isEqualToString:](self->_service, "isEqualToString:", *MEMORY[0x1E0D34CA0])))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v39 = v4;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_INFO, "Received account updated %@ for topic %@", buf, 0x16u);
    }

    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35228]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1907F0368();
      goto LABEL_30;
    }
    -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      -[NSObject _internal](v12, "_internal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accountInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = IMAreObjectsLogicallySame();

      if ((v16 & 1) != 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      -[NSObject _internal](v13, "_internal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccountInfo:", v4);

      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = sub_19075A6F8;
      v36[3] = &unk_1E2C62E48;
      v36[4] = self;
      v37 = v13;
      -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", v36);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_1907F048C();

      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D35138]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");

      if ((IDSIsValidAccountType() & 1) == 0)
      {
        +[IDSLogging IDSAccountController](IDSLogging, "IDSAccountController");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1907F0428(v20, v22, v23, v24, v25, v26, v27, v28);

        goto LABEL_30;
      }
      v21 = -[IDSAccount _initWithDictionary:uniqueID:serviceName:]([IDSAccount alloc], "_initWithDictionary:uniqueID:serviceName:", v4, v11, v9);
      if (v21)
      {
        objc_msgSend(v21, "_setIsEnabled:", -[NSMutableSet containsObject:](self->_enabledAccounts, "containsObject:", v11));
        -[NSMutableSet addObject:](self->_cachedAccounts, "addObject:", v21);
        v30 = MEMORY[0x1E0C809B0];
        v31 = 3221225472;
        v32 = sub_19075A760;
        v33 = &unk_1E2C62E48;
        v34 = self;
        v35 = v21;
        -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v30);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_1907F03C8();

      }
    }
    -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility", v30, v31, v32, v33, v34);
    goto LABEL_30;
  }
LABEL_31:

}

- (void)setupCompleteForAccount:(id)a3 transactionID:(id)a4 setupError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  NSObject *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907F0724();

  }
  if (objc_msgSend(v9, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_transactionIDToHandlersMap, "objectForKey:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = v10;
        _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "SetupCompleteForAccount %@ transactionID %@ setupError %@", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)MEMORY[0x19400FE1C](v14);
        *(_DWORD *)buf = 134218242;
        v26 = v17;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Setup handler block %p for transactionID %@", buf, 0x16u);

      }
      -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = dispatch_queue_create("IDSAccountController-setupCompleteQueue", v19);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_19075AC9C;
        block[3] = &unk_1E2C60730;
        v22 = v18;
        v23 = v10;
        v24 = v14;
        dispatch_async(v20, block);
        -[NSMutableDictionary removeObjectForKey:](self->_transactionIDToHandlersMap, "removeObjectForKey:", v9);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Account setup completed but we don't have an account, ignoring...", buf, 2u);
        }
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Setup complete - no transaction ID, bailing...", buf, 2u);
    }
  }

}

- (void)accountDisabled:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  _IDSAccountController *v19;
  NSObject *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907F0A6C();

  }
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F0954();
    goto LABEL_23;
  }
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "warning");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907F0980();
    goto LABEL_23;
  }
  if (self->_service
    && ((objc_msgSend(v7, "isEqualToString:") & 1) != 0
     || -[NSString isEqualToString:](self->_service, "isEqualToString:", *MEMORY[0x1E0D34CA0])))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1907F0A0C();

    -[_IDSAccountController accountWithUniqueID:](self, "accountWithUniqueID:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](self->_enabledAccounts, "removeObject:", v6);
    -[NSObject _setIsEnabled:](v12, "_setIsEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_1907F09AC();

      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = sub_19075B0C0;
      v18 = &unk_1E2C62E48;
      v19 = self;
      v12 = v12;
      v20 = v12;
      -[_IDSAccountController _callDelegatesWithBlock:](self, "_callDelegatesWithBlock:", &v15);
      -[_IDSAccountController _updateLocalAccountVisibility](self, "_updateLocalAccountVisibility", v15, v16, v17, v18, v19);

    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Did not find an existing account to disable with unique ID %@", buf, 0xCu);
      }

    }
LABEL_23:

  }
}

@end
