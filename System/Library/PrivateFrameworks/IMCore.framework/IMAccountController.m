@implementation IMAccountController

- (id)accountsForService:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *serviceToAccountsMap;
  void *v7;
  __CFArray *v8;
  __CFArray *Mutable;
  IMAccountController *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  __CFArray *v21;
  IMAccountController *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serviceToAccountsMap = self->_serviceToAccountsMap;
    objc_msgSend(v4, "internalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](serviceToAccountsMap, "objectForKey:", v7);
    v8 = (__CFArray *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      v10 = self;
      objc_sync_enter(v10);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = v10;
      v11 = v10->_accounts;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v15, "service");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16 == v5;

            if (v15)
              v18 = Mutable != 0;
            else
              v18 = 0;
            if (v17 && v18)
              CFArrayAppendValue(Mutable, v15);
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v12);
      }

      objc_sync_exit(obj);
      if (!self->_serviceToAccountsMap)
      {
        v19 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v20 = self->_serviceToAccountsMap;
        self->_serviceToAccountsMap = v19;

      }
      v8 = Mutable;
      if (v8)
        CFDictionarySetValue((CFMutableDictionaryRef)self->_serviceToAccountsMap, (const void *)objc_msgSend(v5, "internalName"), v8);

    }
    v21 = v8;

  }
  else
  {
    -[IMAccountController accounts](self, "accounts");
    v21 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)activeAccountsForService:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *serviceToActiveAccountsMap;
  void *v7;
  __CFArray *v8;
  __CFArray *Mutable;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const void *v15;
  BOOL v16;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  __CFArray *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    serviceToActiveAccountsMap = self->_serviceToActiveAccountsMap;
    objc_msgSend(v4, "internalName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](serviceToActiveAccountsMap, "objectForKey:", v7);
    v8 = (__CFArray *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[IMAccountController accountsForService:](self, "accountsForService:", v5, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(const void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (-[IMAccountController accountActive:](self, "accountActive:", v15))
              v16 = Mutable == 0;
            else
              v16 = 1;
            if (!v16 && v15 != 0)
              CFArrayAppendValue(Mutable, v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }

      if (!self->_serviceToActiveAccountsMap)
      {
        v18 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v19 = self->_serviceToActiveAccountsMap;
        self->_serviceToActiveAccountsMap = v18;

      }
      v8 = Mutable;
      if (v8)
        CFDictionarySetValue((CFMutableDictionaryRef)self->_serviceToActiveAccountsMap, (const void *)objc_msgSend(v5, "internalName"), v8);

    }
    v20 = v8;

  }
  else
  {
    -[IMAccountController activeAccounts](self, "activeAccounts");
    v20 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)sharedInstance
{
  if (qword_1ECF12518 != -1)
    dispatch_once(&qword_1ECF12518, &unk_1E471D5B8);
  return (id)qword_1ECF12578;
}

- (id)accountForUniqueID:(id)a3
{
  id v4;
  IMAccountController *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_accountMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bestAccountForService:(id)a3 login:(id)a4 guid:(id)a5
{
  return sub_1A2002E44(self, a3, a4, a5);
}

- (id)operationalAccountsForService:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  __CFArray *v8;
  __CFArray *Mutable;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  NSMutableDictionary *v18;
  NSMutableDictionary *serviceToOperationalAccountsMap;
  __CFArray *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (!self->_cachesEnabled
      || (v6 = self->_serviceToOperationalAccountsMap,
          objc_msgSend(v4, "internalName"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7),
          v8 = (__CFArray *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[IMAccountController activeAccountsForService:](self, "activeAccountsForService:", v5, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v23 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v15, "isOperational"))
              v16 = Mutable == 0;
            else
              v16 = 1;
            if (!v16 && v15 != 0)
              CFArrayAppendValue(Mutable, v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v12);
      }

      if (!self->_serviceToOperationalAccountsMap)
      {
        v18 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        serviceToOperationalAccountsMap = self->_serviceToOperationalAccountsMap;
        self->_serviceToOperationalAccountsMap = v18;

      }
      v8 = Mutable;
      if (v8)
        CFDictionarySetValue((CFMutableDictionaryRef)self->_serviceToOperationalAccountsMap, (const void *)objc_msgSend(v5, "internalName"), v8);

    }
    v20 = v8;

  }
  else
  {
    -[IMAccountController operationalAccounts](self, "operationalAccounts");
    v20 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)connectedAccountsForService:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  __CFArray *Mutable;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  _BOOL4 v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *serviceToConnectedAccountsMap;
  NSMutableDictionary *v19;
  __CFArray *v20;
  NSObject *v21;
  __CFArray *v22;
  __CFArray *v23;
  NSObject *v24;
  __CFArray *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  __CFArray *v32;
  __int16 v33;
  __CFArray *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_cachesEnabled
      && (v6 = self->_serviceToConnectedAccountsMap,
          objc_msgSend(v4, "internalName"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7),
          Mutable = (__CFArray *)objc_claimAutoreleasedReturnValue(),
          v7,
          Mutable))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v32 = Mutable;
          _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Caches were enabled, cached connected accounts are %@", buf, 0xCu);
        }

      }
    }
    else
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[IMAccountController accountsForService:](self, "accountsForService:", v5, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "isConnected");
            if (v14)
              v16 = Mutable != 0;
            else
              v16 = 0;
            if ((v15 & v16) == 1)
              CFArrayAppendValue(Mutable, v14);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v11);
      }

      if (!self->_serviceToConnectedAccountsMap)
      {
        v17 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        serviceToConnectedAccountsMap = self->_serviceToConnectedAccountsMap;
        self->_serviceToConnectedAccountsMap = v17;

      }
      if (Mutable)
      {
        v19 = self->_serviceToConnectedAccountsMap;
        v20 = Mutable;
        CFDictionarySetValue((CFMutableDictionaryRef)v19, (const void *)objc_msgSend(v5, "internalName"), v20);

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "internalName");
          v22 = (__CFArray *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v22;
          v33 = 2112;
          v34 = Mutable;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "For service %@, connected accounts are %@", buf, 0x16u);

        }
      }
    }
    v23 = Mutable;

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        -[IMAccountController connectedAccounts](self, "connectedAccounts");
        v25 = (__CFArray *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "Service is nil, connected accounts are %@", buf, 0xCu);

      }
    }
    -[IMAccountController connectedAccounts](self, "connectedAccounts");
    v23 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (NSArray)accounts
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (int64_t)activeAccountsAreEligibleForiMessageJunk
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int64_t v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[IMAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    v27 = -1;
    goto LABEL_31;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v4)
  {
    v27 = 0;
    goto LABEL_30;
  }
  v5 = v4;
  v6 = *(_QWORD *)v36;
  v7 = (_QWORD *)MEMORY[0x1E0D38F40];
  v29 = v2;
  v30 = v3;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v36 != v6)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v9, "serviceName", v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *v7);

      if ((v11 & 1) != 0)
        continue;
      v12 = (void *)MEMORY[0x1E0D39AF8];
      objc_msgSend(v9, "countryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "accountCountryIsCandidateForiMessageJunk:", v13) & 1) != 0)
      {
LABEL_26:

LABEL_27:
        v27 = 1;
LABEL_28:
        v2 = v29;
        goto LABEL_30;
      }
      v14 = v5;
      v15 = v7;
      v16 = (void *)MEMORY[0x1E0D39AF8];
      objc_msgSend(v9, "loginIMHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "countryCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v16, "accountCountryIsCandidateForiMessageJunk:", v18);

      if ((v16 & 1) != 0)
      {
        v27 = 1;
        v3 = v30;
        goto LABEL_28;
      }
      objc_msgSend(v9, "aliases");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v7 = v15;
      if (v20)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v9, "aliases");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v5 = v14;
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v13);
              if ((objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForiMessageJunk:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j)) & 1) != 0)
              {
                v3 = v30;
                goto LABEL_26;
              }
            }
            v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v22)
              continue;
            break;
          }
        }

        v3 = v30;
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0D39AF8];
        objc_msgSend(v9, "login");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v25) = objc_msgSend(v25, "receiverIsCandidateForiMessageJunk:", v26);

        v3 = v30;
        v5 = v14;
        if ((v25 & 1) != 0)
          goto LABEL_27;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v27 = 0;
    v2 = v29;
    if (v5)
      continue;
    break;
  }
LABEL_30:

LABEL_31:
  return v27;
}

- (void)setNetworkDataAvailable:(BOOL)a3
{
  id v3;

  if (self->_networkDataAvailable != a3)
  {
    self->_networkDataAvailable = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "__mainThreadPostNotificationName:object:", CFSTR("__kIMChatConnectivityChangedNotification"), 0);

  }
}

- (void)setAccounts:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)readOnly
{
  return self->_isReadOnly;
}

- (NSArray)operationalAccounts
{
  NSArray *operationalAccountsCache;
  NSArray **p_operationalAccountsCache;
  __CFArray *Mutable;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_operationalAccountsCache = &self->_operationalAccountsCache;
  operationalAccountsCache = self->_operationalAccountsCache;
  if (operationalAccountsCache)
    return operationalAccountsCache;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMAccountController activeAccounts](self, "activeAccounts", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "isOperational"))
          v13 = Mutable == 0;
        else
          v13 = 1;
        if (!v13 && v12 != 0)
          CFArrayAppendValue(Mutable, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_storeStrong((id *)p_operationalAccountsCache, Mutable);
  return (NSArray *)Mutable;
}

- (BOOL)isAccountKeyCDPSyncingOrWaitingForUser:(id)a3
{
  return (objc_msgSend(a3, "registrationFailureReason") & 0xFFFFFFFELL) == 28;
}

- (IMAccountController)init
{
  IMAccountController *v2;
  IMAccountController *v3;
  IMAccountController *v4;
  NSArray *accounts;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *accountMap;
  void *v8;
  void *v9;
  IMAccountController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMAccountController;
  v2 = -[IMAccountController init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    objc_sync_enter(v4);
    accounts = v4->_accounts;
    v4->_accounts = (NSArray *)MEMORY[0x1E0C9AA60];

    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    accountMap = v4->_accountMap;
    v4->_accountMap = (NSMutableDictionary *)Mutable;

    objc_sync_exit(v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel__activeAccountChanged_, CFSTR("NotificationActiveAccountChanged"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel__accountRegistrationStatusChanged_, CFSTR("__kIMAccountRegistrationStatusChangedNotification"), 0);

    v4->_networkDataAvailable = 1;
    -[IMAccountController performSelector:withObject:afterDelay:](v4, "performSelector:withObject:afterDelay:", sel_deferredSetup, 0, 0.0);
    v10 = v4;
  }

  return v3;
}

- (void)deferredSetup
{
  if (-[IMAccountController _shouldPerformDeferredSetup](self, "_shouldPerformDeferredSetup"))
    MEMORY[0x1E0DE7D20](self, sel__requestNetworkDataAvailability);
}

- (BOOL)deactivateAccounts:(id)a3 withDisable:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const CFArrayCallBacks *v7;
  __CFArray *Mutable;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  void *v21;
  __CFArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  __CFArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  char v34;
  _BOOL4 v36;
  __CFArray *theArray;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  Mutable = CFArrayCreateMutable(0, 0, v7);
  v36 = v4;
  if (v4 && !-[IMAccountController readOnly](self, "readOnly") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v6;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Deactivating accounts: %@", buf, 0xCu);
    }

  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (-[IMAccountController accountLogoutable:](self, "accountLogoutable:", v14))
        {
          objc_msgSend(v14, "service");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "shouldDisableDeactivation");

          if ((v16 & 1) == 0)
          {
            if (Mutable && v14)
              CFArrayAppendValue(Mutable, v14);
            objc_msgSend(v14, "uniqueID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17 == 0;

            if (!v18 && theArray != 0)
            {
              objc_msgSend(v14, "uniqueID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v19 == 0;

              if (!v20)
              {
                objc_msgSend(v14, "uniqueID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                CFArrayAppendValue(theArray, v21);

              }
            }
          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v11);
  }

  if (-[__CFArray count](Mutable, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = Mutable;
    v23 = -[__CFArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v43 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if (objc_msgSend(v26, "isConnected"))
            objc_msgSend(v26, "logoutAccount");
        }
        v23 = -[__CFArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v23);
    }

    if (v36 && !-[IMAccountController readOnly](self, "readOnly"))
    {
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deactivateAccounts:", theArray);

    }
    -[NSMutableDictionary removeAllObjects](self->_serviceToActiveAccountsMap, "removeAllObjects");
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v22;
    v29 = -[__CFArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v39;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(v28);
          v32 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
          objc_msgSend(v32, "service");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "shouldDisableDeactivation");

          if ((v34 & 1) == 0)
          {
            objc_msgSend(v32, "setIsActive:", 0);
            objc_msgSend(v32, "accountDidDeactivate");
          }
        }
        v29 = -[__CFArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v29);
    }

    -[IMAccountController _rebuildOperationalAccountsCache:](self, "_rebuildOperationalAccountsCache:", 1);
  }

  return 1;
}

- (BOOL)deactivateAccount:(id)a3 withDisable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldDisableDeactivation");

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else if (v6)
  {
    IMSingleObjectArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[IMAccountController deactivateAccounts:withDisable:](self, "deactivateAccounts:withDisable:", v10, v4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)canActivateAccounts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          if (!-[IMAccountController canActivateAccount:](self, "canActivateAccount:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canActivateAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IMParentalControls standardControls](IMParentalControls, "standardControls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "okToConnectAccount:", v4);

  if ((v6 & 1) != 0)
  {
    if (-[IMAccountController accountActive:](self, "accountActive:", v4))
      goto LABEL_14;
    objc_msgSend(v4, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowsMultipleConnections");

    if ((v8 & 1) != 0
      || (objc_msgSend(v4, "service"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          -[IMAccountController connectedAccountsForService:](self, "connectedAccountsForService:", v9),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v9,
          !v11))
    {
LABEL_14:
      v13 = 1;
      goto LABEL_15;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Not activating account since we already have active accounts of this type for account: %@", (uint8_t *)&v15, 0xCu);
      }
LABEL_12:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Parental controls disabled account: %@   not allowed to activate", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_12;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)bestAccountForStatus
{
  void *v2;
  void *v3;

  -[IMAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bestAccountForService:(id)a3
{
  return sub_1A2002E44(self, a3, 0, 0);
}

- (BOOL)addAccount:(id)a3 locally:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  IMAccountController *v13;
  char v14;
  NSObject *v15;
  IMAccountController *v16;
  void *v17;
  id v18;
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
  char v29;
  int v31;
  id v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPersistent");

  if (v8
    && (objc_msgSend(v6, "service"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[IMAccountController accountsForService:](self, "accountsForService:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        v11))
  {
    v12 = 0;
  }
  else
  {
    v13 = self;
    objc_sync_enter(v13);
    v14 = -[NSArray containsObjectIdenticalTo:](v13->_accounts, "containsObjectIdenticalTo:", v6);
    objc_sync_exit(v13);

    if ((v14 & 1) == 0)
    {
      if (!v4 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v31 = 138412290;
          v32 = v6;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Adding account: %@", (uint8_t *)&v31, 0xCu);
        }

      }
      v16 = v13;
      objc_sync_enter(v16);
      -[NSArray arrayByAddingObject:](v13->_accounts, "arrayByAddingObject:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMAccountController setAccounts:](v16, "setAccounts:", v17);

      v18 = v6;
      v19 = v18;
      if (v18)
        CFDictionarySetValue((CFMutableDictionaryRef)v16->_accountMap, (const void *)objc_msgSend(v18, "uniqueID"), v18);

      -[NSMutableDictionary removeAllObjects](v16->_serviceToAccountsMap, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](v16->_serviceToActiveAccountsMap, "removeAllObjects");
      objc_sync_exit(v16);

      if (!-[IMAccountController readOnly](v16, "readOnly") && !v4)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uniqueID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "service");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "internalName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAccount:defaults:service:", v21, v22, v24);

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "__mainThreadPostNotificationName:object:", CFSTR("__k_IMAccountControllerUpdatedNotification"), v19);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerUpdatedNotification"), v19);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerAccountAddedNotification"), v19);

      -[IMAccountController _rebuildOperationalAccountsCache:](v16, "_rebuildOperationalAccountsCache:", 1);
      +[IMParentalControls standardControls](IMParentalControls, "standardControls");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "okToConnectAccount:", v19);

      if ((v29 & 1) == 0)
        -[IMAccountController deactivateAccount:withDisable:](v16, "deactivateAccount:withDisable:", v19, 1);
    }
    v12 = 1;
  }

  return v12;
}

- (IMAccount)activeIMessageAccount
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[IMService iMessageService](IMService, "iMessageService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccountController accountsForService:](self, "accountsForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "_isUsableForSending", (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (IMAccount *)v6;
}

- (NSArray)activeAccounts
{
  __CFArray *Mutable;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const void *v9;
  BOOL v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_accounts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(const void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[IMAccountController accountActive:](self, "accountActive:", v9, (_QWORD)v13))
          v10 = Mutable == 0;
        else
          v10 = 1;
        if (!v10 && v9 != 0)
          CFArrayAppendValue(Mutable, v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)Mutable;
}

- (BOOL)activateAccounts:(id)a3 force:(BOOL)a4 locally:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFArray *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  NSObject *v44;
  _BOOL4 v46;
  BOOL v47;
  id v48;
  __CFArray *obj;
  __CFArray *Mutable;
  __CFArray *theArray;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  uint64_t v74;

  v5 = a5;
  v74 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v47 = -[IMAccountController canActivateAccounts:](self, "canActivateAccounts:");
  if (v47)
  {
    v46 = v5;
    if (!v5 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v48;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Activating accounts: %@", buf, 0xCu);
      }

    }
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v8 = v48;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v65 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (!-[IMAccountController accountActive:](self, "accountActive:", v12))
          {
            if (theArray && v12)
              CFArrayAppendValue(theArray, v12);
            objc_msgSend(v12, "uniqueID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14 && Mutable != 0)
            {
              objc_msgSend(v12, "uniqueID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15 == 0;

              if (!v16)
              {
                objc_msgSend(v12, "uniqueID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                CFArrayAppendValue(Mutable, v17);

              }
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      }
      while (v9);
    }

    if (-[__CFArray count](theArray, "count"))
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = theArray;
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v61 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
            objc_msgSend(v22, "service");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "allowsMultipleConnections");

            if ((v24 & 1) == 0)
            {
              objc_msgSend(v22, "service");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                objc_msgSend(v22, "service");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v18, "containsObject:", v26);

                if ((v27 & 1) == 0)
                {
                  objc_msgSend(v22, "service");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "addObject:", v28);

                }
              }
            }
          }
          v19 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
        }
        while (v19);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v29 = v18;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v57;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v57 != v31)
              objc_enumerationMutation(v29);
            -[IMAccountController activeAccountsForService:](self, "activeAccountsForService:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "__imSetFromArray");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v34, "mutableCopy");

            objc_msgSend(v8, "__imSetFromArray");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v36, "count"))
              objc_msgSend(v35, "minusSet:", v36);
            if (objc_msgSend(v35, "count"))
            {
              objc_msgSend(v35, "allObjects");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMAccountController deactivateAccounts:withDisable:](self, "deactivateAccounts:withDisable:", v37, 1);

            }
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
        }
        while (v30);
      }

      if (!-[IMAccountController readOnly](self, "readOnly") && !v46)
      {
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "activateAccounts:", Mutable);

      }
      -[NSMutableDictionary removeAllObjects](self->_serviceToActiveAccountsMap, "removeAllObjects");
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v39 = obj;
      v40 = -[__CFArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v53;
        do
        {
          for (m = 0; m != v40; ++m)
          {
            if (*(_QWORD *)v53 != v41)
              objc_enumerationMutation(v39);
            v43 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * m);
            objc_msgSend(v43, "setIsActive:", 1);
            objc_msgSend(v43, "accountDidBecomeActive");
          }
          v40 = -[__CFArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
        }
        while (v40);
      }

      -[IMAccountController _rebuildOperationalAccountsCache:](self, "_rebuildOperationalAccountsCache:", 1);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v48;
      _os_log_impl(&dword_1A1FF4000, v44, OS_LOG_TYPE_INFO, "Accounts could not be activated: %@", buf, 0xCu);
    }

  }
  return v47;
}

- (BOOL)activateAccount:(id)a3 locally:(BOOL)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_activateAccount_force_locally_);
}

- (BOOL)activateAccount:(id)a3 force:(BOOL)a4 locally:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;

  if (!a3)
    return 0;
  v5 = a5;
  v6 = a4;
  IMSingleObjectArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[IMAccountController activateAccounts:force:locally:](self, "activateAccounts:force:locally:", v8, v6, v5);

  return v5;
}

- (BOOL)accountLogoutable:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[IMAccountController accountActive:](self, "accountActive:", v4);
  v6 = -[IMAccountController isAccountKeyCDPSyncingOrWaitingForUser:](self, "isAccountKeyCDPSyncingOrWaitingForUser:", v4);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v5 || v6)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      if (v5)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      if (v6)
        v8 = CFSTR("YES");
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "account is logoutable: %@, account is active: %@, account is CDPSyncing Or WaitingForUser: %@", (uint8_t *)&v12, 0x20u);
    }

  }
  return v5 || v6;
}

- (BOOL)accountActive:(id)a3
{
  return objc_msgSend(a3, "isActive");
}

- (void)_requestNetworkDataAvailability
{
  id v2;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestNetworkDataAvailability");

}

- (void)_rebuildOperationalAccountsCache:(BOOL)a3
{
  NSArray **p_operationalAccountsCache;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_operationalAccountsCache = &self->_operationalAccountsCache;
  -[NSArray __imSetFromArray](self->_operationalAccountsCache, "__imSetFromArray", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *p_operationalAccountsCache;
  *p_operationalAccountsCache = 0;

  -[IMAccountController operationalAccounts](self, "operationalAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__imSetFromArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Rebuilding operational accounts, old: (%@)  new: (%@)", (uint8_t *)&v13, 0x16u);
    }

  }
  v10 = objc_msgSend(v8, "count");
  if (v10 != objc_msgSend(v5, "count") || (objc_msgSend(v8, "isEqualToSet:", v5) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, " ** Posting operational accounts changed", (uint8_t *)&v13, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerOperationalAccountsChangedNotification"), 0);

  }
}

+ (id)bestAccountFromAccounts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  NSComparisonResult v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!v6)
        {
          v6 = v9;
          continue;
        }
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "accountActive:", v6))
        {

        }
        else
        {
          +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "accountActive:", v9);

          if (v12)
            goto LABEL_17;
        }
        if ((objc_msgSend(v6, "isConnected") & 1) == 0 && objc_msgSend(v9, "isConnected"))
          goto LABEL_17;
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "accountActive:", v6);
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 != objc_msgSend(v15, "accountActive:", v9)
          || (v16 = objc_msgSend(v6, "isConnected"), v16 != objc_msgSend(v9, "isConnected")))
        {

          continue;
        }
        v17 = IMComparePersonStatus(objc_msgSend(v6, "myStatus"), objc_msgSend(v9, "myStatus"));

        if (v17 == NSOrderedAscending)
        {
LABEL_17:
          v18 = v9;

          v6 = v18;
          continue;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v5)
        goto LABEL_22;
    }
  }
  v6 = 0;
LABEL_22:

  return v6;
}

- (IMAccount)activeSMSAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService smsService](IMServiceImpl, "smsService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccountsForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && ((objc_msgSend(v5, "allowsSMSRelay") & 1) != 0 || objc_msgSend(v5, "allowsMMSRelay")))
    v6 = v5;
  else
    v6 = 0;

  return (IMAccount *)v6;
}

- (void)autoLogin
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_accounts;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "autoLogin", (_QWORD)v8) && (objc_msgSend(v7, "isConnected") & 1) == 0)
          objc_msgSend(v7, "loginAccount");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)dealloc
{
  void *v3;
  IMAccountController *v4;
  NSArray *accounts;
  NSMutableDictionary *accountMap;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4 = self;
  objc_sync_enter(v4);
  accounts = v4->_accounts;
  v4->_accounts = 0;

  accountMap = v4->_accountMap;
  v4->_accountMap = 0;

  objc_sync_exit(v4);
  v7.receiver = v4;
  v7.super_class = (Class)IMAccountController;
  -[IMAccountController dealloc](&v7, sel_dealloc);
}

- (void)accountLoginComplete:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerUpdatedNotification"), v3);

}

- (id)accountAtIndex:(int)a3
{
  return -[NSArray objectAtIndex:](self->_accounts, "objectAtIndex:", a3);
}

- (int)numberOfAccounts
{
  return -[NSArray count](self->_accounts, "count");
}

- (NSArray)connectedAccounts
{
  __CFArray *Mutable;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_accounts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isConnected", (_QWORD)v13))
          v10 = Mutable == 0;
        else
          v10 = 1;
        if (!v10 && v9 != 0)
          CFArrayAppendValue(Mutable, v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)Mutable;
}

- (id)accountsWithServiceCapability:(id)a3
{
  id v4;
  NSArray *accounts;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  accounts = self->_accounts;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A206695C;
  v9[3] = &unk_1E471F718;
  v10 = v4;
  v6 = v4;
  -[NSArray __imArrayByFilteringWithBlock:](accounts, "__imArrayByFilteringWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activeAccountsWithServiceCapability:(id)a3
{
  id v4;
  NSArray *accounts;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  accounts = self->_accounts;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A2066A24;
  v9[3] = &unk_1E471F740;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[NSArray __imArrayByFilteringWithBlock:](accounts, "__imArrayByFilteringWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)connectedAccountsWithServiceCapability:(id)a3
{
  void *v3;
  void *v4;

  -[IMAccountController accountsWithServiceCapability:](self, "accountsWithServiceCapability:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &unk_1E471DD98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accountsWithCapability:(unint64_t)a3
{
  __CFArray *Mutable;
  IMAccountController *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  BOOL v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v6 = self;
  objc_sync_enter(v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6->_accounts;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "hasCapability:", a3, (_QWORD)v16);
        if (Mutable)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (v13)
          v14 = 0;
        else
          v14 = v12;
        if (v14 == 1)
          CFArrayAppendValue(Mutable, v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  return Mutable;
}

- (id)operationalAccountsWithCapability:(unint64_t)a3
{
  __CFArray *Mutable;
  IMAccountController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  BOOL v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v6 = self;
  objc_sync_enter(v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMAccountController accountsWithCapability:](v6, "accountsWithCapability:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isOperational"))
        {
          v12 = objc_msgSend(v11, "isActive");
          if (Mutable)
            v13 = v11 == 0;
          else
            v13 = 1;
          if (v13)
            v14 = 0;
          else
            v14 = v12;
          if (v14 == 1)
            CFArrayAppendValue(Mutable, v11);
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
  return Mutable;
}

- (id)connectedAccountsWithCapability:(unint64_t)a3
{
  __CFArray *Mutable;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMAccountController accountsWithCapability:](self, "accountsWithCapability:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isConnected"))
          v12 = Mutable == 0;
        else
          v12 = 1;
        if (!v12 && v11 != 0)
          CFArrayAppendValue(Mutable, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return Mutable;
}

- (BOOL)canDeleteAccount:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isPersistent") & 1) != 0 || (objc_msgSend(v3, "isManaged") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v3, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "shouldDisableDeactivation") ^ 1;

  }
  return v5;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (void)_activeAccountChanged:(id)a3
{
  -[IMAccountController _rebuildOperationalAccountsCache:](self, "_rebuildOperationalAccountsCache:", 1);
}

- (void)_accountRegistrationStatusChanged:(id)a3
{
  -[IMAccountController _rebuildOperationalAccountsCache:](self, "_rebuildOperationalAccountsCache:", 1);
}

- (BOOL)addAccount:(id)a3
{
  return -[IMAccountController addAccount:locally:](self, "addAccount:locally:", a3, 0);
}

- (BOOL)addAccount:(id)a3 atIndex:(int)a4
{
  return -[IMAccountController addAccount:locally:](self, "addAccount:locally:", a3, 0);
}

- (BOOL)addAccount:(id)a3 atIndex:(int)a4 locally:(BOOL)a5
{
  return -[IMAccountController addAccount:locally:](self, "addAccount:locally:", a3, a5);
}

- (BOOL)deleteAccount:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Client request to delete account: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = -[IMAccountController deleteAccount:locally:](self, "deleteAccount:locally:", v4, 0);

  return v6;
}

- (BOOL)deleteAccount:(id)a3 locally:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  IMAccountController *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *accountMap;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  int v24;
  id v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldDisableDeactivation");

  if (v8)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_26:
      v22 = 0;
      goto LABEL_27;
    }
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Someone tried to delete an account that can't be deactivated, you can't do this (%@)", (uint8_t *)&v24, 0xCu);
    }
LABEL_5:

    goto LABEL_26;
  }
  if (!v4)
  {
    if (objc_msgSend(v6, "supportsRegistration") && objc_msgSend(v6, "accountType") == 2)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_26;
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Someone tried to delete a phone account, you can't do this", (uint8_t *)&v24, 2u);
      }
      goto LABEL_5;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v24 = 138412546;
        v25 = v6;
        v26 = 2112;
        v27 = CFSTR("NO");
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "Deleting account: %@  (Locally: %@)", (uint8_t *)&v24, 0x16u);
      }

    }
  }
  if (objc_msgSend(v6, "isConnected"))
    objc_msgSend(v6, "logoutAccount");
  if (-[IMAccountController accountActive:](self, "accountActive:", v6)
    && !-[IMAccountController deactivateAccount:](self, "deactivateAccount:", v6))
  {
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerAccountWillBeRemovedNotification"), v6);

  objc_msgSend(v6, "accountWillBeRemoved");
  v12 = self;
  objc_sync_enter(v12);
  v13 = (void *)-[NSArray mutableCopy](v12->_accounts, "mutableCopy");
  objc_msgSend(v13, "removeObject:", v6);
  -[IMAccountController setAccounts:](v12, "setAccounts:", v13);
  objc_msgSend(v6, "uniqueID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    accountMap = v12->_accountMap;
    objc_msgSend(v6, "uniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](accountMap, "removeObjectForKey:", v16);

  }
  -[NSMutableDictionary removeAllObjects](v12->_serviceToAccountsMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v12->_serviceToActiveAccountsMap, "removeAllObjects");

  objc_sync_exit(v12);
  if (!-[IMAccountController readOnly](v12, "readOnly") && !v4)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAccount:", v18);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "__mainThreadPostNotificationName:object:", CFSTR("__k_IMAccountControllerUpdatedNotification"), v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerUpdatedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "__mainThreadPostNotificationName:object:", CFSTR("__kIMAccountControllerAccountRemovedNotification"), v6);

  v22 = 1;
  -[IMAccountController _rebuildOperationalAccountsCache:](v12, "_rebuildOperationalAccountsCache:", 1);
LABEL_27:

  return v22;
}

- (BOOL)_deactivateAccount:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDisableDeactivation");

  v7 = (v6 & 1) == 0
    && -[IMAccountController deactivateAccount:withDisable:](self, "deactivateAccount:withDisable:", v4, 1);

  return v7;
}

- (BOOL)deactivateAccount:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Client request to deactivate account: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = -[IMAccountController _deactivateAccount:](self, "_deactivateAccount:", v4);

  return v6;
}

- (BOOL)_deactivateAccounts:(id)a3
{
  return -[IMAccountController deactivateAccounts:withDisable:](self, "deactivateAccounts:withDisable:", a3, 1);
}

- (BOOL)deactivateAccounts:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Client request to deactivate accounts: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = -[IMAccountController _deactivateAccounts:](self, "_deactivateAccounts:", v4);

  return v6;
}

- (BOOL)activateAccounts:(id)a3
{
  return -[IMAccountController activateAccounts:force:locally:](self, "activateAccounts:force:locally:", a3, 0, 0);
}

- (BOOL)activateAccount:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_activateAccount_force_locally_);
}

- (BOOL)activateAccount:(id)a3 force:(BOOL)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_activateAccount_force_locally_);
}

- (BOOL)activateAndHandleReconnectAccounts:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 IsOnline;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMAccountController activeAccounts](self, "activeAccounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = -[IMAccountController activateAccounts:force:locally:](self, "activateAccounts:force:locally:", v4, 1, 0);
  if (v7)
  {
    if (!v6
      || (+[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "listener"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          IsOnline = IMPersonStatusIsOnline(objc_msgSend(v9, "myStatus")),
          v9,
          v8,
          IsOnline))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = v4;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "loginAccount", (_QWORD)v17);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
  }

  return v7;
}

- (BOOL)activateAndHandleReconnectAccount:(id)a3
{
  void *v4;

  if (!a3)
    return 0;
  IMSingleObjectArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMAccountController activateAndHandleReconnectAccounts:](self, "activateAndHandleReconnectAccounts:", v4);

  return (char)self;
}

- (BOOL)accountConnecting:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[IMAccountController accountActive:](self, "accountActive:", v4)
    && objc_msgSend(v4, "isConnecting"))
  {
    v5 = objc_msgSend(v4, "isConnected") ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)accountConnected:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[IMAccountController accountActive:](self, "accountActive:", v4))
    v5 = objc_msgSend(v4, "isConnected");
  else
    v5 = 0;

  return v5;
}

- (id)bestAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A2002E44(self, a3, a4, 0);
}

- (id)bestOperationalAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A2007D7C(self, a3, a4, 0);
}

- (id)iMessageAccountForLastAddressedHandle:(id)a3 simID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  id v40;
  id obj;
  id v42;
  __int128 v43;
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
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = a4;
  if (objc_msgSend(v40, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ctSubscriptionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__im_subscriptionContextForForSimID:", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "length"))
    {
      objc_msgSend(v38, "phoneNumber");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v9;
    }
  }
  else
  {
    v38 = 0;
  }
  if (objc_msgSend(v6, "length", v38))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMAccountController operationalAccountsForService:](self, "operationalAccountsForService:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v56 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (objc_msgSend(v16, "_isUsableForSending"))
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v13);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v10;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    if (v17)
    {
      v42 = 0;
      v18 = *(_QWORD *)v52;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v52 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          if (objc_msgSend(v20, "accountType") == 2)
          {
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(v20, "aliases");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v48;
              while (2)
              {
                for (k = 0; k != v22; ++k)
                {
                  if (*(_QWORD *)v48 != v23)
                    objc_enumerationMutation(v21);
                  if (objc_msgSend(MEMORY[0x1E0D34CC8], "isPhoneNumber:equivalentToExistingPhoneNumber:", v6, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k)))
                  {
                    if (IMOSLoggingEnabled())
                    {
                      OSLogHandleForIMFoundationCategory();
                      v25 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412546;
                        v60 = v6;
                        v61 = 2112;
                        v62 = v20;
                        _os_log_impl(&dword_1A1FF4000, v25, OS_LOG_TYPE_INFO, "Alias %@  matched phone based iMessage account: %@, selecting it", buf, 0x16u);
                      }

                    }
                    v26 = v20;

                    v42 = v26;
                    goto LABEL_35;
                  }
                }
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
                if (v22)
                  continue;
                break;
              }
            }
LABEL_35:

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      }
      while (v17);

      if (v42)
        goto LABEL_61;
    }
    else
    {

    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v28 = obj;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
    if (!v29)
    {
LABEL_55:

LABEL_65:
      v42 = 0;
      goto LABEL_66;
    }
    v30 = *(_QWORD *)v44;
LABEL_48:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v30)
        objc_enumerationMutation(v28);
      v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v31);
      if (objc_msgSend(v32, "accountType") != 2)
      {
        objc_msgSend(v32, "aliases");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "containsObject:", v6);

        if (v34)
          break;
      }
      if (v29 == ++v31)
      {
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
        if (v29)
          goto LABEL_48;
        goto LABEL_55;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v60 = v6;
        v61 = 2112;
        v62 = v32;
        _os_log_impl(&dword_1A1FF4000, v35, OS_LOG_TYPE_INFO, "Alias %@  matched account: %@, selecting it", buf, 0x16u);
      }

    }
    v42 = v32;

    if (!v42)
      goto LABEL_65;
LABEL_61:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v60 = v42;
        v61 = 2112;
        v62 = v6;
        v63 = 2112;
        v64 = v40;
        _os_log_impl(&dword_1A1FF4000, v36, OS_LOG_TYPE_INFO, "Returning iMessage account %@ for lastAddressedHandle %@ and context %@", buf, 0x20u);
      }

    }
LABEL_66:

    goto LABEL_67;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v40;
      v61 = 2112;
      v62 = v39;
      _os_log_impl(&dword_1A1FF4000, v27, OS_LOG_TYPE_INFO, "Returning nil account because senderLastAddressedHandle is nil for simID %@ and context %@", buf, 0x16u);
    }

  }
  v42 = 0;
LABEL_67:

  return v42;
}

- (id)bestActiveAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A2008730(self, a3, a4, 0);
}

- (id)bestConnectedAccountForService:(id)a3 withLogin:(id)a4
{
  return sub_1A2008180(self, a3, a4, 0);
}

- (id)bestOperationalAccountForService:(id)a3
{
  return sub_1A2007D7C(self, a3, 0, 0);
}

- (id)bestActiveAccountForService:(id)a3
{
  return sub_1A2008730(self, a3, 0, 0);
}

- (id)bestConnectedAccountForService:(id)a3
{
  return sub_1A2008180(self, a3, 0, 0);
}

- (id)bestAccountWithCapability:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[IMAccountController operationalAccountsWithCapability:](self, "operationalAccountsWithCapability:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    return v6;
  }
  -[IMAccountController connectedAccountsWithCapability:](self, "connectedAccountsWithCapability:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_8;
  }
  -[IMAccountController accountsWithCapability:](self, "accountsWithCapability:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[IMServiceImpl servicesWithCapability:](IMServiceImpl, "servicesWithCapability:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  v12 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v5);
      v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
      -[IMAccountController operationalAccountsForService:](self, "operationalAccountsForService:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v15);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

        goto LABEL_8;
      }
      -[IMAccountController connectedAccountsForService:](self, "connectedAccountsForService:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

        goto LABEL_25;
      }
      -[IMAccountController accountsForService:](self, "accountsForService:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v17);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }

    }
    v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
      continue;
    break;
  }
LABEL_20:

  -[IMAccountController bestActiveAccountForService:](self, "bestActiveAccountForService:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mostLoggedInAccount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMAccountController accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "loginStatus");
        if (v10 > v6)
        {
          v11 = v10;
          v12 = v9;

          v5 = v12;
          v6 = v11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)aimAccount
{
  void *v3;
  void *v4;

  +[IMService aimService](IMServiceImpl, "aimService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccountController bestAccountForService:](self, "bestAccountForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)jabberAccount
{
  void *v3;
  void *v4;

  +[IMService jabberService](IMServiceImpl, "jabberService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccountController bestAccountForService:](self, "bestAccountForService:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_enableCache
{
  self->_cachesEnabled = 1;
}

- (void)_disableCache
{
  NSMutableDictionary *serviceToConnectedAccountsMap;
  NSMutableDictionary *serviceToOperationalAccountsMap;

  self->_cachesEnabled = 0;
  serviceToConnectedAccountsMap = self->_serviceToConnectedAccountsMap;
  self->_serviceToConnectedAccountsMap = 0;

  serviceToOperationalAccountsMap = self->_serviceToOperationalAccountsMap;
  self->_serviceToOperationalAccountsMap = 0;

}

- (BOOL)hasRelayApprovedAccount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
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
  -[IMAccountController accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isSMSRelayCapable") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)senderIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[IMAccountController accounts](self, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v9, "vettedAliases", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              if (objc_msgSend(v15, "length"))
                objc_msgSend(v3, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v12);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)networkDataAvailable
{
  return self->_networkDataAvailable;
}

- (NSMutableDictionary)accountMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountMap, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_serviceToOperationalAccountsMap, 0);
  objc_storeStrong((id *)&self->_serviceToConnectedAccountsMap, 0);
  objc_storeStrong((id *)&self->_serviceToAccountsMap, 0);
  objc_storeStrong((id *)&self->_serviceToActiveAccountsMap, 0);
  objc_storeStrong((id *)&self->_operationalAccountsCache, 0);
}

- (id)_bestOperationalAccountForSendingForService:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v45;
  void *v46;
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
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v45 = v4;
  -[IMAccountController operationalAccountsForService:](self, "operationalAccountsForService:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if (objc_msgSend(v11, "_isUsableForSending"))
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v8);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
        objc_msgSend(v16, "aliases");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count") == 0;

        if (!v18)
        {
          objc_msgSend(v16, "aliases");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v19);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v13);
  }

  objc_msgSend(v5, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)_IDSCopyOrderedAliasStrings();

  if (!objc_msgSend(v46, "count"))
    goto LABEL_54;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v52;
LABEL_22:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v23)
        objc_enumerationMutation(v21);
      v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
      if (objc_msgSend(v25, "accountType") == 2)
      {
        objc_msgSend(v25, "aliases");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "containsObject:", v27);

        if (v28)
          break;
      }
      if (v22 == ++v24)
      {
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
        if (v22)
          goto LABEL_22;
        goto LABEL_29;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v46, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v65 = v30;
        v66 = 2112;
        v67 = v25;
        _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_INFO, "Alias %@  matched phone based account: %@, selecting it", buf, 0x16u);

      }
    }
    v31 = v25;

    if (v31)
      goto LABEL_50;
  }
  else
  {
LABEL_29:

  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v32 = v21;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
  if (!v33)
  {
LABEL_44:

LABEL_54:
    objc_msgSend(v12, "anyObject");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_55;
  }
  v34 = *(_QWORD *)v48;
LABEL_37:
  v35 = 0;
  while (1)
  {
    if (*(_QWORD *)v48 != v34)
      objc_enumerationMutation(v32);
    v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v35);
    if (objc_msgSend(v36, "accountType") != 2)
    {
      objc_msgSend(v36, "aliases");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "containsObject:", v38);

      if (v39)
        break;
    }
    if (v33 == ++v35)
    {
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      if (v33)
        goto LABEL_37;
      goto LABEL_44;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v46, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v41;
      v66 = 2112;
      v67 = v36;
      _os_log_impl(&dword_1A1FF4000, v40, OS_LOG_TYPE_INFO, "Alias %@  matched account: %@, selecting it", buf, 0x16u);

    }
  }
  v31 = v36;

  if (!v31)
    goto LABEL_54;
LABEL_50:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v31;
      _os_log_impl(&dword_1A1FF4000, v42, OS_LOG_TYPE_INFO, "Returning selected best account: %@", buf, 0xCu);
    }

  }
LABEL_55:
  v43 = v31;

  return v43;
}

- (id)__iCloudSystemAccountForService:(id)a3
{
  return 0;
}

- (id)_bestAccountForAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService(v4, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "_isUsableForSending") & 1) == 0)
  {
    +[IMService smsService](IMServiceImpl, "smsService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[IMAccountController accountsForService:](self, "accountsForService:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "__imFirstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }

  }
  return v6;
}

- (BOOL)receiverIsMyMention:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    IMChatCanonicalIDSIDsForAddress();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A8582830]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      -[IMAccountController connectedAccountsWithServiceCapability:](self, "connectedAccountsWithServiceCapability:", *MEMORY[0x1E0D38E28]);
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "aliases", (_QWORD)v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "containsObject:", v6);

            if ((v12 & 1) != 0)
            {
              LOBYTE(v8) = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)metionedHandleMatchesMeCard:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[IMAccountController receiverIsMyMention:](self, "receiverIsMyMention:", v4))
  {
    v5 = 1;
  }
  else
  {
    if ((MEMORY[0x1A858280C](v4) & 1) != 0)
    {
      IMNormalizePhoneNumber();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v4;
    }
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMMentionContactKeysForMe();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchMeContactWithKeys:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    IMMentionMeTokensForContact();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "containsObject:", v7);

  }
  return v5;
}

- (int64_t)activeAccountsAreEligibleForUnknownSendersFiltering
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[IMAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v50;
      v7 = (_QWORD *)MEMORY[0x1E0D38F40];
      v39 = v2;
      v40 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v50 != v6)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v9, "serviceName", v39);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", *v7);

          if ((v11 & 1) == 0)
          {
            v12 = (void *)MEMORY[0x1E0D39AF8];
            objc_msgSend(v9, "countryCode");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "accountCountryIsCandidateForHawking:", v13) & 1) != 0)
            {
              v14 = 1;
            }
            else
            {
              v15 = (void *)MEMORY[0x1E0D39AF8];
              objc_msgSend(v9, "loginIMHandle");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "countryCode");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v15, "accountCountryIsCandidateForHawking:", v17);

            }
            v18 = (void *)MEMORY[0x1E0D39AF8];
            objc_msgSend(v9, "countryCode");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "receiverIsCandidateForDefaultAppleSMSFilter:", v19) & 1) != 0)
              goto LABEL_39;
            v20 = (void *)MEMORY[0x1E0D39AF8];
            objc_msgSend(v9, "loginIMHandle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "countryCode");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v20) = objc_msgSend(v20, "receiverIsCandidateForDefaultAppleSMSFilter:", v22);

            if (((v14 | v20) & 1) != 0)
              goto LABEL_43;
            objc_msgSend(v9, "aliases");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (v24)
            {
              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              objc_msgSend(v9, "aliases");
              v19 = (id)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v46;
LABEL_16:
                v28 = 0;
                while (1)
                {
                  if (*(_QWORD *)v46 != v27)
                    objc_enumerationMutation(v19);
                  v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v28);
                  if ((objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForHawking:", v29) & 1) != 0
                    || (objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForDefaultAppleSMSFilter:", v29) & 1) != 0)
                  {
                    break;
                  }
                  if (v26 == ++v28)
                  {
                    v26 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
                    if (v26)
                      goto LABEL_16;
                    goto LABEL_23;
                  }
                }
LABEL_39:
                v2 = v39;
                v36 = 1;
                goto LABEL_40;
              }
LABEL_23:

              v6 = v40;
              v7 = (_QWORD *)MEMORY[0x1E0D38F40];
            }
            else
            {
              v30 = (void *)MEMORY[0x1E0D39AF8];
              objc_msgSend(v9, "login");
              v19 = (id)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v30, "receiverIsCandidateForHawking:", v19) & 1) != 0)
                goto LABEL_39;
              v31 = (void *)MEMORY[0x1E0D39AF8];
              objc_msgSend(v9, "login");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v31) = objc_msgSend(v31, "receiverIsCandidateForDefaultAppleSMSFilter:", v32);

              v6 = v40;
              v7 = (_QWORD *)MEMORY[0x1E0D38F40];
              if ((v31 & 1) != 0)
              {
LABEL_43:
                v2 = v39;
                v36 = 1;
                goto LABEL_41;
              }
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        v2 = v39;
        if (v5)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x1E0D39730], "IMPhoneNumbersEnabledForMultipleSubscriptionDevice");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v42;
      v36 = 1;
LABEL_30:
      v37 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v19);
        if ((objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForDefaultAppleSMSFilter:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v37)) & 1) != 0)break;
        if (v34 == ++v37)
        {
          v34 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
          if (v34)
            goto LABEL_30;
          goto LABEL_36;
        }
      }
    }
    else
    {
LABEL_36:
      v36 = 0;
    }
    v3 = v19;
LABEL_40:

LABEL_41:
  }
  else
  {
    v36 = -1;
  }

  return v36;
}

- (int64_t)activeAccountsAreEligibleForInternationalFiltering
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  int64_t v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[IMAccountController activeAccounts](self, "activeAccounts");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v32;
    v6 = (_QWORD *)MEMORY[0x1E0D38F40];
    v24 = v2;
    v25 = *(_QWORD *)v32;
    while (2)
    {
      v7 = 0;
      v26 = v4;
      do
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        objc_msgSend(v8, "serviceName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *v6);

        if ((v10 & 1) == 0)
        {
          objc_msgSend(v8, "countryCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "loginIMHandle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "countryCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(MEMORY[0x1E0D39B70], "accountCountryIsCandidateForInternationalFiltering:", v11) & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0D39B70], "accountCountryIsCandidateForInternationalFiltering:", v13) & 1) != 0)
          {

LABEL_29:
            v22 = 1;
            goto LABEL_30;
          }
          objc_msgSend(v8, "regionID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(MEMORY[0x1E0D39B70], "accountRegionIsCandidateForInternationalFiltering:", v14) & 1) != 0)
          {
            v15 = 1;
          }
          else
          {
            objc_msgSend(v8, "aliases");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v28;
              while (2)
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v28 != v20)
                    objc_enumerationMutation(v17);
                  if ((objc_msgSend(MEMORY[0x1E0D39B70], "receiverIsCandidateForInternationalFiltering:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i)) & 1) != 0)
                  {
                    v15 = 1;
                    goto LABEL_21;
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (v19)
                  continue;
                break;
              }
              v15 = 0;
LABEL_21:
              v2 = v24;
            }
            else
            {
              v15 = 0;
            }

            v5 = v25;
          }

          v4 = v26;
          if (v15)
            goto LABEL_29;
        }
        ++v7;
      }
      while (v7 != v4);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v4)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_30:

  return v22;
}

- (int64_t)activeAccountsAreEligibleForHawking
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int64_t v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[IMAccountController activeAccounts](self, "activeAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    v27 = -1;
    goto LABEL_31;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v4)
  {
    v27 = 0;
    goto LABEL_30;
  }
  v5 = v4;
  v6 = *(_QWORD *)v36;
  v7 = (_QWORD *)MEMORY[0x1E0D38F40];
  v29 = v2;
  v30 = v3;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v36 != v6)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      objc_msgSend(v9, "serviceName", v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *v7);

      if ((v11 & 1) != 0)
        continue;
      v12 = (void *)MEMORY[0x1E0D39AF8];
      objc_msgSend(v9, "countryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "accountCountryIsCandidateForHawking:", v13) & 1) != 0)
      {
LABEL_26:

LABEL_27:
        v27 = 1;
LABEL_28:
        v2 = v29;
        goto LABEL_30;
      }
      v14 = v5;
      v15 = v7;
      v16 = (void *)MEMORY[0x1E0D39AF8];
      objc_msgSend(v9, "loginIMHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "countryCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v16, "accountCountryIsCandidateForHawking:", v18);

      if ((v16 & 1) != 0)
      {
        v27 = 1;
        v3 = v30;
        goto LABEL_28;
      }
      objc_msgSend(v9, "aliases");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      v7 = v15;
      if (v20)
      {
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        objc_msgSend(v9, "aliases");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v5 = v14;
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v13);
              if ((objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForHawking:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j)) & 1) != 0)
              {
                v3 = v30;
                goto LABEL_26;
              }
            }
            v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v22)
              continue;
            break;
          }
        }

        v3 = v30;
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0D39AF8];
        objc_msgSend(v9, "login");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v25) = objc_msgSend(v25, "receiverIsCandidateForHawking:", v26);

        v3 = v30;
        v5 = v14;
        if ((v25 & 1) != 0)
          goto LABEL_27;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v27 = 0;
    v2 = v29;
    if (v5)
      continue;
    break;
  }
LABEL_30:

LABEL_31:
  return v27;
}

- (int64_t)activeAccountsAreEligibleForAppleSMSFilter
{
  _BOOL4 v2;
  unint64_t v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = 1;
  if ((objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForSMSFilterWithSimSlot:", 1) & 1) != 0)
  {
LABEL_6:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Account is eligible for showing SMS Filter.", v7, 2u);
      }

    }
  }
  else
  {
    v3 = 0;
    while (v3 != 1)
    {
      v4 = objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForSMSFilterWithSimSlot:", v3 + 2);
      ++v3;
      if (v4)
      {
        v2 = v3 < 2;
        goto LABEL_6;
      }
    }
    return 0;
  }
  return v2;
}

- (int64_t)activeAccountsAreEligibleForDefaultAppleSMSFilter
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = 1;
  while (!objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForDefaultAppleSMSFilterWithSimSlot:", v2))
  {
    if (++v2 == 3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Account is not eligible for enabling SMS Filter by default.", v6, 2u);
        }

      }
      return 0;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Account is eligible for enabling SMS Filter by default.", buf, 2u);
    }

  }
  return 1;
}

- (int64_t)activeAccountsAreEligibleForAppleSMSFilterSubClassification
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = 1;
  while (!objc_msgSend(MEMORY[0x1E0D39AF8], "receiverIsCandidateForAppleSMSFilterSubClassificationWithSimSlot:", v2))
  {
    if (++v2 == 3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Account is not eligible for enabling SMS SubClassification.", v6, 2u);
        }

      }
      return 0;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Account is eligible for enabling SMS SubClassification.", buf, 2u);
    }

  }
  return 1;
}

@end
