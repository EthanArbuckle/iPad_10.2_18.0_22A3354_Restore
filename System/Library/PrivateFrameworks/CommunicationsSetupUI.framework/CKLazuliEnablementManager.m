@implementation CKLazuliEnablementManager

- (CKLazuliEnablementManager)init
{
  CKLazuliEnablementManager *v2;
  id v3;
  uint64_t v4;
  CoreTelephonyClient *client;
  NSMutableDictionary *v6;
  NSMutableDictionary *enablementCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKLazuliEnablementManager;
  v2 = -[CKLazuliEnablementManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    v4 = objc_msgSend(v3, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    enablementCache = v2->_enablementCache;
    v2->_enablementCache = v6;

  }
  return v2;
}

- (id)_fetchIsRCSEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CKLazuliEnablementManager client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "getSystemConfiguration:withError:", v4, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;

  if (!v6 || v7)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKLazuliEnablementManager _fetchIsRCSEnabled:].cold.1((uint64_t)v7, v9);
    goto LABEL_29;
  }
  objc_msgSend(v6, "operationStatus");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_INFO, "Operation status is nil", buf, 2u);
      }

    }
    goto LABEL_29;
  }
  v10 = -[NSObject switchState](v8, "switchState");
  v11 = v10;
  if (v10 != -1)
  {
    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_INFO, "Lazuli is enabled.", buf, 2u);
        }
LABEL_20:

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (!objc_msgSend(v6, "featureEnabledByDefault"))
  {
LABEL_22:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)(v11 + 1) > 3)
          v16 = CFSTR("???");
        else
          v16 = off_24D0759E0[v11 + 1];
        *(_DWORD *)buf = 138412290;
        v20 = v16;
        _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_INFO, "Lazuli switch state is not enabled: %@", buf, 0xCu);
      }

    }
LABEL_29:
    v14 = (void *)MEMORY[0x24BDBD1C0];
    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_INFO, "RCS is enabled by default.", buf, 2u);
    }
    goto LABEL_20;
  }
LABEL_21:
  v14 = (void *)MEMORY[0x24BDBD1C8];
LABEL_30:

  return v14;
}

- (id)isRCSEnabledForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[CKLazuliEnablementManager _enablementCacheObjectForContext:](self, "_enablementCacheObjectForContext:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[CKLazuliEnablementManager _fetchIsRCSEnabled:](self, "_fetchIsRCSEnabled:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[CKLazuliEnablementManager _enablementCacheSetObject:forContext:](self, "_enablementCacheSetObject:forContext:", v7, v4);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 136315138;
        v11 = "-[CKLazuliEnablementManager isRCSEnabledForSubscriptionContext:]";
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "[%s] No active subscriptions.", (uint8_t *)&v10, 0xCu);
      }

    }
    v7 = (id)MEMORY[0x24BDBD1C0];
  }

  return v7;
}

- (id)ctSubscriptionInfo
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isRCSBusinessMessagingSupported
{
  void *v3;
  void *v4;
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

  v17 = *MEMORY[0x24BDAC8D0];
  if (!-[CKLazuliEnablementManager isRCSSupportedForAnyActiveSubscription](self, "isRCSSupportedForAnyActiveSubscription"))return 0;
  -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)_isRCSBusinessMessagingSupportedForSubscription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE511B8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v4, &unk_24D0940E8, MEMORY[0x24BDBD1C0], MEMORY[0x24BDBD1C0]);

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (BOOL)isRCSBusinessMessagingEnabledByDefault
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!-[CKLazuliEnablementManager isRCSEnabledForAnyActiveSubscription](self, "isRCSEnabledForAnyActiveSubscription"))
    return 0;
  -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_subscriptionsWithRCSSupport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[CKLazuliEnablementManager _isRCSBusinessMessagingSupportedForSubscription:](self, "_isRCSBusinessMessagingSupportedForSubscription:", v10, (_QWORD)v13)&& -[CKLazuliEnablementManager _isRCSBusinessMessagingEnabledByDefaultForSubscriptionContext:](self, "_isRCSBusinessMessagingEnabledByDefaultForSubscriptionContext:", v10))
        {
          v11 = 1;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (BOOL)_isRCSBusinessMessagingEnabledByDefaultForSubscriptionContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE511B8];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v4, &unk_24D094100, MEMORY[0x24BDBD1C0], MEMORY[0x24BDBD1C0]);

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (BOOL)isRCSEnabledForAnyActiveSubscription
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__im_subscriptionsWithRCSSupport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v24 = "-[CKLazuliEnablementManager isRCSEnabledForAnyActiveSubscription]";
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "[%s] subscriptionsWithRCSSupport count %@", buf, 0x16u);

      }
    }
  }
  else
  {
    v7 = v3;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        -[CKLazuliEnablementManager isRCSEnabledForSubscriptionContext:](self, "isRCSEnabledForSubscriptionContext:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if ((v15 & 1) != 0)
        {
          v16 = 1;
          goto LABEL_17;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_17:

  return v16;
}

- (BOOL)isRCSSupportedForAnyActiveSubscription
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "__im_subscriptionsWithRCSSupport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 136315394;
        v13 = "-[CKLazuliEnablementManager isRCSSupportedForAnyActiveSubscription]";
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "[%s] subscriptionsWithRCSSupport count %@", (uint8_t *)&v12, 0x16u);

      }
    }
  }
  else
  {
    v7 = v3;
  }
  v10 = objc_msgSend(v7, "count") != 0;

  return v10;
}

- (id)isRCSEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("simID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("phoneNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKLazuliEnablementManager isRCSEnabledForSubscriptionContext:](self, "isRCSEnabledForSubscriptionContext:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setRCSEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CKLazuliEnablementManager ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("simID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("phoneNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_30;
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CKLazuliEnablementManager setRCSEnabled:specifier:]";
      _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_INFO, "[%s] No active subscriptions.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "intValue") & 0x80000000) != 0 || (int)objc_msgSend(v6, "intValue") >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v14, OS_LOG_TYPE_INFO, "Unexpected value trying to be set for Lazuli", buf, 2u);
      }
LABEL_7:

    }
  }
  else
  {
    v15 = objc_msgSend(v6, "BOOLValue");
    v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_INFO, "Enabling Lazuli.", buf, 2u);
        }

      }
      -[CKLazuliEnablementManager client](self, "client");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v18, "enableLazuli:withError:", v13, &v24);
      v19 = (id *)&v24;
    }
    else
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v20, OS_LOG_TYPE_INFO, "Disabling Lazuli.", buf, 2u);
        }

      }
      -[CKLazuliEnablementManager client](self, "client");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v18, "disableLazuli:withError:", v13, &v23);
      v19 = (id *)&v23;
    }
    v21 = (char *)*v19;

    if (v21)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v21;
          _os_log_impl(&dword_2138BA000, v22, OS_LOG_TYPE_INFO, "Error Enabling Lazuli: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      -[CKLazuliEnablementManager _enablementCacheSetObject:forContext:](self, "_enablementCacheSetObject:forContext:", v6, v13);
    }

  }
LABEL_30:

}

- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v18 = 136315394;
      v19 = "-[CKLazuliEnablementManager systemConfigurationChanged:withConfiguration:]";
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_INFO, "[%s] New configuration for context: %@", (uint8_t *)&v18, 0x16u);
    }

  }
  if (v7)
  {
    objc_msgSend(v7, "operationStatus");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = -[NSObject switchState](v9, "switchState");
      if (!v11 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_INFO, "Lazuli is enabled.", (uint8_t *)&v18, 2u);
        }

      }
      -[CKLazuliEnablementManager _enablementCacheObjectForContext:](self, "_enablementCacheObjectForContext:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && (v11 == 0) != objc_msgSend(v13, "BOOLValue"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_2138BA000, v15, OS_LOG_TYPE_INFO, "RCS enablement cache was out of date, updating the cache.", (uint8_t *)&v18, 2u);
          }

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11 == 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKLazuliEnablementManager _enablementCacheSetObject:forContext:](self, "_enablementCacheSetObject:forContext:", v16, v6);

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_INFO, "Operation status is nil", (uint8_t *)&v18, 2u);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKLazuliEnablementManager systemConfigurationChanged:withConfiguration:].cold.1(v10);
  }

}

- (id)_enablementCacheObjectForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BE511B0];
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "IMUniqueIdentifierForPhoneNumber:simID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKLazuliEnablementManager enablementCache](self, "enablementCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_2138BA000, v11, OS_LOG_TYPE_INFO, "Returning cached enablement value (%@) for unique identifier %@", (uint8_t *)&v13, 0x16u);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_enablementCacheSetObject:(id)a3 forContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = (void *)MEMORY[0x24BE511B0];
  v7 = a4;
  objc_msgSend(v7, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "IMUniqueIdentifierForPhoneNumber:simID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKLazuliEnablementManager enablementCache](self, "enablementCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v10);

  }
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableDictionary)enablementCache
{
  return self->_enablementCache;
}

- (void)setEnablementCache:(id)a3
{
  objc_storeStrong((id *)&self->_enablementCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablementCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)_fetchIsRCSEnabled:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2138BA000, a2, OS_LOG_TYPE_ERROR, "Error getting systemConfiguration: %@", (uint8_t *)&v2, 0xCu);
}

- (void)systemConfigurationChanged:(os_log_t)log withConfiguration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2138BA000, log, OS_LOG_TYPE_ERROR, "systemConfiguration is nil.", v1, 2u);
}

@end
