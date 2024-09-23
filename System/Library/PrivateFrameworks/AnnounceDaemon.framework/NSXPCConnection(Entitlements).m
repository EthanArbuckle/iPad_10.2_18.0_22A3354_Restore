@implementation NSXPCConnection(Entitlements)

- (uint64_t)clientID
{
  return objc_msgSend(a1, "valueForEntitlement:", *MEMORY[0x1E0CF7EB8]);
}

- (uint64_t)hasAnnounceEntitlement
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", *MEMORY[0x1E0CF7EC0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
