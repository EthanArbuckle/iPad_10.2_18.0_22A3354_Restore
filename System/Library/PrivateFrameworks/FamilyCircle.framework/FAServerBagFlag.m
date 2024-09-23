@implementation FAServerBagFlag

+ (id)megadomeKillSwitch
{
  if (megadomeKillSwitch_onceToken[0] != -1)
    dispatch_once(megadomeKillSwitch_onceToken, &__block_literal_global_13);
  return (id)megadomeKillSwitch_megadomeKillSwitch;
}

void __37__FAServerBagFlag_megadomeKillSwitch__block_invoke()
{
  FAServerBagFlag *v0;
  void *v1;

  v0 = -[FAServerBagFlag initWithServerKey:]([FAServerBagFlag alloc], "initWithServerKey:", CFSTR("megadomeKillSwitch"));
  v1 = (void *)megadomeKillSwitch_megadomeKillSwitch;
  megadomeKillSwitch_megadomeKillSwitch = (uint64_t)v0;

}

+ (id)registerDeviceWithPDS
{
  if (registerDeviceWithPDS_onceToken != -1)
    dispatch_once(&registerDeviceWithPDS_onceToken, &__block_literal_global_18_0);
  return (id)registerDeviceWithPDS_registerDeviceWithPDS;
}

void __40__FAServerBagFlag_registerDeviceWithPDS__block_invoke()
{
  FAServerBagFlag *v0;
  void *v1;

  v0 = -[FAServerBagFlag initWithServerKey:]([FAServerBagFlag alloc], "initWithServerKey:", CFSTR("usePDS"));
  v1 = (void *)registerDeviceWithPDS_registerDeviceWithPDS;
  registerDeviceWithPDS_registerDeviceWithPDS = (uint64_t)v0;

}

- (FAServerBagFlag)initWithServerKey:(id)a3
{
  id v4;
  FAServerBagFlag *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FAServerBagFlag;
  v5 = -[FAServerBagFlag init](&v8, sel_init);
  if (v5)
  {
    v9[0] = CFSTR("usePDS");
    v9[1] = CFSTR("megadomeKillSwitch");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v4))
    {
      -[FAServerBagFlag setName:](v5, "setName:", v4);
      -[FAServerBagFlag grabFromServer](v5, "grabFromServer");
    }

  }
  return v5;
}

- (BOOL)isEnabledWithForceRefresh:(BOOL)a3
{
  if (a3)
    -[FAServerBagFlag grabFromServer](self, "grabFromServer");
  return -[FAServerBagFlag value](self, "value");
}

- (void)grabFromServer
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "propertiesForDataclass:", CFSTR("com.apple.Dataclass.Family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1CAEBA000, v6, OS_LOG_TYPE_DEFAULT, "Server results are %@", (uint8_t *)&v11, 0xCu);
  }

  -[FAServerBagFlag name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FAServerBagFlag setValue:](self, "setValue:", objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[FAServerBagFlag name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1CAEBA000, v9, OS_LOG_TYPE_DEFAULT, "No server value for %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

@end
