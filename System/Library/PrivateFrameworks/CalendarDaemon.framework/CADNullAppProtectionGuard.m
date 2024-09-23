@implementation CADNullAppProtectionGuard

+ (id)shared
{
  if (shared_onceToken_54 != -1)
    dispatch_once(&shared_onceToken_54, &__block_literal_global_55);
  return (id)shared_guard_53;
}

void __35__CADNullAppProtectionGuard_shared__block_invoke()
{
  CADNullAppProtectionGuard *v0;
  void *v1;

  v0 = objc_alloc_init(CADNullAppProtectionGuard);
  v1 = (void *)shared_guard_53;
  shared_guard_53 = (uint64_t)v0;

}

- (void)initiateAuthenticationForApplicationWithBundleIdentifier:(id)a3 onBehalfOfProcessWithAuditToken:(id *)a4 accessGrantedByEntitlement:(BOOL)a5 completion:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

@end
