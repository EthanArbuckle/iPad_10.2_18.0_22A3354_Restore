@implementation HDSDefaults

- (HDSDefaults)init
{
  HDSDefaults *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDSDefaults;
  v2 = -[HDSDefaults init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.HomeDeviceSetup"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_instance;
}

void __29__HDSDefaults_sharedInstance__block_invoke()
{
  HDSDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(HDSDefaults);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

+ (id)sharedDefaults
{
  void *v2;
  void *v3;

  +[HDSDefaults sharedInstance](HDSDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)sysDropEnabled
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("SysDrop"), 1) != 0;
}

+ (void)setSysDropMode:(BOOL)a3
{
  objc_msgSend(a1, "setBoolForKey:newValue:", CFSTR("SysDrop"), a3);
}

+ (BOOL)sysDropForceErrorEarlyEnabled
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("SysDropEarlyError"), 0) != 0;
}

+ (BOOL)sysDropForceErrorLateEnabled
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("SysDropLateError"), 0) != 0;
}

+ (BOOL)disableNeedsSetup
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("disableNeedsSetup"), 0) != 0;
}

+ (BOOL)forceFailiTunesAuth
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("ForceFailiTunes"), 0) != 0;
}

+ (BOOL)waitForAccessorySync
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("accessorySyncEnabled"), 0) != 0;
}

+ (BOOL)forceFailTCServerResponse
{
  return objc_msgSend(a1, "getBoolForKey:defaultValue:", CFSTR("failTermsServer"), 0) != 0;
}

+ (int64_t)getIntegerForKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    a4 = objc_msgSend(v7, "integerForKey:", v6);

  return a4;
}

+ (double)getDoubleForKey:(id)a3 defaultValue:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "doubleForKey:", v6);
    a4 = v9;
  }

  return a4;
}

+ (int64_t)getBoolForKey:(id)a3 defaultValue:(BOOL)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v4 = objc_msgSend(v7, "BOOLForKey:", v6);

  return v4;
}

+ (void)setBoolForKey:(id)a3 newValue:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "sharedDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
