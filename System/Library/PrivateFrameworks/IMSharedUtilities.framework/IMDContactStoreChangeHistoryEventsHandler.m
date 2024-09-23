@implementation IMDContactStoreChangeHistoryEventsHandler

- (IMDContactStoreChangeHistoryEventsHandler)initWithAliasToCNIDMap:(id)a3
{
  id v5;
  IMDContactStoreChangeHistoryEventsHandler *v6;
  NSObject *v7;
  uint64_t v8;
  NSMutableDictionary *CNIDToAliasesMap;
  uint8_t v11[16];
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMDContactStoreChangeHistoryEventsHandler;
  v6 = -[IMDContactStoreChangeHistoryEventsHandler init](&v12, sel_init);
  if (v6)
  {
    if (IMAdditionalContactsLoggingEnabled())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, " Initializing with alisToCNIDMap", v11, 2u);
        }

      }
      +[IMContactStore logDictionary:](IMContactStore, "logDictionary:", v5);
    }
    objc_storeStrong((id *)&v6->_aliasToCNIDMap, a3);
    -[IMDContactStoreChangeHistoryEventsHandler generateCNIDToAliasesMapFrom:](v6, "generateCNIDToAliasesMapFrom:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    CNIDToAliasesMap = v6->_CNIDToAliasesMap;
    v6->_CNIDToAliasesMap = (NSMutableDictionary *)v8;

  }
  return v6;
}

- (id)getAliasToCNIDMap
{
  return self->_aliasToCNIDMap;
}

- (id)getCNIDToAliasesMap
{
  return self->_CNIDToAliasesMap;
}

- (id)generateCNIDToAliasesMapFrom:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19E2756E0;
  v8[3] = &unk_1E3FB57F0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (void)removeAliasFromCNIDToAliasesMap:(id)a3 withCNID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *CNIDToAliasesMap;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "length") && objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_CNIDToAliasesMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v10))
      objc_msgSend(v7, "removeObject:", v10);
    v8 = objc_msgSend(v7, "count");
    CNIDToAliasesMap = self->_CNIDToAliasesMap;
    if (v8)
      -[NSMutableDictionary setObject:forKey:](CNIDToAliasesMap, "setObject:forKey:", v7, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](CNIDToAliasesMap, "removeObjectForKey:", v6);

  }
}

- (void)addAliasToCNIDToAliasMap:(id)a3 withCNID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "length") && objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_CNIDToAliasesMap, "objectForKey:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "addObject:", v8);
    -[NSMutableDictionary setObject:forKey:](self->_CNIDToAliasesMap, "setObject:forKey:", v7, v6);

  }
}

- (void)visitDropEverythingEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *aliasToCNIDMap;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Drop everything change history event", v7, 2u);
    }

  }
  aliasToCNIDMap = self->_aliasToCNIDMap;
  self->_aliasToCNIDMap = 0;

  -[IMDContactStoreChangeHistoryEventsHandler setReceivedDropEverythingEvent:](self, "setReceivedDropEverythingEvent:", 1);
}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Add Contact change history event", v7, 2u);
    }

  }
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDContactStoreChangeHistoryEventsHandler handleAddOrUpdateEventForCNContact:](self, "handleAddOrUpdateEventForCNContact:", v6);

}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Handling a Update Contact change history event", v7, 2u);
    }

  }
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDContactStoreChangeHistoryEventsHandler handleAddOrUpdateEventForCNContact:](self, "handleAddOrUpdateEventForCNContact:", v6);

}

- (void)visitDeleteContactEvent:(id)a3
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Handling a Delete Contact change history event", buf, 2u);
    }

  }
  objc_msgSend(v12, "contactIdentifier", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_CNIDToAliasesMap, "objectForKey:", v14);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v9;
            _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Removing alias %@ from _aliasToCNIDMap ", buf, 0xCu);
          }

        }
        -[NSMutableDictionary removeObjectForKey:](self->_aliasToCNIDMap, "removeObjectForKey:", v9);
        -[NSMutableDictionary setObject:forKey:](self->_aliasToCNIDMap, "setObject:forKey:", CFSTR("__kIMDCNPersonNotFound"), v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v5, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Removing entry for contactIdentifier %@ from _CNIDToAliasesMap ", buf, 0xCu);
      }

    }
    -[NSMutableDictionary removeObjectForKey:](self->_CNIDToAliasesMap, "removeObjectForKey:", v14);
  }

}

- (void)handleAddOrUpdateEventForCNContact:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *aliasToCNIDMap;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSMutableDictionary *CNIDToAliasesMap;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[IMDContactStoreChangeHistoryEventsHandler matchAliasesFromCacheForCNContact:](self, "matchAliasesFromCacheForCNContact:", v4);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v35 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_aliasToCNIDMap, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v9;
                v41 = 2112;
                v42 = v8;
                _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, " Removing CNID %@ from _aliasToCNIDMap for alias %@", buf, 0x16u);
              }

            }
            -[NSMutableDictionary removeObjectForKey:](self->_aliasToCNIDMap, "removeObjectForKey:", v8);
            objc_msgSend(v4, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDContactStoreChangeHistoryEventsHandler removeAliasFromCNIDToAliasesMap:withCNID:](self, "removeAliasFromCNIDToAliasesMap:withCNID:", v8, v11);

          }
          aliasToCNIDMap = self->_aliasToCNIDMap;
          objc_msgSend(v4, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](aliasToCNIDMap, "setObject:forKey:", v13, v8);

          objc_msgSend(v4, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMDContactStoreChangeHistoryEventsHandler addAliasToCNIDToAliasMap:withCNID:](self, "addAliasToCNIDToAliasMap:withCNID:", v8, v14);

          if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v4, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v40 = v16;
              v41 = 2112;
              v42 = v8;
              _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, " Adding CNID %@ to _aliasToCNIDMap for alias %@", buf, 0x16u);

            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v5);
    }

    CNIDToAliasesMap = self->_CNIDToAliasesMap;
    objc_msgSend(v4, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](CNIDToAliasesMap, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v19, "mutableCopy");

    v20 = objc_msgSend(v28, "count");
    if (v20 > objc_msgSend(obj, "count"))
    {
      objc_msgSend(v28, "removeObjectsInArray:", obj);
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = v28;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
            -[NSMutableDictionary removeObjectForKey:](self->_aliasToCNIDMap, "removeObjectForKey:", v25);
            -[NSMutableDictionary setObject:forKey:](self->_aliasToCNIDMap, "setObject:forKey:", CFSTR("__kIMDCNPersonNotFound"), v25);
            if (IMAdditionalContactsLoggingEnabled() && IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v40 = v25;
                _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, " Removing entry for alias %@ from _aliasToCNIDMap and replacing with __kIMDCNPersonNotFound", buf, 0xCu);
              }

            }
            objc_msgSend(v4, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMDContactStoreChangeHistoryEventsHandler removeAliasFromCNIDToAliasesMap:withCNID:](self, "removeAliasFromCNIDToAliasesMap:withCNID:", v25, v27);

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v22);
      }

    }
  }

}

- (id)matchAliasesFromCacheForCNContact:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  +[IMContactStore IDsFromCNContact:](IMContactStore, "IDsFromCNContact:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary allKeys](self->_aliasToCNIDMap, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "containsObject:", v9) & 1) == 0
          && MEMORY[0x1A1AE7D10](v9)
          && (objc_msgSend(v9, "hasPrefix:", CFSTR("+")) & 1) == 0)
        {
          +[IMContactStore IDWithCurrentLocaleITUCode:](IMContactStore, "IDWithCurrentLocaleITUCode:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v11;
              _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Re-attempting to lookup cache with ID & ITU: %@", buf, 0xCu);
            }

          }
          if (objc_msgSend(v10, "containsObject:", v11))
          {
            objc_msgSend(v19, "removeObject:", v9);
            objc_msgSend(v19, "addObject:", v11);
LABEL_21:

            goto LABEL_22;
          }
          objc_msgSend(CFSTR("+"), "stringByAppendingString:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v10, "containsObject:", v13);

          if (v14)
          {
            objc_msgSend(v19, "removeObject:", v9);
            objc_msgSend(CFSTR("+"), "stringByAppendingString:", v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v15);

            goto LABEL_21;
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_22:

  v16 = (void *)objc_msgSend(v19, "copy");
  return v16;
}

- (BOOL)receivedDropEverythingEvent
{
  return self->_receivedDropEverythingEvent;
}

- (void)setReceivedDropEverythingEvent:(BOOL)a3
{
  self->_receivedDropEverythingEvent = a3;
}

- (NSMutableDictionary)aliasToCNIDMap
{
  return self->_aliasToCNIDMap;
}

- (void)setAliasToCNIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_aliasToCNIDMap, a3);
}

- (NSMutableDictionary)CNIDToAliasesMap
{
  return self->_CNIDToAliasesMap;
}

- (void)setCNIDToAliasesMap:(id)a3
{
  objc_storeStrong((id *)&self->_CNIDToAliasesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CNIDToAliasesMap, 0);
  objc_storeStrong((id *)&self->_aliasToCNIDMap, 0);
}

@end
