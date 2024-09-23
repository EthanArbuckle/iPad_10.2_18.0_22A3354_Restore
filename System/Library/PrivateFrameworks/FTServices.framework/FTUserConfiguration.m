@implementation FTUserConfiguration

+ (id)sharedInstance
{
  if (qword_1ECF9D848 != -1)
    dispatch_once(&qword_1ECF9D848, &unk_1E4DD94B0);
  return (id)qword_1ECF9D890;
}

- (FTUserConfiguration)init
{
  FTUserConfiguration *v2;
  const char *v3;
  uint64_t v4;
  FTUserConfiguration *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *cellularDataAvailableCache;
  NSMutableDictionary *v14;
  NSMutableDictionary *wifiAllowedCache;
  NSMutableDictionary *v16;
  NSMutableDictionary *nonBTAllowedCache;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)FTUserConfiguration;
  v2 = -[FTUserConfiguration init](&v19, sel_init);
  v5 = v2;
  if (v2)
  {
    v2->_shouldCacheCTConnection = 1;
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_isEqualToString_(v9, v10, (uint64_t)CFSTR("InCallService")) & 1) != 0)
    {
      OSLogHandleForIDSCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_1A4C7F000, v11, OS_LOG_TYPE_DEFAULT, "Not building UserConfiguration cache for {processName: %@}", buf, 0xCu);
      }

      v5->_shouldCacheCTConnection = 0;
    }
    else
    {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      cellularDataAvailableCache = v5->_cellularDataAvailableCache;
      v5->_cellularDataAvailableCache = v12;

      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      wifiAllowedCache = v5->_wifiAllowedCache;
      v5->_wifiAllowedCache = v14;

      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      nonBTAllowedCache = v5->_nonBTAllowedCache;
      v5->_nonBTAllowedCache = v16;

    }
  }
  return v5;
}

- (void)dealloc
{
  __CTServerConnection *ctServerConnection;
  objc_super v4;

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
    CFRelease(ctServerConnection);
  v4.receiver = self;
  v4.super_class = (Class)FTUserConfiguration;
  -[FTUserConfiguration dealloc](&v4, sel_dealloc);
}

- (__CTServerConnection)ctServerConnection
{
  __CTServerConnection *ctServerConnection;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id location;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  ctServerConnection = self->_ctServerConnection;
  if (!ctServerConnection)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    im_primary_queue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v17, &location);
    ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    if (ctServerConnection)
    {
      v5 = *MEMORY[0x1E0CA7490];
      v6 = _CTServerConnectionRegisterForNotification();
      v7 = v6;
      if ((_DWORD)v6)
      {
        v8 = HIDWORD(v6);
        OSLogHandleForIDSCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v20 = v5;
          v21 = 1024;
          v22 = v7;
          v23 = 1024;
          v24 = v8;
          _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_ERROR, "Failed to register CT server DataAccessPolicyChanged notification %@ (domain: %d error: %d).", buf, 0x18u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
      v10 = *MEMORY[0x1E0CA7358];
      v11 = _CTServerConnectionRegisterForNotification();
      v12 = v11;
      if (!(_DWORD)v11)
        goto LABEL_17;
      v13 = HIDWORD(v11);
      OSLogHandleForIDSCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v20 = v10;
        v21 = 1024;
        v22 = v12;
        v23 = 1024;
        v24 = v13;
        _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_ERROR, "Failed to register CT server ConnectionInvalidated notification %@ (domain: %d error: %d).", buf, 0x18u);
      }

      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_17;
    }
    else
    {
      OSLogHandleForIDSCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4C7F000, v15, OS_LOG_TYPE_ERROR, "Failed to create CT server connection", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled())
        goto LABEL_17;
    }
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
LABEL_17:
    if (self->_shouldCacheCTConnection)
    {
      self->_ctServerConnection = ctServerConnection;
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      return self->_ctServerConnection;
    }
    else
    {
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return ctServerConnection;
}

- (void)_clearCaches
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  pthread_mutex_lock(&stru_1ECF9D5E8);
  objc_msgSend_removeAllObjects(self->_cellularDataAvailableCache, v3, v4);
  pthread_mutex_unlock(&stru_1ECF9D5E8);
  pthread_mutex_lock(&stru_1ECF9D5A8);
  objc_msgSend_removeAllObjects(self->_wifiAllowedCache, v5, v6);
  pthread_mutex_unlock(&stru_1ECF9D5A8);
  pthread_mutex_lock(&stru_1ECF9D568);
  objc_msgSend_removeAllObjects(self->_nonBTAllowedCache, v7, v8);
  pthread_mutex_unlock(&stru_1ECF9D568);
}

- (void)_setAppCellularDataEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const char *v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_ctServerConnection(self, a2, a3))
  {
    v10 = *MEMORY[0x1E0CA7320];
    v5 = (_QWORD *)MEMORY[0x1E0CA7328];
    if (!v3)
      v5 = (_QWORD *)MEMORY[0x1E0CA7330];
    v11[0] = *v5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v4, (uint64_t)v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _CTServerConnectionSetCellularUsagePolicy();

  }
  else
  {
    OSLogHandleForIDSCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = CFSTR("com.apple.facetime");
      _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_ERROR, "Failed to set the data usage policy for bundle %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (BOOL)_getCellularDataEnabledForBundleID:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    pthread_mutex_lock(&stru_1ECF9D5E8);
    objc_msgSend_objectForKey_(self->_cellularDataAvailableCache, v5, (uint64_t)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (objc_msgSend_ctServerConnection(self, v6, v7))
      {
        v9 = _CTServerConnectionCopyCellularUsagePolicy();
        OSLogHandleForIDSCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v17 = 0;
          v18 = 1024;
          v19 = v9;
          v20 = 1024;
          v21 = HIDWORD(v9);
          _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "_getCellularDataEnabledForBundleID copied cellularPolicy %@ {ctError.domain: %d, ctError.error: %d}", buf, 0x18u);
        }
      }
      else
      {
        OSLogHandleForIDSCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "_getCellularDataEnabledForBundleID unable to get a server connection", buf, 2u);
        }
      }

      OSLogHandleForIDSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_ERROR, "Failed to get the data usage policy for bundle %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      v8 = 0;
    }
    pthread_mutex_unlock(&stru_1ECF9D5E8);
    v11 = objc_msgSend_BOOLValue(v8, v13, v14);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_getWifiDataAllowedForBundleID:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    pthread_mutex_lock(&stru_1ECF9D5A8);
    objc_msgSend_objectForKey_(self->_wifiAllowedCache, v5, (uint64_t)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      if (objc_msgSend_ctServerConnection(self, v6, v7))
      {
        v9 = _CTServerConnectionCopyCellularUsagePolicy();
        OSLogHandleForIDSCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v17 = 0;
          v18 = 1024;
          v19 = v9;
          v20 = 1024;
          v21 = HIDWORD(v9);
          _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "_getWifiDataAllowedForBundleID copied cellularPolicy %@ {ctError.domain: %d, ctError.error: %d}", buf, 0x18u);
        }
      }
      else
      {
        OSLogHandleForIDSCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "_getWifiDataAllowedForBundleID unable to get a server connection", buf, 2u);
        }
      }

      OSLogHandleForIDSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_ERROR, "Failed to get the data usage policy for bundle %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      v8 = 0;
    }
    pthread_mutex_unlock(&stru_1ECF9D5A8);
    v11 = objc_msgSend_BOOLValue(v8, v13, v14);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setupUsageHandlerIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if (!self->_usageClient)
  {
    objc_msgSend_weakRefWithObject_(MEMORY[0x1E0D36B18], a2, (uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_usageClient = (network_usage_policy_client_s *)network_usage_policy_create_client();
    im_primary_queue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v3;
    v5 = v3;
    network_usage_policy_set_changed_handler();

  }
}

- (BOOL)_getNonBluetoothDataAllowedForBundleID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  void *v9;
  dispatch_semaphore_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  char v16;
  id v18;
  id v19;
  NSObject *v20;
  _QWORD v21[3];
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  if (v4)
  {
    pthread_mutex_lock(&stru_1ECF9D568);
    objc_msgSend__setupUsageHandlerIfNeeded(self, v5, v6);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = sub_1A4CACA54;
    v27 = sub_1A4CACA64;
    v28 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_msgSend_objectForKey_(self->_nonBTAllowedCache, v7, (uint64_t)v4);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    if (!v24[5])
    {
      objc_msgSend_weakRefWithObject_(MEMORY[0x1E0D36B18], v8, (uint64_t)self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v22 = 1;
      v10 = dispatch_semaphore_create(0);
      v11 = objc_retainAutorelease(v4);
      objc_msgSend_UTF8String(v11, v12, v13);
      v18 = v11;
      v19 = v9;
      v20 = v10;
      network_usage_policy_get_for_bundle();
      dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

      _Block_object_dispose(v21, 8);
    }
    pthread_mutex_unlock(&stru_1ECF9D568);
    v16 = objc_msgSend_BOOLValue((void *)v24[5], v14, v15);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_adequateInternalOrCarrierInstall
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  char v8;
  void *v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isInternalInstall(v3, v4, v5) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isCarrierInstall(v9, v10, v11))
      v8 = IMGetAppBoolForKey();
    else
      v8 = 0;

  }
  return v8;
}

- (BOOL)cellularFaceTimeEnabled
{
  return objc_msgSend_cellularDataEnabledForBundleId_(self, a2, (uint64_t)CFSTR("com.apple.facetime"));
}

- (BOOL)cellularDataEnabledForBundleId:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel__getCellularDataEnabledForBundleID_, a3);
}

- (BOOL)wifiAllowedForBundleId:(id)a3
{
  return MEMORY[0x1E0DE7D20](self, sel__getWifiDataAllowedForBundleID_, a3);
}

- (BOOL)nonBluetoothAllowedForBundleId:(id)a3
{
  return 1;
}

- (void)setCellularFaceTimeEnabled:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](self, sel__setAppCellularDataEnabled_, a3);
}

- (BOOL)allowAnyNetwork
{
  uint64_t v2;
  int v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;

  v3 = objc_msgSend__adequateInternalOrCarrierInstall(self, a2, v2);
  if (v3)
  {
    if ((IMGetDomainBoolForKey() & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)CFSTR("/Library/Preferences/SystemConfiguration/rtether.plist"));

      LOBYTE(v3) = v8;
    }
  }
  return v3;
}

- (void)setAllowAnyNetwork:(BOOL)a3
{
  IMSetDomainBoolForKey();
}

- (NSArray)selectedPhoneNumberRegistrationSubscriptionLabels
{
  void *v3;
  const char *v4;
  id v5;
  const char *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A85A5CFC](CFSTR("com.apple.conference"), CFSTR("phoneNumberRegistrationSubscriptionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v8[0] = v3;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v4, (uint64_t)v8, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSelectedPhoneNumberRegistrationSubscriptionLabels_(self, v6, (uint64_t)v5);
LABEL_7:

  return (NSArray *)v5;
}

- (void)setSelectedPhoneNumberRegistrationSubscriptionLabels:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v4 = a3;
  objc_msgSend_silentlySetSelectedPhoneNumberRegistrationSubscriptionLabels_(self, v5, (uint64_t)v4);
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v9, v8, (uint64_t)CFSTR("FTUserConfigurationSelectedSubscriptionLabelDidChange"), v4);

}

- (void)silentlySetSelectedPhoneNumberRegistrationSubscriptionLabels:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Setting persisted phone number registration subscription label {subscriptionLabels: %@}", (uint8_t *)&v5, 0xCu);
  }

  IMSetDomainValueForKey();
}

- (NSNumber)selectedPhoneNumberRegistrationSubscriptionNumber
{
  void *v2;
  id v3;

  MEMORY[0x1A85A5CFC](CFSTR("com.apple.conference"), CFSTR("phoneNumberRegistrationSubscriptionNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return (NSNumber *)v3;
}

- (void)setIsDeviceInDualPhoneIdentityMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Setting persisted dual phone identity mode {isDeviceInDualPhoneIdentityMode: %@}", (uint8_t *)&v6, 0xCu);
  }

  IMSetDomainBoolForKey();
}

- (BOOL)isDeviceInDualPhoneIdentityMode
{
  return IMGetDomainBoolForKey();
}

- (void)setIsDeviceInManualPhoneSelectionMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Setting persisted manual phone identity mode {isDeviceInManualPhoneSelectionMode: %@}", (uint8_t *)&v6, 0xCu);
  }

  IMSetDomainBoolForKey();
}

- (BOOL)isDeviceInManualPhoneSelectionMode
{
  return IMGetDomainBoolForKey();
}

- (BOOL)_nonWifiFaceTimeEntitled
{
  uint64_t v2;
  int v3;

  v3 = objc_msgSend__adequateInternalOrCarrierInstall(self, a2, v2);
  if (v3)
    LOBYTE(v3) = IMGetCachedDomainBoolForKey();
  return v3;
}

- (NSMutableDictionary)nonBTAllowedCache
{
  return self->_nonBTAllowedCache;
}

- (void)setNonBTAllowedCache:(id)a3
{
  objc_storeStrong((id *)&self->_nonBTAllowedCache, a3);
}

- (void)setCtServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (BOOL)shouldCacheCTConnection
{
  return self->_shouldCacheCTConnection;
}

- (void)setShouldCacheCTConnection:(BOOL)a3
{
  self->_shouldCacheCTConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonBTAllowedCache, 0);
  objc_storeStrong((id *)&self->_wifiAllowedCache, 0);
  objc_storeStrong((id *)&self->_cellularDataAvailableCache, 0);
}

@end
