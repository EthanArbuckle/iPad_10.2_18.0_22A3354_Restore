@implementation CoreTelephonyShim

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CoreTelephonyShim_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __35__CoreTelephonyShim_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (CoreTelephonyShim)init
{
  CoreTelephonyShim *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableSet *delegates;
  uint64_t v8;
  CoreTelephonyClient *coreTelephonyClient;
  CoreTelephonyShim *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CoreTelephonyShim;
  v2 = -[CoreTelephonyShim init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.autobugcapture.coretelephonyshim", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSMutableSet *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6E38]), "initWithQueue:", v2->_queue);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v8;

    -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
    v10 = v2;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", 0);
  -[NSMutableSet removeAllObjects](self->_delegates, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)CoreTelephonyShim;
  -[CoreTelephonyShim dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  if (v5)
    -[NSMutableSet addObject:](self->_delegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)removeDelegate:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_delegates;
  objc_sync_enter(v4);
  if (v5)
    -[NSMutableSet removeObject:](self->_delegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)copyCarrierBundleValue:(id)a3 key:(id)a4 bundleType:(id)a5 error:(id *)a6
{
  return (id)-[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](self->_coreTelephonyClient, "copyCarrierBundleValue:key:bundleType:error:", a3, a4, a5, a6);
}

- (id)getEnglishCarrierNameFor:(id)a3 error:(id *)a4
{
  return (id)-[CoreTelephonyClient getEnglishCarrierNameFor:error:](self->_coreTelephonyClient, "getEnglishCarrierNameFor:error:", a3, a4);
}

- (id)copyMobileCountryCode:(id)a3 error:(id *)a4
{
  return (id)-[CoreTelephonyClient copyMobileCountryCode:error:](self->_coreTelephonyClient, "copyMobileCountryCode:error:", a3, a4);
}

- (id)copyMobileNetworkCode:(id)a3 error:(id *)a4
{
  return (id)-[CoreTelephonyClient copyMobileNetworkCode:error:](self->_coreTelephonyClient, "copyMobileNetworkCode:error:", a3, a4);
}

- (id)getCurrentDataSubscriptionContextSync:(id *)a3
{
  return (id)-[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](self->_coreTelephonyClient, "getCurrentDataSubscriptionContextSync:", a3);
}

- (void)subscriptionInfoDidChange
{
  NSMutableSet *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_delegates;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_delegates;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "subscriptionInfoDidChange", (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (void)currentDataSimChanged:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_delegates;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_delegates;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "currentDataSimChanged:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_delegates;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_delegates;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "carrierBundleChange:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
