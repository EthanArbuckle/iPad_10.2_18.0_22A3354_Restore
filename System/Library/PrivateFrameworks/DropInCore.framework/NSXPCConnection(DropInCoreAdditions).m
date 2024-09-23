@implementation NSXPCConnection(DropInCoreAdditions)

- (id)bundleIdentifier
{
  objc_msgSend(a1, "auditToken");
  CPCopyBundleIdentifierAndTeamFromAuditToken();
  return 0;
}

@end
