@implementation BCSEntitlementVerifier

- (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  return BSAuditTokenTaskHasEntitlement();
}

@end
