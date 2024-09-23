@implementation AACloudPolicyRestrictions

+ (id)_managedIcloudPolicyIdentifierForDataclass
{
  if (qword_255EAA6B0 != -1)
    dispatch_once(&qword_255EAA6B0, &unk_24FF9ED30);
  return (id)qword_255EAA6A8;
}

+ (id)_policyRestrictionIdentifierForDataclass:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = a3;
  objc_msgSend__managedIcloudPolicyIdentifierForDataclass(AACloudPolicyRestrictions, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)policyRestrictsDataclass:(id)a3
{
  id v3;
  const char *v4;
  const __CFString *v5;
  __CFString *v6;
  int AppBooleanValue;
  BOOL v8;
  NSObject *v9;

  v3 = a3;
  objc_msgSend__policyRestrictionIdentifierForDataclass_(AACloudPolicyRestrictions, v4, (uint64_t)v3);
  v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v5;
  if (v5)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, CFSTR("com.apple.icloud.managed"), 0);
    v8 = AppBooleanValue != 0;
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_230EB7B0C((uint64_t)v3, AppBooleanValue != 0, v9);
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_230EB7A98((uint64_t)v3, v9);
    v8 = 0;
  }

  return v8;
}

@end
