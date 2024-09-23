@implementation IMCTSubscriptionUtilities

- (IMCTSubscriptionUtilities)init
{
  IMCTSubscriptionUtilities *v2;
  uint64_t v3;
  CoreTelephonyClient *coreTelephonyClient;
  IDSPhoneSubscriptionSelector *v5;
  IDSPhoneSubscriptionSelector *phoneSubscriptionSelector;
  void *v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMCTSubscriptionUtilities;
  v2 = -[IMCTSubscriptionUtilities init](&v10, sel_init);
  if (v2)
  {
    if (qword_1ECFC7550 != -1)
      dispatch_once(&qword_1ECFC7550, &unk_1E3FB1688);
    v3 = objc_msgSend(objc_alloc((Class)MEMORY[0x1A1AE7D4C](CFSTR("CoreTelephonyClient"), CFSTR("CoreTelephony"))), "initWithQueue:", MEMORY[0x1E0C80D38]);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v3;

    -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
    v5 = (IDSPhoneSubscriptionSelector *)objc_alloc_init(MEMORY[0x1E0D34340]);
    phoneSubscriptionSelector = v2->_phoneSubscriptionSelector;
    v2->_phoneSubscriptionSelector = v5;

    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDynamicLQMDisabledByWRM");

    if (v8)
      -[IMCTSubscriptionUtilities _registerForWRM](v2, "_registerForWRM");
  }
  return v2;
}

- (BOOL)deviceSupportsMultipleSubscriptions
{
  void *v2;
  __CFString *v3;
  NSObject *v4;
  NSObject *v5;
  const __CFString *v6;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((byte_1ECFC7514 & 1) == 0)
  {
    v8 = 0;
    -[IMCTSubscriptionUtilities ctSubscriptionInfoWithError:](self, "ctSubscriptionInfoWithError:", &v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (__CFString *)v8;
    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v10 = v3;
          _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Error occured fetching subscription info %@", buf, 0xCu);
        }

      }
    }
    else
    {
      if (v2)
        byte_1ECFC73A0 = objc_msgSend(v2, "__im_hasMultipleSubscriptions");
      byte_1ECFC7514 = 1;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        if (byte_1ECFC73A0)
          v6 = CFSTR("YES");
        else
          v6 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v10 = v6;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Device supports multiple subscriptions ? %@", buf, 0xCu);
      }

    }
  }
  return byte_1ECFC73A0;
}

- (IMCTXPCServiceSubscriptionInfo)ctSubscriptionInfo
{
  return (IMCTXPCServiceSubscriptionInfo *)-[IMCTSubscriptionUtilities ctSubscriptionInfoWithError:](self, "ctSubscriptionInfoWithError:", 0);
}

- (id)ctSubscriptionInfoWithError:(id *)a3
{
  IMCTXPCServiceSubscriptionInfo *ctSubscriptionInfo;
  CoreTelephonyClient *coreTelephonyClient;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  IMCTXPCServiceSubscriptionInfo *v12;
  NSObject *v14;
  IMCTXPCServiceSubscriptionInfo **p_ctSubscriptionInfo;
  IMCTXPCServiceSubscriptionInfo *v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  ctSubscriptionInfo = self->_ctSubscriptionInfo;
  if (!ctSubscriptionInfo)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v18 = 0;
    -[CoreTelephonyClient getSubscriptionInfoWithError:](coreTelephonyClient, "getSubscriptionInfoWithError:", &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v8)
      v9 = 1;
    else
      v9 = v7 == 0;
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = objc_msgSend(v8, "code");
          *(_DWORD *)buf = 134218242;
          v20 = v11;
          v21 = 2112;
          v22 = v7;
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Error while getting the subscription info: %ld with info: %@", buf, 0x16u);
        }

      }
      v12 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v8);
    }
    else
    {
      v12 = -[IMCTXPCServiceSubscriptionInfo initWithSubscriptionInfo:]([IMCTXPCServiceSubscriptionInfo alloc], "initWithSubscriptionInfo:", v7);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v20 = (uint64_t)v12;
          _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Retrieved new CT subscription info %@", buf, 0xCu);
        }

      }
    }
    v16 = self->_ctSubscriptionInfo;
    p_ctSubscriptionInfo = &self->_ctSubscriptionInfo;
    *p_ctSubscriptionInfo = v12;

    ctSubscriptionInfo = *p_ctSubscriptionInfo;
  }
  return ctSubscriptionInfo;
}

- (void)_registerForWRM
{
  void *v3;
  int v4;
  NSNumber *wrmNetworkPreference;
  NSNumber *wrmCellScore;
  uint32_t v7;
  NSObject *v8;
  _QWORD v9[5];
  int out_token;
  uint8_t buf[4];
  uint32_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDynamicLQMDisabledByWRM");

  if (v4)
  {
    out_token = 0;
    wrmNetworkPreference = self->_wrmNetworkPreference;
    self->_wrmNetworkPreference = (NSNumber *)&unk_1E3FFE4F8;

    wrmCellScore = self->_wrmCellScore;
    self->_wrmCellScore = (NSNumber *)&unk_1E3FFE510;

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19E23D26C;
    v9[3] = &unk_1E3FB6D08;
    v9[4] = self;
    v7 = notify_register_dispatch("com.apple.WRM.iRAT_event.linkRecommendation", &out_token, MEMORY[0x1E0C80D38], v9);
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v12 = v7;
          _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "LQM-WRM Failed to register for com.apple.WRM.iRAT_event.linkRecommendation (%u)", buf, 8u);
        }

      }
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1ECFC7628 != -1)
    dispatch_once(&qword_1ECFC7628, &unk_1E3FB3628);
  return (id)qword_1ECFC7588;
}

- (BOOL)isDataConnectionExpensive
{
  void *v3;
  void *v4;
  void *v5;
  CoreTelephonyClient *coreTelephonyClient;
  int v7;
  id v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (IMPCDoesInterfaceExist())
  {
    -[IMCTSubscriptionUtilities ctSubscriptionInfo](self, "ctSubscriptionInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "__im_preferredDataSubscriptionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CA6DE0], "descriptorWithSubscriptionContext:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      coreTelephonyClient = self->_coreTelephonyClient;
      v13 = 0;
      v7 = -[CoreTelephonyClient interfaceCostExpensive:error:](coreTelephonyClient, "interfaceCostExpensive:error:", v5, &v13);
      v8 = v13;
      v9 = IMOSLoggingEnabled();
      if (v8)
      {
        if (v9)
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v15 = v8;
            _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "LQM-WRM Error occurred trying to get interfaceCostExpensive %@", buf, 0xCu);
          }

        }
        LOBYTE(v7) = 1;
      }
      else if (v9)
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v15) = v7;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "LQM-WRM interfaceCostExpensive returned %d", buf, 8u);
        }

      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)_iMessageService
{
  if (qword_1EE503D18 != -1)
    dispatch_once(&qword_1EE503D18, &unk_1E3FB3FA8);
  return (id)qword_1EE503D30;
}

- (id)_CTSIMSFromPhoneSubscriptions:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](MEMORY[0x1E0D34338], sel_CTSIMSFromPhoneSubscriptions_);
}

- (id)_registeredSims
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IMCTSubscriptionUtilities _iMessageService](self, "_iMessageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isActive", (_QWORD)v14))
        {
          objc_msgSend(v10, "matchingSim");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (NSArray)registeredSubscriptionSlotIDs
{
  void *v2;
  void *v3;

  -[IMCTSubscriptionUtilities _registeredSims](self, "_registeredSims");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "__imArrayByApplyingBlock:", &unk_1E3FB4168);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)registeredSIMIDs
{
  void *v2;
  void *v3;

  -[IMCTSubscriptionUtilities _registeredSims](self, "_registeredSims");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByApplyingSelector:", sel_SIMIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)registeredPhoneNumbers
{
  __CFArray *v3;
  void *v4;
  uint64_t v5;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMCTSubscriptionUtilities registeredSubscriptionSlotIDs](self, "registeredSubscriptionSlotIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (int)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "intValue");
        -[IMCTSubscriptionUtilities ctSubscriptionInfo](self, "ctSubscriptionInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "__im_phoneNumberForSlotID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3 && v11)
          CFArrayAppendValue(v3, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "labelID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      objc_msgSend(v4, "labelID");
    else
      objc_msgSend(v4, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)cachedCarrierSettings
{
  NSMutableDictionary *cachedCarrierSettings;
  NSMutableDictionary **p_cachedCarrierSettings;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableDictionary *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  NSMutableDictionary *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_cachedCarrierSettings = &self->_cachedCarrierSettings;
  cachedCarrierSettings = self->_cachedCarrierSettings;
  if (!cachedCarrierSettings)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[IMCTSubscriptionUtilities ctSubscriptionInfo](self, "ctSubscriptionInfo", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      v10 = MEMORY[0x1E0C9AA70];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[IMCTSubscriptionUtilities _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:](self, "_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v12 && objc_msgSend(v13, "length"))
            objc_msgSend(v5, "setObject:forKey:", v10, v14);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)p_cachedCarrierSettings, v5);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *p_cachedCarrierSettings;
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Created the cached carrier settings dict %@", buf, 0xCu);
      }

    }
    cachedCarrierSettings = *p_cachedCarrierSettings;
  }
  return cachedCarrierSettings;
}

- (id)_createSettingsDictionaryForUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMCTSubscriptionUtilities cachedCarrierSettings](self, "cachedCarrierSettings");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v5, "setObject:forKey:", MEMORY[0x1E0C9AA70], v4);
  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_4;
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Could not create settings dictionary because uniqueID is nil", v7, 2u);
    }
  }

LABEL_4:
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)_resetCachedCarrierSettingsForUniqueID:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[IMCTSubscriptionUtilities _createSettingsDictionaryForUniqueID:](self, "_createSettingsDictionaryForUniqueID:", v4);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "UniqueID is nil, can not reset cache.", v7, 2u);
    }

  }
}

- (id)_getCarrierSettingsForUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMCTSubscriptionUtilities cachedCarrierSettings](self, "cachedCarrierSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[IMCTSubscriptionUtilities _createSettingsDictionaryForUniqueID:](self, "_createSettingsDictionaryForUniqueID:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
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
        _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "UniqueID is nil.", v9, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (void)_setCarrierSettings:(id)a3 uniqueID:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && objc_msgSend(v6, "length"))
  {
    -[IMCTSubscriptionUtilities cachedCarrierSettings](self, "cachedCarrierSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

- (id)stringForBundleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("CTBundleTypeUnknown");
  else
    return off_1E3FB6D48[a3 - 1];
}

- (id)_cachedCarrierKeyForKeyHierarchy:(id)a3 bundleType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count")
    && (objc_msgSend(v6, "lastObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x1E0CB37A0];
    -[IMCTSubscriptionUtilities stringForBundleType:](self, "stringForBundleType:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "appendFormat:", CFSTR("-%@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_getCachedCarrierSettingValueForBundleKey:(id)a3 uniqueID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") && objc_msgSend(v6, "length"))
  {
    -[IMCTSubscriptionUtilities _getCarrierSettingsForUniqueID:](self, "_getCarrierSettingsForUniqueID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setCachedCarrierSettingValue:(id)a3 bundleKey:(id)a4 uniqueID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    -[IMCTSubscriptionUtilities _getCarrierSettingsForUniqueID:](self, "_getCarrierSettingsForUniqueID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (v8)
    {
      if (v12)
      {
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v12, "setObject:forKey:", v8, v9);
          -[IMCTSubscriptionUtilities _setCarrierSettings:uniqueID:](self, "_setCarrierSettings:uniqueID:", v12, v10);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v14 = 138412802;
              v15 = v8;
              v16 = 2112;
              v17 = v9;
              v18 = 2112;
              v19 = v12;
              _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Request to set value %@ for key %@. Carrier settings dict is now %@", (uint8_t *)&v14, 0x20u);
            }

          }
        }
      }
    }

  }
}

- (id)_getCachedSettingOrReadFromBundleForCarrierBundleKey:(id)a3 bundleType:(int64_t)a4 forContext:(id)a5 defaultValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  CoreTelephonyClient *coreTelephonyClient;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[IMCTSubscriptionUtilities _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:](self, "_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTSubscriptionUtilities _cachedCarrierKeyForKeyHierarchy:bundleType:](self, "_cachedCarrierKeyForKeyHierarchy:bundleType:", v10, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTSubscriptionUtilities _getCachedCarrierSettingValueForBundleKey:uniqueID:](self, "_getCachedCarrierSettingValueForBundleKey:uniqueID:", v14, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v14;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "There is no cached value for key %@, fetching from carrier bundle with uniqueID %@", buf, 0x16u);
      }

    }
    v26 = (void *)objc_msgSend(objc_alloc((Class)qword_1ECFC7538), "initWithBundleType:", a4);
    v17 = v12;
    coreTelephonyClient = self->_coreTelephonyClient;
    v27 = 0;
    v19 = (void *)-[CoreTelephonyClient copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:error:](coreTelephonyClient, "copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:error:", v11, v10, v26, &v27);
    v20 = v27;
    if (v19)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v29 = v19;
          v30 = 2112;
          v31 = v10;
          v32 = 2112;
          v33 = v13;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Retrieved carrier bundle value %@ for key %@ for uniqueID %@", buf, 0x20u);
        }

      }
      v22 = v19;

    }
    else
    {
      v22 = v17;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v29 = 0;
          v30 = 2112;
          v31 = v17;
          v32 = 2112;
          v33 = v10;
          v34 = 2112;
          v35 = v13;
          _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Retrieved nil carrier bundle value %@, defaulting to value %@ for key %@ for uniqueID %@", buf, 0x2Au);
        }

        v22 = v17;
      }
    }

    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v29 = v20;
          v30 = 2112;
          v31 = v10;
          v32 = 2112;
          v33 = v13;
          _os_log_impl(&dword_19E239000, v24, OS_LOG_TYPE_INFO, "Got error %@ fetching key %@ for uniqueID %@", buf, 0x20u);
        }

      }
    }
    else
    {
      -[IMCTSubscriptionUtilities _setCachedCarrierSettingValue:bundleKey:uniqueID:](self, "_setCachedCarrierSettingValue:bundleKey:uniqueID:", v22, v14, v13);
      v17 = v22;
    }
    v15 = v17;

  }
  return v15;
}

- (id)copyOperatorBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_copyBundleValueForSubscriptionContext_keyHierarchy_bundleType_defaultValue_valueIfError_);
}

- (id)copyCarrierBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 defaultValue:(id)a5 valueIfError:(id)a6
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_copyBundleValueForSubscriptionContext_keyHierarchy_bundleType_defaultValue_valueIfError_);
}

- (id)copyBundleValueForSubscriptionContext:(id)a3 keyHierarchy:(id)a4 bundleType:(int64_t)a5 defaultValue:(id)a6 valueIfError:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v14;
  -[IMCTSubscriptionUtilities _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:](self, "_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12
    && objc_msgSend(v17, "length")
    && (objc_msgSend(v13, "lastObject"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "length"),
        v19,
        v20))
  {
    -[IMCTSubscriptionUtilities _getCachedSettingOrReadFromBundleForCarrierBundleKey:bundleType:forContext:defaultValue:](self, "_getCachedSettingOrReadFromBundleForCarrierBundleKey:bundleType:forContext:defaultValue:", v13, a5, v12, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = v16;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v25 = 138412802;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        v29 = 2112;
        v30 = v16;
        _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "Could not read carrier bundle id for key %@ because subscription context was nil or did not have phoneNumber/labelID %@. Returning default %@", (uint8_t *)&v25, 0x20u);
      }

      v21 = v16;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v25 = 138412802;
      v26 = v21;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_INFO, "Returning carrier bundle value %@ for key %@ and context %@", (uint8_t *)&v25, 0x20u);
    }

  }
  return v21;
}

- (BOOL)simInHomeCountryWithSubscriptionContext:(id)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  id v9;

  coreTelephonyClient = self->_coreTelephonyClient;
  v9 = 0;
  v4 = (void *)-[CoreTelephonyClient copyRegistrationDisplayStatus:error:](coreTelephonyClient, "copyRegistrationDisplayStatus:error:", a3, &v9);
  v5 = v9;
  if (v5)
  {
    IMLogHandleForCategory("IMCTSusbcriptionUtilities");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_19E36C814();

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "isInHomeCountry");
  }

  return v7;
}

- (BOOL)wifiCallingEnabledForSubscriptionContext:(id)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  id v9;

  coreTelephonyClient = self->_coreTelephonyClient;
  v9 = 0;
  -[CoreTelephonyClient getCallCapabilities:error:](coreTelephonyClient, "getCallCapabilities:error:", a3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    IMLogHandleForCategory("IMCTSubscriptionUtilities");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_19E36C874();

    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "isWifiCallingAvailable");
  }

  return v7;
}

- (id)copyIsoCountryCodeForSubscriptionContext:(id)a3
{
  CoreTelephonyClient *coreTelephonyClient;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  id v14;

  coreTelephonyClient = self->_coreTelephonyClient;
  v14 = 0;
  v5 = (void *)-[CoreTelephonyClient copyMobileSubscriberCountryCode:error:](coreTelephonyClient, "copyMobileSubscriberCountryCode:error:", a3, &v14);
  v6 = v14;
  if (v6)
  {
    v7 = v6;
    IMLogHandleForCategory("IMCTSubscriptionUtilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_19E36C974();
  }
  else
  {
    v9 = self->_coreTelephonyClient;
    v13 = 0;
    v8 = -[CoreTelephonyClient copyMobileSubscriberIsoCountryCode:error:](v9, "copyMobileSubscriberIsoCountryCode:error:", v5, &v13);
    v7 = v13;
    if (v7)
    {
      IMLogHandleForCategory("IMCTSubscriptionUtilities");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_19E36C914();
    }
    else
    {
      if (-[NSObject length](v8, "length"))
      {
        v8 = v8;
        v11 = v8;
        goto LABEL_9;
      }
      IMLogHandleForCategory("IMCTSubscriptionUtilities");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_19E36C8D4(v10);
    }

  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (NSArray)ctServiceSubscriptions
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (qword_1ECFC7540)
    v2 = qword_1ECFC7548 == 0;
  else
    v2 = 1;
  if (v2 || !self->_coreTelephonyClient)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Classes CTXPCServiceSubscriptionInfo and CTXPCServiceSubscriptionContext were not weak linked properly, returning nil.", (uint8_t *)&v9, 2u);
      }

    }
    return (NSArray *)0;
  }
  else
  {
    -[IMCTSubscriptionUtilities ctSubscriptionInfo](self, "ctSubscriptionInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "subscriptions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Returning subscriptions %@", (uint8_t *)&v9, 0xCu);
      }

    }
    return (NSArray *)v5;
  }
}

- (NSString)ctPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[IMCTSubscriptionUtilities ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredOrDefaultSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)numberOfSubscriptions
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMCTSubscriptionUtilities ctSubscriptionInfo](self, "ctSubscriptionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, " Carrier bundle had changes for context: %@. Calling reset to the cached settings", (uint8_t *)&v7, 0xCu);
    }

  }
  -[IMCTSubscriptionUtilities _cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:](self, "_cachedCarrierSettingsUniqueIDKeyForSubscriptionContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMCTSubscriptionUtilities _resetCachedCarrierSettingsForUniqueID:](self, "_resetCachedCarrierSettingsForUniqueID:", v6);

}

- (void)resetCacheSubscriptionInfoAndPostNotification
{
  NSObject *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  -[IMCTSubscriptionUtilities resetCacheSubscriptionInfo](self, "resetCacheSubscriptionInfo");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19E239000, v2, OS_LOG_TYPE_INFO, "Subscription info has been reset to nil. Raising notification that SIM subscriptions have changed.", v4, 2u);
    }

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("__kIMSIMSubscriptionsChangedNotification"), 0, 0, 1u);
}

- (void)resetCacheSubscriptionInfo
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
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Resetting subscription info to nil", v4, 2u);
    }

  }
  -[IMCTSubscriptionUtilities setCtSubscriptionInfo:](self, "setCtSubscriptionInfo:", 0);
  byte_1ECFC7514 = 0;
}

- (void)subscriptionInfoDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_resetCacheSubscriptionInfo, 0);
  -[IMCTSubscriptionUtilities performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_resetCacheSubscriptionInfoAndPostNotification, 0, 1.0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Subscriptions have changed, resetting subscription info to nil", v4, 2u);
    }

  }
}

- (void)activeSubscriptionsDidChange
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
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Active subscriptions have changed, resetting subscription info to nil", v4, 2u);
    }

  }
  -[IMCTSubscriptionUtilities subscriptionInfoDidChange](self, "subscriptionInfoDidChange");
}

- (id)rcsConfigurationForSubscriptionContext:(id)a3 error:(id *)a4
{
  return (id)-[CoreTelephonyClient getSystemConfiguration:withError:](self->_coreTelephonyClient, "getSystemConfiguration:withError:", a3, a4);
}

- (id)rcsConfigurationForSubscriptionContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v4 = a3;
  v9 = 0;
  -[IMCTSubscriptionUtilities rcsConfigurationForSubscriptionContext:error:](self, "rcsConfigurationForSubscriptionContext:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
  {
    IMLogHandleForCategory("IMCTSubscriptionUtilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_19E36C9D4();

  }
  return v5;
}

- (void)setCtSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_ctSubscriptionInfo, a3);
}

- (NSNumber)wrmCellScore
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWrmCellScore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)wrmNetworkPreference
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWrmNetworkPreference:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (void)setCachedCarrierSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCarrierSettings, a3);
}

- (IDSPhoneSubscriptionSelector)phoneSubscriptionSelector
{
  return self->_phoneSubscriptionSelector;
}

- (void)setPhoneSubscriptionSelector:(id)a3
{
  objc_storeStrong((id *)&self->_phoneSubscriptionSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneSubscriptionSelector, 0);
  objc_storeStrong((id *)&self->_cachedCarrierSettings, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_wrmNetworkPreference, 0);
  objc_storeStrong((id *)&self->_wrmCellScore, 0);
  objc_storeStrong((id *)&self->_ctSubscriptionInfo, 0);
}

- (id)newSubscriptionContextWithSlot:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)qword_1ECFC7548), "initWithSlot:", a3);
}

- (id)newSubscriptionContextWithPhoneNumber:(id)a3 labelID:(id)a4 isDefaultVoice:(id)a5 isDefaultData:(id)a6 slot:(int64_t)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v11 = (objc_class *)qword_1ECFC7548;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend([v11 alloc], "initWithSlot:", a7);
  objc_msgSend(v16, "setPhoneNumber:", v15);

  objc_msgSend(v16, "setLabelID:", v14);
  objc_msgSend(v16, "setUserDataPreferred:", v12);

  objc_msgSend(v16, "setUserDefaultVoice:", v13);
  return v16;
}

@end
