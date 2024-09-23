@implementation PhoneSettingsTelephony

- (PhoneSettingsTelephony)init
{
  PhoneSettingsTelephony *v2;
  void *v3;
  void *v4;
  PHForwardingSettings *v5;
  PHForwardingSettings *callForwardingSettingsUnconditional;
  void *v7;
  void *v8;
  id v9;
  PHForwardingSettings *v10;
  PHForwardingSettings *callForwardingSettingsMobileBusy;
  void *v12;
  void *v13;
  id v14;
  PHForwardingSettings *v15;
  PHForwardingSettings *callForwardingSettingsNoReply;
  void *v17;
  void *v18;
  id v19;
  PHForwardingSettings *v20;
  PHForwardingSettings *callForwardingSettingsNotReachable;
  void *v22;
  void *v23;
  id v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PhoneSettingsTelephony;
  v2 = -[PhoneSettingsTelephony init](&v26, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

    v5 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsUnconditional = v2->_callForwardingSettingsUnconditional;
    v2->_callForwardingSettingsUnconditional = v5;

    -[PHForwardingSettings setDefaultCallForwardingNumberPreferencesKey:](v2->_callForwardingSettingsUnconditional, "setDefaultCallForwardingNumberPreferencesKey:", CFSTR("call-forwarding-number"));
    v7 = (void *)CFPreferencesCopyAppValue(CFSTR("call-forwarding-number"), CFSTR("com.apple.mobilephone.settings"));
    -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsUnconditional, "setDefaultCallForwardingNumber:", v7);

    -[PHForwardingSettings defaultCallForwardingNumber](v2->_callForwardingSettingsUnconditional, "defaultCallForwardingNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD17C8]);
      -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsUnconditional, "setDefaultCallForwardingNumber:", v9);

    }
    v10 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsMobileBusy = v2->_callForwardingSettingsMobileBusy;
    v2->_callForwardingSettingsMobileBusy = v10;

    -[PHForwardingSettings setDefaultCallForwardingNumberPreferencesKey:](v2->_callForwardingSettingsMobileBusy, "setDefaultCallForwardingNumberPreferencesKey:", CFSTR("call-forwarding-number-mobilebusy"));
    v12 = (void *)CFPreferencesCopyAppValue(CFSTR("call-forwarding-number-mobilebusy"), CFSTR("com.apple.mobilephone.settings"));
    -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsMobileBusy, "setDefaultCallForwardingNumber:", v12);

    -[PHForwardingSettings defaultCallForwardingNumber](v2->_callForwardingSettingsMobileBusy, "defaultCallForwardingNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x24BDD17C8]);
      -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsMobileBusy, "setDefaultCallForwardingNumber:", v14);

    }
    v15 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsNoReply = v2->_callForwardingSettingsNoReply;
    v2->_callForwardingSettingsNoReply = v15;

    -[PHForwardingSettings setDefaultCallForwardingNumberPreferencesKey:](v2->_callForwardingSettingsNoReply, "setDefaultCallForwardingNumberPreferencesKey:", CFSTR("call-forwarding-number-noreply"));
    v17 = (void *)CFPreferencesCopyAppValue(CFSTR("call-forwarding-number-noreply"), CFSTR("com.apple.mobilephone.settings"));
    -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsNoReply, "setDefaultCallForwardingNumber:", v17);

    -[PHForwardingSettings defaultCallForwardingNumber](v2->_callForwardingSettingsNoReply, "defaultCallForwardingNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v19 = objc_alloc_init(MEMORY[0x24BDD17C8]);
      -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsNoReply, "setDefaultCallForwardingNumber:", v19);

    }
    v20 = objc_alloc_init(PHForwardingSettings);
    callForwardingSettingsNotReachable = v2->_callForwardingSettingsNotReachable;
    v2->_callForwardingSettingsNotReachable = v20;

    -[PHForwardingSettings setDefaultCallForwardingNumberPreferencesKey:](v2->_callForwardingSettingsNotReachable, "setDefaultCallForwardingNumberPreferencesKey:", CFSTR("call-forwarding-number-notreachable"));
    v22 = (void *)CFPreferencesCopyAppValue(CFSTR("call-forwarding-number-notreachable"), CFSTR("com.apple.mobilephone.settings"));
    -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsNotReachable, "setDefaultCallForwardingNumber:", v22);

    -[PHForwardingSettings defaultCallForwardingNumber](v2->_callForwardingSettingsNotReachable, "defaultCallForwardingNumber");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v24 = objc_alloc_init(MEMORY[0x24BDD17C8]);
      -[PHForwardingSettings setDefaultCallForwardingNumber:](v2->_callForwardingSettingsNotReachable, "setDefaultCallForwardingNumber:", v24);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PhoneSettingsTelephony stopWatching](self, "stopWatching");
  -[PhoneSettingsTelephony destroyServerConnection](self, "destroyServerConnection");
  v4.receiver = self;
  v4.super_class = (Class)PhoneSettingsTelephony;
  -[PhoneSettingsTelephony dealloc](&v4, sel_dealloc);
}

- (void)destroyServerConnection
{
  if (self->_serverConnection)
  {
    _CTServerConnectionUnregisterForAllNotifications();
    CFRelease(self->_serverConnection);
    self->_serverConnection = 0;
  }
}

- (void)_reset
{
  NSString *cachedPassword;
  NSString *myNumber;

  -[PhoneSettingsTelephony resetCallForwardingSettings](self, "resetCallForwardingSettings");
  -[PhoneSettingsTelephony _resetCallerIDSettings](self, "_resetCallerIDSettings");
  self->_callWaitingEnabled = 0;
  self->_simLocked = 0;
  cachedPassword = self->_cachedPassword;
  self->_cachedPassword = 0;

  myNumber = self->_myNumber;
  self->_myNumber = 0;

  -[NSMutableDictionary removeAllObjects](self->_pendingSaves, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_pendingRequests, "removeAllObjects");
}

- (void)resetCallForwardingSettings
{
  NSObject *v3;
  uint8_t v4[16];

  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Resetting call forwarding settings", v4, 2u);
  }

  -[PHForwardingSettings setCallForwardingState:](self->_callForwardingSettingsUnconditional, "setCallForwardingState:", 0);
  -[PHForwardingSettings setCallForwardingNumber:](self->_callForwardingSettingsUnconditional, "setCallForwardingNumber:", 0);
  -[PHForwardingSettings setCallForwardingState:](self->_callForwardingSettingsMobileBusy, "setCallForwardingState:", 0);
  -[PHForwardingSettings setCallForwardingNumber:](self->_callForwardingSettingsMobileBusy, "setCallForwardingNumber:", 0);
  -[PHForwardingSettings setCallForwardingState:](self->_callForwardingSettingsNoReply, "setCallForwardingState:", 0);
  -[PHForwardingSettings setCallForwardingNumber:](self->_callForwardingSettingsNoReply, "setCallForwardingNumber:", 0);
  -[PHForwardingSettings setCallForwardingState:](self->_callForwardingSettingsNotReachable, "setCallForwardingState:", 0);
  -[PHForwardingSettings setCallForwardingNumber:](self->_callForwardingSettingsNotReachable, "setCallForwardingNumber:", 0);
}

- (void)_resetCallerIDSettings
{
  NSObject *v3;
  uint8_t v4[16];

  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Resetting Caller ID settings", v4, 2u);
  }

  self->_callerIDIsModifiable = 0;
  self->_callerIDMode = 0;
}

- (void)_invalidateSIMLockedSetting
{
  NSObject *v3;
  uint8_t v4[16];

  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating SIM locked setting", v4, 2u);
  }

  self->_simLocked = 0;
}

- (void)startWatching
{
  NSObject *v2;
  uint8_t v3[16];

  PHDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21ED2A000, v2, OS_LOG_TYPE_DEFAULT, "", v3, 2u);
  }

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
}

- (void)stopWatching
{
  NSObject *v3;
  uint8_t v4[16];

  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "", v4, 2u);
  }

  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  CTTelephonyCenterRemoveObserver();
  -[PhoneSettingsTelephony _reset](self, "_reset");
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  -[PhoneSettingsTelephony stopWatching](self, "stopWatching");
  -[PhoneSettingsTelephony destroyServerConnection](self, "destroyServerConnection");

}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  -[PhoneSettingsTelephony startWatching](self, "startWatching");
}

- (__CTServerConnection)serverConnection
{
  __CTServerConnection *result;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  result = self->_serverConnection;
  if (!result)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    CFRunLoopGetMain();
    self->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnRunLoop();

    return self->_serverConnection;
  }
  return result;
}

- (int)currentNetworkSelectionState
{
  void *v2;
  int v4;

  CTRegistrationGetNetworkSelectionState();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == (void *)*MEMORY[0x24BDC2C08])
  {
    v4 = 0;
  }
  else if (v2 == (void *)*MEMORY[0x24BDC2BE0])
  {
    v4 = 1;
  }
  else if (v2 == (void *)*MEMORY[0x24BDC2C00])
  {
    v4 = 2;
  }
  else if (v2 == (void *)*MEMORY[0x24BDC2BF8])
  {
    v4 = 3;
  }
  else if (v2 == (void *)*MEMORY[0x24BDC2BD8] || v2 == (void *)*MEMORY[0x24BDC2BF0])
  {
    v4 = 5;
  }
  else if (v2 == (void *)*MEMORY[0x24BDC2BE8])
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)myNumber
{
  const void *v3;
  NSObject *v4;
  const void *active;
  NSObject *v6;
  NSString *v7;
  NSString *myNumber;
  NSObject *v10;
  int v11;
  const void *v12;
  __int16 v13;
  const void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_myNumber)
  {
    self->_myNumber = (NSString *)&stru_24E38CD10;

    v3 = (const void *)CTSettingCopyMyPhoneNumber();
    PHDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_21ED2A000, v4, OS_LOG_TYPE_DEFAULT, "CTSettingCopyMyPhoneNumber returned %@", (uint8_t *)&v11, 0xCu);
    }

    if (v3)
    {
      active = (const void *)PNCopyBestGuessCountryCodeForNumber();
      if (active || (active = (const void *)CPPhoneNumberCopyActiveCountryCode()) != 0)
      {
        PHDefaultLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412546;
          v12 = v3;
          v13 = 2112;
          v14 = active;
          _os_log_impl(&dword_21ED2A000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to format digits %@ using ISO country code %@", (uint8_t *)&v11, 0x16u);
        }

        v7 = (NSString *)PNCreateFormattedStringWithCountry();
        myNumber = self->_myNumber;
        self->_myNumber = v7;

        CFRelease(active);
      }
      else
      {
        PHDefaultLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138412290;
          v12 = v3;
          _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "Could not determine the country code for the digits %@.", (uint8_t *)&v11, 0xCu);
        }

      }
      CFRelease(v3);
    }
  }
  return self->_myNumber;
}

- (void)setMyNumber:(id)a3
{
  id v4;
  NSString *v5;
  NSObject *v6;
  int v7;
  NSString *newNumber;
  NSString *v9;
  NSString *myNumber;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  UIUnformattedPhoneNumberFromString();
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((_BYTE *)self + 112) & 1;
    v12 = 138412802;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 1024;
    v17 = v7;
    _os_log_impl(&dword_21ED2A000, v6, OS_LOG_TYPE_DEFAULT, "Set my number called with: %@ normalized to: %@, was already saving phone number = %d", (uint8_t *)&v12, 0x1Cu);
  }

  *((_BYTE *)self + 112) = *((_BYTE *)self + 112) & 0xF8 | 1;
  newNumber = self->_newNumber;
  self->_newNumber = v5;
  v9 = v5;

  myNumber = self->_myNumber;
  self->_myNumber = 0;

  -[PhoneSettingsTelephony serverConnection](self, "serverConnection");
  if ((unint64_t)_CTServerConnectionSelectPhonebook() >> 32)
  {
    PHDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PhoneSettingsTelephony setMyNumber:].cold.1();

  }
}

- (BOOL)simIsPresent
{
  return CTSIMSupportGetSIMStatus() != *MEMORY[0x24BDC2CD0];
}

- (BOOL)hasSubscriberIdentity
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;

  -[PhoneSettingsTelephony serverConnection](self, "serverConnection");
  if ((unint64_t)_CTServerConnectionCopyMobileEquipmentInfo() >> 32)
  {
    PHDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[PhoneSettingsTelephony hasSubscriberIdentity].cold.1();
    goto LABEL_7;
  }
  objc_msgSend(0, "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDC2AA0];
  if (!-[NSObject containsObject:](v2, "containsObject:", *MEMORY[0x24BDC2AA0]))
  {
LABEL_7:
    LOBYTE(v6) = 0;
    goto LABEL_8;
  }
  objc_msgSend(0, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(0, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", &stru_24E38CD10) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

LABEL_8:
  return v6;
}

- (BOOL)allowNetworkSelection
{
  uint64_t SIMStatus;
  id v3;
  char v4;
  int v5;

  SIMStatus = CTSIMSupportGetSIMStatus();
  v3 = objc_alloc_init(MEMORY[0x24BE04788]);
  v4 = objc_msgSend(v3, "airplaneMode");

  if ((v4 & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = CTRegistrationNetworkSelectionMenuAvailable();
    if (v5)
      LOBYTE(v5) = SIMStatus == *MEMORY[0x24BDC2D10];
  }
  return v5;
}

- (id)currentNetwork
{
  return (id)CTRegistrationCopyLocalizedOperatorName();
}

- (void)enableAutomaticNetworkSelection
{
  NSObject *v2;
  uint8_t v3[16];

  PHDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21ED2A000, v2, OS_LOG_TYPE_DEFAULT, "", v3, 2u);
  }

  CTRegistrationAutomaticallySelectNetwork();
}

- (void)selectManualNetwork:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21ED2A000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }

  CTRegistrationManuallySelectNetwork();
}

- (unsigned)callForwardingEnabled:(BOOL)a3
{
  return -[PhoneSettingsTelephony callForwardingEnabled:forReason:](self, "callForwardingEnabled:forReason:", a3, *MEMORY[0x24BDC2FB8]);
}

- (unsigned)callForwardingEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = a3;
  v6 = a4;
  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4
    && (!objc_msgSend(v7, "callForwardingState")
     || objc_msgSend(v8, "callForwardingState") == 1))
  {
    objc_msgSend(v8, "setCallForwardingState:", 1);
    -[PhoneSettingsTelephony _requestCallForwardingSettingsForReason:](self, "_requestCallForwardingSettingsForReason:", v6);
  }
  v9 = objc_msgSend(v8, "callForwardingState") & 0xFFFFFFF7;

  return v9;
}

- (void)setCallForwardingEnabled:(BOOL)a3
{
  -[PhoneSettingsTelephony setCallForwardingEnabled:forReason:](self, "setCallForwardingEnabled:forReason:", a3, *MEMORY[0x24BDC2FB8]);
}

- (void)setCallForwardingEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PHDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
      v9 = CFSTR("ENABLE");
    else
      v9 = CFSTR("DISABLE");
    v11 = 138412802;
    v12 = v9;
    v13 = 1024;
    v14 = objc_msgSend(v7, "callForwardingState");
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "Request to %@ call forwarding from current state %d for reason %@", (uint8_t *)&v11, 0x1Cu);
  }

  objc_msgSend(v7, "callForwardingNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PhoneSettingsTelephony _saveCallForwardingEnabled:number:forwardingReason:](self, "_saveCallForwardingEnabled:number:forwardingReason:", v4, v10, v6);

}

- (id)callForwardingNumber:(BOOL)a3
{
  return -[PhoneSettingsTelephony callForwardingNumber:forReason:](self, "callForwardingNumber:forReason:", a3, *MEMORY[0x24BDC2FB8]);
}

- (id)callForwardingNumber:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 && !objc_msgSend(v7, "callForwardingState"))
  {
    objc_msgSend(v8, "setCallForwardingState:", 1);
    -[PhoneSettingsTelephony _requestCallForwardingSettingsForReason:](self, "_requestCallForwardingSettingsForReason:", v6);
  }
  objc_msgSend(v8, "callForwardingNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setCallForwardingNumber:(id)a3
{
  -[PhoneSettingsTelephony setCallForwardingNumber:forReason:](self, "setCallForwardingNumber:forReason:", a3, *MEMORY[0x24BDC2FB8]);
}

- (void)setCallForwardingNumber:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PHDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "Requested to set call forwarding number to %@ for reason %@", (uint8_t *)&v9, 0x16u);
  }

  -[PhoneSettingsTelephony _saveCallForwardingEnabled:number:forwardingReason:](self, "_saveCallForwardingEnabled:number:forwardingReason:", objc_msgSend(v6, "length") != 0, v6, v7);
}

- (unsigned)callWaitingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  unsigned int callWaitingEnabled;
  NSObject *v8;
  void *v9;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    callWaitingEnabled = self->_callWaitingEnabled;
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    v13 = 1024;
    v14 = callWaitingEnabled;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony callWaitingEnabled:]: Request:%@, _callWaitingEnabledState is %d", buf, 0x12u);
  }

  if (v3 && !self->_callWaitingEnabled)
  {
    PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony callWaitingEnabled:]: Setting _callWaitingEnabledState to SettingsPending", buf, 2u);
    }

    self->_callWaitingEnabled = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("STSettingTypeUniqueIdentifier"), *MEMORY[0x24BDC3058], *MEMORY[0x24BDC3048], *MEMORY[0x24BDC2F80], *MEMORY[0x24BDC2F78], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsTelephony _requestSettings:](self, "_requestSettings:", v9);

  }
  return self->_callWaitingEnabled & 0xFFFFFFF7;
}

- (void)setCallWaitingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unsigned int callWaitingEnabled;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    callWaitingEnabled = self->_callWaitingEnabled;
    v11[0] = 67109376;
    v11[1] = callWaitingEnabled;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "Requested to set call waiting enabled from %d to %d", (uint8_t *)v11, 0xEu);
  }

  v7 = self->_callWaitingEnabled;
  if (v3)
  {
    if (v7 != 4)
      return;
  }
  else if (v7 != 2)
  {
    return;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDC3058];
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDC3058], CFSTR("STSettingTypeUniqueIdentifier"));
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x24BDC3048]);
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDC2F80], *MEMORY[0x24BDC2F78]);
  v10 = (_QWORD *)MEMORY[0x24BDBD270];
  if (!v3)
    v10 = (_QWORD *)MEMORY[0x24BDBD268];
  objc_msgSend(v8, "setObject:forKey:", *v10, *MEMORY[0x24BDC3000]);
  self->_callWaitingEnabled |= 1u;
  -[PhoneSettingsTelephony _saveSettings:](self, "_saveSettings:", v8);

}

- (BOOL)allowCallerIDChange:(BOOL)a3
{
  return (-[PhoneSettingsTelephony callerIDModifiable:](self, "callerIDModifiable:", a3) & 5) == 0;
}

- (unsigned)callerIDModifiable:(BOOL)a3
{
  if (a3 && !self->_callerIDMode)
    -[PhoneSettingsTelephony callerIDMode:](self, "callerIDMode:", 1);
  return self->_callerIDIsModifiable & 0xFFFFFFF7;
}

- (unsigned)callerIDMode:(BOOL)a3
{
  void *v4;

  if (a3 && !self->_callerIDMode)
  {
    self->_callerIDMode = 1;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("STSettingTypeUniqueIdentifier"), *MEMORY[0x24BDC3060], *MEMORY[0x24BDC3048], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhoneSettingsTelephony _requestSettings:](self, "_requestSettings:", v4);

  }
  return self->_callerIDMode & 0xFFFFFFEF;
}

- (void)setCallerIDEnabled:(unsigned int)a3
{
  id v5;
  id *v6;
  id v7;
  uint64_t v8;
  id v9;

  if (self->_callerIDMode == a3)
  {
    -[PhoneSettingsTelephony _handleCallerIDSettings:](self, "_handleCallerIDSettings:", 0);
    return;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)*MEMORY[0x24BDC2FF0];
  switch(a3)
  {
    case 2u:
      v6 = (id *)MEMORY[0x24BDC2FC8];
      goto LABEL_9;
    case 8u:
      v6 = (id *)MEMORY[0x24BDC2FE8];
      goto LABEL_9;
    case 4u:
      v6 = (id *)MEMORY[0x24BDC2FD0];
LABEL_9:
      v7 = *v6;

      v5 = v7;
      break;
  }
  v8 = *MEMORY[0x24BDC3060];
  objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x24BDC3060], CFSTR("STSettingTypeUniqueIdentifier"));
  objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x24BDC3048]);
  objc_msgSend(v9, "setObject:forKey:", v5, *MEMORY[0x24BDC2FC0]);
  self->_callerIDMode = 1;
  -[PhoneSettingsTelephony _saveSettings:](self, "_saveSettings:", v9);

}

- (void)requestNetworkList
{
  NSObject *v2;
  uint8_t v3[16];

  PHDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21ED2A000, v2, OS_LOG_TYPE_DEFAULT, "Requesting network list", v3, 2u);
  }

  CTRegistrationRequestNetworkList();
}

- (int)networkSelectionMode
{
  uint64_t NetworkSelectionMode;
  int v3;

  NetworkSelectionMode = CTRegistrationGetNetworkSelectionMode();
  if (NetworkSelectionMode == *MEMORY[0x24BDC2BD0])
    v3 = 1;
  else
    v3 = 2;
  if (NetworkSelectionMode == *MEMORY[0x24BDC2BC8])
    return 0;
  else
    return v3;
}

- (id)manuallySelectedNetworkDictionary
{
  return (id)CTRegistrationCopyManualNetworkSelection();
}

- (BOOL)allowSIMLock
{
  return CTSIMSupportGetSIMStatus() == *MEMORY[0x24BDC2D10];
}

- (unsigned)simLocked:(BOOL)a3
{
  void *v4;

  if (a3 && !self->_simLocked)
  {
    if (CTSIMSupportGetSIMStatus() == *MEMORY[0x24BDC2CF8])
    {
      self->_simLocked = 2;
    }
    else
    {
      self->_simLocked = 1;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("STSettingTypeUniqueIdentifier"), *MEMORY[0x24BDC3070], *MEMORY[0x24BDC3048], 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhoneSettingsTelephony _requestSettings:](self, "_requestSettings:", v4);

    }
  }
  return self->_simLocked & 0xFFFFFFF7;
}

- (void)setSIMLocked:(BOOL)a3 password:(id)a4
{
  _BOOL4 v4;
  __CFString *v6;
  unsigned int simLocked;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  const __CFString *v12;
  __CFString *v13;

  v4 = a3;
  v6 = (__CFString *)a4;
  simLocked = self->_simLocked;
  v13 = v6;
  if (!v4)
  {
    if (simLocked == 2)
    {
      v8 = 3;
      goto LABEL_6;
    }
LABEL_12:
    -[PhoneSettingsTelephony _handleSIMLockSettings:](self, "_handleSIMLockSettings:", 0);
    goto LABEL_13;
  }
  if (simLocked != 4)
    goto LABEL_12;
  v8 = 5;
LABEL_6:
  self->_simLocked = v8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDC3070];
  objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x24BDC3070], CFSTR("STSettingTypeUniqueIdentifier"));
  objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x24BDC3048]);
  v11 = (_QWORD *)MEMORY[0x24BDBD270];
  if (!v4)
    v11 = (_QWORD *)MEMORY[0x24BDBD268];
  objc_msgSend(v9, "setObject:forKey:", *v11, *MEMORY[0x24BDC3000]);
  if (v13)
    v12 = v13;
  else
    v12 = &stru_24E38CD10;
  objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x24BDC3018]);
  -[PhoneSettingsTelephony _saveSettings:](self, "_saveSettings:", v9);

LABEL_13:
}

- (id)unlockAttemptsRemainingString
{
  uint64_t RemainingPINAttempts;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  RemainingPINAttempts = CTSIMSupportGetRemainingPINAttempts();
  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", RemainingPINAttempts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (RemainingPINAttempts == 1)
    v8 = CFSTR("%@_SIM_ATTEMPT_REMAINING");
  else
    v8 = CFSTR("%@_SIM_ATTEMPTS_REMAINING");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24E38CD10, CFSTR("Phone"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)allowPINChange
{
  _BOOL4 v3;

  v3 = -[PhoneSettingsTelephony allowSIMLock](self, "allowSIMLock");
  if (v3)
    LOBYTE(v3) = -[PhoneSettingsTelephony simLocked:](self, "simLocked:", 0) == 2;
  return v3;
}

- (void)setPIN:(id)a3 password:(id)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDC3068];
  objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x24BDC3068], *MEMORY[0x24BDC3048]);
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("STSettingTypeUniqueIdentifier"));
  objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x24BDC3010]);

  objc_msgSend(v10, "setObject:forKey:", v7, *MEMORY[0x24BDC3018]);
  -[PhoneSettingsTelephony _saveSettings:](self, "_saveSettings:", v10);

}

- (int)showCallForwarding
{
  int result;

  result = MGGetBoolAnswer();
  if (result)
  {
    result = -[PhoneSettingsTelephony hasSubscriberIdentity](self, "hasSubscriberIdentity");
    if (result)
      return objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode") ^ 1;
  }
  return result;
}

- (int)showCallWaiting
{
  int result;

  result = MGGetBoolAnswer();
  if (result)
    return -[PhoneSettingsTelephony hasSubscriberIdentity](self, "hasSubscriberIdentity");
  return result;
}

- (int)showCallerID
{
  int result;

  result = MGGetBoolAnswer();
  if (result)
    return -[PhoneSettingsTelephony hasSubscriberIdentity](self, "hasSubscriberIdentity");
  return result;
}

- (int)showSIMPIN
{
  int result;

  result = MGGetBoolAnswer();
  if (result)
    return (objc_msgSend(MEMORY[0x24BDF6800], "isRunningInStoreDemoMode") & 1) == 0
        && -[PhoneSettingsTelephony simIsPresent](self, "simIsPresent");
  return result;
}

- (int)showReplyWithMessage
{
  return 1;
}

- (id)pendingRequestForUniqueSettingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary objectForKey:](self->_pendingRequests, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pendingSaveForUniqueSettingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary objectForKey:](self->_pendingSaves, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)receivedRequestResponseForUniqueSettingType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingRequests, "removeObjectForKey:", v4);

}

- (void)receivedSaveResponseForUniqueSettingType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary removeObjectForKey:](self->_pendingSaves, "removeObjectForKey:", v4);

}

- (id)_callForwardingSettingsForForwardingReason:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FB8]) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FA0]) & 1) != 0)
    {
      v5 = 40;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FA8]) & 1) != 0)
    {
      v5 = 48;
      goto LABEL_9;
    }
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FB0]) & 1) != 0)
    {
      v5 = 56;
      goto LABEL_9;
    }
    PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Was asked for call-forwarding settings for an unsupported reason (%@), returning unconditional", (uint8_t *)&v9, 0xCu);
    }

  }
  v5 = 32;
LABEL_9:
  v6 = *(id *)((char *)&self->super.isa + v5);

  return v6;
}

- (void)postCallForwardingChangedNotificationForForwardingReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FB8]))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("SettingsTelephonyCallForwardingChanged");
LABEL_9:
    objc_msgSend(v5, "postNotificationName:object:", v7, self);

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FA0]))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("SettingsTelephonyCallForwardingChangedForMobileBusy");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FA8]))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("SettingsTelephonyCallForwardingChangedForNoReply");
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDC2FB0]))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("SettingsTelephonyCallForwardingChangedForNotReachable");
    goto LABEL_9;
  }
  PHDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Was asked to post a notification for an unsupported reason (%@), doing nothing", (uint8_t *)&v9, 0xCu);
  }

LABEL_10:
}

- (id)lastUsedForwardingNumberForReason:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "defaultCallForwardingNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)resetLastUsedForwardingNumberForReason:(id)a3
{
  void *v3;
  __CFString *v4;
  id v5;

  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "setDefaultCallForwardingNumber:", 0);
    objc_msgSend(v5, "defaultCallForwardingNumberPreferencesKey");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(v4, 0, CFSTR("com.apple.mobilephone.settings"));

    CFPreferencesAppSynchronize(CFSTR("com.apple.mobilephone.settings"));
    v3 = v5;
  }

}

- (void)_handleCallForwardingSettings:(id)a3 didAttemptToSet:(BOOL)a4 forwardingReason:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id active;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  NSObject *v22;
  int v23;
  int v24;
  _BYTE v25[14];
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412802;
    *(_QWORD *)v25 = v8;
    *(_WORD *)&v25[8] = 1024;
    *(_DWORD *)&v25[10] = v6;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_21ED2A000, v10, OS_LOG_TYPE_DEFAULT, "Handle call forwarding settings userInfo: %@ didSet: %d forwardingReason: %@", (uint8_t *)&v24, 0x1Cu);
  }

  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDC2F98]))
  {
    -[PhoneSettingsTelephony _handleCallForwardingSettings:didAttemptToSet:forwardingReason:](self, "_handleCallForwardingSettings:didAttemptToSet:forwardingReason:", v8, v6, *MEMORY[0x24BDC2FB8]);
    -[PhoneSettingsTelephony _handleCallForwardingSettings:didAttemptToSet:forwardingReason:](self, "_handleCallForwardingSettings:didAttemptToSet:forwardingReason:", v8, v6, *MEMORY[0x24BDC2FA0]);
    -[PhoneSettingsTelephony _handleCallForwardingSettings:didAttemptToSet:forwardingReason:](self, "_handleCallForwardingSettings:didAttemptToSet:forwardingReason:", v8, v6, *MEMORY[0x24BDC2FA8]);
    -[PhoneSettingsTelephony _handleCallForwardingSettings:didAttemptToSet:forwardingReason:](self, "_handleCallForwardingSettings:didAttemptToSet:forwardingReason:", v8, v6, *MEMORY[0x24BDC2FB0]);
  }
  else
  {
    -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC3000]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "BOOLValue"))
        v14 = 2;
      else
        v14 = 4;
      objc_msgSend(v12, "setCallForwardingState:", v14);

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC2F88]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && objc_msgSend(v15, "length"))
      {
        active = (id)CPPhoneNumberCopyActiveCountryCode();
        UIFormattedPhoneNumberFromStringWithCountry();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCallForwardingNumber:", v18);

      }
      else
      {
        active = objc_alloc_init(MEMORY[0x24BDD17C8]);
        objc_msgSend(v12, "setCallForwardingNumber:", active);
      }

      if (v6)
      {
        objc_msgSend(v12, "callForwardingNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setDefaultCallForwardingNumber:", v19);

        objc_msgSend(v12, "defaultCallForwardingNumberPreferencesKey");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "defaultCallForwardingNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        CFPreferencesSetAppValue(v20, v21, CFSTR("com.apple.mobilephone.settings"));

        CFPreferencesAppSynchronize(CFSTR("com.apple.mobilephone.settings"));
      }

    }
    else
    {
      objc_msgSend(v11, "setCallForwardingState:", objc_msgSend(v11, "callForwardingState") & 0xFFFFFFFELL);
      objc_msgSend(v12, "setCallForwardingState:", objc_msgSend(v12, "callForwardingState") | 8);
    }
    PHDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v12, "callForwardingState");
      v24 = 67109378;
      *(_DWORD *)v25 = v23;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v9;
      _os_log_impl(&dword_21ED2A000, v22, OS_LOG_TYPE_DEFAULT, "Set call forwarding state to %d for forwarding reason %@", (uint8_t *)&v24, 0x12u);
    }

    -[PhoneSettingsTelephony postCallForwardingChangedNotificationForForwardingReason:](self, "postCallForwardingChangedNotificationForForwardingReason:", v9);
    objc_msgSend(v12, "setCallForwardingState:", objc_msgSend(v12, "callForwardingState") & 0xFFFFFFF7);

  }
}

- (void)_handleCallWaitingSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  unsigned int callWaitingEnabled;
  const char *v10;
  unsigned int v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony _handleCallWaitingSettings]: Received a response for call-waiting request, userInfo is %@", (uint8_t *)&v13, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC3000]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      v7 = 2;
    else
      v7 = 4;
    self->_callWaitingEnabled = v7;

    PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      callWaitingEnabled = self->_callWaitingEnabled;
      v13 = 67109120;
      LODWORD(v14) = callWaitingEnabled;
      v10 = "[PhoneSettingsTelephony _handleCallWaitingSettings]: _callWaitingEnabled was set to %d";
LABEL_11:
      _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    self->_callWaitingEnabled = self->_callWaitingEnabled & 0xFFFFFFF6 | 8;
    PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_callWaitingEnabled;
      v13 = 67109120;
      LODWORD(v14) = v11;
      v10 = "[WARN] [PhoneSettingsTelephony _handleCallWaitingSettings]: call-waiting error, no userInfo was supplied, _c"
            "allWaitingEnabled was set to %d";
      goto LABEL_11;
    }
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SettingsTelephonyCallWaitingChanged"), self);

  self->_callWaitingEnabled &= ~8u;
}

- (void)_handleNetworkList:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, CFSTR("SettingsTelephonyNetworkListParameter"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("SettingsTelephonyNetworksChanged"), self, v5);

}

- (void)_handleCallerIDSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC2FE0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC2FC0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDC2FD8]))
        v8 = 2;
      else
        v8 = 4;
      self->_callerIDIsModifiable = v8;
    }
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC2FD0]))
    {
      v9 = 4;
    }
    else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDC2FC8]))
    {
      v9 = 2;
    }
    else
    {
      v9 = 8;
    }
    self->_callerIDMode = v9;

  }
  else
  {
    v10 = *(_QWORD *)&self->_callerIDIsModifiable;
    LODWORD(v10) = v10 & 0xFFFFFFF6 | 8;
    HIDWORD(v10) = HIDWORD(v10) & 0xFFFFFFF6 | 8;
    *(_QWORD *)&self->_callerIDIsModifiable = v10;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("SettingsTelephonyCallerIDChanged"), self);

  *(_QWORD *)&self->_callerIDIsModifiable &= 0xFFFFFFF7FFFFFFF7;
}

- (void)_handleCallerIDChanged
{
  -[PhoneSettingsTelephony _resetCallerIDSettings](self, "_resetCallerIDSettings");
  -[PhoneSettingsTelephony _handleCallerIDSettings:](self, "_handleCallerIDSettings:", 0);
}

- (void)_handleSIMLockSettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "Handling SIM lock settings changed with user info: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDC3000]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "BOOLValue"))
      v7 = 2;
    else
      v7 = 4;
    self->_simLocked = v7;

  }
  else
  {
    self->_simLocked = self->_simLocked & 0xFFFFFFF6 | 8;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SettingsTelephonySIMLockChanged"), self);

  self->_simLocked &= ~8u;
}

- (void)_handlePINSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObject:forKey:", v5, CFSTR("success"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SettingsTelephonyPINChangedNotification"), self, v7);

}

- (void)_requestCallForwardingSettingsForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = *MEMORY[0x24BDC3050];
  v6 = *MEMORY[0x24BDC3048];
  v7 = *MEMORY[0x24BDC2F80];
  v8 = *MEMORY[0x24BDC2F78];
  v9 = *MEMORY[0x24BDC2F90];
  v10 = a3;
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v10, CFSTR("STSettingTypeUniqueIdentifier"), v5, v6, v7, v8, v10, v9, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setCallForwardingState:", 1);
  -[PhoneSettingsTelephony _requestSettings:](self, "_requestSettings:", v12);

}

- (void)_saveCallForwardingEnabled:(BOOL)a3 number:(id)a4 forwardingReason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[PhoneSettingsTelephony _callForwardingSettingsForForwardingReason:](self, "_callForwardingSettingsForForwardingReason:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("STSettingTypeUniqueIdentifier"));
  objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x24BDC3050], *MEMORY[0x24BDC3048]);
  objc_msgSend(v10, "setObject:forKey:", *MEMORY[0x24BDC2F80], *MEMORY[0x24BDC2F78]);
  objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x24BDC2F90]);

  v11 = (_QWORD *)MEMORY[0x24BDBD270];
  if (!v6)
    v11 = (_QWORD *)MEMORY[0x24BDBD268];
  objc_msgSend(v10, "setObject:forKey:", *v11, *MEMORY[0x24BDC3000]);
  UIUnformattedPhoneNumberFromString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v10, "setObject:forKey:", v12, *MEMORY[0x24BDC2F88]);
  objc_msgSend(v13, "setCallForwardingState:", objc_msgSend(v13, "callForwardingState") | 1);
  -[PhoneSettingsTelephony _saveSettings:](self, "_saveSettings:", v10);

}

- (void)_requestSettings:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *pendingRequests;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "[PhoneSettingsTelephony _requestSettings:]: Settings dictionary requested is %@", (uint8_t *)&v10, 0xCu);
  }

  pendingRequests = self->_pendingRequests;
  if (!pendingRequests)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = self->_pendingRequests;
    self->_pendingRequests = v7;

    pendingRequests = self->_pendingRequests;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("STSettingTypeUniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pendingRequests, "setObject:forKey:", v4, v9);

  CTSettingRequest();
}

- (void)_saveSettings:(id)a3
{
  id v4;
  NSMutableDictionary *pendingSaves;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pendingSaves = self->_pendingSaves;
  if (!pendingSaves)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = self->_pendingSaves;
    self->_pendingSaves = v6;

    pendingSaves = self->_pendingSaves;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("STSettingTypeUniqueIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pendingSaves, "setObject:forKey:", v4, v8);

  PHDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21ED2A000, v9, OS_LOG_TYPE_DEFAULT, "SAVE SETTINGS: %@", (uint8_t *)&v10, 0xCu);
  }

  CTSettingSave();
}

- (void)_simRemoved
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("SettingsTelephonySIMRemoved");
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SettingsTelephonySIMRemoved"), self);

  -[PhoneSettingsTelephony _reset](self, "_reset");
}

- (void)_simPUKLocked
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("SettingsTelephonySIMPUKLocked");
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SettingsTelephonySIMPUKLocked"), self);

}

- (void)_networkSettingsDisabled
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("SettingsTelephonyNetworkSettingsDisabledNotification");
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Posting %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SettingsTelephonyNetworkSettingsDisabledNotification"), self);

}

- (void)_phoneBookSelected
{
  NSObject *v3;
  int v4;
  NSString *newNumber;
  _DWORD v6[2];
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((_BYTE *)self + 112) & 1;
    newNumber = self->_newNumber;
    v6[0] = 67109378;
    v6[1] = v4;
    v7 = 2112;
    v8 = newNumber;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Phone book selected, _savingPhoneNumber=%d, _newNumber=%@", (uint8_t *)v6, 0x12u);
  }

  if ((*((_BYTE *)self + 112) & 1) != 0)
  {
    *((_BYTE *)self + 112) |= 2u;
    -[PhoneSettingsTelephony serverConnection](self, "serverConnection");
    _CTServerConnectionSavePhonebookEntry();
  }
}

- (void)_phoneNumberSaveFinishedWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSString *newNumber;
  const void *active;
  NSObject *v8;
  _BOOL4 v9;
  NSString *v10;
  NSString *myNumber;
  const __CFString *v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  int v16;
  NSString *v17;
  __int16 v18;
  const void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "Phone number save finished with success=%d", (uint8_t *)&v16, 8u);
  }

  *((_BYTE *)self + 112) &= ~1u;
  newNumber = self->_newNumber;
  if (v3)
  {
    if (newNumber)
    {
      active = (const void *)CPPhoneNumberCopyActiveCountryCode();
      PHDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (active)
      {
        if (v9)
        {
          v16 = 138412546;
          v17 = newNumber;
          v18 = 2112;
          v19 = active;
          _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to format digits %@ using ISO country code %@", (uint8_t *)&v16, 0x16u);
        }

        v10 = (NSString *)PNCreateFormattedStringWithCountry();
        myNumber = self->_myNumber;
        self->_myNumber = v10;

        CFRelease(active);
      }
      else
      {
        if (v9)
        {
          v16 = 138412290;
          v17 = newNumber;
          _os_log_impl(&dword_21ED2A000, v8, OS_LOG_TYPE_DEFAULT, "Could not determine the country code for the digits %@.", (uint8_t *)&v16, 0xCu);
        }

      }
    }
    PHDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_myNumber;
      v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_21ED2A000, v13, OS_LOG_TYPE_DEFAULT, "Phone settings just got success for setting this number: %@", (uint8_t *)&v16, 0xCu);
    }

    newNumber = self->_newNumber;
    v12 = CFSTR("SettingsTelephonySetMyNumberSuccessNotification");
  }
  else
  {
    v12 = CFSTR("SettingsTelephonySetMyNumberFailureNotification");
  }
  self->_newNumber = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", v12, self);

}

- (void)_phoneNumberWritten
{
  int v2;

  v2 = *((unsigned __int8 *)self + 112);
  *((_BYTE *)self + 112) = v2 | 4;
  if ((~v2 & 3) == 0)
    -[PhoneSettingsTelephony _phoneNumberSaveFinishedWithSuccess:](self, "_phoneNumberSaveFinishedWithSuccess:", 1);
}

- (void)_phoneNumberChanged
{
  NSObject *v3;
  NSString *myNumber;
  NSObject *v5;
  unsigned int v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  PHDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_21ED2A000, v3, OS_LOG_TYPE_DEFAULT, "Received phone number changed notification", (uint8_t *)v7, 2u);
  }

  myNumber = self->_myNumber;
  self->_myNumber = 0;

  if ((~*((unsigned __int8 *)self + 112) & 7) == 0)
  {
    PHDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *((unsigned __int8 *)self + 112);
      v7[0] = 67109632;
      v7[1] = v6 & 1;
      v8 = 1024;
      v9 = (v6 >> 1) & 1;
      v10 = 1024;
      v11 = (v6 >> 2) & 1;
      _os_log_impl(&dword_21ED2A000, v5, OS_LOG_TYPE_DEFAULT, "Promoting to a save finished with success notification: _savingPhoneNumber=%d, _phoneBookSelected=%d, _phoneNumberWritten=%d", (uint8_t *)v7, 0x14u);
    }

    -[PhoneSettingsTelephony _phoneNumberSaveFinishedWithSuccess:](self, "_phoneNumberSaveFinishedWithSuccess:", 1);
  }
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PhoneSettingsTelephony manuallySelectedNetworkDictionary](self, "manuallySelectedNetworkDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No Manual Network Dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PhoneSettingsTelephony networkSelectionMode](self, "networkSelectionMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)CTRegistrationCopyLocalizedOperatorName();
  objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("ManuallySelectedNetworkDictionary"), v6, CFSTR("NetworkSelectionMode"), v7, CFSTR("CTRegistrationCopyLocalizedOperatorName"), CTRegistrationGetStatus(), CFSTR("CTRegistrationGetStatus"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithObject:forKey:", v8, CFSTR("PhoneSettingsNetworkState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newNumber, 0);
  objc_storeStrong((id *)&self->_cachedPassword, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsNotReachable, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsNoReply, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsMobileBusy, 0);
  objc_storeStrong((id *)&self->_callForwardingSettingsUnconditional, 0);
  objc_storeStrong((id *)&self->_myNumber, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingSaves, 0);
}

- (void)setMyNumber:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ED2A000, v0, v1, "*** _CTServerConnectionSelectPhonebook returned error=%d domain=%d", v2, v3);
}

- (void)hasSubscriberIdentity
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ED2A000, v0, v1, "Error calling _CTServerConnectionCopyMobileEquipmentInfo(): error=%d, domain=%d", v2, v3);
}

@end
