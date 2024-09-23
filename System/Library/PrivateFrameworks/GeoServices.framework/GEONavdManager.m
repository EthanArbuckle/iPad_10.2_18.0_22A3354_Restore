@implementation GEONavdManager

+ (id)navdManager
{
  if (qword_1ECDBCC30 != -1)
    dispatch_once(&qword_1ECDBCC30, &__block_literal_global_205);
  return (id)_MergedGlobals_336;
}

void __29__GEONavdManager_navdManager__block_invoke()
{
  GEONavdManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEONavdManager);
  v1 = (void *)_MergedGlobals_336;
  _MergedGlobals_336 = (uint64_t)v0;

}

+ (void)setProxyClass:(Class)a3
{
  _proxyClass_2 = (uint64_t)a3;
}

+ (id)navdManagerClientIdentifier:(id)a3
{
  id v3;
  GEONavdClientInfo *v4;
  objc_class *v5;
  void *v6;
  GEONavdClientInfo *v7;

  v3 = a3;
  v4 = [GEONavdClientInfo alloc];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[GEONavdClientInfo initWithCanonicalName:instanceId:](v4, "initWithCanonicalName:instanceId:", v6, v3);
  return v7;
}

- (GEONavdManager)init
{
  GEONavdManager *v2;
  NSMutableArray *v3;
  NSMutableArray *openers;
  objc_class *v5;
  GEONavdServerProxy *v6;
  GEONavdServerProxy *proxy;
  GEONavdManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEONavdManager;
  v2 = -[GEONavdManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    openers = v2->_openers;
    v2->_openers = v3;

    v2->_openersLock._os_unfair_lock_opaque = 0;
    v5 = (objc_class *)_proxyClass_2;
    if (!_proxyClass_2)
      v5 = (objc_class *)GEONavdRemoteProxy;
    v6 = (GEONavdServerProxy *)objc_alloc_init(v5);
    proxy = v2->_proxy;
    v2->_proxy = v6;

    v8 = v2;
  }

  return v2;
}

- (void)shouldPostDarwinNotificationForNextUpdate:(BOOL)a3
{
  -[GEONavdServerProxy shouldPostDarwinNotificationForNextUpdate:](self->_proxy, "shouldPostDarwinNotificationForNextUpdate:", a3);
}

- (void)openForClient:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray containsObject:](self->_openers, "containsObject:", v9))
  {
    os_unfair_lock_unlock(&self->_openersLock);
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Already open for client (%@)"), v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise");

  }
  v8 = -[NSMutableArray count](self->_openers, "count");
  -[NSMutableArray addObject:](self->_openers, "addObject:", v9);
  os_unfair_lock_unlock(&self->_openersLock);
  if (!v8)
    -[GEONavdServerProxy open](self->_proxy, "open");

}

- (void)closeForClient:(id)a3
{
  os_unfair_lock_s *p_openersLock;
  id v5;
  uint64_t v6;

  p_openersLock = &self->_openersLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_openers, "removeObject:", v5);

  v6 = -[NSMutableArray count](self->_openers, "count");
  os_unfair_lock_unlock(p_openersLock);
  if (!v6)
    -[GEONavdServerProxy close](self->_proxy, "close");
}

- (void)statusWithCallback:(id)a3
{
  -[GEONavdServerProxy statusWithCallback:](self->_proxy, "statusWithCallback:", a3);
}

- (void)startMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5 handler:(id)a6
{
  -[GEONavdServerProxy startMonitoringDestination:forClient:uuid:handler:](self->_proxy, "startMonitoringDestination:forClient:uuid:handler:", a3, a4, a5, a6);
}

- (void)requestRefreshForPlannedDestination:(id)a3 client:(id)a4
{
  -[GEONavdServerProxy requestRefreshForPlannedDestination:client:](self->_proxy, "requestRefreshForPlannedDestination:client:", a3, a4);
}

- (void)onlyPerformLocalUpdatesForPlannedDestination:(id)a3 client:(id)a4
{
  -[GEONavdServerProxy onlyPerformLocalUpdatesForPlannedDestination:client:](self->_proxy, "onlyPerformLocalUpdatesForPlannedDestination:client:", a3, a4);
}

- (void)stopMonitoringDestination:(id)a3 forClient:(id)a4 uuid:(id)a5
{
  -[GEONavdServerProxy stopMonitoringDestination:forClient:uuid:](self->_proxy, "stopMonitoringDestination:forClient:uuid:", a3, a4, a5);
}

- (void)didPostUINotification:(unint64_t)a3 forDestination:(id)a4 fromClient:(id)a5
{
  -[GEONavdServerProxy didPostUINotification:forDestination:fromClient:](self->_proxy, "didPostUINotification:forDestination:fromClient:", a3, a4, a5);
}

- (void)forceCacheRefresh
{
  -[GEONavdServerProxy forceCacheRefresh](self->_proxy, "forceCacheRefresh");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openers, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
