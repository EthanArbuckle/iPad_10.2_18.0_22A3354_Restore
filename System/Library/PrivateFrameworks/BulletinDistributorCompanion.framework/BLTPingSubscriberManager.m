@implementation BLTPingSubscriberManager

- (BLTPingSubscriberManager)initWithDeviceDelegate:(id)a3
{
  id v4;
  BLTPingSubscriberManager *v5;
  BLTPingSubscriberManager *v6;
  BLTBulletinDistributorSubscriberList *v7;
  BLTBulletinDistributorSubscriberList *subscribers;
  void *v9;
  uint64_t v10;
  NSXPCListener *listener;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLTPingSubscriberManager;
  v5 = -[BLTPingSubscriberManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceDelegate, v4);
    v7 = objc_alloc_init(BLTBulletinDistributorSubscriberList);
    subscribers = v6->_subscribers;
    v6->_subscribers = v7;

    objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/BulletinDistributor/PingSubscribers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPingSubscriberManager _loadPingSubscriberBundles:](v6, "_loadPingSubscriberBundles:", v9);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.bulletindistributord.server"));
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_listener, "resume");

  }
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  BLTSubscriberRemoteClient *v7;
  BLTBulletinDistributorSubscriber *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  BLTBulletinDistributorSubscriber *v17;
  BLTBulletinDistributorSubscriber *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[5];
  BLTBulletinDistributorSubscriber *v27;
  _QWORD v28[5];
  BLTBulletinDistributorSubscriber *v29;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.bulletindistributord.server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = -[BLTSubscriberRemoteClient initWithConnection:]([BLTSubscriberRemoteClient alloc], "initWithConnection:", v5);
    v8 = -[BLTBulletinDistributorSubscriber initWithClient:]([BLTBulletinDistributorSubscriber alloc], "initWithClient:", v7);
    -[BLTPingSubscriberManager deviceDelegate](self, "deviceDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTBulletinDistributorSubscriber setDeviceDelegate:](v8, "setDeviceDelegate:", v9);

    objc_msgSend(v5, "setExportedObject:", v8);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EF6888);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 1;
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getWillNanoPresentNotificationForSectionID_subsectionIDs_completion_, 1, 0);
    objc_msgSend(v5, "setExportedInterface:", v10);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFCDA0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v15);

    v16 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke;
    v28[3] = &unk_24D761AA8;
    v28[4] = self;
    v17 = v8;
    v29 = v17;
    objc_msgSend(v5, "setInvalidationHandler:", v28);
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke_2;
    v26[3] = &unk_24D761AA8;
    v26[4] = self;
    v27 = v17;
    v18 = v17;
    objc_msgSend(v5, "setInterruptionHandler:", v26);
    objc_msgSend(v5, "resume");
    -[BLTBulletinDistributorSubscriberList addSubscriber:](self->_subscribers, "addSubscriber:", v18);

  }
  else
  {
    blt_general_log();
    v7 = (BLTSubscriberRemoteClient *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[BLTPingSubscriberManager listener:shouldAcceptNewConnection:].cold.1((uint64_t)CFSTR("com.apple.bulletindistributord.server"), &v7->super, v19, v20, v21, v22, v23, v24);
    v14 = 0;
  }

  return v14;
}

uint64_t __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeSubscriber:", *(_QWORD *)(a1 + 40));
}

uint64_t __63__BLTPingSubscriberManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeSubscriber:", *(_QWORD *)(a1 + 40));
}

- (void)_loadPingSubscriberBundles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char **v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  objc_class *v23;
  BLTLocalPingSubscriberService *v24;
  void *v25;
  BLTBulletinDistributorSubscriber *v26;
  char **v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  BLTPingSubscriberManager *v33;
  uint64_t v34;
  NSObject *obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v40;

  if (v7)
  {
    blt_general_log();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[BLTPingSubscriberManager _loadPingSubscriberBundles:].cold.1((uint64_t)v7, obj, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v6;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v14)
    {
      v15 = v14;
      v30 = v6;
      v16 = *(_QWORD *)v37;
      v17 = 0x24BDD1000uLL;
      v18 = &selRef_hasContainsUpdatedAttachment;
      v32 = *(_QWORD *)v37;
      v33 = self;
      v31 = v4;
      do
      {
        v19 = 0;
        v34 = v15;
        do
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(obj);
          objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v17 + 1160), "bundleWithPath:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_msgSend(v21, "principalClass");
          if (v22)
          {
            v23 = v22;
            if (-[objc_class conformsToProtocol:](v22, "conformsToProtocol:", v18[473]))
            {
              v24 = objc_alloc_init(BLTLocalPingSubscriberService);
              v25 = (void *)objc_msgSend([v23 alloc], "initWithService:", v24);
              v26 = -[BLTBulletinDistributorSubscriber initWithClient:]([BLTBulletinDistributorSubscriber alloc], "initWithClient:", v25);
              -[BLTPingSubscriberManager deviceDelegate](v33, "deviceDelegate");
              v27 = v18;
              v28 = v17;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[BLTBulletinDistributorSubscriber setDeviceDelegate:](v26, "setDeviceDelegate:", v29);

              v17 = v28;
              v18 = v27;
              -[BLTLocalPingSubscriberService setSubscriber:](v24, "setSubscriber:", v26);
              v4 = v31;
              v15 = v34;
              -[BLTBulletinDistributorSubscriberList addSubscriber:](v33->_subscribers, "addSubscriber:", v26);
              objc_msgSend(v25, "pingSubscriberDidLoad");

              v16 = v32;
            }
          }

          ++v19;
        }
        while (v15 != v19);
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v15);
      v7 = 0;
      v6 = v30;
    }
  }

}

- (BLTBulletinDistributorSubscriberList)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_subscribers, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (BLTBulletinDistributorSubscriberDeviceDelegate)deviceDelegate
{
  return (BLTBulletinDistributorSubscriberDeviceDelegate *)objc_loadWeakRetained((id *)&self->_deviceDelegate);
}

- (void)setDeviceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deviceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceDelegate);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "No entitlement %@", a5, a6, a7, a8, 2u);
}

- (void)_loadPingSubscriberBundles:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "Error loading ping subscriber bundles: %@", a5, a6, a7, a8, 2u);
}

@end
