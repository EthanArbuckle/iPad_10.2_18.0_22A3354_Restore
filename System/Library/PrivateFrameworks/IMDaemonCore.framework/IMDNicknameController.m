@implementation IMDNicknameController

+ (id)sharedInstance
{
  if (qword_1ED935CA0 != -1)
    dispatch_once(&qword_1ED935CA0, &unk_1E922BE48);
  return (id)qword_1ED935DD8;
}

- (IMDNicknameController)init
{
  IMDNicknameController *v2;
  IMDNicknameController *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  IDSKVStore *cloudkitRecordsKVStore;
  void *v11;
  void *v12;
  uint64_t v13;
  IDSKVStore *pendingNicknameUpdatesKVStore;
  void *v15;
  void *v16;
  uint64_t v17;
  IDSKVStore *handledNicknamesKVStore;
  void *v19;
  void *v20;
  uint64_t v21;
  IDSKVStore *archivedNicknamesKVStore;
  void *v23;
  void *v24;
  uint64_t v25;
  IDSKVStore *handleSharingKVStore;
  void *v27;
  void *v28;
  uint64_t v29;
  IDSKVStore *nicknameRecordsKVStore;
  void *v31;
  void *v32;
  uint64_t v33;
  IDSKVStore *unknownSenderRecordInfoKVStore;
  void *v35;
  void *v36;
  uint64_t v37;
  IDSService *nicknameService;
  void *v39;
  CHManager *v40;
  CHManager *callHistoryManager;
  uint8_t v43[16];
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)IMDNicknameController;
  v2 = -[IMDNicknameController init](&v44, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IMDNicknameController _makeAllNicknameContentsClassC](v2, "_makeAllNicknameContentsClassC");
    v4 = -[IMDNicknameController _nicknameFeatureEnabled](v3, "_nicknameFeatureEnabled");
    if ((v4 & 1) != 0)
    {
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        v5 = (void *)*MEMORY[0x1E0D38B18];
        objc_msgSend((id)*MEMORY[0x1E0D38B18], "stringByAppendingPathComponent:", CFSTR("nickNameKeyStore.db"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByResolvingAndStandardizingPath");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        IMSharedHelperEnsureDirectoryExistsAtPath();

        objc_msgSend(v6, "stringByResolvingAndStandardizingPath");
        v8 = objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v8, CFSTR("nicknamekeystore"), 0);
        cloudkitRecordsKVStore = v3->_cloudkitRecordsKVStore;
        v3->_cloudkitRecordsKVStore = (IDSKVStore *)v9;

        objc_msgSend(v5, "stringByAppendingString:", CFSTR("pendingNicknamesKeyStore.db"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByResolvingAndStandardizingPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v12, CFSTR("pendingNicknameUpdatesStore"), 0);
        pendingNicknameUpdatesKVStore = v3->_pendingNicknameUpdatesKVStore;
        v3->_pendingNicknameUpdatesKVStore = (IDSKVStore *)v13;

        objc_msgSend(v5, "stringByAppendingString:", CFSTR("handledNicknamesKeyStore.db"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByResolvingAndStandardizingPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v16, CFSTR("handledNicknamesStore"), 0);
        handledNicknamesKVStore = v3->_handledNicknamesKVStore;
        v3->_handledNicknamesKVStore = (IDSKVStore *)v17;

        objc_msgSend(v5, "stringByAppendingString:", CFSTR("archivedNicknamesKeyStore.db"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByResolvingAndStandardizingPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v20, CFSTR("archivedNicknamesStore"), 0);
        archivedNicknamesKVStore = v3->_archivedNicknamesKVStore;
        v3->_archivedNicknamesKVStore = (IDSKVStore *)v21;

        objc_msgSend(v5, "stringByAppendingString:", CFSTR("handleSharingPreferences.db"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByResolvingAndStandardizingPath");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v24, CFSTR("handleSharingPreferences"), 0);
        handleSharingKVStore = v3->_handleSharingKVStore;
        v3->_handleSharingKVStore = (IDSKVStore *)v25;

        objc_msgSend(v5, "stringByAppendingString:", CFSTR("nicknameRecordsStore.db"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByResolvingAndStandardizingPath");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v28, CFSTR("nicknameRecordsStore"), 0);
        nicknameRecordsKVStore = v3->_nicknameRecordsKVStore;
        v3->_nicknameRecordsKVStore = (IDSKVStore *)v29;

        objc_msgSend(v5, "stringByAppendingString:", CFSTR("unknownSenderRecordInfoStore.db"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringByResolvingAndStandardizingPath");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35250]), "initWithPath:storeName:dataProtectionClass:", v32, CFSTR("unknownSenderRecordInfoStore"), 0);
        unknownSenderRecordInfoKVStore = v3->_unknownSenderRecordInfoKVStore;
        v3->_unknownSenderRecordInfoKVStore = (IDSKVStore *)v33;

        objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addListener:", v3);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObserver:selector:name:object:", v3, sel__ckAccountChanged_, *MEMORY[0x1E0C94690], 0);

        -[IMDNicknameController _loadAllInfoFromDiskIfAble](v3, "_loadAllInfoFromDiskIfAble");
        -[IMDNicknameController purgeUnknownSenderRecordInfoIfNeeded](v3, "purgeUnknownSenderRecordInfoIfNeeded");
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.nameandphoto"));
        nicknameService = v3->_nicknameService;
        v3->_nicknameService = (IDSService *)v37;

        -[IDSService addDelegate:queue:](v3->_nicknameService, "addDelegate:queue:", v3, MEMORY[0x1E0C80D38]);
        objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addListenerID:forService:", CFSTR("IMDNicknameController"), CFSTR("com.apple.private.alloy.nameandphoto"));

        v40 = (CHManager *)objc_alloc_init(MEMORY[0x1E0D0CE68]);
        callHistoryManager = v3->_callHistoryManager;
        v3->_callHistoryManager = v40;

LABEL_8:
      }
    }
    else if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Nickname feature is turned off, don't load nickname info into memory", v43, 2u);
      }
      goto LABEL_8;
    }
  }
  return v3;
}

- (void)purgeUnknownSenderRecordInfoIfNeeded
{
  IMDNicknameController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  IMDNicknameController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id obj;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IMDNicknameController unknownSenderRecordInfo](v2, "unknownSenderRecordInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[IMDNicknameController unknownSenderRecordInfo](v2, "unknownSenderRecordInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v8)
      {
        v9 = v8;
        LOBYTE(v10) = 0;
        v29 = *(_QWORD *)v33;
        v11 = *MEMORY[0x1E0D35C18];
        obj = v7;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v33 != v29)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v14 = v2;
            -[IMDNicknameController unknownSenderRecordInfo](v2, "unknownSenderRecordInfo", obj);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKey:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "aliasToCNIDMap");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKey:", v13);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 && !objc_msgSend(v19, "isEqualToString:", v11))
              goto LABEL_11;
            v36 = v13;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            IMDCNRecordIDForAliases();
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "_stringForKey:", v13);
            v22 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v22;
            if (v22)
            {
LABEL_11:
              LOBYTE(v22) = objc_msgSend(v19, "isEqualToString:", v11) ^ 1;

            }
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = sub_1D14E62B8;
            v30[3] = &unk_1E922BE68;
            v31 = v22;
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v30);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "filteredSetUsingPredicate:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v10)
            {
              v10 = 1;
            }
            else
            {
              v26 = objc_msgSend(v24, "count");
              v10 = v26 != objc_msgSend(v16, "count");
            }
            v2 = v14;
            if (objc_msgSend(v25, "count"))
              objc_msgSend(v28, "setObject:forKey:", v25, v13);

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v9);

        if (v10)
          -[IMDNicknameController _replaceUnknownSenderRecordInfoListWithInfo:purgeIfNeeded:](v14, "_replaceUnknownSenderRecordInfoListWithInfo:purgeIfNeeded:", v28, 0);
      }
      else
      {

      }
    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeListener:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
  v5.receiver = self;
  v5.super_class = (Class)IMDNicknameController;
  -[IMDNicknameController dealloc](&v5, sel_dealloc);
}

- (id)defaults
{
  return (id)objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
}

- (BOOL)evaluateAccountStateForFeatureEligibility
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  int v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isNameAndPhotoC3Enabled");

  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "signedIntoiCloudAccount");
  else
    v7 = objc_msgSend(v5, "signedIntoiCloudAndiMessageAndiCloudAccountMatchesiMessageAccount");
  v8 = v7;

  -[IMDNicknameController defaults](self, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D38B48];
  v11 = *MEMORY[0x1E0D38BC0];
  objc_msgSend(v9, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BC0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (v8)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      if (v13)
        v16 = CFSTR("YES");
      v21 = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Evaluating account state for feature eligibility {refreshedFeatureEligibility: %@ currentFeatureEligibility: %@}", (uint8_t *)&v21, 0x16u);
    }

  }
  if (v8 != v13)
  {
    -[IMDNicknameController defaults](self, "defaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forDomain:forKey:", v19, v10, v11);

  }
  return v8;
}

- (void)aliasesDidChange:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Received aliases did change hasMultiplePhoneNumbers %@", (uint8_t *)&v19, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isInternalInstall") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAllowMultiplePhoneNumbersSNaPEnabled");

    if (!v9)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Received device is internal install, allowing nicknames with multiple numbers.", (uint8_t *)&v19, 2u);
        }

      }
      -[IMDNicknameController defaults](self, "defaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forDomain:forKey:", 0, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B80]);
      goto LABEL_17;
    }
  }
  else
  {

  }
  -[IMDNicknameController defaults](self, "defaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0D38B48];
  v15 = *MEMORY[0x1E0D38B80];
  objc_msgSend(v13, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B80]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17 == v3)
    return;
  -[IMDNicknameController defaults](self, "defaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forDomain:forKey:", v18, v14, v15);

LABEL_17:
}

- (void)_evaluateIfAccountHasMultiplePhoneNumbers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceWithName:", *MEMORY[0x1E0D38F68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "idsAccount", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "accountType");

          if (v14 == 1)
          {
            -[IMDNicknameController aliasesDidChange:](self, "aliasesDidChange:", objc_msgSend(v12, "multiplePhoneNumbersTiedToAccount"));
            goto LABEL_12;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

}

- (unint64_t)_reuploadLocalProfileVersionNumber
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v2 = 1;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("nickname-reupload-profile-version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v2 = objc_msgSend(v4, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D38B48], CFSTR("UseOldProfilesContainer"));

  if (v6)
    v2 = 0;

  return v2;
}

- (void)_tryToReuploadPersonalNicknameWithRetryCount:(unint64_t)a3 reuploadVersion:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12[3];
  id location[2];

  if (a3 > 2)
  {
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We were not successful in reuploading our nickname to the new container", (uint8_t *)location, 2u);
      }

    }
    -[IMDNicknameController defaults](self, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forDomain:forKey:", v10, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BA0]);

  }
  else
  {
    location[0] = 0;
    objc_initWeak(location, self);
    -[IMDNicknameController personalNickname](self, "personalNickname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1D14E6C30;
    v11[3] = &unk_1E922BE90;
    objc_copyWeak(v12, location);
    v12[1] = (id)a4;
    v12[2] = (id)a3;
    -[IMDNicknameController setPersonalNickname:completionBlock:](self, "setPersonalNickname:completionBlock:", v7, v11);

    objc_destroyWeak(v12);
    objc_destroyWeak(location);
  }
}

- (void)reuploadProfileIfNeeded
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = -[IMDNicknameController _reuploadLocalProfileVersionNumber](self, "_reuploadLocalProfileVersionNumber");
  if (v5 < v6)
    -[IMDNicknameController _tryToReuploadPersonalNicknameWithRetryCount:reuploadVersion:](self, "_tryToReuploadPersonalNicknameWithRetryCount:reuploadVersion:", 0, v6);
}

- (NSMutableDictionary)pendingNicknameUpdates
{
  return self->_pendingNicknameUpdates;
}

- (NSMutableDictionary)handledNicknames
{
  return self->_handledNicknames;
}

- (NSMutableDictionary)archivedNicknames
{
  return self->_archivedNicknames;
}

- (void)newDeviceDidSignIntoiMessage
{
  MEMORY[0x1E0DE7D20](self, sel__newDeviceDidSignIntoiMessageWithRetryCount_);
}

- (void)_retryPeerRequestWithRetry:(unint64_t)a3
{
  im_dispatch_after();
}

- (void)_newDeviceDidSignIntoiMessageWithRetryCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("NO");
      if (v6)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Told this device just signed into iMessage, we need to ask our peers for nickname info requestedInfoBefore %@ retry count %@", buf, 0x16u);

    }
  }
  if ((v6 & 1) == 0)
    im_dispatch_after();
}

- (void)deviceSignedOutOfiMessage
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Told this device signed out of iMessage, we need to reset the bit that we've asked for the nickname feature info", v8, 2u);
    }

  }
  -[IMDNicknameController defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D38B48];
  objc_msgSend(v4, "setValue:forDomain:forKey:", 0, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B98]);

  -[IMDNicknameController defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forDomain:forKey:", MEMORY[0x1E0C9AAA0], v5, *MEMORY[0x1E0D38B68]);

  -[IMDNicknameController defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forDomain:forKey:", &unk_1E92713B0, v5, *MEMORY[0x1E0D38BB0]);

  -[IMDNicknameController _deletePublicNicknameLocationAndKey](self, "_deletePublicNicknameLocationAndKey");
}

- (void)verifyTruncatedRecordIDMatchesPersonalNickname:(id)a3 forChat:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  _BYTE v20[22];
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if ((_DWORD)v8)
  {
    v8 = objc_msgSend(v7, "style");
    if ((_DWORD)v8 == 45)
    {
      -[IMDNicknameController personalNickname](self, "personalNickname");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController substringRecordIDForNickname:](self, "substringRecordIDForNickname:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = -[NSObject isEqualToString:](v10, "isEqualToString:", v6);
      v12 = v11;
      v13 = IMOSLoggingEnabled(v11);
      if ((_DWORD)v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          -[IMDNicknameController personalNickname](self, "personalNickname");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "recordID");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          v18 = CFSTR("NO");
          *(_DWORD *)v20 = 138413058;
          *(_QWORD *)&v20[4] = v6;
          if (v12)
            v18 = CFSTR("YES");
          *(_WORD *)&v20[12] = 2112;
          *(_QWORD *)&v20[14] = v16;
          v21 = 2112;
          v22 = v10;
          v23 = 2112;
          v24 = v18;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Going to verify if truncated record ID %@ is equivalent to our personal record id %@ current truncated id %@ recordIDS are equals %@", v20, 0x2Au);

        }
      }
      if ((v12 & 1) == 0)
      {
        if (IMOSLoggingEnabled(v13))
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Truncated record id does not match, marking this chat as dirty so we send a nickname on the next message send", v20, 2u);
          }

        }
        objc_msgSend(v7, "meCardHasUpdated", *(_OWORD *)v20);
      }
LABEL_19:

      goto LABEL_20;
    }
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Nickname sharing is not enabled or trying to verify on a group chat -- bailing verifying record ids", v20, 2u);
    }
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_beginNicknameUpload:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Beginning upload of nickname profile to CloudKit", buf, 2u);
    }

  }
  self->_nicknameIsUploadingToCK = 1;
  -[IMDNicknameController _storePendingNicknameForUpload:](self, "_storePendingNicknameForUpload:", v4);
  im_dispatch_after();

}

- (void)_endNicknameUpload
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  self->_nicknameIsUploadingToCK = 0;
  if (IMOSLoggingEnabled(-[IMDNicknameController _deletePendingNicknameForUpload](self, "_deletePendingNicknameForUpload")))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Nickname upload has completed -- sending out of band nickname updates", buf, 2u);
    }

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[IMDNicknameController chatsToSendNicknameInfoTo](self, "chatsToSendNicknameInfoTo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412290;
    v18 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance", v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "existingChatWithGUID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "participants");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "guid");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastAddressedLocalHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDNicknameController sendPersonalNicknameToRecipients:chatGUID:fromHandle:](self, "sendPersonalNicknameToRecipients:chatGUID:fromHandle:", v13, v14, v15);

        }
        else if (IMOSLoggingEnabled(v12))
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v18;
            v24 = v9;
            _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "We couldn't find a chat to send nickname info to for guid %@", buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v5);
  }

  -[IMDNicknameController chatsToSendNicknameInfoTo](self, "chatsToSendNicknameInfoTo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllObjects");

}

- (void)setPersonalNickname:(id)a3
{
  IMNickname *v5;
  IMNickname **p_personalNickname;
  IMNickname *personalNickname;
  void *v8;
  void *v9;
  IMNickname *v10;

  v5 = (IMNickname *)a3;
  personalNickname = self->_personalNickname;
  p_personalNickname = &self->_personalNickname;
  if (personalNickname != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)p_personalNickname, a3);
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "broadcasterForAccountListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updatePersonalNickname:", *p_personalNickname);

    v5 = v10;
  }

}

- (void)setPersonalNickname:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  _BYTE buf[12];
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "avatar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageFilePath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Client request to store new personal nickname %@ path%@", buf, 0x16u);

    }
  }
  v11 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v11 && (v11 = -[IMDNicknameController _isNicknamesSharingEnabled](self, "_isNicknamesSharingEnabled")))
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D14E7EC4;
    aBlock[3] = &unk_1E9227FA8;
    v24 = v7;
    v13 = _Block_copy(aBlock);
    -[IMDNicknameController transferServicesController](self, "transferServicesController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[IMDNicknameController _beginNicknameUpload:](self, "_beginNicknameUpload:", v6);
      -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Uploading Personal Nickname"), v17);

      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      -[IMDNicknameController transferServicesController](self, "transferServicesController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = sub_1D14E7ED8;
      v20[3] = &unk_1E922BEB8;
      objc_copyWeak(&v22, (id *)buf);
      v21 = v13;
      objc_msgSend(v18, "setPersonalNickname:oldRecordID:completionBlockWithWallpaperTags:", v6, v16, v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Trying to set a personal nickname when the feature is off", buf, 2u);
      }

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)_uploadPendingNicknameIfNecessary
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController _getPendingNicknameForUpload](self, "_getPendingNicknameForUpload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = IMOSLoggingEnabled(v3);
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Loaded pending nickname from disk: %@ and uploading", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Found Pending Nickname Upload"), v6);

    -[IMDNicknameController setPersonalNickname:completionBlock:](self, "setPersonalNickname:completionBlock:", v3, 0);
  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "No pending nickname found.", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)_resetHandleSharingList
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Resetting handle allow/denylist", v8, 2u);
    }

  }
  -[IMDNicknameController _clearSharingLists](self, "_clearSharingLists");
  -[IMDNicknameController _updateDenyAllowListHandlesVersion](self, "_updateDenyAllowListHandlesVersion");
  -[IMDNicknameController _syncHandleAllowDenyListToOtherDevices](self, "_syncHandleAllowDenyListToOtherDevices");
  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "broadcasterForAccountListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController denyListedHandlesForSharing](self, "denyListedHandlesForSharing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateNicknameHandlesForSharing:blocked:", v6, v7);

}

- (void)_clearSharingLists
{
  void *v3;
  void *v4;
  id v5;

  -[IMDNicknameController handleAllowList](self, "handleAllowList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[IMDNicknameController handleDenyList](self, "handleDenyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[IMDNicknameController handleSharingKVStore](self, "handleSharingKVStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteDatabase");

}

- (void)_clearTransitionedList
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "persistData:forKey:error:", 0, CFSTR("handleTransitionedList"), &v8);
  v5 = v8;

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Clearing nickname transition list, error: %@", buf, 0xCu);
    }

  }
}

- (void)_clearActiveNicknameRecords
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "persistData:forKey:error:", 0, CFSTR("activeNicknameRecords"), &v8);
  v5 = v8;

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Clearing nickname active records, error: %@", buf, 0xCu);
    }

  }
}

- (void)_clearIgnoredNicknameRecords
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "persistData:forKey:error:", 0, CFSTR("ignoredNicknameRecords"), &v8);
  v5 = v8;

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Clearing nickname ignored records, error: %@", buf, 0xCu);
    }

  }
}

- (void)currentPersonalNicknamewithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController nickNameDecryptionKey](self, "nickNameDecryptionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController wallpaperDataTag](self, "wallpaperDataTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController lowResWallpaperDataTag](self, "lowResWallpaperDataTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController wallpaperDataTag](self, "wallpaperDataTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController currentPersonalNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:completionBlock:](self, "currentPersonalNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:completionBlock:", v9, v5, v6, v7, v8, v4);

}

- (void)currentPersonalNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  _BOOL8 v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Going to retrieve the current nickname from CloudKit", buf, 2u);
    }

  }
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D14E8C00;
  aBlock[3] = &unk_1E922BEE0;
  v22 = v19;
  v34 = v22;
  v23 = _Block_copy(aBlock);
  v24 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v24)
  {
    if (objc_msgSend(v14, "length") && objc_msgSend(v15, "length"))
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v27[0] = v21;
      v27[1] = 3221225472;
      v27[2] = sub_1D14E8C14;
      v27[3] = &unk_1E922BF08;
      v28 = v14;
      objc_copyWeak(&v31, (id *)buf);
      v29 = v15;
      v30 = v23;
      LOBYTE(v26) = 1;
      -[IMDNicknameController getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:isKnownSender:shouldDecodeImageFields:completionBlock:](self, "getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:isKnownSender:shouldDecodeImageFields:completionBlock:", v28, v29, v16, v17, v18, 1, v26, v27);

      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not fetching current nickname", buf, 2u);
      }

    }
    if (v23)
      (*((void (**)(void *, _QWORD, _QWORD))v23 + 2))(v23, 0, 0);
  }

}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 completionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  void *v20;
  char v21;
  void *v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id *v36;
  id *v37;
  id *v38;
  id *v39;
  id v40;
  _BOOL4 v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;

  v41 = a8;
  v43 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a10;
  v18 = (objc_class *)MEMORY[0x1E0D36AE8];
  v40 = a4;
  v42 = a3;
  v19 = objc_alloc_init(v18);
  objc_msgSend(v19, "startTimingForKey:", CFSTR("Nickname Download"));
  -[IMDNicknameController transferServicesController](self, "transferServicesController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  -[IMDNicknameController transferServicesController](self, "transferServicesController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v21 & 1) != 0)
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = sub_1D14E9118;
    v50[3] = &unk_1E922BF30;
    v38 = &v55;
    v39 = &v51;
    v54 = v16;
    v55 = v17;
    v51 = v19;
    v52 = v43;
    v36 = &v53;
    v37 = &v52;
    v23 = &v54;
    v53 = v15;
    v24 = v16;
    v25 = v15;
    v26 = v43;
    v27 = v17;
    v28 = v19;
    LOBYTE(v35) = a9;
    v29 = v40;
    objc_msgSend(v22, "getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:isKnownSender:shouldDecodeImageFields:completionBlock:", v42, v40, v26, v25, v24, v41, v35, v50);
  }
  else
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = sub_1D14E9300;
    v44[3] = &unk_1E922BF30;
    v38 = &v49;
    v39 = &v45;
    v48 = v16;
    v49 = v17;
    v45 = v19;
    v46 = v43;
    v36 = &v47;
    v37 = &v46;
    v23 = &v48;
    v47 = v15;
    v30 = v16;
    v31 = v15;
    v32 = v43;
    v33 = v17;
    v34 = v19;
    v29 = v40;
    objc_msgSend(v22, "getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:isKnownSender:completionBlock:", v42, v40, v32, v31, v30, v41, v44);
  }

}

- (void)NicknameWithRecordID:(id)a3 URI:(id)a4 decryptionKey:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 hasWallpaperUpdate:(BOOL)a9 dropNicknameForUnknownContacts:(BOOL)a10 withCompletionBlock:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _BOOL8 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const __CFString *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  uint64_t v53;
  _BOOL4 v54;
  void *v55;
  int v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  uint64_t v63;
  NSObject *v64;
  const __CFString *v65;
  int v66;
  int v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  uint64_t (**v73)(void);
  int v74;
  uint64_t (**v75)(void);
  void *v76;
  void *v77;
  void *v78;
  unsigned int v79;
  void *v80;
  void *v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  IMDNicknameController *v91;
  _QWORD aBlock[4];
  id v93;
  _BYTE buf[12];
  __int16 v95;
  _BYTE v96[10];
  id v97;
  void *v98;
  _QWORD v99[4];

  v99[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v82 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a11;
  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      v95 = 2112;
      *(_QWORD *)v96 = v18;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Asked to fetch nickname with recordID %@, sender URI: %@", buf, 0x16u);
    }

  }
  v24 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v24)
  {
    v25 = objc_msgSend(v17, "length");
    if (v25)
    {
      v25 = objc_msgSend(v18, "length");
      if (v25)
      {
        v25 = objc_msgSend(v19, "length");
        if (v25)
        {
          objc_msgSend(v18, "_stripFZIDPrefix");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDNicknameController nicknameForRecordID:handle:](self, "nicknameForRecordID:handle:", v17, v81);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "aliasToCNIDMap");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v81);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v30 = *MEMORY[0x1E0D35C18];
            v31 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0D35C18]);
            v32 = v81;
            if (v81)
              v33 = v31;
            else
              v33 = 0;
            if ((v33 & 1) == 0)
            {
              v34 = v28;
LABEL_29:
              v76 = v34;
              v29 = objc_msgSend(v34, "isEqualToString:", v30);
              v79 = v29 ^ 1;
LABEL_31:
              v40 = IMOSLoggingEnabled(v29);
              if ((_DWORD)v40)
              {
                OSLogHandleForIMFoundationCategory();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                {
                  v42 = CFSTR("NO");
                  if (v79)
                    v42 = CFSTR("YES");
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v81;
                  v95 = 2112;
                  *(_QWORD *)v96 = v42;
                  _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Is %@ a known sender: %@", buf, 0x16u);
                }

              }
              v43 = IMOSLoggingEnabled(v40);
              if ((_DWORD)v43)
              {
                OSLogHandleForIMFoundationCategory();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v76;
                  v95 = 2112;
                  *(_QWORD *)v96 = v81;
                  _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Found contactID: %@ for handle: %@", buf, 0x16u);
                }

              }
              if (IMOSLoggingEnabled(v43))
              {
                OSLogHandleForIMFoundationCategory();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "aliasToCNIDMap");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v47;
                  _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "Current aliasToCNIDMap %@", buf, 0xCu);

                }
              }
              objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectForKey:", CFSTR("disable-SNaP-downloads-for-unknown-senders"));
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v77, "BOOLValue");
              v49 = v48;
              v50 = IMOSLoggingEnabled(v48);
              if ((_DWORD)v50)
              {
                OSLogHandleForIMFoundationCategory();
                v51 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                {
                  v52 = CFSTR("NO");
                  if (v49)
                    v52 = CFSTR("YES");
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v52;
                  _os_log_impl(&dword_1D1413000, v51, OS_LOG_TYPE_INFO, "IDS server bag tells us to drop all payloads from unknown senders: %@", buf, 0xCu);
                }

              }
              if ((((a10 | v49) ^ 1 | v79) & 1) != 0)
              {
                if (v80)
                {
                  objc_msgSend(v80, "wallpaper");
                  v53 = objc_claimAutoreleasedReturnValue();
                  v54 = v53 == 0 && a9;
                  if (v53 == 0 && a9)
                    v55 = 0;
                  else
                    v55 = (void *)v53;

                  v56 = v54 & v79;
                }
                else
                {
                  v56 = 0;
                }
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = sub_1D14EA0CC;
                aBlock[3] = &unk_1E922BF58;
                v58 = v81;
                v93 = v58;
                v75 = (uint64_t (**)(void))_Block_copy(aBlock);
                v89[0] = MEMORY[0x1E0C809B0];
                v89[1] = 3221225472;
                v89[2] = sub_1D14EA1F8;
                v89[3] = &unk_1E922BF80;
                v72 = v58;
                v90 = v72;
                v91 = self;
                v73 = (uint64_t (**)(void))_Block_copy(v89);
                if ((v79 & 1) != 0 || (v75[2]() & 1) != 0)
                  v74 = 1;
                else
                  v74 = v73[2]();
                v59 = v80;
                if (v80)
                {
                  objc_msgSend(v80, "avatar");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = objc_msgSend(v60, "hasImage");

                  v62 = v74 & ~v61;
                }
                else
                {
                  v62 = 0;
                }
                v63 = IMOSLoggingEnabled(v59);
                if ((_DWORD)v63)
                {
                  OSLogHandleForIMFoundationCategory();
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                  {
                    v65 = CFSTR("NO");
                    if (v74)
                      v65 = CFSTR("YES");
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v65;
                    _os_log_impl(&dword_1D1413000, v64, OS_LOG_TYPE_INFO, "Should decode image fields: %@", buf, 0xCu);
                  }

                }
                if (v80)
                  v66 = v56;
                else
                  v66 = 1;
                v67 = IMOSLoggingEnabled(v63);
                if (v62 | v66)
                {
                  if (v67)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v68 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v17;
                      _os_log_impl(&dword_1D1413000, v68, OS_LOG_TYPE_INFO, "Retrieving nickname from IMTransferAgent with recordID %@", buf, 0xCu);
                    }

                  }
                  *(_QWORD *)buf = 0;
                  objc_initWeak((id *)buf, self);
                  v83[0] = MEMORY[0x1E0C809B0];
                  v83[1] = 3221225472;
                  v83[2] = sub_1D14EA35C;
                  v83[3] = &unk_1E922BFA8;
                  objc_copyWeak(&v88, (id *)buf);
                  v84 = v72;
                  v85 = v18;
                  v86 = v17;
                  v87 = v22;
                  LOBYTE(v71) = v74;
                  -[IMDNicknameController getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:isKnownSender:shouldDecodeImageFields:completionBlock:](self, "getNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:isKnownSender:shouldDecodeImageFields:completionBlock:", v86, v19, v82, v20, v21, v79, v71, v83);

                  objc_destroyWeak(&v88);
                  objc_destroyWeak((id *)buf);
                }
                else
                {
                  v69 = v80;
                  if (v67)
                  {
                    OSLogHandleForIMFoundationCategory();
                    v70 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138413314;
                      *(_QWORD *)&buf[4] = v17;
                      v95 = 1024;
                      *(_DWORD *)v96 = v79;
                      *(_WORD *)&v96[4] = 1024;
                      *(_DWORD *)&v96[6] = 1;
                      LOWORD(v97) = 1024;
                      *(_DWORD *)((char *)&v97 + 2) = a9;
                      HIWORD(v97) = 2112;
                      v98 = v80;
                      _os_log_impl(&dword_1D1413000, v70, OS_LOG_TYPE_INFO, "Already have this one, no need to grab it again from CloudKit with recordID %@, knownSender: %i, shouldAttemptWallpaperFetch: %i, hasWallpaperUpdate: %i, existingNickname: %@", buf, 0x28u);
                    }

                    v69 = v80;
                  }
                  (*((void (**)(id, void *, uint64_t, _QWORD, uint64_t))v22 + 2))(v22, v69, 1, 0, 1);
                }

              }
              else
              {
                if (IMOSLoggingEnabled(v50))
                {
                  OSLogHandleForIMFoundationCategory();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "Refusing to download SNaP payload because the sender is unknown and we have been told drop incoming payloads from this or all unknown senders.", buf, 2u);
                  }

                }
                if (v22)
                  (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))v22 + 2))(v22, 0, 0, 0, 1);
              }

              goto LABEL_93;
            }
          }
          else
          {
            v32 = v81;
            if (!v81)
              goto LABEL_30;
          }
          v99[0] = v32;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          IMDCNRecordIDForAliases();
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "_stringForKey:", v81);
          v39 = objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            v34 = (void *)v39;
            v30 = *MEMORY[0x1E0D35C18];
            goto LABEL_29;
          }
LABEL_30:
          v76 = 0;
          v79 = 0;
          goto LABEL_31;
        }
      }
    }
    if (IMOSLoggingEnabled(v25))
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v17;
        v95 = 2112;
        *(_QWORD *)v96 = v18;
        *(_WORD *)&v96[8] = 2112;
        v97 = v19;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "We are missing parameters to fetch the CloudKit record (recordID: %@) (URI: %@) (decryptionKey: %@)", buf, 0x20u);
      }

    }
LABEL_20:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t))v22 + 2))(v22, 0, 0, 0, 1);
    goto LABEL_93;
  }
  if (IMOSLoggingEnabled(v24))
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Name+Photo sharing feature is disabled, not fetching CloudKit record", buf, 2u);
    }

  }
  if (v22)
    goto LABEL_20;
LABEL_93:

}

- (void)deleteAllPersonalNicknames:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  _BOOL8 v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[8];

  v6 = a4;
  v7 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  v8 = v7;
  v9 = IMOSLoggingEnabled(v7);
  if (v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Client request to delete personal nickname with recordID", buf, 2u);
      }

    }
    -[IMDNicknameController transferServicesController](self, "transferServicesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      -[IMDNicknameController transferServicesController](self, "transferServicesController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1D14EA7F8;
      v15[3] = &unk_1E922BFD0;
      objc_copyWeak(&v17, (id *)buf);
      v18 = a3;
      v16 = v6;
      objc_msgSend(v13, "deleteAllPersonalNicknamesWithCompletion:", v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "The nickname feature is disabled, we shouldn't make any requests to CloudKit", buf, 2u);
    }

  }
}

- (void)_updateSharingPreferencesIfNeededFromMadridMessage:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", MessageDictionaryMeCardSharingAudienceKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", MessageDictionaryMeCardSharingEnabledKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", MessageDictionaryMeCardSharingNameForkedKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", MessageDictionaryMeCardSharingImageForkedKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("audienceValue %@ enabledValue %@ nameForked %@ imageForked %@"), v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Going to update Me Card preferences %@", buf, 0xCu);
      }

    }
    if (v6 || v7 || v8 || v9)
    {
      -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Sharing Preferences Changed"), v10);
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(v6, "integerValue");
          if (v12 <= 2)
          {
            -[IMDNicknameController defaults](self, "defaults");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setValue:forDomain:forKey:", v14, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B60]);

          }
        }
      }
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[IMDNicknameController defaults](self, "defaults");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setValue:forDomain:forKey:", v16, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B78]);

        }
      }
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[IMDNicknameController defaults](self, "defaults");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "BOOLValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setValue:forDomain:forKey:", v18, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B70]);

        }
      }
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[IMDNicknameController defaults](self, "defaults");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "BOOLValue"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setValue:forDomain:forKey:", v20, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B68]);

          v21 = objc_msgSend(v7, "BOOLValue");
          if ((v21 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v21))
            {
              OSLogHandleForIMFoundationCategory();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Not enabled, deleting local recordID and cache", buf, 2u);
              }

            }
            -[IMDNicknameController _deletePublicNicknameLocationAndKey](self, "_deletePublicNicknameLocationAndKey");
            -[IMDNicknameController setPersonalNickname:](self, "setPersonalNickname:", 0);
          }
        }
      }
    }

  }
  else if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "The nickname feature is disabled, not taking updates coming from madrid", buf, 2u);
    }

  }
}

- (void)_updateMessageDictionaryWithPendingNicknameUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[IMDNicknameController defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, MessageDictionaryPendingNicknameUpdatesVersionKey);

  objc_msgSend(v4, "setObject:forKey:", v10, MessageDictionaryPendingNicknameUpdatesHandlesKey);
}

- (void)_updateMessageDictionaryWithNicknameUpdateRecordIDs:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  -[IMDNicknameController defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v5, "unsignedIntegerValue");

  -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController archivedNicknames](self, "archivedNicknames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v9)
      goto LABEL_3;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_4;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_33;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_34:
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("rid"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("rid"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v15);
  }
  v40 = v13;
  v41 = v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v22 = v9;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("rid"), v40);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("rid"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v29);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v24);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v31 = v11;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("rid"), v40);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("rid"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v38);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", v39, MessageDictionaryPendingNicknameUpdatesVersionKey);

  objc_msgSend(v43, "setObject:forKey:", v41, MessageDictionaryPendingNicknameUpdatesRecordIDsKey);
  objc_msgSend(v43, "setObject:forKey:", v21, MessageDictionaryCurrentNicknameUpdatesRecordIDsKey);
  objc_msgSend(v43, "setObject:forKey:", v30, MessageDictionaryArchivedNicknameUpdatesRecordIDsKey);

}

- (id)messageDictionaryWithPersonalRecordIDAndVersion
{
  __CFDictionary *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const __CFString *v21;
  void *value;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMDNicknameController _isNicknamesSharingEnabled](self, "_isNicknamesSharingEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  value = v4;
  if (v4)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingEnabledKey, v4);
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = value;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Transporting sharingEnabled %@", buf, 0xCu);
    }

  }
  -[IMDNicknameController defaults](self, "defaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D38B48];
  objc_msgSend(v6, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B60]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingAudienceKey, v25);
  -[IMDNicknameController defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getValueFromDomain:forKey:", v7, *MEMORY[0x1E0D38B88]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController nickNameDecryptionKey](self, "nickNameDecryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController wallpaperDataTag](self, "wallpaperDataTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController lowResWallpaperDataTag](self, "lowResWallpaperDataTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController wallpaperMetadataTag](self, "wallpaperMetadataTag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryNicknameVersionKey, v24);
  if (v13)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryPersonalNicknameRecordIDKey, v13);
  if (v9)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryPersonalNicknameDecryptKeyKey, v9);
  if (v10)
    CFDictionarySetValue(v3, MessageDictionaryNicknameWallpaperTagKey, v10);
  if (v11)
    CFDictionarySetValue(v3, MessageDictionaryNicknameLowResWallpaperTagKey, v11);
  if (v12)
    CFDictionarySetValue(v3, MessageDictionaryNicknameWallpaperMetadataTagKey, v12);
  -[IMDNicknameController defaults](self, "defaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getValueFromDomain:forKey:", v7, *MEMORY[0x1E0D38B78]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController defaults](self, "defaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "getValueFromDomain:forKey:", v7, *MEMORY[0x1E0D38B70]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingNameForkedKey, v15);
  if (v17)
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingImageForkedKey, v17);
  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = objc_msgSend(v9, "length");
      v21 = CFSTR("YES");
      *(_DWORD *)buf = 138413570;
      v27 = v25;
      v28 = 2112;
      if (!v20)
        v21 = CFSTR("NO");
      v29 = v24;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v15;
      v36 = 2112;
      v37 = v17;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Transporting meCardSharingAudience %@ nicknameVersion %@ decryptionKey %@ nickNameID %@ nameForked %@ imageForked %@", buf, 0x3Eu);
    }

  }
  return v3;
}

- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v8);
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Marking nickname as current %@", (uint8_t *)&v11, 0xCu);
      }

    }
    -[IMDNicknameController _markPendingNicknameAsCurrent:incrementPendingNicknameVersion:updateType:broadcastUpdates:](self, "_markPendingNicknameAsCurrent:incrementPendingNicknameVersion:updateType:broadcastUpdates:", v9, 1, a4, 1);

  }
}

- (void)_updateNicknameListsIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t ii;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t jj;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  id v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id obj;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  uint64_t v143;
  void *v144;
  uint8_t v145[128];
  uint8_t buf[4];
  void *v147;
  __int16 v148;
  void *v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v102 = a3;
  objc_msgSend(v102, "objectForKey:", MessageDictionaryPendingNicknameUpdatesVersionKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend(v4, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D38B90];
  v100 = *MEMORY[0x1E0D38B48];
  objc_msgSend(v5, "getValueFromDomain:forKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = *MEMORY[0x1E0D38B50];
  objc_msgSend(v9, "getValueFromDomain:forKey:", v100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  v13 = IMOSLoggingEnabled(v12);
  if ((_DWORD)v13)
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = v6;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v147 = v16;
      v148 = 2112;
      v149 = v17;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "updateHandledNicknamesIfNeeded incomingPendingNicknameVersion %@ currentPendingNicknameUpdatesVersion %@", buf, 0x16u);

      v6 = v15;
    }

  }
  if (v8 < v101 || v11 < v101)
  {
    objc_msgSend(v102, "objectForKey:", MessageDictionaryPendingNicknameUpdatesHandlesKey);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allKeys");
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v107, "arrayByExcludingObjectsInArray:", v99);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = IMOSLoggingEnabled(v22);
      if ((_DWORD)v23)
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v147 = v107;
          v148 = 2112;
          v149 = v99;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Our current pending handles %@ our incoming pending handles %@", buf, 0x16u);
        }

      }
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v147 = v22;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We need to mark the following handles as having been updated %@", buf, 0xCu);
        }

      }
      objc_msgSend(v22, "description");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Peer Device Updated Handled Nicknames"), v98);
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      obj = v22;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v134;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v134 != v27)
              objc_enumerationMutation(obj);
            v29 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
            -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("rid"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
            {
              v143 = v29;
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("rid"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v144 = v33;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDNicknameController markProfileRecordsAsIgnored:broadcastUpdates:](self, "markProfileRecordsAsIgnored:broadcastUpdates:", v34, 0);

            }
          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
        }
        while (v26);
      }

      -[IMDNicknameController defaults](self, "defaults");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setValue:forDomain:forKey:", v105, v100, v6);
    }
    else
    {
      objc_msgSend(v102, "objectForKey:", MessageDictionaryPendingNicknameUpdatesRecordIDsKey);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectForKey:", MessageDictionaryCurrentNicknameUpdatesRecordIDsKey);
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "objectForKey:", MessageDictionaryArchivedNicknameUpdatesRecordIDsKey);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v107 || !obj || !v98)
      {

        goto LABEL_91;
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      -[IMDNicknameController archivedNicknames](self, "archivedNicknames");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "allValues");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v130;
        do
        {
          for (j = 0; j != v37; ++j)
          {
            if (*(_QWORD *)v130 != v38)
              objc_enumerationMutation(v36);
            v40 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * j);
            objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("rid"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("rid"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "addObject:", v42);

            }
          }
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v129, v142, 16);
        }
        while (v37);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      -[IMDNicknameController handledNicknames](self, "handledNicknames");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "allValues");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v125, v141, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v126;
        do
        {
          for (k = 0; k != v45; ++k)
          {
            if (*(_QWORD *)v126 != v46)
              objc_enumerationMutation(v44);
            v48 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * k);
            objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("rid"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("rid"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "addObject:", v50);

            }
          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v125, v141, 16);
        }
        while (v45);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "allValues");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
      if (v53)
      {
        v54 = *(_QWORD *)v122;
        do
        {
          for (m = 0; m != v53; ++m)
          {
            if (*(_QWORD *)v122 != v54)
              objc_enumerationMutation(v52);
            v56 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * m);
            objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("rid"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("rid"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "addObject:", v58);

            }
          }
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
        }
        while (v53);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v98);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v106, "mutableCopy");
      objc_msgSend(v59, "minusSet:", v96);
      v94 = (void *)objc_msgSend(v96, "mutableCopy");
      objc_msgSend(v94, "minusSet:", v106);
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v103 = v59;
      v60 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
      if (v60)
      {
        v61 = *(_QWORD *)v118;
        do
        {
          for (n = 0; n != v60; ++n)
          {
            if (*(_QWORD *)v118 != v61)
              objc_enumerationMutation(v103);
            v63 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * n);
            -[IMDNicknameController nicknameForRecordID:](self, "nicknameForRecordID:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "handle");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (v65)
            {
              -[IMDNicknameController archivedNicknames](self, "archivedNicknames");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "handle");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setValue:forKey:", 0, v67);

              objc_msgSend(v64, "handle");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDNicknameController _deleteHandleIDFromArchivedMap:](self, "_deleteHandleIDFromArchivedMap:", v68);

              -[IMDNicknameController activeRecords](self, "activeRecords");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "handle");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKey:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "isEqualToString:", v63);

              if ((v72 & 1) == 0)
                -[IMDNicknameController _deleteOnDiskDataIfNeededForNickname:withNewNickname:](self, "_deleteOnDiskDataIfNeededForNickname:withNewNickname:", v64, 0);
            }

          }
          v60 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
        }
        while (v60);
      }

      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v73 = v94;
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v138, 16);
      if (v74)
      {
        v75 = *(_QWORD *)v114;
        do
        {
          for (ii = 0; ii != v74; ++ii)
          {
            if (*(_QWORD *)v114 != v75)
              objc_enumerationMutation(v73);
            -[IMDNicknameController nicknameForRecordID:](self, "nicknameForRecordID:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * ii));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "handle");
            v78 = (void *)objc_claimAutoreleasedReturnValue();

            if (v78)
            {
              -[IMDNicknameController _markCurrentNicknameAsArchived:incrementPendingNicknameVersion:](self, "_markCurrentNicknameAsArchived:incrementPendingNicknameVersion:", v77, 0);
              -[IMDNicknameController handledNicknames](self, "handledNicknames");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "handle");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "setValue:forKey:", 0, v80);

              objc_msgSend(v77, "handle");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDNicknameController _deleteHandleIDFromHandledMap:](self, "_deleteHandleIDFromHandledMap:", v81);

            }
          }
          v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v113, v138, 16);
        }
        while (v74);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", obj);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = (void *)objc_msgSend(v105, "mutableCopy");
      objc_msgSend(v93, "minusSet:", v95);
      v82 = (void *)objc_msgSend(v95, "mutableCopy");
      objc_msgSend(v82, "minusSet:", v105);
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v83 = v82;
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v109, v137, 16);
      if (v84)
      {
        v85 = *(_QWORD *)v110;
        v86 = (uint64_t *)MEMORY[0x1E0D38B20];
        do
        {
          for (jj = 0; jj != v84; ++jj)
          {
            if (*(_QWORD *)v110 != v85)
              objc_enumerationMutation(v83);
            v88 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * jj);
            -[IMDNicknameController nicknameForRecordID:](self, "nicknameForRecordID:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v107, "containsObject:", v88))
              v90 = 12;
            else
              v90 = *v86;
            -[IMDNicknameController _markPendingNicknameAsCurrent:incrementPendingNicknameVersion:updateType:broadcastUpdates:](self, "_markPendingNicknameAsCurrent:incrementPendingNicknameVersion:updateType:broadcastUpdates:", v89, 0, v90, 0);

          }
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v109, v137, 16);
        }
        while (v84);
      }

      -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
      -[IMDNicknameController defaults](self, "defaults");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setValue:forDomain:forKey:", v92, v100, v97);

    }
  }
  else if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v101);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v147 = v19;
      v148 = 2112;
      v149 = v20;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Received older version number (%@, old: %@), dropping pending nickname update", buf, 0x16u);

    }
  }
LABEL_91:

}

- (void)_showDebugAlertWithHeader:(id)a3 message:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)a4;
  v7 = IMOSLoggingEnabled(v6);
  if ((_DWORD)v7)
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Alert header: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Alert message: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  if (IMEnableNicknamesDebug())
    CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, v5, v6, CFSTR("OK"));

}

- (void)_updateCloudKitRecordIDAndDecryptionKeyIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryPersonalNicknameDecryptKeyKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameWallpaperTagKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameLowResWallpaperTagKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameWallpaperMetadataTagKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryPersonalNicknameRecordIDKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D14ECA68;
    v10[3] = &unk_1E922BFF8;
    objc_copyWeak(&v16, &location);
    v11 = v9;
    v12 = v5;
    v13 = v6;
    v14 = v7;
    v15 = v8;
    -[IMDNicknameController currentPersonalNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:completionBlock:](self, "currentPersonalNicknameWithRecordID:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:completionBlock:", v11, v12, v13, v14, v15, v10);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);

}

- (void)_updateHandleDenyAllowListIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  unint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", MessageDictionaryNicknameDenyAllowListVersionKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D38B48];
  v9 = *MEMORY[0x1E0D38B40];
  objc_msgSend(v7, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v48 = v6;
        v49 = 2048;
        v50 = v11;
        _os_log_impl(&dword_1D1413000, v42, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping deny/allow list update", buf, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameDenyListKey);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameAllowListKey);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled(v45))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v48 = v6;
        v49 = 2048;
        v50 = v11;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Received newer version number (%lu, old: %lu), updating the deny/allow list store", buf, 0x16u);
      }

    }
    if (IMEnableNicknamesDebug())
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E92346B0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController handleDenyList](self, "handleDenyList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "arrayByExcludingObjectsInArray:", v16);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDNicknameController handleDenyList](self, "handleDenyList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByExcludingObjectsInArray:", v46);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDNicknameController handleAllowList](self, "handleAllowList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "arrayByExcludingObjectsInArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDNicknameController handleAllowList](self, "handleAllowList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "arrayByExcludingObjectsInArray:", v45);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v44, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deny list added: %@\n"), v44);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v25);

      }
      if (objc_msgSend(v43, "count"))
      {
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v14, "appendString:", CFSTR("\n"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deny list removed: %@"), v43);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v26);

      }
      if (objc_msgSend(v21, "count"))
      {
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v14, "appendString:", CFSTR("\n"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow list added: %@"), v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v27);

      }
      if (objc_msgSend(v24, "count"))
      {
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v14, "appendString:", CFSTR("\n"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allow list removed: %@"), v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v28);

      }
      if (objc_msgSend(v14, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E92346B0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "count") || objc_msgSend(v43, "count"))
          objc_msgSend(v29, "appendString:", CFSTR("Deny list"));
        if (objc_msgSend(v21, "count") || objc_msgSend(v24, "count"))
        {
          if (objc_msgSend(v29, "length"))
            objc_msgSend(v29, "appendString:", CFSTR(" and "));
          objc_msgSend(v29, "appendString:", CFSTR("Allow list"));
        }
        objc_msgSend(v29, "appendString:", CFSTR(" Updated from Peer Device"));
        -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", v29, v14);

      }
    }
    -[IMDNicknameController _clearSharingLists](self, "_clearSharingLists");
    -[IMDNicknameController handleDenyList](self, "handleDenyList");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v46);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateHandleList:withHandles:forKey:broadcastUpdates:](self, "_updateHandleList:withHandles:forKey:broadcastUpdates:", v30, v31, CFSTR("handleBlacklist"), 0);

    -[IMDNicknameController handleAllowList](self, "handleAllowList");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateHandleList:withHandles:forKey:broadcastUpdates:](self, "_updateHandleList:withHandles:forKey:broadcastUpdates:", v32, v33, CFSTR("handleWhitelist"), 0);

    if (IMOSLoggingEnabled(v34))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Broadcasting changes to the deny and allow list", buf, 2u);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "broadcasterForAccountListeners");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController denyListedHandlesForSharing](self, "denyListedHandlesForSharing");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "updateNicknameHandlesForSharing:blocked:", v38, v39);

    -[IMDNicknameController defaults](self, "defaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setValue:forDomain:forKey:", v41, v8, v9);

  }
}

- (void)_updateHandleTransitionedListIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", MessageDictionaryNicknameTransitionedListVersionKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D38B48];
  v9 = *MEMORY[0x1E0D38BB8];
  objc_msgSend(v7, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameTransitionedListKey);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = 134218240;
        v22 = v6;
        v23 = 2048;
        v24 = v11;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping transitioned list update", (uint8_t *)&v21, 0x16u);
      }

    }
  }
  else
  {
    -[IMDNicknameController _clearTransitionedList](self, "_clearTransitionedList");
    -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateTransitionList:withHandles:forKey:broadcastUpdates:](self, "_updateTransitionList:withHandles:forKey:broadcastUpdates:", v14, v15, CFSTR("handleTransitionedList"), 0);

    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Broadcasting changes to the transitioned list", (uint8_t *)&v21, 2u);
      }

    }
    -[IMDNicknameController broadcastTransitionedHandlesDidChange](self, "broadcastTransitionedHandlesDidChange");
    -[IMDNicknameController defaults](self, "defaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setValue:forDomain:forKey:", v19, v8, v9);

  }
}

- (void)_updateActiveNicknameRecordsListIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", MessageDictionaryNicknameActiveListVersionKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D38B48];
  v9 = *MEMORY[0x1E0D38B38];
  objc_msgSend(v7, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameActiveListKey);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = 134218240;
        v24 = v6;
        v25 = 2048;
        v26 = v11;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping active list update", (uint8_t *)&v23, 0x16u);
      }

    }
  }
  else
  {
    -[IMDNicknameController _clearActiveNicknameRecords](self, "_clearActiveNicknameRecords");
    -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateActiveList:withRecords:broadcastUpdates:](self, "_updateActiveList:withRecords:broadcastUpdates:", v14, v13, 0);

    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Broadcasting changes to the active list", (uint8_t *)&v23, 2u);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "broadcasterForAccountListeners");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController activeRecords](self, "activeRecords");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateActiveNicknameRecords:", v19);

    -[IMDNicknameController defaults](self, "defaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setValue:forDomain:forKey:", v21, v8, v9);

  }
}

- (void)_updateIgnoredNicknameRecordsListIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", MessageDictionaryNicknameIgnoredListVersionKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D38B48];
  v9 = *MEMORY[0x1E0D38B58];
  objc_msgSend(v7, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B58]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", MessageDictionaryNicknameIgnoredListKey);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v29 = 134218240;
        v30 = v6;
        v31 = 2048;
        v32 = v11;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping ignored list update", (uint8_t *)&v29, 0x16u);
      }

    }
  }
  else
  {
    -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToDictionary:", v13);

    if (v15)
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Received identical ignoredList. Ignoring.", (uint8_t *)&v29, 2u);
        }

      }
      -[IMDNicknameController defaults](self, "defaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValue:forDomain:forKey:", v19, v8, v9);

    }
    else
    {
      -[IMDNicknameController _clearIgnoredNicknameRecords](self, "_clearIgnoredNicknameRecords");
      -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _updateIgnoredList:withRecords:broadcastUpdates:](self, "_updateIgnoredList:withRecords:broadcastUpdates:", v21, v13, 0);

      if (IMOSLoggingEnabled(v22))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Broadcasting changes to the ignored list", (uint8_t *)&v29, 2u);
        }

      }
      +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "broadcasterForAccountListeners");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController ignoredRecords](self, "ignoredRecords");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "updateIgnoredNicknameRecords:", v26);

      -[IMDNicknameController defaults](self, "defaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setValue:forDomain:forKey:", v28, v8, v9);

    }
  }

}

- (id)_diffActiveRecords:(id)a3 againstPrevious:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Checking new active list: %@, against previous active list: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v13, (_QWORD)v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15 || (objc_msgSend(v14, "isEqualToString:", v15) & 1) == 0)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Sending active records diff: %@", buf, 0xCu);
    }

  }
  v18 = (void *)objc_msgSend(v8, "copy", (_QWORD)v20);

  return v18;
}

- (void)_updateDenyAllowListHandlesVersion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38B48];
  v5 = *MEMORY[0x1E0D38B40];
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forDomain:forKey:", v10, v4, v5);

  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updated allow list handles version to %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)_updateTransitionedListHandlesVersion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38B48];
  v5 = *MEMORY[0x1E0D38BB8];
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forDomain:forKey:", v10, v4, v5);

  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updated transitioned list handles version to %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)_updateIsActiveListHandlesVersion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38B48];
  v5 = *MEMORY[0x1E0D38B38];
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forDomain:forKey:", v10, v4, v5);

  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updated active list handles version to %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)_updateIsIgnoredListHandlesVersion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38B48];
  v5 = *MEMORY[0x1E0D38B58];
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forDomain:forKey:", v10, v4, v5);

  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updated ignored list handles version to %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)_syncHandleAllowDenyListToOtherDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController handleAllowList](self, "handleAllowList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController handleDenyList](self, "handleDenyList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:
  -[IMDNicknameController defaults](self, "defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B40]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v12[0] = MessageDictionaryNicknameDenyListKey;
  v12[1] = MessageDictionaryNicknameAllowListKey;
  v13[0] = v6;
  v13[1] = v4;
  v12[2] = MessageDictionaryNicknameDenyAllowListVersionKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController _sendMessageDictionary:toDevice:](self, "_sendMessageDictionary:toDevice:", v11, 0);
}

- (void)_syncHandleTransitionedListToOtherDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMDNicknameController defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v10[0] = MessageDictionaryNicknameTransitionedListKey;
  v10[1] = MessageDictionaryNicknameTransitionedListVersionKey;
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController _sendMessageDictionary:toDevice:](self, "_sendMessageDictionary:toDevice:", v9, 0);
}

- (void)_syncActiveNicknameRecordsToOtherDevices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMDNicknameController defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v9[0] = MessageDictionaryNicknameActiveListKey;
  v9[1] = MessageDictionaryNicknameActiveListVersionKey;
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController _sendMessageDictionary:toDevice:](self, "_sendMessageDictionary:toDevice:", v8, 0);
}

- (void)_syncIgnoredNicknameRecordsToOtherDevices
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[IMDNicknameController defaults](self, "defaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B58]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v13[0] = MessageDictionaryNicknameIgnoredListKey;
  v13[1] = MessageDictionaryNicknameIgnoredListVersionKey;
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = v6;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Sending ignored list to peer devices, with current version: %lu", (uint8_t *)&v11, 0xCu);
    }

  }
  -[IMDNicknameController _sendMessageDictionary:toDevice:](self, "_sendMessageDictionary:toDevice:", v8, 0);

}

- (BOOL)_requestingToSendLocalNicknameInfo:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "objectForKey:", MessageDictionaryNicknameRequestPersonalNicknameInfoKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)handleNicknameUpdatesFromPeerDevice:(id)a3 fromPeerDevice:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v8)
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Nickname Updates from Peer Device"), v9);

    v10 = -[IMDNicknameController _requestingToSendLocalNicknameInfo:](self, "_requestingToSendLocalNicknameInfo:", v6);
    if (v10)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v7;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "We got a request to send nickname info to a specific device %@", (uint8_t *)&v13, 0xCu);
        }

      }
      -[IMDNicknameController sendPersonalNicknameRecordIDAndVersionRequestedByDevice:](self, "sendPersonalNicknameRecordIDAndVersionRequestedByDevice:", v7);
    }
    else
    {
      -[IMDNicknameController _updateSharingPreferencesIfNeededFromMadridMessage:](self, "_updateSharingPreferencesIfNeededFromMadridMessage:", v6);
      -[IMDNicknameController _updateCloudKitRecordIDAndDecryptionKeyIfNeeded:](self, "_updateCloudKitRecordIDAndDecryptionKeyIfNeeded:", v6);
      -[IMDNicknameController _updateNicknameListsIfNeeded:](self, "_updateNicknameListsIfNeeded:", v6);
      -[IMDNicknameController _updateHandleDenyAllowListIfNeeded:](self, "_updateHandleDenyAllowListIfNeeded:", v6);
      -[IMDNicknameController _updateHandleTransitionedListIfNeeded:](self, "_updateHandleTransitionedListIfNeeded:", v6);
      -[IMDNicknameController _updateActiveNicknameRecordsListIfNeeded:](self, "_updateActiveNicknameRecordsListIfNeeded:", v6);
      -[IMDNicknameController _updateIgnoredNicknameRecordsListIfNeeded:](self, "_updateIgnoredNicknameRecordsListIfNeeded:", v6);
    }
  }
  else if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Nickname feature is disabled, ignoring updates from peer device", (uint8_t *)&v13, 2u);
    }

  }
}

- (void)_updateNameOnlyUpdateForMessage:(id)a3 fromHandleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSMutableDictionary *pendingNicknameUpdates;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v27 = 136315650;
      v28 = "-[IMDNicknameController _updateNameOnlyUpdateForMessage:fromHandleID:]";
      v29 = 2112;
      v30 = v7;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "%s fromHandleID: %@, message: %@", (uint8_t *)&v27, 0x20u);
    }

  }
  v9 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v9)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("FirstName"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("LastName"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v10 | v11)
    {
      -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v7);
      v13 = objc_claimAutoreleasedReturnValue();

      -[IMDNicknameController handledNicknames](self, "handledNicknames");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", v7);
      v15 = objc_claimAutoreleasedReturnValue();

      v17 = v13;
      if ((v13 || (v17 = v15) != 0)
        && (v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v17),
            (v18 = v16) != 0))
      {
        objc_msgSend(v16, "setFirstName:", v10);
        v19 = IMOSLoggingEnabled(objc_msgSend(v18, "setLastName:", v11));
        if (v13)
        {
          if (v19)
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              LOWORD(v27) = 0;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Found an existing nickname, updating name", (uint8_t *)&v27, 2u);
            }

          }
          -[IMDNicknameController _deleteHandleIDFromPendingMap:](self, "_deleteHandleIDFromPendingMap:", v7);
        }
        else if (v19)
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v27) = 0;
            _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Found a handled nickname, updating name", (uint8_t *)&v27, 2u);
          }

        }
      }
      else
      {
        if (IMOSLoggingEnabled(v16))
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            LOWORD(v27) = 0;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "No nickname exist, creating a pending one", (uint8_t *)&v27, 2u);
          }

        }
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithFirstName:lastName:avatar:pronouns:", v10, v11, 0, 0);
      }
      pendingNicknameUpdates = self->_pendingNicknameUpdates;
      objc_msgSend(v18, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](pendingNicknameUpdates, "setObject:forKey:", v24, v7);

      -[IMDNicknameController pendingNicknameUpdatesKVStore](self, "pendingNicknameUpdatesKVStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v25, v18);

      -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
      -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");

    }
    else
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1D16695E8();
    }

  }
  else if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Nickname feature is disabled, ignoring updates from peer device", (uint8_t *)&v27, 2u);
    }

  }
}

- (void)sendPendingNicknameUpdatesDidChange
{
  id v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMDNicknameController _updateMessageDictionaryWithPendingNicknameUpdates:](self, "_updateMessageDictionaryWithPendingNicknameUpdates:", v4);
  -[IMDNicknameController _updateMessageDictionaryWithNicknameUpdateRecordIDs:](self, "_updateMessageDictionaryWithNicknameUpdateRecordIDs:", v3);
  -[IMDNicknameController _sendMessageDictionary:toDevice:sendType:](self, "_sendMessageDictionary:toDevice:sendType:", v4, 0, 1);
  -[IMDNicknameController _sendMessageDictionary:toDevice:sendType:](self, "_sendMessageDictionary:toDevice:sendType:", v3, 0, 2);

}

- (BOOL)_isNicknamesSharingEnabled
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  else
    v5 = 0;

  return v5;
}

- (void)sendNicknamePreferencesDidChange
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = -[IMDNicknameController _isNicknamesSharingEnabled](self, "_isNicknamesSharingEnabled");
  if (v3)
  {
    -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      if (IMOSLoggingEnabled(v6))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Nicknames enabled, and we already have one in cloudkit. Broadcasting to my other devices.", v11, 2u);
        }

      }
      -[IMDNicknameController sendPersonalNicknameRecordIDAndVersionToAllPeers](self, "sendPersonalNicknameRecordIDAndVersionToAllPeers");
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v3))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Nicknames not enabled, deleting the one we know about.", buf, 2u);
      }

    }
    -[IMDNicknameController storedPersonalNickname](self, "storedPersonalNickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[IMDNicknameController deleteAllPersonalNicknames:withCompletion:](self, "deleteAllPersonalNicknames:withCompletion:", 1, 0);
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "No nickname stored locally. Not querying CK.", v12, 2u);
      }

    }
  }
}

- (void)sendPersonalNicknameRecordIDAndVersionRequestedByDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDNicknameController messageDictionaryWithPersonalRecordIDAndVersion](self, "messageDictionaryWithPersonalRecordIDAndVersion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController _sendMessageDictionary:toDevice:](self, "_sendMessageDictionary:toDevice:", v5, v4);

}

- (void)sendPersonalNicknameRecordIDAndVersionToAllPeers
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[IMDNicknameController messageDictionaryWithPersonalRecordIDAndVersion](self, "messageDictionaryWithPersonalRecordIDAndVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "We should send personal nickname info to all of our own devices", v5, 2u);
    }

  }
  -[IMDNicknameController _sendMessageDictionary:toDevice:](self, "_sendMessageDictionary:toDevice:", v3, 0);

}

- (BOOL)_sendMessageDictionary:(id)a3 toDevice:(id)a4
{
  return -[IMDNicknameController _sendMessageDictionary:toDevice:sendType:](self, "_sendMessageDictionary:toDevice:sendType:", a3, a4, 3);
}

- (BOOL)_sendMessageDictionary:(id)a3 toDevice:(id)a4 sendType:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  IDSService *nicknameService;
  id v32;
  id v33;
  void *v34;
  int v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  char v53;
  char v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _QWORD v87[2];
  _QWORD v88[2];
  void *v89;
  uint8_t v90[128];
  uint8_t buf[4];
  id v92;
  __int16 v93;
  unint64_t v94;
  __int16 v95;
  id v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v92 = v7;
      v93 = 2048;
      v94 = a5;
      v95 = 2112;
      v96 = v64;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Asked to send dictionary to device: %@, send type: %lu, dict: %@", buf, 0x20u);
    }

  }
  v9 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v9)
  {
    if (v64)
    {
      -[IDSService devices](self->_nicknameService, "devices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v7)
      {
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
        if (!v13)
        {
LABEL_16:

LABEL_28:
          LOBYTE(v22) = 0;
          if ((a5 & 1) == 0)
            goto LABEL_96;
          goto LABEL_57;
        }
        v14 = *(_QWORD *)v81;
LABEL_10:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v81 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v15);
          v79 = 0;
          v17 = (id)IDSCopyTokenAndIDForTokenWithID();
          v18 = 0;
          objc_msgSend(v16, "pushToken");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToData:", v18);

          if ((v20 & 1) != 0)
            break;

          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
            if (v13)
              goto LABEL_10;
            goto LABEL_16;
          }
        }
        v89 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if ((a5 & 2) == 0)
        {
          v12 = v11;
          goto LABEL_28;
        }
        v23 = 0;
      }
      else
      {
        v23 = a5 & 1;
        if ((a5 & 2) == 0)
          goto LABEL_51;
      }
      if (objc_msgSend(v11, "count"))
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v64);
        objc_msgSend(v24, "setObject:forKey:", CFSTR("NicknamesDidUpdate"), CFSTR("MessageType"));
        v87[0] = *MEMORY[0x1E0D341C8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v87[1] = *MEMORY[0x1E0D34120];
        v88[0] = v25;
        v88[1] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v12 = v11;
        v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v76;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v76 != v28)
                objc_enumerationMutation(v12);
              v30 = (void *)IDSCopyIDForDevice();
              if (v30)
                objc_msgSend(v26, "addObject:", v30);

            }
            v27 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
          }
          while (v27);
        }

        nicknameService = self->_nicknameService;
        v73 = 0;
        v74 = 0;
        v22 = objc_msgSend(MEMORY[0x1E0D39888], "service:sendMessage:toDestinations:priority:options:identifier:error:", nicknameService, v24, v26, 300, v60, &v74, &v73);
        v32 = v74;
        v33 = v73;
        v34 = v33;
        if (v33)
          v35 = 0;
        else
          v35 = v22;
        if (v35 == 1)
        {
          if (!IMOSLoggingEnabled(v33))
            goto LABEL_56;
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v92 = v32;
            v93 = 2112;
            v94 = (unint64_t)v26;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "Successfully sent nickname to message (%@) to destinations %@", buf, 0x16u);
          }
        }
        else
        {
          IMLogHandleForCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_1D1669614();
        }

LABEL_56:
        if ((v23 & 1) != 0)
        {
LABEL_57:
          v37 = objc_alloc(MEMORY[0x1E0D34358]);
          v38 = (void *)objc_msgSend(v37, "initWithService:", *MEMORY[0x1E0D34240]);
          objc_msgSend(v38, "devices");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "anySessionForServiceName:", *MEMORY[0x1E0D38F68]);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61 && (v40 = objc_msgSend(v64, "count")) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = 0u;
            v72 = 0u;
            v69 = 0u;
            v70 = 0u;
            v43 = v41;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
            if (v44)
            {
              v45 = *(_QWORD *)v70;
              do
              {
                for (j = 0; j != v44; ++j)
                {
                  if (*(_QWORD *)v70 != v45)
                    objc_enumerationMutation(v43);
                  v47 = (void *)IDSCopyIDForDevice();
                  if (v47)
                    objc_msgSend(v42, "addObject:", v47);

                }
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
              }
              while (v44);
            }

            v67 = 0u;
            v68 = 0u;
            v65 = 0u;
            v66 = 0u;
            v48 = v59;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v66;
              do
              {
                for (k = 0; k != v49; ++k)
                {
                  if (*(_QWORD *)v66 != v50)
                    objc_enumerationMutation(v48);
                  v52 = (void *)IDSCopyIDForDevice();
                  v53 = objc_msgSend(v42, "containsObject:", v52);
                  if (v52)
                    v54 = v53;
                  else
                    v54 = 1;
                  if ((v54 & 1) == 0)
                  {
                    if (v7)
                    {
                      if (objc_msgSend(v52, "isEqualToString:", v7))
                      {
                        objc_msgSend(v63, "addObject:", v52);

                        goto LABEL_88;
                      }
                    }
                    else
                    {
                      objc_msgSend(v63, "addObject:", v52);
                    }
                  }

                }
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v65, v84, 16);
              }
              while (v49);
            }
LABEL_88:

            v56 = objc_msgSend(v63, "count");
            if (v56)
            {
              if (IMOSLoggingEnabled(v56))
              {
                OSLogHandleForIMFoundationCategory();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v92 = v63;
                  _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "Sending nickname info to destinations %@", buf, 0xCu);
                }

              }
              LOBYTE(v22) = objc_msgSend(v61, "sendNicknameUpdatesToPeerDevices:toDestinations:", v64, v63);
            }

          }
          else if (IMOSLoggingEnabled(v40))
          {
            OSLogHandleForIMFoundationCategory();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v92 = v61;
              v93 = 2112;
              v94 = (unint64_t)v64;
              _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "We could not find a service session for imessage to send the nickname info or no contents in message dictionary %@ %@", buf, 0x16u);
            }

          }
        }
LABEL_96:

        goto LABEL_97;
      }
LABEL_51:
      LOBYTE(v22) = 0;
      v12 = v11;
      if (v23)
        goto LABEL_57;
      goto LABEL_96;
    }
    if (IMOSLoggingEnabled(v9))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Was asked to send a nil dictionary, bailing", buf, 2u);
      }
LABEL_24:

    }
  }
  else if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not sending updates to peers", buf, 2u);
    }
    goto LABEL_24;
  }
  LOBYTE(v22) = 0;
LABEL_97:

  return v22;
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  _BOOL8 v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  IMDHandle *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  NSObject *v29;
  IMDNicknameController *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  IMDNicknameController *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v31 = a4;
  v6 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  LOBYTE(a4) = v6;
  v7 = IMOSLoggingEnabled(v6);
  if ((a4 & 1) != 0)
  {
    v30 = self;
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v32;
        v48 = 2112;
        v49 = v31;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Sending name only to: %@ from: %@", buf, 0x16u);
      }

    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v10 = v32;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v10);
          v14 = -[IMDHandle initWithID:unformattedID:countryCode:]([IMDHandle alloc], "initWithID:unformattedID:countryCode:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), 0);
          objc_msgSend(v9, "addObject:", v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v11);
    }

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v9;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v20, "ID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "_appearsToBePhoneNumber");

          objc_msgSend(v20, "ID");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
          {
            v25 = (void *)IDSCopyIDForPhoneNumber();
            objc_msgSend(v15, "setObject:forKey:", v20, v25);

          }
          else
          {
            v26 = -[NSObject _appearsToBeEmail](v23, "_appearsToBeEmail");

            if (v26)
            {
              objc_msgSend(v20, "ID");
              v24 = objc_claimAutoreleasedReturnValue();
              v27 = (void *)MEMORY[0x1D17E94E0]();
              objc_msgSend(v15, "setObject:forKey:", v20, v27);

            }
            else
            {
              IMLogHandleForCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                sub_1D1669674(buf, v20, &v47, v24);
            }
          }

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v17);
    }

    objc_msgSend(v15, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_1D14F02F0;
    v33[3] = &unk_1E922C020;
    v34 = v31;
    v35 = v30;
    -[IMDNicknameController _getDevicesForBothNicknameServices:removeNewServiceURIsFromIMessageList:completionHandler:](v30, "_getDevicesForBothNicknameServices:removeNewServiceURIsFromIMessageList:completionHandler:", v28, 0, v33);

  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not sending personal nickname to chat", buf, 2u);
    }

  }
}

- (void)queueChatToSendNicknamePostUploadIfNeeded:(id)a3
{
  id v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *chatsToSendNicknameInfoTo;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMDNicknameController nicknameIsUploadingToCK](self, "nicknameIsUploadingToCK");
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "guid");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "We are still uploading the nickname to iCloud, queue to send info out of band for chat %@", (uint8_t *)&v12, 0xCu);

      }
    }
    if (!self->_chatsToSendNicknameInfoTo)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      chatsToSendNicknameInfoTo = self->_chatsToSendNicknameInfoTo;
      self->_chatsToSendNicknameInfoTo = v8;

    }
    -[IMDNicknameController chatsToSendNicknameInfoTo](self, "chatsToSendNicknameInfoTo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

- (void)_getDevicesForBothNicknameServices:(id)a3 removeNewServiceURIsFromIMessageList:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  NSObject *v10;
  void (**v11)(id, _QWORD);
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  if (!objc_msgSend(v7, "count"))
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[IMDNicknameController _getDevicesForBothNicknameServices:removeNewServiceURIsFromIMessageList:completionHandler:]";
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "idsHandles were nil or empty returning from %s", buf, 0xCu);
      }

    }
    v8[2](v8, 0);
  }
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14F0A04;
  block[3] = &unk_1E922C048;
  v16 = a4;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_sendPersonalNicknameToRecipients_chatGUID_fromHandle_onlyUseNicknameSendingService_);
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlyUseNicknameSendingService:(BOOL)a6
{
  MEMORY[0x1E0DE7D20](self, sel_sendPersonalNicknameToRecipients_chatGUID_fromHandle_onlyUseNicknameSendingService_onlySendToThoseLoggedOutOfIMessage_);
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlySendToThoseLoggedOutOfIMessage:(BOOL)a6
{
  MEMORY[0x1E0DE7D20](self, sel_sendPersonalNicknameToRecipients_chatGUID_fromHandle_onlyUseNicknameSendingService_onlySendToThoseLoggedOutOfIMessage_);
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlyUseNicknameSendingService:(BOOL)a6 onlySendToThoseLoggedOutOfIMessage:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  _BOOL8 v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  BOOL v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  IMDNicknameController *v40;
  BOOL v41;
  BOOL v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v7 = a7;
  v54 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v34 = a4;
  v12 = a5;
  v13 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v13)
  {
    v14 = -[IMDNicknameController newNicknameInfoToSend](self, "newNicknameInfoToSend");
    v33 = v14;
    if (v14)
    {
      v31 = v7;
      v32 = a6;
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v49 = v35;
          v50 = 2112;
          v51 = v34;
          v52 = 2112;
          v53 = v12;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Attempting to send nickname to recipients: %@ on chat %@ from handle: %@", buf, 0x20u);
        }

      }
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v35;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v44 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            if (v21)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "ID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "_appearsToBePhoneNumber");

              objc_msgSend(v21, "ID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v23)
              {
                v26 = (void *)IDSCopyIDForPhoneNumber();

              }
              else
              {
                v27 = objc_msgSend(v24, "_appearsToBeEmail");

                if (!v27)
                  continue;
                objc_msgSend(v21, "ID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = (void *)MEMORY[0x1D17E94E0]();

              }
              if (v26)
                -[NSObject setObject:forKey:](v16, "setObject:forKey:", v21, v26);

            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v18);
      }

      -[NSObject allKeys](v16, "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = sub_1D14F1534;
      v36[3] = &unk_1E922C070;
      v37 = v12;
      v41 = v31;
      v38 = v34;
      v39 = v33;
      v40 = self;
      v42 = v32;
      -[IMDNicknameController _getDevicesForBothNicknameServices:removeNewServiceURIsFromIMessageList:completionHandler:](self, "_getDevicesForBothNicknameServices:removeNewServiceURIsFromIMessageList:completionHandler:", v29, !v31, v36);

    }
    else
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1D166977C();
    }

  }
  else if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not sending personal nickname to chat", buf, 2u);
    }

  }
}

- (id)_typeOfNicknameUpdateToShare
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", 15);
}

- (id)newNicknameInfoToSend
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  -[IMDNicknameController nickNameDecryptionKey](self, "nickNameDecryptionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController wallpaperDataTag](self, "wallpaperDataTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController lowResWallpaperDataTag](self, "lowResWallpaperDataTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController wallpaperMetadataTag](self, "wallpaperMetadataTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "length");
  if (v8 && (v8 = objc_msgSend(v7, "length")) != 0)
  {
    v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v9;
    if (v7)
      CFDictionarySetValue(v9, MessageDictionaryNicknameCloudKitRecordKey, v7);
    if (v3)
      CFDictionarySetValue(v10, MessageDictionaryNicknameCloudKitDecryptionRecordKey, v3);
    -[IMDNicknameController _typeOfNicknameUpdateToShare](self, "_typeOfNicknameUpdateToShare");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      CFDictionarySetValue(v10, MessageDictionaryNicknameUpdateInfoIncluded, v11);

    -[IMDNicknameController personalNickname](self, "personalNickname");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wallpaper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      NSStringFromBOOL();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        CFDictionarySetValue(v10, MessageDictionaryWallpaperUpdateKey, v14);

      if (v4)
        CFDictionarySetValue(v10, MessageDictionaryNicknameWallpaperTagKey, v4);
      if (v5)
        CFDictionarySetValue(v10, MessageDictionaryNicknameLowResWallpaperTagKey, v5);
      if (v6)
        CFDictionarySetValue(v10, MessageDictionaryNicknameWallpaperMetadataTagKey, v6);
    }
  }
  else
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "User does not have a nickname set, not adding nickname information", v17, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (id)_idsDeviceFromPushToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
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
  -[IMDNicknameController nicknameService](self, "nicknameService", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "pushToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToData:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  NSObject *v52;
  const __CFString *v53;
  NSObject *v54;
  uint64_t v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  __CFString *v62;
  id v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34870]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34890]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_FTOptionallyDecompressData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeDictionary();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v66 = (uint64_t)v13;
      v67 = 2112;
      v68 = v18;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Received a nickname update from: %@, with message: %@", buf, 0x16u);
    }

  }
  if (IMSharedHelperNickNameEnabled())
  {
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(v18, "_stringForKey:", CFSTR("MessageType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("NicknamesDidUpdate"));

      objc_msgSend(v18, "_stringForKey:", MessageDictionaryNicknameCloudKitRecordKey);
      v61 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dataForKey:", CFSTR("CloudKitDecryptionRecordKey"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dataForKey:", MessageDictionaryNicknameWallpaperTagKey);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dataForKey:", MessageDictionaryNicknameLowResWallpaperTagKey);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_dataForKey:", MessageDictionaryNicknameWallpaperMetadataTagKey);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_stringForKey:", CFSTR("WallpaperUpdateKey"));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = CFSTR("NO");
      if (v23)
        v25 = (__CFString *)v23;
      v62 = v25;

      v26 = NSBOOLFromString();
      v56 = v26;
      if (IMOSLoggingEnabled(v26))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v66 = v61;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "This message came from user with nickname cloudKitRecord  %@", buf, 0xCu);
        }

      }
      objc_msgSend(v18, "_stringForKey:", CFSTR("MessageType"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("NameOnlyUpdate"));

      v31 = IMOSLoggingEnabled(v30);
      if (v22)
      {
        if (v31)
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v13;
            _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "This is a personal nickname update from: %@", buf, 0xCu);
          }

        }
        v33 = (id)IDSCopyTokenAndIDForTokenWithID();
        v34 = 0;
        -[IMDNicknameController _idsDeviceFromPushToken:](self, "_idsDeviceFromPushToken:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          -[IMDNicknameController handleNicknameUpdatesFromPeerDevice:fromPeerDevice:](self, "handleNicknameUpdatesFromPeerDevice:fromPeerDevice:", v18, v13);
        }
        else
        {
          IMLogHandleForCategory();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            sub_1D1669818();

        }
      }
      else if (v29)
      {
        if (v31)
        {
          OSLogHandleForIMFoundationCategory();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v13;
            _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, "This is a name only nickname update from: %@", buf, 0xCu);
          }

        }
        v46 = (void *)IDSCopyAddressDestinationForDestination();
        v47 = (void *)IDSCopyRawAddressForDestination();

        -[IMDNicknameController _updateNameOnlyUpdateForMessage:fromHandleID:](self, "_updateNameOnlyUpdateForMessage:fromHandleID:", v18, v47);
      }
      else
      {
        if (v31)
        {
          OSLogHandleForIMFoundationCategory();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v13;
            _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "This is a nickname update from: %@", buf, 0xCu);
          }

        }
        v49 = IDSCopyAddressDestinationForDestination();

        v50 = objc_msgSend(v16, "BOOLValueForKey:withDefault:", MessageDictionaryTrustedUserKey, 1);
        v51 = v50;
        if (IMOSLoggingEnabled(v50))
        {
          OSLogHandleForIMFoundationCategory();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = CFSTR("YES");
            if (!v51)
              v53 = CFSTR("NO");
            *(_DWORD *)buf = 138412290;
            v66 = (uint64_t)v53;
            _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "The sender is SNaP trusted: %@", buf, 0xCu);
          }

        }
        BYTE1(v55) = v51 ^ 1;
        LOBYTE(v55) = v56;
        -[IMDNicknameController NicknameWithRecordID:URI:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:hasWallpaperUpdate:dropNicknameForUnknownContacts:withCompletionBlock:](self, "NicknameWithRecordID:URI:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:hasWallpaperUpdate:dropNicknameForUnknownContacts:withCompletionBlock:", v61, v49, v60, v59, v58, v57, v55, &unk_1E922C0B0);
        v13 = (id)v49;
      }

      v37 = (void *)v61;
    }
    else
    {
      IMLogHandleForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        sub_1D16697A8(v36, v38, v39, v40, v41, v42, v43, v44);
        v37 = v36;
      }
    }

  }
}

- (NSSet)allowListedHandlesForSharing
{
  void *v2;
  void *v3;

  -[IMDNicknameController handleAllowList](self, "handleAllowList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSSet)denyListedHandlesForSharing
{
  void *v2;
  void *v3;

  -[IMDNicknameController handleDenyList](self, "handleDenyList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSSet)transitionedHandles
{
  void *v2;
  void *v3;

  -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSDictionary)activeRecords
{
  void *v2;
  void *v3;

  -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSDictionary)ignoredRecords
{
  void *v2;
  void *v3;

  -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (void)broadcastHandlesSharingNicknamesDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "broadcasterForAccountListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController denyListedHandlesForSharing](self, "denyListedHandlesForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateNicknameHandlesForSharing:blocked:", v4, v5);

}

- (void)broadcastTransitionedHandlesDidChange
{
  void *v3;
  void *v4;
  id v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "broadcasterForAccountListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController transitionedHandles](self, "transitionedHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateTransitionedNicknameHandles:", v4);

}

- (void)allowHandlesForSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  IMDHandle *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  id v82;
  __int16 v83;
  id v84;
  __int16 v85;
  _BOOL4 v86;
  uint64_t v87;

  v6 = a6;
  v87 = *MEMORY[0x1E0C80C00];
  v57 = a3;
  v56 = a4;
  v10 = a5;
  v11 = IMOSLoggingEnabled(v10);
  if ((_DWORD)v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v80 = (uint64_t)v57;
      v81 = 2112;
      v82 = v56;
      v83 = 2112;
      v84 = v10;
      v85 = 1024;
      v86 = v6;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Asked to allow handles: %@, on chatGUIDS: %@, from handle: %@, forceSend: %{BOOL}d", buf, 0x26u);
    }

  }
  if (v6
    || (-[IMDNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v57, "isSubsetOfSet:", v13),
        v13,
        !v14))
  {
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v57, "count");
        *(_DWORD *)buf = 134217984;
        v80 = v17;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Writing %lu nicknames to allow list", buf, 0xCu);
      }

    }
    -[IMDNicknameController markHandlesAsAllowed:](self, "markHandlesAsAllowed:", v57, v56);
    if (v56 && objc_msgSend(v56, "count"))
    {
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v18 = v56;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v72 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
            +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "existingChatWithGUID:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (IMOSLoggingEnabled(v25))
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v80 = (uint64_t)v24;
                _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "We have a chat for guid so sending nickname info %@", buf, 0xCu);
              }

            }
            objc_msgSend(v24, "participants");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "guid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDNicknameController sendPersonalNicknameToRecipients:chatGUID:fromHandle:](self, "sendPersonalNicknameToRecipients:chatGUID:fromHandle:", v27, v28, v10);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
        }
        while (v19);
      }

    }
    else if (v57)
    {
      v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v30 = v57;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v68 != v32)
              objc_enumerationMutation(v30);
            v34 = -[IMDHandle initWithID:unformattedID:countryCode:]([IMDHandle alloc], "initWithID:unformattedID:countryCode:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j), *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j), 0);
            objc_msgSend(v29, "addObject:", v34);

          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        }
        while (v31);
      }

      v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v35 = v29;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v64;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v64 != v37)
              objc_enumerationMutation(v35);
            v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * k);
            +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "ID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "allExistingChatsWithIdentifier:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
              objc_msgSend(v58, "addObjectsFromArray:", v42);

          }
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
        }
        while (v36);
      }

      if (IMOSLoggingEnabled(v43))
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v80 = (uint64_t)v58;
          _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Found these chats: %@", buf, 0xCu);
        }

      }
      v45 = objc_msgSend(v58, "count");
      if (!v10 || v45)
      {
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v47 = v58;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
        v49 = v48;
        if (v48)
        {
          v50 = *(_QWORD *)v60;
          do
          {
            v51 = 0;
            do
            {
              if (*(_QWORD *)v60 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v51);
              if (v10
                || (objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v51), "lastAddressedLocalHandle"),
                    v48 = objc_claimAutoreleasedReturnValue(),
                    (v10 = (id)v48) != 0))
              {
                if (IMOSLoggingEnabled(v48))
                {
                  OSLogHandleForIMFoundationCategory();
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v53, OS_LOG_TYPE_INFO, "We have a fromHandle, sending the nickname", buf, 2u);
                  }

                }
                objc_msgSend(v52, "guid");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                -[IMDNicknameController sendPersonalNicknameToRecipients:chatGUID:fromHandle:](self, "sendPersonalNicknameToRecipients:chatGUID:fromHandle:", v35, v54, v10);

              }
              else
              {
                v48 = IMOSLoggingEnabled(0);
                if ((_DWORD)v48)
                {
                  OSLogHandleForIMFoundationCategory();
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D1413000, v55, OS_LOG_TYPE_INFO, "We don't have a fromHandle, so we can't send the nickname", buf, 2u);
                  }

                }
                v10 = 0;
              }
              ++v51;
            }
            while (v49 != v51);
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
            v49 = v48;
          }
          while (v48);
        }

      }
      else
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "We don't have a chat, but we do have a fromHandle, sending the nickname", buf, 2u);
          }

        }
        -[IMDNicknameController sendPersonalNicknameToRecipients:chatGUID:fromHandle:](self, "sendPersonalNicknameToRecipients:chatGUID:fromHandle:", v35, 0, v10);
      }

    }
  }
  else if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v80 = (uint64_t)v57;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "We tried to allow handle(s) that have already been allowed, bailing. Handles: %@", buf, 0xCu);
    }

  }
}

- (void)markHandlesAsAllowed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isSubsetOfSet:", v5);

  v8 = IMOSLoggingEnabled(v7);
  if (v6)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = (uint64_t)v4;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Given handles are already in our allow list, no need to do anything. Handles: %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 134217984;
        v13 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Writing %lu nicknames to allow list", (uint8_t *)&v12, 0xCu);
      }

    }
    -[IMDNicknameController handleAllowList](self, "handleAllowList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateHandleList:withHandles:forKey:broadcastUpdates:](self, "_updateHandleList:withHandles:forKey:broadcastUpdates:", v11, v4, CFSTR("handleWhitelist"), 1);

    -[IMDNicknameController broadcastHandlesSharingNicknamesDidChange](self, "broadcastHandlesSharingNicknamesDidChange");
  }

}

- (void)denyHandlesForSharing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Writing %lu nicknames to deny list", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMDNicknameController handleDenyList](self, "handleDenyList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController _updateHandleList:withHandles:forKey:broadcastUpdates:](self, "_updateHandleList:withHandles:forKey:broadcastUpdates:", v6, v4, CFSTR("handleBlacklist"), 1);

  -[IMDNicknameController broadcastHandlesSharingNicknamesDidChange](self, "broadcastHandlesSharingNicknamesDidChange");
}

- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = v6;
  if (v6)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    v9 = v8;
    if (v8)
    {
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
          v8 = IMOSLoggingEnabled(v8);
          if (v4)
          {
            if ((_DWORD)v8)
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v12;
                _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Auto update mode is set for handle ID: %@", buf, 0xCu);
              }

            }
            v8 = -[IMDNicknameController acceptPendingNicknameForHandleID:updateType:](self, "acceptPendingNicknameForHandleID:updateType:", v12, 12);
          }
          else if ((_DWORD)v8)
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v12;
              _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Always ask mode is set for handle ID: %@", buf, 0xCu);
            }

          }
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        v9 = v8;
      }
      while (v8);
    }

    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 134217984;
        v28 = v17;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Writing handles %lu to transitioned list", buf, 0xCu);
      }

    }
    -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateTransitionList:withHandles:forKey:broadcastUpdates:](self, "_updateTransitionList:withHandles:forKey:broadcastUpdates:", v18, v7, CFSTR("handleTransitionedList"), 1);

    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Broadcasting changes to the transitioned list", buf, 2u);
      }

    }
    -[IMDNicknameController broadcastTransitionedHandlesDidChange](self, "broadcastTransitionedHandlesDidChange");
  }
  else
  {
    IMLogHandleForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1D1669878();

  }
}

- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = IMOSLoggingEnabled(v6);
    if (v4)
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v17 = 134217984;
          v18 = objc_msgSend(v7, "count");
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Writing record IDs %lu to active list", (uint8_t *)&v17, 0xCu);
        }

      }
      -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _updateActiveList:withRecords:broadcastUpdates:](self, "_updateActiveList:withRecords:broadcastUpdates:", v10, v7, 1);
    }
    else
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v17 = 134217984;
          v18 = objc_msgSend(v7, "count");
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Removing record IDs %lu from active list", (uint8_t *)&v17, 0xCu);
        }

      }
      objc_msgSend(v7, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _removeFromList:withKey:](self, "_removeFromList:withKey:", v10, CFSTR("activeNicknameRecords"));
    }

    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Broadcasting changes to the active list", (uint8_t *)&v17, 2u);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject broadcasterForAccountListeners](v11, "broadcasterForAccountListeners");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController activeRecords](self, "activeRecords");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateActiveNicknameRecords:", v16);

  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1D16698A4();
  }

}

- (void)markProfileRecordsAsIgnored:(id)a3 broadcastUpdates:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v15 = 134217984;
        v16 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Writing record IDs %lu to ignored list", (uint8_t *)&v15, 0xCu);
      }

    }
    -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _updateIgnoredList:withRecords:broadcastUpdates:](self, "_updateIgnoredList:withRecords:broadcastUpdates:", v9, v7, v4);

    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Broadcasting changes to the ignored list", (uint8_t *)&v15, 2u);
      }

    }
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject broadcasterForAccountListeners](v12, "broadcasterForAccountListeners");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController ignoredRecords](self, "ignoredRecords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateIgnoredNicknameRecords:", v14);

  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1D16698D0();
  }

}

- (NSMutableSet)handleAllowList
{
  NSMutableSet *handleAllowList;
  NSMutableSet *v4;
  NSMutableSet *v5;

  handleAllowList = self->_handleAllowList;
  if (!handleAllowList)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_handleAllowList;
    self->_handleAllowList = v4;

    handleAllowList = self->_handleAllowList;
  }
  return handleAllowList;
}

- (NSMutableSet)handleDenyList
{
  NSMutableSet *handleDenyList;
  NSMutableSet *v4;
  NSMutableSet *v5;

  handleDenyList = self->_handleDenyList;
  if (!handleDenyList)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_handleDenyList;
    self->_handleDenyList = v4;

    handleDenyList = self->_handleDenyList;
  }
  return handleDenyList;
}

- (void)_updateHandleList:(id)a3 withHandles:(id)a4 forKey:(id)a5 broadcastUpdates:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = a6;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v11, "isSubsetOfSet:", v10);
  if ((_DWORD)v13)
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v11;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Given handles are already in our list, no need to do anything. Handles: %@, key: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(v10, "unionSet:", v11);
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v24;
    v17 = v16;
    if (!v15 || v16)
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v12;
          v27 = 2112;
          v28 = v17;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving handle list for key %@ error %@", buf, 0x16u);
        }

      }
    }
    else
    {
      -[IMDNicknameController handleSharingKVStore](self, "handleSharingKVStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v18, "persistData:forKey:error:", v15, v12, &v23);
      v19 = v23;

      if (v19 && IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v26 = v12;
          v27 = 2112;
          v28 = v19;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a handle list update with key %@ -  %@", buf, 0x16u);
        }

      }
    }
    if (v6)
    {
      -[IMDNicknameController _updateDenyAllowListHandlesVersion](self, "_updateDenyAllowListHandlesVersion");
      -[IMDNicknameController _syncHandleAllowDenyListToOtherDevices](self, "_syncHandleAllowDenyListToOtherDevices");
    }

  }
}

- (void)_updateTransitionList:(id)a3 withHandles:(id)a4 forKey:(id)a5 broadcastUpdates:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "unionSet:", v11);
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  v15 = v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 0;
  if (v16)
  {
    -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v18, "persistData:forKey:error:", v13, v12, &v22);
    v19 = v22;

    if (v19 && IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v12;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a transitioned list update with key %@ -  %@", buf, 0x16u);
      }

    }
  }
  else if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v12;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving transitioned list for key %@ error %@", buf, 0x16u);
    }

  }
  if (v6)
  {
    -[IMDNicknameController _updateTransitionedListHandlesVersion](self, "_updateTransitionedListHandlesVersion");
    -[IMDNicknameController _syncHandleTransitionedListToOtherDevices](self, "_syncHandleTransitionedListToOtherDevices");
  }

}

- (void)_updateActiveList:(id)a3 withRecords:(id)a4 broadcastUpdates:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Saving new active list: %@, after previous active list: %@", buf, 0x16u);
    }

  }
  if (v8)
  {
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    v13 = v12;
    if (!v11 || v12)
    {
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v22 = CFSTR("activeNicknameRecords");
          v23 = 2112;
          v24 = v13;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving active list for key %@ error %@", buf, 0x16u);
        }

      }
    }
    else
    {
      -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v14, "persistData:forKey:error:", v11, CFSTR("activeNicknameRecords"), &v19);
      v15 = v19;

      if (v15 && IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v22 = CFSTR("activeNicknameRecords");
          v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a active list update with key %@ -  %@", buf, 0x16u);
        }

      }
    }
    if (v5)
    {
      -[IMDNicknameController _updateIsActiveListHandlesVersion](self, "_updateIsActiveListHandlesVersion");
      -[IMDNicknameController _syncActiveNicknameRecordsToOtherDevices](self, "_syncActiveNicknameRecordsToOtherDevices");
    }

  }
}

- (void)_updateIgnoredList:(id)a3 withRecords:(id)a4 broadcastUpdates:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    v12 = v11;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 0;
    if (v13)
    {
      -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v15, "persistData:forKey:error:", v10, CFSTR("ignoredNicknameRecords"), &v19);
      v16 = v19;

      if (v16 && IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v22 = CFSTR("ignoredNicknameRecords");
          v23 = 2112;
          v24 = v16;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a ignored list update with key %@ -  %@", buf, 0x16u);
        }

      }
    }
    else if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v22 = CFSTR("ignoredNicknameRecords");
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving ignored list for key %@ error %@", buf, 0x16u);
      }

    }
    if (v5)
    {
      -[IMDNicknameController _updateIsIgnoredListHandlesVersion](self, "_updateIsIgnoredListHandlesVersion");
      -[IMDNicknameController _syncIgnoredNicknameRecordsToOtherDevices](self, "_syncIgnoredNicknameRecordsToOtherDevices");
    }

  }
}

- (id)unknownSenderRecordInfoFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_replaceUnknownSenderRecordInfoListWithInfo:(id)a3 purgeIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[IMDNicknameController setUnknownSenderRecordInfo:](self, "setUnknownSenderRecordInfo:", v6);
    v7 = (void *)MEMORY[0x1E0CB36F8];
    v8 = (void *)MEMORY[0x1E0C99D80];
    -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;

    if (!v11 || v12)
    {
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v22 = CFSTR("unknownSenderRecordInfoKey");
          v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving unknown sender payload update for key %@ error %@", buf, 0x16u);
        }

      }
    }
    else
    {
      -[IMDNicknameController unknownSenderRecordInfoKVStore](self, "unknownSenderRecordInfoKVStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v14, "persistData:forKey:error:", v11, CFSTR("unknownSenderRecordInfoKey"), &v19);
      v15 = v19;

      if (v15 && IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v22 = CFSTR("unknownSenderRecordInfoKey");
          v23 = 2112;
          v24 = v15;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing an unknown sender payload update with key %@ -  %@", buf, 0x16u);
        }

      }
    }
    if (v4)
      -[IMDNicknameController purgeUnknownSenderRecordInfoIfNeeded](self, "purgeUnknownSenderRecordInfoIfNeeded");

  }
}

- (void)_removeFromTransitionedList:(id)a3
{
  __CFString *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v5)
  {
    -[__CFString handle](v4, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObject:", v6);

        v10 = (void *)MEMORY[0x1E0CB36F8];
        -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v10, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v23;

        if (!v12 || v13)
        {
          if (IMOSLoggingEnabled(v14))
          {
            OSLogHandleForIMFoundationCategory();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v25 = CFSTR("handleTransitionedList");
              v26 = 2112;
              v27 = v13;
              _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving list for key %@ error %@", buf, 0x16u);
            }

          }
        }
        else
        {
          -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          objc_msgSend(v15, "persistData:forKey:error:", v12, CFSTR("handleTransitionedList"), &v22);
          v16 = v22;

          if (v16 && IMOSLoggingEnabled(v17))
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v25 = CFSTR("handleTransitionedList");
              v26 = 2112;
              v27 = v16;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing list update with key %@ -  %@", buf, 0x16u);
            }

          }
        }
        -[IMDNicknameController _updateTransitionedListHandlesVersion](self, "_updateTransitionedListHandlesVersion");
        -[IMDNicknameController _syncHandleTransitionedListToOtherDevices](self, "_syncHandleTransitionedListToOtherDevices");
        -[IMDNicknameController broadcastTransitionedHandlesDidChange](self, "broadcastTransitionedHandlesDidChange");

      }
    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "No handle id for nickname %@", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Feature is not enabled", buf, 2u);
    }

  }
}

- (void)_removeFromList:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (!v8)
  {
    if (!IMOSLoggingEnabled(v8))
      goto LABEL_46;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Feature is not enabled", buf, 2u);
    }
LABEL_8:

    goto LABEL_46;
  }
  if (!objc_msgSend(v6, "count"))
  {
    if (!IMOSLoggingEnabled(0))
      goto LABEL_46;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "No nickname handle id provided", buf, 2u);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ignoredNicknameRecords")))
  {
    -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("activeNicknameRecords")))
      goto LABEL_46;
    -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  if (v9)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            if (IMOSLoggingEnabled(v19))
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v16;
                _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Handle id is already removed from list %@", buf, 0xCu);
              }

            }
            goto LABEL_45;
          }
          objc_msgSend(v11, "removeObjectForKey:", v16);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v13)
          continue;
        break;
      }
    }

    v29 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v29;
    v12 = v21;
    if (!v20 || v21)
    {
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v7;
          v36 = 2112;
          v37 = v12;
          _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving list for key %@ error %@", buf, 0x16u);
        }

      }
    }
    else
    {
      -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v22, "persistData:forKey:error:", v20, v7, &v28);
      v23 = v28;

      if (v23 && IMOSLoggingEnabled(v24))
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v7;
          v36 = 2112;
          v37 = v23;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing list update with key %@ -  %@", buf, 0x16u);
        }

      }
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("ignoredNicknameRecords")))
    {
      -[IMDNicknameController _updateIsIgnoredListHandlesVersion](self, "_updateIsIgnoredListHandlesVersion");
      -[IMDNicknameController _syncIgnoredNicknameRecordsToOtherDevices](self, "_syncIgnoredNicknameRecordsToOtherDevices");
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("activeNicknameRecords")))
    {
      -[IMDNicknameController _updateIsActiveListHandlesVersion](self, "_updateIsActiveListHandlesVersion");
      -[IMDNicknameController _syncActiveNicknameRecordsToOtherDevices](self, "_syncActiveNicknameRecordsToOtherDevices");
    }

LABEL_45:
  }
LABEL_46:

}

- (void)_updatePendingNicknameVersion
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D38B48];
  v5 = *MEMORY[0x1E0D38B90];
  objc_msgSend(v3, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[IMDNicknameController defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forDomain:forKey:", v10, v4, v5);

  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Updated pending nickname version to %@", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)saveNicknameForRecordID:(id)a3 handleID:(id)a4 userNickname:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t v29[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "setRecordID:", v8);
  objc_msgSend(v10, "setHandle:", v9);
  v11 = -[IMDNicknameController replacedNicknameForHandleIDInHandledMapIfNeeded:nickname:](self, "replacedNicknameForHandleIDInHandledMapIfNeeded:nickname:", v9, v10);
  v12 = v11;
  v13 = IMOSLoggingEnabled(v11);
  if (v12)
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "We replaced userNickname in our handled map w/ an existing handled record", v29, 2u);
      }

    }
  }
  else
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "We could not replace incoming nickname in our handled map, add to pending", buf, 2u);
      }

    }
    -[IMDNicknameController addNicknameToPendingUpdates:](self, "addNicknameToPendingUpdates:", v10);
  }
  objc_msgSend(v10, "preBlastDoorPayloadData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v16)
  {
    -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    objc_msgSend(v10, "preBlastDoorPayloadData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("date"));

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v26);

    -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "setObject:forKey:", v22, v9);
    -[IMDNicknameController _replaceUnknownSenderRecordInfoListWithInfo:purgeIfNeeded:](self, "_replaceUnknownSenderRecordInfoListWithInfo:purgeIfNeeded:", v28, 1);

  }
  else
  {
    -[IMDNicknameController purgeUnknownSenderRecordInfoIfNeeded](self, "purgeUnknownSenderRecordInfoIfNeeded");
  }

}

- (void)clearPendingNicknameForHandleID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingNicknameUpdates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = IMOSLoggingEnabled(v6);
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got a pending nickname to handle %@", (uint8_t *)&v11, 0xCu);
      }

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v5);
    -[IMDNicknameController markNicknameAsUpdated:](self, "markNicknameAsUpdated:", v9);

  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "We don't have a pending nickname to clear for handle ID %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)ignorePendingNicknameForHandleID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingNicknameUpdates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = IMOSLoggingEnabled(v6);
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got a malicious pending nickname to handle %@", (uint8_t *)&v13, 0xCu);
      }

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v5);
    objc_msgSend(v9, "setFirstName:", &stru_1E92346B0);
    objc_msgSend(v9, "setLastName:", &stru_1E92346B0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39990]), "initWithImageName:imageFilePath:contentIsSensitive:", &stru_1E92346B0, &stru_1E92346B0, 0);
    objc_msgSend(v9, "setAvatar:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B88]), "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", 0, 0, 0, 0, 0, 0);
    objc_msgSend(v9, "setWallpaper:", v11);
    -[IMDNicknameController markNicknameAsUpdated:](self, "markNicknameAsUpdated:", v9);
    -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
    -[IMDNicknameController sendPendingNicknameUpdatesDidChange](self, "sendPendingNicknameUpdatesDidChange");

  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "We don't have a malicious pending nickname to clear for handle ID %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)clearPendingNicknamePhotoForHandleID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_pendingNicknameUpdates, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = IMOSLoggingEnabled(v6);
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got a pending nickname photo to handle %@", (uint8_t *)&v11, 0xCu);
      }

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v5);
    -[IMDNicknameController _markNicknamePhotoAsUpdated:](self, "_markNicknamePhotoAsUpdated:", v9);
    -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
    -[IMDNicknameController sendPendingNicknameUpdatesDidChange](self, "sendPendingNicknameUpdatesDidChange");

  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "We don't have a pending nickname to clear for handle ID %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)_markNicknamePhotoAsUpdated:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSMutableDictionary *pendingNicknameUpdates;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled(v4);
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "handle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v7;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Marking nickname photo %@ as handled", (uint8_t *)&v20, 0xCu);

      }
    }
    pendingNicknameUpdates = self->_pendingNicknameUpdates;
    objc_msgSend(v4, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](pendingNicknameUpdates, "removeObjectForKey:", v9);

    -[IMDNicknameController _deleteNicknameFromPendingMap:](self, "_deleteNicknameFromPendingMap:", v4);
    v10 = objc_alloc(MEMORY[0x1E0D39980]);
    objc_msgSend(v4, "firstName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pronouns");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithFirstName:lastName:avatar:pronouns:", v11, v12, 0, v13);

    if (objc_msgSend(v14, "isUpdateFromNickname:withOptions:", v4, 20))
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_pendingNicknameUpdates;
      objc_msgSend(v4, "handle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v15, v17);

      -[IMDNicknameController pendingNicknameUpdatesKVStore](self, "pendingNicknameUpdatesKVStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v18, v14);

    }
    -[IMDNicknameController _updateNicknameInHandledMap:updateType:broadcastUpdates:](self, "_updateNicknameInHandledMap:updateType:broadcastUpdates:", v4, *MEMORY[0x1E0D38B20], 1);
    -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
    -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");

  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Trying to update a nil nickname", (uint8_t *)&v20, 2u);
    }

  }
}

- (void)_broadcastNicknamesMapChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "broadcasterForAccountListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController archivedNicknames](self, "archivedNicknames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePendingNicknameUpdates:handledNicknames:archivedNicknames:", v4, v5, v6);

}

- (void)_broadcastActiveListChanged
{
  void *v3;
  void *v4;
  id v5;

  +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "broadcasterForAccountListeners");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController activeRecords](self, "activeRecords");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateActiveNicknameRecords:", v4);

}

- (void)addNicknameToPendingUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *pendingNicknameUpdates;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSMutableDictionary *handledNicknames;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  NSMutableDictionary *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_pendingNicknameUpdates)
  {
    if (v4)
      goto LABEL_3;
LABEL_21:
    if (!IMOSLoggingEnabled(v4))
      goto LABEL_34;
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Tried to add a nil nickname to our pending map", (uint8_t *)&v34, 2u);
    }
LABEL_24:

    goto LABEL_34;
  }
  Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  pendingNicknameUpdates = self->_pendingNicknameUpdates;
  self->_pendingNicknameUpdates = Mutable;

  if (!v5)
    goto LABEL_21;
LABEL_3:
  objc_msgSend(v5, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!IMOSLoggingEnabled(v7))
      goto LABEL_34;
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v34 = 138412290;
      v35 = v5;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Tried to add nickname to our pending map without a handle %@", (uint8_t *)&v34, 0xCu);
    }
    goto LABEL_24;
  }
  objc_msgSend(v5, "avatar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasImage");

  if ((v9 & 1) != 0)
  {
LABEL_11:
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        v35 = v5;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Adding new nickname to our pending map %@", (uint8_t *)&v34, 0xCu);
      }

    }
    v18 = self->_pendingNicknameUpdates;
    objc_msgSend(v5, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, v20);

    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = self->_pendingNicknameUpdates;
        v34 = 138412546;
        v35 = v5;
        v36 = 2112;
        v37 = v23;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "add nickname to pending updates %@ %@", (uint8_t *)&v34, 0x16u);
      }

    }
    -[IMDNicknameController _removeFromTransitionedList:](self, "_removeFromTransitionedList:", v5);
    -[IMDNicknameController pendingNicknameUpdatesKVStore](self, "pendingNicknameUpdatesKVStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v24, v5);

    -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
    -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
    goto LABEL_34;
  }
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v34 = 138412290;
      v35 = v5;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "New pending nickname has no image %@", (uint8_t *)&v34, 0xCu);
    }

  }
  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v14);
  v16 = objc_msgSend(v5, "isUpdateFromNickname:withOptions:", v15, 4);
  if ((v16 & 1) != 0)
  {

    goto LABEL_11;
  }
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v34 = 138412290;
      v35 = v15;
      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "New pending nickname name hasn't changed, silently updating record ID for previously handled nickname %@", (uint8_t *)&v34, 0xCu);
    }

  }
  objc_msgSend(v5, "recordID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRecordID:", v29);

  handledNicknames = self->_handledNicknames;
  objc_msgSend(v15, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](handledNicknames, "setObject:forKey:", v31, v32);

  -[IMDNicknameController handledNicknamesKVStore](self, "handledNicknamesKVStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v33, v15);

LABEL_34:
}

- (BOOL)replacedNicknameForHandleIDInHandledMapIfNeeded:(id)a3 nickname:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  const __CFString *v14;
  char v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v9);
  if (v10)
  {
    v11 = objc_msgSend(v7, "isUpdateFromNickname:withOptions:", v10, 8);
    v12 = v11;
    if (IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = CFSTR("NO");
        v17 = 138412802;
        v18 = v10;
        v19 = 2112;
        if (v12)
          v14 = CFSTR("YES");
        v20 = v7;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Existing nickname %@ and new nickname %@ are different %@", (uint8_t *)&v17, 0x20u);
      }

    }
    if ((v12 & 1) == 0)
    {
      -[IMDNicknameController _updateNicknameInHandledMap:updateType:broadcastUpdates:](self, "_updateNicknameInHandledMap:updateType:broadcastUpdates:", v7, *MEMORY[0x1E0D38B20], 1);
      -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
      -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
    }
    v15 = v12 ^ 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_markPendingNicknameAsCurrent:(id)a3 incrementPendingNicknameVersion:(BOOL)a4 updateType:(unint64_t)a5 broadcastUpdates:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v8;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSMutableDictionary *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSMutableDictionary *pendingNicknameUpdates;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  _WORD v36[17];

  v6 = a6;
  v8 = a4;
  *(_QWORD *)&v36[13] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isNameAndPhotoC3Enabled");

    if ((v12 & 1) != 0)
    {
      if (IMOSLoggingEnabled(v13))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "recordID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v15;
          v35 = 2112;
          *(_QWORD *)v36 = v16;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Marking nickname %@ as current for handle %@", (uint8_t *)&v33, 0x16u);

        }
      }
      -[IMDNicknameController handledNicknames](self, "handledNicknames");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        v21 = (a5 & 0xC) != 0;
      else
        v21 = 0;
      v22 = IMOSLoggingEnabled(v20);
      if (v21)
      {
        if (v22)
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "handle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138412290;
            v34 = v24;
            _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Found current nickname with photo or poster update, moving to archive for handle %@", (uint8_t *)&v33, 0xCu);

          }
        }
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v19);
        -[IMDNicknameController _markCurrentNicknameAsArchived:incrementPendingNicknameVersion:](self, "_markCurrentNicknameAsArchived:incrementPendingNicknameVersion:", v25, 0);

      }
      else
      {
        if (v22)
        {
          OSLogHandleForIMFoundationCategory();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "handle");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138412802;
            v34 = v30;
            v35 = 1024;
            *(_DWORD *)v36 = (a5 & 0xC) != 0;
            v36[2] = 2112;
            *(_QWORD *)&v36[3] = v19;
            _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "No current nickname with a different photo or poster found, nothing to archive for handle %@. isPhotoOrWallpaperUpdate: %{BOOL}d Current nickname dict: %@.", (uint8_t *)&v33, 0x1Cu);

          }
        }
        if (!a5)
        {
          pendingNicknameUpdates = self->_pendingNicknameUpdates;
          objc_msgSend(v10, "handle");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary removeObjectForKey:](pendingNicknameUpdates, "removeObjectForKey:", v32);

          -[IMDNicknameController _deleteNicknameFromPendingMap:](self, "_deleteNicknameFromPendingMap:", v10);
          if (v8)
            -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
          -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
          goto LABEL_29;
        }
      }
      -[IMDNicknameController _updateNicknameInHandledMap:updateType:broadcastUpdates:](self, "_updateNicknameInHandledMap:updateType:broadcastUpdates:", v10, a5, v6);
LABEL_29:
      if (v8)
        -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
      -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
      if (v6)
        -[IMDNicknameController sendPendingNicknameUpdatesDidChange](self, "sendPendingNicknameUpdatesDidChange");

      goto LABEL_34;
    }
    -[IMDNicknameController _updateNicknameInHandledMap:updateType:broadcastUpdates:](self, "_updateNicknameInHandledMap:updateType:broadcastUpdates:", v10, a5, v6);
    v27 = self->_pendingNicknameUpdates;
    objc_msgSend(v10, "handle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v27, "removeObjectForKey:", v28);

    -[IMDNicknameController _deleteNicknameFromPendingMap:](self, "_deleteNicknameFromPendingMap:", v10);
    if (v8)
      -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
    -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Trying to update a nil nickname", (uint8_t *)&v33, 2u);
    }

  }
LABEL_34:

}

- (void)_markCurrentNicknameAsArchived:(id)a3 incrementPendingNicknameVersion:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "handle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Marking nickname %@ as archived", (uint8_t *)&v12, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isNameAndPhotoC3Enabled");

  if ((v9 & 1) == 0)
  {
    if (!IMOSLoggingEnabled(v10))
      goto LABEL_16;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Name Photo FF not enabled", (uint8_t *)&v12, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v5)
  {
    if (!IMOSLoggingEnabled(v10))
      goto LABEL_16;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Trying to update a nil nickname", (uint8_t *)&v12, 2u);
    }
    goto LABEL_15;
  }
  -[IMDNicknameController _updateNicknameInArchivedMap:](self, "_updateNicknameInArchivedMap:", v5);
LABEL_16:

}

- (void)_deleteOnDiskDataIfNeededForNickname:(id)a3 withNewNickname:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "avatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageFilePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length")
    && (objc_msgSend(v6, "avatar"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "imageFilePath"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v8, "isEqualToString:", v10),
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "handle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = v15;
        v43 = 2112;
        v44 = v8;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "For nickname %@, deleting old avatar image at path during mark as updated %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v16, "removeItemAtPath:error:", v8, &v40);
    v13 = v40;

    if (v13)
    {
      IMLogHandleForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1D16699BC();

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v5, "wallpaper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(v6, "wallpaper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqualToString:", v21);

    if ((v22 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v23))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "handle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v25;
          v43 = 2112;
          v44 = v19;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "For nickname %@, deleting old wallpaper image at path during mark as updated %@", buf, 0x16u);

        }
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v26, "removeItemAtPath:error:", v19, &v39);
      v13 = v39;

      if (v13)
      {
        IMLogHandleForCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1D166995C();

      }
    }
  }
  objc_msgSend(v5, "wallpaper");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lowResFilePath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v29, "length"))
  {
    objc_msgSend(v6, "wallpaper");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lowResFilePath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v29, "isEqualToString:", v31);

    if ((v32 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v33))
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "handle");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v42 = v35;
          v43 = 2112;
          v44 = v8;
          _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "For nickname %@, deleting old watch wallpaper image at path during mark as updated %@", buf, 0x16u);

        }
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v36, "removeItemAtPath:error:", v29, &v38);
      v13 = v38;

      if (v13)
      {
        IMLogHandleForCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          sub_1D16698FC();

      }
    }
  }

}

- (void)_updateNicknameInHandledMap:(id)a3 updateType:(unint64_t)a4 broadcastUpdates:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *handledNicknames;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSMutableDictionary *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  NSObject *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v5 = a5;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (self->_handledNicknames)
  {
    if (!v8)
      return;
  }
  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    handledNicknames = self->_handledNicknames;
    self->_handledNicknames = Mutable;

    if (!v9)
      return;
  }
  if (a4)
  {
    objc_msgSend(v9, "handle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v12, "length"))
    {
      v13 = self->_handledNicknames;
      objc_msgSend(v9, "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v15);
        v18 = IMOSLoggingEnabled(v17);
        if ((_DWORD)v18)
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "recordID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "recordID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v55 = v12;
            v56 = 2112;
            v57 = v20;
            v58 = 2112;
            v59 = v21;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Replacing handled nickname for handle id %@ from record id %@ to new record id %@", buf, 0x20u);

          }
        }
      }
      else
      {
        v18 = IMOSLoggingEnabled(v16);
        if ((_DWORD)v18)
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "handle");
            v23 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v55 = v23;
            _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "No current nickname found for handle %@", buf, 0xCu);

          }
        }
        v17 = 0;
      }
      if ((*MEMORY[0x1E0D38B20] & ~a4) != 0)
      {
        if (v17)
          v29 = objc_msgSend(v17, "copy");
        else
          v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithFirstName:lastName:avatar:pronouns:wallpaper:", 0, 0, 0, 0, 0);
        v30 = (void *)v29;
        objc_msgSend(v9, "recordID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setRecordID:", v31);

        objc_msgSend(v9, "handle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setHandle:", v32);

        if ((a4 & 0xC) != 0)
        {
          if (IMOSLoggingEnabled(v33))
          {
            OSLogHandleForIMFoundationCategory();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "handle");
              v35 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v55 = v35;
              _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "Wallpaper and photo update for handle %@", buf, 0xCu);

            }
          }
          objc_msgSend(v9, "avatar");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setAvatar:", v36);

          objc_msgSend(v9, "wallpaper");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setWallpaper:", v37);

        }
        if ((a4 & 2) != 0)
        {
          if (IMOSLoggingEnabled(v33))
          {
            OSLogHandleForIMFoundationCategory();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "handle");
              v39 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v55 = v39;
              _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Name update for handle %@", buf, 0xCu);

            }
          }
          objc_msgSend(v9, "firstName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFirstName:", v40);

          objc_msgSend(v9, "lastName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setLastName:", v41);

        }
        v42 = self->_handledNicknames;
        objc_msgSend(v30, "dictionaryRepresentation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v42, "setObject:forKey:", v43, v12);

        -[IMDNicknameController handledNicknamesKVStore](self, "handledNicknamesKVStore");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v44, v30);

        v45 = objc_msgSend(v9, "isUpdateFromNickname:withOptions:", v30, 8);
        if ((v45 & 1) == 0)
        {
          if (IMOSLoggingEnabled(v45))
          {
            OSLogHandleForIMFoundationCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "handle");
              v47 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v55 = v47;
              _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Deleting pending update as this is the same as current for %@", buf, 0xCu);

            }
          }
          -[NSMutableDictionary removeObjectForKey:](self->_pendingNicknameUpdates, "removeObjectForKey:", v12);
          -[IMDNicknameController _deleteNicknameFromPendingMap:](self, "_deleteNicknameFromPendingMap:", v9);
        }

        v9 = v30;
      }
      else
      {
        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v9, "handle");
            v25 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v55 = v25;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Update everything for handle %@", buf, 0xCu);

          }
        }
        v26 = self->_handledNicknames;
        objc_msgSend(v9, "dictionaryRepresentation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, v12);

        -[IMDNicknameController handledNicknamesKVStore](self, "handledNicknamesKVStore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v28, v9);

        -[NSMutableDictionary removeObjectForKey:](self->_pendingNicknameUpdates, "removeObjectForKey:", v12);
        -[IMDNicknameController _deleteNicknameFromPendingMap:](self, "_deleteNicknameFromPendingMap:", v9);
      }
      objc_msgSend(v9, "handle");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordID", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController _updateActiveList:withRecords:broadcastUpdates:](self, "_updateActiveList:withRecords:broadcastUpdates:", v51, v50, v5);

    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1D1669A7C();
    }

  }
  else
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1D1669A1C();
  }

}

- (void)_updateNicknameInArchivedMap:(id)a3
{
  id v4;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *archivedNicknames;
  NSMutableDictionary *handledNicknames;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _BOOL8 v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_archivedNicknames)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    archivedNicknames = self->_archivedNicknames;
    self->_archivedNicknames = Mutable;

  }
  handledNicknames = self->_handledNicknames;
  objc_msgSend(v4, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](handledNicknames, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = self->_archivedNicknames;
    objc_msgSend(v4, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v12);
      v14 = -[IMDNicknameController _isActiveForNickname:](self, "_isActiveForNickname:", v13);
      v15 = v14;
      v16 = IMOSLoggingEnabled(v14);
      if (v15)
      {
        if (v16)
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v27 = 138412290;
            v28 = v13;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Not removing archived nickname as archived nickname is active: %@", (uint8_t *)&v27, 0xCu);
          }

        }
        goto LABEL_18;
      }
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "handle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "recordID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recordID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412802;
          v28 = v19;
          v29 = 2112;
          v30 = v20;
          v31 = 2112;
          v32 = v21;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Replacing archived nickname for handle id %@ from record id %@ to new record id %@", (uint8_t *)&v27, 0x20u);

        }
      }
      -[IMDNicknameController _deleteOnDiskDataIfNeededForNickname:withNewNickname:](self, "_deleteOnDiskDataIfNeededForNickname:withNewNickname:", v13, v4);

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v9);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setArchivedDate:", v22);

    v23 = self->_archivedNicknames;
    objc_msgSend(v13, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v24, v25);

    -[IMDNicknameController archivedNicknamesKVStore](self, "archivedNicknamesKVStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _writeNicknameToKVStore:nickname:](self, "_writeNicknameToKVStore:nickname:", v26, v13);

LABEL_18:
    goto LABEL_19;
  }
  IMLogHandleForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1D1669ADC(v4, v12);
LABEL_19:

}

- (BOOL)_isActiveForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[IMDNicknameController activeRecords](self, "activeRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)markNicknameAsUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v6);
    if (objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v7, 4))
      v8 = 2;
    else
      v8 = 0;
    if (objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v7, 2))
      v9 = v8 | 4;
    else
      v9 = v8;
    v10 = objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v7, 32);
    if (objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v7, 16) | v10)
      v11 = v9 | 8;
    else
      v11 = v9;

  }
  else
  {
    v11 = *MEMORY[0x1E0D38B20];
  }
  -[IMDNicknameController _markPendingNicknameAsCurrent:incrementPendingNicknameVersion:updateType:broadcastUpdates:](self, "_markPendingNicknameAsCurrent:incrementPendingNicknameVersion:updateType:broadcastUpdates:", v12, 1, v11, 1);

}

- (void)_writeNicknameToKVStore:(id)a3 nickname:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "writing nickname %@ to kvstore %@", buf, 0x16u);
    }

  }
  v8 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v6, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (!v10 || v11)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "We had a problem archiving the nickname object %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(v6, "handle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "persistData:forKey:error:", v10, v13, &v18);
    v14 = v18;

    if (v14 && IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "We had a problem writing the nickname to the pendingNicknameUpdatesKVStore %@", buf, 0xCu);
      }

    }
  }

}

- (void)_deleteNicknameFromPendingMap:(id)a3
{
  id v4;

  objc_msgSend(a3, "handle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDNicknameController _deleteHandleIDFromPendingMap:](self, "_deleteHandleIDFromPendingMap:", v4);

}

- (void)_deleteHandleIDFromPendingMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDNicknameController pendingNicknameUpdatesKVStore](self, "pendingNicknameUpdatesKVStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "persistData:forKey:error:", 0, v4, &v9);
  v6 = v9;

  if (v6 && IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got an error trying to remove %@ from the pending map %@", buf, 0x16u);
    }

  }
}

- (void)_deleteHandleIDFromHandledMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDNicknameController handledNicknamesKVStore](self, "handledNicknamesKVStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "persistData:forKey:error:", 0, v4, &v9);
  v6 = v9;

  if (v6 && IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got an error trying to remove %@ from the handled map %@", buf, 0x16u);
    }

  }
}

- (void)_deleteHandleIDFromArchivedMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDNicknameController archivedNicknamesKVStore](self, "archivedNicknamesKVStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "persistData:forKey:error:", 0, v4, &v9);
  v6 = v9;

  if (v6 && IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got an error trying to remove %@ from the handled map %@", buf, 0x16u);
    }

  }
}

- (void)cleanUpNicknameForIDs:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (v4 = (id)objc_msgSend(v4, "count")) != 0)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v5;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "Got called to clean up nickname for ids %@", buf, 0xCu);
      }

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v8)
    {
      v9 = 0;
      v10 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[IMDNicknameController handleAllowList](self, "handleAllowList");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsObject:", v12);

          if (v14)
          {
            if (IMOSLoggingEnabled(v15))
            {
              OSLogHandleForIMFoundationCategory();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v12;
                _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Removing %@ from allow list ", buf, 0xCu);
              }

            }
            -[IMDNicknameController handleAllowList](self, "handleAllowList");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "removeObject:", v12);

            -[IMDNicknameController handleAllowList](self, "handleAllowList");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDNicknameController _updateHandleList:withHandles:forKey:broadcastUpdates:](self, "_updateHandleList:withHandles:forKey:broadcastUpdates:", v18, v19, CFSTR("handleWhitelist"), 0);

            v9 = 1;
          }
          -[IMDNicknameController handleDenyList](self, "handleDenyList");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v12);

          if (v21)
          {
            if (IMOSLoggingEnabled(v22))
            {
              OSLogHandleForIMFoundationCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v12;
                _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Removing %@ from deny list ", buf, 0xCu);
              }

            }
            -[IMDNicknameController handleDenyList](self, "handleDenyList");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObject:", v12);

            -[IMDNicknameController handleDenyList](self, "handleDenyList");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDNicknameController _updateHandleList:withHandles:forKey:broadcastUpdates:](self, "_updateHandleList:withHandles:forKey:broadcastUpdates:", v25, v26, CFSTR("handleBlacklist"), 0);

            v9 = 1;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v8);

      if ((v9 & 1) != 0)
      {
        if (IMOSLoggingEnabled(v27))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "Sending updated allow and deny lists to peers and client", buf, 2u);
          }

        }
        -[IMDNicknameController broadcastHandlesSharingNicknamesDidChange](self, "broadcastHandlesSharingNicknamesDidChange");
        -[IMDNicknameController _updateDenyAllowListHandlesVersion](self, "_updateDenyAllowListHandlesVersion");
        -[IMDNicknameController _syncHandleAllowDenyListToOtherDevices](self, "_syncHandleAllowDenyListToOtherDevices");
      }
    }
    else
    {

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v30 = v7;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (!v31)
    {

LABEL_63:
      v5 = v44;
      goto LABEL_64;
    }
    v32 = 0;
    v33 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        -[NSMutableDictionary objectForKey:](self->_pendingNicknameUpdates, "objectForKey:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          if (IMOSLoggingEnabled(v37))
          {
            OSLogHandleForIMFoundationCategory();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v35;
              _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "Removing %@ from pending nickname updates", buf, 0xCu);
            }

          }
          -[NSMutableDictionary removeObjectForKey:](self->_pendingNicknameUpdates, "removeObjectForKey:", v35);
          -[IMDNicknameController _deleteHandleIDFromPendingMap:](self, "_deleteHandleIDFromPendingMap:", v35);
          v32 = 1;
        }
        -[NSMutableDictionary objectForKey:](self->_handledNicknames, "objectForKey:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          if (IMOSLoggingEnabled(v40))
          {
            OSLogHandleForIMFoundationCategory();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v35;
              _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Removing %@ from handled nickname updates", buf, 0xCu);
            }

          }
          -[NSMutableDictionary removeObjectForKey:](self->_handledNicknames, "removeObjectForKey:", v35);
          -[IMDNicknameController _deleteHandleIDFromHandledMap:](self, "_deleteHandleIDFromHandledMap:", v35);
          v32 = 1;
        }
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v31);

    v5 = v44;
    if ((v32 & 1) != 0)
    {
      if (IMOSLoggingEnabled(v42))
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v43, OS_LOG_TYPE_INFO, "Sending updated handled and pending nicknames to peers and client", buf, 2u);
        }

      }
      -[IMDNicknameController _broadcastNicknamesMapChanged](self, "_broadcastNicknamesMapChanged");
      -[IMDNicknameController _updatePendingNicknameVersion](self, "_updatePendingNicknameVersion");
      -[IMDNicknameController sendPendingNicknameUpdatesDidChange](self, "sendPendingNicknameUpdatesDidChange");
      goto LABEL_63;
    }
  }
  else if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "No handles to clean up, returning.", buf, 2u);
    }

  }
LABEL_64:

}

- (BOOL)_deviceUnderFirstUnlock
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnderFirstDataProtectionLock");

  return v3;
}

- (BOOL)_isUnderScrutiny
{
  void *v2;
  void *v3;
  char v4;

  -[IMDNicknameController defaults](self, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_setUnderScrutiny:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[IMDNicknameController defaults](self, "defaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forDomain:forKey:", v4, *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BA8]);

}

- (void)_deleteDataUnderScrutiny
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    sub_1D1669B70();

  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Deleting data from pending nicknames KVStore", buf, 2u);
    }

  }
  -[IMDNicknameController pendingNicknameUpdatesKVStore](self, "pendingNicknameUpdatesKVStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(objc_msgSend(v6, "deleteDatabase")))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Deleting data from handled nicknames KVStore", v14, 2u);
    }

  }
  -[IMDNicknameController handledNicknamesKVStore](self, "handledNicknamesKVStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(objc_msgSend(v8, "deleteDatabase")))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Deleting data from archived nicknames KVStore", v13, 2u);
    }

  }
  -[IMDNicknameController archivedNicknamesKVStore](self, "archivedNicknamesKVStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(objc_msgSend(v10, "deleteDatabase")))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Exiting scrutiny mode", v12, 2u);
    }

  }
  -[IMDNicknameController _setUnderScrutiny:](self, "_setUnderScrutiny:", 0);

}

- (void)_loadAllInfoFromDiskIfAble
{
  _BOOL8 v3;
  _BOOL8 v4;
  _BOOL4 v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL8 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];
  uint8_t v19[16];

  v3 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v3)
  {
    v4 = -[IMDNicknameController _deviceUnderFirstUnlock](self, "_deviceUnderFirstUnlock");
    v5 = v4;
    v6 = IMOSLoggingEnabled(v4);
    if (v5)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Device is under first unlock so we need to put updates into a temporary map until we leave first unlock", buf, 2u);
        }

      }
      self->_needToLoadMapsInfoFromDisk = 1;
    }
    else
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "We are not under first unlock so we are able to load all data", v17, 2u);
        }

      }
      v10 = -[IMDNicknameController _isUnderScrutiny](self, "_isUnderScrutiny");
      if (v10)
      {
        if (IMOSLoggingEnabled(v10))
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "IMDNicknameController is already in scrutiny mode before attempting to load data from disk. Will delete existing data.", v16, 2u);
          }

        }
        -[IMDNicknameController _deleteDataUnderScrutiny](self, "_deleteDataUnderScrutiny");
      }
      -[IMDNicknameController loadPersonalNicknameIfNeeded](self, "loadPersonalNicknameIfNeeded");
      -[IMDNicknameController reuploadProfileIfNeeded](self, "reuploadProfileIfNeeded");
      -[IMDNicknameController loadNicknamesFromKVStore](self, "loadNicknamesFromKVStore");
      -[IMDNicknameController loadSharingHandlesPrefs](self, "loadSharingHandlesPrefs");
      -[IMDNicknameController loadHandledTransitioned](self, "loadHandledTransitioned");
      -[IMDNicknameController loadUnknownSenderRecordInfoFromKVStore](self, "loadUnknownSenderRecordInfoFromKVStore");
      -[IMDNicknameController activeNicknameRecords](self, "activeNicknameRecords");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController loadListForKey:list:](self, "loadListForKey:list:", CFSTR("activeNicknameRecords"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController setActiveNicknameRecords:](self, "setActiveNicknameRecords:", v13);

      -[IMDNicknameController ignoredNicknameRecords](self, "ignoredNicknameRecords");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController loadListForKey:list:](self, "loadListForKey:list:", CFSTR("ignoredNicknameRecords"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDNicknameController setIgnoredNicknameRecords:](self, "setIgnoredNicknameRecords:", v15);

      -[IMDNicknameController evaluateAccountStateForFeatureEligibility](self, "evaluateAccountStateForFeatureEligibility");
      -[IMDNicknameController _evaluateIfAccountHasMultiplePhoneNumbers](self, "_evaluateIfAccountHasMultiplePhoneNumbers");
      -[IMDNicknameController _uploadPendingNicknameIfNecessary](self, "_uploadPendingNicknameIfNecessary");
      self->_needToLoadMapsInfoFromDisk = 0;
    }
  }
  else if (IMOSLoggingEnabled(v3))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not loading nickname info from disk", v19, 2u);
    }

  }
}

- (void)loadPersonalNicknameIfNeeded
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];

  v3 = -[IMDNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v3)
  {
    -[IMDNicknameController storedPersonalNickname](self, "storedPersonalNickname");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[IMDNicknameController setPersonalNickname:](self, "setPersonalNickname:", v4);
    }
    else
    {
      -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = sub_1D14F95BC;
        v6[3] = &unk_1E922C0D8;
        objc_copyWeak(&v7, (id *)buf);
        -[IMDNicknameController currentPersonalNicknamewithCompletionBlock:](self, "currentPersonalNicknamewithCompletionBlock:", v6);
        objc_destroyWeak(&v7);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled(v3))
      return;
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Not going to load personal nickname, feature is disabled", buf, 2u);
    }
  }

}

- (void)loadNicknamesFromKVStore
{
  NSMutableDictionary *Mutable;
  NSMutableDictionary *pendingNicknameUpdates;
  NSMutableDictionary *v5;
  NSMutableDictionary *handledNicknames;
  NSMutableDictionary *v7;
  NSMutableDictionary *archivedNicknames;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSMutableDictionary *v13;
  void *v14;
  _BOOL4 v15;
  NSMutableDictionary *v16;
  void *v17;
  _BOOL4 v18;
  NSMutableDictionary *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  NSMutableDictionary *v31;
  uint64_t v32;
  NSObject *v33;
  NSMutableDictionary *v34;
  NSObject *v35;
  NSMutableDictionary *v36;
  int v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!self->_pendingNicknameUpdates)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    pendingNicknameUpdates = self->_pendingNicknameUpdates;
    self->_pendingNicknameUpdates = Mutable;

  }
  if (!self->_handledNicknames)
  {
    v5 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    handledNicknames = self->_handledNicknames;
    self->_handledNicknames = v5;

  }
  if (!self->_archivedNicknames)
  {
    v7 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    archivedNicknames = self->_archivedNicknames;
    self->_archivedNicknames = v7;

  }
  v9 = IMOSLoggingEnabled(self);
  if ((_DWORD)v9)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0x7FFFFFFFLL);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138412290;
      v38 = v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Limit to load of nicknames %@", (uint8_t *)&v37, 0xCu);

    }
  }
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Setting the IMDNicknameController scrutiny flag", (uint8_t *)&v37, 2u);
    }

  }
  -[IMDNicknameController _setUnderScrutiny:](self, "_setUnderScrutiny:", 1);
  v13 = self->_pendingNicknameUpdates;
  -[IMDNicknameController pendingNicknameUpdatesKVStore](self, "pendingNicknameUpdatesKVStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[IMDNicknameController _populateNicknameDictionary:forKVStore:limitToLoad:](self, "_populateNicknameDictionary:forKVStore:limitToLoad:", v13, v14, 0x7FFFFFFFLL);

  v16 = self->_handledNicknames;
  -[IMDNicknameController handledNicknamesKVStore](self, "handledNicknamesKVStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[IMDNicknameController _populateNicknameDictionary:forKVStore:limitToLoad:](self, "_populateNicknameDictionary:forKVStore:limitToLoad:", v16, v17, 0x7FFFFFFFLL);

  v19 = self->_archivedNicknames;
  -[IMDNicknameController archivedNicknamesKVStore](self, "archivedNicknamesKVStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[IMDNicknameController _populateNicknameDictionary:forKVStore:limitToLoad:](self, "_populateNicknameDictionary:forKVStore:limitToLoad:", v19, v20, 0x7FFFFFFFLL);

  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Clearing the IMDNicknameController scrutiny flag", (uint8_t *)&v37, 2u);
    }

  }
  v24 = -[IMDNicknameController _setUnderScrutiny:](self, "_setUnderScrutiny:", 0);
  if (!v15 || !v18 || !v21)
  {
    v24 = IMOSLoggingEnabled(v24);
    if ((_DWORD)v24)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = CFSTR("NO");
        if (v18)
          v27 = CFSTR("YES");
        else
          v27 = CFSTR("NO");
        if (v15)
          v28 = CFSTR("YES");
        else
          v28 = CFSTR("NO");
        v37 = 138412802;
        v38 = (void *)v27;
        v39 = 2112;
        v40 = v28;
        if (v21)
          v26 = CFSTR("YES");
        v41 = 2112;
        v42 = v26;
        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "We did not have success loading handled nicknames %@ - updates %@ - archived %@", (uint8_t *)&v37, 0x20u);
      }

    }
  }
  v29 = IMOSLoggingEnabled(v24);
  if ((_DWORD)v29)
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = self->_pendingNicknameUpdates;
      v37 = 138412290;
      v38 = v31;
      _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Created pending nickname map %@", (uint8_t *)&v37, 0xCu);
    }

  }
  v32 = IMOSLoggingEnabled(v29);
  if ((_DWORD)v32)
  {
    OSLogHandleForIMFoundationCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = self->_handledNicknames;
      v37 = 138412290;
      v38 = v34;
      _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Created handled nickname map %@", (uint8_t *)&v37, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v32))
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = self->_archivedNicknames;
      v37 = 138412290;
      v38 = v36;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Created archived nickname map %@", (uint8_t *)&v37, 0xCu);
    }

  }
}

- (void)loadHandledTransitioned
{
  NSMutableSet *v3;
  NSMutableSet *handleTransitionedList;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!self->_handleTransitionedList)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    handleTransitionedList = self->_handleTransitionedList;
    self->_handleTransitionedList = v3;

  }
  -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v5, "dataForKey:error:", CFSTR("handleTransitionedList"), &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;

  if (v7)
  {
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v29 = (uint64_t)v7;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the handle transitioned list data store %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v6)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v6, &v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v26;
      v18 = v17;
      if (v17 && IMOSLoggingEnabled(v17))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v29 = (uint64_t)v18;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive transitioned list %@", buf, 0xCu);
        }

      }
      -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "unionSet:", v16);

    }
    else
    {
      v21 = IMOSLoggingEnabled(v14);
      if ((_DWORD)v21)
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "No transitioned list data to load", buf, 2u);
        }

      }
      v16 = 0;
      v18 = 0;
    }
    if (IMOSLoggingEnabled(v21))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        -[IMDNicknameController handleTransitionedList](self, "handleTransitionedList");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");
        *(_DWORD *)buf = 134217984;
        v29 = v25;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Successfully loaded %lu transitioned list handles", buf, 0xCu);

      }
    }

  }
}

- (id)loadListForKey:(id)a3 list:(id)a4
{
  id v6;
  CFMutableDictionaryRef Mutable;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Mutable = (CFMutableDictionaryRef)a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  -[IMDNicknameController nicknameRecordsKVStore](self, "nicknameRecordsKVStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v9, "dataForKey:error:", v6, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;

  if (v11)
  {
    if (!IMOSLoggingEnabled(v12))
    {
LABEL_8:
      v14 = v8;
      goto LABEL_9;
    }
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = (uint64_t)v11;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the data store %@", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (!v10)
  {
    if (!IMOSLoggingEnabled(v12))
      goto LABEL_8;
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "No list data to load", buf, 2u);
    }
    goto LABEL_7;
  }
  v16 = (void *)MEMORY[0x1E0CB3710];
  v17 = objc_opt_class();
  v25 = 0;
  objc_msgSend(v16, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v17, objc_opt_class(), v10, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v25;
  if (v19)
  {
    v20 = v19;
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = (uint64_t)v20;
        _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive list %@", buf, 0xCu);
      }

    }
    v14 = v8;

  }
  else
  {
    v22 = (void *)objc_msgSend(v18, "mutableCopy");

    if (IMOSLoggingEnabled(objc_msgSend(v22, "addEntriesFromDictionary:", Mutable)))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 134217984;
        v28 = v24;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Successfully loaded %lu list handles", buf, 0xCu);
      }

    }
    v14 = v22;

  }
LABEL_9:

  return v14;
}

- (void)loadSharingHandlesPrefs
{
  NSMutableSet *v3;
  NSMutableSet *handleAllowList;
  NSMutableSet *v5;
  NSMutableSet *handleDenyList;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!self->_handleAllowList)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    handleAllowList = self->_handleAllowList;
    self->_handleAllowList = v3;

  }
  if (!self->_handleDenyList)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    handleDenyList = self->_handleDenyList;
    self->_handleDenyList = v5;

  }
  -[IMDNicknameController handleSharingKVStore](self, "handleSharingKVStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v7, "dataForKey:error:", CFSTR("handleWhitelist"), &v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v44;

  if (!v9)
  {
    -[IMDNicknameController handleSharingKVStore](self, "handleSharingKVStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v12, "dataForKey:error:", CFSTR("handleBlacklist"), &v43);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v43;

    if (v9)
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v46 = (uint64_t)v9;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the handle deny list data store %@", buf, 0xCu);
        }

      }
LABEL_43:

      goto LABEL_44;
    }
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v8)
    {
      v42 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v20, v8, &v42);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v42;
      v23 = v22;
      if (v22 && IMOSLoggingEnabled(v22))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v46 = (uint64_t)v23;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive allow list %@", buf, 0xCu);
        }

      }
      -[IMDNicknameController handleAllowList](self, "handleAllowList");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "unionSet:", v40);

      if (v13)
      {
LABEL_22:
        v41 = v23;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v21, v13, &v41);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v41;

        if (v28 && IMOSLoggingEnabled(v29))
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = (uint64_t)v28;
            _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive deny list %@", buf, 0xCu);
          }

        }
        -[IMDNicknameController handleDenyList](self, "handleDenyList");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "unionSet:", v27);

LABEL_38:
        if (IMOSLoggingEnabled(v32))
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            -[IMDNicknameController handleAllowList](self, "handleAllowList");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "count");
            -[IMDNicknameController handleDenyList](self, "handleDenyList");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "count");
            *(_DWORD *)buf = 134218240;
            v46 = v37;
            v47 = 2048;
            v48 = v39;
            _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Successfully loaded %lu allow list handles %lu deny list handles", buf, 0x16u);

          }
        }

        goto LABEL_43;
      }
    }
    else
    {
      v26 = IMOSLoggingEnabled(v20);
      if ((_DWORD)v26)
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "No allow list data to load", buf, 2u);
        }

      }
      v40 = 0;
      v23 = 0;
      if (v13)
        goto LABEL_22;
    }
    v32 = IMOSLoggingEnabled(v26);
    if ((_DWORD)v32)
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, "No deny list data to load", buf, 2u);
      }

    }
    v27 = 0;
    v28 = v23;
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = (uint64_t)v9;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the handle allow list data store %@", buf, 0xCu);
    }

  }
LABEL_44:

}

- (void)loadUnknownSenderRecordInfoFromKVStore
{
  NSMutableDictionary *Mutable;
  NSMutableDictionary *unknownSenderRecordInfo;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_unknownSenderRecordInfo)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    unknownSenderRecordInfo = self->_unknownSenderRecordInfo;
    self->_unknownSenderRecordInfo = Mutable;

  }
  -[IMDNicknameController unknownSenderRecordInfoKVStore](self, "unknownSenderRecordInfoKVStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v5, "dataForKey:error:", CFSTR("unknownSenderRecordInfoKey"), &v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;

  if (v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (uint64_t)v6;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the unknown sender payload data store %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v29)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v17, v29, &v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v30;
      v21 = v20;
      if (v20 && IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = (uint64_t)v21;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive unknown sender payloads list %@", buf, 0xCu);
        }

      }
      -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addEntriesFromDictionary:", v19);

    }
    else
    {
      v24 = IMOSLoggingEnabled(v17);
      if ((_DWORD)v24)
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "No unknown sender info payloads data to load", buf, 2u);
        }

      }
    }
    if (IMOSLoggingEnabled(v24))
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        -[IMDNicknameController unknownSenderRecordInfo](self, "unknownSenderRecordInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");
        *(_DWORD *)buf = 134217984;
        v33 = v28;
        _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Successfully loaded %lu unknown sender payload list handles", buf, 0xCu);

      }
    }

  }
}

- (BOOL)_populateNicknameDictionary:(id)a3 forKVStore:(id)a4 limitToLoad:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v34 = 0;
  v25 = a4;
  objc_msgSend(v25, "datasUpToLimit:deleteContext:error:", a5, 0, &v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v34;
  v27 = v7;
  if (v7)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v27;
        _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "We got an error loading the nicknames data store %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v26;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E0CB3710];
          IMNicknameUnarchivingClasses();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0;
          objc_msgSend(v14, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v15, v13, &v29);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v29;

          if (v16)
            v19 = v17 == 0;
          else
            v19 = 0;
          if (v19)
          {
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v16);
            objc_msgSend(v21, "handle");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "handle");
              v23 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKey:", v16, v23);
            }
            else
            {
              IMLogHandleForCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v21;
                _os_log_error_impl(&dword_1D1413000, v23, OS_LOG_TYPE_ERROR, "Nickname does not have a handle %@", buf, 0xCu);
              }
            }

          }
          else if (IMOSLoggingEnabled(v18))
          {
            OSLogHandleForIMFoundationCategory();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v36 = v17;
              v37 = 2112;
              v38 = v9;
              _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "We had an error %@ unarchiving data %@", buf, 0x16u);
            }

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v10);
    }

  }
  return v27 == 0;
}

- (void)_makeAllNicknameContentsClassC
{
  void *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController defaults](self, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0D38B10];
  v22 = *MEMORY[0x1E0D38B48];
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:");

  if ((v3 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Converting all nickname contents to Class C!", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D38B18];
    objc_msgSend(v6, "enumeratorAtPath:", *MEMORY[0x1E0D38B18]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *MEMORY[0x1E0CB2AD8];
      v11 = *MEMORY[0x1E0CB2AC0];
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v10;
        v30[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v15 = objc_msgSend(v12, "setAttributes:ofItemAtPath:error:", v13, v14, &v24);
        v16 = v24;

        if ((v15 & 1) == 0 && IMOSLoggingEnabled(v17))
        {
          OSLogHandleForIMFoundationCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v9;
            v27 = 2112;
            v28 = v16;
            _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
          }

        }
        objc_msgSend(v8, "nextObject");
        v19 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v19;
      }
      while (v19);
    }
    -[IMDNicknameController defaults](self, "defaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBool:forDomain:forKey:", 1, v22, v21);

  }
}

- (void)_storePublicNickname:(id)a3 nicknameLocation:(id)a4 encryptionKey:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v43 = a6;
  v42 = a7;
  v40 = a8;
  if (IMOSLoggingEnabled(v40))
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v48 = (uint64_t)v14;
      v49 = 2112;
      v50 = (uint64_t)v15;
      _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Storing personal nickname %@ and recordID %@ on disk", buf, 0x16u);
    }

  }
  objc_msgSend(v15, "dataUsingEncoding:", 4, v40);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = IMOSLoggingEnabled(v19);
  if ((_DWORD)v20)
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v19, "length");
      v23 = objc_msgSend(v18, "length");
      v24 = objc_msgSend(v16, "length");
      *(_DWORD *)buf = 134218496;
      v48 = v22;
      v49 = 2048;
      v50 = v23;
      v51 = 2048;
      v52 = v24;
      _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Writing nickname data of size %lu, recordID data of size %lu, and encryption key of size %lu to disk", buf, 0x20u);
    }

  }
  if (v19)
  {
    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v25, "persistData:forKey:error:", v18, CFSTR("NicknameRecordID"), &v46);
    v26 = (unint64_t)v46;

    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v27, "persistData:forKey:error:", v16, CFSTR("NicknameRecordKey"), &v45);
    v28 = (unint64_t)v45;

    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v29, "persistData:forKey:error:", v19, CFSTR("NicknameDataKey"), &v44);
    v30 = v44;

    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "persistData:forKey:error:", v43, CFSTR("NicknameWallpaperDataTag"), 0);

    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "persistData:forKey:error:", v42, CFSTR("NicknameLowResWallpaperDataTag"), 0);

    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "persistData:forKey:error:", v41, CFSTR("NicknameWallpaperMetadataTag"), 0);

    if (v26 | v28)
    {
      IMLogHandleForCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_1D1669C68();

      -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "persistData:forKey:error:", 0, CFSTR("NicknameRecordKey"), 0);

      -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "persistData:forKey:error:", 0, CFSTR("NicknameRecordID"), 0);

    }
    if (v30)
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_1D1669C08();

      -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "persistData:forKey:error:", 0, CFSTR("NicknameDataKey"), 0);

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v20))
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "Personal nickname data is nil, not writing to disk", buf, 2u);
      }

    }
    v26 = 0;
    v28 = 0;
    v30 = 0;
  }

}

- (void)_storePendingNicknameForUpload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Storing pending nickname %@ while waiting on upload", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "persistData:forKey:error:", v6, CFSTR("NicknamePendingKey"), &v11);
    v8 = v11;

    if (v8)
    {
      IMLogHandleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1D1669CC8();

      -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "persistData:forKey:error:", 0, CFSTR("NicknamePendingKey"), 0);

    }
  }

}

- (id)_getPendingNicknameForUpload
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v12;
  uint8_t buf[16];
  id v14;
  id v15;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknamePendingKey"), &v15);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v15;

  if (v4)
  {

    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1D1669D88();
LABEL_4:
    v5 = 0;
    goto LABEL_11;
  }
  if (!-[NSObject length](v3, "length"))
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "storedPersonalNickname is nil", buf, 2u);
      }

    }
    goto LABEL_4;
  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v3, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v9)
  {

    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1D1669D28();

    v5 = 0;
  }

LABEL_11:
  return v5;
}

- (void)_deletePendingNicknameForUpload
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "persistData:forKey:error:", 0, CFSTR("NicknamePendingKey"), &v6);
  v3 = v6;

  if (v3 && IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Error deleting data from kvStore %@", buf, 0xCu);
    }

  }
}

- (void)_deletePublicNicknameLocationAndKey
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "persistData:forKey:error:", 0, CFSTR("NicknameRecordID"), &v21);
  v4 = v21;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v5, "persistData:forKey:error:", 0, CFSTR("NicknameRecordKey"), &v20);
  v6 = v20;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v6;
  objc_msgSend(v7, "persistData:forKey:error:", 0, CFSTR("NicknameDataKey"), &v19);
  v8 = v19;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  objc_msgSend(v9, "persistData:forKey:error:", 0, CFSTR("NicknameWallpaperDataTag"), &v18);
  v10 = v18;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  objc_msgSend(v11, "persistData:forKey:error:", 0, CFSTR("NicknameLowResWallpaperDataTag"), &v17);
  v12 = v17;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(v13, "persistData:forKey:error:", 0, CFSTR("NicknameWallpaperMetadataTag"), &v16);
  v14 = v16;

  -[IMDNicknameController setPersonalNickname:](self, "setPersonalNickname:", 0);
  if (v14)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1D1669DE8();

  }
}

- (id)nickNameDecryptionKey
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknameRecordKey"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v4)
  {

    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D1669E48();

    v3 = 0;
  }

  return v3;
}

- (id)wallpaperDataTag
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknameWallpaperDataTag"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v4)
  {

    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D1669EA8();

    v3 = 0;
  }

  return v3;
}

- (id)lowResWallpaperDataTag
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknameLowResWallpaperDataTag"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v4)
  {

    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D1669F08();

    v3 = 0;
  }

  return v3;
}

- (id)wallpaperMetadataTag
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknameWallpaperMetadataTag"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;

  if (v4)
  {

    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D1669F68();

    v3 = 0;
  }

  return v3;
}

- (id)nickNameRecordID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v8;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknameRecordID"), &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;

  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v5 = 0;
    if (!v4)
      goto LABEL_8;
  }

  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1D1669E48();

  v5 = 0;
LABEL_8:

  return v5;
}

- (id)storedPersonalNickname
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[8];
  id v23;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v3, "dataForKey:error:", CFSTR("NicknameDataKey"), &v23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v23;

  if (v5)
  {

    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1D1669FC8();

    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Error Loading Personal Nickname From Disk"), v8);

LABEL_5:
    v9 = 0;
    goto LABEL_29;
  }
  if (!v4)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Stored personal nickname doesn't exist", buf, 2u);
      }

    }
    if (-[IMDNicknameController _isNicknamesSharingEnabled](self, "_isNicknamesSharingEnabled"))
      -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("No Personal Nickname On Disk"), 0);
    goto LABEL_5;
  }
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v12, v4, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  if (v13)
  {

    IMLogHandleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1D1669D28();
    v9 = 0;
    goto LABEL_19;
  }
  if (v9)
  {
    objc_msgSend(v9, "description");
    v14 = objc_claimAutoreleasedReturnValue();
    -[IMDNicknameController _showDebugAlertWithHeader:message:](self, "_showDebugAlertWithHeader:message:", CFSTR("Loaded Personal Nickname From Disk"), v14);
LABEL_19:

  }
  objc_msgSend(v9, "recordID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Nickname loaded from disk did not have a recordID. Attempting to load recordID from disk.", buf, 2u);
      }

    }
    -[IMDNicknameController nickNameRecordID](self, "nickNameRecordID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v9, "setRecordID:", v19);

  }
LABEL_29:

  return v9;
}

- (id)pendingPersonalNickname
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  id v13;

  -[IMDNicknameController cloudkitRecordsKVStore](self, "cloudkitRecordsKVStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("NicknamePendingKey"), &v13);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v13;

  if (v4)
  {

    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1D166A088();
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v3, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v9)
    {

      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1D166A028();

      v5 = 0;
    }

  }
  return v5;
}

- (void)_deleteAvatarForNickname:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  objc_msgSend(a3, "avatar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v4, &v8);
  v6 = v8;

  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1D166A0E8();

  }
}

- (id)allNicknames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController archivedNicknames](self, "archivedNicknames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)nicknameForRecordID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[IMDNicknameController allNicknames](self, "allNicknames", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8));
          objc_msgSend(v9, "recordID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {

            goto LABEL_20;
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
        if (v6)
          continue;
        break;
      }
    }

    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Did not find nickname for recordID %@", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Passed in empty recordID", buf, 2u);
    }

  }
  v9 = 0;
LABEL_20:

  return v9;
}

- (id)nicknameForRecordID:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    -[IMDNicknameController nicknameForHandle:](self, "nicknameForHandle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "recordID"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v6, "isEqualToString:", v10),
          v10,
          v11))
    {
      v12 = v9;
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Found existing nickname", (uint8_t *)&v16, 2u);
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled(v8))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = 138412290;
          v17 = v7;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "No nickname for handle %@", (uint8_t *)&v16, 0xCu);
        }

      }
      v12 = 0;
    }

  }
  else
  {
    -[IMDNicknameController nicknameForRecordID:](self, "nicknameForRecordID:", v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)nicknameForHandleURI:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "I'm being asked for handleURI %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(v4, "_stripFZIDPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDNicknameController nicknameForHandle:](self, "nicknameForHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)nicknameForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[IMDNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[IMDNicknameController handledNicknames](self, "handledNicknames"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKey:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)substringRecordIDForNickname:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5 < 5)
  {
    v7 = &stru_1E92346B0;
  }
  else
  {
    objc_msgSend(v3, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringToIndex:", 3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)transferServicesController
{
  return (id)objc_msgSend(MEMORY[0x1E0D39CD8], "sharedInstance");
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "System did leave first unlock, loading maps into memory", v4, 2u);
    }

  }
  -[IMDNicknameController _loadAllInfoFromDiskIfAble](self, "_loadAllInfoFromDiskIfAble");
}

- (void)markAllNicknamesAsPending
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMDNicknameController loadNicknamesFromKVStore](self, "loadNicknamesFromKVStore");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IMDNicknameController handledNicknames](self, "handledNicknames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[IMDNicknameController handledNicknames](self, "handledNicknames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithDictionaryRepresentation:", v11);
        -[IMDNicknameController _deleteHandleIDFromHandledMap:](self, "_deleteHandleIDFromHandledMap:", v9);
        objc_msgSend(v12, "setRecordID:", CFSTR("FakeID"));
        objc_msgSend(v12, "setFirstName:", CFSTR("First"));
        objc_msgSend(v12, "setLastName:", CFSTR("Last"));
        -[IMDNicknameController addNicknameToPendingUpdates:](self, "addNicknameToPendingUpdates:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (IMNickname)personalNickname
{
  return self->_personalNickname;
}

- (IDSKVStore)cloudkitRecordsKVStore
{
  return self->_cloudkitRecordsKVStore;
}

- (void)setCloudkitRecordsKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_cloudkitRecordsKVStore, a3);
}

- (double)lastMeContactStoreSync
{
  return self->_lastMeContactStoreSync;
}

- (void)setLastMeContactStoreSync:(double)a3
{
  self->_lastMeContactStoreSync = a3;
}

- (IDSKVStore)pendingNicknameUpdatesKVStore
{
  return self->_pendingNicknameUpdatesKVStore;
}

- (void)setPendingNicknameUpdatesKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNicknameUpdatesKVStore, a3);
}

- (IDSKVStore)handledNicknamesKVStore
{
  return self->_handledNicknamesKVStore;
}

- (void)setHandledNicknamesKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_handledNicknamesKVStore, a3);
}

- (IDSKVStore)archivedNicknamesKVStore
{
  return self->_archivedNicknamesKVStore;
}

- (void)setArchivedNicknamesKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_archivedNicknamesKVStore, a3);
}

- (IDSKVStore)unknownSenderRecordInfoKVStore
{
  return self->_unknownSenderRecordInfoKVStore;
}

- (void)setUnknownSenderRecordInfoKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_unknownSenderRecordInfoKVStore, a3);
}

- (IDSKVStore)handleSharingKVStore
{
  return self->_handleSharingKVStore;
}

- (void)setHandleSharingKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_handleSharingKVStore, a3);
}

- (IDSKVStore)nicknameRecordsKVStore
{
  return self->_nicknameRecordsKVStore;
}

- (void)setNicknameRecordsKVStore:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameRecordsKVStore, a3);
}

- (void)setPendingNicknameUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNicknameUpdates, a3);
}

- (NSMutableSet)handleTransitionedList
{
  return self->_handleTransitionedList;
}

- (void)setHandleTransitionedList:(id)a3
{
  objc_storeStrong((id *)&self->_handleTransitionedList, a3);
}

- (NSMutableDictionary)activeNicknameRecords
{
  return self->_activeNicknameRecords;
}

- (void)setActiveNicknameRecords:(id)a3
{
  objc_storeStrong((id *)&self->_activeNicknameRecords, a3);
}

- (NSMutableDictionary)ignoredNicknameRecords
{
  return self->_ignoredNicknameRecords;
}

- (void)setIgnoredNicknameRecords:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredNicknameRecords, a3);
}

- (void)setHandledNicknames:(id)a3
{
  objc_storeStrong((id *)&self->_handledNicknames, a3);
}

- (void)setArchivedNicknames:(id)a3
{
  objc_storeStrong((id *)&self->_archivedNicknames, a3);
}

- (NSMutableDictionary)unknownSenderRecordInfo
{
  return self->_unknownSenderRecordInfo;
}

- (void)setUnknownSenderRecordInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unknownSenderRecordInfo, a3);
}

- (void)setHandleAllowList:(id)a3
{
  objc_storeStrong((id *)&self->_handleAllowList, a3);
}

- (void)setHandleDenyList:(id)a3
{
  objc_storeStrong((id *)&self->_handleDenyList, a3);
}

- (BOOL)needToLoadMapsInfoFromDisk
{
  return self->_needToLoadMapsInfoFromDisk;
}

- (void)setNeedToLoadMapsInfoFromDisk:(BOOL)a3
{
  self->_needToLoadMapsInfoFromDisk = a3;
}

- (NSMutableArray)chatsToSendNicknameInfoTo
{
  return self->_chatsToSendNicknameInfoTo;
}

- (void)setChatsToSendNicknameInfoTo:(id)a3
{
  objc_storeStrong((id *)&self->_chatsToSendNicknameInfoTo, a3);
}

- (BOOL)nicknameIsUploadingToCK
{
  return self->_nicknameIsUploadingToCK;
}

- (void)setNicknameIsUploadingToCK:(BOOL)a3
{
  self->_nicknameIsUploadingToCK = a3;
}

- (IDSService)nicknameService
{
  return self->_nicknameService;
}

- (void)setNicknameService:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameService, a3);
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_callHistoryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_nicknameService, 0);
  objc_storeStrong((id *)&self->_chatsToSendNicknameInfoTo, 0);
  objc_storeStrong((id *)&self->_handleDenyList, 0);
  objc_storeStrong((id *)&self->_handleAllowList, 0);
  objc_storeStrong((id *)&self->_unknownSenderRecordInfo, 0);
  objc_storeStrong((id *)&self->_archivedNicknames, 0);
  objc_storeStrong((id *)&self->_handledNicknames, 0);
  objc_storeStrong((id *)&self->_ignoredNicknameRecords, 0);
  objc_storeStrong((id *)&self->_activeNicknameRecords, 0);
  objc_storeStrong((id *)&self->_handleTransitionedList, 0);
  objc_storeStrong((id *)&self->_pendingNicknameUpdates, 0);
  objc_storeStrong((id *)&self->_nicknameRecordsKVStore, 0);
  objc_storeStrong((id *)&self->_handleSharingKVStore, 0);
  objc_storeStrong((id *)&self->_unknownSenderRecordInfoKVStore, 0);
  objc_storeStrong((id *)&self->_archivedNicknamesKVStore, 0);
  objc_storeStrong((id *)&self->_handledNicknamesKVStore, 0);
  objc_storeStrong((id *)&self->_pendingNicknameUpdatesKVStore, 0);
  objc_storeStrong((id *)&self->_cloudkitRecordsKVStore, 0);
  objc_storeStrong((id *)&self->_personalNickname, 0);
}

@end
