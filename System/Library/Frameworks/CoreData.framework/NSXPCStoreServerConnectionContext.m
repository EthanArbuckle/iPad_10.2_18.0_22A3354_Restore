@implementation NSXPCStoreServerConnectionContext

- (id)entitlements
{
  return -[NSXPCStoreConnectionInfo entitlements](self->_info, "entitlements");
}

- (id)managedObjectContext
{
  return self->_context;
}

- (id)persistentStoreCoordinator
{
  return -[NSXPCStoreConnectionInfo persistentStoreCoordinator](self->_info, "persistentStoreCoordinator");
}

- (void)setManagedObjectContext:(id)a3
{
  id v5;

  if (self->_context != a3)
  {
    v5 = a3;

    self->_context = (NSManagedObjectContext *)a3;
  }
}

- (NSXPCStoreServerConnectionContext)initWithConnectionInfo:(id)a3
{
  NSXPCStoreServerConnectionContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSXPCStoreServerConnectionContext;
  v4 = -[NSXPCStoreServerConnectionContext init](&v6, sel_init);
  if (v4)
    v4->_info = (NSXPCStoreConnectionInfo *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_activeStore = 0;
  self->_info = 0;

  self->_context = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreServerConnectionContext;
  -[NSXPCStoreServerConnectionContext dealloc](&v3, sel_dealloc);
}

- (void)setActiveStore:(uint64_t)a1
{
  id v4;

  if (a1)
  {
    if (*(void **)(a1 + 32) != a2)
    {
      v4 = a2;

      *(_QWORD *)(a1 + 32) = a2;
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSXPCStoreServerConnectionContext: \n\tentitlements = %@ ;\n\tcontext = %@ ;\n\tinfo = %@>"),
               -[NSXPCStoreServerConnectionContext entitlements](self, "entitlements"),
               self->_context,
               self->_info);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_info;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)userInfo
{
  return -[NSXPCStoreConnectionInfo userInfo](self->_info, "userInfo");
}

- (void)setUserInfo:(id)a3
{
  NSXPCStoreConnectionInfo *info;
  id v5;
  id userInfo;

  info = self->_info;
  if (info)
  {
    v5 = a3;
    os_unfair_lock_lock_with_options();
    userInfo = info->_userInfo;
    info->_userInfo = a3;
    os_unfair_lock_unlock(&info->_lock);

  }
}

- (id)notificationManager
{
  return self->_manager;
}

- (void)setNotificationManager:(id)a3
{
  id v5;

  if (self->_manager != a3)
  {
    v5 = a3;

    self->_manager = a3;
  }
}

- (id)cache
{
  NSXPCStoreConnectionInfo *info;

  info = self->_info;
  if (info)
    return info->_cache;
  else
    return 0;
}

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return (id)objc_msgSend(-[NSXPCStoreServerConnectionContext cache](self, "cache"), "inverseIsToOnePrefetchRequestForRelationshipNamed:onEntity:", a3, a4);
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return (id)objc_msgSend(-[NSXPCStoreServerConnectionContext cache](self, "cache"), "manyToOnePrefetchRequestForRelationshipNamed:onEntity:", a3, a4);
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  return (id)objc_msgSend(-[NSXPCStoreServerConnectionContext cache](self, "cache"), "manyToManyPrefetchRequestsForRelationshipNamed:onEntity:", a3, a4);
}

- (BOOL)_allowCoreDataFutures
{
  return 1;
}

@end
