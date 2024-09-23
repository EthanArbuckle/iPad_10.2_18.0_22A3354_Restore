@implementation BBBiometricResource

- (BOOL)isPearlEnabledAndEnrolled
{
  return self->_isPasscodeSet && self->_hasEnrolledPearlIdentities && self->_isBiometricUnlockAllowed;
}

- (BOOL)hasPearlCapability
{
  return self->_pearlDevice != 0;
}

- (BBBiometricResource)initWithQueue:(id)a3
{
  id v5;
  BBBiometricResource *v6;
  BBBiometricResource *v7;
  BKDevice *pearlDevice;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  Class v15;
  void *v16;
  id v17;
  void *v18;
  char isKindOfClass;
  BKDevice *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BBBiometricResource;
  v6 = -[BBBiometricResource init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    -[BBBiometricResource _updateIsPasscodeSet](v7, "_updateIsPasscodeSet");
    -[BBBiometricResource _updateIsBiometricUnlockAllowed](v7, "_updateIsBiometricUnlockAllowed");
    pearlDevice = v7->_pearlDevice;
    v7->_pearlDevice = 0;

    if (__loadBiometricKitIfNecessary_onceToken != -1)
      dispatch_once(&__loadBiometricKitIfNecessary_onceToken, &__block_literal_global_4);
    if (__loadBiometricKitIfNecessary_biometricKit)
    {
      v22 = v5;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[objc_class availableDevices](NSClassFromString(CFSTR("BKDeviceManager")), "availableDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (!v10)
        goto LABEL_16;
      v11 = v10;
      v12 = *(_QWORD *)v25;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v15 = NSClassFromString(CFSTR("BKDevice"));
          v23 = 0;
          -[objc_class deviceWithDescriptor:error:](v15, "deviceWithDescriptor:error:", v14, &v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v23;
          objc_msgSend(v16, "descriptor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "type") == 2)
          {
            NSClassFromString(CFSTR("BKDevicePearl"));
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
              goto LABEL_14;
            v20 = v16;
            v18 = v7->_pearlDevice;
            v7->_pearlDevice = v20;
          }

LABEL_14:
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (!v11)
        {
LABEL_16:

          v5 = v22;
          break;
        }
      }
    }
    -[BBBiometricResource _updateHasEnrolledPearlIdentities](v7, "_updateHasEnrolledPearlIdentities", v22);
    if (v7->_pearlDevice)
      -[BBBiometricResource _registerForBKEnrollmentChange](v7, "_registerForBKEnrollmentChange");
    -[BBBiometricResource _registerForBiometricUnlockAllowedChange](v7, "_registerForBiometricUnlockAllowedChange");
    -[BBBiometricResource _registerForPasscodeChange](v7, "_registerForPasscodeChange");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[BBBiometricResource _unregisterForBKEnrollmentChange](self, "_unregisterForBKEnrollmentChange");
  -[BBBiometricResource _unregisterForBiometricUnlockAllowedChange](self, "_unregisterForBiometricUnlockAllowedChange");
  v3.receiver = self;
  v3.super_class = (Class)BBBiometricResource;
  -[BBBiometricResource dealloc](&v3, sel_dealloc);
}

- (void)_registerForBKEnrollmentChange
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleBKEnrollmentChange, CFSTR("com.apple.BiometricKit.enrollmentChanged"), 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_unregisterForBKEnrollmentChange
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.BiometricKit.enrollmentChanged"), 0);
}

- (void)_registerForBiometricUnlockAllowedChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateIsBiometricUnlockAllowed, *MEMORY[0x24BE63740], 0);

}

- (void)_unregisterForBiometricUnlockAllowedChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE63740], 0);

}

- (void)_registerForPasscodeChange
{
  const char *v3;
  NSObject *queue;
  _QWORD v5[5];
  int out_token;

  out_token = 0;
  v3 = (const char *)objc_msgSend((id)*MEMORY[0x24BE63B68], "cStringUsingEncoding:", 4);
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__BBBiometricResource__registerForPasscodeChange__block_invoke;
  v5[3] = &unk_24C563BB0;
  v5[4] = self;
  notify_register_dispatch(v3, &out_token, queue, v5);
}

uint64_t __49__BBBiometricResource__registerForPasscodeChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIsPasscodeSet");
}

- (void)_updateIsPasscodeSet
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isPasscodeSet = objc_msgSend(v3, "isPasscodeSet");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("BBBiometricResourceStateChanged"), self, 0);

}

- (void)_updateIsBiometricUnlockAllowed
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__BBBiometricResource__updateIsBiometricUnlockAllowed__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __54__BBBiometricResource__updateIsBiometricUnlockAllowed__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(v2, "isFingerprintUnlockAllowed");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("BBBiometricResourceStateChanged"), *(_QWORD *)(a1 + 32), 0);

}

- (void)_updateHasEnrolledPearlIdentities
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__BBBiometricResource__updateHasEnrolledPearlIdentities__block_invoke;
  block[3] = &unk_24C562E28;
  block[4] = self;
  dispatch_async(queue, block);
}

void __56__BBBiometricResource__updateHasEnrolledPearlIdentities__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    v6 = 0;
    objc_msgSend(v2, "identitiesWithError:", &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (objc_msgSend(v3, "count"))
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("BBBiometricResourceStateChanged"), *(_QWORD *)(a1 + 32), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
}

@end
