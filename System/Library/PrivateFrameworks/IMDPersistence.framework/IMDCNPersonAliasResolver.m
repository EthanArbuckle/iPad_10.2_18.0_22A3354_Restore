@implementation IMDCNPersonAliasResolver

- (IMDCNPersonAliasResolver)init
{
  IMDCNPersonAliasResolver *v3;
  IMDCNPersonAliasResolver *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[16];

  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)IMDCNPersonAliasResolver;
    v3 = -[IMDCNPersonAliasResolver init](&v7, sel_init);
    if (v3)
      sub_1ABC4B4A0();
    self = v3;
    v4 = self;
  }
  else
  {
    if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Error! being called in a process that is not in IMDPersistenceAgent!", buf, 2u);
      }

    }
    v4 = 0;
  }

  return v4;
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  id v4;
  CNContactStore *v5;
  CNContactStore *v6;
  NSData *v7;
  NSData *currentHistoryToken;
  IMDContactStoreChangeHistoryEventsHandler *contactsEventhandler;
  NSObject *v10;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      sub_1ABC4B4A0();
      v4 = objc_alloc_init(MEMORY[0x1E0C972A0]);
      objc_msgSend(v4, "setUseInProcessMapperExclusively:", 1);
      v5 = (CNContactStore *)objc_msgSend(objc_alloc((Class)MEMORY[0x1AF434FF4](CFSTR("CNContactStore"), CFSTR("Contacts"))), "initWithConfiguration:", v4);
      v6 = self->_contactStore;
      self->_contactStore = v5;

      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v7 = (NSData *)objc_claimAutoreleasedReturnValue();
      currentHistoryToken = self->_currentHistoryToken;
      self->_currentHistoryToken = v7;

      contactsEventhandler = self->_contactsEventhandler;
      self->_contactsEventhandler = 0;

    }
    contactStore = self->_contactStore;
    if (!contactStore)
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1ABC64254(v10);

      contactStore = self->_contactStore;
    }
  }
  return contactStore;
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (id)_predicateForEmailAddress:(id)a3
{
  return (id)objc_msgSend((id)qword_1ED0D3878, "predicateForContactsMatchingEmailAddress:", a3);
}

- (id)_predicateForPhoneNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)qword_1ED0D3878;
  objc_msgSend((id)qword_1ED0D38A0, "phoneNumberWithStringValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForContactsMatchingPhoneNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_predicateForAlias:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "_appearsToBeEmail"))
    -[IMDCNPersonAliasResolver _predicateForEmailAddress:](self, "_predicateForEmailAddress:", v4);
  else
    -[IMDCNPersonAliasResolver _predicateForPhoneNumber:](self, "_predicateForPhoneNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fetchContactIdentifierForAlias:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v22;
  _QWORD v23[2];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMDCNPersonAliasResolver _predicateForAlias:](self, "_predicateForAlias:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = IMAdditionalContactsLoggingEnabled();
    if (v5)
    {
      if (v6 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v4;
          v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Requesting a CNContact from Contact Store for Alias %@ and Predicate %@", buf, 0x16u);
        }

      }
      -[IMDCNPersonAliasResolver contactStore](self, "contactStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = qword_1ED0D38C0;
      v23[1] = qword_1ED0D38D0;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:error:", v5, v9, &v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v22;

      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "description");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v4;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Error getting contact from Contact Store for alias %@ error %@", buf, 0x16u);

          }
        }

        v10 = 0;
      }
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v14, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v16;
            v26 = 2112;
            v27 = v4;
            _os_log_impl(&dword_1ABB60000, v15, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: CNContact Identifier %@ for alias %@", buf, 0x16u);

          }
        }
        objc_msgSend(v14, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v4;
            _os_log_impl(&dword_1ABB60000, v20, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: No contact for alias %@", buf, 0xCu);
          }

        }
        v17 = 0;
      }

    }
    else
    {
      if (v6 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v4;
          _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Could not get predicate for alias %@", buf, 0xCu);
        }

      }
      v17 = 0;
    }

  }
  else
  {
    if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Passed in nil email _fetchCNContactForEmail", buf, 2u);
      }

    }
    v17 = 0;
  }

  return v17;
}

- (id)_batchFetchContactRecordIDForAliases:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[4];
  id v40;
  id v41;
  __int128 *p_buf;
  id v43;
  uint8_t v44[4];
  uint64_t v45;
  uint8_t v46[128];
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];

  v52[2] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  if (objc_msgSend(v33, "count"))
  {
    v3 = objc_alloc((Class)qword_1ED0D3880);
    v52[0] = qword_1ED0D38C0;
    v52[1] = qword_1ED0D38D0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v3, "initWithKeysToFetch:", v4);

    objc_msgSend((id)qword_1ED0D3878, "predicateForContactsMatchingHandleStrings:", v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPredicate:", v27);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v33, "count");
        _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Dispatching a contacts batch query for %lu aliases.", (uint8_t *)&buf, 0xCu);
      }

    }
    v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v6, "startTimingForKey:", CFSTR("batchFetchForAliases"));
    v29 = v6;
    -[IMDCNPersonAliasResolver contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v7, "executeFetchRequest:error:", v32, &v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v43;

    objc_msgSend(v31, "value");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stopTimingForKey:", CFSTR("batchFetchForAliases"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v29, "totalTimeForKey:", CFSTR("batchFetchForAliases"));
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Contacts batch fetch from Contact Store completed. Took %f seconds", (uint8_t *)&buf, 0xCu);
      }

    }
    if (v30)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v48 = 0x3032000000;
      v49 = sub_1ABC4C650;
      v50 = sub_1ABC4C660;
      v51 = 0;
      objc_msgSend(v31, "currentHistoryToken");
      v51 = (id)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1ABC4C668;
      block[3] = &unk_1E5AC0180;
      v10 = v30;
      v40 = v10;
      v11 = v33;
      v41 = v11;
      p_buf = &buf;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v10, "objectForKey:", v16, v26);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "count"))
            {
              objc_msgSend(v17, "firstObject");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[IMDContactCache sharedInstance](IMDContactCache, "sharedInstance");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "cacheContact:forKey:", v18, v16);

              objc_msgSend(v18, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKey:", v20, v16);

            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v44 = 138412290;
                  v45 = v16;
                  _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: No contact for alias %@", v44, 0xCu);
                }

              }
              objc_msgSend(v34, "setObject:forKey:", CFSTR("__kIMDCNPersonNotFound"), v16);
            }

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        }
        while (v13);
      }

      -[IMDCNPersonAliasResolver setCurrentHistoryToken:](self, "setCurrentHistoryToken:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      _Block_object_dispose(&buf, 8);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v26;
        _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: No results obtained from the Contacts batch Fetchrequest. Error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v23 = v34;

  }
  else
  {
    if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Passed in empty set of aliases", (uint8_t *)&buf, 2u);
      }

    }
    v23 = 0;
  }

  return v23;
}

- (id)_fetchAliasToCNIDMapForAliases:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v5, "startTimingForKey:", CFSTR("_fetchAliasToCNIDMapForAliases"));
  -[IMDCNPersonAliasResolver _batchFetchContactRecordIDForAliases:](self, "_batchFetchContactRecordIDForAliases:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMAdditionalContactsLoggingEnabled())
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: _fetchAliasToCNIDMapForAliases returning aliasIDMap", (uint8_t *)&v11, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D397A8], "logDictionary:", v6);
  }
  objc_msgSend(v5, "stopTimingForKey:", CFSTR("_fetchAliasToCNIDMapForAliases"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "totalTimeForKey:", CFSTR("_fetchAliasToCNIDMapForAliases"));
      v11 = 134217984;
      v12 = v9;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Generating aliasToIDMap completed. Took %f seconds", (uint8_t *)&v11, 0xCu);
    }

  }
  return v6;
}

- (id)_updateAliasToCNIDMap:(id)a3 withHistoryToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  IMDContactStoreChangeHistoryEventsHandler *v15;
  IMDContactStoreChangeHistoryEventsHandler *contactsEventhandler;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)qword_1ED0D3870);
  objc_msgSend(v8, "setStartingToken:", v7);
  v39[0] = qword_1ED0D38C0;
  v39[1] = qword_1ED0D38D0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdditionalContactKeyDescriptors:", v9);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Updating aliasToCNIDMap using Contact Change History events", buf, 2u);
    }

  }
  if (IMAdditionalContactsLoggingEnabled())
    objc_msgSend(MEMORY[0x1E0D397A8], "logDictionary:", v6);
  -[IMDCNPersonAliasResolver contactStore](self, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v8, &v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v35;

  if (v12)
  {
    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      v13 = objc_alloc(MEMORY[0x1E0D397D0]);
      v14 = (void *)objc_msgSend(v6, "mutableCopy");
      v15 = (IMDContactStoreChangeHistoryEventsHandler *)objc_msgSend(v13, "initWithAliasToCNIDMap:", v14);
      contactsEventhandler = self->_contactsEventhandler;
      self->_contactsEventhandler = v15;

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v12, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "acceptEventVisitor:", self->_contactsEventhandler);
          if (-[IMDContactStoreChangeHistoryEventsHandler receivedDropEverythingEvent](self->_contactsEventhandler, "receivedDropEverythingEvent"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Skipping Contact change history events after the Drop Everything Event", buf, 2u);
              }

            }
            goto LABEL_23;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v18)
          continue;
        break;
      }
    }
LABEL_23:

    objc_msgSend(v12, "currentHistoryToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDCNPersonAliasResolver setCurrentHistoryToken:](self, "setCurrentHistoryToken:", v22);

    -[IMDContactStoreChangeHistoryEventsHandler getAliasToCNIDMap](self->_contactsEventhandler, "getAliasToCNIDMap");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      if (IMAdditionalContactsLoggingEnabled())
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: _updateAliasToCNIDMap returning aliasIDMap", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0D397A8], "logDictionary:", v23);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v27, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Refetching CNID for ALL Aliases.", buf, 2u);
        }

      }
      objc_msgSend(v6, "allKeys");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDCNPersonAliasResolver _fetchAliasToCNIDMapForAliases:](self, "_fetchAliasToCNIDMapForAliases:", v28);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v30, "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v26;
        _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "IMDCNPersonAliasResolver: Could not fetch Change History from CNContactStore error:%@", buf, 0xCu);

      }
    }
    v23 = v6;
  }

  return v23;
}

- (void)CNRecordIDForAliases:(id)a3 completionHandler:(id)a4
{
  void *v6;
  void (**v7)(id, void *, _QWORD);

  v7 = (void (**)(id, void *, _QWORD))a4;
  -[IMDCNPersonAliasResolver _fetchAliasToCNIDMapForAliases:](self, "_fetchAliasToCNIDMapForAliases:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v6, 0);

}

- (BOOL)isFavoritedContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[IMDCNPersonAliasResolver contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unifiedContactWithIdentifier:keysToFetch:error:", v4, MEMORY[0x1E0C9AA60], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[IMDCNPersonAliasResolver isCNContactFavorited:](self, "isCNContactFavorited:", v6);
  return (char)self;
}

- (id)_fetchContactGivenNameAndBirthdayForHandleID:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0D397B0], sel_getContactGivenNameAndBirthdayForHandleID_);
}

- (BOOL)isCNContactFavorited:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  if (!a3)
    return 0;
  v4 = (objc_class *)qword_1ED0D3898;
  v5 = a3;
  v6 = [v4 alloc];
  -[IMDCNPersonAliasResolver contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithContactStore:", v7);

  objc_msgSend(v8, "entriesForContact:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count") != 0;
  return v10;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setCurrentHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentHistoryToken, a3);
}

- (NSMutableDictionary)aliasToCNIDMap
{
  return self->_aliasToCNIDMap;
}

- (void)setAliasToCNIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_aliasToCNIDMap, a3);
}

- (IMDContactStoreChangeHistoryEventsHandler)contactsEventhandler
{
  return self->_contactsEventhandler;
}

- (void)setContactsEventhandler:(id)a3
{
  objc_storeStrong((id *)&self->_contactsEventhandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsEventhandler, 0);
  objc_storeStrong((id *)&self->_aliasToCNIDMap, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
