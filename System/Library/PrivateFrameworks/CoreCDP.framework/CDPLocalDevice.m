@implementation CDPLocalDevice

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_57);
  return (id)sharedInstance_localDevice;
}

void __32__CDPLocalDevice_sharedInstance__block_invoke()
{
  CDPLocalDevice *v0;
  void *v1;

  v0 = objc_alloc_init(CDPLocalDevice);
  v1 = (void *)sharedInstance_localDevice;
  sharedInstance_localDevice = (uint64_t)v0;

}

- (CDPLocalDevice)init
{
  CDPLocalDevice *v2;
  CDPLocalDevice *v3;
  objc_class *CDPDLocalDeviceSecretProxyImplClass;
  CDPLocalDeviceSecretProxy *v5;
  CDPLocalDeviceSecretProxy *localSecretProxy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CDPLocalDevice;
  v2 = -[CDPLocalDevice init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[CDPLocalDevice _currentProcessCreatesDaemonTypeProxy](v2, "_currentProcessCreatesDaemonTypeProxy"))
      CDPDLocalDeviceSecretProxyImplClass = getCDPDLocalDeviceSecretProxyImplClass();
    else
      CDPDLocalDeviceSecretProxyImplClass = (objc_class *)CDPLocalDeviceSecretProxyImpl;
    v5 = (CDPLocalDeviceSecretProxy *)objc_alloc_init(CDPDLocalDeviceSecretProxyImplClass);
    localSecretProxy = v3->_localSecretProxy;
    v3->_localSecretProxy = v5;

  }
  return v3;
}

- (BOOL)hasLocalSecret
{
  return -[CDPLocalDeviceSecretProxy hasLocalSecret](self->_localSecretProxy, "hasLocalSecret");
}

+ (BOOL)hasLocalSecret
{
  void *v2;
  char v3;

  +[CDPLocalDevice sharedInstance](CDPLocalDevice, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasLocalSecret");

  return v3;
}

- (NSNumber)localSecretGeneration
{
  void *v2;
  __CFString *v3;
  void *v4;
  char isKindOfClass;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (void *)MKBGetDeviceConfigurations();
  if (v2)
  {
    v3 = CFSTR("PasscodeGeneration");
    objc_msgSend(v2, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      _CDPLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if ((isKindOfClass & 1) != 0)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[CDPLocalDevice localSecretGeneration].cold.3();

        v8 = v4;
        goto LABEL_15;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[CDPLocalDevice localSecretGeneration].cold.4((uint64_t)v4, (uint64_t)v3, v7);
    }
    else
    {
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CDPLocalDevice localSecretGeneration].cold.2();
    }

    v8 = 0;
LABEL_15:

    goto LABEL_16;
  }
  _CDPLogSystem();
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    -[CDPLocalDevice localSecretGeneration].cold.1(v3, v9, v10, v11, v12, v13, v14, v15);
  v8 = 0;
LABEL_16:

  return (NSNumber *)v8;
}

- (BOOL)supportsSecureBackupRecovery
{
  return !-[CDPLocalDevice _isHomePod](self, "_isHomePod");
}

- (id)marketingModel
{
  return (id)MGCopyAnswer();
}

- (id)hardwareModel
{
  return (id)MGCopyAnswer();
}

- (id)modelVersion
{
  return (id)MGCopyAnswer();
}

- (id)osVersion
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MGCopyAnswer();
  if (+[CDPUtilities isInternalBuild](CDPUtilities, "isInternalBuild"))
  {
    v3 = MGCopyAnswer();

    v2 = (void *)v3;
  }
  return v2;
}

- (id)deviceClass
{
  return (id)MGCopyAnswer();
}

- (id)serialNumber
{
  void *v2;
  NSObject *v3;

  v2 = (void *)MGCopyAnswer();
  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CDPLocalDevice serialNumber].cold.1();

  return v2;
}

- (id)deviceName
{
  return (id)MGCopyAnswer();
}

- (BOOL)_currentProcessCreatesDaemonTypeProxy
{
  return -[CDPLocalDevice currentProcessHasEntitlement:](self, "currentProcessHasEntitlement:", CFSTR("com.apple.managedconfiguration.profiled-access"));
}

- (BOOL)currentProcessHasEntitlement:(id)a3
{
  __CFString *v3;
  void *v4;
  NSObject *v5;
  CFTypeID v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFErrorRef error;

  v3 = (__CFString *)a3;
  if (currentProcessHasEntitlement__onceToken != -1)
    dispatch_once(&currentProcessHasEntitlement__onceToken, &__block_literal_global_81);
  if (currentProcessHasEntitlement__taskRef)
  {
    error = 0;
    v4 = (void *)SecTaskCopyValueForEntitlement((SecTaskRef)currentProcessHasEntitlement__taskRef, v3, &error);
    if (error)
    {
      _CDPLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CDPLocalDevice currentProcessHasEntitlement:].cold.2();

      CFRelease(error);
    }
    if (v4 && (v6 = CFGetTypeID(v4), v6 == CFBooleanGetTypeID()))
      v7 = objc_msgSend(v4, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPLocalDevice currentProcessHasEntitlement:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v7 = 0;
  }

  return v7;
}

SecTaskRef __47__CDPLocalDevice_currentProcessHasEntitlement___block_invoke()
{
  SecTaskRef result;

  result = SecTaskCreateFromSelf(0);
  currentProcessHasEntitlement__taskRef = (uint64_t)result;
  return result;
}

- (BOOL)_isHomePod
{
  return MGGetSInt32Answer() == 7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSecretProxy, 0);
}

- (void)localSecretGeneration
{
  id v5;
  id v6;
  uint64_t v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_19();
  v9 = 2114;
  v10 = a2;
  v6 = v5;
  OUTLINED_FUNCTION_6(&dword_20D7E6000, a3, v7, "@\"Unexpectedly got type %{public}@ for %{public}@\", v8);

}

- (void)serialNumber
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_7(&dword_20D7E6000, v0, v1, "\"Reporting current serial number: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)currentProcessHasEntitlement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_16(&dword_20D7E6000, a1, a3, "\"Unable to check self process entitlements without SecTaskRef.\", a5, a6, a7, a8, 0);
}

- (void)currentProcessHasEntitlement:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_19();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_20D7E6000, v1, (uint64_t)v1, "\"Error when checking self process for entitlement %@. error:%@\", v2);
  OUTLINED_FUNCTION_5();
}

@end
