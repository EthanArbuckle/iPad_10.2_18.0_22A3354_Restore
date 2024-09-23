@implementation IMSenderIdentityManager

+ (id)sharedInstance
{
  if (qword_1ECFC7678 != -1)
    dispatch_once(&qword_1ECFC7678, &unk_1E3FB3BE8);
  return (id)qword_1ECFC75D8;
}

- (IMSenderIdentityManager)init
{
  IMSenderIdentityManager *v2;
  CNGeminiManager *v3;
  CNGeminiManager *geminiManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMSenderIdentityManager;
  v2 = -[IMSenderIdentityManager init](&v6, sel_init);
  if (v2)
  {
    if (qword_1EE503840 != -1)
      dispatch_once(&qword_1EE503840, &unk_1E3FB1788);
    v3 = (CNGeminiManager *)objc_alloc_init((Class)MEMORY[0x1A1AE7D4C](CFSTR("CNGeminiManager"), CFSTR("Contacts")));
    geminiManager = v2->_geminiManager;
    v2->_geminiManager = v3;

  }
  return v2;
}

- (id)bestSenderIdentityForHandleIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      v8 = 0;
      v9 = v5;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        -[IMSenderIdentityManager bestSenderIdentityForHandleID:contact:](self, "bestSenderIdentityForHandleID:contact:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8), 0, (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v10;
        if (v9)
        {
          if (v10)
          {
            objc_msgSend(v10, "accountUUID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "accountUUID");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if ((v13 & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v23 = v9;
                  v24 = 2112;
                  v25 = v5;
                  _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Chat had recipients with different contact preferred subscriptions (%@ / %@). Returning nil.", buf, 0x16u);
                }

              }
              v15 = 0;
              goto LABEL_21;
            }
          }
        }

        ++v8;
        v9 = v5;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v5;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Best sender identity :%@ for handleIDs :%@", buf, 0x16u);
    }

  }
  v9 = v5;
  v15 = v9;
LABEL_21:

  return v15;
}

- (id)bestSenderIdentityForHandleID:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v7 || v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)qword_1EE503868), "initWithString:type:", v6, -1);
    -[IMSenderIdentityManager bestSenderIdentityForGeminiHandle:contact:](self, "bestSenderIdentityForGeminiHandle:contact:", v11, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "bestSenderIdentityForHandleID: called with empty handle and no contact", v13, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (id)contactPreferredSenderIdentityForHandleID:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  if (v7 || v8)
  {
    -[IMSenderIdentityManager geminiManager](self, "geminiManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v11, "geminiResultForContact:error:", v7, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;

    if (objc_msgSend(v12, "usage") == 1)
    {
      -[IMSenderIdentityManager geminiManager](self, "geminiManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      objc_msgSend(v14, "bestSenderIdentityForContact:error:", v7, &v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;

      v13 = v15;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "contactPreferredSenderIdentityForHandleID: called with empty handle and no contact", buf, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (id)bestSenderIdentityForGeminiHandle:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v7))
  {
    -[IMSenderIdentityManager geminiManager](self, "geminiManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v8, "bestSenderIdentityForContact:error:", v7, &v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v32;

    goto LABEL_12;
  }
  objc_msgSend(v6, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v6;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "bestSenderIdentityForGeminiHandle:contact: called with handle that has nil contact: %@. Attempting to find with TU handle %@.", buf, 0x16u);
      }

    }
    -[IMSenderIdentityManager geminiManager](self, "geminiManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init((Class)qword_1ECFC74F0);
    v31 = 0;
    objc_msgSend(v15, "bestSenderIdentityForHandle:contactStore:error:", v6, v16, &v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "handle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v19;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "bestSenderIdentityForGeminiHandle:contact: returned handle %@.", buf, 0xCu);

      }
    }
LABEL_12:
    if (v10 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "IMSenderIdentityManager: Error fetching sender identity: %@", buf, 0xCu);
      }

    }
    if (v9)
      goto LABEL_40;
    goto LABEL_24;
  }
  if (v13)
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "bestSenderIdentityForGeminiHandle:contact: called with empty handle and no contact", buf, 2u);
    }

  }
  v10 = 0;
LABEL_24:
  v22 = (void *)MEMORY[0x1A1AE7D4C](CFSTR("TUCallCenter"), CFSTR("TelephonyUtilities"));
  if (!v22)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v28, OS_LOG_TYPE_INFO, "Failed to weak link TUCallCenter", buf, 2u);
      }

    }
    goto LABEL_35;
  }
  objc_msgSend(v22, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "providerManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "telephonyProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "prioritizedSenderIdentities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_19E239000, v27, OS_LOG_TYPE_INFO, "TUCallProvider provided prioritized sender identity: %@", buf, 0xCu);
    }

  }
  if (!v9)
  {
LABEL_35:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v29, OS_LOG_TYPE_INFO, "IMSenderIdentityManager: bestSenderIdentityForGeminiHandle:contact: returning nil sender identity", buf, 2u);
      }

    }
    v9 = 0;
  }
LABEL_40:

  return v9;
}

+ (BOOL)isTUSenderIdentity:(id)a3 equalToSubscriptionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (!a3 || !a4)
    return 0;
  v5 = a4;
  objc_msgSend(a3, "accountUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "labelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "isEqualToString:", v8);
  return (char)v5;
}

- (CNGeminiManager)geminiManager
{
  return self->_geminiManager;
}

- (void)setGeminiManager:(id)a3
{
  objc_storeStrong((id *)&self->_geminiManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiManager, 0);
}

@end
