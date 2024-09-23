@implementation IMDContactCache

+ (id)sharedInstance
{
  if (qword_1ED0D39B0 != -1)
    dispatch_once(&qword_1ED0D39B0, &unk_1E5AAEF28);
  return (id)qword_1ED0D3A90;
}

- (IMDContactCache)init
{
  IMDContactCache *v3;
  NSCache *v4;
  NSCache *cache;
  uint64_t v6;
  NSData *currentHistoryToken;
  void *v8;
  IMDContactCache *v9;
  NSObject *v10;
  objc_super v12;

  if ((IMDIsRunningInDatabaseServerProcess() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)IMDContactCache;
    v3 = -[IMDContactCache init](&v12, sel_init);
    if (v3)
    {
      v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      cache = v3->_cache;
      v3->_cache = v4;

      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v6 = objc_claimAutoreleasedReturnValue();
      currentHistoryToken = v3->_currentHistoryToken;
      v3->_currentHistoryToken = (NSData *)v6;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v3, sel_contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

    }
    self = v3;
    v9 = self;
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1ABC560C8(v10);

    v9 = 0;
  }

  return v9;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)resetCache
{
  id v2;

  -[IMDContactCache cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)removeCachedContactForKey:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Removing cached contact for key %@", (uint8_t *)&v9, 0xCu);
      }

    }
    -[IMDContactCache cache](self, "cache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v4);

  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = 0;
      _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "IMDContactCache - asked to remove cached contact for nil key %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)cacheContactsFromFetchResults:(id)a3 forAliases:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  if ((!v6 || !v8) && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "IMDContactCache - not caching fetchResults as aliases: %@, fetchResults: %@", buf, 0x16u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Caching contacts for Spotlight Contacts cache", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v18, v16);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[IMDContactCache updateCacheForAliases:](self, "updateCacheForAliases:", v11);
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1ABB6DB38;
    v20[3] = &unk_1E5AAF5B8;
    v20[4] = self;
    v21 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v20);

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v19, OS_LOG_TYPE_INFO, "DONE Caching contacts for Spotlight", buf, 2u);
    }

  }
}

- (void)updateCacheForAliases:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v10 = 0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "IMDContactCache - asked to udpate cache with %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134217984;
      v10 = v7;
      _os_log_impl(&dword_1ABB60000, v6, OS_LOG_TYPE_INFO, "Udpating cache with %lu aliases", buf, 0xCu);
    }

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1ABB6DCE0;
  v8[3] = &unk_1E5AAF5E0;
  v8[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (void)cacheContact:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_12;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "IMDContactCache - asked to cache contact for nil key %@", (uint8_t *)&v10, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!v6)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_12;
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = 0;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Not caching nil contact:%@ for key:%@", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_11;
  }
  -[IMDContactCache cache](self, "cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

LABEL_12:
}

- (id)cachedContactForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    -[IMDContactCache cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "IMDContactCache - Cannot get cached contact for nil key", v9, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (id)_handlesMatchingContactIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[IMDContactCache cache](self, "cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapTableRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v7, "keyEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v15))
          objc_msgSend(v5, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

- (void)contactStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  IMDContactChangeHandler *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v5, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Contacts store reported a change, updating our contacts cache", buf, 2u);
    }

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C971E8]);
  objc_msgSend(v6, "setStartingToken:", self->_currentHistoryToken);
  v7 = *MEMORY[0x1E0C967C0];
  v28[0] = *MEMORY[0x1E0C966A8];
  v28[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdditionalContactKeyDescriptors:", v8);

  _IMDContactStore();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v6, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;

  if (!v10 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Could not fetch Change History from CNContactStore error:%@", buf, 0xCu);

    }
  }
  v14 = objc_alloc_init(IMDContactChangeHandler);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v10, "value", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "acceptEventVisitor:", v14);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v16);
  }

  objc_msgSend(v10, "currentHistoryToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDContactCache setCurrentHistoryToken:](self, "setCurrentHistoryToken:", v19);

}

+ (id)contactsForVCardAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 8, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    if (v6)
    {
      v7 = v6;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v15 = "+[IMDContactCache contactsForVCardAtPath:]";
          v16 = 2112;
          v17 = v3;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "%s Couldn't read data from file %@ ; error %@",
            buf,
            0x20u);
        }

      }
    }
    else
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v5, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      if (!v7)
      {
LABEL_15:

        goto LABEL_16;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v15 = "+[IMDContactCache contactsForVCardAtPath:]";
          v16 = 2112;
          v17 = v3;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "%s Failed to generate vcard summary from file %@ ; error %@",
            buf,
            0x20u);
        }

      }
    }
    v9 = 0;
    goto LABEL_15;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

+ (id)vCardNameForContact:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "organizationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (void)updateAttributes:(id)a3 withAddressFromContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  objc_msgSend(a4, "postalAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "street");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThoroughfare:", v8);

  objc_msgSend(v7, "city");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCity:", v9);

  objc_msgSend(v7, "postalCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPostalCode:", v10);

  objc_msgSend(v7, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStateOrProvince:", v11);

  objc_msgSend(v7, "country");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountry:", v12);

}

+ (id)vCardMapURLForContact:(id)a3
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend(v18, "urlAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v25 = "+[IMDContactCache vCardMapURLForContact:]";
      v26 = 2117;
      v27 = v3;
      _os_log_impl(&dword_1ABB60000, v4, OS_LOG_TYPE_INFO, "%s urls %{sensitive}@", buf, 0x16u);
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "+[IMDContactCache vCardMapURLForContact:]";
            v26 = 2112;
            v27 = v11;
            _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "%s url host %@", buf, 0x16u);
          }

        }
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("maps.apple.com")) & 1) != 0
          || objc_msgSend(v11, "isEqualToString:", CFSTR("maps.google.com")))
        {
          v13 = v8;

          goto LABEL_21;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      v13 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_21:

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315651;
      v25 = "+[IMDContactCache vCardMapURLForContact:]";
      v26 = 2117;
      v27 = v13;
      v28 = 2117;
      v29 = v15;
      _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "%s got mapURL %{sensitive}@ value %{sensitive}@", buf, 0x20u);

    }
  }
  objc_msgSend(v13, "value");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)vCardCoordinateForMapURL:(id)a3 outLatitude:(float *)a4 outLongitude:(float *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  id v41;
  float *v42;
  float *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float *v48;
  float *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!objc_msgSend(v7, "length"))
  {
    v23 = 0;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v11;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("maps.apple.com")))
  {
    v42 = a4;
    v44 = v10;
    v46 = v9;
    v48 = a5;
    v41 = v7;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v56 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v18, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("ll"));

          if (v20)
          {
            v30 = v18;

            v15 = v30;
            goto LABEL_30;
          }
          if (!v15)
          {
            objc_msgSend(v18, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("sll"));

            if (v22)
              v15 = v18;
            else
              v15 = 0;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_30:

    objc_msgSend(v15, "value");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsSeparatedByString:", CFSTR(","));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;
    v9 = v46;
    a5 = v48;
    a4 = v42;
    v10 = v44;
LABEL_36:

    goto LABEL_37;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("maps.google.com")))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = v11;
    v15 = (id)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v15)
    {
      v43 = a4;
      v45 = v10;
      v47 = v9;
      v49 = a5;
      v25 = *(_QWORD *)v52;
      while (2)
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(_QWORD *)v52 != v25)
            objc_enumerationMutation(v24);
          v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("q"));

          if (v29)
          {
            v15 = v27;
            goto LABEL_32;
          }
        }
        v15 = (id)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v15)
          continue;
        break;
      }
LABEL_32:
      v9 = v47;
      a5 = v49;
      a4 = v43;
      v10 = v45;
    }

    objc_msgSend(v15, "value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsSeparatedByString:", CFSTR(" "));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v32, "count"))
    {
      objc_msgSend(v32, "objectAtIndex:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "componentsSeparatedByString:", CFSTR(","));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = 0;
    }
    goto LABEL_36;
  }
  v15 = 0;
  v31 = 0;
LABEL_37:
  v35 = objc_msgSend(v31, "count");
  v23 = v35 == 2;
  if (v35 == 2)
  {
    if (a4)
    {
      objc_msgSend(v31, "objectAtIndex:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      *(float *)&v37 = v37;
      *a4 = *(float *)&v37;

    }
    if (a5)
    {
      objc_msgSend(v31, "objectAtIndex:", 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      *(float *)&v39 = v39;
      *a5 = *(float *)&v39;

    }
  }

LABEL_43:
  return v23;
}

- (NSData)currentHistoryToken
{
  return self->_currentHistoryToken;
}

- (void)setCurrentHistoryToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentHistoryToken, a3);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);
}

@end
