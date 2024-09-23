@implementation ASUDefaultsManager

+ (id)databaseEncryptionKeyWithIdentifier:(uint64_t)a1
{
  id v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (__CFString *)objc_msgSend((id)objc_opt_self(), "copyDefaultsKeyForEncryptionKeyWithIdentifier:", v2);

  v4 = (void *)CFPreferencesCopyAppValue(v3, CFSTR("com.apple.appstoreutilities"));
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v4, 0);
  else
    v5 = 0;

  return v5;
}

+ (void)setDatabaseEncryptionKey:(void *)a3 withIdentifier:
{
  id v4;
  id v5;
  void *v6;
  __CFString *key;

  v4 = a3;
  v5 = a2;
  key = (__CFString *)objc_msgSend((id)objc_opt_self(), "copyDefaultsKeyForEncryptionKeyWithIdentifier:", v4);

  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(key, v6, CFSTR("com.apple.appstoreutilities"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.appstoreutilities"));

}

+ (id)copyDefaultsKeyForEncryptionKeyWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x24BE08118];
  v5 = a3;
  objc_msgSend(v4, "serialNumber");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if ((objc_msgSend(a1, "_isRunningInAppleVirtualMachine") & 1) == 0)
    {
      ASULogHandleForCategory(1);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_236337000, v8, OS_LOG_TYPE_FAULT, "Database defaults key generation failed unexpectedly", buf, 2u);
      }

    }
    v7 = CFSTR("xyzzy");
  }
  v9 = v7;

  objc_msgSend(v5, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lu"), objc_msgSend(v10, "hash"));
  return v11;
}

+ (CFPropertyListRef)transporterConfiguration
{
  objc_opt_self();
  return (id)CFPreferencesCopyAppValue(CFSTR("TransporterConfiguration"), CFSTR("com.apple.appstoreutilities"));
}

+ (uint64_t)setTransporterConfiguration:(uint64_t)a1
{
  id v2;

  v2 = a2;
  objc_opt_self();
  CFPreferencesSetAppValue(CFSTR("TransporterConfiguration"), v2, CFSTR("com.apple.appstoreutilities"));

  return CFPreferencesAppSynchronize(CFSTR("com.apple.appstoreutilities"));
}

+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5
{
  BOOL v6;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  v6 = CFPreferencesGetAppBooleanValue(a3, a4, &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat == 1)
    return v6;
  else
    return a5;
}

+ (void)_setBool:(BOOL)a3 forKey:(__CFString *)a4 applicationId:(__CFString *)a5
{
  CFPreferencesSetAppValue(a4, (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), a5);
}

+ (double)_doubleForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(double)a5
{
  void *v6;
  void *v7;
  double v8;

  v6 = (void *)objc_msgSend(a1, "_copyNumberForKey:applicationId:", a3, a4);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    a5 = v8;
  }

  return a5;
}

+ (void)_setDouble:(double)a3 forKey:(__CFString *)a4 applicationId:(__CFString *)a5
{
  CFPreferencesSetAppValue(a4, (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3), a5);
}

+ (id)_copyNumberForKey:(__CFString *)a3 applicationId:(__CFString *)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)CFPreferencesCopyAppValue(a3, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (void)_setNullableValue:(void *)a3 forKey:(__CFString *)a4
{
  CFPreferencesSetAppValue(a4, a3, CFSTR("com.apple.appstoreutilities"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.appstoreutilities"));
}

+ (BOOL)_isRunningInAppleVirtualMachine
{
  if (qword_2563DD7E0 != -1)
    dispatch_once(&qword_2563DD7E0, &__block_literal_global_1);
  return _MergedGlobals != 0;
}

void __53__ASUDefaultsManager__isRunningInAppleVirtualMachine__block_invoke()
{
  NSObject *v0;
  int v1;
  size_t v2;
  uint8_t buf[4];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &_MergedGlobals, &v2, 0, 0))
  {
    ASULogHandleForCategory(1);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      v1 = *__error();
      *(_DWORD *)buf = 67109120;
      v4 = v1;
      _os_log_fault_impl(&dword_236337000, v0, OS_LOG_TYPE_FAULT, "sysctlbyname for kern.hv_vmm_present failed with error: %{darwin.errno}d", buf, 8u);
    }

  }
}

@end
