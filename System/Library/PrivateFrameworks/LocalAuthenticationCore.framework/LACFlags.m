@implementation LACFlags

+ (LACFlags)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (LACFlags *)(id)sharedInstance_sharedInstance;
}

void __26__LACFlags_sharedInstance__block_invoke()
{
  LACFlags *v0;
  void *v1;

  v0 = objc_alloc_init(LACFlags);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (NSString)flagCompanionMockDevicesKey
{
  return (NSString *)CFSTR("LA.companion.device-mock");
}

- (NSNumber)valueForFlagCompanionMockDevices
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.companion.device-mock"), 0);
}

id __44__LACFlags_valueForFlagCompanionMockDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  id v20;

  v4 = a2;
  v5 = a3;
  if ((os_variant_allows_internal_security_policies() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_4;
    v9 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "environment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberFromString:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "objectForKeyedSubscript:", v4);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16
        && (v17 = (void *)v16,
            objc_msgSend(v15, "objectForKeyedSubscript:", v4),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v18,
            v17,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", v4);
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = v5;
      }
      v13 = v20;

    }
  }
  else
  {
    v13 = v5;
  }

  return v13;
}

- (NSString)flagDTOStrictModeEnabledKey
{
  return (NSString *)CFSTR("LA.dto.strictModeEnabled");
}

- (BOOL)valueForFlagDTOStrictModeEnabled
{
  return __44__LACFlags_valueForFlagDTOStrictModeEnabled__block_invoke((uint64_t)self, CFSTR("LA.dto.strictModeEnabled"), 0);
}

uint64_t __44__LACFlags_valueForFlagDTOStrictModeEnabled__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v11, "BOOLValue");

    }
  }

  return a3;
}

- (NSString)flagDTOSecureRepairMockRepairTypeKey
{
  return (NSString *)CFSTR("LA.dto.sr.mock.repairType");
}

- (NSNumber)valueForFlagDTOSecureRepairMockRepairType
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.dto.sr.mock.repairType"), 0);
}

- (NSString)flagDTOSecureRepairMockRepairTypeQueryLatencyKey
{
  return (NSString *)CFSTR("LA.dto.sr.mock.repairTypeQueryLatency");
}

- (NSNumber)valueForFlagDTOSecureRepairMockRepairTypeQueryLatency
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.dto.sr.mock.repairTypeQueryLatency"), 0);
}

- (NSString)flagOnenessSessionActiveKey
{
  return (NSString *)CFSTR("LA.companion.sessionActive");
}

- (NSNumber)valueForFlagOnenessSessionActive
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.companion.sessionActive"), 0);
}

- (NSString)flagOnenessSessionAuthenticationKey
{
  return (NSString *)CFSTR("LA.companion.sessionAuthentication");
}

- (NSData)valueForFlagOnenessSessionAuthentication
{
  return (NSData *)__52__LACFlags_valueForFlagOnenessSessionAuthentication__block_invoke((uint64_t)self, CFSTR("LA.companion.sessionAuthentication"), 0);
}

id __52__LACFlags_valueForFlagOnenessSessionAuthentication__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  id v18;

  v4 = a2;
  v5 = a3;
  if ((os_variant_allows_internal_security_policies() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "environment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataUsingEncoding:", 4);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "persistentDomainForName:", *MEMORY[0x24BDD0D70]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", v4);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14
        && (v15 = (void *)v14,
            objc_msgSend(v9, "objectForKeyedSubscript:", v4),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v16,
            v15,
            (isKindOfClass & 1) != 0))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v4);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = v5;
      }
      v12 = v18;
    }

  }
  else
  {
    v12 = v5;
  }

  return v12;
}

- (NSString)flagPreboardModeKey
{
  return (NSString *)CFSTR("LA.Preboard.Mode");
}

- (NSNumber)valueForFlagPreboardMode
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.Preboard.Mode"), 0);
}

- (NSString)flagSharedModeActiveKey
{
  return (NSString *)CFSTR("LA.sharedMode.isActive");
}

- (NSNumber)valueForFlagSharedModeActive
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.sharedMode.isActive"), 0);
}

- (NSString)flagSharedModeLatencyKey
{
  return (NSString *)CFSTR("LA.sharedMode.latency");
}

- (NSNumber)valueForFlagSharedModeLatency
{
  return (NSNumber *)__44__LACFlags_valueForFlagCompanionMockDevices__block_invoke((uint64_t)self, CFSTR("LA.sharedMode.latency"), 0);
}

- (BOOL)featureFlagApproveByMacEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagApproveByMacFailureUIEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagDimpleKeyGracePeriodEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagDimpleKeySecureRepairEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagEssoniteClickEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardDeveloperModeEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardProtectedVariablesEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)featureFlagPreboardUPPEnabled
{
  return _os_feature_enabled_impl();
}

@end
