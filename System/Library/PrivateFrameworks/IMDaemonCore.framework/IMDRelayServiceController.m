@implementation IMDRelayServiceController

- (void)_setupIDSRelayServices
{
  id v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D34358]);
  v4 = (const __CFString *)*MEMORY[0x1E0D34230];
  v5 = (void *)objc_msgSend(v3, "initWithService:", *MEMORY[0x1E0D34230]);
  -[IMDRelayServiceController setSmsRelayService:](self, "setSmsRelayService:", v5);

  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accounts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v4;
      v20 = 2048;
      v21 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Finished setting Up Relay Service (Service: %@), number of accounts: %lu", (uint8_t *)&v18, 0x16u);

    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.sms.watch"));
  -[IMDRelayServiceController setSmsWatchService:](self, "setSmsWatchService:", v10);

  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accounts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      v18 = 138412546;
      v19 = CFSTR("com.apple.private.alloy.sms.watch");
      v20 = 2048;
      v21 = v15;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Finished setting Up SMS Watch Relay Service (Service: %@), number of accounts: %lu", (uint8_t *)&v18, 0x16u);

    }
  }
  -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);

  -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);

  -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
}

- (id)_callerIDForRelayAccountID:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0D342A0]);
    v7 = (void *)objc_msgSend(v6, "initWithService:", *MEMORY[0x1E0D34240]);
    objc_msgSend(v7, "accountWithUniqueID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = (uint64_t)v10;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Found Caller ID %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[IMDRelayServiceController relayService](self, "relayService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v7);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v16, "accountType") == 1)
          {
            objc_msgSend(v16, "displayName");
            v17 = objc_claimAutoreleasedReturnValue();
            if (IMOSLoggingEnabled(v17))
            {
              OSLogHandleForIMFoundationCategory();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v17;
                _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found Caller ID %@", buf, 0xCu);
              }

            }
            v10 = (void *)v17;
          }
        }
        v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }
  }

  IMNormalizePhoneNumber();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)watchConnectedOverBT
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
      if (objc_msgSend(v9, "deviceType") == 6)
      {
        if (objc_msgSend(v9, "isLocallyPaired"))
        {
          v18 = v9;
          v10 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[IMDRelayServiceController _isConnectedOverBT:](self, "_isConnectedOverBT:", v11);

          if (v12)
            break;
        }
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  return v10;
}

- (NSString)dominentPhoneNumberAlias
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "accountType") == 1)
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v10, "im_registeredURIs");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v23 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                if (objc_msgSend(v16, "_appearsToBePhoneNumber")
                  && -[IMDRelayServiceController isAliasRelayCapable:](self, "isAliasRelayCapable:", v16))
                {
                  objc_msgSend(v3, "addObject:", v16);
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v13);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  if (v3)
  {
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  IMNormalizePhoneNumber();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v19;
}

- (void)_registerForAccountChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    v7 = MEMORY[0x1E0C80D38];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "accountType");
        if ((_DWORD)v10 == 1)
        {
          if (IMOSLoggingEnabled(v10))
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v12 = 0;
              _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Registering for Account alias changes", v12, 2u);
            }

          }
          objc_msgSend(v9, "addRegistrationDelegate:queue:", self, v7);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (BOOL)_hasPhoneNumberAliasActive
{
  return MEMORY[0x1E0DE7D20](self, sel_hasPhoneNumberAliasActiveCheckingSelf_);
}

- (BOOL)hasPhoneNumberAliasActiveCheckingSelf:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  BOOL v19;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v7)
  {
    v22 = *(_QWORD *)v28;
    *(_QWORD *)&v8 = 138412290;
    v21 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "accountType", v21);
        if ((_DWORD)v11 == 1)
        {
          if (IMOSLoggingEnabled(v11))
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "im_registeredURIs");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v21;
              v33 = v13;
              _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "aliases for AppleID account are %@", buf, 0xCu);

            }
          }
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v10, "im_registeredURIs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v24;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                if (objc_msgSend(v18, "_appearsToBePhoneNumber")
                  && -[IMDRelayServiceController isAliasRelayCapable:checkingSelf:](self, "isAliasRelayCapable:checkingSelf:", v18, v3))
                {

                  v19 = 1;
                  goto LABEL_26;
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              if (v15)
                continue;
              break;
            }
          }

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      v19 = 0;
    }
    while (v7);
  }
  else
  {
    v19 = 0;
  }
LABEL_26:

  return v19;
}

- (BOOL)isAliasActiveAndRelayCapable:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel_isAliasActiveAndRelayCapable_checkingSelf_);
}

- (BOOL)isAliasActiveAndRelayCapable:(id)a3 checkingSelf:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  BOOL v20;
  __int128 v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v8)
  {
    v23 = *(_QWORD *)v30;
    *(_QWORD *)&v9 = 138412290;
    v22 = v9;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "accountType", v22);
        if ((_DWORD)v12 == 1)
        {
          if (IMOSLoggingEnabled(v12))
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v11, "im_registeredURIs");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v22;
              v35 = v14;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "aliases for AppleID account are %@", buf, 0xCu);

            }
          }
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v11, "im_registeredURIs");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v26 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v19, "isEqualToString:", v6)
                  && -[IMDRelayServiceController isAliasRelayCapable:checkingSelf:](self, "isAliasRelayCapable:checkingSelf:", v19, v4))
                {

                  v20 = 1;
                  goto LABEL_26;
                }
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v16)
                continue;
              break;
            }
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      v20 = 0;
    }
    while (v8);
  }
  else
  {
    v20 = 0;
  }
LABEL_26:

  return v20;
}

- (BOOL)hasRelayDevice
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  v7 = 0;
  if (v6)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v10, "supportsSMSRelay") & 1) != 0 || objc_msgSend(v10, "supportsMMSRelay"))
        {
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isSMSFilterSyncEnabled");

          ++v7;
          if (v12)
          {
            objc_msgSend(v10, "uniqueIDOverride");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13);

          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSMSFilterSyncEnabled");

  if (v15)
  {
    v16 = objc_msgSend(MEMORY[0x1E0D399F8], "supportsIncomingSMSRelayFiltering");
    if ((_DWORD)v16)
    {
      objc_msgSend(MEMORY[0x1E0D399F0], "verifyCurrentRelayDevicesActive:", v3);
      +[IMDFilteringController sharedInstance](IMDFilteringController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "disableFilteringIfNeeded");

    }
  }
  if (IMOSLoggingEnabled(v16))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v7;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Found %d Relayable Devices", buf, 8u);
    }

  }
  return v7 > 0;
}

- (BOOL)hasPeerDevices
{
  void *v2;
  void *v3;
  BOOL v4;

  -[IMDRelayServiceController relayService](self, "relayService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)isAliasRelayCapable:(id)a3
{
  return -[IMDRelayServiceController isAliasRelayCapable:checkingSelf:](self, "isAliasRelayCapable:checkingSelf:", a3, 1);
}

- (BOOL)isAliasRelayCapable:(id)a3 checkingSelf:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  id obj;
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
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Checking if Alias %@ is active for SMS Relay ", buf, 0xCu);
    }

  }
  if (objc_msgSend(v6, "length"))
  {
    if (v4
      && (objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = MEMORY[0x1D17EA560](v6, v8),
          v8,
          (v9 & 1) != 0))
    {
      v10 = 1;
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[IMDRelayServiceController relayService](self, "relayService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "devices");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v28)
      {
        v27 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v35 != v27)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v14 = objc_msgSend(v13, "supportsSMSRelay");
            if ((v14 & 1) == 0)
            {
              v14 = objc_msgSend(v13, "supportsMMSRelay");
              if (!(_DWORD)v14)
                continue;
            }
            if (IMOSLoggingEnabled(v14))
            {
              OSLogHandleForIMFoundationCategory();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v13;
                _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Checking Device %@", buf, 0xCu);
              }

            }
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            objc_msgSend(v13, "linkedUserURIs");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            v18 = v17;
            if (v17)
            {
              v19 = *(_QWORD *)v31;
              while (2)
              {
                v20 = 0;
                do
                {
                  if (*(_QWORD *)v31 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v20);
                  if (IMOSLoggingEnabled(v17))
                  {
                    OSLogHandleForIMFoundationCategory();
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v41 = v21;
                      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Checking linked URI: %@", buf, 0xCu);
                    }

                  }
                  objc_msgSend(v21, "_stripFZIDPrefix");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = MEMORY[0x1D17EA560](v23, v6);

                  if (v24)
                  {
                    if (IMOSLoggingEnabled(v17))
                    {
                      OSLogHandleForIMFoundationCategory();
                      v25 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v41 = v21;
                        _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "LinkedURI is active for SMS Relay, Returning %@", buf, 0xCu);
                      }

                    }
                    v10 = 1;
                    goto LABEL_43;
                  }
                  ++v20;
                }
                while (v18 != v20);
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
                v18 = v17;
                if (v17)
                  continue;
                break;
              }
            }

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          v10 = 0;
        }
        while (v28);
      }
      else
      {
        v10 = 0;
      }
LABEL_43:

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_deviceForCallerID:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devices");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "supportsSMSRelay");
        if ((v8 & 1) == 0)
        {
          v8 = objc_msgSend(v7, "supportsMMSRelay");
          if (!(_DWORD)v8)
            continue;
        }
        if (IMOSLoggingEnabled(v8))
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v7;
            _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Checking Device %@", buf, 0xCu);
          }

        }
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "linkedUserURIs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        v12 = v11;
        if (v11)
        {
          v13 = *(_QWORD *)v27;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
              if (IMOSLoggingEnabled(v11))
              {
                OSLogHandleForIMFoundationCategory();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v36 = v15;
                  _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Checking linked URI: %@", buf, 0xCu);
                }

              }
              objc_msgSend(v15, "_stripFZIDPrefix");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = MEMORY[0x1D17EA560](v17, v4);

              if (v18)
              {
                if (IMOSLoggingEnabled(v11))
                {
                  OSLogHandleForIMFoundationCategory();
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v36 = v7;
                    _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "This device has the linkedURI we are looking for, return %@", buf, 0xCu);
                  }

                }
                v19 = v7;

                v20 = v19;
                goto LABEL_33;
              }
              ++v14;
            }
            while (v12 != v14);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            v12 = v11;
            if (v11)
              continue;
            break;
          }
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v24);
  }
  v19 = 0;
  v20 = obj;
LABEL_33:

  return v19;
}

- (id)_destinationForDevice:(id)a3 forcedIdentity:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "pushToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__imHexString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (void *)IDSCopyIDForPhoneNumber();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("self-token:%@/%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Looking For Local Devices that are nearby", buf, 2u);
    }

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefaultPairedDevice"))
        {
          v10 = objc_msgSend(v9, "isConnected");
          if ((_DWORD)v10)
          {
            if (IMOSLoggingEnabled(v10))
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v19 = v9;
                _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found Default paired Device which is nearby %@", buf, 0xCu);
              }

            }
            v11 = v9;
            goto LABEL_20;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (id)pairedDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Looking For paired Device", buf, 2u);
    }

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "isDefaultPairedDevice");
        if ((_DWORD)v10)
        {
          if (IMOSLoggingEnabled(v10))
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v9;
              _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found Default paired Device %@", buf, 0xCu);
            }

          }
          v11 = v9;
          goto LABEL_19;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (BOOL)hasConnectedLocalDevice
{
  void *v2;
  BOOL v3;

  -[IMDRelayServiceController localDevice](self, "localDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isProxyRegistered
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  NSObject *v29;
  const __CFString *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const __CFString *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[IMDRelayServiceController relayService](self, "relayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    -[IMDRelayServiceController relayService](self, "relayService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accounts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v11, "accountType");
      if ((_DWORD)v12 != 2)
      {
        v8 = 1;
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled(v12))
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Found the local account, it is our only account, This means we are NOT proxy resgiered", buf, 2u);
        }

      }
    }
    v8 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "I Have more than 1 account, I am registered for Proxy Push", buf, 2u);
    }

  }
  v8 = 1;
LABEL_16:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accounts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "accountType");
        if ((_DWORD)v20 == 1)
        {
          if (IMOSLoggingEnabled(v20))
          {
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Found the AppleID account", buf, 2u);
            }

          }
          v22 = v19;

          if (v22)
          {
            v24 = objc_msgSend(v22, "isActive");
            if ((v24 & 1) == 0)
            {
              if (IMOSLoggingEnabled(v24))
              {
                OSLogHandleForIMFoundationCategory();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "The AppleID account is NOT active", buf, 2u);
                }

              }
              v8 = 0;
            }
            objc_msgSend(v22, "im_registeredURIs");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "count") == 0;

            if (v27)
            {
              v21 = IMOSLoggingEnabled(v21);
              if ((_DWORD)v21)
              {
                OSLogHandleForIMFoundationCategory();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "The AppleID Account has no usable alias's", buf, 2u);
                }

              }
              v8 = 0;
            }
          }
          goto LABEL_42;
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v16)
        continue;
      break;
    }
  }

  v22 = 0;
LABEL_42:
  if (IMOSLoggingEnabled(v21))
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = CFSTR("NO");
      if (v8)
        v30 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Result of check if myself is proxy registered is %@", buf, 0xCu);
    }

  }
  return v8;
}

- (BOOL)isLocalDeviceProxyRegistered
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[IMDRelayServiceController localDevice](self, "localDevice");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (!v2)
    goto LABEL_14;
  if (IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "identities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v3;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Device %@ has identities %@", (uint8_t *)&v20, 0x16u);

    }
  }
  objc_msgSend(v3, "identities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") == 0;

  if (!v7)
  {
    objc_msgSend(v3, "identities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") == 1;

    if (v10)
    {
      objc_msgSend(v3, "identities");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "_stringForKey:", CFSTR("uri"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("mailto:__localURI__@__local__URI.com"));
      v15 = v14;
      if ((_DWORD)v14 && IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "The default paired device has an identity, but is is the local account, it is NOT proxy registered for SMS", (uint8_t *)&v20, 2u);
        }

      }
      v17 = v15 ^ 1;
      goto LABEL_20;
    }
LABEL_14:
    v17 = 1;
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "The default paired device has no identities, this means it is NOT proxy registered for SMS", (uint8_t *)&v20, 2u);
    }

  }
  v17 = 0;
LABEL_20:

  return v17;
}

- (NSArray)peerDevices
{
  void *v3;
  void *v4;

  -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
  -[IMDRelayServiceController relayService](self, "relayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)isSMSRelayEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 1;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    v6 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "accountType") == 1)
        {
          v13 = objc_msgSend(v12, "isActive");
          if ((v13 & 1) == 0)
          {
            if (IMOSLoggingEnabled(v13))
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v16 = 0;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "The AppleID account is not active, we can not use SMS Relay", v16, 2u);
              }

            }
            v6 = 0;
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)idsDeviceFromPushToken:(id)a3
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
  -[IMDRelayServiceController relayService](self, "relayService", 0);
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

- (id)idsDeviceFromUniqueID:(id)a3
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
  -[IMDRelayServiceController relayService](self, "relayService", 0);
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
        objc_msgSend(v10, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

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

- (id)idsDeviceForFromID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMDRelayServiceController relayService](self, "relayService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForFromID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isDefaultPairedDeviceRelayingLocally:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[IMDRelayServiceController idsDeviceForFromID:](self, "idsDeviceForFromID:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[IMDRelayServiceController _isConnectedOverBT:](self, "_isConnectedOverBT:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isConnectedOverBT:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v5 = 138412802;
    v20 = v5;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(__CFString **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = -[__CFString isDefaultPairedDevice](v8, "isDefaultPairedDevice", v20);
        if ((_DWORD)v9)
        {
          v9 = -[__CFString isConnected](v8, "isConnected");
          if ((_DWORD)v9)
          {
            v9 = -[__CFString isNearby](v8, "isNearby");
            if ((_DWORD)v9)
            {
              if (IMOSLoggingEnabled(v9))
              {
                OSLogHandleForIMFoundationCategory();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v26 = v8;
                  _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Device is nearby: %@", buf, 0xCu);
                }

              }
              LOBYTE(v4) = 1;
              goto LABEL_33;
            }
          }
        }
        v10 = IMOSLoggingEnabled(v9);
        if ((_DWORD)v10)
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v8;
            _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Device is NOT nearby: %@", buf, 0xCu);
          }

        }
        if (IMOSLoggingEnabled(v10))
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            if (-[__CFString isDefaultPairedDevice](v8, "isDefaultPairedDevice"))
              v13 = CFSTR("YES");
            else
              v13 = CFSTR("NO");
            v14 = -[__CFString isConnected](v8, "isConnected");
            v15 = -[__CFString isNearby](v8, "isNearby");
            v16 = CFSTR("NO");
            if (v14)
              v17 = CFSTR("YES");
            else
              v17 = CFSTR("NO");
            *(_DWORD *)buf = v20;
            v26 = v13;
            if (v15)
              v16 = CFSTR("YES");
            v27 = 2112;
            v28 = v17;
            v29 = 2112;
            v30 = v16;
            _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "isDefaultPairedDevice = %@, isConnected = %@, isNearby = %@", buf, 0x20u);
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_33:

  return v4;
}

- (void)_checkAndSetRelayService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
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
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayServiceController setRelayService:](self, "setRelayService:", v8);

      v10 = IMOSLoggingEnabled(v9);
      if (!(_DWORD)v10)
        goto LABEL_20;
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "accounts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB37E8];
        -[IMDRelayServiceController smsRelayService](self, "smsRelayService");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "devices");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138412546;
        v40 = v15;
        v41 = 2112;
        v42 = v19;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Relay service set to sms relay, accounts count %@ devices count %@", (uint8_t *)&v39, 0x16u);

      }
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "count"))
  {

    goto LABEL_15;
  }
  -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "devices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (!v24)
  {
LABEL_15:
    if (IMOSLoggingEnabled(v25))
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        LOWORD(v39) = 0;
        _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "IMDRelayServiceController: Error no IDS Service available for SMS Relay", (uint8_t *)&v39, 2u);
      }

    }
    v10 = -[IMDRelayServiceController setRelayService:](self, "setRelayService:", 0);
    goto LABEL_20;
  }
  -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController setRelayService:](self, "setRelayService:", v26);

  v10 = IMOSLoggingEnabled(v27);
  if ((_DWORD)v10)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)MEMORY[0x1E0CB37E8];
      -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "accounts");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB37E8];
      -[IMDRelayServiceController smsWatchService](self, "smsWatchService");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "devices");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v31;
      v41 = 2112;
      v42 = v35;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Relay service set to sms watch service relay , accounts count %@ devices count %@", (uint8_t *)&v39, 0x16u);

    }
LABEL_6:

  }
LABEL_20:
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      -[IMDRelayServiceController relayService](self, "relayService");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412290;
      v40 = v38;
      _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "  => Done: %@", (uint8_t *)&v39, 0xCu);

    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v7;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "IDS Devices changed: %@ on Service:%@", buf, 0x16u);
    }

  }
  -[IMDRelayServiceController updateRelayStatus](self, "updateRelayStatus");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isDefaultPairedDevice", (_QWORD)v16))
        {
          -[IMDRelayServiceController enrollmentController](self, "enrollmentController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_addDeviceToAllowedSMSRelay:shouldSendApproval:", v13, 0);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[IMDRelayServiceController enrollmentController](self, "enrollmentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_addDefaultPairedDeviceToAllowedSMSRelayList");

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Active accounts of service %@ changed to %@", (uint8_t *)&v10, 0x16u);
    }

  }
  -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
  -[IMDRelayServiceController enrollmentController](self, "enrollmentController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_addDefaultPairedDeviceToAllowedSMSRelayList");

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v8 = a6;
  v21 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (v8)
        v16 = CFSTR("YES");
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Message with ID %@ Sent Success %@", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Account %@ aliases has changes", (uint8_t *)&v9, 0xCu);
    }

  }
  -[IMDRelayServiceController updateRelayStatus](self, "updateRelayStatus");

}

- (void)_setupMMSObservation
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x1E0D39730], "IMSynchronizePreferredSubscriptionMMSCapabilityToWatch");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleCapabilitiesChanged_, *MEMORY[0x1E0D20BF0], 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1D1510164, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
}

- (void)_teardownMMSObservation
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0);
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
}

- (unsigned)_readMMSUserOverrideForSingleSubscription
{
  return objc_msgSend(MEMORY[0x1E0D39730], "IMReadMMSUserOverrideForPhoneNumber:simID:", 0, 0);
}

- (BOOL)_checkMMSEnablementForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  __CFString *v28;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  int v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    v8 = objc_msgSend(MEMORY[0x1E0D39730], "IMMMSEnabledForPhoneNumber:simID:", v6, v7);
    if (IMOSLoggingEnabled(v8))
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("NO");
        if ((_DWORD)v8)
          v10 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v42 = v10;
        _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "MMS enabled: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "supportsMMS");

    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ctSubscriptionInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CA6DB0], "sharedMessageCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isMmsConfiguredForSub:", v15);

    v18 = -[IMDRelayServiceController _readMMSUserOverrideForSingleSubscription](self, "_readMMSUserOverrideForSingleSubscription");
    v35 = v18;
    v36 = v17;
    if ((_DWORD)v18)
      LODWORD(v8) = v12 & v17;
    else
      LODWORD(v8) = 0;
    if ((v12 & 1) == 0)
    {
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "MMS not supported on current device, checking for relay devices", buf, 2u);
        }

      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      -[IMDRelayServiceController relayService](self, "relayService");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "devices");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v38 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (objc_msgSend(v25, "supportsSMSRelay"))
            {
              v26 = objc_msgSend(v25, "supportsMMSRelay");
              if ((_DWORD)v26)
              {
                if (IMOSLoggingEnabled(v26))
                {
                  OSLogHandleForIMFoundationCategory();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v25, "name");
                    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v42 = v28;
                    _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "MMS relay device found: %@", buf, 0xCu);

                  }
                }
                LODWORD(v8) = 1;
                goto LABEL_31;
              }
            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_31:

    }
    if (IMOSLoggingEnabled(v18))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = CFSTR("NO");
        if ((_DWORD)v8)
          v31 = CFSTR("YES");
        else
          v31 = CFSTR("NO");
        if (v12)
          v32 = CFSTR("YES");
        else
          v32 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        v42 = v31;
        if (v36)
          v33 = CFSTR("YES");
        else
          v33 = CFSTR("NO");
        v43 = 2112;
        v44 = v32;
        v45 = 2112;
        v46 = v33;
        if (v35)
          v30 = CFSTR("YES");
        v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "MMS enabled: %@ (GS:%@, CT:%@, User:%@)", buf, 0x2Au);
      }

    }
  }

  return v8;
}

- (void)_synchronizeMMSCapabilityToWatch:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Calling IMSynchronizeMMSCapabilityToWatch isMMSEnabled %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39730], "IMSynchronizeMMSCapabilityToWatch:", v3);
}

- (BOOL)_syncedMMSEnabledValue
{
  uint64_t AppBooleanValue;
  int v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MMSRelayEnabled"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
  v3 = AppBooleanValue;
  v4 = keyExistsAndHasValidFormat == 0;
  v5 = IMOSLoggingEnabled(AppBooleanValue);
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v3)
          v8 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "_syncedMMSEnabledValue does not exist. Defaulting to %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "_syncedMMSEnabledValue %@", buf, 0xCu);
    }
LABEL_13:

  }
  return v3 != 0;
}

- (void)updateMMSCapability
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  _BOOL8 v17;
  _BOOL8 v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ctSubscriptionInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v21, "subscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v8, "phoneNumber");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "labelID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[IMDRelayServiceController _checkMMSEnablementForPhoneNumber:simID:](self, "_checkMMSEnablementForPhoneNumber:simID:", v9, v10);

          objc_msgSend(v8, "userDefaultVoice");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (IMOSLoggingEnabled(v13))
            {
              OSLogHandleForIMFoundationCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v15 = CFSTR("NO");
                if (v11)
                  v15 = CFSTR("YES");
                v27 = v15;
                v28 = 2112;
                v29 = v8;
                _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Synchronize isMMSEnabled %@ for voice preferred subscription %@", buf, 0x16u);
              }

            }
            -[IMDRelayServiceController _synchronizeMMSCapabilityToWatch:](self, "_synchronizeMMSCapabilityToWatch:", v11);
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v5);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MMSCapable"), 0, 0, 1u);

  }
  else
  {
    v17 = -[IMDRelayServiceController _checkMMSEnablementForPhoneNumber:simID:](self, "_checkMMSEnablementForPhoneNumber:simID:", 0, 0);
    v18 = v17;
    if (qword_1EFC63DB8 != -1)
      dispatch_once(&qword_1EFC63DB8, &unk_1E922C4A8);
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = CFSTR("NO");
        if (v18)
          v20 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Setting MMS token to: %@", buf, 0xCu);
      }

    }
    notify_set_state(dword_1EFC63DB0, v18);
    -[IMDRelayServiceController _synchronizeMMSCapabilityToWatch:](self, "_synchronizeMMSCapabilityToWatch:", v18);
  }
}

- (void)_handleCapabilitiesChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Device capabilities changed", v6, 2u);
    }

  }
  -[IMDRelayServiceController updateMMSCapability](self, "updateMMSCapability");

}

- (BOOL)accountHasAlias:(id)a3 aliastoCheck:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, " Checking if Account %@ has alias %@ ", buf, 0x16u);
    }

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = v5;
  objc_msgSend(v5, "im_registeredURIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v10 = v9;
  if (v9)
  {
    v11 = *(_QWORD *)v20;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v25 = v6;
            v26 = 2112;
            v27 = v13;
            _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, " comparing alias %@ and alias %@ ", buf, 0x16u);
          }

        }
        v9 = objc_msgSend(v6, "isEqualToIgnoringCase:", v13);
        if ((_DWORD)v9)
        {
          if (IMOSLoggingEnabled(v9))
          {
            OSLogHandleForIMFoundationCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v25 = v13;
              _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, " Positive match on alias %@ ", buf, 0xCu);
            }

          }
          v15 = 1;
          goto LABEL_23;
        }
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v10 = v9;
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (id)accountForAlias:(id)a3 fromAccounts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (-[IMDRelayServiceController accountHasAlias:aliastoCheck:](self, "accountHasAlias:aliastoCheck:", v14, v6, (_QWORD)v17)&& objc_msgSend(v14, "canSend"))
          {
            v15 = v14;
            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_14:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)phoneAliasForDominentPhoneAlias:(id)a3 registeredPhoneNumber:(id)a4 preferedCallerID:(id)a5 CTPhoneNumber:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL8 v16;
  int v17;
  void *v18;
  NSObject *v19;
  _BOOL8 v20;
  _BOOL4 v21;
  int v22;
  NSObject *v23;
  _BOOL8 v24;
  _BOOL4 v25;
  int v26;
  NSObject *v27;
  id v28;
  int v30;
  NSObject *v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v12, "length");
  if (v14)
  {
    if (IMOSLoggingEnabled(v14))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v32 = 138412290;
        v33 = v12;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, " We have a prefered Alias %@", (uint8_t *)&v32, 0xCu);
      }

    }
    if (objc_msgSend(v12, "_appearsToBePhoneNumber"))
    {
      v16 = -[IMDRelayServiceController isAliasRelayCapable:](self, "isAliasRelayCapable:", v12);
      if (v16)
      {
        v17 = IMOSLoggingEnabled(v16);
        v18 = v12;
        if (v17)
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v32 = 138412290;
            v33 = v12;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, " This alias appears to be a phone number, we will send to that destination %@", (uint8_t *)&v32, 0xCu);
          }

          v18 = v12;
        }
        goto LABEL_33;
      }
    }
    v20 = -[IMDRelayServiceController _localDeviceSupportsSMS](self, "_localDeviceSupportsSMS");
    v21 = v20;
    v22 = IMOSLoggingEnabled(v20);
    if (v21)
    {
      v18 = v13;
      if (!v22)
        goto LABEL_33;
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v32 = 138412290;
        v33 = v13;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, but we outselves support SMS, So we sent this one out using %@ instead", (uint8_t *)&v32, 0xCu);
      }
LABEL_24:

      v18 = v13;
      goto LABEL_33;
    }
    v18 = v10;
    if (!v22)
      goto LABEL_33;
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v32 = 138412290;
      v33 = v10;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, using %@ instead", (uint8_t *)&v32, 0xCu);
    }
    goto LABEL_32;
  }
  if (!-[IMDRelayServiceController _localDeviceSupportsSMS](self, "_localDeviceSupportsSMS")
    || !objc_msgSend(v11, "length")
    || objc_msgSend(v10, "length"))
  {
    v24 = -[IMDRelayServiceController _localDeviceSupportsSMS](self, "_localDeviceSupportsSMS");
    v25 = v24;
    v26 = IMOSLoggingEnabled(v24);
    if (v25)
    {
      v18 = v13;
      if (!v26)
        goto LABEL_33;
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v32 = 138412290;
        v33 = v13;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, but we outselves support SMS, So we sent this one out using %@ instead", (uint8_t *)&v32, 0xCu);
      }
      goto LABEL_24;
    }
    v18 = v10;
    if (!v26)
      goto LABEL_33;
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, " We have no prefered alias, we are going to use the dominant phone number one", (uint8_t *)&v32, 2u);
    }
LABEL_32:

    v18 = v10;
    goto LABEL_33;
  }
  v30 = IMOSLoggingEnabled(0);
  v18 = v11;
  if (v30)
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = 138412290;
      v33 = v11;
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, " This prefered alias is not the IDS registered number, and we support SMS, So we sent this one out using %@ instead", (uint8_t *)&v32, 0xCu);
    }

    v18 = v11;
  }
LABEL_33:
  v28 = v18;

  return v28;
}

- (id)retrievePhoneAccountAndPhoneAliasFromIDSAccounts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v5)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
      if (!objc_msgSend(v7, "accountType"))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v7, "im_registeredURIs", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (!v9)
    {
LABEL_18:

      goto LABEL_19;
    }
    v10 = *(_QWORD *)v21;
LABEL_12:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "_appearsToBePhoneNumber") & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
        if (v9)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
    v16 = v7;
    v14 = v12;

    if (!v16)
      goto LABEL_20;
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v16;
        v30 = 2112;
        v31 = v14;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, " Found IDS account %@ with phone number %@", buf, 0x16u);
      }

    }
  }
  else
  {
LABEL_19:

    v14 = 0;
LABEL_20:
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, " Unable to find IDS phone number account", buf, 2u);
      }

    }
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36A98]), "initWithFirst:second:", v16, v14);

  return v17;
}

- (id)retrieveAccountAndPhoneAliasForAccounts:(id)a3 shouldFilterRecepients:(BOOL)a4 requestProxySend:(BOOL)a5 preferredCallerID:(id)a6
{
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  _BOOL4 v45;
  _BOOL4 v46;
  void *v47;
  __CFString *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  __CFString *v59;
  uint64_t v60;

  v45 = a5;
  v46 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a6;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v46)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v55 = v12;
      v56 = 2112;
      if (v45)
        v11 = CFSTR("YES");
      v57 = v11;
      v58 = 2112;
      v59 = v8;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "finding account and phoneAlias shouldFilterRecipients: %@ requestProxySend: %@ for accounts %@", buf, 0x20u);
    }

  }
  -[IMDRelayServiceController dominentPhoneNumberAlias](self, "dominentPhoneNumberAlias");
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v48))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v48;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "dominentPhoneAlias is this: %@", buf, 0xCu);
    }

  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registeredPhoneNumbers");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v15;
        _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "IDS registered phone numbers are %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController _callerIDForRelay](self, "_callerIDForRelay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v19 = v15;
  v20 = 0;
  v21 = -[__CFString countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v19);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "isEqualToString:", v18) & 1) == 0)
        {
          IMNormalizePhoneNumber();
          v24 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v24;
        }
      }
      v21 = -[__CFString countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v21);
  }

  -[IMDRelayServiceController phoneAliasForDominentPhoneAlias:registeredPhoneNumber:preferedCallerID:CTPhoneNumber:](self, "phoneAliasForDominentPhoneAlias:registeredPhoneNumber:preferedCallerID:CTPhoneNumber:", v48, v20, v18, v47);
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = IMOSLoggingEnabled(v25);
  if ((_DWORD)v26)
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v8;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, " Found Accounts %@ for SMS Relay Service ", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v26))
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v25;
      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, " Ensuring that the account picked matches the callerID %@", buf, 0xCu);
    }

  }
  -[IMDRelayServiceController accountForAlias:fromAccounts:](self, "accountForAlias:fromAccounts:", v25, v8);
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v30 = IMOSLoggingEnabled(v29);
  if ((_DWORD)v30)
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v29;
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, " Going to use account %@ For sending this message", buf, 0xCu);
    }

  }
  if (v9 && (v30 = -[__CFString _appearsToBePhoneNumber](v9, "_appearsToBePhoneNumber"), (_DWORD)v30))
  {
    if (IMOSLoggingEnabled(v30))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v9;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, " We have a phone alias override, looking for new account that matches callerID %@", buf, 0xCu);
      }

    }
    -[IMDRelayServiceController accountForAlias:fromAccounts:](self, "accountForAlias:fromAccounts:", v9, v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = v9;

      v35 = v33;
      if (IMOSLoggingEnabled(v36))
      {
        OSLogHandleForIMFoundationCategory();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v35;
          _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, " Updating sending account, Now Going to use account %@ For sending this message", buf, 0xCu);
        }

      }
    }
    else
    {
      v34 = v25;
      v35 = v29;
    }

    if (v35)
    {
LABEL_64:
      if (v35)
      {
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D36A98]), "initWithFirst:second:", v35, v34);
        goto LABEL_76;
      }
      goto LABEL_66;
    }
  }
  else
  {
    v34 = v25;
    v35 = v29;
    if (v29)
      goto LABEL_64;
  }
  if (!v46 || v45)
    goto LABEL_64;
  v30 = -[IMDRelayServiceController _localDeviceSupportsSMS](self, "_localDeviceSupportsSMS");
  if (!(_DWORD)v30)
  {
LABEL_66:
    if (IMOSLoggingEnabled(v30))
    {
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = CFSTR("NO");
        if (v46)
          v42 = CFSTR("YES");
        else
          v42 = CFSTR("NO");
        if (v45)
          v41 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v55 = v42;
        v56 = 2112;
        v57 = v41;
        _os_log_impl(&dword_1D1413000, v40, OS_LOG_TYPE_INFO, "Account is nil but not finding new account based on phone number IDS account based on parameters shouldFilter %@ requestProxy %@", buf, 0x16u);
      }

    }
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D36A98]), "initWithFirst:second:", 0, v34);
    goto LABEL_76;
  }
  if (IMOSLoggingEnabled(v30))
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, " Account is nil, getting phone account from IDS", buf, 2u);
    }

  }
  v39 = -[IMDRelayServiceController retrievePhoneAccountAndPhoneAliasFromIDSAccounts:](self, "retrievePhoneAccountAndPhoneAliasFromIDSAccounts:", v8);
LABEL_76:
  v43 = v39;

  return v43;
}

- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7
{
  return -[IMDRelayServiceController sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:sentToDevices:](self, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:sentToDevices:", a3, a4, a5, a6, a7, 0);
}

- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7 sentToDevices:(id *)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  __CFDictionary *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __CFDictionary *Mutable;
  void *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  BOOL v44;
  NSObject *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  BOOL v60;
  NSObject *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id v66;
  void *v67;
  uint64_t i;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  _BOOL4 v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  NSObject *v86;
  const __CFString *v87;
  id *v89;
  __CFDictionary *v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id obj;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  IMDRelayServiceController *v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
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
  uint8_t buf[4];
  id v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  id v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  id v131;
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;
  _BYTE v135[128];
  void *v136;
  _BYTE v137[128];
  _QWORD v138[4];

  v10 = a6;
  v11 = a5;
  v138[1] = *MEMORY[0x1E0C80C00];
  v14 = (__CFDictionary *)a3;
  v94 = a4;
  v97 = a7;
  v15 = -[IMDRelayServiceController hasPeerDevices](self, "hasPeerDevices");
  if (v15)
  {
    v89 = a8;
    v103 = self;
    -[IMDRelayServiceController relayService](self, "relayService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accounts");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v91 = -[IMDRelayServiceController retrieveAccountAndPhoneAliasForAccounts:shouldFilterRecepients:requestProxySend:preferredCallerID:](self, "retrieveAccountAndPhoneAliasForAccounts:shouldFilterRecepients:requestProxySend:preferredCallerID:", v92, v11, v10, v94);
    objc_msgSend(v91, "first");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "second");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("_SMSServiceRelayToWatchOnly"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (!v93 || (v19 = objc_msgSend(v102, "length")) == 0)
    {
      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, " => No account available for sending With Phone number alias, failing", buf, 2u);
        }

      }
      LOBYTE(v23) = 0;
      v90 = v14;
LABEL_116:

      v14 = v90;
      goto LABEL_117;
    }
    v95 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    Mutable = (__CFDictionary *)-[__CFDictionary mutableCopy](v14, "mutableCopy");
    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v21 = (void *)IDSCopyIDForPhoneNumber();
    if (v21)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D34178], v21);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_1D166AD38();
    }

    v90 = Mutable;
    IMGreenTeaMessageTransmitLog();
    if (!v10)
    {
      if (v11)
      {
        -[__CFDictionary objectForKeyedSubscript:](v90, "objectForKeyedSubscript:", *MEMORY[0x1E0D34138]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v30, "integerValue");

        -[IMDRelayServiceController enrollmentController](v103, "enrollmentController");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_allowedIDSDevicesforSMSRelay");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v26 = v32;
        v33 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
        v34 = v33;
        if (v33)
        {
          v35 = *(_QWORD *)v119;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v119 != v35)
                objc_enumerationMutation(v26);
              v37 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v36);
              if (v97
                && (objc_msgSend(v97, "uniqueID"),
                    v38 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v37, "uniqueID"),
                    v39 = (void *)objc_claimAutoreleasedReturnValue(),
                    v40 = objc_msgSend(v38, "isEqualToString:", v39),
                    v39,
                    v38,
                    v40))
              {
                v33 = IMOSLoggingEnabled(v33);
                if ((_DWORD)v33)
                {
                  OSLogHandleForIMFoundationCategory();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v97, "uniqueID");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v123 = v42;
                    _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, They were the original person who sent this message to us in the first place", buf, 0xCu);

                  }
                }
              }
              else if (v18
                     && (v136 = v37,
                         objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1),
                         v43 = (void *)objc_claimAutoreleasedReturnValue(),
                         v44 = -[IMDRelayServiceController _isConnectedOverBT:](v103, "_isConnectedOverBT:", v43),
                         v43,
                         !v44))
              {
                v33 = IMOSLoggingEnabled(v33);
                if ((_DWORD)v33)
                {
                  OSLogHandleForIMFoundationCategory();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v37, "uniqueID");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v123 = v49;
                    _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we only need to relay it to the active watch", buf, 0xCu);

                  }
                }
              }
              else if (v100 == 139
                     && (v33 = objc_msgSend(MEMORY[0x1E0D399F8], "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:", objc_msgSend(v37, "deviceType")), (v33 & 1) == 0))
              {
                v33 = IMOSLoggingEnabled(v33);
                if ((_DWORD)v33)
                {
                  OSLogHandleForIMFoundationCategory();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v37, "uniqueID");
                    v51 = (id)objc_claimAutoreleasedReturnValue();
                    v52 = objc_msgSend(v37, "deviceType");
                    *(_DWORD *)buf = 138412546;
                    v123 = v51;
                    v124 = 2048;
                    v125 = v52;
                    _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we are sending SMSFilteringSettingMessage and this device type (%ld) is not capable of receiving it", buf, 0x16u);

                  }
                }
              }
              else
              {
                if (IMOSLoggingEnabled(v33))
                {
                  OSLogHandleForIMFoundationCategory();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v37, "uniqueID");
                    v46 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "name");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v123 = v46;
                    v124 = 2112;
                    v125 = (uint64_t)v47;
                    _os_log_impl(&dword_1D1413000, v45, OS_LOG_TYPE_INFO, " Adding %@ name %@ the devices to send this message to ", buf, 0x16u);

                  }
                }
                v33 = objc_msgSend(v95, "addObject:", v37);
              }
              ++v36;
            }
            while (v34 != v36);
            v33 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v118, v137, 16);
            v34 = v33;
          }
          while (v33);
        }

      }
      else
      {
        v116 = 0u;
        v117 = 0u;
        v114 = 0u;
        v115 = 0u;
        -[IMDRelayServiceController relayService](v103, "relayService");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "devices");
        v26 = (id)objc_claimAutoreleasedReturnValue();

        v54 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v114, v135, 16);
        v55 = v54;
        if (v54)
        {
          v56 = *(_QWORD *)v115;
          do
          {
            v57 = 0;
            do
            {
              if (*(_QWORD *)v115 != v56)
                objc_enumerationMutation(v26);
              v58 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v57);
              if (v18
                && (v134 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * v57),
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1),
                    v59 = (void *)objc_claimAutoreleasedReturnValue(),
                    v60 = -[IMDRelayServiceController _isConnectedOverBT:](v103, "_isConnectedOverBT:", v59),
                    v59,
                    !v60))
              {
                v54 = IMOSLoggingEnabled(v54);
                if ((_DWORD)v54)
                {
                  OSLogHandleForIMFoundationCategory();
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v58, "uniqueID");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v123 = v65;
                    _os_log_impl(&dword_1D1413000, v64, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we only need to relay it to the active watch", buf, 0xCu);

                  }
                }
              }
              else
              {
                if (IMOSLoggingEnabled(v54))
                {
                  OSLogHandleForIMFoundationCategory();
                  v61 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v58, "uniqueID");
                    v62 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v58, "name");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v123 = v62;
                    v124 = 2112;
                    v125 = (uint64_t)v63;
                    _os_log_impl(&dword_1D1413000, v61, OS_LOG_TYPE_INFO, " Adding %@ name %@ the devices to send this message to ", buf, 0x16u);

                  }
                }
                v54 = objc_msgSend(v95, "addObject:", v58);
              }
              ++v57;
            }
            while (v55 != v57);
            v54 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v114, v135, 16);
            v55 = v54;
          }
          while (v54);
        }
      }
      goto LABEL_82;
    }
    -[IMDRelayServiceController _deviceForCallerID:](v103, "_deviceForCallerID:", v102);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (id)v25;
    if (v25)
      v27 = v18;
    else
      v27 = 0;
    if (v27 == 1)
    {
      v138[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[IMDRelayServiceController _isConnectedOverBT:](v103, "_isConnectedOverBT:", v28);

      if (!v29)
        goto LABEL_82;
    }
    else if (!v25)
    {
LABEL_82:

      v66 = (id)objc_msgSend(v95, "count");
      if (v66)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v95, "count"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary objectForKey:](v90, "objectForKey:", CFSTR("requiredCapabilitiesForSMSRelay"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        obj = v95;
        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v133, 16);
        if (v99)
        {
          v98 = *(_QWORD *)v111;
          do
          {
            for (i = 0; i != v99; ++i)
            {
              if (*(_QWORD *)v111 != v98)
                objc_enumerationMutation(obj);
              v69 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
              if (objc_msgSend(v101, "count"))
              {
                v108 = 0u;
                v109 = 0u;
                v106 = 0u;
                v107 = 0u;
                v70 = v101;
                v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v106, v132, 16);
                if (v71)
                {
                  v72 = *(_QWORD *)v107;
                  while (2)
                  {
                    for (j = 0; j != v71; ++j)
                    {
                      if (*(_QWORD *)v107 != v72)
                        objc_enumerationMutation(v70);
                      v74 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
                      objc_msgSend(v69, "capabilities");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      v76 = objc_msgSend(v75, "valueForCapability:", v74) == 0;

                      if (v76)
                      {
                        if (IMOSLoggingEnabled(v77))
                        {
                          OSLogHandleForIMFoundationCategory();
                          v79 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            v123 = v74;
                            _os_log_impl(&dword_1D1413000, v79, OS_LOG_TYPE_INFO, "Not relaying to device as it does not support required capability: %@", buf, 0xCu);
                          }

                        }
                        goto LABEL_103;
                      }
                      -[IMDRelayServiceController _destinationForDevice:forcedIdentity:](v103, "_destinationForDevice:forcedIdentity:", v69, v102);
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v67, "addObject:", v78);

                    }
                    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v106, v132, 16);
                    if (v71)
                      continue;
                    break;
                  }
                }
              }
              else
              {
                -[IMDRelayServiceController _destinationForDevice:forcedIdentity:](v103, "_destinationForDevice:forcedIdentity:", v69, v102);
                v70 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "addObject:", v70);
              }
LABEL_103:

            }
            v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v133, 16);
          }
          while (v99);
        }

        -[IMDRelayServiceController _checkAndSetRelayService](v103, "_checkAndSetRelayService");
        v80 = (void *)MEMORY[0x1E0D39888];
        -[IMDRelayServiceController relayService](v103, "relayService");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v67);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0;
        v105 = 0;
        v23 = objc_msgSend(v80, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v81, v82, v93, v83, 300, v90, &v105, &v104);
        v84 = v105;
        v85 = v104;

      }
      else
      {
        v84 = 0;
        v85 = 0;
        v23 = 0;
      }
      if (v89)
      {
        v66 = (id)objc_msgSend(v95, "copy");
        *v89 = v66;
      }
      if (IMOSLoggingEnabled(v66))
      {
        OSLogHandleForIMFoundationCategory();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          v87 = CFSTR("NO");
          *(_DWORD *)buf = 138413314;
          v123 = v102;
          if (v23)
            v87 = CFSTR("YES");
          v124 = 2112;
          v125 = (uint64_t)v87;
          v126 = 2112;
          v127 = v85;
          v128 = 2112;
          v129 = v93;
          v130 = 2112;
          v131 = v84;
          _os_log_impl(&dword_1D1413000, v86, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@   error: %@   account: %@  identifier %@", buf, 0x34u);
        }

      }
      goto LABEL_116;
    }
    objc_msgSend(v95, "addObject:", v26);
    goto LABEL_82;
  }
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, " => Not sending data, we have no peer devices", buf, 2u);
    }

  }
  LOBYTE(v23) = 0;
LABEL_117:

  return v23;
}

- (void)_sendMessageToPairedDeviceWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D345D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "isActive"))
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v12 = (void *)MEMORY[0x1E0D39888];
  -[IMDRelayServiceController relayService](self, "relayService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = 0;
  v15 = objc_msgSend(v12, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v13, v14, v8, v5, 300, v4, &v22, &v21);
  v16 = v22;
  v17 = v21;

  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v28 = v5;
      v29 = 2112;
      if (v15)
        v20 = CFSTR("YES");
      v30 = v20;
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v17;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@ account:%@  error: %@  identifier %@", buf, 0x34u);
    }

  }
}

- (void)_sendMessageToAllSMSRelayDevicesWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)IDSCopyIDForDevice();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
    }
    while (v8);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IMDRelayServiceController relayService](self, "relayService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    while (2)
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v17, "isActive"))
        {
          v14 = v17;
          goto LABEL_20;
        }
      }
      v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_20:

  v18 = (void *)MEMORY[0x1E0D39888];
  -[IMDRelayServiceController relayService](self, "relayService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = 0;
  v22 = objc_msgSend(v18, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v19, v20, v14, v21, 300, v4, &v29, &v28);
  v23 = v29;
  v24 = v28;

  if (IMOSLoggingEnabled(v25))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v27 = CFSTR("NO");
      v39 = v5;
      v40 = 2112;
      if (v22)
        v27 = CFSTR("YES");
      v41 = v27;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v24;
      v46 = 2112;
      v47 = v23;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@ account:%@  error: %@  identifier %@", buf, 0x34u);
    }

  }
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return -[IMDRelayServiceController sendFileToLocalPeers:metadata:](self, "sendFileToLocalPeers:metadata:", 0, a3);
}

- (BOOL)sendFileToLocalPeers:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id *v17;
  id *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v7;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Sending message to local device => dictionary: %@", buf, 0xCu);
    }

  }
  -[IMDRelayServiceController localDevice](self, "localDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = (id)*MEMORY[0x1E0D345D0];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v11, 0);
    v13 = *MEMORY[0x1E0D34150];
    v37[0] = *MEMORY[0x1E0D34188];
    v37[1] = v13;
    v38[0] = MEMORY[0x1E0C9AAB0];
    v38[1] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
    if (v6)
    {
      -[IMDRelayServiceController relayService](self, "relayService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v30 = 0;
      v16 = objc_msgSend(v15, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v6, v7, v12, 300, v14, &v30, &v29);
      v17 = (id *)&v29;
      v18 = (id *)&v30;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0D39888];
      -[IMDRelayServiceController relayService](self, "relayService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v28 = 0;
      v16 = objc_msgSend(v20, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v15, v7, 0, v12, 300, v14, &v28, &v27);
      v17 = (id *)&v27;
      v18 = (id *)&v28;
    }
    v21 = *v18;
    v22 = *v17;

    if (IMOSLoggingEnabled(v23))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        v32 = v22;
        v33 = 2112;
        if (v16)
          v25 = CFSTR("YES");
        v34 = v25;
        v35 = 2112;
        v36 = v21;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Sending message to local account (error %@) success: %@ with Identifier %@", buf, 0x20u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "No Local Device Found, unable to send message", buf, 2u);
      }

    }
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)_relayEditedMessage:(id)a3 messageGUID:(id)a4 serializedHandles:(id)a5 chatStyle:(unsigned __int8)a6 callerID:(id)a7
{
  int v8;
  id v12;
  __CFDictionary *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  _BOOL8 v25;
  _BOOL4 v26;
  NSObject *v27;
  const __CFString *v28;
  id v29;
  id v30;
  id value;
  uint8_t buf[4];
  const __CFString *v33;
  uint64_t v34;

  v8 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v30 = a4;
  value = a5;
  v29 = a7;
  v13 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = v12;
  if (v14)
  {
    CFDictionarySetValue(v13, IMDRelayMessageItemDictionary, v14);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166ADB8();
  }

  if (value)
    CFDictionarySetValue(v13, IMDCTMessageDictionaryReceipientsKey, value);
  v15 = MEMORY[0x1E0C9AAB0];
  CFDictionarySetValue(v13, IMDRelayMessageDictionarySendOnlyKey, MEMORY[0x1E0C9AAB0]);
  sub_1D14435A8(v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    CFDictionarySetValue(v13, IMDRelayMessageDictionaryChatStyleKey, v16);
  JWEncodeDictionary();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "_FTCopyGzippedData");
  v19 = (void *)MEMORY[0x1E0C99E08];
  IDSGetUUIDData();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 143);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E0D341D8], v15, *MEMORY[0x1E0D341C0], MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D34150], v20, *MEMORY[0x1E0D341E0], v21, *MEMORY[0x1E0D34138], v18, *MEMORY[0x1E0D34148], 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDRelayServiceController localDevice](self, "localDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23 || (v24 = -[IMDRelayServiceController isProxyRegistered](self, "isProxyRegistered"), v23, v24))
  {
    v25 = -[IMDRelayServiceController sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:](self, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:", v22, v29, 0, 1, 0);
    v26 = v25;
    if (IMOSLoggingEnabled(v25))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = CFSTR("NO");
        if (v26)
          v28 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v33 = v28;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Success sending data to peers: %@", buf, 0xCu);
      }

    }
  }

}

- (void)_relayMessageToPairedDevice:(id)a3 messageID:(id)a4 hasAttachments:(BOOL)a5
{
  __CFString **v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = &IMDRelayLocalMessageTypeOutgoing;
  if (a5)
    v8 = &IMDRelayLocalMessageTypeOutgoingDownload;
  v9 = *v8;
  v20[0] = IMDRelayLocalMessageDictionaryOutgoingDictKey;
  v20[1] = IMDRelayLocalMessageDictionaryGUIDKey;
  v21[0] = a3;
  v21[1] = a4;
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = v9;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  JWEncodeDictionary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "_FTCopyGzippedData");
  v18[0] = IMDRelayLocalMessageDictionaryDictKey;
  v18[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v19[0] = v16;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController sendToLocalPeers:](self, "sendToLocalPeers:", v17);

}

- (void)_relayMessageDict:(id)a3 messageID:(id)a4 forcedCallerID:(id)a5 didSendSMS:(BOOL)a6 relayToWatchOnly:(BOOL)a7 shouldDisableScreenTimeRestrictions:(BOOL)a8 hasAttachments:(BOOL)a9 requiredCapabilities:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v14;

  v10 = a7;
  v11 = a6;
  if (a9)
    v14 = 144;
  else
    v14 = 143;
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:", a3, v14, a4, a5, v11, v10);
}

- (id)_sendOptionsForRelayMessage:(id)a3 command:(int64_t)a4 guid:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  JWEncodeDictionary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "_FTCopyGzippedData");
  v9 = *MEMORY[0x1E0D341C0];
  v16[0] = *MEMORY[0x1E0D341D8];
  v16[1] = v9;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  v10 = *MEMORY[0x1E0D34150];
  v17[2] = MEMORY[0x1E0C9AAA0];
  v11 = *MEMORY[0x1E0D341E0];
  v16[2] = v10;
  v16[3] = v11;
  IDSGetUUIDData();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[3] = v12;
  v16[4] = *MEMORY[0x1E0D34138];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = *MEMORY[0x1E0D34148];
  v17[4] = v13;
  v17[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 requiredCapabilities:(id)a11
{
  uint64_t v11;

  LOWORD(v11) = __PAIR16__(a10, a9);
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:requiredCapabilities:", a3, a4, a5, a6, a7, a8, v11, 0, a11);
}

- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 sentToDevices:(id *)a11 requiredCapabilities:(id)a12
{
  uint64_t v12;

  LOWORD(v12) = __PAIR16__(a10, a9);
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:", a3, a4, a5, a6, a7, a8, v12, a11, 0, a12);
}

- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 sentToDevices:(id *)a11 extraOptions:(id)a12 requiredCapabilities:(id)a13
{
  _BOOL8 v13;
  _BOOL4 v14;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _BOOL4 v29;
  _BOOL8 v30;
  _BOOL4 v31;
  NSObject *v32;
  const __CFString *v33;
  id v34;
  void *v35;
  uint8_t buf[4];
  const __CFString *v37;
  uint64_t v38;

  v13 = a8;
  v14 = a7;
  v38 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a5;
  v34 = a6;
  v21 = a12;
  v22 = a13;
  v35 = v19;
  -[IMDRelayServiceController _sendOptionsForRelayMessage:command:guid:](self, "_sendOptionsForRelayMessage:command:guid:", v19, a4, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "mutableCopy");

  if (v21)
    objc_msgSend(v24, "addEntriesFromDictionary:", v21);
  if (v13)
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_SMSServiceRelayToWatchOnly"));
  v25 = objc_msgSend(v22, "count");
  if (v25)
    v25 = objc_msgSend(v24, "setObject:forKey:", v22, CFSTR("requiredCapabilitiesForSMSRelay"));
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      CFDictionarySetValue((CFMutableDictionaryRef)v24, (const void *)*MEMORY[0x1E0D341C8], v26);

    -[IMDRelayServiceController _forwardMessageToPeers:messageType:guid:originalSender:hasAttachment:watchOnly:sentToDevices:requiredCapabilities:](self, "_forwardMessageToPeers:messageType:guid:originalSender:hasAttachment:watchOnly:sentToDevices:requiredCapabilities:", v35, a4, v20, 0, a10, v13, a11, v22);
  }
  else
  {
    if (a10 && IMOSLoggingEnabled(v25))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "Relaying attachment to SMS capable device.", buf, 2u);
      }

    }
    -[IMDRelayServiceController localDevice](self, "localDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28
      || (v29 = -[IMDRelayServiceController isProxyRegistered](self, "isProxyRegistered"), v28, v29))
    {
      v30 = -[IMDRelayServiceController sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:sentToDevices:](self, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:sentToDevices:", v24, v34, 0, 1, 0, a11);
      v31 = v30;
      if (IMOSLoggingEnabled(v30))
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = CFSTR("NO");
          if (v31)
            v33 = CFSTR("YES");
          *(_DWORD *)buf = 138412290;
          v37 = v33;
          _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Success sending data to peers: %@", buf, 0xCu);
        }

      }
    }
  }

}

- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel_forwardMessageToPeers_messageType_guid_originalSender_hasAttachment_watchOnly_);
}

- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 watchOnly:(BOOL)a7
{
  MEMORY[0x1E0DE7D20](self, sel_forwardMessageToPeers_messageType_guid_originalSender_hasAttachment_watchOnly_);
}

- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8
{
  -[IMDRelayServiceController _forwardMessageToPeers:messageType:guid:originalSender:hasAttachment:watchOnly:sentToDevices:requiredCapabilities:](self, "_forwardMessageToPeers:messageType:guid:originalSender:hasAttachment:watchOnly:sentToDevices:requiredCapabilities:", a3, a4, a5, a6, a7, a8, 0, 0);
}

- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8 sentToDevices:(id *)a9 requiredCapabilities:(id)a10
{
  _BOOL8 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  __CFDictionary *v20;
  int v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __CFDictionary *v42;
  IMDRelayServiceController *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  uint8_t v50[16];
  uint8_t v51[16];
  uint8_t buf[16];

  v10 = a8;
  v11 = a7;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a10;
  if (IMOSLoggingEnabled(v18))
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Adding reflect only key and forwarding message to peers", buf, 2u);
    }

  }
  if (-[IMDRelayServiceController isSMSRelayEnabled](self, "isSMSRelayEnabled"))
  {
    v20 = (__CFDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v15);
    CFDictionarySetValue(v20, IMDRelayMessageDictionaryForcedShowOnlyKey, MEMORY[0x1E0C9AAB0]);
    JWEncodeDictionary();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = IMOSLoggingEnabled(v48);
    v47 = v15;
    v44 = v18;
    v45 = v17;
    v42 = v20;
    v43 = self;
    if (v11)
    {
      if (v21)
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "forwardMessageToPeers: Not compressing data", v51, 2u);
        }

      }
      v23 = v48;
    }
    else
    {
      if (v21)
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v50 = 0;
          _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "forwardMessageToPeers: Compressing data", v50, 2u);
        }

      }
      v23 = (id)objc_msgSend(v48, "_FTCopyGzippedData");
    }
    v25 = v23;
    v40 = (void *)MEMORY[0x1E0C99E08];
    v39 = *MEMORY[0x1E0D341D8];
    v26 = *MEMORY[0x1E0D341C0];
    v27 = *MEMORY[0x1E0D34150];
    v46 = v16;
    IDSGetUUIDData();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0D341E0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0D34138];
    v32 = *MEMORY[0x1E0D34148];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v25;
    objc_msgSend(v40, "dictionaryWithObjectsAndKeys:", v39, MEMORY[0x1E0C9AAB0], v26, MEMORY[0x1E0C9AAA0], v27, v28, v29, v30, v31, v25, v32, v33, CFSTR("_SMSServiceRelayToWatchOnly"), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v44;
    if (objc_msgSend(v44, "count"))
      objc_msgSend(v34, "setObject:forKey:", v44, CFSTR("requiredCapabilitiesForSMSRelay"));
    objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v45;
    -[IMDRelayServiceController sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:sentToDevices:](v43, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:sentToDevices:", v34, v35, 1, 0, v45, a9);

    -[IMDRelayServiceController localDevice](v43, "localDevice");
    v36 = objc_claimAutoreleasedReturnValue();
    v16 = v46;
    v15 = v47;
    if (v36)
    {
      v37 = (void *)v36;
      v38 = -[IMDRelayServiceController isLocalDeviceProxyRegistered](v43, "isLocalDeviceProxyRegistered");

      if (!v38)
        -[IMDRelayServiceController _relayMessageToPairedDevice:messageID:hasAttachments:](v43, "_relayMessageToPairedDevice:messageID:hasAttachments:", v42, v46, a4 == 144);
    }

  }
}

- (BOOL)_canRelayMessage:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  BOOL v6;
  uint8_t v8[16];

  v3 = a3;
  v4 = objc_msgSend(v3, "isTypingMessage");
  if ((v4 & 1) != 0 || (v4 = objc_msgSend(v3, "isSuggestedActionResponse"), (_DWORD)v4))
  {
    if (IMOSLoggingEnabled(v4))
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Not relaying message to peers, typing indicators unsupported at this time", v8, 2u);
      }

    }
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int64_t)_maxWatchTransferSize
{
  return 0x80000;
}

- (BOOL)_needsLowQualityTranscodeForMessage:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDRelayServiceController localDevice](self, "localDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v4, "isFromMe") & 1) == 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "fileTransferGUIDs", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "attachmentWithGUID:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v14, "isInThumbnailState") & 1) == 0)
          {
            v15 = objc_msgSend(v14, "totalBytes");
            if (v15 > -[IMDRelayServiceController _maxWatchTransferSize](self, "_maxWatchTransferSize"))
            {

              v6 = 1;
              goto LABEL_15;
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_15:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)relayMessageToPeers:(id)a3 forChat:(id)a4 serviceName:(id)a5 reflectOnly:(BOOL)a6 requiredCapabilities:(id)a7
{
  uint64_t v8;
  id v12;
  _BOOL8 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  id v26;
  BOOL v27;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  _BOOL4 v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  IMDRelayServiceController *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  char v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v8 = a6;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v33 = a4;
  v34 = a5;
  v35 = a7;
  v13 = -[IMDRelayServiceController _needsLowQualityTranscodeForMessage:](self, "_needsLowQualityTranscodeForMessage:", v12);
  v32 = v13;
  if (v13)
  {
    v31 = v8;
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "guid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = v15;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Message %@ needs LQ transcode to go to watch - we will relay a low-quality transcoded result to the watch", buf, 0xCu);

      }
    }
    +[IMDAttachmentStore sharedInstance](IMDAttachmentStore, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileTransferGUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attachmentWithGUID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDRelayTranscodeController sharedInstance](IMDRelayTranscodeController, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transcoderUserInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "isSticker");
    v24 = -[IMDRelayServiceController _maxWatchTransferSize](self, "_maxWatchTransferSize");
    v25 = -[IMDRelayServiceController _maxWatchTransferSize](self, "_maxWatchTransferSize");
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_1D1544FBC;
    v36[3] = &unk_1E922CDF8;
    v37 = v19;
    v38 = self;
    v39 = v12;
    v40 = v33;
    v41 = v34;
    v42 = v35;
    v43 = v31;
    v26 = v19;
    objc_msgSend(v30, "transcodeFileTransferContents:utiType:target:transcoderUserInfo:isSticker:highQualityMaxByteSize:lowQualityMaxByteSize:representations:completionBlock:", v20, v21, 1, v22, v23, v24, v25, 0, v36);

    v8 = v31;
  }
  LOBYTE(v29) = 0;
  v27 = -[IMDRelayServiceController _relayMessageToPeers:forChat:serviceName:requiredCapabilities:reflectOnly:excludesWatch:onlyWatch:overridingAttachmentData:](self, "_relayMessageToPeers:forChat:serviceName:requiredCapabilities:reflectOnly:excludesWatch:onlyWatch:overridingAttachmentData:", v12, v33, v34, v35, v8, v32, v29, 0);

  return v27;
}

- (BOOL)_relayMessageToPeers:(id)a3 forChat:(id)a4 serviceName:(id)a5 requiredCapabilities:(id)a6 reflectOnly:(BOOL)a7 excludesWatch:(BOOL)a8 onlyWatch:(BOOL)a9 overridingAttachmentData:(id)a10
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v10 = a8;
  v43 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a10;
  if (-[IMDRelayServiceController _canRelayMessage:](self, "_canRelayMessage:", v15)
    && (objc_msgSend(v16, "isChatBot") & 1) == 0)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v37 = _os_activity_create(&dword_1D1413000, "com.apple.messages.SMSRelaySend", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v37, &state);
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v15, "isFromMe"))
    {
      v20 = 1;
      LOBYTE(v33) = 0;
      -[IMDRelayServiceController relayMessage:chat:didSendSMS:attemptingReplication:forceReflection:relayToWatchOnly:shouldDisableScreenTimeRestrictions:callerID:iMessageCapability:requiredCapabilities:](self, "relayMessage:chat:didSendSMS:attemptingReplication:forceReflection:relayToWatchOnly:shouldDisableScreenTimeRestrictions:callerID:iMessageCapability:requiredCapabilities:", v15, v16, 1, 0, 0, 0, v33, 0, 0, v18);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_convertIMMessageItemToIncomingRelayDictionary:chat:overridingAttachmentData:", v15, v16, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(v21, "addEntriesFromDictionary:", v22);
        v36 = v22;
        objc_msgSend(v16, "participants");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[IMDRelayServiceController _convertIMDHandlesToArrayOfIDs:](IMDRelayServiceController, "_convertIMDHandlesToArrayOfIDs:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_msgSend(v24, "count");
        if (v25)
        {
          if (IMOSLoggingEnabled(v25))
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v15, "guid");
              v27 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v40 = v27;
              v41 = 2112;
              v42 = v24;
              v34 = (void *)v27;
              _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "Recipients when trying to relay incoming message %@, %@", buf, 0x16u);

            }
          }
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, IMDCTMessageDictionaryReceipientsKey);
        }
        else if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "guid");
            v31 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v40 = v31;
            v35 = (void *)v31;
            _os_log_impl(&dword_1D1413000, v30, OS_LOG_TYPE_INFO, "No recipients when trying to relay incoming message %@", buf, 0xCu);

          }
        }
        v20 = -[IMDRelayServiceController relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:](self, "relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:", v21, objc_msgSend(MEMORY[0x1E0D39730], "shouldUploadToMMCS:", v21), v17, v18, v10, a9);

        v22 = v36;
      }
      else
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "guid");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v40 = (uint64_t)v29;
            _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "No message dictionary when trying to relay %@", buf, 0xCu);

          }
        }
        v20 = 0;
      }

    }
    os_activity_scope_leave(&state);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5
{
  return -[IMDRelayServiceController relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:](self, "relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:", a3, a4, a5, 0, 0, 0);
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5 requiredCapabilities:(id)a6
{
  return -[IMDRelayServiceController relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:](self, "relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:", a3, a4, a5, a6, 0, 0);
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5 requiredCapabilities:(id)a6 excludesWatch:(BOOL)a7 onlyWatch:(BOOL)a8
{
  NSObject *v10;
  const __CFString *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v37;
  uint64_t HasMultipleSubscriptions;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  int v61;
  uint64_t v62;
  NSObject *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  NSObject *v84;
  const __CFString *v85;
  void *v86;
  BOOL v87;
  uint64_t v88;
  NSObject *v89;
  __CFString **v90;
  void *v91;
  BOOL v92;
  __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  _BOOL4 v98;
  _BOOL4 v99;
  _BOOL4 v100;
  id v101;
  id v102;
  __CFDictionary *v103;
  void *v105;
  __CFDictionary *theDict;
  _QWORD v107[4];
  id v108;
  id v109;
  __CFDictionary *v110;
  id v111;
  IMDRelayServiceController *v112;
  id v113;
  BOOL v114;
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
  _QWORD v127[2];
  _QWORD v128[2];
  __CFString *v129;
  __CFDictionary *v130;
  _BYTE v131[128];
  uint8_t v132[128];
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  const __CFString *v136;
  void *v137;
  _BYTE v138[128];
  uint64_t v139;

  v98 = a8;
  v99 = a7;
  v100 = a4;
  v139 = *MEMORY[0x1E0C80C00];
  v103 = (__CFDictionary *)a3;
  v101 = a5;
  v102 = a6;
  if (IMOSLoggingEnabled(v102))
  {
    OSLogHandleForIMEventCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v100)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v134 = (void *)v11;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Trying to relay dictionary to peers, requiresUpload: %@", buf, 0xCu);
    }

  }
  v12 = -[IMDRelayServiceController hasPeerDevices](self, "hasPeerDevices");
  if (!v12)
  {
    if (IMOSLoggingEnabled(v12))
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, " => Not sending data for received message, we have no peer devices", buf, 2u);
      }
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  -[IMDRelayServiceController enrollmentController](self, "enrollmentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_allowedDevicesforSMSRelay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") == 0;

  if (v15)
  {
    if (IMOSLoggingEnabled(v16))
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, " => Not sending data for received message, we have no devices on the allowed list", buf, 2u);
      }
      goto LABEL_38;
    }
LABEL_39:
    v35 = 0;
    goto LABEL_40;
  }
  v17 = -[IMDRelayServiceController isSMSRelayEnabled](self, "isSMSRelayEnabled");
  if (!v17)
  {
    if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v34, OS_LOG_TYPE_INFO, " => Not sending data for received message, smsRelay not enabled", buf, 2u);
      }
LABEL_38:

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x1E0D34CC8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKey:](v103, "objectForKey:", IMDCTMessageDictionarySenderKey);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isPhoneNumberEmergencyNumber:", v19);

  if (v20)
  {
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    -[IMDRelayServiceController relayService](self, "relayService");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "devices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v124;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v124 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          v137 = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v137, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[IMDRelayServiceController _isConnectedOverBT:](self, "_isConnectedOverBT:", v27);

          v30 = IMOSLoggingEnabled(v29);
          if (v28)
          {
            if (v30)
            {
              OSLogHandleForIMFoundationCategory();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v134 = v26;
                v135 = 2112;
                v136 = CFSTR("YES");
                _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "This message is from an emergency number, but we have a Watch connected over BT %@, relaying message %@", buf, 0x16u);
              }

            }
            goto LABEL_46;
          }
          if (v30)
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v134 = v26;
              _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "This message is from an emergency number, not relaying to peer %@", buf, 0xCu);
            }

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v123, v138, 16);
        if (v23)
          continue;
        break;
      }
    }

    if (IMOSLoggingEnabled(v32))
    {
      OSLogHandleForIMFoundationCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "No watch paired connected over Bluetooth, skipping relaying emergency SMS", buf, 2u);
      }

    }
    goto LABEL_39;
  }
LABEL_46:
  HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  if (!(_DWORD)HasMultipleSubscriptions)
  {
    theDict = v103;
    goto LABEL_70;
  }
  theDict = (__CFDictionary *)-[__CFDictionary mutableCopy](v103, "mutableCopy");
  -[__CFDictionary _stringForKey:](v103, "_stringForKey:", IMDCTMessageDictionaryOriginatedDeviceSIMKey);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "registeredSIMIDs");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v42 = v41;
  v43 = -[__CFString countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
  if (v43)
  {
    v44 = 0;
    v45 = *(_QWORD *)v120;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v120 != v45)
          objc_enumerationMutation(v42);
        v47 = objc_msgSend(v39, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j));
        if ((_DWORD)v47)
        {
          if (IMOSLoggingEnabled(v47))
          {
            OSLogHandleForIMFoundationCategory();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v134 = v39;
              v135 = 2112;
              v136 = v42;
              _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "Setting iMessageCapability to iMessageCapabilityAble on relay dict because message received on simID %@ is one of the registered simIDs %@", buf, 0x16u);
            }

          }
          CFDictionarySetValue(theDict, IMDRelayMessageDictionaryiMessageCapability, &unk_1E92714B8);
          v44 = 1;
        }
      }
      v43 = -[__CFString countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
    }
    while (v43);

    if ((v44 & 1) != 0)
      goto LABEL_69;
  }
  else
  {

  }
  if (IMOSLoggingEnabled(v49))
  {
    OSLogHandleForIMFoundationCategory();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v134 = v39;
      v135 = 2112;
      v136 = v42;
      _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "Setting iMessageCapability to iMessageCapabilityUnable on relay dict because message received on simID %@ isn't one of the registered simIDs %@", buf, 0x16u);
    }

  }
  CFDictionarySetValue(theDict, IMDRelayMessageDictionaryiMessageCapability, &unk_1E92714D0);
LABEL_69:

LABEL_70:
  if (IMOSLoggingEnabled(HasMultipleSubscriptions))
  {
    OSLogHandleForIMFoundationCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      -[__CFDictionary objectForKey:](theDict, "objectForKey:", IMDCTMessageDictionaryReceipientsKey);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v134 = v52;
      _os_log_impl(&dword_1D1413000, v51, OS_LOG_TYPE_INFO, "Recipients: %@", buf, 0xCu);

    }
  }
  v118 = 0u;
  v116 = 0u;
  v117 = 0u;
  v115 = 0u;
  -[__CFDictionary objectForKey:](theDict, "objectForKey:", IMDCTMessageDictionaryReceipientsKey);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
  v55 = v54;
  if (v54)
  {
    v56 = *(_QWORD *)v116;
    while (2)
    {
      v57 = 0;
      do
      {
        if (*(_QWORD *)v116 != v56)
          objc_enumerationMutation(v53);
        v58 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v57);
        if (IMOSLoggingEnabled(v54))
        {
          OSLogHandleForIMFoundationCategory();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v134 = v58;
            _os_log_impl(&dword_1D1413000, v59, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0D34CC8], "sharedInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isPhoneNumberEmergencyNumber:", v58);

        if (v61)
        {
          if (IMOSLoggingEnabled(v54))
          {
            OSLogHandleForIMFoundationCategory();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v65, OS_LOG_TYPE_INFO, "One of the recipients was an emergency number, this message should not be relayed", buf, 2u);
            }

          }
          v35 = 0;
          goto LABEL_130;
        }
        ++v57;
      }
      while (v55 != v57);
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
      v55 = v54;
      if (v54)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled(v62))
  {
    OSLogHandleForIMEventCategory();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v63, OS_LOG_TYPE_INFO, " Going to forward our received Message onto our other peers", buf, 2u);
    }

  }
  v64 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v99)
  {
    -[IMDRelayServiceController pairedDevice](self, "pairedDevice");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v105 = 0;
  }
  if (v100)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "im_randomTemporaryFileURLWithFileName:", IMDRelayDownloadUploadTemporaryPathKey);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "path");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = IMOSLoggingEnabled(-[__CFDictionary writeToFile:atomically:](theDict, "writeToFile:atomically:", v68, 1));
    if ((_DWORD)v69)
    {
      OSLogHandleForIMFoundationCategory();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v134 = v68;
        _os_log_impl(&dword_1D1413000, v70, OS_LOG_TYPE_INFO, "Saved File to Path %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled(v69))
    {
      OSLogHandleForIMFoundationCategory();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v71, OS_LOG_TYPE_INFO, "Starting Upload to MMCS Now", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39CD8], "sharedInstance");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = *MEMORY[0x1E0D34230];
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = sub_1D1546748;
    v107[3] = &unk_1E922CE20;
    v108 = v64;
    v109 = v101;
    v110 = theDict;
    v114 = v98;
    v111 = v102;
    v112 = self;
    v113 = v105;
    objc_msgSend(v72, "sendFilePath:topic:userInfo:transferID:encryptFile:progressBlock:completionBlock:", v68, v73, 0, v68, 1, 0, v107);

    v35 = 0;
    v74 = v108;
  }
  else
  {
    objc_msgSend(v64, "addEntriesFromDictionary:", theDict);
    JWEncodeDictionary();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = (void *)objc_msgSend(v68, "_FTCopyGzippedData");
    v75 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 140);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKey:](theDict, "objectForKey:", IMDCTMessageDictionaryGUIDKey);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    IDSGetUUIDData();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v98);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D341D8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341C0], v76, *MEMORY[0x1E0D34138], v78, *MEMORY[0x1E0D341E0], v74, *MEMORY[0x1E0D34148], v79, *MEMORY[0x1E0D341C8], CFSTR("_SMSServiceRelayToWatchOnly"), v80, 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v102, "count"))
      objc_msgSend(v81, "setObject:forKey:", v102, CFSTR("requiredCapabilitiesForSMSRelay"));
    objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[IMDRelayServiceController sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:](self, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:", v81, v82, 1, 0, v105);

  }
  if (IMOSLoggingEnabled(v83))
  {
    OSLogHandleForIMFoundationCategory();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      v85 = CFSTR("NO");
      if (v100)
        v85 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v134 = (void *)v85;
      _os_log_impl(&dword_1D1413000, v84, OS_LOG_TYPE_INFO, "Relaying to local device, requiresUpload %@", buf, 0xCu);
    }

  }
  if (v99)
    goto LABEL_129;
  if (v100)
  {
    -[IMDRelayServiceController localDevice](self, "localDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86 == 0;

    if (!v87)
    {
      if (IMOSLoggingEnabled(v88))
      {
        OSLogHandleForIMFoundationCategory();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138739971;
          v134 = theDict;
          _os_log_impl(&dword_1D1413000, v89, OS_LOG_TYPE_INFO, "Relaying dict containing MMS to local device. %{sensitive}@ ", buf, 0xCu);
        }

      }
      v90 = &IMDRelayLocalMessageTypeIncomingDownloadMessage;
      goto LABEL_128;
    }
  }
  -[IMDRelayServiceController localDevice](self, "localDevice");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = -[IMDRelayServiceController isLocalDeviceProxyRegistered](self, "isLocalDeviceProxyRegistered");

    if (!v92)
    {
      v90 = &IMDRelayLocalMessageTypeIncomingTextMessage;
LABEL_128:
      v93 = *v90;
      v129 = IMDRelayLocalMessageDictionaryIncomingDictKey;
      v130 = theDict;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      JWEncodeDictionary();
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = (void *)objc_msgSend(v95, "_FTCopyGzippedData");
      v127[0] = IMDRelayLocalMessageDictionaryDictKey;
      v127[1] = IMDRelayLocalMessageDictionaryTypeKey;
      v128[0] = v96;
      v128[1] = v93;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayServiceController sendToLocalPeers:](self, "sendToLocalPeers:", v97);

    }
  }
LABEL_129:

LABEL_130:
  v103 = theDict;
LABEL_40:

  return v35;
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudKitSyncingEnabled");

  if ((v9 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Forwarding delete command to all other devices", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[IMDRelayServiceController pairedDevice](self, "pairedDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = IMOSLoggingEnabled(v13);
  if (v12)
  {
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Send delete command only to the paired device", buf, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "existingChatWithGUID:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      JWEncodeDictionary();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "_FTCopyGzippedData");

      if (IMOSLoggingEnabled(v19))
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v6;
          _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Forwarding delete command :%@", buf, 0xCu);
        }

      }
      v21 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 181);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0D341D8], MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341C0], v22, *MEMORY[0x1E0D34138], v18, *MEMORY[0x1E0D34148], v23, *MEMORY[0x1E0D341C8], 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v9 & 1) != 0)
        -[IMDRelayServiceController _sendMessageToAllSMSRelayDevicesWithOptions:](self, "_sendMessageToAllSMSRelayDevicesWithOptions:", v24);
      else
        -[IMDRelayServiceController _sendMessageToPairedDeviceWithOptions:](self, "_sendMessageToPairedDeviceWithOptions:", v24);

    }
    goto LABEL_21;
  }
  if (v14)
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "iCloud syncing not enbabled droping delete command to all other devices, (command %@)", buf, 0xCu);
    }

  }
LABEL_21:

}

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[5];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudKitSyncingEnabled");

  if ((v9 & 1) != 0)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Forwarding recover command to all other devices", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[IMDRelayServiceController pairedDevice](self, "pairedDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = IMOSLoggingEnabled(v13);
  if (v12)
  {
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Send recover command only to the paired device", buf, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "existingChatWithGUID:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      JWEncodeDictionary();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "_FTCopyGzippedData");

      if (IMOSLoggingEnabled(v20))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v6;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "Forwarding recover command :%@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0], *MEMORY[0x1E0D341D8], *MEMORY[0x1E0D341C0], *MEMORY[0x1E0D34138], *MEMORY[0x1E0D34148], *MEMORY[0x1E0D341C8], MEMORY[0x1E0C9AAB0], MEMORY[0x1E0C9AAB0], &unk_1E92714E8, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27[4] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v9 & 1) != 0)
        -[IMDRelayServiceController _sendMessageToAllSMSRelayDevicesWithOptions:](self, "_sendMessageToAllSMSRelayDevicesWithOptions:", v23);
      else
        -[IMDRelayServiceController _sendMessageToPairedDeviceWithOptions:](self, "_sendMessageToPairedDeviceWithOptions:", v23);

    }
    else if (IMOSLoggingEnabled(v17))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v7;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Recently Deleted | Early returning: SMSService recoverCommand - chat not found for GUID: %@", buf, 0xCu);
      }

    }
    goto LABEL_25;
  }
  if (v14)
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v6;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "iCloud syncing not enbabled droping recover command to all other devices, (command %@)", buf, 0xCu);
    }

  }
LABEL_25:

}

- (void)sendEditedMessage:(id)a3 toChat:(id)a4 fromCallerID:(id)a5 backwardCompatabilityText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPriusEnabled");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isPriusCompatibilityEnabled");

    if (v17)
    {
      v18 = (void *)objc_msgSend(v10, "copyForBackwardsCompatibility");
      if (IMOSLoggingEnabled(objc_msgSend(v18, "setBody:", v13)))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v24 = 138412290;
          v25 = v18;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Device doesn't support SMS, sending backwards compatibility edit to relay devices: %@", (uint8_t *)&v24, 0xCu);
        }

      }
      +[IMDRelayServiceController _convertIMMessageItemToOutgoingRelayDictionary:chat:](IMDRelayServiceController, "_convertIMMessageItemToOutgoingRelayDictionary:chat:", v18, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "guid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "participants");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDRelayServiceController _convertIMDHandlesToArray:](IMDRelayServiceController, "_convertIMDHandlesToArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayServiceController _relayEditedMessage:messageGUID:serializedHandles:chatStyle:callerID:](self, "_relayEditedMessage:messageGUID:serializedHandles:chatStyle:callerID:", v20, v21, v23, objc_msgSend(v11, "style"), v12);

    }
  }

}

- (void)relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10 iMessageCapability:(int64_t)a11 requiredCapabilities:(id)a12
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  __CFDictionary *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *value;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v33 = a8;
  v34 = a7;
  v12 = a6;
  v32 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v35 = a10;
  v17 = a12;
  if (IMOSLoggingEnabled(v17))
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "We have peer devices, relaying message...", buf, 2u);
    }

  }
  objc_msgSend(v15, "balloonBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D375F8]);

  objc_msgSend(v15, "fileTransferGUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
    v22 = v20 ^ 1;
  else
    v22 = 0;

  if (v15 && -[IMDRelayServiceController _canRelayMessage:](self, "_canRelayMessage:", v15))
  {
    v23 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v16, "participants");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMDRelayServiceController _convertIMDHandlesToArray:](IMDRelayServiceController, "_convertIMDHandlesToArray:", v24);
    value = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDRelayServiceController _convertIMMessageItemToOutgoingRelayDictionary:chat:](IMDRelayServiceController, "_convertIMMessageItemToOutgoingRelayDictionary:chat:", v15, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      CFDictionarySetValue(v23, IMDRelayMessageItemDictionary, v25);
      if (value)
        CFDictionarySetValue(v23, IMDCTMessageDictionaryReceipientsKey, value);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryiMessageCapability, v26);

      if (v12)
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryAttemptedOutgoingReplicationKey, MEMORY[0x1E0C9AAB0]);
      if (v34)
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryForcedShowOnlyKey, MEMORY[0x1E0C9AAB0]);
      sub_1D14435A8(objc_msgSend(v16, "style"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryChatStyleKey, v27);
      objc_msgSend(v15, "guid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v30) = v22;
      -[IMDRelayServiceController _relayMessageDict:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:](self, "_relayMessageDict:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:", v23, v28, v35, v32, v33, a9, v30, v17);

    }
    else if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v15;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Failed to create an Message Dictionary from the IM Message, Original Message: %@", buf, 0xCu);
      }

    }
  }

}

- (void)sendReadReceiptForMessage:(id)a3 toChat:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_sendReadReceiptForMessage_toChat_reflectOnly_);
}

- (void)sendReadReceiptForMessage:(id)a3 toChat:(id)a4 reflectOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "guid");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeRead");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDRelayServiceController sendReadReceiptForMessageGUID:timeRead:reflectOnly:](self, "sendReadReceiptForMessageGUID:timeRead:reflectOnly:", v9, v8, v5);
}

- (void)sendReadReceiptForMessageGUID:(id)a3 timeRead:(id)a4
{
  -[IMDRelayServiceController sendReadReceiptForMessageGUID:timeRead:reflectOnly:](self, "sendReadReceiptForMessageGUID:timeRead:reflectOnly:", a3, a4, 0);
}

- (void)sendReadReceiptForMessageGUID:(id)a3 timeRead:(id)a4 reflectOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v5 = a5;
  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = IMOSLoggingEnabled(v9);
  if ((_DWORD)v10)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Marking message as read: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  if (!v9)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Trying to mark with a nil timeRead, setting to [NSDate now]: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, IMDRelayMessageDictionaryTimeReadKey);
  if (v5)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], IMDRelayMessageDictionaryForcedShowOnlyKey);
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:shouldFilterRecipients:forcedCallerID:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:shouldFilterRecipients:forcedCallerID:", 147, IMDRelayLocalMessageTypeRead, v8, v13, 0, 0);

}

- (void)messageSent:(id)a3 onService:(id)a4 compatibilityService:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been sent", (uint8_t *)&v14, 0xCu);
    }

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, IMDRelayMessageItemDictionaryServiceKey);
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, IMDRelayMessageItemDictionaryCompatibilityServiceKey);
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:", 146, IMDRelayLocalMessageTypeSent, v8, v13);

}

- (void)messageDelivered:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been delivered", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:", 101, IMDRelayLocalMessageTypeDelivered, v4);

}

- (void)messageReadByRemote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "guid");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeRead");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDRelayServiceController messageGUIDReadByRemote:timeRead:](self, "messageGUIDReadByRemote:timeRead:", v6, v5);
}

- (void)messageGUIDReadByRemote:(id)a3 timeRead:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been read", buf, 0xCu);
    }

  }
  v9 = IMDRelayLocalMessageTypeRemoteRead;
  v11 = IMDRelayMessageDictionaryTimeReadKey;
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:", 102, v9, v6, v10);

}

- (void)messageFailedToSend:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has failed to send", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:", 149, IMDRelayLocalMessageTypeError, v4);

}

- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5
{
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:", a3, a4, a5, 0);
}

- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5 messageExtras:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = (void *)MEMORY[0x1E0D39730];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  objc_msgSend(v10, "myCTPhoneNumber");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController _broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:shouldFilterRecipients:forcedCallerID:](self, "_broadcastMessageEventWithCommand:eventName:forGUID:messageExtras:shouldFilterRecipients:forcedCallerID:", a3, v13, v12, v11, 1, v14);

}

- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5 messageExtras:(id)a6 shouldFilterRecipients:(BOOL)a7 forcedCallerID:(id)a8
{
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _BOOL4 v31;
  id v33;

  v31 = a7;
  v33 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99E08];
  v29 = a8;
  v30 = a4;
  v14 = objc_alloc_init(v13);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, IMDRelayMessageDictionaryGUIDKey);
  if (v12)
    objc_msgSend(v14, "addEntriesFromDictionary:", v12);
  JWEncodeDictionary();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v28, "_FTCopyGzippedData");
  v26 = (void *)MEMORY[0x1E0C99E08];
  v25 = *MEMORY[0x1E0D341D8];
  v16 = *MEMORY[0x1E0D341C0];
  v17 = *MEMORY[0x1E0D34150];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0D34138];
  IDSGetUUIDData();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  v21 = *MEMORY[0x1E0D341E0];
  v22 = *MEMORY[0x1E0D34148];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D348E0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v25, MEMORY[0x1E0C9AAB0], v16, MEMORY[0x1E0C9AAA0], v17, v18, v19, v20, v21, v15, v22, v23, *MEMORY[0x1E0D341C8], 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDRelayServiceController sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:](self, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:", v24, v29, v31, 0, 0);
  -[IMDRelayServiceController _forwardMessageEventToLocalPeers:forGUID:metadata:](self, "_forwardMessageEventToLocalPeers:forGUID:metadata:", v30, v33, v27);

}

- (void)_forwardMessageEventToLocalPeers:(id)a3 forGUID:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[IMDRelayServiceController localDevice](self, "localDevice");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = -[IMDRelayServiceController isLocalDeviceProxyRegistered](self, "isLocalDeviceProxyRegistered");

    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, IMDRelayLocalMessageDictionaryGUIDKey);
      if (v10)
        objc_msgSend(v14, "addEntriesFromDictionary:", v10);
      JWEncodeDictionary();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "_FTCopyGzippedData");
      v18[0] = IMDRelayLocalMessageDictionaryDictKey;
      v18[1] = IMDRelayLocalMessageDictionaryTypeKey;
      v19[0] = v16;
      v19[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDRelayServiceController sendToLocalPeers:](self, "sendToLocalPeers:", v17);

    }
  }

}

- (BOOL)sendEnrollmentRelatedMessageOverIDS:(id)a3 deviceToSendTo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  __CFDictionary *Mutable;
  void *v17;
  __CFDictionary *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  const __CFString *v29;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  -[IMDRelayServiceController relayService](self, "relayService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accounts");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = -[IMDRelayServiceController retrieveAccountAndPhoneAliasForAccounts:shouldFilterRecepients:requestProxySend:preferredCallerID:](self, "retrieveAccountAndPhoneAliasForAccounts:shouldFilterRecepients:requestProxySend:preferredCallerID:", v32, 0, 0, 0);
  objc_msgSend(v31, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v33 = v8;
  }
  else
  {
    objc_msgSend(v34, "linkedUserURIs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMDRelayServiceController relayService](self, "relayService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDRelayServiceController accountForAlias:fromAccounts:](self, "accountForAlias:fromAccounts:", v9, v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "This is a non telphony device trying to enroll itself into SMS Relay", buf, 2u);
      }

    }
  }
  -[IMDRelayServiceController _destinationForDevice:forcedIdentity:](self, "_destinationForDevice:forcedIdentity:", v34, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (__CFDictionary *)objc_msgSend(v6, "mutableCopy");
  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v17 = (void *)IDSCopyIDForPhoneNumber();
  if (v17)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D34178], v17);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166AD38();
  }

  v18 = Mutable;
  -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
  v19 = (void *)MEMORY[0x1E0D39888];
  -[IMDRelayServiceController relayService](self, "relayService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "__imSetFromArray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = 0;
  v24 = objc_msgSend(v19, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v20, v21, v33, v23, 300, v18, &v36, &v35);
  v25 = v36;
  v26 = v35;

  if (IMOSLoggingEnabled(v27))
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      v38 = v9;
      if (v24)
        v29 = CFSTR("YES");
      v39 = 2112;
      v40 = v29;
      v41 = 2112;
      v42 = v26;
      v43 = 2112;
      v44 = v33;
      v45 = 2112;
      v46 = v25;
      _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "SMS relay Enrollment data sent to: %@   success: %@   error: %@   account: %@  identifier %@", buf, 0x34u);
    }

  }
  return v24;
}

- (void)reflectGroupMutation:(id)a3 callerID:(id)a4 didOccurLocally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v5 = a5;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "createDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  JWEncodeDictionary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "_FTCopyOptionallyGzippedData");
  v17[0] = CFSTR("D");
  v17[1] = CFSTR("C");
  v18[0] = v12;
  v18[1] = &unk_1E9271500;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v16) = 0;
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:", v13, 190, v15, v8, v5, 0, v16, 0);

}

- (id)_extraOptionsForReachabilityRelayWithRequestID:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D341C8];
  v8[0] = *MEMORY[0x1E0D34160];
  v8[1] = v3;
  v9[0] = MEMORY[0x1E0C9AAB0];
  v9[1] = &unk_1E9271518;
  v8[2] = *MEMORY[0x1E0D341A8];
  v9[2] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sendReachabilityRequest:(id)a3 requestID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "createDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  JWEncodeDictionary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "_FTCopyOptionallyGzippedData");
  v19[0] = CFSTR("D");
  v19[1] = CFSTR("C");
  v20[0] = v10;
  v20[1] = &unk_1E92714B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "senderLastAddressedHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)MEMORY[0x1E0C9AA60];
  -[IMDRelayServiceController _extraOptionsForReachabilityRelayWithRequestID:](self, "_extraOptionsForReachabilityRelayWithRequestID:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v17) = 0;
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:", v11, 190, v6, v13, 0, 0, v17, &v18, v14, 0);

  v15 = v18;
  return v15;
}

- (void)sendReachabilityResponse:(id)a3 requestID:(id)a4 toToken:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v11 = a7;
  v12 = a5;
  v13 = a4;
  objc_msgSend(a3, "createDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  JWEncodeDictionary();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = CFSTR("D");
  v38[1] = CFSTR("C");
  v33 = (void *)objc_msgSend(v34, "_FTCopyOptionallyGzippedData");
  v39[0] = v33;
  v39[1] = &unk_1E92714D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController _sendOptionsForRelayMessage:command:guid:](self, "_sendOptionsForRelayMessage:command:guid:", v14, 190, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D34178]);
  -[IMDRelayServiceController _extraOptionsForReachabilityRelayWithRequestID:](self, "_extraOptionsForReachabilityRelayWithRequestID:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addEntriesFromDictionary:", v17);
  -[IMDRelayServiceController idsDeviceFromPushToken:](self, "idsDeviceFromPushToken:", v12);
  v18 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v18;
  -[IMDRelayServiceController _destinationForDevice:forcedIdentity:](self, "_destinationForDevice:forcedIdentity:", v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController relayService](self, "relayService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController accountForAlias:fromAccounts:](self, "accountForAlias:fromAccounts:", v11, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D39888];
  -[IMDRelayServiceController relayService](self, "relayService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  IMSingleObjectArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "__imSetFromArray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = 0;
  v28 = objc_msgSend(v23, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v24, v25, v22, v27, 300, v16, &v37, &v36);
  v29 = v37;
  v30 = v36;

  if (v30 || (v28 & 1) == 0)
  {
    IMLogHandleForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1D166AE38((uint64_t)v19, v31);

  }
}

+ (IMDRelayServiceController)sharedInstance
{
  if (qword_1ED935F00 != -1)
    dispatch_once(&qword_1ED935F00, &unk_1E922F760);
  return (IMDRelayServiceController *)(id)qword_1ED936148;
}

- (IMDRelayServiceController)init
{
  IMDRelayServiceController *v2;
  IMDRelayServiceController *v3;
  NSObject *v4;
  IMDRelayEnrollmentController *v5;
  IMDRelayEnrollmentController *enrollmentController;
  IMDRelayDeletionController *v7;
  IMDRelayDeletionController *deletionController;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMDRelayServiceController;
  v2 = -[IMDRelayServiceController init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Setting up Relay service", v10, 2u);
      }

    }
    -[IMDRelayServiceController _setupIDSRelayServices](v3, "_setupIDSRelayServices");
    -[IMDRelayServiceController updateRelayStatus](v3, "updateRelayStatus");
    -[IMDRelayServiceController _registerForAccountChanges](v3, "_registerForAccountChanges");
    -[IMDRelayServiceController _setupMMSObservation](v3, "_setupMMSObservation");
    v5 = -[IMDRelayEnrollmentController initWithServiceDelegate:dispatchDelegate:]([IMDRelayEnrollmentController alloc], "initWithServiceDelegate:dispatchDelegate:", v3, v3);
    enrollmentController = v3->_enrollmentController;
    v3->_enrollmentController = v5;

    v7 = objc_alloc_init(IMDRelayDeletionController);
    deletionController = v3->_deletionController;
    v3->_deletionController = v7;

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[16];

  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }

  }
  -[IMDRelayServiceController _teardownMMSObservation](self, "_teardownMMSObservation");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, 0, 0);

  v5.receiver = self;
  v5.super_class = (Class)IMDRelayServiceController;
  -[IMDRelayServiceController dealloc](&v5, sel_dealloc);
}

- (NSArray)accounts
{
  void *v3;
  void *v4;

  -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
  -[IMDRelayServiceController relayService](self, "relayService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)updateRelayStatus
{
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[IMDRelayServiceController hasRelayDevice](self, "hasRelayDevice"))
    v3 = -[IMDRelayServiceController _hasPhoneNumberAliasActive](self, "_hasPhoneNumberAliasActive");
  else
    v3 = 0;
  v4 = IMGetDomainBoolForKey();
  v5 = v4;
  v6 = IMOSLoggingEnabled(v4);
  if ((_DWORD)v6)
  {
    OSLogHandleForIMEventCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v5)
        v8 = CFSTR("YES");
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Status Of Remote Approval for Relay is %@", (uint8_t *)&v16, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMEventCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Does this device have SMS Relay capable devices on its account? %@", (uint8_t *)&v16, 0xCu);
    }

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;
  v13 = *MEMORY[0x1E0D36188];
  if (!v3)
  {
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v13);
    goto LABEL_20;
  }
  objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v13);
  if ((v5 & 1) == 0)
  {
LABEL_20:
    v14 = MEMORY[0x1E0C9AAA0];
    goto LABEL_21;
  }
  v14 = MEMORY[0x1E0C9AAB0];
LABEL_21:
  objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x1E0D36180]);
  objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x1E0D36178]);
  -[IMDRelayServiceController _account](self, "_account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "writeAccountDefaults:", v12);

  -[IMDRelayServiceController updateMMSCapability](self, "updateMMSCapability");
}

- (id)_account
{
  void *v2;
  void *v3;
  void *v4;

  +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anySessionForServiceName:", *MEMORY[0x1E0D38F58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)_callerIDForRelay
{
  void *v3;
  void *v4;

  -[IMDRelayServiceController _callerIDAccountFromSettings](self, "_callerIDAccountFromSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayServiceController _callerIDForRelayAccountID:](self, "_callerIDForRelayAccountID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_callerIDAccountFromSettings
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  IMPreferredAccountMap();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    if (IMOSLoggingEnabled(v2))
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Account Maps Currently Reads  %@", (uint8_t *)&v14, 0xCu);
      }

    }
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D38F68]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      if (IMOSLoggingEnabled(v5))
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v14 = 138412290;
          v15 = v6;
          _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "iMessage Account Current reads  %@", (uint8_t *)&v14, 0xCu);
        }

      }
      objc_msgSend(v6, "objectForKey:", CFSTR("guid"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = IMOSLoggingEnabled(v8);
      if ((_DWORD)v9)
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v14 = 138412290;
          v15 = v8;
          _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "iMessage Caller ID Guid reads  %@", (uint8_t *)&v14, 0xCu);
        }

      }
      if (v8)
      {
        v11 = v8;
      }
      else if (IMOSLoggingEnabled(v9))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Unable to locate CallerID Account in Prefered Account Map", (uint8_t *)&v14, 2u);
        }

      }
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

  return v8;
}

- (BOOL)_canRelayMMS
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[IMDRelayServiceController _account](self, "_account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D36178]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)_localDeviceSupportsSMS
{
  NSObject *v2;
  int v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = IMSMSEnabled();
      v4 = CFSTR("NO");
      if (v3)
        v4 = CFSTR("YES");
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D1413000, v2, OS_LOG_TYPE_INFO, "isSMSEnabled %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return IMSMSEnabled();
}

- (BOOL)_localDeviceSupportsSMSAndHasAPhoneNumber
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = IMSMSEnabled();
      v7 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "isSMSEnabled %@ Has valid Phone Number %@", (uint8_t *)&v10, 0x16u);
    }

  }
  return (v3 != 0) & IMSMSEnabled();
}

- (BOOL)_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ctSubscriptionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__im_subscriptionContextForForSimID:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "phoneNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length") == 0;

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "length") == 0;
  }

  v9 = IMSMSEnabled();
  v10 = v9;
  if (IMOSLoggingEnabled(v9))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      if (v10)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      if (v8)
        v12 = CFSTR("YES");
      v15 = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "isSMSEnabled %@ Does not have phone number to send with %@", (uint8_t *)&v15, 0x16u);
    }

  }
  return v10 & v8;
}

- (id)_IDSService
{
  -[IMDRelayServiceController _checkAndSetRelayService](self, "_checkAndSetRelayService");
  return -[IMDRelayServiceController relayService](self, "relayService");
}

- (void)_prepareSMSRelayBlockForMessageDictionary:(id)a3 messageGUID:(id)a4 serviceName:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location = 0;
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = sub_1D15F3F9C;
  v17 = &unk_1E922F788;
  v11 = v8;
  v18 = v11;
  objc_copyWeak(&v20, &location);
  v12 = v10;
  v19 = v12;
  v13 = _Block_copy(&v14);
  -[IMDRelayServiceController _storeSMSRelayExecutionBlock:forMessageGUID:](self, "_storeSMSRelayExecutionBlock:forMessageGUID:", v13, v9, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (BOOL)_storeSMSRelayExecutionBlock:(id)a3 forMessageGUID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSMutableDictionary *smsRelayBlockMap;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary **p_smsRelayBlockMap;
  NSMutableDictionary *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    -[NSMutableDictionary objectForKey:](self->_smsRelayBlockMap, "objectForKey:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && IMOSLoggingEnabled(v11))
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v23 = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Using existing spam relay mapping from %@ to %@", (uint8_t *)&v23, 0x16u);
      }

    }
    smsRelayBlockMap = self->_smsRelayBlockMap;
    if (!smsRelayBlockMap)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v17 = self->_smsRelayBlockMap;
      p_smsRelayBlockMap = &self->_smsRelayBlockMap;
      *p_smsRelayBlockMap = (NSMutableDictionary *)Mutable;

      smsRelayBlockMap = *p_smsRelayBlockMap;
    }
    v18 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](smsRelayBlockMap, "setObject:forKey:", v18, v7);

    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = _Block_copy(v6);
        v23 = 138412546;
        v24 = v7;
        v25 = 2112;
        v26 = v21;
        _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Generated mapping spam relay from %@ to %@", (uint8_t *)&v23, 0x16u);

      }
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Cannot store spam relay completion block for guid as either guid or completion block is invalid", (uint8_t *)&v23, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3
{
  -[IMDRelayServiceController _executeSMSRelayBlockForMessageWithGUID:category:subCategory:](self, "_executeSMSRelayBlockForMessageWithGUID:category:subCategory:", a3, 0, 0);
}

- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[NSMutableDictionary objectForKey:](self->_smsRelayBlockMap, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, int64_t, int64_t))(v9 + 16))(v9, a4, a5);
    -[IMDRelayServiceController _clearSMSRelayMapForMessageWithGUID:](self, "_clearSMSRelayMapForMessageWithGUID:", v8);
  }
  else if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "_executeSpamRelayCompletionBlockForMessageGuid: %@ Already ran completion block?, not doing anything", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)_clearSMSRelayMapForMessageWithGUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *smsRelayBlockMap;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Clearing SMS relay block mapping for %@", (uint8_t *)&v7, 0xCu);
    }

  }
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_smsRelayBlockMap, "removeObjectForKey:", v4);
    if (!-[NSMutableDictionary count](self->_smsRelayBlockMap, "count"))
    {
      smsRelayBlockMap = self->_smsRelayBlockMap;
      self->_smsRelayBlockMap = 0;

    }
  }

}

- (void)didReceiveMessageError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithGUID:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountForAccountID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anySessionForServiceName:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "didReceiveError:forMessageID:forceError:", 4, v11, 0);

}

+ (id)_convertIMMessageItemToIncomingRelayDictionary:(id)a3 chat:(id)a4 overridingAttachmentData:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v53 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("1"), IMDCTMessageDictionaryVersionKey);
  objc_msgSend(v7, "guid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, IMDCTMessageDictionaryGUIDKey);

  objc_msgSend(v7, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, IMDCTMessageDictionarySubjectKey);

  objc_msgSend(v7, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, IMDCTMessageDictionarySenderKey);

  objc_msgSend(v7, "time");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, IMDCTMessageDictionaryDateKey);

  objc_msgSend(v8, "serviceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, IMDRelayMessageItemDictionaryServiceKey);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", IMDCTMessageDictionaryTypeSMS, IMDCTMessageDictionaryTypeKey);
  objc_msgSend(v8, "participants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDRelayServiceController _convertIMDHandlesToArrayOfIDs:](IMDRelayServiceController, "_convertIMDHandlesToArrayOfIDs:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, IMDCTMessageDictionaryReceipientsKey);

  objc_msgSend(MEMORY[0x1E0D39730], "myCTPhoneNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "ctSubscriptionInfo");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56 && v55)
  {
    objc_msgSend(v55, "__im_subscriptionContextOrDefaultForForSlotID:", objc_msgSend(v56, "slotID"));
    v19 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v19;
  }
  else
  {
    if (!v55
      || (objc_msgSend(v55, "subscriptions"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "count"),
          v20,
          !v21))
    {
      v57 = 0;
      v54 = 0;
      v28 = v17;
      goto LABEL_15;
    }
    objc_msgSend(v55, "subscriptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v57)
  {
    if (IMOSLoggingEnabled(v19))
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v57, "phoneNumber");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "labelID");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v56, "slotID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v64 = v57;
        v65 = 2112;
        v66 = v24;
        v67 = 2112;
        v68 = v25;
        v69 = 2112;
        v70 = v26;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Setting receiving context = %@, phoneNumber = %@, simID = %@ for given slotID %@", buf, 0x2Au);

      }
    }
    objc_msgSend(v57, "phoneNumber");
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "labelID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
  }
  else
  {
    v28 = v17;
    v57 = 0;
    v54 = 0;
  }
LABEL_15:
  v52 = v28;
  objc_msgSend(v9, "setObject:forKeyedSubscript:");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v54, IMDCTMessageDictionaryOriginatedDeviceSIMKey);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "replaceID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, IMDCTMessageDictionaryReplaceMessageKey);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], IMDCTMessageDictionarySendEnabledKey);
  objc_msgSend(v8, "groupID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v8, "groupID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, IMDRelayMessageDictionaryChatGroupIDKey);

  }
  objc_msgSend(v8, "originalGroupID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v8, "originalGroupID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, IMDRelayMessageDictionaryChatOriginalGroupID);

  }
  objc_msgSend(v8, "displayName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v8, "displayName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v35, IMDRelayMessageDictionaryChatDisplayNameKey);

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("s:tel:%@"), v52);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDRelayUtilities relayPartsFor:overridingAttachmentData:](IMDRelayUtilities, "relayPartsFor:overridingAttachmentData:", v7, v53);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v59 != v40)
            objc_enumerationMutation(v38);
          +[IMDXMSUtilities calculateFallbackHashFragmentFor:](IMDXMSUtilities, "calculateFallbackHashFragmentFor:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "appendString:", v42);

        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v39);
    }
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v38, IMDCTMessageDictionaryItemsKey);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, IMDCTMessageDictionaryFallbackHashKey);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E92717B8, IMDRelaySpamSubCategoryKey);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isSMSFilterSyncEnabled");

    if ((v44 & 1) != 0)
    {
      +[IMDFilteringController sharedInstance](IMDFilteringController, "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "_isSpamFilteringEnabled");

      +[IMDFilteringController sharedInstance](IMDFilteringController, "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v47, "_newSMSFilteringSettingsDictForFilterState:", v46);
      objc_msgSend(v9, "addEntriesFromDictionary:", v48);

    }
    v49 = v9;
  }
  else
  {
    if (IMOSLoggingEnabled(0))
    {
      OSLogHandleForIMFoundationCategory();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v50, OS_LOG_TYPE_INFO, "No compatible item(s) found to relay!", buf, 2u);
      }

    }
    v49 = 0;
  }

  return v49;
}

+ (id)_convertIMMessageItemToOutgoingRelayDictionary:(id)a3 chat:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  __CFDictionary *v8;
  void *v9;
  void *v10;
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
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  IMDSuperToRelayMessageParser *v26;
  void *v27;
  IMDSuperToRelayMessageParser *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  NSObject *v38;
  __CFString *v39;
  uint64_t v40;
  int v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  const __CFString *v45;
  int v46;
  __CFDictionary *v47;
  void *v49;
  BOOL v50;
  int v51;
  const __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v51) = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Converting IM Message to NSDictionary", (uint8_t *)&v51, 2u);
    }

  }
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  CFDictionarySetValue(v8, IMDCTMessageDictionaryVersionKey, CFSTR("1"));
  objc_msgSend(v5, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryHandleKey, v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166D22C();
  }

  objc_msgSend(v5, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryServiceKey, v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166D1AC();
  }

  objc_msgSend(v5, "guid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryGUIDKey, v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166D12C();
  }

  -[__CFDictionary objectForKey:](v8, "objectForKey:", IMDRelayMessageItemDictionaryHandleKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    || (-[__CFDictionary objectForKey:](v8, "objectForKey:", IMDRelayMessageItemDictionaryServiceKey),
        (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[__CFDictionary objectForKey:](v8, "objectForKey:", IMDRelayMessageItemDictionaryGUIDKey);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49 == 0;

    if (v50)
    {
      v47 = 0;
      goto LABEL_73;
    }
  }
  objc_msgSend(v5, "body");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryPlainBodyKey, v14);

  objc_msgSend(v5, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionarySubjectKey, v15);

  objc_msgSend(v5, "replyToGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryReplyToGUIDKey, v16);

  objc_msgSend(v5, "time");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryDateKey, v17);

  if (objc_msgSend(v5, "isAudioMessage"))
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryIsAudioMessageKey, MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v6, "groupID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "groupID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v19, IMDRelayMessageDictionaryChatGroupIDKey);

  }
  objc_msgSend(v6, "originalGroupID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "originalGroupID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v21, IMDRelayMessageDictionaryChatOriginalGroupID);

  }
  objc_msgSend(v6, "displayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v6, "displayName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v24, IMDRelayMessageDictionaryChatDisplayNameKey);

  }
  if (IMOSLoggingEnabled(v23))
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(v51) = 0;
      _os_log_impl(&dword_1D1413000, v25, OS_LOG_TYPE_INFO, "Starting parse", (uint8_t *)&v51, 2u);
    }

  }
  v26 = [IMDSuperToRelayMessageParser alloc];
  objc_msgSend(v5, "body");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[IMDSuperToRelayMessageParser initWithAttributedString:](v26, "initWithAttributedString:", v27);

  objc_msgSend(MEMORY[0x1E0D396E0], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "parseContext:", v28);

  if (IMOSLoggingEnabled(v30))
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      LOWORD(v51) = 0;
      _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Done parse", (uint8_t *)&v51, 2u);
    }

  }
  objc_msgSend(v5, "body");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "string");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled(v34))
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v51 = 138412290;
      v52 = v36;
      _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Plain: %@", (uint8_t *)&v51, 0xCu);

    }
  }
  -[IMDSuperToRelayMessageParser outHTML](v28, "outHTML");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v37))
  {
    OSLogHandleForIMFoundationCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v51 = 138412290;
      v52 = v39;
      _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "messageString: %@", (uint8_t *)&v51, 0xCu);

    }
  }
  v40 = -[IMDSuperToRelayMessageParser isSimpleString](v28, "isSimpleString");
  if ((v40 & 1) != 0)
  {
    v41 = 0;
  }
  else
  {
    objc_msgSend(v5, "body");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "length"))
      v43 = v33 == 0;
    else
      v43 = 1;
    v41 = !v43;

  }
  if (IMOSLoggingEnabled(v40))
  {
    OSLogHandleForIMFoundationCategory();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = CFSTR("NO");
      if (v41)
        v45 = CFSTR("YES");
      v51 = 138412290;
      v52 = v45;
      _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "sendXMLVersion: %@", (uint8_t *)&v51, 0xCu);
    }

  }
  if (v37)
    v46 = v41;
  else
    v46 = 0;
  if (v46 == 1)
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryXHTMLKey, v37);
  v47 = v8;

LABEL_73:
  return v47;
}

+ (id)_convertIMMessageItemDictionaryToIMMessageItem:(id)a3 timestamp:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  IMDRelayMessageToSuperParser *v22;
  void *v23;
  IMDRelayMessageToSuperParser *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  int v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Converting Dictionary to IM Message", (uint8_t *)&v35, 2u);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D39918]);
  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryHandleKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHandle:", v9);

  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryServiceKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setService:", v10);

  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryGUIDKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGuid:", v11);

  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryGUIDKey);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGuid:", v12);

  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryDateKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "setTime:", v13);
  }
  else
  {
    _MessageDateFromTimeStamp(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTime:", v14);

  }
  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryIsAudioMessageKey);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = 2097157;
  else
    v16 = 5;
  objc_msgSend(v8, "setFlags:", v16);
  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryPlainBodyKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryPlainBodyKey);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlainBody:", v18);

  }
  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionarySubjectKey);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionarySubjectKey);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSubject:", v20);

  }
  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryXHTMLKey);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = [IMDRelayMessageToSuperParser alloc];
    objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryXHTMLKey);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[IMXMLParserContext initWithContent:](v22, "initWithContent:", v23);

    objc_msgSend(MEMORY[0x1E0D39BA0], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "parseContext:", v24);

    -[IMToSuperParserContext body](v24, "body");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v26);
    -[IMToSuperParserContext fileTransferGUIDs](v24, "fileTransferGUIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileTransferGUIDs:", v27);

    if (IMOSLoggingEnabled(v28))
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v26, "string");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        MarcoLoggingStringForMessageData();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fileTransferGUIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138412546;
        v36 = v31;
        v37 = 2112;
        v38 = v32;
        _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "      xhtml parsed body: %@  file tranfer GUIDs: %@", (uint8_t *)&v35, 0x16u);

      }
    }

  }
  objc_msgSend(v5, "objectForKey:", IMDRelayMessageItemDictionaryReplyToGUIDKey);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v33, "length"))
    objc_msgSend(v8, "setReplyToGUID:", v33);

  return v8;
}

+ (id)_updateServiceOfMessageInMessageDict:(id)a3 toService:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __CFDictionary *v11;
  id v12;
  __CFDictionary *v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithDictionary:", v7);

  v9 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "objectForKey:", IMDRelayMessageItemDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CFDictionary *)objc_msgSend(v9, "initWithDictionary:", v10);

  v12 = v5;
  if (v12)
  {
    CFDictionarySetValue(v11, IMDRelayMessageItemDictionaryServiceKey, v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166D2AC();
  }

  v13 = v11;
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IMDRelayMessageItemDictionary, v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_1D166ADB8();
  }

  return v8;
}

+ (id)_convertIMDHandleToDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMDRelayMessageDictionaryRecipientIDKey;
  objc_msgSend(v4, "unformattedID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = IMDRelayMessageDictionaryRecipientUnformatedIDKey;
  objc_msgSend(v4, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, v6, v7, v8, v9, IMDCTMessageDictionaryCountryCodeKey, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_convertIMDHandlesToArray:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1D15F5CA0;
  v4[3] = &unk_1E922F7A8;
  v4[4] = a1;
  objc_msgSend(a3, "__imArrayByApplyingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_convertIMDHandlesToArrayOfIDs:(id)a3
{
  return (id)objc_msgSend(a3, "arrayByApplyingSelector:", sel_ID);
}

- (IMDRelayEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (NSMutableDictionary)smsRelayBlockMap
{
  return self->_smsRelayBlockMap;
}

- (void)setSmsRelayBlockMap:(id)a3
{
  objc_storeStrong((id *)&self->_smsRelayBlockMap, a3);
}

- (IMDRelayDeletionController)deletionController
{
  return self->_deletionController;
}

- (IDSService)relayService
{
  return self->_relayService;
}

- (void)setRelayService:(id)a3
{
  objc_storeStrong((id *)&self->_relayService, a3);
}

- (IDSService)smsRelayService
{
  return self->_smsRelayService;
}

- (void)setSmsRelayService:(id)a3
{
  objc_storeStrong((id *)&self->_smsRelayService, a3);
}

- (IDSService)smsWatchService
{
  return self->_smsWatchService;
}

- (void)setSmsWatchService:(id)a3
{
  objc_storeStrong((id *)&self->_smsWatchService, a3);
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (IMDRelayPushHandler)smsRelayPushHandler
{
  return self->_smsRelayPushHandler;
}

- (void)setSmsRelayPushHandler:(id)a3
{
  objc_storeStrong((id *)&self->_smsRelayPushHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smsRelayPushHandler, 0);
  objc_storeStrong((id *)&self->_smsWatchService, 0);
  objc_storeStrong((id *)&self->_smsRelayService, 0);
  objc_storeStrong((id *)&self->_relayService, 0);
  objc_storeStrong((id *)&self->_deletionController, 0);
  objc_storeStrong((id *)&self->_smsRelayBlockMap, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
}

@end
