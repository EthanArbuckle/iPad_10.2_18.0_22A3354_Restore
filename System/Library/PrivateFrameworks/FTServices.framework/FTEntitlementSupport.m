@implementation FTEntitlementSupport

- (FTEntitlementSupport)init
{
  const char *v2;
  uint64_t v3;
  FTEntitlementSupport *v4;
  const void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FTEntitlementSupport;
  v4 = -[FTEntitlementSupport init](&v7, sel_init);
  if (v4)
  {
    v5 = (const void *)*MEMORY[0x1E0CA71A0];
    v4->_entitlementStatus = (__CFString *)*MEMORY[0x1E0CA71A0];
    if (v5)
      CFRetain(v5);
    objc_msgSend__setupCTServerConnection(v4, v2, v3);
  }
  return v4;
}

- (void)_updateEntitlementStatusUsingCTEntitlementsInfo:(__CFDictionary *)a3
{
  NSObject *v5;
  uint64_t v6;
  __CFString *entitlementStatus;
  const void *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  __CFString *v16;
  int v17;
  __CFDictionary *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = a3;
    _os_log_impl(&dword_1A4C7F000, v5, OS_LOG_TYPE_DEFAULT, "Entitlement update: %@", (uint8_t *)&v17, 0xCu);
  }

  if (a3)
  {
    entitlementStatus = self->_entitlementStatus;
    if (entitlementStatus)
    {
      CFRelease(entitlementStatus);
      self->_entitlementStatus = 0;
    }
    v8 = (const void *)*MEMORY[0x1E0CA7198];
    if (*MEMORY[0x1E0CA7198])
      self->_entitlementStatus = (__CFString *)CFDictionaryGetValue(a3, v8);
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], (const char *)v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_entitlementStatus;
      v17 = 138412290;
      v18 = (__CFDictionary *)v10;
      _os_log_impl(&dword_1A4C7F000, v9, OS_LOG_TYPE_DEFAULT, "CT returned entitlement value: %@", (uint8_t *)&v17, 0xCu);
    }

    v11 = self->_entitlementStatus;
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, " => saving it", (uint8_t *)&v17, 2u);
      }

      v16 = self->_entitlementStatus;
LABEL_17:
      CFRetain(v16);
      return;
    }
    if (v15)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, " => empty value, defaulting to allowed", (uint8_t *)&v17, 2u);
    }

    v16 = (__CFString *)*MEMORY[0x1E0CA71A0];
    self->_entitlementStatus = (__CFString *)*MEMORY[0x1E0CA71A0];
    if (v16)
      goto LABEL_17;
  }
}

- (BOOL)_setupCTServerConnection
{
  uint64_t v2;
  BOOL v3;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  __CTServerConnection *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint8_t v20[16];
  uint8_t buf[16];
  __int128 v22;
  uint64_t v23;

  if (self->_ctServerConnection)
    return 1;
  objc_msgSend__cleanupMachInfo(self, a2, v2);
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to CT for requests", buf, 2u);
  }

  v23 = 0;
  *(_OWORD *)buf = 0u;
  v22 = 0u;
  v8 = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
  self->_ctServerConnection = v8;
  v3 = v8 != 0;
  if (v8)
  {
    im_primary_queue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _CTServerConnectionSetTargetQueue();

    if ((unint64_t)_CTServerConnectionRegisterForNotification() >> 32)
    {
      OSLogHandleForIDSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_ERROR, "Carrier Entitlements: Could not register for Message received notification", v20, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CA7360], 0);
    objc_msgSend__registerForCTEntitlementNotifications(self, v14, v15);
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1A4C7F000, v16, OS_LOG_TYPE_DEFAULT, " ** Failed connection", v20, 2u);
    }

    objc_msgSend__cleanupMachInfo(self, v17, v18);
  }
  return v3;
}

- (BOOL)_registerForCTEntitlementNotifications
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  unint64_t CarrierEntitlements;
  const char *v16;
  uint64_t v17;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v3, OS_LOG_TYPE_DEFAULT, "Registering for CT entitlement requests", buf, 2u);
  }

  IMSingleObjectArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v4, v5, v6))
  {
    v9 = _CTServerConnectionVerifyCarrierEntitlements();
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (HIDWORD(v9))
    {
      if (!v13)
      {
LABEL_20:

        goto LABEL_21;
      }
      *(_DWORD *)buf = 134218240;
      v26 = (int)v9;
      v27 = 2048;
      v28 = v9 >> 32;
      v21 = " => Failed registration (domain: %ld error: %ld)";
      v22 = v12;
      v23 = 22;
LABEL_19:
      _os_log_impl(&dword_1A4C7F000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      goto LABEL_20;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, " => Registered for entitlements updates", buf, 2u);
    }

  }
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v14, OS_LOG_TYPE_DEFAULT, "Retrieving initial CT carrier entitlements", buf, 2u);
  }

  CarrierEntitlements = _CTServerConnectionGetCarrierEntitlements();
  if (!HIDWORD(CarrierEntitlements))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v16, v17);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v21 = " => Initial carrier CT entitlements dictionary was NULL";
    v22 = v12;
    v23 = 2;
    goto LABEL_19;
  }
  v19 = CarrierEntitlements;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], v16, v17);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v26 = (int)v19;
    v27 = 2048;
    v28 = v19 >> 32;
    _os_log_impl(&dword_1A4C7F000, v20, OS_LOG_TYPE_DEFAULT, " => Failed to retrieve initial CT carrier entitlements (domain: %ld error: %ld)", buf, 0x16u);
  }

LABEL_21:
  return 0;
}

- (void)_cleanupMachInfo
{
  uint64_t v2;
  NSObject *v4;
  __CTServerConnection *ctServerConnection;
  uint8_t v6[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, " Cleaning up mach bits", v6, 2u);
  }

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    self->_ctServerConnection = 0;
    CFRelease(ctServerConnection);
  }
}

+ (id)sharedInstance
{
  if (qword_1ECF9D840 != -1)
    dispatch_once(&qword_1ECF9D840, &unk_1E4DD9490);
  return (id)qword_1ECF9D888;
}

- (BOOL)faceTimeNonWiFiEntitled
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  char v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  const char *v14;
  uint64_t v15;
  NSObject *v17;
  NSObject *v18;
  __CFString *entitlementStatus;
  int v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sharedInstance(FTDeviceSupport, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_supportsNonWiFiFaceTime(v4, v5, v6);

  if ((v7 & 1) != 0)
  {
    objc_msgSend_sharedInstance(FTUserConfiguration, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend__nonWifiFaceTimeEntitled(v10, v11, v12);

    if ((v13 & 1) != 0)
    {
      return 1;
    }
    else
    {
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        entitlementStatus = self->_entitlementStatus;
        v20 = 138412290;
        v21 = entitlementStatus;
        _os_log_impl(&dword_1A4C7F000, v18, OS_LOG_TYPE_DEFAULT, "Returning entitlement based on status: %@", (uint8_t *)&v20, 0xCu);
      }

      return CFEqual(self->_entitlementStatus, (CFTypeRef)*MEMORY[0x1E0CA71A8]) == 0;
    }
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "This device does not support non WiFi facetime, thus we're not entitled", (uint8_t *)&v20, 2u);
    }

    return 0;
  }
}

- (NSDictionary)registrationState
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_sharedInstance(FTDeviceSupport, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registrationState(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)_rawEntitlementValue
{
  return self->_entitlementStatus;
}

- (void)_entitlementStatusChanged
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint8_t v9[16];

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Posting notification for entitlement status changed", v9, 2u);
  }

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v7, v8, (uint64_t)CFSTR("__kFTEntitlementStatusChangedNotification"), self, 0);

}

- (BOOL)_reconnectCTServerConnectionIfNecessary
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int CommCenterInitializationState;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v15[16];
  uint8_t buf[15];
  char v17;

  v17 = 0;
  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Reconnecting to CT if we can", buf, 2u);
  }

  if (objc_msgSend__setupCTServerConnection(self, v5, v6))
  {
    if (self->_ctServerConnection
      && (CommCenterInitializationState = _CTServerConnectionGetCommCenterInitializationState(),
          self->_ctServerConnection)
      && (CommCenterInitializationState || v17))
    {
      objc_msgSend__registerForCTEntitlementNotifications(self, v7, v8);
    }
    else
    {
      objc_msgSend__cleanupMachInfo(self, v7, v8);
      objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A4C7F000, v12, OS_LOG_TYPE_DEFAULT, " => Watching for launch", v15, 2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1A4CAB200, (CFStringRef)*MEMORY[0x1E0CA7360], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return 1;
}

- (BOOL)_disconnectCTServerConnection
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint8_t v10[16];

  if (self->_ctServerConnection)
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A4C7F000, v4, OS_LOG_TYPE_DEFAULT, "Disconnect CT server connection", v10, 2u);
    }

    objc_msgSend__unregisterForCTEntitlementNotifications(self, v5, v6);
    objc_msgSend__cleanupMachInfo(self, v7, v8);
  }
  return 1;
}

- (void)_handleCTServiceRequestName:(__CFString *)a3 userInfo:(__CFDictionary *)a4 contextInfo:(void *)a5
{
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;
  __CFString *v24;
  __int16 v25;
  __CFDictionary *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA71B0]))
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1A4C7F000, v10, OS_LOG_TYPE_DEFAULT, "Entitlement update", (uint8_t *)&v23, 2u);
    }

    objc_msgSend__updateEntitlementStatusUsingCTEntitlementsInfo_(self, v11, (uint64_t)a4);
    objc_msgSend__entitlementStatusChanged(self, v12, v13);
  }
  else
  {
    v14 = CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7358]);
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v18)
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "** CT Mach port died", (uint8_t *)&v23, 2u);
      }

      objc_msgSend__disconnectCTServerConnection(self, v19, v20);
      objc_msgSend__reconnectCTServerConnectionIfNecessary(self, v21, v22);
    }
    else
    {
      if (v18)
      {
        v23 = 138412546;
        v24 = a3;
        v25 = 2112;
        v26 = a4;
        _os_log_impl(&dword_1A4C7F000, v17, OS_LOG_TYPE_DEFAULT, "Unhandled request type, name: %@   userInfo: %@", (uint8_t *)&v23, 0x16u);
      }

    }
  }
}

@end
