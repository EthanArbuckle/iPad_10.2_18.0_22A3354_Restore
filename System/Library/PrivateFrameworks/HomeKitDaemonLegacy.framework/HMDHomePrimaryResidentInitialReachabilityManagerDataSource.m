@implementation HMDHomePrimaryResidentInitialReachabilityManagerDataSource

- (void)persistDataValueToNoBackupStore:(id)a3 withKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.homed.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.homed.notbackedup"));
}

- (id)dataValueFromNoBackupStoreWithKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.homed.notbackedup"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
