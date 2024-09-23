@implementation CNContactStore(HealthDaemon)

+ (id)hd_contactStoreWithHealthAppIdentity
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend((id)objc_opt_class(), "_healthAppTCCIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAssumedIdentity:", v1);

  v2 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfiguration:", v0);
  return v2;
}

+ (id)_healthAppTCCIdentity
{
  objc_msgSend((id)*MEMORY[0x1E0CB7630], "UTF8String");
  return (id)tcc_identity_create();
}

+ (uint64_t)hd_authorizationStatusForHealthApp
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)objc_opt_class(), "_healthAppTCCIdentity");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
    v1 = objc_msgSend((id)objc_opt_class(), "authorizationStatusForEntityType:assumedIdentity:", 0, v0);
  else
    v1 = 0;

  return v1;
}

@end
