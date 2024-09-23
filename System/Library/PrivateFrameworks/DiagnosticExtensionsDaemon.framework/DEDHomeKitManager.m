@implementation DEDHomeKitManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__DEDHomeKitManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __35__DEDHomeKitManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (void)start
{
  void *v3;
  HMHomeManager *v4;
  HMHomeManager *homeKitManager;

  -[DEDHomeKitManager homeKitManager](self, "homeKitManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (HMHomeManager *)objc_msgSend(objc_alloc(MEMORY[0x24BDD76D8]), "initWithOptions:", 16);
    homeKitManager = self->_homeKitManager;
    self->_homeKitManager = v4;

  }
}

- (NSString)homeKitIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[DEDHomeKitManager homeKitManager](self, "homeKitManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isHomeKitResident
{
  void *v2;
  char v3;

  -[DEDHomeKitManager homeKitManager](self, "homeKitManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentEnabledForThisDevice");

  return v3;
}

- (NSString)homeTheaterSystemName
{
  return (NSString *)-[DEDHomeKitManager stringForAirPlayPreference:](self, "stringForAirPlayPreference:", CFSTR("groupName"));
}

- (NSString)homeTheaterSystemIdentifier
{
  return (NSString *)-[DEDHomeKitManager stringForAirPlayPreference:](self, "stringForAirPlayPreference:", CFSTR("persistentGroupUUID"));
}

- (id)stringForAirPlayPreference:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDBCF50];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSuiteName:", CFSTR("com.apple.airplay"));
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMHomeManager)homeKitManager
{
  return (HMHomeManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHomeKitManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitManager, 0);
}

@end
