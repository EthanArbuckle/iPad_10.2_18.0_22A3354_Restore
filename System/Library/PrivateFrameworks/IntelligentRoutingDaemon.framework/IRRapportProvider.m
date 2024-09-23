@implementation IRRapportProvider

- (IRRapportProvider)init
{
  NSObject *v3;
  dispatch_queue_t v4;
  IRCompanionLinkClient *v5;
  IRRapportProvider *v6;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.intelligentroutingd.rapport", v3);

  v5 = -[IRCompanionLinkClient initWithRapportProvider:targetQueue:]([IRCompanionLinkClient alloc], "initWithRapportProvider:targetQueue:", self, v4);
  v6 = -[IRRapportProvider initWithQueue:companionLinkClient:](self, "initWithQueue:companionLinkClient:", v4, v5);

  return v6;
}

- (IRRapportProvider)initWithQueue:(id)a3 companionLinkClient:(id)a4
{
  id v7;
  id v8;
  IRRapportProvider *v9;
  IRRapportProvider *v10;
  uint64_t v11;
  NSHashTable *observers;
  uint64_t v13;
  NSSet *knownDevices;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IRRapportProvider;
  v9 = -[IRRapportProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_internalQueue, a3);
    objc_storeStrong((id *)&v10->_companionLinkClient, a4);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    knownDevices = v10->_knownDevices;
    v10->_knownDevices = (NSSet *)v13;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[IRCompanionLinkClient stopDiscovery](self->_companionLinkClient, "stopDiscovery");
  v3.receiver = self;
  v3.super_class = (Class)IRRapportProvider;
  -[IRRapportProvider dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 == 1)
    {
      dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      {
        v10 = 136315394;
        v11 = "#rapport-provider, ";
        v12 = 2112;
        v13 = v7;
        _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_DEBUG, "%s[%@], Registering for rapport discovery notifications", (uint8_t *)&v10, 0x16u);
      }

      -[IRRapportProvider _startRapportDiscovery](self, "_startRapportDiscovery");
    }
    v9 = (void *)-[NSSet copy](self->_knownDevices, "copy");
    objc_msgSend(v4, "provider:didUpdateRapportDevices:", self, v9);

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[IRRapportProvider _stopDiscoveryAndResetKnownDevicesIfNeeded](self, "_stopDiscoveryAndResetKnownDevicesIfNeeded");
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    -[IRRapportProvider _stopDiscoveryAndResetKnownDevicesIfNeeded](self, "_stopDiscoveryAndResetKnownDevicesIfNeeded");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)didUpdateRapportDevices:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *knownDevices;
  void *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSSet isEqual:](self->_knownDevices, "isEqual:", v4) & 1) == 0)
  {
    v5 = (NSSet *)objc_msgSend(v4, "copy");
    knownDevices = self->_knownDevices;
    self->_knownDevices = v5;

    v7 = (void *)-[NSSet copy](self->_knownDevices, "copy");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = self->_observers;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "provider:didUpdateRapportDevices:", self, v7, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[IRRapportProvider _logActiveDevices](self, "_logActiveDevices");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)logActiveDevices
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IRRapportProvider _logActiveDevices](self, "_logActiveDevices");
  os_unfair_lock_unlock(p_lock);
}

- (void)_logActiveDevices
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)-[NSSet copy](self->_knownDevices, "copy");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__IRRapportProvider__logActiveDevices__block_invoke;
  v9[3] = &unk_251044BF8;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);
  v6 = (void *)*MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#rapport-provider, Rapport Active Devices:\n%@", buf, 0xCu);

  }
}

void __38__IRRapportProvider__logActiveDevices__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v4, "name");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rapportEffectiveID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRemoteIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaRouteIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iCloudId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %@, rpId: %@, mrID: %@, mediaRouteID: %@, idsID: %@, icloudID: %@, model: %@"), v12, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v11);

}

- (void)_startRapportDiscovery
{
  -[IRCompanionLinkClient startDiscovery](self->_companionLinkClient, "startDiscovery");
}

- (void)_stopRapportDiscovery
{
  -[IRCompanionLinkClient stopDiscovery](self->_companionLinkClient, "stopDiscovery");
}

- (void)_stopDiscoveryAndResetKnownDevicesIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSSet *v7;
  NSSet *knownDevices;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "#rapport-provider, ";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], unregistering for rapport discovery notifications and reset knownDevices", (uint8_t *)&v9, 0x16u);
    }

    -[IRRapportProvider _stopRapportDiscovery](self, "_stopRapportDiscovery");
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    knownDevices = self->_knownDevices;
    self->_knownDevices = v7;

  }
}

- (IRCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownDevices, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
