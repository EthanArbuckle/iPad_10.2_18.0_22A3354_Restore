@implementation IMMobileNetworkManager

- (IMMobileNetworkManager)init
{
  IMMobileNetworkManager *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  RadiosPreferences *v5;
  RadiosPreferences *radiosPreferences;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMMobileNetworkManager;
  v2 = -[IMMobileNetworkManager init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (RadiosPreferences *)objc_alloc_init((Class)IMWeakLinkClass(CFSTR("RadiosPreferences"), CFSTR("AppSupport")));
    radiosPreferences = v2->_radiosPreferences;
    v2->_radiosPreferences = v5;

    objc_msgSend_setDelegate_(v2->_radiosPreferences, v7, (uint64_t)v2, v8);
    objc_msgSend__createCTServerConnection(v2, v9, v10, v11);
  }
  return v2;
}

- (void)_locked_updateDataStateWithContext:(id)a3
{
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  v16 = 0;
  objc_msgSend_getDataStatus_error_(coreTelephonyClient, v6, (uint64_t)v4, (uint64_t)&v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v7)
  {
    v12 = (void *)objc_msgSend_copyBasic(v7, v8, v9, v10);
    objc_msgSend__locked_updateDataStateBasedOnDataStatus_(self, v13, (uint64_t)v12, v14);

  }
  else
  {
    OSLogHandleForIDSCategory("Network");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_19066D000, v15, OS_LOG_TYPE_DEFAULT, "Failed to query initial data status from telephony { dataError: %@, context: %@ }", buf, 0x16u);
    }

  }
}

- (void)_locked_updateDataStateBasedOnDataStatus:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char hasIndicator;

  v4 = a3;
  self->_isDataPossible = objc_msgSend_cellularDataPossible(v4, v5, v6, v7);
  hasIndicator = objc_msgSend_hasIndicator(v4, v8, v9, v10);

  self->_isDataIndicatorNone = hasIndicator ^ 1;
}

- (void)_locked_updateDataStateBasedOnDataConnectionStatus:(id)a3
{
  uint64_t v3;

  self->_isDataContextActive = objc_msgSend_state(a3, a2, (uint64_t)a3, v3) == 2;
}

- (void)_locked_updateDataConnectionStateWithContext:(id)a3
{
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  coreTelephonyClient = self->_coreTelephonyClient;
  v12 = 0;
  objc_msgSend_getConnectionState_connectionType_error_(coreTelephonyClient, v6, (uint64_t)v4, 0, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v12;
  if (v7)
  {
    objc_msgSend__locked_updateDataStateBasedOnDataConnectionStatus_(self, v8, (uint64_t)v7, v9);
  }
  else
  {
    OSLogHandleForIDSCategory("Network");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_DEFAULT, "Failed to query initial data connection status from telephony { connectionError: %@, context: %@ }", buf, 0x16u);
    }

  }
}

- (void)_locked_recalculateDataContextUsableAndPostNotificationIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  const __CFString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = !self->_isDataIndicatorNone && self->_isDataContextActive && self->_isDataPossible;
  OSLogHandleForIDSCategory("Network");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataPossible)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v23 = 138412290;
    v24 = v7;
    _os_log_impl(&dword_19066D000, v6, OS_LOG_TYPE_DEFAULT, "   Data context is attached: %@", (uint8_t *)&v23, 0xCu);
  }

  OSLogHandleForIDSCategory("Network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataContextActive)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v23 = 138412290;
    v24 = v9;
    _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "   Data context is active: %@", (uint8_t *)&v23, 0xCu);
  }

  OSLogHandleForIDSCategory("Network");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataIndicatorNone)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v23 = 138412290;
    v24 = v11;
    _os_log_impl(&dword_19066D000, v10, OS_LOG_TYPE_DEFAULT, "   Data indicator is none: %@", (uint8_t *)&v23, 0xCu);
  }

  OSLogHandleForIDSCategory("Network");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isDataContextUsable)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v23 = 138412290;
    v24 = v13;
    _os_log_impl(&dword_19066D000, v12, OS_LOG_TYPE_DEFAULT, "   Data context is usable (previous): %@", (uint8_t *)&v23, 0xCu);
  }

  OSLogHandleForIDSCategory("Network");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    if (v5)
      v15 = CFSTR("YES");
    v23 = 138412290;
    v24 = v15;
    _os_log_impl(&dword_19066D000, v14, OS_LOG_TYPE_DEFAULT, "   Data context is usable (new): %@", (uint8_t *)&v23, 0xCu);
  }

  if (self->_isDataContextUsable != v5)
  {
    self->_isDataContextUsable = v5;
    if (v3)
    {
      OSLogHandleForIDSCategory("Network");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = CFSTR("NO");
        if (v5)
          v17 = CFSTR("YES");
        v23 = 138412546;
        v24 = CFSTR("__kIMMobileNetworkManagerDataStatusChangedNotification");
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_DEFAULT, "    => Posting data status changed notification { notification: %@, dataContextUsable: %@ }", (uint8_t *)&v23, 0x16u);
      }

      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___mainThreadPostNotificationName_object_(v21, v22, (uint64_t)CFSTR("__kIMMobileNetworkManagerDataStatusChangedNotification"), 0);

    }
  }
}

- (void)_initializeDataState
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];

  objc_msgSend__dataCTXPCServiceSubscriptionContext(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_lock(self->_lock, v5, v6, v7);
    objc_msgSend__locked_updateDataStateWithContext_(self, v9, (uint64_t)v8, v10);
    objc_msgSend__locked_updateDataConnectionStateWithContext_(self, v11, (uint64_t)v8, v12);
    objc_msgSend__locked_recalculateDataContextUsableAndPostNotificationIfNeeded_(self, v13, 0, v14);
    objc_msgSend_unlock(self->_lock, v15, v16, v17);
  }
  else
  {
    OSLogHandleForIDSCategory("Network");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_19066D000, v18, OS_LOG_TYPE_DEFAULT, "Failed to initialize data state due to nil subscription context", v19, 2u);
    }

  }
}

- (id)_dataCTXPCServiceSubscriptionContext
{
  uint64_t v2;
  id v4;
  CoreTelephonyClient *coreTelephonyClient;
  CTXPCServiceSubscriptionContext *v6;
  CTXPCServiceSubscriptionContext *currentDataSubscriptionContextSync;
  NSObject *v8;
  CTXPCServiceSubscriptionContext *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_currentDataSubscriptionContextSync)
  {
    v4 = 0;
  }
  else
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v11 = 0;
    objc_msgSend_getCurrentDataSubscriptionContextSync_(coreTelephonyClient, a2, (uint64_t)&v11, v2);
    v6 = (CTXPCServiceSubscriptionContext *)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
    self->_currentDataSubscriptionContextSync = v6;

    if (!self->_currentDataSubscriptionContextSync)
    {
      OSLogHandleForIDSCategory("Network");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find relevant telephony subscription context { contextError: %@ }", buf, 0xCu);
      }

    }
  }
  v9 = self->_currentDataSubscriptionContextSync;

  return v9;
}

- (void)_createCTServerConnection
{
  id v3;
  const char *v4;
  uint64_t v5;
  CoreTelephonyClient *v6;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  CoreTelephonyClient *v14;
  __CTServerConnection *ctServerConnection;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_coreTelephonyClient)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA6E38]);
    v6 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v3, v4, MEMORY[0x1E0C80D38], v5);
    coreTelephonyClient = self->_coreTelephonyClient;
    self->_coreTelephonyClient = v6;

    objc_msgSend_setDelegate_(self->_coreTelephonyClient, v8, (uint64_t)self, v9);
    *(_WORD *)&self->_registered = 257;
    objc_msgSend__initializeDataState(self, v10, v11, v12);
  }
  if (!self->_ctServerConnection)
  {
    v17 = 0;
    memset(v16, 0, sizeof(v16));
    self->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    _CTServerConnectionSetTargetQueue();
  }
  if (!self->_coreTelephonyClient || !self->_ctServerConnection)
  {
    OSLogHandleForIDSCategory("Network");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_coreTelephonyClient;
      ctServerConnection = self->_ctServerConnection;
      LODWORD(v16[0]) = 138412546;
      *(_QWORD *)((char *)v16 + 4) = v14;
      WORD6(v16[0]) = 2112;
      *(_QWORD *)((char *)v16 + 14) = ctServerConnection;
      _os_log_impl(&dword_19066D000, v13, OS_LOG_TYPE_DEFAULT, "Failed to create connection(s) to CoreTelephony! { _coreTelephonyClient: %@, _ctServerConnection: %@ }", (uint8_t *)v16, 0x16u);
    }

  }
}

+ (id)sharedInstance
{
  if (qword_1ECD91020 != -1)
    dispatch_once(&qword_1ECD91020, &unk_1E2C42E28);
  return (id)qword_1ECD90FD0;
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *cellAssertion;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  objc_msgSend_setDelegate_(self->_radiosPreferences, a2, 0, v2);
  cellAssertion = self->_cellAssertion;
  if (cellAssertion)
  {
    CFRelease(cellAssertion);
    self->_cellAssertion = 0;
  }
  objc_msgSend__releaseCTServerConnection(self, v4, v5, v6);
  objc_msgSend_lock(self->_lock, v8, v9, v10);
  objc_msgSend_removeAllObjects(self->_cellAutoAssociationTokens, v11, v12, v13);
  objc_msgSend__adjustCellularAutoAssociation(self, v14, v15, v16);
  objc_msgSend_unlock(self->_lock, v17, v18, v19);
  v20.receiver = self;
  v20.super_class = (Class)IMMobileNetworkManager;
  -[IMMobileNetworkManager dealloc](&v20, sel_dealloc);
}

- (void)airplaneModeChanged
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  id v5;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, (uint64_t)CFSTR("__kIMMobileNetworkManagerAirplaneModeChangedNotification"), 0);

}

- (BOOL)isAirplaneModeEnabled
{
  return ((uint64_t (*)(RadiosPreferences *, char *))MEMORY[0x1E0DE7D20])(self->_radiosPreferences, sel_airplaneMode);
}

- (void)_adjustCellularAutoAssociation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  NSMutableSet *cellAutoAssociationTokens;
  NSObject *v9;
  NSMutableSet *v10;
  void *cellAssertion;
  int v12;
  NSMutableSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_autoAssociateCellular(self, a2, v2, v3))
  {
    objc_msgSend_setDataConnectionActive_(self, v5, 1, v6);
    if (!self->_cellAssertion)
    {
      OSLogHandleForIDSCategory("Network");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
        v12 = 138412290;
        v13 = cellAutoAssociationTokens;
        _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "Interface manager: enabling cell assertion (client tokens: %@)", (uint8_t *)&v12, 0xCu);
      }

      _CTServerConnectionPacketContextAssertionCreate();
    }
  }
  else if (self->_cellAssertion)
  {
    OSLogHandleForIDSCategory("Network");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_cellAutoAssociationTokens;
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "Interface manager: disabling cell assertion (client tokens: %@)", (uint8_t *)&v12, 0xCu);
    }

    cellAssertion = self->_cellAssertion;
    if (cellAssertion)
    {
      CFRelease(cellAssertion);
      self->_cellAssertion = 0;
    }
  }
}

- (void)_lockedAdjustCellularAutoAssociation
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
  objc_msgSend__adjustCellularAutoAssociation(self, v5, v6, v7);
  objc_msgSend_unlock(self->_lock, v8, v9, v10);
}

- (BOOL)disableFastDormancy
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13228], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_disableFastDormancy(v4, v5, v6, v7);

  return v8;
}

- (void)addFastDormancyDisableToken:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D13228];
  v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addFastDormancyDisableToken_(v10, v8, (uint64_t)v4, v9);

}

- (void)removeFastDormancyDisableToken:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D13228];
  v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFastDormancyDisableToken_(v10, v8, (uint64_t)v4, v9);

}

- (BOOL)isHostingWiFiHotSpot
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isHostingWiFiHotSpot;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v4, v5, v6, v7);

  return isHostingWiFiHotSpot;
}

- (BOOL)willTryToAutoAssociateWiFiNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_willTryToAutoAssociateWiFiNetwork(v4, v5, v6, v7);

  return v8;
}

- (BOOL)willTryToSearchForWiFiNetwork
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_willTryToSearchForWiFiNetwork(v4, v5, v6, v7);

  return v8;
}

- (NSNumber)wiFiSignalStrength
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wiFiSignalStrength(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v8;
}

- (NSNumber)wiFiScaledRSSI
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wiFiScaledRSSI(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v8;
}

- (NSNumber)wiFiScaledRate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wiFiScaledRate(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v8;
}

- (BOOL)isWiFiUsable
{
  uint64_t v2;
  uint64_t v3;
  int isWiFiEnabled;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isWiFiAssociated;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  isWiFiEnabled = objc_msgSend_isWiFiEnabled(self, a2, v2, v3);
  isWiFiAssociated = objc_msgSend_isWiFiAssociated(self, v6, v7, v8);
  v13 = isWiFiAssociated & (objc_msgSend_isWiFiCaptive(self, v10, v11, v12) ^ 1);
  if (isWiFiEnabled)
    return v13;
  else
    return 0;
}

- (BOOL)isWiFiAssociated
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isWiFiAssociated;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiAssociated = objc_msgSend_isWiFiAssociated(v4, v5, v6, v7);

  return isWiFiAssociated;
}

- (BOOL)isWiFiEnabled
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isWiFiEnabled;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiEnabled = objc_msgSend_isWiFiEnabled(v4, v5, v6, v7);

  return isWiFiEnabled;
}

- (BOOL)isWiFiCaptive
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char isWiFiCaptive;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isWiFiCaptive = objc_msgSend_isWiFiCaptive(v4, v5, v6, v7);

  return isWiFiCaptive;
}

- (BOOL)autoAssociateWiFi
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_autoAssociateWiFi(v4, v5, v6, v7);

  return v8;
}

- (void)addWiFiAutoAssociationClientToken:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D13240];
  v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addWiFiAutoAssociationClientToken_(v10, v8, (uint64_t)v4, v9);

}

- (void)removeWiFiAutoAssociationClientToken:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0D13240];
  v4 = a3;
  objc_msgSend_sharedInstance(v3, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeWiFiAutoAssociationClientToken_(v10, v8, (uint64_t)v4, v9);

}

- (void)showNetworkOptions
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D13240], a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_showNetworkOptions(v7, v4, v5, v6);

}

- (BOOL)autoAssociateCellular
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_lock(self->_lock, a2, v2, v3);
  v8 = objc_msgSend_count(self->_cellAutoAssociationTokens, v5, v6, v7) != 0;
  objc_msgSend_unlock(self->_lock, v9, v10, v11);
  return v8;
}

- (void)addCellularAutoAssociationClientToken:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  NSMutableSet *cellAutoAssociationTokens;
  NSMutableSet *v11;
  NSMutableSet *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSMutableSet *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  __int16 v23;
  NSMutableSet *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend_lock(self->_lock, v4, v5, v6);
    cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
    if (!cellAutoAssociationTokens)
    {
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v12 = self->_cellAutoAssociationTokens;
      self->_cellAutoAssociationTokens = v11;

      cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
    }
    objc_msgSend_addObject_(cellAutoAssociationTokens, v8, (uint64_t)v7, v9);
    objc_msgSend_unlock(self->_lock, v13, v14, v15);
    OSLogHandleForIDSCategory("Network");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_cellAutoAssociationTokens;
      v21 = 138412546;
      v22 = v7;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_DEFAULT, "Client token: %@ being added to Cellular association clients (%@)", (uint8_t *)&v21, 0x16u);
    }

    objc_msgSend__lockedAdjustCellularAutoAssociation(self, v18, v19, v20);
  }

}

- (void)removeCellularAutoAssociationClientToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *cellAutoAssociationTokens;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  NSMutableSet *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    OSLogHandleForIDSCategory("Network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      cellAutoAssociationTokens = self->_cellAutoAssociationTokens;
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = cellAutoAssociationTokens;
      _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Client token: %@ being removed to cellular association clients (%@)", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend_lock(self->_lock, v7, v8, v9);
    objc_msgSend_removeObject_(self->_cellAutoAssociationTokens, v10, (uint64_t)v4, v11);
    objc_msgSend_unlock(self->_lock, v12, v13, v14);
    objc_msgSend__lockedAdjustCellularAutoAssociation(self, v15, v16, v17);
  }

}

- (void)internetConnectionActivationError:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  OSLogHandleForIDSCategory("Network");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a3;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Received core telephony connection activation error callback { error: %d }", (uint8_t *)v13, 8u);
  }

  OSLogHandleForIDSCategory("Network");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_19066D000, v6, OS_LOG_TYPE_DEFAULT, "Failed to bring up data context", (uint8_t *)v13, 2u);
  }

  objc_msgSend_lock(self->_lock, v7, v8, v9);
  self->_shouldBringUpDataContext = 0;
  objc_msgSend_unlock(self->_lock, v10, v11, v12);
}

- (void)internetConnectionStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory("Network");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Received core telephony connection state changed callback { dataConnectionStatusInfo: %@ }", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_lock(self->_lock, v6, v7, v8);
  self->_shouldBringUpDataContext = 1;
  objc_msgSend__locked_updateDataStateBasedOnDataConnectionStatus_(self, v9, (uint64_t)v4, v10);
  objc_msgSend__locked_recalculateDataContextUsableAndPostNotificationIfNeeded_(self, v11, 1, v12);
  objc_msgSend_unlock(self->_lock, v13, v14, v15);

}

- (void)internetDataStatusBasic:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OSLogHandleForIDSCategory("Network");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Received core telephony internetDataStatus callback { dataStatus: %@ }", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend_lock(self->_lock, v6, v7, v8);
  self->_shouldBringUpDataContext = 1;
  objc_msgSend__locked_updateDataStateBasedOnDataStatus_(self, v9, (uint64_t)v4, v10);
  objc_msgSend__locked_recalculateDataContextUsableAndPostNotificationIfNeeded_(self, v11, 1, v12);
  objc_msgSend_unlock(self->_lock, v13, v14, v15);

}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  CTXPCServiceSubscriptionContext *currentDataSubscriptionContextSync;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CTXPCServiceSubscriptionContext *v13;
  CTXPCServiceSubscriptionContext *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  CTXPCServiceSubscriptionContext *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_lock(self->_lock, v5, v6, v7);
  OSLogHandleForIDSCategory("Network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
    v18 = 138412546;
    v19 = currentDataSubscriptionContextSync;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "Interface manager: updating currentDataSimContext. {old: %@; new: %@}",
      (uint8_t *)&v18,
      0x16u);
  }

  v13 = (CTXPCServiceSubscriptionContext *)objc_msgSend_copy(v4, v10, v11, v12);
  v14 = self->_currentDataSubscriptionContextSync;
  self->_currentDataSubscriptionContextSync = v13;

  objc_msgSend_unlock(self->_lock, v15, v16, v17);
}

- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContextSync
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  CTXPCServiceSubscriptionContext *currentDataSubscriptionContextSync;
  CoreTelephonyClient *coreTelephonyClient;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CTXPCServiceSubscriptionContext *v14;
  CTXPCServiceSubscriptionContext *v15;
  NSObject *v16;
  CTXPCServiceSubscriptionContext *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self->_lock, a2, v2, v3);
  currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
  if (!currentDataSubscriptionContextSync)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v22 = 0;
    objc_msgSend_getCurrentDataSubscriptionContextSync_(coreTelephonyClient, v5, (uint64_t)&v22, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;
    v14 = (CTXPCServiceSubscriptionContext *)objc_msgSend_copy(v9, v11, v12, v13);
    v15 = self->_currentDataSubscriptionContextSync;
    self->_currentDataSubscriptionContextSync = v14;

    if (!self->_currentDataSubscriptionContextSync)
    {
      OSLogHandleForIDSCategory("Network");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't get the current context: %@", buf, 0xCu);
      }

    }
    currentDataSubscriptionContextSync = self->_currentDataSubscriptionContextSync;
  }
  v17 = currentDataSubscriptionContextSync;
  objc_msgSend_unlock(self->_lock, v18, v19, v20);
  return v17;
}

- (void)_releaseCTServerConnection
{
  CoreTelephonyClient *coreTelephonyClient;
  __CTServerConnection *ctServerConnection;

  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = 0;

  if (self->_registered)
    *(_WORD *)&self->_registered = 0;
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    self->_ctServerConnection = 0;
    CFRelease(ctServerConnection);
  }
}

- (BOOL)_isDataConnectionAvailable
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  CoreTelephonyClient *coreTelephonyClient;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  const __CFString *v17;
  CoreTelephonyClient *v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  const __CFString *v27;
  int v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!IMPCDoesInterfaceExist())
    return 1;
  if (!self->_registered)
    return 0;
  objc_msgSend_currentDataSubscriptionContextSync(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v15 = 0;
    v28 = 1;
    goto LABEL_22;
  }
  coreTelephonyClient = self->_coreTelephonyClient;
  v32 = 0;
  objc_msgSend_getConnectionState_connectionType_error_(coreTelephonyClient, v6, (uint64_t)v7, 0, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (__CFString *)v32;
  if (v9)
  {
    v14 = objc_msgSend_state(v9, v10, v11, v12);
    v15 = v14 == 2;
    OSLogHandleForIDSCategory("Network");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("NO");
      if (v14 == 2)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v34 = v17;
      _os_log_impl(&dword_19066D000, v16, OS_LOG_TYPE_DEFAULT, "Data context active: %@", buf, 0xCu);
    }

    v18 = self->_coreTelephonyClient;
    v31 = 0;
    objc_msgSend_getDataStatus_error_(v18, v19, (uint64_t)v7, (uint64_t)&v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v31;
    v25 = objc_msgSend_indicator(v20, v22, v23, v24);

    if (v25)
    {
      OSLogHandleForIDSCategory("Network");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = CFSTR("NO");
        if (v14 == 2)
          v27 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl(&dword_19066D000, v26, OS_LOG_TYPE_DEFAULT, "Connection available: %@", buf, 0xCu);
      }

      v28 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    OSLogHandleForIDSCategory("Network");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v13;
      _os_log_impl(&dword_19066D000, v29, OS_LOG_TYPE_DEFAULT, "Couldn't get the connection state: %@", buf, 0xCu);
    }

    v21 = 0;
    v15 = 0;
  }
  v28 = 1;
LABEL_21:

LABEL_22:
  if (v28)
    return 0;
  return v15;
}

- (int)_getCurrentCTDataStatus
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  void *v6;
  CoreTelephonyClient *coreTelephonyClient;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_currentDataSubscriptionContextSync(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v16 = 0;
    objc_msgSend_getDataStatus_error_(coreTelephonyClient, v5, (uint64_t)v6, (uint64_t)&v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    v13 = objc_msgSend_indicator(v8, v10, v11, v12);

    if (v9)
    {
      OSLogHandleForIDSCategory("Network");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_19066D000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't get the data status: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_makeDataConnectionAvailable:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  if (IMPCDoesInterfaceExist() && self->_registered)
  {
    OSLogHandleForIDSCategory("Network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v20 = 138412290;
      v21 = (void *)v6;
      _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "Forcing data connection available: %@", (uint8_t *)&v20, 0xCu);
    }

    OSLogHandleForIDSCategory("Network");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_shouldBringUpDataContext)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v20 = 138412290;
      v21 = (void *)v8;
      _os_log_impl(&dword_19066D000, v7, OS_LOG_TYPE_DEFAULT, "    ShouldBringUpDataContext: %@", (uint8_t *)&v20, 0xCu);
    }

    OSLogHandleForIDSCategory("Network");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isDataContextUsable)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v20 = 138412290;
      v21 = (void *)v10;
      _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "    DataContextUsable: %@", (uint8_t *)&v20, 0xCu);
    }

    if (self->_isDataContextUsable == v3)
    {
      OSLogHandleForIDSCategory("Network");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_DEFAULT, "Data connection is already active", (uint8_t *)&v20, 2u);
      }

    }
    else
    {
      OSLogHandleForIDSCategory("Network");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_19066D000, v12, OS_LOG_TYPE_DEFAULT, "Making cellular data connection active", (uint8_t *)&v20, 2u);
      }

      objc_msgSend__dataCTXPCServiceSubscriptionContext(self, v13, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend_setPacketContextActiveByServiceType_connectionType_active_(self->_coreTelephonyClient, v16, (uint64_t)v17, 0, v3);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          OSLogHandleForIDSCategory("Network");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = 138412290;
            v21 = v18;
            _os_log_impl(&dword_19066D000, v19, OS_LOG_TYPE_DEFAULT, "Failed to make cellular data connection active { error: %@ }", (uint8_t *)&v20, 0xCu);
          }

        }
      }
      else
      {
        OSLogHandleForIDSCategory("Network");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v20) = 0;
          _os_log_impl(&dword_19066D000, v18, OS_LOG_TYPE_DEFAULT, "Failed to make cellular data connection active due to nil subscription context", (uint8_t *)&v20, 2u);
        }
      }

    }
  }
}

- (BOOL)requiresSIMInserted
{
  unint64_t IsUserIdentityModuleRequired;
  int v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t buf[4];
  _DWORD v8[7];

  *(_QWORD *)&v8[5] = *MEMORY[0x1E0C80C00];
  if (self->_ctServerConnection)
  {
    IsUserIdentityModuleRequired = _CTServerConnectionIsUserIdentityModuleRequired();
    v3 = IsUserIdentityModuleRequired;
    v4 = HIDWORD(IsUserIdentityModuleRequired);
    if (HIDWORD(IsUserIdentityModuleRequired))
    {
      OSLogHandleForIDSCategory("Network");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v8[0] = v3;
        LOWORD(v8[1]) = 1024;
        *(_DWORD *)((char *)&v8[1] + 2) = v4;
        _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsUserIdentityModuleRequired failed with error: (%i, %i).", buf, 0xEu);
      }
    }
    else
    {
      OSLogHandleForIDSCategory("Network");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v8 = CFSTR("NO");
        _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsUserIdentityModuleRequired returned: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    OSLogHandleForIDSCategory("Network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionIsUserIdentityModuleRequired failed, missing _ctServerConnection", buf, 2u);
    }
  }

  return 0;
}

- (BOOL)isSIMRemoved
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  char isEqualToString;

  objc_msgSend__telephonyDataSIMStatus(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
    isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x1E0CA77F8], v6);
  else
    isEqualToString = 0;

  return isEqualToString;
}

- (BOOL)isSIMLocked
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  char isEqualToString;

  objc_msgSend__telephonyDataSIMStatus(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
    isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x1E0CA7800], v6);
  else
    isEqualToString = 0;

  return isEqualToString;
}

- (id)_telephonyDataSIMStatus
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  void *v6;
  CoreTelephonyClient *coreTelephonyClient;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend__dataCTXPCServiceSubscriptionContext(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v13 = 0;
    objc_msgSend_getSIMStatus_error_(coreTelephonyClient, v5, (uint64_t)v6, (uint64_t)&v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (!v8)
    {
      OSLogHandleForIDSCategory("Network");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v9;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_19066D000, v10, OS_LOG_TYPE_DEFAULT, "Failed to read SIM status { error: %@, context: %@ }", buf, 0x16u);
      }

    }
  }
  else
  {
    OSLogHandleForIDSCategory("Network");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v11, OS_LOG_TYPE_DEFAULT, "Failed to read SIM status due to nil subscription context", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)showSIMUnlock
{
  uint64_t v2;
  uint64_t v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (objc_msgSend_isSIMLocked(self, a2, v2, v3))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PhoneSettingsPromptForSIMUnlockNotification"), 0, 0, 1u);
  }
}

- (BOOL)inValidSIMState
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  char isPhoneNumberCredentialValid_outError;
  const char *v10;
  void *v11;
  CoreTelephonyClient *coreTelephonyClient;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_isSIMRemoved(self, a2, v2, v3))
  {
    objc_msgSend__dataCTXPCServiceSubscriptionContext(self, v5, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      coreTelephonyClient = self->_coreTelephonyClient;
      v22 = 0;
      isPhoneNumberCredentialValid_outError = objc_msgSend_isPhoneNumberCredentialValid_outError_(coreTelephonyClient, v10, (uint64_t)v11, (uint64_t)&v22);
      v13 = v22;
      if (!v13)
      {
        if ((isPhoneNumberCredentialValid_outError & 1) == 0)
        {
          OSLogHandleForIDSCategory("Network");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19066D000, v21, OS_LOG_TYPE_DEFAULT, "   => CT reports phone credentials are not valid for data subscription context", buf, 2u);
          }

        }
        goto LABEL_14;
      }
      v14 = v13;
      OSLogHandleForIDSCategory("Network");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v14;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_19066D000, v15, OS_LOG_TYPE_DEFAULT, "Failed to query phone number credential validity for data subscription context { error: %@, context: %@ }", buf, 0x16u);
      }

    }
    else
    {
      OSLogHandleForIDSCategory("Network");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v19, OS_LOG_TYPE_DEFAULT, "Failed to read SIM status due to nil subscription context", buf, 2u);
      }

    }
    isPhoneNumberCredentialValid_outError = objc_msgSend__legacy_inValidSIMState(self, v16, v17, v18);
LABEL_14:

    return isPhoneNumberCredentialValid_outError;
  }
  OSLogHandleForIDSCategory("Network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v8, OS_LOG_TYPE_DEFAULT, "   => CT reports SIM is removed -- assuming credential is valid", buf, 2u);
  }

  return 1;
}

- (BOOL)_legacy_inValidSIMState
{
  uint64_t IsPhoneNumberCredentialValid;
  NSObject *v3;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_ctServerConnection)
  {
    OSLogHandleForIDSCategory("Network");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "Failed to query whether phone number credential is valid due to missing CT server connection", buf, 2u);
    }
    goto LABEL_5;
  }
  IsPhoneNumberCredentialValid = _CTServerConnectionIsPhoneNumberCredentialValid();
  if ((_DWORD)IsPhoneNumberCredentialValid)
  {
    OSLogHandleForIDSCategory("Network");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v7 = IsPhoneNumberCredentialValid;
      v8 = 1024;
      v9 = HIDWORD(IsPhoneNumberCredentialValid);
      _os_log_impl(&dword_19066D000, v3, OS_LOG_TYPE_DEFAULT, "Error querying device user identity module { error: (%d:%d) }", buf, 0xEu);
    }
LABEL_5:

    return 1;
  }
  OSLogHandleForIDSCategory("Network");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "   => CT reports phone credentials are not valid", buf, 2u);
  }

  return 0;
}

- (BOOL)dataConnectionExists
{
  return IMPCDoesInterfaceExist();
}

- (BOOL)has2GDataConnection
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend__getCurrentCTDataStatus(self, a2, v2, v3) - 1 < 2;
}

- (BOOL)hasLTEDataConnection
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend__getCurrentCTDataStatus(self, a2, v2, v3) - 7 < 6;
}

- (BOOL)isDataSwitchEnabled
{
  unint64_t IsEnabled;
  int v3;
  unint64_t v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_ctServerConnection)
  {
    OSLogHandleForIDSCategory("Network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionGetCellularDataIsEnabled failed, missing _ctServerConnection", buf, 2u);
    }
    goto LABEL_8;
  }
  IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  v3 = IsEnabled;
  v4 = HIDWORD(IsEnabled);
  if (HIDWORD(IsEnabled))
  {
    OSLogHandleForIDSCategory("Network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v8 = v3;
      v9 = 1024;
      v10 = v4;
      _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "_CTServerConnectionGetCellularDataIsEnabled failed with error: (%i, %i).", buf, 0xEu);
    }
LABEL_8:

    return 0;
  }
  return 0;
}

- (BOOL)isDataConnectionActive
{
  uint64_t v3;
  uint64_t v4;

  if (IMPCDoesInterfaceExist())
    return MEMORY[0x1E0DE7D20](self, sel__isDataConnectionAvailable, v3, v4);
  else
    return 1;
}

- (void)setDataConnectionActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_registered)
  {
    v3 = a3;
    OSLogHandleForIDSCategory("Network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_19066D000, v5, OS_LOG_TYPE_DEFAULT, "SetDataConnectionActive: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend__makeDataConnectionAvailable_(self, v7, v3, v8);
  }
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMutableSet)cellularAutoAssociationTokens
{
  return self->_cellAutoAssociationTokens;
}

- (void)setCellularAutoAssociationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_cellAutoAssociationTokens, a3);
}

- (RadiosPreferences)_radiosPreferences
{
  return self->_radiosPreferences;
}

- (void)set_radiosPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radiosPreferences, a3);
}

- (__CTServerConnection)_ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)set_ctServerConnection:(__CTServerConnection *)a3
{
  self->_ctServerConnection = a3;
}

- (void)_cellAssertion
{
  return self->_cellAssertion;
}

- (void)set_cellAssertion:(void *)a3
{
  self->_cellAssertion = a3;
}

- (CoreTelephonyClient)_coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)set_coreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)shouldBringUpDataContext
{
  return self->_shouldBringUpDataContext;
}

- (void)setShouldBringUpDataContext:(BOOL)a3
{
  self->_shouldBringUpDataContext = a3;
}

- (BOOL)isDataPossible
{
  return self->_isDataPossible;
}

- (void)setIsDataPossible:(BOOL)a3
{
  self->_isDataPossible = a3;
}

- (BOOL)isDataContextActive
{
  return self->_isDataContextActive;
}

- (void)setIsDataContextActive:(BOOL)a3
{
  self->_isDataContextActive = a3;
}

- (BOOL)isDataIndicatorNone
{
  return self->_isDataIndicatorNone;
}

- (void)setIsDataIndicatorNone:(BOOL)a3
{
  self->_isDataIndicatorNone = a3;
}

- (BOOL)isDataContextUsable
{
  return self->_isDataContextUsable;
}

- (void)setIsDataContextUsable:(BOOL)a3
{
  self->_isDataContextUsable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSubscriptionContextSync, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_cellAutoAssociationTokens, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
