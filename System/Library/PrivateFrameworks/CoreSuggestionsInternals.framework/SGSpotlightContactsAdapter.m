@implementation SGSpotlightContactsAdapter

- (SGSpotlightContactsAdapter)initWithSGSqlEntityStore:(id)a3
{
  id v4;
  SGSpotlightContactsAdapter *v5;
  SGSpotlightContactsAdapter *v6;

  v4 = a3;
  v5 = -[SGSpotlightContactsAdapter init](self, "init");
  v6 = v5;
  if (v5)
    -[SGSpotlightContactsAdapter setStore:](v5, "setStore:", v4);

  return v6;
}

- (id)pseudoContactVcardDirectory
{
  SGSpotlightContactsAdapter *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSURL *v7;
  NSObject *v8;
  char v9;
  uint64_t v11;
  NSURL *vCardsDirectoryURL;
  NSURL *v13;
  void *v14;
  NSURL *v15;
  NSURL *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  NSURL *v23;
  __int16 v24;
  NSURL *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = self;
  v3 = objc_sync_enter(v2);
  if (v2->_vCardsDirectoryURL)
    goto LABEL_6;
  v4 = (void *)MEMORY[0x1C3BD4F6C](v3);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 1, 0, 1, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSURL *)v21;

  if (v7)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      v9 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    v17 = "failed to get URL for library directory: %@";
    v18 = v8;
    v19 = 12;
LABEL_19:
    _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_4;
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Metadata/com.apple.IntelligentSuggestions/"));
  v11 = objc_claimAutoreleasedReturnValue();
  vCardsDirectoryURL = v2->_vCardsDirectoryURL;
  v2->_vCardsDirectoryURL = (NSURL *)v11;

  v13 = v2->_vCardsDirectoryURL;
  if (!v13)
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "_vCardsDirectoryURL is nil", buf, 2u);
    }
    v7 = 0;
    goto LABEL_4;
  }
  if (-[NSURL checkResourceIsReachableAndReturnError:](v13, "checkResourceIsReachableAndReturnError:", 0))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v2->_vCardsDirectoryURL;
    v20 = 0;
    objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v20);
    v7 = (NSURL *)v20;

    if (v7)
    {
      sgLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      v16 = v2->_vCardsDirectoryURL;
      *(_DWORD *)buf = 138412546;
      v23 = v16;
      v24 = 2112;
      v25 = v7;
      v17 = "failed to create %@: %@";
      v18 = v8;
      v19 = 22;
      goto LABEL_19;
    }
  }
  v9 = 1;
LABEL_5:

  objc_autoreleasePoolPop(v4);
  if ((v9 & 1) != 0)
  {
LABEL_6:
    objc_sync_exit(v2);

    return v2->_vCardsDirectoryURL;
  }
  objc_sync_exit(v2);

  return 0;
}

- (id)urlForRecordIdVCard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu.vcf"), objc_msgSend(v4, "internalEntityId"));
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGSpotlightContactsAdapter pseudoContactVcardDirectory](self, "pseudoContactVcardDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (id)urlForStorageContactVCard:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "bestProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "masterEntityId");
  if (!v6)
    v6 = objc_msgSend(v4, "masterEntityId");

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu.vcf"), v6);
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGSpotlightContactsAdapter pseudoContactVcardDirectory](self, "pseudoContactVcardDirectory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v10;
}

- (id)coreSpotlightAttributeSetForContact:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CA6B50]);
  v7 = (void *)objc_msgSend(v6, "initWithContentType:", *MEMORY[0x1E0CEC490]);
  v8 = objc_alloc(MEMORY[0x1E0CA6AC0]);
  v9 = objc_msgSend(v8, "initWithKeyName:", *MEMORY[0x1E0CA67F0]);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSpotlightContactsAdapter.m"), 147, CFSTR("failed to create a CSCustomAttributeKey for MDItemRelatedAppBundleIdentifier"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fullName");
  }
  else
  {
    objc_msgSend(v5, "emailAddresses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "emailAddress");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayName:", v14);

  if (WeakRetained)
  {
    objc_msgSend(v12, "recordId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "loadOriginByRecordId:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "bundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forCustomKey:", v17, v9);

  }
  v51 = WeakRetained;
  v52 = (void *)v9;

  objc_msgSend(v7, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v18);

  v19 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v53 = v5;
  objc_msgSend(v5, "postalAddresses");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v55;
    v24 = 1;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "components");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "city");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "length");

        if (v28)
        {
          objc_msgSend(v26, "city");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v24 & 1) != 0)
            objc_msgSend(v7, "setCity:", v29);
          else
            objc_msgSend(v19, "addObject:", v29);

        }
        objc_msgSend(v26, "state");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "length");

        if (v31)
        {
          objc_msgSend(v26, "state");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v24 & 1) != 0)
            objc_msgSend(v7, "setStateOrProvince:", v32);
          else
            objc_msgSend(v19, "addObject:", v32);

        }
        objc_msgSend(v26, "country");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "length");

        if (v34)
        {
          objc_msgSend(v26, "country");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v24 & 1) != 0)
            objc_msgSend(v7, "setCountry:", v35);
          else
            objc_msgSend(v19, "addObject:", v35);

        }
        objc_msgSend(v26, "street");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v26, "street");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v37);

        }
        objc_msgSend(v26, "postalCode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          objc_msgSend(v26, "postalCode");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v39);

        }
        v24 = 0;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      v24 = 0;
    }
    while (v22);
  }

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "_pas_componentsJoinedByString:", CFSTR(" "));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextContent:", v40);

  }
  objc_msgSend(v53, "emailAddresses");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v42)
  {
    objc_msgSend(v53, "emailAddresses");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    sgMap();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmailAddresses:", v44);

  }
  objc_msgSend(v53, "phones");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");

  if (v46)
  {
    objc_msgSend(v53, "phones");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    sgMap();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhoneNumbers:", v48);

  }
  return v7;
}

- (id)searchableItemsForContactsForInternalIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__SGSpotlightContactsAdapter_searchableItemsForContactsForInternalIdentifiers___block_invoke;
  v10[3] = &unk_1E7DB7190;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (void)sendContactToSpotlight:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "recordId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_debug_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEBUG, "Sending pseudo-contact with id %@ to CoreSpotlight", buf, 0xCu);

  }
  v6 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(v4, "recordId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactIdentifierFromSuggestionID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGSpotlightContactsAdapter coreSpotlightAttributeSetForContact:](self, "coreSpotlightAttributeSetForContact:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v8, CFSTR("pseudoContacts"), v9);
  +[SGSpotlightContactsAdapter searchableIndex](SGSpotlightContactsAdapter, "searchableIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSpotlightContactsAdapter dispatchGroup](SGSpotlightContactsAdapter, "dispatchGroup");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v12);
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__SGSpotlightContactsAdapter_sendContactToSpotlight___block_invoke;
  v16[3] = &unk_1E7DB71B8;
  v17 = v12;
  v14 = v12;
  objc_msgSend(v11, "indexSearchableItems:completionHandler:", v13, v16);

}

- (void)addContact:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint8_t buf[16];

  v4 = a3;
  -[SGSpotlightContactsAdapter store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "convertToContact:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "historyHasContact:", v6))
    {
      sgLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "Not sending pseudo-contact to Spotlight because it was confirmed or rejected", buf, 2u);
      }
      goto LABEL_16;
    }
    +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    +[SGCuratedContactMatcher curatedContactsFromContactStore:matchingPseudoContact:error:](SGCuratedContactMatcher, "curatedContactsFromContactStore:matchingPseudoContact:error:", v8, v6, &v11);
    v7 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v7, "count"))
    {
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v10 = "Not sending pseudo-contact to Spotlight because it is already in the curated contacts";
LABEL_14:
        _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v5, "filterOutRejectedDetailsFromContact:", v6);
      if (-[NSObject containsDetailSuggestions](v6, "containsDetailSuggestions"))
      {
        -[SGSpotlightContactsAdapter sendContactToSpotlight:](self, "sendContactToSpotlight:", v6);
LABEL_16:

        goto LABEL_17;
      }
      sgLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v10 = "Not sending pseudo-contact to Spotlight because it has no original details";
        goto LABEL_14;
      }
    }

    goto LABEL_16;
  }
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEFAULT, "Not sending pseudo-contact to Spotlight because the store is missing", buf, 2u);
  }
LABEL_17:

}

- (void)confirmOrRejectContact:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "bestProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "masterEntityId");
  if (!v5)
    v5 = objc_msgSend(v3, "masterEntityId");

  objc_msgSend(MEMORY[0x1E0D19920], "recordIdForContactWithRowId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSpotlightContactsAdapter dispatchGroup](SGSpotlightContactsAdapter, "dispatchGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v7);
  +[SGSpotlightContactsAdapter searchableIndex](SGSpotlightContactsAdapter, "searchableIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "contactIdentifierFromSuggestionID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__SGSpotlightContactsAdapter_confirmOrRejectContact___block_invoke;
  v12[3] = &unk_1E7DB71B8;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v8, "deleteSearchableItemsWithIdentifiers:completionHandler:", v10, v12);

}

- (void)removeAllStoredPseudoContacts
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[SGSpotlightContactsAdapter dispatchGroup](SGSpotlightContactsAdapter, "dispatchGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);
  +[SGSpotlightContactsAdapter searchableIndex](SGSpotlightContactsAdapter, "searchableIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("pseudoContacts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SGSpotlightContactsAdapter_removeAllStoredPseudoContacts__block_invoke;
  v6[3] = &unk_1E7DB71B8;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v4, v6);

}

- (void)removeAllPseudoContactsInIdSet:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    sgMap();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGSpotlightContactsAdapter dispatchGroup](SGSpotlightContactsAdapter, "dispatchGroup");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v5);
    +[SGSpotlightContactsAdapter searchableIndex](SGSpotlightContactsAdapter, "searchableIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SGSpotlightContactsAdapter_removeAllPseudoContactsInIdSet___block_invoke_2;
    v8[3] = &unk_1E7DB71B8;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "deleteSearchableItemsWithIdentifiers:completionHandler:", v4, v8);

  }
}

- (SGSqlEntityStore)store
{
  return (SGSqlEntityStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void)setStore:(id)a3
{
  objc_storeWeak((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_vCardsDirectoryURL, 0);
}

void __61__SGSpotlightContactsAdapter_removeAllPseudoContactsInIdSet___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __61__SGSpotlightContactsAdapter_removeAllPseudoContactsInIdSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C97200], "contactIdentifierFromSuggestionID:", a2);
}

void __59__SGSpotlightContactsAdapter_removeAllStoredPseudoContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "Could not delete all pseudo-contacts: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__SGSpotlightContactsAdapter_confirmOrRejectContact___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "Could not delete pseudo-contact from Spotlight: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__SGSpotlightContactsAdapter_sendContactToSpotlight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_1C3607000, v4, OS_LOG_TYPE_ERROR, "Could not index contact in CoreSpotlight: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __79__SGSpotlightContactsAdapter_searchableItemsForContactsForInternalIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0D19920];
  v6 = a3;
  objc_msgSend(v5, "recordIdWithInternalEntityId:", objc_msgSend(a2, "longLongValue"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "contactIdentifierFromSuggestionID:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "coreSpotlightAttributeSetForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B48]), "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v7, CFSTR("pseudoContacts"), v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

uint64_t __66__SGSpotlightContactsAdapter_coreSpotlightAttributeSetForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "phoneNumber");
}

uint64_t __66__SGSpotlightContactsAdapter_coreSpotlightAttributeSetForContact___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "emailAddress");
}

+ (id)searchableIndex
{
  if (searchableIndex__pasOnceToken3 != -1)
    dispatch_once(&searchableIndex__pasOnceToken3, &__block_literal_global_33755);
  return (id)searchableIndex__pasExprOnceResult;
}

+ (id)dispatchGroup
{
  if (dispatchGroup__pasOnceToken4 != -1)
    dispatch_once(&dispatchGroup__pasOnceToken4, &__block_literal_global_6_33754);
  return (id)dispatchGroup__pasExprOnceResult;
}

+ (void)notifyWhenFlushed:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  dispatch_block_t block;

  block = a3;
  objc_msgSend(a1, "dispatchGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  if (notifyWhenFlushed___pasOnceToken5 != -1)
    dispatch_once(&notifyWhenFlushed___pasOnceToken5, &__block_literal_global_7_33752);
  v5 = (id)notifyWhenFlushed___pasExprOnceResult;
  if (dispatch_group_wait(v4, 0))
    dispatch_group_notify(v4, v5, block);
  else
    dispatch_sync(v5, block);

}

+ (id)entityIdentifiersFromCNIdentifiers:(id)a3
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
        objc_msgSend(MEMORY[0x1E0C97200], "suggestionIDFromContactIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), objc_msgSend(v10, "internalEntityId"));
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

void __48__SGSpotlightContactsAdapter_notifyWhenFlushed___block_invoke()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("SGSpotlightContactsAdapter-notify", v1);
  v3 = (void *)notifyWhenFlushed___pasExprOnceResult;
  notifyWhenFlushed___pasExprOnceResult = (uint64_t)v2;

  objc_autoreleasePoolPop(v0);
}

void __43__SGSpotlightContactsAdapter_dispatchGroup__block_invoke()
{
  void *v0;
  dispatch_group_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = dispatch_group_create();
  v2 = (void *)dispatchGroup__pasExprOnceResult;
  dispatchGroup__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __45__SGSpotlightContactsAdapter_searchableIndex__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0CA6B38]);
  v2 = objc_msgSend(v1, "initWithName:bundleIdentifier:", CFSTR("CoreSuggestions-contacts"), *MEMORY[0x1E0D19D88]);
  v3 = (void *)searchableIndex__pasExprOnceResult;
  searchableIndex__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
