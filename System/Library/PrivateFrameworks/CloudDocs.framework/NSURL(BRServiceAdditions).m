@implementation NSURL(BRServiceAdditions)

- (id)_br_itemServiceSyncProxy
{
  return +[BRFileProviderServicesFactory itemServiceSyncProxyForURL:](BRFileProviderServicesFactory, "itemServiceSyncProxyForURL:", a1);
}

- (uint64_t)_br_fetchItemServiceSyncProxy:()BRServiceAdditions
{
  return +[BRFileProviderServicesFactory fetchItemServiceSyncProxyForURL:handler:](BRFileProviderServicesFactory, "fetchItemServiceSyncProxyForURL:handler:", a1, a3);
}

- (id)_br_clientSideCollaborationServiceSyncProxy
{
  return +[BRFileProviderServicesFactory clientSideServiceSyncProxyForURL:](BRFileProviderServicesFactory, "clientSideServiceSyncProxyForURL:", a1);
}

@end
