@implementation _HKDaemonPreferences

+ (id)valueForKey:(id)a3
{
  if (a3)
    return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.healthd"));
  else
    return 0;
}

+ (BOOL)usingDemoDataDatabase
{
  return objc_msgSend(a1, "_BOOLValueForKey:", CFSTR("HealthUseDemoDataDatabaseKey"));
}

+ (BOOL)isGenerateDemoDataSet
{
  int v3;

  v3 = objc_msgSend(a1, "_BOOLValueForKey:", CFSTR("HealthDemoDataGenerateKey"));
  if (v3)
    LOBYTE(v3) = objc_msgSend(a1, "usingDemoDataDatabase");
  return v3;
}

+ (BOOL)isStoreDemoModeSet
{
  return +[_HKBehavior isRunningStoreDemoMode](_HKBehavior, "isRunningStoreDemoMode");
}

+ (BOOL)shouldGenerateDemoData
{
  if ((objc_msgSend(a1, "isGenerateDemoDataSet") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isStoreDemoModeSet");
}

+ (BOOL)setValue:(id)a3 forKey:(id)a4
{
  if (a4)
    return objc_msgSend(a1, "_setPreferenceValue:forKey:", a3);
  else
    return 0;
}

+ (void)synchronizePreferencesWithWatch:(id)a3
{
  HKSynchronizeNanoPreferencesUserDefaults(CFSTR("com.apple.healthd"), a3);
}

+ (BOOL)_BOOLValueForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_safePreferenceForKey:expectedReturnClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

+ (id)_safePreferenceForKey:(id)a3 expectedReturnClass:(Class)a4
{
  void *v4;
  id v5;

  objc_msgSend(a1, "valueForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)_setPreferenceValue:(void *)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.healthd"));
  return CFPreferencesAppSynchronize(CFSTR("com.apple.healthd")) != 0;
}

@end
