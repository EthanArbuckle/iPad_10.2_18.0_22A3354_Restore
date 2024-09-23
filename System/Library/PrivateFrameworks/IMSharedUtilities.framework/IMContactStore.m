@implementation IMContactStore

+ (id)sharedInstance
{
  if (qword_1ECFC7640 != -1)
    dispatch_once(&qword_1ECFC7640, &unk_1E3FB3928);
  return (id)qword_1ECFC75A0;
}

+ (BOOL)shouldShowAbbreviatedNames
{
  void *v2;
  void *v3;
  char v4;

  if (qword_1ECFC6F30 != -1)
    dispatch_once(&qword_1ECFC6F30, &unk_1E3FB7F48);
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (byte_1EE503820)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isShortNameFormatEnabled");

  return v4;
}

+ (Class)IMCNContactFormatterClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7458;
}

+ (id)abbreviatedNameForCNContact:(id)a3
{
  id v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "_stringFromContact:withStyle:", v3, 1000);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)fetchCNContactsForHandlesWithIDs:(id)a3 isFinalBatch:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v28 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v30, "startTimingForKey:", CFSTR("Fetch CNContacts For HandleIDs"));
  v29 = v5;
  +[IMContactStore validateAndFilterIDsForContactsBatchFetch:](IMContactStore, "validateAndFilterIDsForContactsBatchFetch:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v38 = objc_msgSend(v5, "count");
      v39 = 2048;
      v40 = objc_msgSend(v31, "count");
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "%lu handles passed in. %lu valid IDs for batch fetch", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v31;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_handleIDToCNIDMap, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && (objc_msgSend(v14, "containsString:", CFSTR("IMDCNPersonNotFound")) & 1) == 0)
            objc_msgSend(v7, "addObject:", v15);
          else
            objc_msgSend(v8, "addObject:", v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v10);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(v7, "count");
      v18 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218240;
      v38 = v17;
      v39 = 2048;
      v40 = v18;
      _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "%lu handles found in aliasCNID cache. Did not find %lu in cache.", buf, 0x16u);
    }

  }
  if (objc_msgSend(v8, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Handles without CNID in cache are:", buf, 2u);
      }

    }
    +[IMContactStore logHandleIDs:checkAdditionalLoggingEnabled:](IMContactStore, "logHandleIDs:checkAdditionalLoggingEnabled:", v8, 0);
  }
  if (objc_msgSend(v7, "count"))
  {
    if (!objc_msgSend(v7, "count")
      || (v20 = objc_msgSend(v7, "count"),
          v21 = objc_msgSend(v7, "count"),
          (float)((float)v20 / (float)((float)v21 + (float)(unint64_t)objc_msgSend(v8, "count"))) >= 0.1))
    {
      -[IMContactStore _fetchContactsWithIdentifiers:usingCNID:](self, "_fetchContactsWithIdentifiers:usingCNID:", v7, 1);
      goto LABEL_41;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Refetching as we don't have anything in IMDP cache", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = (uint64_t)v8;
      _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Refetching contacts from MobileSMS using handle IDs: %@", buf, 0xCu);
    }

  }
  -[IMContactStore _fetchContactsWithIdentifiers:usingCNID:](self, "_fetchContactsWithIdentifiers:usingCNID:", v8, 0);
LABEL_41:
  objc_msgSend(v30, "stopTimingForKey:", CFSTR("Fetch CNContacts For HandleIDs"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v30, "totalTimeForKey:", CFSTR("Fetch CNContacts For HandleIDs"));
      v26 = CFSTR("Initial");
      if (v28)
        v26 = CFSTR("Final");
      *(_DWORD *)buf = 138412546;
      v38 = (uint64_t)v26;
      v39 = 2048;
      v40 = v25;
      _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "%@ Batch Fetch completed. Took %f seconds", buf, 0x16u);
    }

  }
  if (v28)
  {
    +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBatchFetchingCompleted");

    dispatch_async(MEMORY[0x1E0C80D38], &unk_1E3FB7E98);
  }

}

+ (id)validateAndFilterIDsForContactsBatchFetch:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "length"))
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_14;
  }
  if (+[IMContactStore shouldShowNickNames](IMContactStore, "shouldShowNickNames"))
  {
    +[IMContactStore nickNameForCNContact:](IMContactStore, "nickNameForCNContact:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      goto LABEL_14;

  }
  +[IMContactStore fullNameForCNContact:](IMContactStore, "fullNameForCNContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    +[IMContactStore companyNameForCNContact:](IMContactStore, "companyNameForCNContact:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = v5;
LABEL_13:

      v4 = v6;
      goto LABEL_14;
    }
    if (!IMIsRunningInCarousel())
    {
      +[IMContactStore abbreviatedNameForCNContact:](IMContactStore, "abbreviatedNameForCNContact:", v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
        goto LABEL_13;

    }
    v6 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v4;
}

+ (BOOL)shouldShowNickNames
{
  void *v2;
  void *v3;
  char v4;

  if (qword_1ECFC6F38 != -1)
    dispatch_once(&qword_1ECFC6F38, &unk_1E3FB7F28);
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (byte_1EE5040C8)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "shortNameFormatPrefersNicknames");

  return v4;
}

+ (id)nickNameForCNContact:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "nickname");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)fullNameForCNContact:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_stringFromContact:withStyle:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = v4;
    }
    else
    {
      +[IMContactStore firstNameForCNContact:](IMContactStore, "firstNameForCNContact:", v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_stringFromContact:(id)a3 withStyle:(int64_t)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD aBlock[4];
  id v12;
  uint64_t *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_19E24764C;
  v19 = sub_19E24750C;
  v20 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_19E23E018;
  aBlock[3] = &unk_1E3FB7F08;
  v13 = &v15;
  v6 = v5;
  v12 = v6;
  v14 = a4;
  v7 = _Block_copy(aBlock);
  +[IMContactStore IMContactStoreQueue](IMContactStore, "IMContactStoreQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v8, v7);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (id)IMContactStoreQueue
{
  if (qword_1ECFC6E68 != -1)
    dispatch_once(&qword_1ECFC6E68, &unk_1E3FB7EE0);
  return (id)qword_1ECFC6E70;
}

- (id)fetchCNContactForHandleID:(id)a3 withKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  CNContactStore *contactStore;
  double v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  char v29;
  NSObject *v30;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    if (+[IMContactStore _shouldAllowContactStoreLookup](IMContactStore, "_shouldAllowContactStoreLookup"))
    {
      +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v8;
          _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Adding to validatedID:%@", buf, 0xCu);
        }

      }
      if (!objc_msgSend(v8, "length") || (MEMORY[0x1A1AE7CF8](v8) & 1) != 0)
      {
        v10 = 0;
LABEL_66:

        goto LABEL_67;
      }
      -[IMContactStore getContactForID:](self, "getContactForID:", v8);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "areKeysAvailable:", v7))
        goto LABEL_64;
      if (IMIsRunningInMessages()
        && !-[IMContactStore isBatchFetchingForLaunchCompleted](self, "isBatchFetchingForLaunchCompleted"))
      {
        v22 = objc_msgSend(v12, "areKeysAvailable:", v7);
        v23 = IMOSLoggingEnabled();
        if (!v22)
        {
          if (v23)
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v12;
              _os_log_impl(&dword_19E239000, v27, OS_LOG_TYPE_INFO, "Batch fetching is still in process, but our cached contact does not have the required keys: %@. Returning: nil.", buf, 0xCu);
            }

          }
          v10 = 0;
          goto LABEL_65;
        }
        if (v23)
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v12;
            _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "Batch fetching is still in process, returning: %@.", buf, 0xCu);
          }

        }
        goto LABEL_64;
      }
      +[IMContactStore predicateForID:](IMContactStore, "predicateForID:", v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMContactStore keysForCNContact](IMContactStore, "keysForCNContact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayByExcludingObjectsInArray:", v13);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && v34)
      {
        objc_msgSend(v13, "arrayByAddingObjectsFromArray:");
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
      }
      if (!v35)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v8;
            _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Failed to fetch predicate for id: %@.", buf, 0xCu);
          }

        }
        v10 = 0;
        v20 = 1;
LABEL_63:

        if (v20)
        {
LABEL_65:

          goto LABEL_66;
        }
LABEL_64:
        v12 = v12;
        v10 = v12;
        goto LABEL_65;
      }
      v15 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
      objc_msgSend(v15, "startTimingForKey:", CFSTR("Contacts Singular Fetch"));
      contactStore = self->_contactStore;
      v36 = 0;
      -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v35, v13, &v36);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v36;
      objc_msgSend(v10, "firstObject");
      v33 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stopTimingForKey:", CFSTR("Contacts Singular Fetch"));
      objc_msgSend(v15, "totalTimeForKey:", CFSTR("Contacts Singular Fetch"));
      if (v17 > 0.1 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "totalTimeForKey:", CFSTR("Contacts Singular Fetch"));
          *(_DWORD *)buf = 134217984;
          v38 = v19;
          _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Contacts Store fetch completed. Took %f seconds", buf, 0xCu);
        }

      }
      if (v33)
      {
        +[IMContactStore logCNContact:](IMContactStore, "logCNContact:");
        -[IMContactStore addContact:withID:](self, "addContact:withID:", v33, v8);
        v20 = 0;
        goto LABEL_62;
      }
      v25 = IMOSLoggingEnabled();
      if (v32)
      {
        if (v25)
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v8;
            v39 = 2112;
            v40 = v32;
            _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Unified Fetch failed for ID: %@. Error: %@", buf, 0x16u);
          }
LABEL_53:

        }
      }
      else if (v25)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v8;
          _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "Did not find a contact with id: %@ in AddressBook.", buf, 0xCu);
        }
        goto LABEL_53;
      }
      +[IMContactStore createMutableContactWithID:](IMContactStore, "createMutableContactWithID:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        +[IMUnlockMonitor sharedInstance](IMUnlockMonitor, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isUnderFirstDataProtectionLock");

        if ((v29 & 1) == 0)
        {
          -[IMContactStore addContact:withID:](self, "addContact:withID:", v10, v8);
          v20 = 1;
          goto LABEL_62;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v8;
            _os_log_impl(&dword_19E239000, v30, OS_LOG_TYPE_INFO, "Not caching contact with id: %@ because we are before first unlock.", buf, 0xCu);
          }

        }
      }

      v20 = 0;
LABEL_62:

      v12 = (id)v33;
      goto LABEL_63;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Contact fetch not allowed in non Messages processes", buf, 2u);
      }

    }
  }
  v10 = 0;
LABEL_67:

  return v10;
}

- (BOOL)isBatchFetchingForLaunchCompleted
{
  return self->_batchFetchingForLaunchCompleted;
}

- (id)completedContact:(id)a3 withKeys:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CNContactStore *contactStore;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v23[6];
  id v24;
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t v31[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v6, "areKeysAvailable:", v7))
  {
    v8 = v6;
    goto LABEL_20;
  }
  if (!+[IMContactStore _shouldAllowContactStoreLookup](IMContactStore, "_shouldAllowContactStoreLookup"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Contact fetch not allowed in non Messages processes", buf, 2u);
      }

    }
    goto LABEL_13;
  }
  objc_msgSend(v6, "availableKeyDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v7);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v12 = (void *)objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v10);
  objc_msgSend(v12, "setUnifyResults:", 0);
  v13 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v6, "identifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v35 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForContactsWithIdentifiers:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v16);

  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x3032000000;
  v28 = sub_19E24764C;
  v29 = sub_19E24750C;
  v30 = 0;
  contactStore = self->_contactStore;
  v24 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_19E2CD90C;
  v23[3] = &unk_1E3FB7EC0;
  v23[4] = self;
  v23[5] = buf;
  LOBYTE(v14) = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v12, &v24, v23);
  v18 = v24;
  if ((v14 & 1) != 0)
  {
    v8 = *((id *)v26 + 5);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138412546;
        v32 = v21;
        v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Failed to complete contact for contact id: %@, error: %@", v31, 0x16u);

      }
    }
    v8 = 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_20:

  return v8;
}

+ (BOOL)_shouldAllowContactStoreLookup
{
  int v2;
  NSObject *v3;
  uint8_t v5[16];

  if ((IMIsRunningInFaceTime() & 1) != 0
    || (IMIsRunningInSafari() & 1) != 0
    || (IMIsRunningInSOSBuddy() & 1) != 0
    || IMIsRunningInSafariSandboxBroker())
  {
    v2 = IMOSLoggingEnabled();
    if (v2)
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Contacts fetch NOT allowed", v5, 2u);
      }

      LOBYTE(v2) = 0;
    }
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)_cacheBatchFetchResults:(id)a3 handleIDsWithoutCNID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v41;
  id v42;
  _QWORD block[5];
  id v44;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v58 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    }
    while (v7);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v42, "allKeys");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v54;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v54 != v37)
        {
          v13 = v12;
          objc_enumerationMutation(v35);
          v12 = v13;
        }
        v41 = v12;
        v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v12);
        objc_msgSend(v42, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMContactStore handleIDsForCNID:](self, "handleIDsForCNID:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(v15, "linkIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMContactStore handleIDsForCNID:](self, "handleIDsForCNID:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v18;
        }
        if (v16)
          v19 = v15 == 0;
        else
          v19 = 1;
        if (!v19)
        {
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v36 = v16;
          v20 = v16;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v50;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v50 != v22)
                  objc_enumerationMutation(v20);
                v24 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
                if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v63 = v24;
                    v64 = 2112;
                    v65 = v15;
                    _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Adding to entriesToApp ID:%@, Contact:%@", buf, 0x16u);
                  }

                }
                objc_msgSend(v6, "setObject:forKey:", v15, v24);
              }
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
            }
            while (v21);
          }

          v16 = v36;
        }

        v12 = v41 + 1;
      }
      while (v41 + 1 != v38);
      v38 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    }
    while (v38);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v26 = v34;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v46 != v28)
          objc_enumerationMutation(v26);
        v30 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
        +[IMContactStore createMutableContactWithID:](IMContactStore, "createMutableContactWithID:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v6, "setObject:forKey:", v31, v30);

      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
    }
    while (v27);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v32 = (void *)objc_msgSend(v6, "copy");
    -[IMContactStore addEntriesToIDToCNContactMap:](self, "addEntriesToIDToCNContactMap:", v32);

  }
  else
  {
    +[IMContactStore IMContactStoreQueue](IMContactStore, "IMContactStoreQueue");
    v33 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2CD890;
    block[3] = &unk_1E3FB4EF8;
    block[4] = self;
    v44 = v6;
    dispatch_async(v33, block);

  }
}

- (id)handleIDsForCNID:(id)a3
{
  id v4;
  IMContactStore *v5;
  NSMutableDictionary *CNIDToHandleIDsMap;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = self;
    objc_sync_enter(v5);
    CNIDToHandleIDsMap = v5->_CNIDToHandleIDsMap;
    if (!CNIDToHandleIDsMap)
    {
      -[IMContactStore generateCNIDToHandleIDMap](v5, "generateCNIDToHandleIDMap");
      CNIDToHandleIDsMap = v5->_CNIDToHandleIDsMap;
    }
    -[NSMutableDictionary objectForKey:](CNIDToHandleIDsMap, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    objc_sync_exit(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)createMutableContactWithID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length") && (MEMORY[0x1A1AE7CF8](v3) & 1) == 0)
  {
    MEMORY[0x1A1AE7D34](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_appearsToBeEmail"))
    {
      v4 = objc_alloc_init(+[IMContactStore IMCNMutableContactClass](IMContactStore, "IMCNMutableContactClass"));
      -[objc_class labeledValueWithLabel:value:](+[IMContactStore IMCNLabeledValueClass](IMContactStore, "IMCNLabeledValueClass"), "labeledValueWithLabel:value:", 0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEmailAddresses:", v7);
    }
    else
    {
      if (!objc_msgSend(v5, "_appearsToBePhoneNumber"))
      {
        v4 = 0;
        goto LABEL_10;
      }
      v4 = objc_alloc_init(+[IMContactStore IMCNMutableContactClass](IMContactStore, "IMCNMutableContactClass"));
      v8 = +[IMContactStore IMCNLabeledValueClass](IMContactStore, "IMCNLabeledValueClass");
      -[objc_class phoneNumberWithStringValue:](+[IMContactStore IMCNPhoneNumberClass](IMContactStore, "IMCNPhoneNumberClass"), "phoneNumberWithStringValue:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class labeledValueWithLabel:value:](v8, "labeledValueWithLabel:value:", 0, v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPhoneNumbers:", v7);
    }

LABEL_10:
    goto LABEL_11;
  }
  v4 = 0;
LABEL_11:

  return v4;
}

- (id)getContactForID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Invalid ID, cannot fetch CNContact from Map.ID: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = self->_IDToCNContactMap;
    objc_sync_enter(v7);
    -[NSMutableDictionary objectForKey:](self->_IDToCNContactMap, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (MEMORY[0x1A1AE7D10](v4) && (objc_msgSend(v4, "hasPrefix:", CFSTR("+")) & 1) == 0)
      {
        +[IMContactStore dialingCodeForID:](IMContactStore, "dialingCodeForID:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E3FBBA48);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x1A1AE7D34]();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "length"))
          {
            -[NSMutableDictionary objectForKey:](self->_IDToCNContactMap, "objectForKey:", v11);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v8 = 0;
          }
          v6 = v11;
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }
    }
    objc_sync_exit(v7);

  }
  else
  {
    v8 = 0;
  }
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Returning Contact:%@ for ID:%@", (uint8_t *)&v14, 0x16u);
    }

  }
  return v8;
}

- (BOOL)isIDAKnownContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMContactStore getHandleIDToCNIDMap](self, "getHandleIDToCNIDMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "length"))
    {
      v8 = objc_msgSend(v7, "containsString:", CFSTR("IMDCNPersonNotFound")) ^ 1;
    }
    else
    {
      -[IMContactStore getContactForID:](self, "getContactForID:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        LOBYTE(v8) = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v9);
      else
        LOBYTE(v8) = 0;

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)validateAndCleanupID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1A1AE8394]();
    MEMORY[0x1A1AE7D34](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IMStripFormattingFromAddress();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      if ((MEMORY[0x1A1AE7D10](v6) & 1) != 0 || (IMStringIsEmail() & 1) != 0)
        v7 = 0;
      else
        v7 = MEMORY[0x1A1AE7CF8](v6) ^ 1;
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      v8 = 0;
      if ((v7 & 1) == 0 && v11)
        v8 = v6;
    }
    else
    {
      v8 = 0;
    }

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getHandleIDToCNIDMap
{
  return (id)-[NSDictionary copy](self->_handleIDToCNIDMap, "copy");
}

- (void)setHandleIDToCNIDMap:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a3;
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "handleIDToCNIDMap before update", buf, 2u);
      }

    }
    -[IMContactStore getHandleIDToCNIDMap](self, "getHandleIDToCNIDMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v7);

  }
  v8 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Updating the handleIDToCNIDMap", v14, 2u);
      }

    }
    objc_storeStrong((id *)&self->_handleIDToCNIDMap, a3);
    if (IMAdditionalContactsLoggingEnabled())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "handleIDToCNIDMap after update", v13, 2u);
        }

      }
      -[IMContactStore getHandleIDToCNIDMap](self, "getHandleIDToCNIDMap");
      v11 = objc_claimAutoreleasedReturnValue();
      +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v11);
LABEL_21:

    }
  }
  else if (v8)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Error updating handleIDToCNIDMap", v12, 2u);
    }
    goto LABEL_21;
  }

}

- (void)setCurrentHistoryToken:(id)a3
{
  id v5;
  void *v6;
  IMContactStore *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v5 = a3;
  -[IMContactStore currentHistoryToken](self, "currentHistoryToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore logHistoryToken:](IMContactStore, "logHistoryToken:", v6);

  if (v5)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Updating Current History token", buf, 2u);
      }

    }
    objc_storeStrong((id *)&v7->_currentHistoryToken, a3);
    objc_sync_exit(v7);

    -[IMContactStore currentHistoryToken](v7, "currentHistoryToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore logHistoryToken:](IMContactStore, "logHistoryToken:", v9);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "nil History token provided, not updating.", v11, 2u);
    }

  }
}

- (IMContactStore)init
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  IMContactStore *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  qword_1ECFC7270 = MEMORY[0x1A1AE7D4C](CFSTR("CNContact"), CFSTR("Contacts"));
  qword_1ECFC74E8 = MEMORY[0x1A1AE7D4C](CFSTR("CNContactStore"), CFSTR("Contacts"));
  if (+[IMContactStore _shouldAllowContactStoreLookup](IMContactStore, "_shouldAllowContactStoreLookup")
    && (v3 = objc_alloc_init(MEMORY[0x1E0C972A0]),
        objc_msgSend(v3, "setUseInProcessMapperExclusively:", 1),
        v4 = (void *)objc_msgSend(objc_alloc((Class)qword_1ECFC74E8), "initWithConfiguration:", v3),
        v3,
        v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "CNContactStore setup completed!", v9, 2u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Failed to setup CNContactStore", buf, 2u);
      }

    }
    v4 = 0;
  }
  v7 = -[IMContactStore initWithContactStore:](self, "initWithContactStore:", v4);

  return v7;
}

- (IMContactStore)initWithContactStore:(id)a3
{
  id v5;
  IMContactStore *v6;
  IMContactStore *v7;
  NSData *currentHistoryToken;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *changeHistoryFetchQueue;
  IMStateCaptureAssistant *v12;
  uint64_t v13;
  IMStateCaptureAssistant *stateCaptureAssistant;
  void *v15;
  void *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMContactStore;
  v6 = -[IMContactStore init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    currentHistoryToken = v7->_currentHistoryToken;
    v7->_currentHistoryToken = 0;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.private.IMSharedUtilities.IMContactStore", v9);
    changeHistoryFetchQueue = v7->_changeHistoryFetchQueue;
    v7->_changeHistoryFetchQueue = (OS_dispatch_queue *)v10;

    v12 = [IMStateCaptureAssistant alloc];
    v13 = -[IMStateCaptureAssistant initWithObject:title:queue:](v12, "initWithObject:title:queue:", v7, CFSTR("IMContactStore"), MEMORY[0x1E0C80D38]);
    stateCaptureAssistant = v7->_stateCaptureAssistant;
    v7->_stateCaptureAssistant = (IMStateCaptureAssistant *)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_contactStoreChanged_, *MEMORY[0x1E0C96870], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_meCardChanged_, *MEMORY[0x1E0C96878], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)sub_19E2CD3F0, CFSTR("CNMeCardSharingPickerViewControllerDidSaveNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v7;
}

- (NSDictionary)handleIDToCNIDMap
{
  return self->_handleIDToCNIDMap;
}

- (id)getContactStore
{
  return self->_contactStore;
}

- (void)generateCNIDToHandleIDMap
{
  NSMutableDictionary *v3;
  NSMutableDictionary *CNIDToHandleIDsMap;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
  self->_CNIDToHandleIDsMap = v3;

  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        -[NSMutableDictionary allKeys](self->_CNIDToHandleIDsMap, "allKeys");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v15 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "CNIDToHandleIDsMap before update. Number of entries %lu", buf, 0xCu);

      }
    }
    -[IMContactStore getCNIDToHandleIDsMap](self, "getCNIDToHandleIDsMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v7);

  }
  -[IMContactStore handleIDToCNIDMap](self, "handleIDToCNIDMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_19E242DBC;
  v13[3] = &unk_1E3FB57F0;
  v13[4] = self;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[NSMutableDictionary allKeys](self->_CNIDToHandleIDsMap, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v15 = v11;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "CNIDToHandleIDsMap after update. Number of entries %lu", buf, 0xCu);

      }
    }
    -[IMContactStore getCNIDToHandleIDsMap](self, "getCNIDToHandleIDsMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v12);

  }
}

- (id)fetchMeContactWithKeys:(id)a3 withError:(id *)a4
{
  id v6;
  CNContact *meContact;
  uint64_t v8;
  void *v9;
  void *v10;
  CNContactStore *contactStore;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  CNContact *v17;
  void *v18;
  double v19;
  CNContact *v20;
  CNContact *v21;
  BOOL v22;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (+[IMContactStore _shouldAllowContactStoreLookup](IMContactStore, "_shouldAllowContactStoreLookup"))
  {
    if (!self->_shouldSkipMeContactLookup)
    {
      meContact = self->_meContact;
      if (!meContact || !-[CNContact areKeysAvailable:](meContact, "areKeysAvailable:", v6))
      {
        if (!objc_msgSend(v6, "count"))
        {
          +[IMContactStore keysForMeContact](IMContactStore, "keysForMeContact");
          v8 = objc_claimAutoreleasedReturnValue();

          v6 = (id)v8;
        }
        v9 = (void *)objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v6);
        +[IMContactStore mePredicate](IMContactStore, "mePredicate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPredicate:", v10);
        contactStore = self->_contactStore;
        v24 = 0;
        -[CNContactStore executeFetchRequest:error:](contactStore, "executeFetchRequest:error:", v9, &v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v24;
        objc_msgSend(v12, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v13;
              _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Could not fetch MeCard from CNContactStore:%@", buf, 0xCu);
            }

          }
          if (a4)
            *a4 = objc_retainAutorelease(v13);
        }
        else
        {
          objc_msgSend(v12, "currentHistoryToken");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMContactStore setCurrentHistoryToken:](self, "setCurrentHistoryToken:", v18);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        self->_lastMeContactStoreSync = v19;
        objc_msgSend(v14, "firstObject");
        v20 = (CNContact *)objc_claimAutoreleasedReturnValue();
        v21 = self->_meContact;
        self->_meContact = v20;

        v22 = v13 != 0;
        if (self->_meContact)
          v22 = 1;
        if (!v22)
          self->_shouldSkipMeContactLookup = 1;

      }
    }
    v17 = self->_meContact;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Me Contact fetch not allowed in non Messages processes", buf, 2u);
      }

    }
    v17 = 0;
  }

  return v17;
}

- (id)fetchMeContactWithKeys:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[IMContactStore fetchMeContactWithKeys:withError:](self, "fetchMeContactWithKeys:withError:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fetchCNContactForHandleWithID:(id)a3
{
  return -[IMContactStore fetchCNContactForHandleID:withKeys:](self, "fetchCNContactForHandleID:withKeys:", a3, 0);
}

- (NSData)currentHistoryToken
{
  IMContactStore *v2;
  NSData *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentHistoryToken;
  objc_sync_exit(v2);

  return v3;
}

- (void)addEntriesToIDToCNContactMap:(id)a3
{
  id v4;
  NSMutableDictionary *IDToCNContactMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    IDToCNContactMap = self->_IDToCNContactMap;
    if (!IDToCNContactMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v7 = self->_IDToCNContactMap;
      self->_IDToCNContactMap = Mutable;

      IDToCNContactMap = self->_IDToCNContactMap;
    }
    v8 = IDToCNContactMap;
    objc_sync_enter(v8);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_IDToCNContactMap, "addEntriesFromDictionary:", v9);
    objc_sync_exit(v8);

    v4 = v9;
  }

}

- (void)_fetchContactsWithIdentifiers:(id)a3 usingCNID:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  CNContactStore *contactStore;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  _QWORD v44[3];

  v4 = a4;
  v44[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    if (v4)
    {
      +[IMContactStore keysForCNContact](IMContactStore, "keysForCNContact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass")), "initWithKeysToFetch:", v8);

      objc_msgSend(v9, "setUnifyResults:", 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Fetching Contacts using CNIDs", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v7);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_alloc(+[IMContactStore IMCNContactFetchRequestClass](IMContactStore, "IMCNContactFetchRequestClass"));
      +[IMContactStore kIMCNContactEmailAddressesKey](IMContactStore, "kIMCNContactEmailAddressesKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v14;
      +[IMContactStore kIMCNContactPhoneNumbersKey](IMContactStore, "kIMCNContactPhoneNumbersKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v13, "initWithKeysToFetch:", v16);

      objc_msgSend(v9, "setUnifyResults:", 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Fetching Contacts using Email & Phone", buf, 2u);
        }

      }
      objc_msgSend((id)qword_1ECFC7270, "predicateForContactsMatchingHandleStrings:", v7);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v11;
    objc_msgSend(v9, "setPredicate:", v11);
    if ((IMIsRunningInUnitTesting() & v4) == 1)
      objc_storeStrong((id *)&self->_CNIDsForBatchFetch, a3);
    v19 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v19, "startTimingForKey:", CFSTR("Contacts Batch Fetch"));
    contactStore = self->_contactStore;
    v39 = 0;
    -[CNContactStore executeFetchRequest:error:](contactStore, "executeFetchRequest:error:", v9, &v39);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v39;
    objc_msgSend(v21, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopTimingForKey:", CFSTR("Contacts Batch Fetch"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v19, "totalTimeForKey:", CFSTR("Contacts Batch Fetch"));
        *(_DWORD *)buf = 134217984;
        v41 = v24;
        _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Contacts batch fetch from Contact Store completed. Took %f seconds.", buf, 0xCu);
      }

    }
    if (v22)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = objc_msgSend(v22, "count");
          v27 = objc_msgSend(v7, "count");
          *(_DWORD *)buf = 134218240;
          v41 = v26;
          v42 = 2048;
          v43 = v27;
          _os_log_impl(&dword_19E239000, v25, OS_LOG_TYPE_INFO, "Got results for %lu/%lu IDs from Contacts Batch Fetch", buf, 0x16u);
        }

      }
      +[IMContactStore logContactFetchRequestResults:](IMContactStore, "logContactFetchRequestResults:", v21);
      v28 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
      -[NSObject startTimingForKey:](v28, "startTimingForKey:", CFSTR("Contacts Caching"));
      objc_msgSend(v21, "value");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v22, "allValues");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMContactStore _cacheBatchFetchResults:handleIDsWithoutCNID:](self, "_cacheBatchFetchResults:handleIDsWithoutCNID:", v31, v7);

      }
      else
      {
        objc_msgSend(v21, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v33 = objc_opt_isKindOfClass();

        if ((v33 & 1) != 0)
          -[IMContactStore _cacheBatchFetchResults:handleIDsWithoutCNID:](self, "_cacheBatchFetchResults:handleIDsWithoutCNID:", v22, v7);
      }
      if (IMAdditionalContactsLoggingEnabled())
      {
        -[IMContactStore getIDToCNContactMap](self, "getIDToCNContactMap");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v34);

      }
      -[NSObject stopTimingForKey:](v28, "stopTimingForKey:", CFSTR("Contacts Caching"));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          -[NSObject totalTimeForKey:](v28, "totalTimeForKey:", CFSTR("Contacts Caching"));
          *(_DWORD *)buf = 134217984;
          v41 = v36;
          _os_log_impl(&dword_19E239000, v35, OS_LOG_TYPE_INFO, "IMContact Store caching completed. Took %f seconds", buf, 0xCu);
        }

      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_43:
        if ((IMIsRunningInUnitTesting() & 1) == 0)
        {
          objc_msgSend(v21, "currentHistoryToken");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMContactStore setCurrentHistoryToken:](self, "setCurrentHistoryToken:", v37);

        }
        goto LABEL_46;
      }
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (uint64_t)v38;
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "No results obtained from the CN fetch request. Error: %@", buf, 0xCu);
      }
    }

    goto LABEL_43;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Passed in empty set of identifiers", buf, 2u);
    }

  }
LABEL_46:

}

+ (void)logHistoryToken:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Logging history token: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

+ (void)logContactFetchRequestResults:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "value");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134217984;
        v20 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Logging Contact Store fetch result. Obtained (%lu) results from Contacts Store.", (uint8_t *)&v19, 0xCu);

      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "The results are:", (uint8_t *)&v19, 2u);
      }

    }
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "fetchResult is a Dictionary", (uint8_t *)&v19, 2u);
        }

      }
      objc_msgSend(v3, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMContactStore logDictionary:inBatchesOfSize:](IMContactStore, "logDictionary:inBatchesOfSize:", v10, 10);

    }
    else
    {
      objc_msgSend(v3, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();

      v13 = IMOSLoggingEnabled();
      if ((v12 & 1) != 0)
      {
        if (v13)
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "fetchResult is an Array", (uint8_t *)&v19, 2u);
          }

        }
        objc_msgSend(v3, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMContactStore _logArray:inBatchesOfSize:](IMContactStore, "_logArray:inBatchesOfSize:", v15, 10);

      }
      else if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_opt_class();
          v19 = 138412290;
          v20 = (uint64_t)v17;
          v18 = v17;
          _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Unable to log CNFetchResult. Class: %@", (uint8_t *)&v19, 0xCu);

        }
      }
    }
  }

}

+ (id)mePredicate
{
  return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0C97200], sel_predicateForMeContact);
}

+ (id)keysForMeContact
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99DE8];
  +[IMContactStore kIMCNContactIdentifierKey](IMContactStore, "kIMCNContactIdentifierKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactPhoneNumbersKey](IMContactStore, "kIMCNContactPhoneNumbersKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactEmailAddressesKey](IMContactStore, "kIMCNContactEmailAddressesKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[IMContactStore IMCNContactFormatterClass](IMContactStore, "IMCNContactFormatterClass"))
  {
    -[objc_class descriptorForRequiredKeysForStyle:](+[IMContactStore IMCNContactFormatterClass](IMContactStore, "IMCNContactFormatterClass"), "descriptorForRequiredKeysForStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

+ (id)keysForCNContact
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  +[IMContactStore kIMCNContactIdentifierKey](IMContactStore, "kIMCNContactIdentifierKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  +[IMContactStore kIMCNContactEmailAddressesKey](IMContactStore, "kIMCNContactEmailAddressesKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  +[IMContactStore kIMCNContactPhoneNumbersKey](IMContactStore, "kIMCNContactPhoneNumbersKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  +[IMContactStore kIMCNContactLinkIdentifierKey](IMContactStore, "kIMCNContactLinkIdentifierKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  -[objc_class descriptorForRequiredKeysForStyle:](+[IMContactStore IMCNContactFormatterClass](IMContactStore, "IMCNContactFormatterClass"), "descriptorForRequiredKeysForStyle:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3850], "descriptorForUsedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMSharedHelperDeviceHasMultipleSubscriptions()
    && -[objc_class deviceSupportsGemini](+[IMContactStore IMCNGeminiManagerClass](IMContactStore, "IMCNGeminiManagerClass"), "deviceSupportsGemini"))
  {
    -[objc_class descriptorForRequiredKeys](+[IMContactStore IMCNGeminiManagerClass](IMContactStore, "IMCNGeminiManagerClass"), "descriptorForRequiredKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  return v8;
}

+ (id)kIMCNContactPhoneNumbersKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7430;
}

+ (id)kIMCNContactLinkIdentifierKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7428;
}

+ (id)kIMCNContactIdentifierKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7410;
}

+ (id)kIMCNContactEmailAddressesKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7408;
}

+ (Class)IMCNContactFetchRequestClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7450;
}

+ (void)logDictionary:(id)a3
{
  objc_msgSend(a1, "logDictionary:checkAdditionalLoggingEnabled:", a3, 1);
}

+ (void)logDictionary:(id)a3 checkAdditionalLoggingEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a4;
  v5 = a3;
  if (!v4 || IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Logging Dictionary", v7, 2u);
      }

    }
    +[IMContactStore logDictionary:inBatchesOfSize:](IMContactStore, "logDictionary:inBatchesOfSize:", v5, 20);
  }

}

+ (void)logDictionary:(id)a3 inBatchesOfSize:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v6 / a4;
  v8 = v6 % a4;
  +[IMContactStore _sortContactsFor:](IMContactStore, "_sortContactsFor:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 >= 1)
  {
    v10 = 0;
    v11 = v7;
    do
    {
      +[IMContactStore _logDictionaryInformation:withSortedKeys:inRange:](IMContactStore, "_logDictionaryInformation:withSortedKeys:inRange:", v12, v9, v10, a4);
      v10 += a4;
      --v11;
    }
    while (v11);
  }
  if (v8 > 0)
    +[IMContactStore _logDictionaryInformation:withSortedKeys:inRange:](IMContactStore, "_logDictionaryInformation:withSortedKeys:inRange:", v12, v9, v7 * a4, v8);

}

+ (void)logHandleIDs:(id)a3 checkAdditionalLoggingEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a4;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v4 || IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 134217984;
        v8 = objc_msgSend(v5, "count");
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Logging %lu IDs", (uint8_t *)&v7, 0xCu);
      }

    }
    +[IMContactStore _logArray:inBatchesOfSize:](IMContactStore, "_logArray:inBatchesOfSize:", v5, 20);
  }

}

+ (void)logCNContact:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Logging additional details about CNContact: %@", (uint8_t *)&v6, 0xCu);

    }
  }

}

+ (void)logCNContact:(id)a3 andID:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "ID: %@ and CNContact: %@", (uint8_t *)&v9, 0x16u);

      }
    }
    +[IMContactStore logCNContact:](IMContactStore, "logCNContact:", v5);
  }

}

+ (void)logHandleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMAdditionalContactsLoggingEnabled())
  {
    +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchCNContactForHandleWithID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v3;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "For ID %@ found an entry in cache: %@", (uint8_t *)&v8, 0x16u);

      }
    }

  }
}

+ (void)_logArray:(id)a3 inBatchesOfSize:(int64_t)a4
{
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v14 = v6;
  v7 = v6 / a4;
  if (v6 / a4 >= 1)
  {
    v8 = 0;
    v9 = v6 / a4;
    do
    {
      objc_msgSend(v5, "subarrayWithRange:", v8, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }

      }
      v8 += a4;
      --v9;
    }
    while (v9);
  }
  if (v14 - v7 * a4 > 0)
  {
    objc_msgSend(v5, "subarrayWithRange:", v7 * a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v12;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

    }
  }

}

+ (id)_sortContactsFor:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a3, sel_keysSortedByValueUsingComparator_);
}

+ (void)_logDictionaryInformation:(id)a3 withSortedKeys:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a5.length;
  location = a5.location;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16 = a4;
  objc_msgSend(v16, "subarrayWithRange:", location, length);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v22 = v13;
            v23 = 2112;
            v24 = v14;
            _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Handle ID: %@, CNID:%@", buf, 0x16u);
          }

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IMContactStore stateCaptureAssistant](self, "stateCaptureAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregister");

  -[IMContactStore setStateCaptureAssistant:](self, "setStateCaptureAssistant:", 0);
  v5.receiver = self;
  v5.super_class = (Class)IMContactStore;
  -[IMContactStore dealloc](&v5, sel_dealloc);
}

+ (Class)IMCNMutableContactClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7478;
}

+ (Class)IMCNLabeledValueClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7468;
}

+ (Class)IMCNPhoneNumberClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7480;
}

+ (Class)IMCNChangeHistoryFetchRequestClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7448;
}

+ (Class)IMCNMeCardSharingPickerViewControllerClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7470;
}

+ (Class)IMCNGeminiManagerClass
{
  if (qword_1ECFC7490 != -1)
    dispatch_once(&qword_1ECFC7490, &unk_1E3FB1868);
  return (Class)(id)qword_1ECFC7460;
}

+ (id)kIMCNContactImageDataAvailableKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7418;
}

+ (id)kIMCNContactImageDataKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7420;
}

+ (id)kIMCNContactThumbnailImageDataKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7438;
}

+ (id)kIMCNContactCropRectKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7400;
}

+ (id)kIMCNContactWallpaperKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7288;
}

+ (id)kIMCNContactWatchWallpaperImageDataKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7290;
}

+ (id)kIMCNContactImageBackgroundColorsDataKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7280;
}

+ (id)kIMCNContactSensitiveContentConfigurationKey
{
  if (qword_1ECFC73F8 != -1)
    dispatch_once(&qword_1ECFC73F8, &unk_1E3FB25B8);
  return (id)qword_1ECFC7278;
}

- (id)fetchCNContactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CNContactStore *contactStore;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if (!+[IMContactStore _shouldAllowContactStoreLookup](IMContactStore, "_shouldAllowContactStoreLookup"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Contact fetch not allowed in non Messages processes", buf, 2u);
      }

    }
    goto LABEL_17;
  }
  +[IMContactStore keysForCNContact](IMContactStore, "keysForCNContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97200];
  v23[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForContactsWithIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v9, "startTimingForKey:", CFSTR("Contacts Identifier Fetch"));
  contactStore = self->_contactStore;
  v18 = 0;
  -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v5, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  objc_msgSend(v9, "stopTimingForKey:", CFSTR("Contacts Batch Fetch"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "totalTimeForKey:", CFSTR("Contacts Identifier Fetch"));
      *(_DWORD *)buf = 134217984;
      v20 = v14;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Contacts fetch based on identifier from Contact Store completed. Took %f seconds.", buf, 0xCu);
    }

  }
  if (v12 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Identifier based Fetch failed for identifier: %@. Error: %@", buf, 0x16u);
    }

  }
LABEL_18:

  return v11;
}

- (void)setBatchFetchingCompleted
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Contacts batch fetching completed", v4, 2u);
    }

  }
  self->_batchFetchingForLaunchCompleted = 1;
}

- (void)setBatchFetchingIsCompleted:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = IMIsRunningInUnitTesting();
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v3)
          v8 = CFSTR("YES");
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Set Contacts batch fetching completed: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    self->_batchFetchingForLaunchCompleted = v3;
  }
  else if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Not updating the Batch Fetching completed state since this interface is for Unit Testing only.", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)removeIDFromCNIDToHandleIDsMap:(id)a3 withCNID:(id)a4
{
  id v6;
  NSMutableDictionary *CNIDToHandleIDsMap;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v12, "length") && objc_msgSend(v6, "length"))
  {
    CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    if (!CNIDToHandleIDsMap)
    {
      -[IMContactStore generateCNIDToHandleIDMap](self, "generateCNIDToHandleIDMap");
      CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    }
    -[NSMutableDictionary objectForKey:](CNIDToHandleIDsMap, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") && objc_msgSend(v8, "containsObject:", v9))
      objc_msgSend(v8, "removeObject:", v9);
    v10 = objc_msgSend(v8, "count");
    v11 = self->_CNIDToHandleIDsMap;
    if (v10)
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](v11, "removeObjectForKey:", v6);

  }
}

- (void)addIDToCNIDToHandleIDsMap:(id)a3 withCNID:(id)a4
{
  id v6;
  NSMutableDictionary *CNIDToHandleIDsMap;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v11, "length") && objc_msgSend(v6, "length"))
  {
    CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    if (!CNIDToHandleIDsMap)
    {
      -[IMContactStore generateCNIDToHandleIDMap](self, "generateCNIDToHandleIDMap");
      CNIDToHandleIDsMap = self->_CNIDToHandleIDsMap;
    }
    -[NSMutableDictionary objectForKey:](CNIDToHandleIDsMap, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

      v8 = v10;
    }
    if (objc_msgSend(v9, "length"))
      objc_msgSend(v8, "addObject:", v9);
    if (v8)
      -[NSMutableDictionary setObject:forKey:](self->_CNIDToHandleIDsMap, "setObject:forKey:", v8, v6);

  }
}

- (id)cnContactIdentifierForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMContactStore getHandleIDToCNIDMap](self, "getHandleIDToCNIDMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || !objc_msgSend(v7, "length"))
    {
      -[IMContactStore getContactForID:](self, "getContactForID:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v8))
      {
        objc_msgSend(v8, "identifier");
        v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        goto LABEL_14;
      }

    }
    if (objc_msgSend(v7, "containsString:", CFSTR("IMDCNPersonNotFound")))
      v10 = 0;
    else
      v10 = v7;
    v9 = v10;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_14:

  return v9;
}

- (BOOL)isContactWithIDAlreadyFetched:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMContactStore getContactForID:](self, "getContactForID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addContact:(id)a3 withID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableDictionary *IDToCNContactMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "length"))
  {
    if (IMAdditionalContactsLoggingEnabled())
      +[IMContactStore logCNContact:andID:](IMContactStore, "logCNContact:andID:", v6, v8);
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      IDToCNContactMap = self->_IDToCNContactMap;
      if (!IDToCNContactMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v12 = self->_IDToCNContactMap;
        self->_IDToCNContactMap = Mutable;

        IDToCNContactMap = self->_IDToCNContactMap;
      }
      v13 = IDToCNContactMap;
      objc_sync_enter(v13);
      +[IMContactStore logCNContact:andID:](IMContactStore, "logCNContact:andID:", v6, v8);
      -[NSMutableDictionary setObject:forKey:](self->_IDToCNContactMap, "setObject:forKey:", v6, v9);
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMContactStore addIDToCNIDToHandleIDsMap:withCNID:](self, "addIDToCNIDToHandleIDsMap:withCNID:", v9, v14);

      +[IMContactStore logCNContact:andID:](IMContactStore, "logCNContact:andID:", v6, v8);
      objc_sync_exit(v13);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Not adding Contact with ID:%@ to Map", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)removeContactWithID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Invalid ID, cannot remove CNContact from Map.ID: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  +[IMContactStore logHandleID:](IMContactStore, "logHandleID:", v4);
  -[IMContactStore getContactForID:](self, "getContactForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = self->_IDToCNContactMap;
      objc_sync_enter(v8);
      -[NSMutableDictionary removeObjectForKey:](self->_IDToCNContactMap, "removeObjectForKey:", v7);
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMContactStore removeIDFromCNIDToHandleIDsMap:withCNID:](self, "removeIDFromCNIDToHandleIDsMap:withCNID:", v7, v9);

      +[IMContactStore logHandleID:](IMContactStore, "logHandleID:", v4);
      objc_sync_exit(v8);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "No contact in map with ID: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)replaceContact:(id)a3 withID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "length") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Invalid ID, cannot replace CNContact from Map.ID: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  if (!v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Invalid contact: %@", (uint8_t *)&v16, 0xCu);
    }

  }
  +[IMContactStore logCNContact:andID:](IMContactStore, "logCNContact:andID:", v6, v7);
  +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getContactForID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v10, "length"))
  {
    v13 = self->_IDToCNContactMap;
    objc_sync_enter(v13);
    -[NSMutableDictionary removeObjectForKey:](self->_IDToCNContactMap, "removeObjectForKey:", v10);
    objc_msgSend(v12, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMContactStore removeIDFromCNIDToHandleIDsMap:withCNID:](self, "removeIDFromCNIDToHandleIDsMap:withCNID:", v10, v14);

    -[NSMutableDictionary setObject:forKey:](self->_IDToCNContactMap, "setObject:forKey:", v6, v10);
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMContactStore addIDToCNIDToHandleIDsMap:withCNID:](self, "addIDToCNIDToHandleIDsMap:withCNID:", v10, v15);

    +[IMContactStore logCNContact:andID:](IMContactStore, "logCNContact:andID:", v6, v7);
    objc_sync_exit(v13);

  }
}

- (void)replaceWithMutableContactForID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    +[IMContactStore logHandleID:](IMContactStore, "logHandleID:", v4);
    +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend((id)objc_opt_class(), "createMutableContactWithID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = self->_IDToCNContactMap;
        objc_sync_enter(v7);
        -[NSMutableDictionary removeObjectForKey:](self->_IDToCNContactMap, "removeObjectForKey:", v5);
        -[NSMutableDictionary setObject:forKey:](self->_IDToCNContactMap, "setObject:forKey:", v6, v5);
        +[IMContactStore logHandleID:](IMContactStore, "logHandleID:", v4);
        objc_sync_exit(v7);

      }
      else
      {
        IMLogHandleForCategory("Contacts");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_19E36D7C4((uint64_t)v4, v9);

      }
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Invalid ID, cannot replace CNContact from Map.ID: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (id)getAllKeysFromIDToCNContactMap
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;

  v3 = self->_IDToCNContactMap;
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](self->_IDToCNContactMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  return v5;
}

- (void)contactStoreChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!IMIsRunningInMessages()
    || -[IMContactStore isBatchFetchingForLaunchCompleted](self, "isBatchFetchingForLaunchCompleted")
    || (IMIsRunningInMessagesExtension() & 1) != 0)
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Received ContactStore change notification. User Info:%@", (uint8_t *)&v8, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
    -[IMContactStore performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_checkForContactStoreChanges, 0, 0.0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Dropping Contact Store notification since Contact's cache is not populated.", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)resetMeCard
{
  -[IMContactStore setMeContact:](self, "setMeContact:", 0);
  MEMORY[0x1E0DE7D20](self, sel_setShouldSkipMeContactLookup_);
}

- (void)meCardChanged:(id)a3
{
  id v4;
  BOOL v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[IMContactStore _shouldAllowContactStoreLookup](IMContactStore, "_shouldAllowContactStoreLookup");
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "MeCard ContactStore change notification", (uint8_t *)&v15, 2u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "MeCard ContactStore change notification", (uint8_t *)&v15, 2u);
      }

    }
    objc_msgSend(v4, "userInfo");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v10 - self->_lastMeContactStoreSync >= 0.0)
    {
      -[IMContactStore resetMeCard](self, "resetMeCard");
      +[IMContactStore keysForNicknameHandling](IMContactStore, "keysForNicknameHandling");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[IMContactStore fetchMeContactWithKeys:](self, "fetchMeContactWithKeys:", v13);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v9;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Ignoring MeCard ContactStore change notification. userinfo:%@", (uint8_t *)&v15, 0xCu);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v9;
          _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Ignoring MeCard ContactStore change notification. userinfo:%@", (uint8_t *)&v15, 0xCu);
        }

      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Not handling me card change notification in non Messages processes", (uint8_t *)&v15, 2u);
    }
    goto LABEL_24;
  }
LABEL_25:

}

- (void)handleDropEverythingEvent
{
  NSObject *v3;
  IMContactStore *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Dropping everything in cache.", v7, 2u);
    }

  }
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeAllObjects](v4->_IDToCNContactMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v4->_CNIDToHandleIDsMap, "removeAllObjects");
  -[IMContactStore setCurrentHistoryToken:](v4, "setCurrentHistoryToken:", 0);
  objc_sync_exit(v4);

  -[IMContactStore getIDToCNContactMap](v4, "getIDToCNContactMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", IMContactStoreChangedNotification, 0);

}

- (void)checkForContactStoreChanges
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *changeHistoryFetchQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v3 = objc_alloc_init(+[IMContactStore IMCNChangeHistoryFetchRequestClass](IMContactStore, "IMCNChangeHistoryFetchRequestClass"));
  -[IMContactStore currentHistoryToken](self, "currentHistoryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStartingToken:", v4);

  objc_msgSend(v3, "setShouldUnifyResults:", 0);
  +[IMContactStore keysForCNContact](IMContactStore, "keysForCNContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdditionalContactKeyDescriptors:", v5);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Performing a Contact Store History Fetch request", buf, 2u);
    }

  }
  -[IMContactStore getIDToCNContactMap](self, "getIDToCNContactMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v7);

  -[IMContactStore currentHistoryToken](self, "currentHistoryToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore logHistoryToken:](IMContactStore, "logHistoryToken:", v8);

  changeHistoryFetchQueue = self->_changeHistoryFetchQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_19E2CF294;
  v11[3] = &unk_1E3FB4EF8;
  v11[4] = self;
  v12 = v3;
  v10 = v3;
  dispatch_async(changeHistoryFetchQueue, v11);

}

+ (id)displayNameWithPhoneNumberOrEmailForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "phoneNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      IMFormattedDisplayStringForNumber();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "emailAddresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        IMFormattedDisplayStringForNumber();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)displayNameForContact:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(0, "description");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Invalid contact:%@", (uint8_t *)&v9, 0xCu);

      }
      goto LABEL_11;
    }
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  objc_msgSend(a1, "displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "displayNameWithPhoneNumberOrEmailForContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v9 = 138412290;
          v10 = v4;
          _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "A display name for the given contact could not be generated for :%@", (uint8_t *)&v9, 0xCu);
        }
LABEL_11:

        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
LABEL_13:

  return v5;
}

+ (id)firstNameForCNContact:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "givenName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)lastNameForCNContact:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "familyName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)phoneticFirstNameForCNContact:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "phoneticGivenName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)phoneticLastNameForCNContact:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "phoneticFamilyName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)phoneticFullNameForCNContact:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_stringFromContact:withStyle:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = v4;
    }
    else
    {
      +[IMContactStore phoneticFirstNameForCNContact:](IMContactStore, "phoneticFirstNameForCNContact:", v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)companyNameForCNContact:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "organizationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)IDsFromCNContact:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[IMContactStore phoneNumbersForCNContact:](IMContactStore, "phoneNumbersForCNContact:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v5);
    +[IMContactStore emailsForCNContact:](IMContactStore, "emailsForCNContact:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v4, "addObjectsFromArray:", v6);
    v7 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

+ (id)emailsForCNContact:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "emailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "value", (_QWORD)v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "length"))
              objc_msgSend(v4, "addObject:", v11);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }

    }
    v12 = (void *)objc_msgSend(v4, "copy", (_QWORD)v14);

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (id)phoneNumbersForCNContact:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "phoneNumbers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "value", (_QWORD)v16);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v12, "length"))
            {
              +[IMContactStore validateAndCleanupID:](IMContactStore, "validateAndCleanupID:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v13, "length"))
                objc_msgSend(v4, "addObject:", v13);

            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }

    }
    v14 = (void *)objc_msgSend(v4, "copy", (_QWORD)v16);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

- (id)getCNIDToHandleIDsMap
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (!self->_CNIDToHandleIDsMap && IMIsRunningInUnitTesting())
    -[IMContactStore generateCNIDToHandleIDMap](self, "generateCNIDToHandleIDMap");
  v3 = (void *)-[NSMutableDictionary copy](self->_CNIDToHandleIDsMap, "copy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)getIDToCNContactMap
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_IDToCNContactMap;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableDictionary copy](self->_IDToCNContactMap, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (id)stateDictionaryForDiagnosticsRequest
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
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  -[IMContactStore getIDToCNContactMap](self, "getIDToCNContactMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore logDictionary:checkAdditionalLoggingEnabled:](IMContactStore, "logDictionary:checkAdditionalLoggingEnabled:", v3, 0);

  -[IMContactStore getHandleIDToCNIDMap](self, "getHandleIDToCNIDMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore logDictionary:checkAdditionalLoggingEnabled:](IMContactStore, "logDictionary:checkAdditionalLoggingEnabled:", v4, 0);

  v14[0] = CFSTR("debugDescription");
  -[IMContactStore debugDescription](self, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("IDsObtainedFromDaemon");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[IMContactStore getHandleIDToCNIDMap](self, "getHandleIDToCNIDMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("ContactCache");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[IMContactStore getIDToCNContactMap](self, "getIDToCNContactMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)createMutableContactWithMapURL:(id)a3 andLocalizedLocationString:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
    -[objc_class labeledValueWithLabel:value:](+[IMContactStore IMCNLabeledValueClass](IMContactStore, "IMCNLabeledValueClass"), "labeledValueWithLabel:value:", &stru_1E3FBBA48, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUrlAddresses:", v9);

    objc_msgSend(v7, "setGivenName:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)predicateForID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    MEMORY[0x1A1AE7D34](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1A1AE7D10]())
    {
      v5 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateForContactsMatchingPhoneNumber:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (IMStringIsEmail())
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Failed to determine handle type for ID %@.", (uint8_t *)&v10, 0xCu);
        }

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keysForNicknameHandling
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
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v16 = (void *)MEMORY[0x1E0C99DE8];
  +[IMContactStore kIMCNContactIdentifierKey](IMContactStore, "kIMCNContactIdentifierKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactPhoneNumbersKey](IMContactStore, "kIMCNContactPhoneNumbersKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactEmailAddressesKey](IMContactStore, "kIMCNContactEmailAddressesKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactImageDataAvailableKey](IMContactStore, "kIMCNContactImageDataAvailableKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactImageDataKey](IMContactStore, "kIMCNContactImageDataKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactThumbnailImageDataKey](IMContactStore, "kIMCNContactThumbnailImageDataKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactCropRectKey](IMContactStore, "kIMCNContactCropRectKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactWallpaperKey](IMContactStore, "kIMCNContactWallpaperKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactWatchWallpaperImageDataKey](IMContactStore, "kIMCNContactWatchWallpaperImageDataKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactImageBackgroundColorsDataKey](IMContactStore, "kIMCNContactImageBackgroundColorsDataKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMContactStore kIMCNContactSensitiveContentConfigurationKey](IMContactStore, "kIMCNContactSensitiveContentConfigurationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithObjects:", v18, v17, v15, v2, v3, v4, v5, v6, v7, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[IMContactStore IMCNContactFormatterClass](IMContactStore, "IMCNContactFormatterClass"))
  {
    -[objc_class descriptorForRequiredKeysForStyle:](+[IMContactStore IMCNContactFormatterClass](IMContactStore, "IMCNContactFormatterClass"), "descriptorForRequiredKeysForStyle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (+[IMContactStore IMCNMeCardSharingPickerViewControllerClass](IMContactStore, "IMCNMeCardSharingPickerViewControllerClass"))
  {
    -[objc_class descriptorForRequiredKeys](+[IMContactStore IMCNMeCardSharingPickerViewControllerClass](IMContactStore, "IMCNMeCardSharingPickerViewControllerClass"), "descriptorForRequiredKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v10, "copy");

  return v13;
}

+ (id)dialingCodeForID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length") && objc_msgSend(v3, "hasPrefix:", CFSTR("+")))
  {
    IMCountryCodeForNumber();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = objc_msgSend(MEMORY[0x1E0C99DC8], "ITUCountryCodeForISOCountryCode:", v4);
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v5;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingString:", v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v13 = 138412546;
          v14 = v3;
          v15 = 2112;
          v16 = v4;
          _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Could not identify an ITU Country code for ID:%@ Country Code:%@.", (uint8_t *)&v13, 0x16u);
        }

      }
    }
    v7 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

+ (id)dialingForCurrentLocale
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0C99DC8], "ITUCountryCodeForISOCountryCode:", v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)IDWithCurrentLocaleITUCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    IMStripFormattingFromAddress();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMContactStore dialingForCurrentLocale](IMContactStore, "dialingForCurrentLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isCNContactAKnownContact:(id)a3
{
  id v3;
  char isKindOfClass;
  char v5;

  if (a3)
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v5 = isKindOfClass ^ 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

+ (id)descriptionForCNContact:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[IMContactStore fullNameForCNContact:](IMContactStore, "fullNameForCNContact:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ : %@"), v5, v7);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("Failed to fetch a CNContact from ContactStore. Using placeholder");
  }

  return v4;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSMutableDictionary)CNIDToHandleIDsMap
{
  return self->_CNIDToHandleIDsMap;
}

- (void)setCNIDToHandleIDsMap:(id)a3
{
  objc_storeStrong((id *)&self->_CNIDToHandleIDsMap, a3);
}

- (NSMutableDictionary)IDToCNContactMap
{
  return self->_IDToCNContactMap;
}

- (void)setIDToCNContactMap:(id)a3
{
  objc_storeStrong((id *)&self->_IDToCNContactMap, a3);
}

- (BOOL)batchFetchingForLaunchCompleted
{
  return self->_batchFetchingForLaunchCompleted;
}

- (void)setBatchFetchingForLaunchCompleted:(BOOL)a3
{
  self->_batchFetchingForLaunchCompleted = a3;
}

- (double)lastContactStoreSync
{
  return self->_lastContactStoreSync;
}

- (void)setLastContactStoreSync:(double)a3
{
  self->_lastContactStoreSync = a3;
}

- (double)lastMeContactStoreSync
{
  return self->_lastMeContactStoreSync;
}

- (void)setLastMeContactStoreSync:(double)a3
{
  self->_lastMeContactStoreSync = a3;
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (BOOL)shouldSkipMeContactLookup
{
  return self->_shouldSkipMeContactLookup;
}

- (void)setShouldSkipMeContactLookup:(BOOL)a3
{
  self->_shouldSkipMeContactLookup = a3;
}

- (OS_dispatch_queue)changeHistoryFetchQueue
{
  return self->_changeHistoryFetchQueue;
}

- (void)setChangeHistoryFetchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_changeHistoryFetchQueue, a3);
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, a3);
}

- (NSArray)CNIDsForBatchFetch
{
  return self->_CNIDsForBatchFetch;
}

- (void)setCNIDsForBatchFetch:(id)a3
{
  objc_storeStrong((id *)&self->_CNIDsForBatchFetch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CNIDsForBatchFetch, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_changeHistoryFetchQueue, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_IDToCNContactMap, 0);
  objc_storeStrong((id *)&self->_CNIDToHandleIDsMap, 0);
  objc_storeStrong((id *)&self->_handleIDToCNIDMap, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
}

@end
