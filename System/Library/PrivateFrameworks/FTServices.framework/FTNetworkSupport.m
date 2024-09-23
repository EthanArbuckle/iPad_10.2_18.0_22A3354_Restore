@implementation FTNetworkSupport

+ (id)sharedInstance
{
  if (qword_1ECF9D828 != -1)
    dispatch_once(&qword_1ECF9D828, &unk_1E4DD93D0);
  return (id)qword_1ECF9D870;
}

- (BOOL)allowAnyNetwork
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_sharedInstance(FTUserConfiguration, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_allowAnyNetwork(v3, v4, v5);

  return v6;
}

- (BOOL)validNetworkEnabled
{
  return MEMORY[0x1E0DE7D20](self, sel_validNetworkEnabledForBundleId_, CFSTR("com.apple.facetime"));
}

- (BOOL)validNetworkEnabledForBundleId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  char isAirplaneModeEnabled;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  int v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  char isDataConnectionActive;
  void *v35;
  const char *v36;
  char v37;

  v4 = a3;
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isWiFiEnabled(v7, v8, v9))
    goto LABEL_4;
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isHostingWiFiHotSpot(v12, v13, v14))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend_sharedInstance(FTDeviceSupport, v15, v16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_wifiAllowedForBundleId_(v35, v36, (uint64_t)v4);

  if ((v37 & 1) != 0)
  {
    isDataConnectionActive = 1;
    goto LABEL_10;
  }
LABEL_5:
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v19, v20, v21);

  if ((isAirplaneModeEnabled & 1) == 0
    && ((objc_msgSend_allowAnyNetwork(self, v23, v24) & 1) != 0
     || (objc_msgSend_sharedInstance(FTDeviceSupport, v25, v26),
         v27 = (void *)objc_claimAutoreleasedReturnValue(),
         v29 = objc_msgSend_nonWifiAvailableForBundleId_(v27, v28, (uint64_t)v4),
         v27,
         v29)))
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    isDataConnectionActive = objc_msgSend_isDataConnectionActive(v30, v31, v32);

  }
  else
  {
    isDataConnectionActive = 0;
  }
LABEL_10:

  return isDataConnectionActive;
}

- (BOOL)validNetworkActive
{
  return MEMORY[0x1E0DE7D20](self, sel_validNetworkActiveForBundleId_, CFSTR("com.apple.facetime"));
}

- (BOOL)validNetworkActiveForBundleId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  char v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  char isAirplaneModeEnabled;
  char isWiFiUsable;
  void *v36;
  const char *v37;
  uint64_t v38;

  v4 = a3;
  if ((objc_msgSend_allowAnyNetwork(self, v5, v6) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend_sharedInstance(FTDeviceSupport, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_nonWifiAvailableForBundleId_(v10, v11, (uint64_t)v4);

  }
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isWiFiAssociated(v12, v13, v14))
  {
    objc_msgSend_sharedInstance(FTDeviceSupport, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_wifiAllowedForBundleId_(v17, v18, (uint64_t)v4);

  }
  else
  {
    v19 = 0;
  }

  if (v9)
  {
    objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_currentReachabilityStatus(v22, v23, v24);
    if ((v19 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    objc_msgSend_reachabilityForLocalWiFi(FTEmbeddedReachability, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_currentReachabilityStatus(v22, v28, v29);
    if ((v19 & 1) != 0)
      goto LABEL_16;
    v27 = v30;
  }
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v25, v26);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v31, v32, v33);

  isWiFiUsable = 0;
  if ((isAirplaneModeEnabled & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
LABEL_14:
    if ((unint64_t)(v27 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v25, v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      isWiFiUsable = objc_msgSend_isWiFiUsable(v36, v37, v38);

      goto LABEL_17;
    }
LABEL_16:
    isWiFiUsable = 1;
  }
LABEL_17:

  return isWiFiUsable;
}

- (BOOL)validNetworkReachable
{
  return MEMORY[0x1E0DE7D20](self, sel_validNetworkReachableForBundleId_, CFSTR("com.apple.facetime"));
}

- (BOOL)validNetworkReachableForBundleId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int v22;
  BOOL v23;
  BOOL v24;

  v4 = a3;
  objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_currentReachabilityStatus(v7, v8, v9);
  objc_msgSend_sharedInstance(FTDeviceSupport, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_wifiAllowedForBundleId_(v13, v14, (uint64_t)v4);

  if ((objc_msgSend_allowAnyNetwork(self, v16, v17) & 1) != 0
    || (objc_msgSend_sharedInstance(FTDeviceSupport, v18, v19),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend_nonWifiAvailableForBundleId_(v20, v21, (uint64_t)v4),
        v20,
        v22))
  {
    if (v10 == 1)
      v23 = v15;
    else
      v23 = 0;
    v24 = v10 == 2 || v23;
  }
  else if (v10 == 1)
  {
    v24 = v15;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)wiFiActiveAndReachable
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char isHostingWiFiHotSpot;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isWiFiEnabled(v3, v4, v5))
  {
    v14 = 0;
LABEL_6:

    return v14;
  }
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v8, v9, v10);

  if ((isHostingWiFiHotSpot & 1) == 0)
  {
    objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v12, v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_currentReachabilityStatus(v3, v15, v16) == 1;
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)willSearchForNetwork
{
  return MEMORY[0x1E0DE7D20](self, sel_willSearchForNetworkForBundleId_, CFSTR("com.apple.facetime"));
}

- (BOOL)willSearchForNetworkForBundleId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;

  v4 = a3;
  if ((objc_msgSend_validNetworkReachable(self, v5, v6) & 1) != 0
    || (objc_msgSend_sharedInstance(FTDeviceSupport, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend_wifiAllowedForBundleId_(v9, v10, (uint64_t)v4),
        v9,
        !v11))
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    if ((objc_msgSend_allowAnyNetwork(self, v12, v13) & 1) != 0
      || (objc_msgSend_sharedInstance(FTDeviceSupport, v14, v15),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend_nonWifiAvailableForBundleId_(v16, v17, (uint64_t)v4),
          v16,
          v18))
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_isDataConnectionActive(v19, v20, v21) ^ 1;
    }
    else
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_willTryToSearchForWiFiNetwork(v19, v24, v25) & 1) != 0)
      {
        LOBYTE(v22) = 1;
      }
      else
      {
        objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v22) = objc_msgSend_willTryToAutoAssociateWiFiNetwork(v28, v29, v30);

      }
    }

  }
  return v22;
}

- (BOOL)dataActiveAndReachable
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int isDataConnectionActive;
  const __CFString *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const __CFString *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  int isAirplaneModeEnabled;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  const __CFString *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend_isDataConnectionActive(v3, v4, v5);

  if ((_DWORD)v6)
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      isDataConnectionActive = objc_msgSend_isDataConnectionActive(v10, v11, v12);
      v14 = CFSTR("NO");
      if (isDataConnectionActive)
        v14 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v36 = (uint64_t)v14;
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "dataActiveAndReachable: isDataConnectionActive: %@", buf, 0xCu);

    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_isDataConnectionActive(v17, v18, v19);
      v21 = CFSTR("NO");
      if (v20)
        v21 = CFSTR("YES");
      v34 = v21;
      _IDSLogV();

    }
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v15, v16, v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isAirplaneModeEnabled = objc_msgSend_isAirplaneModeEnabled(v22, v23, v24);

    if (isAirplaneModeEnabled)
    {
      OSLogHandleForIDSCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v28, OS_LOG_TYPE_DEFAULT, "dataActiveAndReachable: isAirplaneModeEnabled, return NO", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      LOBYTE(v6) = 0;
    }
    else
    {
      objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend_currentReachabilityStatus(v29, v30, v31);
      OSLogHandleForIDSCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v36 = v6;
        _os_log_impl(&dword_1A4C7F000, v32, OS_LOG_TYPE_DEFAULT, "dataActiveAndReachable: status = %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV();
      LOBYTE(v6) = v6 == 2;

    }
  }
  return v6;
}

- (BOOL)networkEnabled
{
  return 1;
}

- (BOOL)networkActive
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  char isWiFiUsable;

  objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend_currentReachabilityStatus(v3, v4, v5) - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    isWiFiUsable = 1;
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A68], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isWiFiUsable = objc_msgSend_isWiFiUsable(v8, v9, v10);

  }
  return isWiFiUsable;
}

- (BOOL)networkReachable
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_reachabilityForInternetConnection(FTEmbeddedReachability, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)(objc_msgSend_currentReachabilityStatus(v3, v4, v5) - 1) < 2;

  return v6;
}

- (void)_createAPSConnectionIfNeeded
{
  id v3;
  id v4;
  objc_class *APSConnectionClass;
  id v6;
  void *v7;
  const char *v8;
  APSConnection *v9;
  APSConnection *apsConnection;
  NSObject *v11;
  uint8_t v12[8];
  uint64_t v13;

  if (!self->_apsConnection)
  {
    v13 = 0;
    IMGetConferenceSettings();
    v3 = 0;
    v4 = *(id *)MEMORY[0x1A85A5DEC]("APSConnectionOverrideNamedDelegatePort", CFSTR("ApplePushService"));
    APSConnectionClass = self->_APSConnectionClass;
    if (!APSConnectionClass)
    {
      APSConnectionClass = (objc_class *)MEMORY[0x1A85A5DE0](CFSTR("APSConnection"), CFSTR("ApplePushService"));
      self->_APSConnectionClass = APSConnectionClass;
    }
    v6 = [APSConnectionClass alloc];
    im_primary_queue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (APSConnection *)objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(v6, v8, (uint64_t)v3, v4, v7);
    apsConnection = self->_apsConnection;
    self->_apsConnection = v9;

    if (!self->_apsConnection)
    {
      OSLogHandleForIDSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_ERROR, "Could not create APS Connection for critical reliability check", v12, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }

  }
}

- (BOOL)enableCriticalReliability
{
  return self->_enableCriticalReliability;
}

- (void)_clearReliabilityTimeoutInterval
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  IMDispatchTimer *reliabilityAttemptTimer;
  uint8_t v7[16];

  if (self->_reliabilityAttemptTimer)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "Clearing out reliability check timer", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
        _IDSLogV();
    }
    objc_msgSend_invalidate(self->_reliabilityAttemptTimer, v4, v5);
    reliabilityAttemptTimer = self->_reliabilityAttemptTimer;
    self->_reliabilityAttemptTimer = 0;

  }
}

- (void)_setReliabilityTimeoutInterval
{
  uint64_t v2;
  id v4;
  void *v5;
  const char *v6;
  IMDispatchTimer *v7;
  IMDispatchTimer *reliabilityAttemptTimer;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[5];

  objc_msgSend__clearReliabilityTimeoutInterval(self, a2, v2);
  v4 = objc_alloc(MEMORY[0x1E0D36A18]);
  dispatch_get_global_queue(0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A4C9360C;
  v11[3] = &unk_1E4DD9A50;
  v11[4] = self;
  v7 = (IMDispatchTimer *)objc_msgSend_initWithQueue_interval_repeats_handlerBlock_(v4, v6, (uint64_t)v5, 10, 1, v11);
  reliabilityAttemptTimer = self->_reliabilityAttemptTimer;
  self->_reliabilityAttemptTimer = v7;

  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "Setting reliability check timer", v10, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog())
      _IDSLogV();
  }
}

- (void)_reallySetCriticalReliability:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  APSConnection *apsConnection;
  const char *v13;
  const __CFString *v14;
  APSConnection *v15;
  const __CFString *v16;
  APSConnection *v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  self->_criticalReliabilityEnabledState = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("YES");
    if (self->_criticalReliabilityEnabledState)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (!v3)
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = (void *)v6;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Updating critical reliability state from: %@ to: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v8 = CFSTR("YES");
    if (self->_criticalReliabilityEnabledState)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    if (!v3)
      v8 = CFSTR("NO");
    v16 = v9;
    v17 = (APSConnection *)v8;
    _IDSLogV();
  }
  OSLogHandleForIDSCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    apsConnection = self->_apsConnection;
    if (v3)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = apsConnection;
    _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Setting push critical state to: %@ (Connection: %@)", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v14 = CFSTR("NO");
    if (v3)
      v14 = CFSTR("YES");
    v16 = v14;
    v17 = self->_apsConnection;
    _IDSLogV();
  }
  objc_msgSend_setEnableCriticalReliability_(self->_apsConnection, v13, self->_criticalReliabilityEnabledState, v16, v17);
  if (!self->_criticalReliabilityEnabledState)
  {
    v15 = self->_apsConnection;
    self->_apsConnection = 0;

  }
}

- (void)_tryToEnableReliability
{
  FTNetworkSupport *v2;
  const char *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  const __CFString *v26;
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_enableCriticalReliability)
    objc_msgSend__createAPSConnectionIfNeeded(v2, v3, v4);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v2->_enableCriticalReliability)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Trying to set push critical state to: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (v2->_enableCriticalReliability)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v26 = v9;
    _IDSLogV();
  }
  if (!v2->_enableCriticalReliability)
  {
    objc_msgSend__reallySetCriticalReliability_(v2, v7, 0);
    objc_msgSend__clearReliabilityTimeoutInterval(v2, v19, v20);
    goto LABEL_36;
  }
  objc_msgSend_sharedInstance(FTDeviceSupport, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_conferencingAllowed(v10, v11, v12);

  if ((v13 & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v21, OS_LOG_TYPE_DEFAULT, " => Bailing, facetime is disabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && (_IDSShouldLog() & 1) != 0)
      goto LABEL_34;
    goto LABEL_35;
  }
  if ((objc_msgSend_validNetworkEnabled(v2, v14, v15) & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v23, OS_LOG_TYPE_DEFAULT, " => Bailing, network is disabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && (_IDSShouldLog() & 1) != 0)
      goto LABEL_34;
    goto LABEL_35;
  }
  if ((objc_msgSend_validNetworkActive(v2, v16, v17) & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v24, OS_LOG_TYPE_DEFAULT, " => Bailing, network is not active", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
LABEL_34:
      _IDSLogV();
      objc_msgSend__reallySetCriticalReliability_(v2, v25, 0, v26);
      goto LABEL_36;
    }
LABEL_35:
    objc_msgSend__reallySetCriticalReliability_(v2, v22, 0, v26);
    goto LABEL_36;
  }
  objc_msgSend__reallySetCriticalReliability_(v2, v18, 1, v26);
LABEL_36:
  objc_sync_exit(v2);

}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  _BOOL8 v3;
  FTNetworkSupport *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  const char *v10;
  const __CFString *v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_enableCriticalReliability != v3)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Setting pending set push critical state to: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v11 = v9;
      _IDSLogV();
    }
    v4->_enableCriticalReliability = v3;
    if (v3)
      objc_msgSend__setReliabilityTimeoutInterval(v4, v7, v8);
    else
      objc_msgSend__clearReliabilityTimeoutInterval(v4, v7, v8);
    objc_msgSend__reallySetCriticalReliability_(v4, v10, v3, v11);
  }
  objc_sync_exit(v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reliabilityAttemptTimer, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

@end
