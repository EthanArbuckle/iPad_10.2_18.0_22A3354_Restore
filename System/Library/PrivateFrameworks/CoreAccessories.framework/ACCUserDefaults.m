@implementation ACCUserDefaults

- (ACCUserDefaults)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedDefaults);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

+ (id)sharedDefaults
{
  if (sharedDefaults_once != -1)
    dispatch_once(&sharedDefaults_once, &__block_literal_global_3);
  return (id)sharedDefaults_sharedInstance;
}

void __33__ACCUserDefaults_sharedDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreAccessories"));
  v1 = (void *)sharedDefaults_sharedInstance;
  sharedDefaults_sharedInstance = v0;

}

+ (id)sharedDefaultsIapd
{
  if (sharedDefaultsIapd_once != -1)
    dispatch_once(&sharedDefaultsIapd_once, &__block_literal_global_181);
  return (id)sharedDefaultsIapd_sharedInstance;
}

void __37__ACCUserDefaults_sharedDefaultsIapd__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.iapd"));
  v1 = (void *)sharedDefaultsIapd_sharedInstance;
  sharedDefaultsIapd_sharedInstance = v0;

}

+ (id)sharedDefaultsLogging
{
  if (sharedDefaultsLogging_once != -1)
    dispatch_once(&sharedDefaultsLogging_once, &__block_literal_global_182);
  return (id)sharedDefaultsLogging_sharedInstance;
}

void __40__ACCUserDefaults_sharedDefaultsLogging__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.logging"));
  v1 = (void *)sharedDefaultsLogging_sharedInstance;
  sharedDefaultsLogging_sharedInstance = v0;

}

@end
