@implementation NSXPCConnection(ARAdditions)

- (uint64_t)ar_processBundleIdentifier
{
  objc_msgSend(a1, "processIdentifier");
  return BSBundleIDForPID();
}

- (uint64_t)ar_processName
{
  objc_msgSend(a1, "processIdentifier");
  return ARGetProcessNameForPID();
}

- (id)ar_entitlementsArray
{
  void *v1;
  id v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.security.arkit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = (id)MEMORY[0x24BDBD1A8];

  return v2;
}

- (uint64_t)ar_hasPrivateAREntitlement:()ARAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "ar_entitlementsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (uint64_t)ar_BOOLeanValueForEntitlement:()ARAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

@end
