@implementation NSBundle(WFEntitlements)

- (id)wf_entitlements
{
  void *v2;
  void *v3;

  objc_getAssociatedObject(a1, sel_wf_entitlements);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "executablePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WFEntitlementsForExecutableAtPath((uint64_t)v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setAssociatedObject(a1, sel_wf_entitlements, v2, (void *)1);
  }
  return v2;
}

- (id)wf_teamIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_entitlements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.developer.team-identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_apsEnvironment
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_entitlements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("aps-environment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_applicationGroups
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_entitlements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.security.application-groups"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)wf_keychainAccessGroups
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_entitlements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("keychain-access-groups"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
