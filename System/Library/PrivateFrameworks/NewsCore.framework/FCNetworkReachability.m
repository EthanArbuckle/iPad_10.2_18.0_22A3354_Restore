@implementation FCNetworkReachability

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__FCNetworkReachability_addObserver___block_invoke_2;
    v6[3] = &unk_1E463AD10;
    v6[4] = self;
    v7 = v4;
    FCPerformBlockOnMainThread(v6);

  }
}

void __37__FCNetworkReachability_addObserver___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setAccessRestrictedBecauseOfCountry:(BOOL)a3
{
  self->_accessRestrictedBecauseOfCountry = a3;
  -[FCNetworkReachability _accessRestrictionsChanged](self, "_accessRestrictionsChanged");
}

- (void)setAccessRestrictedBecauseOfOSVersion:(BOOL)a3
{
  self->_accessRestrictedBecauseOfOSVersion = a3;
  -[FCNetworkReachability _accessRestrictionsChanged](self, "_accessRestrictionsChanged");
}

- (void)setAccessRestrictedBecauseOfDeviceAbandoned:(BOOL)a3
{
  self->_accessRestrictedBecauseOfDeviceAbandoned = a3;
  -[FCNetworkReachability _accessRestrictionsChanged](self, "_accessRestrictionsChanged");
}

- (void)setAccessRestrictedBecauseOfAppVersion:(BOOL)a3
{
  self->_accessRestrictedBecauseOfAppVersion = a3;
  -[FCNetworkReachability _accessRestrictionsChanged](self, "_accessRestrictionsChanged");
}

+ (id)sharedNetworkReachability
{
  if (_MergedGlobals_219 != -1)
    dispatch_once(&_MergedGlobals_219, &__block_literal_global_174);
  return (id)qword_1ED0F88C0;
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

void __50__FCNetworkReachability_sharedNetworkReachability__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F88C0;
  qword_1ED0F88C0 = v0;

}

- (FCNetworkReachability)init
{
  FCNetworkReachability *v2;
  uint64_t v3;
  NSHashTable *observers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCNetworkReachability;
  v2 = -[FCNetworkReachability init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_isCloudKitAccessAllowed = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__reachabilityChanged_, *MEMORY[0x1E0D60B38], 0);

    -[FCNetworkReachability _updateReachability](v2, "_updateReachability");
  }
  return v2;
}

- (BOOL)isCloudKitReachable
{
  _BOOL4 v3;

  v3 = -[FCNetworkReachability isNetworkReachable](self, "isNetworkReachable");
  if (v3)
    LOBYTE(v3) = -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed");
  return v3;
}

- (void)_reachabilityChanged:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  _BOOL4 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = -[FCNetworkReachability isNetworkReachable](self, "isNetworkReachable", a3);
  v5 = -[FCNetworkReachability isNetworkReachableViaWiFi](self, "isNetworkReachableViaWiFi");
  v6 = -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed");
  v7 = -[FCNetworkReachability isNetworkUsageExpensive](self, "isNetworkUsageExpensive");
  v8 = -[FCNetworkReachability isLowDataModeEnabled](self, "isLowDataModeEnabled");
  -[FCNetworkReachability _updateReachability](self, "_updateReachability");
  -[FCNetworkReachability observers](self, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v4 != -[FCNetworkReachability isNetworkReachable](self, "isNetworkReachable")
    || v6 != -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed")
    || v7 != -[FCNetworkReachability isNetworkUsageExpensive](self, "isNetworkUsageExpensive")
    || v8 != -[FCNetworkReachability isLowDataModeEnabled](self, "isLowDataModeEnabled"))
  {
    v29 = v5;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "networkReachabilityDidChange:", self);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v13);
    }

    v5 = v29;
  }
  if (v5 != -[FCNetworkReachability isNetworkReachableViaWiFi](self, "isNetworkReachableViaWiFi"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "wifiReachabilityDidChange:", self);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v19);
    }

  }
  if (v4 != -[FCNetworkReachability isNetworkReachable](self, "isNetworkReachable"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v10;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v28, "networkReachabilityConnectivityDidChange:", self);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v25);
    }

  }
}

- (BOOL)isLowDataModeEnabled
{
  return self->_isLowDataModeEnabled;
}

- (BOOL)isNetworkUsageExpensive
{
  return self->_isNetworkUsageExpensive;
}

- (void)_updateReachability
{
  void *v3;
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D60AF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentReachabilityStatus");

  -[FCNetworkReachability setIsNetworkReachableViaWiFi:](self, "setIsNetworkReachableViaWiFi:", v4 & 1);
  -[FCNetworkReachability setIsNetworkReachableViaCellular:](self, "setIsNetworkReachableViaCellular:", (v4 >> 1) & 1);
  -[FCNetworkReachability setIsNetworkReachableViaOther:](self, "setIsNetworkReachableViaOther:", (v4 >> 2) & 1);
  v5 = -[FCNetworkReachability isNetworkReachableViaWiFi](self, "isNetworkReachableViaWiFi")
    || -[FCNetworkReachability isNetworkReachableViaCellular](self, "isNetworkReachableViaCellular")
    || -[FCNetworkReachability isNetworkReachableViaOther](self, "isNetworkReachableViaOther");
  -[FCNetworkReachability setIsNetworkReachable:](self, "setIsNetworkReachable:", v5);
  -[FCNetworkReachability setIsNetworkUsageExpensive:](self, "setIsNetworkUsageExpensive:", (v4 >> 3) & 1);
  -[FCNetworkReachability setIsLowDataModeEnabled:](self, "setIsLowDataModeEnabled:", (v4 >> 4) & 1);
  if (-[FCNetworkReachability accessRestrictedBecauseOfAppVersion](self, "accessRestrictedBecauseOfAppVersion")
    || -[FCNetworkReachability accessRestrictedBecauseOfCountry](self, "accessRestrictedBecauseOfCountry")
    || -[FCNetworkReachability accessRestrictedBecauseOfOSVersion](self, "accessRestrictedBecauseOfOSVersion"))
  {
    v6 = 0;
  }
  else
  {
    v6 = -[FCNetworkReachability accessRestrictedBecauseOfDeviceAbandoned](self, "accessRestrictedBecauseOfDeviceAbandoned") ^ 1;
  }
  -[FCNetworkReachability setIsCloudKitAccessAllowed:](self, "setIsCloudKitAccessAllowed:", v6);
  -[FCNetworkReachability setCellularRadioAccessTechnology:](self, "setCellularRadioAccessTechnology:", -[FCNetworkReachability _cellularRadioAccessTechnology](self, "_cellularRadioAccessTechnology"));
  v7 = (void *)FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9[0] = 67110144;
    v9[1] = -[FCNetworkReachability isNetworkReachable](self, "isNetworkReachable");
    v10 = 1024;
    v11 = -[FCNetworkReachability isNetworkReachableViaWiFi](self, "isNetworkReachableViaWiFi");
    v12 = 1024;
    v13 = -[FCNetworkReachability isNetworkReachableViaCellular](self, "isNetworkReachableViaCellular");
    v14 = 1024;
    v15 = -[FCNetworkReachability isNetworkReachableViaOther](self, "isNetworkReachableViaOther");
    v16 = 1024;
    v17 = -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed");
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "Reachability Changed. Network Reachable: %d, via Wi-Fi: %d, via Cellular: %d, via Other: %d, CloudKit Access Allowed: %d", (uint8_t *)v9, 0x20u);

  }
}

- (BOOL)isNetworkReachableViaWiFi
{
  return self->_isNetworkReachableViaWiFi;
}

- (void)_accessRestrictionsChanged
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed");
  if (-[FCNetworkReachability accessRestrictedBecauseOfAppVersion](self, "accessRestrictedBecauseOfAppVersion")
    || -[FCNetworkReachability accessRestrictedBecauseOfCountry](self, "accessRestrictedBecauseOfCountry")
    || -[FCNetworkReachability accessRestrictedBecauseOfOSVersion](self, "accessRestrictedBecauseOfOSVersion"))
  {
    v4 = 0;
  }
  else
  {
    v4 = -[FCNetworkReachability accessRestrictedBecauseOfDeviceAbandoned](self, "accessRestrictedBecauseOfDeviceAbandoned") ^ 1;
  }
  -[FCNetworkReachability setIsCloudKitAccessAllowed:](self, "setIsCloudKitAccessAllowed:", v4);
  if (v3 != -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed"))
  {
    v5 = (void *)FCReachabilityLog;
    if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      *(_DWORD *)buf = 67109120;
      v21 = -[FCNetworkReachability isCloudKitAccessAllowed](self, "isCloudKitAccessAllowed");
      _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "Access restrictions changed. CloudKit access allowed: %d", buf, 8u);

    }
    -[FCNetworkReachability observers](self, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "networkReachabilityDidChange:", self, (_QWORD)v15);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)isCloudKitAccessAllowed
{
  return self->_isCloudKitAccessAllowed;
}

- (int64_t)offlineReason
{
  if (!-[FCNetworkReachability isNetworkReachable](self, "isNetworkReachable"))
    return 1;
  if (-[FCNetworkReachability accessRestrictedBecauseOfCountry](self, "accessRestrictedBecauseOfCountry"))
    return 3;
  if (-[FCNetworkReachability accessRestrictedBecauseOfAppVersion](self, "accessRestrictedBecauseOfAppVersion"))
    return 4;
  if (-[FCNetworkReachability accessRestrictedBecauseOfOSVersion](self, "accessRestrictedBecauseOfOSVersion"))
    return 5;
  if (-[FCNetworkReachability accessRestrictedBecauseOfDeviceAbandoned](self, "accessRestrictedBecauseOfDeviceAbandoned"))
  {
    return 6;
  }
  return 0;
}

- (BOOL)accessRestrictedBecauseOfOSVersion
{
  return self->_accessRestrictedBecauseOfOSVersion;
}

- (BOOL)accessRestrictedBecauseOfDeviceAbandoned
{
  return self->_accessRestrictedBecauseOfDeviceAbandoned;
}

- (BOOL)accessRestrictedBecauseOfCountry
{
  return self->_accessRestrictedBecauseOfCountry;
}

- (BOOL)accessRestrictedBecauseOfAppVersion
{
  return self->_accessRestrictedBecauseOfAppVersion;
}

- (BOOL)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (void)setIsCloudKitAccessAllowed:(BOOL)a3
{
  self->_isCloudKitAccessAllowed = a3;
}

- (void)setIsNetworkUsageExpensive:(BOOL)a3
{
  self->_isNetworkUsageExpensive = a3;
}

- (void)setIsNetworkReachableViaWiFi:(BOOL)a3
{
  self->_isNetworkReachableViaWiFi = a3;
}

- (void)setIsNetworkReachableViaCellular:(BOOL)a3
{
  self->_isNetworkReachableViaCellular = a3;
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_isNetworkReachable = a3;
}

- (void)setIsLowDataModeEnabled:(BOOL)a3
{
  self->_isLowDataModeEnabled = a3;
}

- (void)setCellularRadioAccessTechnology:(int64_t)a3
{
  self->_cellularRadioAccessTechnology = a3;
}

- (int64_t)_cellularRadioAccessTechnology
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v3 = objc_alloc(MEMORY[0x1E0CA6E38]);
  v4 = (void *)objc_msgSend(v3, "initWithQueue:", MEMORY[0x1E0C80D38]);
  v15 = 0;
  objc_msgSend(v4, "getCurrentDataServiceDescriptorSync:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  v7 = v6;
  if (v5)
  {
    v13 = v6;
    objc_msgSend(v4, "getCurrentRat:error:", v5, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;

    if (v8)
    {
      v10 = -[FCNetworkReachability _cellularRadioAccessTechnologyFromString:](self, "_cellularRadioAccessTechnologyFromString:", v8);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke_21;
      v12[3] = &unk_1E4642F58;
      v12[4] = v9;
      __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke_21((uint64_t)v12);
      v10 = 0;
    }

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke;
    v14[3] = &unk_1E4642F58;
    v14[4] = v6;
    __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke((uint64_t)v14);
    v10 = 0;
    v9 = v7;
  }

  return v10;
}

- (BOOL)isNetworkReachableViaCellular
{
  return self->_isNetworkReachableViaCellular;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D60B38], 0);

  v4.receiver = self;
  v4.super_class = (Class)FCNetworkReachability;
  -[FCNetworkReachability dealloc](&v4, sel_dealloc);
}

- (BOOL)isNetworkUsageInexpensive
{
  return !-[FCNetworkReachability isNetworkUsageExpensive](self, "isNetworkUsageExpensive");
}

- (BOOL)isNetworkOnlyReachableViaCellular
{
  _BOOL4 v3;

  v3 = -[FCNetworkReachability isNetworkReachableViaCellular](self, "isNetworkReachableViaCellular");
  if (v3)
    LOBYTE(v3) = !-[FCNetworkReachability isNetworkReachableViaWiFi](self, "isNetworkReachableViaWiFi");
  return v3;
}

- (int64_t)reachabilityStatus
{
  void *v2;
  int64_t v3;

  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNetworkReachable"))
  {
    if ((objc_msgSend(v2, "isNetworkReachableViaCellular") & 1) != 0)
    {
      v3 = 3;
    }
    else if ((objc_msgSend(v2, "isNetworkReachableViaWiFi") & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(v2, "isNetworkReachableViaOther"))
    {
      v3 = 4;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__FCNetworkReachability_removeObserver___block_invoke_2;
    v6[3] = &unk_1E463AD10;
    v6[4] = self;
    v7 = v4;
    FCPerformBlockOnMainThread(v6);

  }
}

void __40__FCNetworkReachability_removeObserver___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is not an observer"), *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCNetworkReachability removeObserver:]_block_invoke_2";
    v8 = 2080;
    v9 = "FCNetworkReachability.m";
    v10 = 1024;
    v11 = 225;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Could not get current data service descriptor: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

uint64_t __55__FCNetworkReachability__cellularRadioAccessTechnology__block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Could not query RAT: %@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (int64_t)_cellularRadioAccessTechnologyFromString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_30;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA6C40]) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C38]) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C70]) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C48]) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C50]) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C18]) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C20]) & 1) != 0)
    {
      v5 = 7;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C28]) & 1) != 0)
    {
      v5 = 8;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C30]) & 1) != 0)
    {
      v5 = 9;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C78]) & 1) != 0)
    {
      v5 = 10;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C58]) & 1) != 0)
    {
      v5 = 11;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C68]) & 1) != 0)
    {
      v5 = 12;
      goto LABEL_31;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CA6C60]) & 1) != 0)
    {
      v5 = 13;
      goto LABEL_31;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
      v8 = 136315906;
      v9 = "-[FCNetworkReachability _cellularRadioAccessTechnologyFromString:]";
      v10 = 2080;
      v11 = "FCNetworkReachability.m";
      v12 = 1024;
      v13 = 380;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

    }
LABEL_30:
    v5 = 0;
    goto LABEL_31;
  }
  v5 = 1;
LABEL_31:

  return v5;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isNetworkReachableViaOther
{
  return self->_isNetworkReachableViaOther;
}

- (void)setIsNetworkReachableViaOther:(BOOL)a3
{
  self->_isNetworkReachableViaOther = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
