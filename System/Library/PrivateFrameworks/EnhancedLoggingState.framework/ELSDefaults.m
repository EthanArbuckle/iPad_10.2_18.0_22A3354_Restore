@implementation ELSDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  return (id)sharedInstance_sharedInstance;
}

void __29__ELSDefaults_sharedInstance__block_invoke()
{
  ELSDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(ELSDefaults);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (ELSDefaults)init
{
  ELSDefaults *v2;
  ELSDefaults *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ELSDefaults;
  v2 = -[ELSDefaults init](&v5, sel_init);
  v3 = v2;
  if (v2)
    v2->_cloudKitEnvironment = -[ELSDefaults _getCloudKitEnvironment](v2, "_getCloudKitEnvironment");
  return v3;
}

- (unint64_t)_getCloudKitEnvironment
{
  void *v2;
  void *v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.enhanced-logging-state"));
  objc_msgSend(v2, "valueForKey:", CFSTR("environment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    ELSLogHandleForCategory(11);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_2141BF000, v4, OS_LOG_TYPE_DEFAULT, "Using CloudKit environment set in user defaults: %@", (uint8_t *)&v11, 0xCu);
    }

    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AppleServiceToolkit"));
    v7 = objc_msgSend(v6, "integerForKey:", CFSTR("Server"));
    ELSLogHandleForCategory(11);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2141BF000, v8, OS_LOG_TYPE_DEFAULT, "Using UAT CloudKit environment", (uint8_t *)&v11, 2u);
      }
      v5 = 1;
    }
    else
    {
      if (v9)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2141BF000, v8, OS_LOG_TYPE_DEFAULT, "Using production CloudKit environment", (uint8_t *)&v11, 2u);
      }
      v5 = 0;
    }

  }
  return v5;
}

- (unint64_t)cloudKitEnvironment
{
  return self->_cloudKitEnvironment;
}

@end
