@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 ownerQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator;
  v11 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_firewallRuleManager, v8);
    objc_storeStrong((id *)&v12->_notificationCenter, a4);
    objc_storeStrong((id *)&v12->_ownerQueue, a5);
    v13 = v12;
  }

  return v12;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 cloudFetchScheduler:(id)a5 ownerQueue:(id)a6
{
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *cloudFetchScheduler;

  v10 = (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)a5;
  v11 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator initWithFirewallRuleManager:notificationCenter:ownerQueue:](self, "initWithFirewallRuleManager:notificationCenter:ownerQueue:", a3, a4, a6);
  cloudFetchScheduler = v11->_cloudFetchScheduler;
  v11->_cloudFetchScheduler = v10;

  return v11;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator)initWithFirewallRuleManager:(id)a3 notificationCenter:(id)a4 cloudFetchInterval:(double)a5 cloudFetchRetryInterval:(double)a6 ownerQueue:(id)a7
{
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v9;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v10;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *cloudFetchScheduler;

  v9 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator initWithFirewallRuleManager:notificationCenter:ownerQueue:](self, "initWithFirewallRuleManager:notificationCenter:ownerQueue:", a3, a4, a7);
  v10 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler initWithIdentifier:interval:retryInterval:delegate:]([HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler alloc], "initWithIdentifier:interval:retryInterval:delegate:", CFSTR("com.apple.homed.firewall-rule-manager.cloud-fetch-scheduler"), v9, a5, a6);
  cloudFetchScheduler = v9->_cloudFetchScheduler;
  v9->_cloudFetchScheduler = v10;

  return v9;
}

- (BOOL)isRunning
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_mirror != 0;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror)mirror
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_mirror;
}

- (void)setMirror:(id)a3
{
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v4;
  NSObject *v5;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *mirror;

  v4 = (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  mirror = self->_mirror;
  self->_mirror = v4;

  if (v4)
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator __maybeStartOrStopCloudFetchScheduler](self, "__maybeStartOrStopCloudFetchScheduler");
  else
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator __stopCloudFetchScheduler](self, "__stopCloudFetchScheduler");
}

- (void)startupWithLocalDatabase:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v15;
  uint64_t v16;
  void *v17;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *v29;
  _QWORD block[4];
  id v31;

  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke;
    block[3] = &unk_1E89C0870;
    v31 = v7;
    dispatch_async(v9, block);

    v10 = v31;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0C94C40]);
    objc_msgSend((id)objc_opt_class(), "ckContainerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithContainerIdentifier:environment:", v12, objc_msgSend((id)objc_opt_class(), "ckContainerEnvironment"));

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D32C28]), "initWithContainerID:", v10);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D32C20]), "initWithLocalDatabase:configuration:", v6, v13);
    if (v14)
    {
      v15 = [HMDNetworkRouterFirewallRuleManagerBackingStoreMirror alloc];
      v16 = objc_msgSend((id)objc_opt_class(), "ckUseAnonymousAccount");
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror initWithLocalDatabase:cloudDatabase:useAnonymousRequests:ownerQueue:](v15, "initWithLocalDatabase:cloudDatabase:useAnonymousRequests:ownerQueue:", v6, v14, v16, v17);

      v19 = objc_alloc_init(MEMORY[0x1E0D32CC8]);
      objc_msgSend(v19, "setCreateIfNeeded:", 1);
      v27 = 0;
      objc_msgSend(v6, "openZoneWithMirror:configuration:error:", v18, v19, &v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v27;
      if (v20)
      {
        objc_msgSend(v20, "startUp");
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator __startupWithMirroredLocalZone:completion:](self, "__startupWithMirroredLocalZone:completion:", v20, v7);
      }
      else
      {
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
        v23 = objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_3;
        v24[3] = &unk_1E89C1D68;
        v26 = v7;
        v25 = v21;
        dispatch_async(v23, v24);

      }
    }
    else
    {
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_2;
      v28[3] = &unk_1E89C0870;
      v29 = (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v7;
      dispatch_async(v22, v28);

      v18 = v29;
    }

  }
}

- (void)__startupWithMirroredLocalZone:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirroredLocalZone](self, "mirroredLocalZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke;
    block[3] = &unk_1E89C1D68;
    v21 = v11;
    v22 = v7;
    v14 = v11;
    dispatch_async(v15, block);

    v16 = v22;
    goto LABEL_12;
  }
  objc_msgSend(v6, "mirror");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EFB1E070))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v14)
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke_2;
    v18[3] = &unk_1E89C0870;
    v19 = v7;
    dispatch_async(v17, v18);

    v16 = v19;
LABEL_12:

    goto LABEL_13;
  }
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator setMirroredLocalZone:](self, "setMirroredLocalZone:", v6);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator __startupWithMirror:completion:](self, "__startupWithMirror:completion:", v14, v7);
LABEL_13:

}

- (void)__startupWithMirror:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id from;
  id location;
  _QWORD block[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke;
    block[3] = &unk_1E89C1D68;
    v23 = v11;
    v24 = v7;
    v15 = v11;
    dispatch_async(v14, block);

  }
  else
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    objc_msgSend(v6, "startupFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_2;
    v16[3] = &unk_1E89B4298;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    objc_copyWeak(&v19, &from);
    v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)shutdownWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  _QWORD block[4];
  id v22;

  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator setMirror:](self, "setMirror:", 0);
    objc_msgSend(v6, "shutdownFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_2;
    v19[3] = &unk_1E89B42C0;
    v19[4] = self;
    v20 = v4;
    v9 = (id)objc_msgSend(v7, "addCompletionBlock:", v19);

    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirroredLocalZone](self, "mirroredLocalZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirroredLocalZone](self, "mirroredLocalZone");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator setMirroredLocalZone:](self, "setMirroredLocalZone:", 0);
      objc_msgSend(v11, "shutdown");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_4;
      v18[3] = &unk_1E89BF608;
      v18[4] = self;
      v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v18);

    }
    else
    {
      v15 = v6;
      if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EFB1E290))
        v16 = v15;
      else
        v16 = 0;
      v11 = v16;

      v17 = (id)objc_msgSend(v11, "shutdown");
    }

  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke;
    block[3] = &unk_1E89C0870;
    v22 = v4;
    dispatch_async(v14, block);

    v6 = v22;
  }

}

- (void)firewallRuleManagerClientsDidChange
{
  NSObject *v3;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator __maybeStartOrStopCloudFetchScheduler](self, "__maybeStartOrStopCloudFetchScheduler");
}

- (void)fetchCloudChangesWithQualityOfService:(int64_t)a3 ignoreLastFetchedAccessories:(BOOL)a4 forceChangeNotifications:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:requiredRecordIDs:schedulerXpcActivity:completion:](self, "_fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:requiredRecordIDs:schedulerXpcActivity:completion:", a3, v7, v6, 0, 0, v10);
  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __165__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_completion___block_invoke;
    block[3] = &unk_1E89C0870;
    v14 = v10;
    dispatch_async(v12, block);

  }
}

- (void)_fetchCloudChangesWithQualityOfService:(int64_t)a3 ignoreLastFetchedAccessories:(BOOL)a4 forceChangeNotifications:(BOOL)a5 requiredRecordIDs:(id)a6 schedulerXpcActivity:(id)a7 completion:(id)a8
{
  id v13;
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v28;
  NSObject *v29;
  void *v30;
  _BOOL4 v31;
  id v32;
  _QWORD v33[4];
  id v34;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v35;
  id v36;
  void (**v37)(id, _QWORD, void *);
  BOOL v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v31 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v32 = a7;
  v14 = (void (**)(id, _QWORD, void *))a8;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator firewallRuleManager](self, "firewallRuleManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activeClients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke;
  v39[3] = &unk_1E89B4310;
  v20 = v17;
  v40 = v20;
  v21 = v16;
  v41 = v21;
  objc_msgSend(v18, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);

  if (v13 && (objc_msgSend(v13, "isSubsetOfSet:", v21) & 1) == 0)
  {
    v22 = (void *)objc_msgSend(v13, "mutableCopy");
    v27 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v22, "minusSet:", v21));
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v30;
      v44 = 2112;
      v45 = v22;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cloud fetch triggered but required records are not watched: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v26);
    v25 = v32;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:qualityOfService:", CFSTR("FetchCloudChanges"), a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "copy");
    v33[0] = v19;
    v33[1] = 3221225472;
    v33[2] = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_144;
    v33[3] = &unk_1E89B4360;
    v37 = v14;
    v34 = v13;
    v35 = self;
    v38 = a5;
    v25 = v32;
    v36 = v32;
    objc_msgSend(v23, "fetchCloudChangesForRecordIDs:options:ignoreLastSynchronizedRecords:xpcActivity:completion:", v24, v22, v31, v36, v33);

    v26 = v37;
  }

}

- (id)_fetchAllDataForProductGroup:(id)a3 productNumber:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if (v10 && v11)
  {
    v14 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", v10, v11, 0);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordID](v14, "cloudKitRecordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchAllDataForRecordIDs:options:error:", v18, v12, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v10)
    {
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
      v14 = (HMDNetworkRouterFirewallRuleAccessoryIdentifier *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleAccessoryIdentifier fetchAllDataWithOptions:error:](v14, "fetchAllDataWithOptions:error:", v12, a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v14 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", v10, CFSTR("00000000"), 0);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitZoneName](v14, "cloudKitZoneName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchAllDataForZoneName:options:error:", v20, v12, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v19;
}

- (id)_fetchNetworkDeclarationsForRecordIDs:(id)a3 options:(id)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFString *v24;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v25;
  void *v26;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  __CFString *v42;
  void *v43;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v44;
  NSObject *v45;
  void *v46;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id obj;
  void *v54;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  id v64;
  uint8_t buf[4];
  uint64_t v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  __CFString *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  objc_msgSend(v13, "fetchAllDataForRecordIDs:options:error:", v10, v11, &v64);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v64;

  if (v14)
  {
    if (a6)
    {
      v14 = objc_retainAutorelease(v14);
      v15 = 0;
      *a6 = v14;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_44;
  }
  if (a5)
  {
    v55 = self;
    v48 = v11;
    v16 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    objc_msgSend(v17, "fetchOverridesForRecordIDs:options:error:", v10, v11, &v63);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v63;

    if (v14)
    {
      if (a6)
      {
        v14 = objc_retainAutorelease(v14);
        v15 = 0;
        *a6 = v14;
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_43;
    }
    v48 = v11;
    v55 = self;
    objc_msgSend((id)objc_opt_class(), "__networkDeclarationDataDictionaryFromOverrideObjectDictionary:", v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v52, "count", v48));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v50 = v10;
  obj = v10;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (!v57)
    goto LABEL_36;
  v56 = *(_QWORD *)v60;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v60 != v56)
        objc_enumerationMutation(obj);
      v20 = *(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations **)(*((_QWORD *)&v59 + 1) + 8 * v19);
      objc_msgSend(v16, "objectForKeyedSubscript:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21
        || (objc_msgSend(v52, "objectForKeyedSubscript:", v20),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("networkDeclarations")),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23,
            v22))
      {
        +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v20);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v25 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v24, v22, v21 != 0);
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v55;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v25)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v30;
            *(_DWORD *)buf = 138543874;
            v32 = CFSTR("Cloud");
            if (v21)
              v32 = CFSTR("Override");
            v66 = v30;
            v67 = 2112;
            v68 = v32;
            v69 = 2112;
            v70 = v24;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEBUG, "%{public}@%@ data for %@ parsed successfully", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
          v33 = v54;
          v34 = v25;
          goto LABEL_28;
        }
        v35 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if (v21)
        {
          if (v35)
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = (uint64_t)v36;
            v67 = 2112;
            v68 = v24;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Override data for %@ failed to parse successfully, removing", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          v33 = v51;
          v34 = v20;
LABEL_28:
          objc_msgSend(v33, "addObject:", v34);
        }
        else
        {
          if (v35)
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v66 = (uint64_t)v37;
            v67 = 2112;
            v68 = v24;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cloud data for %@ failed to parse successfully", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
        }

      }
      ++v19;
    }
    while (v57 != v19);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    v57 = v38;
  }
  while (v38);
LABEL_36:

  v39 = v51;
  v11 = v49;
  v10 = v50;
  if (objc_msgSend(v51, "count"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](v55, "mirror");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v41 = objc_msgSend(v40, "removeOverridesForRecordIDs:options:error:", v51, v49, &v58);
    v42 = (__CFString *)v58;

    if ((v41 & 1) == 0)
    {
      v43 = (void *)MEMORY[0x1D17BA0A0]();
      v44 = v55;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = (uint64_t)v46;
        v67 = 2112;
        v68 = v42;
        _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove invalid override data: %@", buf, 0x16u);

        v39 = v51;
      }

      objc_autoreleasePoolPop(v43);
    }

  }
  v15 = (void *)objc_msgSend(v54, "copy");

  v14 = 0;
LABEL_43:

LABEL_44:
  return v15;
}

- (id)pairedMetadataVersionConfigurationForAccessory:(id)a3 pairedMetadata:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v19;
  NSObject *v20;
  void *v21;
  HMDAssertionLogEvent *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v31;
  NSObject *v32;
  void *v33;
  HMDAssertionLogEvent *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v39;
  NSObject *v40;
  void *v41;
  HMDAssertionLogEvent *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v51;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v52;
  NSObject *v53;
  void *v54;
  HMDAssertionLogEvent *v55;
  void *v56;
  void *v57;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v58;
  id obj;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v58 = self;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "firmwareVersion");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63)
  {
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = self;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v54;
      v70 = 2112;
      v71 = v6;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have firmware version on %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v51);
    v55 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must have firmware version on %@"), v6);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "submitLogEvent:", v55);

  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v57 = v7;
  objc_msgSend(v7, "versionConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (!v62)
  {
    v60 = 0;
    v9 = 0;
    goto LABEL_38;
  }
  v9 = 0;
  v60 = 0;
  v61 = *(_QWORD *)v65;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v65 != v61)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v10);
      objc_msgSend(v11, "accessoryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "productGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
      {
        objc_msgSend(v12, "productNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "productNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v58;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v69 = v21;
        v70 = 2112;
        v71 = v12;
        v72 = 2112;
        v73 = v6;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Version configuration contains identifier %@ that does not match requested identifier %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v22 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Version configuration contains identifier %@ that does not match requested identifier %@"), v12, v6);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "submitLogEvent:", v22);

LABEL_12:
      objc_msgSend(v11, "accessoryIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firmwareVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "compare:", v63);
      if (v26 == -1)
      {
        if (v9)
        {
          objc_msgSend(v9, "accessoryIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firmwareVersion");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v25, "compare:", v36);

          if (v37 != 1)
          {
            if (v37)
              goto LABEL_31;
            v38 = (void *)MEMORY[0x1D17BA0A0]();
            v39 = v58;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v69 = v41;
              v70 = 2112;
              v71 = v12;
              _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple rule configurations with the same version for %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v38);
            v34 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Multiple rule configurations with the same version for %@"), v12);
            goto LABEL_26;
          }
          v45 = v11;

          v9 = v45;
        }
        else
        {
          v9 = v11;
        }
      }
      else
      {
        if (!v26)
        {
          v47 = v11;

          v48 = v60;
          goto LABEL_42;
        }
        if (v60)
        {
          objc_msgSend(v60, "accessoryIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firmwareVersion");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v25, "compare:", v28);

          if (v29 != -1)
          {
            if (v29)
              goto LABEL_31;
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = v58;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v69 = v33;
              v70 = 2112;
              v71 = v12;
              _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple version configurations with the same version for %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v30);
            v34 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Multiple version configurations with the same version for %@"), v12);
LABEL_26:
            v42 = v34;
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "submitLogEvent:", v42);

            goto LABEL_31;
          }
          v44 = v11;

          v60 = v44;
        }
        else
        {
          v60 = v11;
        }
      }
LABEL_31:

      ++v10;
    }
    while (v62 != v10);
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    v62 = v46;
  }
  while (v46);
LABEL_38:

  v48 = v60;
  if (v9)
    v49 = v9;
  else
    v49 = v60;
  v47 = v49;
LABEL_42:

  return v47;
}

- (id)_fetchPairedMetadataForAccessories:(id)a3 options:(id)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  HMDCloudPairedMetadata *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __CFString *v45;
  HMDCloudPairedMetadata *v46;
  void *v47;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  HMDCloudPairedMetadata *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  char v61;
  __CFString *v62;
  void *v63;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v64;
  NSObject *v65;
  void *v66;
  id v68;
  void *v69;
  __CFString *v70;
  id v71;
  void *v72;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v73;
  uint64_t v74;
  __CFString *v75;
  uint64_t v76;
  id obj;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  __CFString *v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v10, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v86 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "cloudKitRecordID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v18);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    }
    while (v15);
  }

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0;
  objc_msgSend(v19, "fetchAllDataForRecordIDs:options:error:", v13, v11, &v84);
  v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = (__CFString *)v84;

  if (v20)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v20);
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = (uint64_t)v24;
      v91 = 2112;
      v92 = v20;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Fetch paired metadata for record failed with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v25 = 0;
    goto LABEL_60;
  }
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = self;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v90 = (uint64_t)v29;
    v91 = 2112;
    v92 = v70;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Fetched paired metadata dictionary %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  if (a5)
  {
    v73 = v27;
    v68 = v11;
    v75 = (__CFString *)MEMORY[0x1E0C9AA70];
LABEL_27:
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[__CFString count](v70, "count"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v71 = v13;
    v76 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (!v76)
      goto LABEL_52;
    v74 = *(_QWORD *)v80;
    while (1)
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v80 != v74)
          objc_enumerationMutation(v71);
        v41 = *(HMDCloudPairedMetadata **)(*((_QWORD *)&v79 + 1) + 8 * v40);
        -[__CFString objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", v41);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        if (v42
          || (-[__CFString objectForKeyedSubscript:](v70, "objectForKeyedSubscript:", v41),
              v44 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("pairedMetadata")),
              v43 = (void *)objc_claimAutoreleasedReturnValue(),
              v44,
              v43))
        {
          +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v41);
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v46 = -[HMDCloudPairedMetadata initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDCloudPairedMetadata alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v45, v43, v42 != 0);
          v47 = (void *)MEMORY[0x1D17BA0A0]();
          v48 = v73;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v46)
          {
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v51 = objc_claimAutoreleasedReturnValue();
              v52 = (void *)v51;
              *(_DWORD *)buf = 138543874;
              v53 = CFSTR("Cloud");
              if (v42)
                v53 = CFSTR("Override");
              v90 = v51;
              v91 = 2112;
              v92 = v53;
              v93 = 2112;
              v94 = v45;
              _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_INFO, "%{public}@%@ data for %@ parsed successfully", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v47);
            v54 = v72;
            v55 = v46;
            goto LABEL_44;
          }
          v56 = os_log_type_enabled(v49, OS_LOG_TYPE_ERROR);
          if (v42)
          {
            if (v56)
            {
              HMFGetLogIdentifier();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v90 = (uint64_t)v57;
              v91 = 2112;
              v92 = v45;
              _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Override data for %@ failed to parse successfully, removing", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v47);
            v54 = v69;
            v55 = v41;
LABEL_44:
            objc_msgSend(v54, "addObject:", v55);
          }
          else
          {
            if (v56)
            {
              HMFGetLogIdentifier();
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v90 = (uint64_t)v58;
              v91 = 2112;
              v92 = v45;
              _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Cloud data for %@ failed to parse successfully", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v47);
          }

        }
        ++v40;
      }
      while (v76 != v40);
      v59 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      v76 = v59;
      if (!v59)
      {
LABEL_52:

        v11 = v68;
        if (objc_msgSend(v69, "count"))
        {
          -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](v73, "mirror");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0;
          v61 = objc_msgSend(v60, "removeOverridesForRecordIDs:options:error:", v69, v68, &v78);
          v62 = (__CFString *)v78;

          if ((v61 & 1) == 0)
          {
            v63 = (void *)MEMORY[0x1D17BA0A0]();
            v64 = v73;
            HMFGetOSLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v90 = (uint64_t)v66;
              v91 = 2112;
              v92 = v62;
              _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove invalid override data: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v63);
          }

        }
        v25 = (void *)objc_msgSend(v72, "copy");

        v20 = 0;
        v31 = v75;
        goto LABEL_59;
      }
    }
  }
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](v27, "mirror");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  objc_msgSend(v30, "fetchOverridesForRecordIDs:options:error:", v13, v11, &v83);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (__CFString *)v83;

  if (!v20)
  {
    objc_msgSend((id)objc_opt_class(), "__pairedMetadataDictionaryFromOverrideObjectDictionary:", v31);
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = v27;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = (uint64_t)v39;
      v91 = 2112;
      v92 = v75;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Fetched overrides dictionary %@", buf, 0x16u);

    }
    v73 = v27;
    v68 = v11;

    objc_autoreleasePoolPop(v36);
    goto LABEL_27;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v20);
  v32 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = v27;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v90 = (uint64_t)v35;
    v91 = 2112;
    v92 = v20;
    _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Fetch overrides for paired metadata failed with error %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
  v25 = 0;
LABEL_59:

LABEL_60:
  return v25;
}

- (id)fetchPairedMetadataVersionConfigurationsForAccessories:(id)a3 qualityOfService:(int64_t)a4 ignoreOverrides:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v31;
  NSObject *v32;
  void *v33;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v34;
  void *k;
  void *v36;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v37;
  void *v38;
  void *v39;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v44;
  NSObject *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v64;
  NSObject *v65;
  void *v66;
  void *v68;
  void *v69;
  id obj;
  void *v71;
  id v72;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v73;
  uint64_t v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  id v94;
  __int16 v95;
  id v96;
  _BYTE v97[128];
  uint64_t v98;

  v7 = a5;
  v98 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v73 = self;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
  obj = v12;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v86;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v86 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        objc_msgSend(v17, "firmwareVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v54 = (void *)MEMORY[0x1D17BA0A0]();
          v55 = v73;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v57;
            v93 = 2112;
            v94 = v17;
            _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@Firmware version not specified on %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v54);
          v12 = obj;
          if (a6)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
            v53 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v53 = 0;
          }
          v19 = obj;
          goto LABEL_55;
        }
      }
      v12 = obj;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      if (v14)
        continue;
      break;
    }
  }

  objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:qualityOfService:", CFSTR("FetchPairedMetadata"), a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchPairedMetadataForAccessories:options:ignoreOverrides:error:](v73, "_fetchPairedMetadataForAccessories:options:ignoreOverrides:error:", v12, v19, v7, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if (objc_msgSend(v20, "count"))
    {
      v69 = v19;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v68 = v21;
      v75 = v21;
      v23 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v82 != v25)
              objc_enumerationMutation(v75);
            v27 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
            objc_msgSend(v27, "baseAccessoryIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              v30 = (void *)MEMORY[0x1D17BA0A0]();
              v31 = v73;
              HMFGetOSLogHandle();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v92 = v33;
                v93 = 2112;
                v94 = v28;
                _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@More than one rule configuration for %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v30);
            }
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, v28);

          }
          v24 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
        }
        while (v24);
      }

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(obj, "count"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v72 = obj;
      v34 = v73;
      v76 = (id)objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v76)
      {
        v74 = *(_QWORD *)v78;
        do
        {
          for (k = 0; k != v76; k = (char *)k + 1)
          {
            if (*(_QWORD *)v78 != v74)
              objc_enumerationMutation(v72);
            v36 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)k);
            v37 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
            objc_msgSend(v36, "productGroup");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "productNumber");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:](v37, "initWithProductGroup:productNumber:firmwareVersion:", v38, v39, 0);

            objc_msgSend(v22, "objectForKeyedSubscript:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (v41)
            {
              -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator pairedMetadataVersionConfigurationForAccessory:pairedMetadata:](v34, "pairedMetadataVersionConfigurationForAccessory:pairedMetadata:", v36, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (void *)MEMORY[0x1D17BA0A0]();
              v44 = v34;
              HMFGetOSLogHandle();
              v45 = objc_claimAutoreleasedReturnValue();
              v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG);
              if (v42)
              {
                if (v46)
                {
                  HMFGetLogIdentifier();
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v92 = v47;
                  v93 = 2112;
                  v94 = v36;
                  v95 = 2112;
                  v96 = v42;
                  _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_DEBUG, "%{public}@Found pairedMetadata version configuration for %@: %@", buf, 0x20u);

                  v34 = v73;
                }

                objc_autoreleasePoolPop(v43);
                objc_msgSend(v71, "addObject:", v42);
              }
              else
              {
                if (v46)
                {
                  HMFGetLogIdentifier();
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v92 = v52;
                  v93 = 2112;
                  v94 = v36;
                  _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_DEBUG, "%{public}@No pairedMetadata version configuration for %@", buf, 0x16u);

                  v34 = v73;
                }

                objc_autoreleasePoolPop(v43);
              }

            }
            else
            {
              v48 = (void *)MEMORY[0x1D17BA0A0]();
              v49 = v34;
              HMFGetOSLogHandle();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v92 = v51;
                v93 = 2112;
                v94 = v36;
                _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_DEBUG, "%{public}@No pairedMetadata present for %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v48);
            }

          }
          v76 = (id)objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v76);
      }

      v53 = (void *)objc_msgSend(v71, "copy");
      v19 = v69;
      v12 = obj;
      v21 = v68;
    }
    else
    {
      v63 = (void *)MEMORY[0x1D17BA0A0]();
      v64 = v73;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v66;
        v93 = 2112;
        v94 = v12;
        _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_INFO, "%{public}@No pairedMetadata present for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v63);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v58 = (void *)MEMORY[0x1D17BA0A0]();
    v59 = v73;
    HMFGetOSLogHandle();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = *a6;
      *(_DWORD *)buf = 138543874;
      v92 = v61;
      v93 = 2112;
      v94 = v12;
      v95 = 2112;
      v96 = v62;
      _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_INFO, "%{public}@Nil pairedMetadata for %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v58);
    v53 = 0;
  }

LABEL_55:
  return v53;
}

- (void)fetchRulesForAccessories:(id)a3 qualityOfService:(int64_t)a4 ignoreOverrides:(BOOL)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v29;
  NSObject *v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  id v35;
  void (**v36)(id, _QWORD, void *);
  int64_t v37;
  BOOL v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, _QWORD, void *))a6;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v17, "firmwareVersion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v49 = v31;
            v50 = 2112;
            v51 = v17;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Firmware version not specified on %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v28);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v27);
          v26 = v12;
          goto LABEL_20;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v14)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v12, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = v12;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "cloudKitRecordID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v22);
  }

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __131__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchRulesForAccessories_qualityOfService_ignoreOverrides_completion___block_invoke;
  v33[3] = &unk_1E89BB800;
  v36 = v10;
  v37 = a4;
  v33[4] = self;
  v34 = v19;
  v38 = a5;
  v35 = v20;
  v26 = v19;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchCloudChangesIfNeededForRecordIDs:completion:](self, "_fetchCloudChangesIfNeededForRecordIDs:completion:", v26, v33);

  v27 = v36;
LABEL_20:

}

- (id)ruleConfigurationForAccessory:(id)a3 declarations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v19;
  NSObject *v20;
  void *v21;
  HMDAssertionLogEvent *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HMDAssertionLogEvent *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v47;
  NSObject *v48;
  void *v49;
  HMDAssertionLogEvent *v50;
  void *v51;
  void *v52;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v53;
  id obj;
  id v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53 = self;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "firmwareVersion");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58)
  {
    v46 = (void *)MEMORY[0x1D17BA0A0]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v49;
      v65 = 2112;
      v66 = v6;
      _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have firmware version on %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v46);
    v50 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must have firmware version on %@"), v6);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "submitLogEvent:", v50);

  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v52 = v7;
  objc_msgSend(v7, "ruleConfigurations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (!v57)
  {
    v55 = 0;
    v9 = 0;
    goto LABEL_36;
  }
  v9 = 0;
  v55 = 0;
  v56 = *(_QWORD *)v60;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v60 != v56)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v10);
      objc_msgSend(v11, "accessoryIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "productGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
      {
        objc_msgSend(v12, "productNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "productNumber");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v53;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v64 = v21;
        v65 = 2112;
        v66 = v12;
        v67 = 2112;
        v68 = v6;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Rule configuration contains identifier %@ that does not match requested identifier %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v22 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Rule configuration contains identifier %@ that does not match requested identifier %@"), v12, v6);
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "submitLogEvent:", v22);

LABEL_12:
      objc_msgSend(v11, "accessoryIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firmwareVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v25, "compare:", v58);
      if (v26 == -1)
      {
        if (v9)
        {
          objc_msgSend(v9, "accessoryIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "firmwareVersion");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v25, "compare:", v34);

          if (v35 != 1)
          {
            if (v35)
              goto LABEL_29;
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = v53;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
              goto LABEL_24;
LABEL_23:
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v64 = v36;
            v65 = 2112;
            v66 = v12;
            _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Multiple rule configurations with the same version for %@", buf, 0x16u);

LABEL_24:
            objc_autoreleasePoolPop(v30);
            v37 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Multiple rule configurations with the same version for %@"), v12);
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "submitLogEvent:", v37);

            goto LABEL_29;
          }
          v40 = v11;

          v9 = v40;
        }
        else
        {
          v9 = v11;
        }
      }
      else
      {
        if (!v26)
        {
          v42 = v11;

          v43 = v55;
          goto LABEL_40;
        }
        if (v55)
        {
          objc_msgSend(v55, "accessoryIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firmwareVersion");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v25, "compare:", v28);

          if (v29 != -1)
          {
            if (v29)
              goto LABEL_29;
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = v53;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
              goto LABEL_24;
            goto LABEL_23;
          }
          v39 = v11;

          v55 = v39;
        }
        else
        {
          v55 = v11;
        }
      }
LABEL_29:

      ++v10;
    }
    while (v57 != v10);
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    v57 = v41;
  }
  while (v41);
LABEL_36:

  v43 = v55;
  if (v9)
    v44 = v9;
  else
    v44 = v55;
  v42 = v44;
LABEL_40:

  return v42;
}

- (void)_fetchCloudChangesIfNeededForRecordIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v9, "cloudFetchNeededForRecordIDs:error:", v6, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (v10)
  {
    if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Cloud fetch is needed for (some of) %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __112__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesIfNeededForRecordIDs_completion___block_invoke;
      v17[3] = &unk_1E89B63A0;
      v18 = v7;
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:requiredRecordIDs:schedulerXpcActivity:completion:](v13, "_fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:requiredRecordIDs:schedulerXpcActivity:completion:", 17, 0, 0, v6, 0, v17);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }
  else if (v11)
  {
    (*((void (**)(id, id))v7 + 2))(v7, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
}

- (void)_listCloudRecordsForProductGroup:(id)a3 rawOutput:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    v11 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", v8, CFSTR("00000000"), 0);
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordID](v11, "cloudKitRecordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("ListCloudRecords"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__listCloudRecordsForProductGroup_rawOutput_completion___block_invoke;
  v17[3] = &unk_1E89B43B0;
  v19 = a4;
  v17[4] = self;
  v18 = v9;
  v16 = v9;
  objc_msgSend(v15, "fetchCloudRecordIDsForZoneID:options:completion:", v13, v14, v17);

}

- (void)_dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 verifySignatures:(BOOL)a6 completion:(id)a7
{
  __CFString *v12;
  id v13;
  NSObject *v14;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v15;
  const __CFString *v16;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v32;
  NSObject *v33;
  void *v34;
  void *context;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD aBlock[5];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD *v46;
  BOOL v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v12 = (__CFString *)a4;
  v13 = a7;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
  if (v12)
    v16 = v12;
  else
    v16 = CFSTR("00000000");
  v17 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:](v15, "initWithProductGroup:productNumber:firmwareVersion:", v36, v16, 0);
  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordID](v17, "cloudKitRecordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "zoneID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    v18 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("DumpCloudRecords"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__115957;
  v48[4] = __Block_byref_object_dispose__115958;
  v21 = MEMORY[0x1E0C809B0];
  v49 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke;
  aBlock[3] = &unk_1E89B4400;
  aBlock[4] = self;
  v22 = v19;
  v42 = v22;
  v23 = v18;
  v43 = v23;
  v24 = v20;
  v44 = v24;
  v25 = v13;
  v45 = v25;
  v46 = v48;
  v47 = a5;
  v26 = _Block_copy(aBlock);
  v27 = v26;
  if (a6)
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    if (v30)
    {
      v37[0] = v21;
      v37[1] = 3221225472;
      v37[2] = __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_181;
      v37[3] = &unk_1E89B4428;
      v40 = v48;
      v37[4] = self;
      v38 = v25;
      v39 = v27;
      objc_msgSend(v30, "fetchVerificationCertificatesRecordWithOperationGroup:completion:", 0, v37);

      v31 = v38;
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v34;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@No idea how to validate signatures on another mirror class", buf, 0xCu);

      }
      objc_autoreleasePoolPop(context);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v25 + 2))(v25, 0, v31);
    }

  }
  else
  {
    (*((void (**)(void *))v26 + 2))(v26);
  }

  _Block_object_dispose(v48, 8);
}

- (void)dumpCloudRecordsForProductGroup:(id)a3 productNumber:(id)a4 rawOutput:(BOOL)a5 listOnly:(BOOL)a6 verifySignatures:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a8;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (v14 && !objc_msgSend(v14, "length"))
    goto LABEL_9;
  if (v15)
  {
    v18 = objc_msgSend(v15, "length");
    if (!v14 || !v18)
    {
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __155__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke;
      v22[3] = &unk_1E89C1D68;
      v23 = v19;
      v24 = v16;
      v21 = v19;
      dispatch_async(v20, v22);

      goto LABEL_13;
    }
  }
  else if (!v14 && !v10)
  {
    goto LABEL_9;
  }
  if (v10)
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _listCloudRecordsForProductGroup:rawOutput:completion:](self, "_listCloudRecordsForProductGroup:rawOutput:completion:", v14, v11, v16);
  else
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _dumpCloudRecordsForProductGroup:productNumber:rawOutput:verifySignatures:completion:](self, "_dumpCloudRecordsForProductGroup:productNumber:rawOutput:verifySignatures:completion:", v14, v15, v11, v9, v16);
LABEL_13:

}

- (id)dumpLocalRulesForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  if (!v14 || objc_msgSend(v14, "length"))
  {
    if (v15)
    {
      v17 = objc_msgSend(v15, "length");
      if (v14 && v17)
      {
LABEL_6:
        objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("DumpLocalRules"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchAllDataForProductGroup:productNumber:options:error:](self, "_fetchAllDataForProductGroup:productNumber:options:error:", v14, v15, v18, a8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "__networkDeclarationDataDictionaryFromRecordDictionary:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v25 = 0;
LABEL_20:

          goto LABEL_21;
        }
        v21 = (void *)v20;
        if (!a6)
        {
          -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchAllOverridesForProductGroup:productNumber:options:error:](self, "_fetchAllOverridesForProductGroup:productNumber:options:error:", v14, v15, v18, a8);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v25 = 0;
            goto LABEL_19;
          }
          v23 = (void *)v22;
          objc_msgSend((id)objc_opt_class(), "__networkDeclarationDataDictionaryFromOverrideObjectDictionary:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count"))
          {
            v27 = (void *)objc_msgSend(v21, "mutableCopy");
            objc_msgSend(v27, "addEntriesFromDictionary:", v24);

            v21 = v27;
          }

        }
        objc_msgSend((id)objc_opt_class(), "__jsonFromDeclarations:rawOutput:error:", v21, v9, a8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_21:

  return v25;
}

- (BOOL)removeAllLocalRulesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("RemoveAllLocalRules"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "removeAllLocalRulesWithOptions:error:", v6, a3);

  return (char)a3;
}

- (id)dumpPairedMetadataForProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5 ignoreOverrides:(BOOL)a6 rawOutput:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  if (!v14 || objc_msgSend(v14, "length"))
  {
    if (v15)
    {
      v17 = objc_msgSend(v15, "length");
      if (v14 && v17)
      {
LABEL_6:
        objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("DumpLocalPairedMetadata"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchAllDataForProductGroup:productNumber:options:error:](self, "_fetchAllDataForProductGroup:productNumber:options:error:", v14, v15, v18, a8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "__pairedMetadataDataDictionaryFromRecordDictionary:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v25 = 0;
LABEL_20:

          goto LABEL_21;
        }
        v21 = (void *)v20;
        if (!a6)
        {
          -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchAllOverridesForProductGroup:productNumber:options:error:](self, "_fetchAllOverridesForProductGroup:productNumber:options:error:", v14, v15, v18, a8);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {
            v25 = 0;
            goto LABEL_19;
          }
          v23 = (void *)v22;
          objc_msgSend((id)objc_opt_class(), "__pairedMetadataDictionaryFromOverrideObjectDictionary:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count"))
          {
            v27 = (void *)objc_msgSend(v21, "mutableCopy");
            objc_msgSend(v27, "addEntriesFromDictionary:", v24);

            v21 = v27;
          }

        }
        objc_msgSend((id)objc_opt_class(), "__jsonFromPairedMetadata:rawOutput:error:", v21, v9, a8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    else if (!a5)
    {
      goto LABEL_6;
    }
  }
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_21:

  return v25;
}

- (id)_fetchAllOverridesForProductGroup:(id)a3 productNumber:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if (v10 && v11)
  {
    v14 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", v10, v11, 0);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordID](v14, "cloudKitRecordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchOverridesForRecordIDs:options:error:", v18, v12, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!v10)
    {
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
      v14 = (HMDNetworkRouterFirewallRuleAccessoryIdentifier *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleAccessoryIdentifier fetchAllOverridesWithOptions:error:](v14, "fetchAllOverridesWithOptions:error:", v12, a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v14 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", v10, CFSTR("00000000"), 0);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitZoneName](v14, "cloudKitZoneName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchOverridesForZoneName:options:error:", v20, v12, a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v19;
}

- (BOOL)addOverrides:(id)a3 replace:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  v8 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__115957;
  v25 = __Block_byref_object_dispose__115958;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_addOverrides_replace_error___block_invoke;
  v18[3] = &unk_1E89B4450;
  v18[4] = self;
  v20 = &v21;
  v11 = v10;
  v19 = v11;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v18);
  v12 = (void *)v22[5];
  if (v12)
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("AddOverrides"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "copy");
    v13 = objc_msgSend(v15, "addOverrides:replace:options:error:", v16, v6, v14, a5);

  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (BOOL)removeAllOverridesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("RemoveAllOverrides"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "removeAllOverridesWithOptions:error:", v6, a3);

  return (char)a3;
}

- (BOOL)removeOverridesForProductGroup:(id)a3 productNumber:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  NSObject *v10;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v11;
  const __CFString *v12;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;

  v8 = (__CFString *)a4;
  v9 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
  if (v8)
    v12 = v8;
  else
    v12 = CFSTR("00000000");
  v13 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:](v11, "initWithProductGroup:productNumber:firmwareVersion:", v9, v12, 0);

  -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitZoneName](v13, "cloudKitZoneName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordName](v13, "cloudKitRecordName");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:", CFSTR("RemoveOverrides"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator mirror](self, "mirror");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "removeOverridesForZoneName:recordName:options:error:", v14, v8, v15, a5);

  return v17;
}

- (void)__maybeStartOrStopCloudFetchScheduler
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](self, "isRunning"))
  {
    *(_QWORD *)&v23 = 0;
    *((_QWORD *)&v23 + 1) = &v23;
    v24 = 0x2020000000;
    v25 = 0;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator firewallRuleManager](self, "firewallRuleManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeClients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __99__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___maybeStartOrStopCloudFetchScheduler__block_invoke;
    v20[3] = &unk_1E89B4478;
    v20[4] = &v23;
    objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator cloudFetchScheduler](self, "cloudFetchScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!*(_BYTE *)(*((_QWORD *)&v23 + 1) + 24))
      goto LABEL_18;
    if ((objc_msgSend(v6, "isRunning") & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Starting cloud fetch scheduler", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v7, "start");
      goto LABEL_15;
    }
    if (!*(_BYTE *)(*((_QWORD *)&v23 + 1) + 24))
    {
LABEL_18:
      if (objc_msgSend(v7, "isRunning"))
      {
        v8 = (void *)MEMORY[0x1D17BA0A0]();
        v9 = self;
        HMFGetOSLogHandle();
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Stopping cloud fetch scheduler", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(v7, "stop");
      }
    }
LABEL_15:

    _Block_object_dispose(&v23, 8);
    return;
  }
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 138543362;
    *(_QWORD *)((char *)&v23 + 4) = v15;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Not starting cloud fetch scheduler because we should not be running", (uint8_t *)&v23, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
}

- (void)__stopCloudFetchScheduler
{
  NSObject *v3;
  void *v4;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Unconditionally stopping cloud fetch scheduler", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator cloudFetchScheduler](v5, "cloudFetchScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");

}

- (void)__cloudFetchSchedulerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Cloud fetch scheduler fired", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator isRunning](v7, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator cloudFetchScheduler](v7, "cloudFetchScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      objc_msgSend(v12, "runningActivity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___cloudFetchSchedulerFired___block_invoke;
    v14[3] = &unk_1E89B7460;
    v14[4] = v7;
    v15 = v4;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator _fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:requiredRecordIDs:schedulerXpcActivity:completion:](v7, "_fetchCloudChangesWithQualityOfService:ignoreLastFetchedAccessories:forceChangeNotifications:requiredRecordIDs:schedulerXpcActivity:completion:", 9, 1, 0, 0, v13, v14);

  }
}

- (void)cloudFetchSchedulerFired:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator ownerQueue](self, "ownerQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_cloudFetchSchedulerFired_completion___block_invoke;
  v8[3] = &unk_1E89C1D68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (HMDNetworkRouterFirewallRuleManagerInternal)firewallRuleManager
{
  return (HMDNetworkRouterFirewallRuleManagerInternal *)objc_loadWeakRetained((id *)&self->_firewallRuleManager);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler)cloudFetchScheduler
{
  return self->_cloudFetchScheduler;
}

- (OS_dispatch_queue)ownerQueue
{
  return self->_ownerQueue;
}

- (HMBLocalZone)mirroredLocalZone
{
  return self->_mirroredLocalZone;
}

- (void)setMirroredLocalZone:(id)a3
{
  objc_storeStrong((id *)&self->_mirroredLocalZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredLocalZone, 0);
  objc_storeStrong((id *)&self->_ownerQueue, 0);
  objc_storeStrong((id *)&self->_cloudFetchScheduler, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_mirror, 0);
  objc_destroyWeak((id *)&self->_firewallRuleManager);
}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_cloudFetchSchedulerFired_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__cloudFetchSchedulerFired:", *(_QWORD *)(a1 + 40));
}

void __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___cloudFetchSchedulerFired___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched cloud changes with poll timer: %@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud changes with poll timer: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "firewallRuleManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didCompleteScheduledCloudFetch");

}

uint64_t __99__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___maybeStartOrStopCloudFetchScheduler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __89__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_addOverrides_replace_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "firmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v13;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Firmware version specified on %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "cloudKitRecordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v22;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Multiple declarations given for the same identifier %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

      *a4 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v17);
    }

  }
}

uint64_t __155__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_dumpCloudRecordsForProductGroup_productNumber_rawOutput_listOnly_verifySignatures_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "mirror");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_2;
  v7[3] = &unk_1E89B43D8;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(_BYTE *)(a1 + 80);
  objc_msgSend(v2, "fetchCloudRecordsForZoneID:recordID:options:completion:", v3, v4, v5, v7);

}

void __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[HMDNetworkRouterFirewallRuleManagerBackingStoreMirror publicKeysFromCertificateRecord:](HMDNetworkRouterFirewallRuleManagerBackingStoreMirror, "publicKeysFromCertificateRecord:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
        v16 = v11;
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") == 1)
          v17 = "";
        else
          v17 = "s";
        objc_msgSend(v5, "recordID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hmbDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v15;
        v28 = 2048;
        v29 = v25;
        v30 = 2080;
        v31 = v17;
        v11 = v16;
        v32 = 2112;
        v33 = v19;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Found %lu valid public key%s in record %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v11);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recordID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hmbDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v20;
        v28 = 2112;
        v29 = (uint64_t)v22;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@No valid public keys found in record %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v23 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __147__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__dumpCloudRecordsForProductGroup_productNumber_rawOutput_verifySignatures_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = (void *)objc_opt_class();
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = *(unsigned __int8 *)(a1 + 56);
    v11 = 0;
    objc_msgSend(v6, "__jsonFromRecords:validateWithPublicKeys:rawOutput:error:", v5, v7, v8, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __116__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__listCloudRecordsForProductGroup_rawOutput_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v27 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "zoneID", v27);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "zoneName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "recordName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!*(_BYTE *)(a1 + 48))
          {
            +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "productGroup");
            v15 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "productNumber");
            v16 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v16;
            v12 = (void *)v15;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v12);
          }
          objc_msgSend(v17, "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v7);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v4, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "sortUsingSelector:", sel_compare_, v27);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    v23 = (void *)objc_opt_class();
    v24 = *(unsigned __int8 *)(a1 + 48);
    v28 = 0;
    objc_msgSend(v23, "__jsonStringFromDictionary:rawOutput:error:", v4, v24, &v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v28;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v3 = v27;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __112__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesIfNeededForRecordIDs_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  if (a2)
  {
    v7 = 0;
  }
  else
  {
    v7 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);

      goto LABEL_5;
    }
  }
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
LABEL_5:

}

void __131__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchRulesForAccessories_qualityOfService_ignoreOverrides_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *j;
  void *v24;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v25;
  void *v26;
  void *v27;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id obj;
  id obja;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "__createProcessingOptionsWithLabel:qualityOfService:", CFSTR("FetchRules"), *(_QWORD *)(a1 + 64));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(unsigned __int8 *)(a1 + 72);
    v68 = 0;
    objc_msgSend(v5, "_fetchNetworkDeclarationsForRecordIDs:options:ignoreOverrides:error:", v6, v4, v7, &v68);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v68;
    if (v8)
    {
      v56 = a1;
      if (objc_msgSend(v8, "count"))
      {
        v51 = v9;
        v53 = v4;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v52 = v8;
        obj = v8;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v65;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v65 != v13)
                objc_enumerationMutation(obj);
              v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
              objc_msgSend(v15, "baseAccessoryIdentifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
              {
                v18 = (void *)MEMORY[0x1D17BA0A0]();
                v19 = *(id *)(v56 + 32);
                HMFGetOSLogHandle();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v70 = v21;
                  v71 = 2112;
                  v72 = v16;
                  _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@More than one rule configuration for %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v18);
              }
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);

            }
            v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          }
          while (v12);
        }

        v22 = v56;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(v56 + 48), "count"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v55 = *(id *)(v56 + 48);
        obja = (id)objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
        if (obja)
        {
          v57 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != obja; j = (char *)j + 1)
            {
              if (*(_QWORD *)v61 != v57)
                objc_enumerationMutation(v55);
              v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
              v25 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
              objc_msgSend(v24, "productGroup");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "productNumber");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:](v25, "initWithProductGroup:productNumber:firmwareVersion:", v26, v27, 0);

              objc_msgSend(v10, "objectForKeyedSubscript:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend(*(id *)(v22 + 32), "ruleConfigurationForAccessory:declarations:", v24, v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)MEMORY[0x1D17BA0A0]();
                v32 = *(id *)(v22 + 32);
                HMFGetOSLogHandle();
                v33 = objc_claimAutoreleasedReturnValue();
                v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
                if (v30)
                {
                  if (v34)
                  {
                    HMFGetLogIdentifier();
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v70 = v35;
                    v71 = 2112;
                    v72 = v24;
                    v73 = 2112;
                    v74 = v30;
                    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEBUG, "%{public}@Found rule configuration for %@: %@", buf, 0x20u);

                    v22 = v56;
                  }

                  objc_autoreleasePoolPop(v31);
                  objc_msgSend(v54, "addObject:", v30);
                }
                else
                {
                  if (v34)
                  {
                    HMFGetLogIdentifier();
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v70 = v40;
                    v71 = 2112;
                    v72 = v24;
                    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEBUG, "%{public}@No declaration for %@", buf, 0x16u);

                    v22 = v56;
                  }

                  objc_autoreleasePoolPop(v31);
                }

              }
              else
              {
                v36 = (void *)MEMORY[0x1D17BA0A0]();
                v37 = *(id *)(v22 + 32);
                HMFGetOSLogHandle();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  HMFGetLogIdentifier();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v70 = v39;
                  v71 = 2112;
                  v72 = v24;
                  _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No declarations for %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v36);
              }

            }
            obja = (id)objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
          }
          while (obja);
        }

        v41 = *(_QWORD *)(v22 + 56);
        v42 = (void *)objc_msgSend(v54, "copy");
        (*(void (**)(uint64_t, void *, _QWORD))(v41 + 16))(v41, v42, 0);

        v4 = v53;
        v3 = 0;
        v9 = v51;
        v8 = v52;
      }
      else
      {
        v43 = v8;
        v44 = (void *)MEMORY[0x1D17BA0A0]();
        v45 = *(id *)(v56 + 32);
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = *(void **)(v56 + 48);
          *(_DWORD *)buf = 138543618;
          v70 = v47;
          v71 = 2112;
          v72 = v48;
          _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_DEBUG, "%{public}@No declarations for %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        v49 = *(_QWORD *)(v56 + 56);
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v49 + 16))(v49, v50, 0);

        v8 = v43;
      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "watchedAccessoryIdentifiersForFirewallRuleManager:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2;
    v5[3] = &unk_1E89B42E8;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v5);

  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_144(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) != 0)
  {
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v7, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2_145;
      v22 = &unk_1E89B4338;
      v23 = *(id *)(a1 + 32);
      v24 = v9;
      v10 = v9;
      objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v19);
      v11 = (void *)objc_msgSend(v10, "copy", v19, v20, v21, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "firewallRuleManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64) || objc_msgSend(v11, "count"))
    {
      v27 = CFSTR("HMDNotificationNetworkRouterFirewallRulesUpdatedAccessoriesKey");
      v28[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("HMDNotificationNetworkRouterFirewallRulesUpdated"), v12, v13);

    }
    if (!*(_QWORD *)(a1 + 48))
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Resetting the cloud fetch scheduler after a successful force fetch", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(*(id *)(a1 + 40), "__stopCloudFetchScheduler");
      objc_msgSend(*(id *)(a1 + 40), "__maybeStartOrStopCloudFetchScheduler");
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2_145(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __205__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator__fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_requiredRecordIDs_schedulerXpcActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cloudKitRecordID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __165__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_fetchCloudChangesWithQualityOfService_ignoreLastFetchedAccessories_forceChangeNotifications_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "ownerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_3;
  v8[3] = &unk_1E89C1D68;
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

void __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to shut down local zone: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __85__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_shutdownWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_2(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void (**v8)(id, void *);
  void *v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "ownerQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_3;
    v10[3] = &unk_1E89BF7D0;
    v11 = v4;
    v13 = a1[4];
    objc_copyWeak(&v14, a1 + 6);
    v12 = v6;
    dispatch_async(v7, v10);

    objc_destroyWeak(&v14);
  }
  else
  {
    v8 = (void (**)(id, void *))a1[4];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9);

  }
}

void __93__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirror_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 40), "setMirror:", WeakRetained);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    }
  }
}

uint64_t __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __104__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___startupWithMirroredLocalZone_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __98__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_startupWithLocalDatabase_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_116169 != -1)
    dispatch_once(&logCategory__hmf_once_t0_116169, &__block_literal_global_116170);
  return (id)logCategory__hmf_once_v1_116171;
}

+ (NSString)ckContainerIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("engraveContainerIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v4, "numberValue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "unsignedIntegerValue"),
        v5,
        !v6))
  {
LABEL_8:
    v7 = CFSTR("com.apple.willow.engrave");
    goto LABEL_9;
  }
  if (v6 != 1)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Unknown container target value %lu, ignoring", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_8;
  }
  v7 = CFSTR("com.apple.willow.engrave.staging");
LABEL_9:

  return &v7->isa;
}

+ (int64_t)ckContainerEnvironment
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceForKey:", CFSTR("engraveContainerEnvironment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "numberValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((unint64_t)(v6 - 1) >= 2)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2048;
      v15 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Unknown container environment value %ld, ignoring", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

+ (BOOL)ckUseAnonymousAccount
{
  void *v2;
  char v3;

  objc_msgSend(a1, "ckContainerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.willow.engrave"));

  return v3;
}

+ (id)__jsonValueForCKRecordValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v10, "base64EncodedStringWithOptions:", 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_24;
      }
      v14 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      if (v16)
      {
        objc_msgSend(v16, "description");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
        v10 = v18;

        if (v10)
        {
          v19 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v10, "fileURL");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "dataWithContentsOfURL:", v20);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "__jsonValueForCKRecordValue:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
          v6 = v13;

          goto LABEL_5;
        }
        v21 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v22 = v21;
        else
          v22 = 0;
        v23 = v22;

        if (!v23)
        {
          objc_msgSend(v21, "description");
          v5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v16 = v23;
        v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v31 != v27)
                objc_enumerationMutation(v16);
              objc_msgSend(a1, "__jsonValueForCKRecordValue:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), (_QWORD)v30);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v29);

            }
            v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v26);
        }

        v6 = (void *)objc_msgSend(v24, "copy");
      }

      goto LABEL_5;
    }
  }
  v5 = v4;
LABEL_4:
  v6 = v5;
LABEL_5:

  return v6;
}

+ (id)__jsonStringFromDictionary:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (a4)
    v5 = 2;
  else
    v5 = 3;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, v5, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  else
    v7 = 0;

  return v7;
}

+ (id)__jsonFromDeclarations:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromDeclarations_rawOutput_error___block_invoke;
  v14[3] = &unk_1E89B4270;
  v17 = v6;
  v15 = v10;
  v16 = a1;
  v11 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

  objc_msgSend((id)objc_opt_class(), "__jsonStringFromDictionary:rawOutput:error:", v11, v6, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)__jsonFromPairedMetadata:(id)a3 rawOutput:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v6 = a4;
  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a3;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromPairedMetadata_rawOutput_error___block_invoke;
  v14[3] = &unk_1E89B4270;
  v17 = v6;
  v15 = v10;
  v16 = a1;
  v11 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);

  objc_msgSend((id)objc_opt_class(), "__jsonStringFromDictionary:rawOutput:error:", v11, v6, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)__networkDeclarationsFromRecord:(id)a3 recordKey:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v12;
  void *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v15;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CD_networkDeclarations_ckAsset")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (!v12)
    {
      v15 = 0;
      goto LABEL_16;
    }
    v13 = (void *)MEMORY[0x1E0C99D50];
    -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations fileURL](v12, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataWithContentsOfURL:", v14);
    v15 = (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CD_networkDeclarations")))
      goto LABEL_14;
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v12 = (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v12;
    else
      v16 = 0;
    v15 = v16;
  }

  if (v15)
  {
    v12 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:]([HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc], "initWithBaseAccessoryIdentifier:data:", v9, v15);
LABEL_16:

    goto LABEL_17;
  }
LABEL_14:
  v12 = 0;
LABEL_17:

  return v12;
}

+ (id)__pairedMetadataFromRecord:(id)a3 recordKey:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDCloudPairedMetadata *v12;
  void *v13;
  void *v14;
  HMDCloudPairedMetadata *v15;
  HMDCloudPairedMetadata *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CD_pairedMetadata_ckAsset")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (!v12)
    {
      v15 = 0;
      goto LABEL_16;
    }
    v13 = (void *)MEMORY[0x1E0C99D50];
    -[HMDCloudPairedMetadata fileURL](v12, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataWithContentsOfURL:", v14);
    v15 = (HMDCloudPairedMetadata *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("CD_pairedMetadata")))
      goto LABEL_14;
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v12 = (HMDCloudPairedMetadata *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v12;
    else
      v16 = 0;
    v15 = v16;
  }

  if (v15)
  {
    v12 = -[HMDCloudPairedMetadata initWithBaseAccessoryIdentifier:data:]([HMDCloudPairedMetadata alloc], "initWithBaseAccessoryIdentifier:data:", v9, v15);
LABEL_16:

    goto LABEL_17;
  }
LABEL_14:
  v12 = 0;
LABEL_17:

  return v12;
}

+ (id)__jsonFromRecords:(id)a3 validateWithPublicKeys:(id)a4 rawOutput:(BOOL)a5 error:(id *)a6
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  id v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  BOOL v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  __CFString *v49;
  __CFString *v50;
  id obj;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  id v63;
  _BOOL4 v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v64 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v10 = v7;
  v11 = (void *)v9;
  obj = v10;
  v55 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
  if (v55)
  {
    v53 = v8;
    v54 = *(_QWORD *)v72;
    v52 = (void *)v9;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v72 != v54)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        objc_msgSend(v13, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "zoneID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "zoneName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "recordName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v14;
        +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (!v64)
        {
          objc_msgSend(v18, "productGroup");
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "productNumber");
          v21 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v21;
          v16 = (void *)v20;
        }
        v62 = v19;
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v16);
        }
        v59 = v16;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v17;
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v17);
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v13, "allKeys");
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        if (!v24)
        {
          v37 = v59;
          v42 = v60;
          goto LABEL_51;
        }
        v25 = v24;
        v56 = v22;
        v57 = i;
        v61 = 0;
        v26 = 0;
        v27 = *(_QWORD *)v68;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v68 != v27)
              objc_enumerationMutation(v63);
            v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v28);
            if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CD_networkDeclarations_ckAsset")) & 1) != 0
              || objc_msgSend(v29, "isEqualToString:", CFSTR("CD_networkDeclarations")))
            {
              if (!v64)
              {
                objc_msgSend((id)objc_opt_class(), "__networkDeclarationsFromRecord:recordKey:identifier:", v13, v29, v62);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                {
                  v31 = v30;
                  objc_msgSend(v30, "prettyJSONDictionary");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = 1;
                  goto LABEL_22;
                }
              }
              v26 = 1;
              goto LABEL_21;
            }
            if ((objc_msgSend(v29, "isEqualToString:", CFSTR("CD_pairedMetadata_ckAsset")) & 1) != 0)
            {
              if (v64)
                goto LABEL_31;
            }
            else
            {
              v34 = objc_msgSend(v29, "isEqualToString:", CFSTR("CD_pairedMetadata"));
              if (!v34 || v64)
              {
                v61 |= v34;
                goto LABEL_21;
              }
            }
            objc_msgSend((id)objc_opt_class(), "__pairedMetadataFromRecord:recordKey:identifier:", v13, v29, v62);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v35)
            {
LABEL_31:
              v61 = 1;
LABEL_21:
              v33 = (void *)objc_opt_class();
              objc_msgSend(v13, "objectForKeyedSubscript:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "__jsonValueForCKRecordValue:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_22;
            }
            v31 = v35;
            objc_msgSend(v35, "prettyJSONDictionary");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = 1;
LABEL_22:
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, v29);

            ++v28;
          }
          while (v25 != v28);
          v36 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
          v25 = v36;
        }
        while (v36);

        v8 = v53;
        if (v53)
        {
          i = v57;
          v37 = v59;
          if (((v26 ^ 1) & 1) != 0)
          {
            v11 = v52;
          }
          else
          {
            v66 = 0;
            v38 = +[HMDNetworkRouterFirewallRuleCloudZone verifyNetworkDeclarationsFromRecord:signatureVerificationPublicKeys:error:](HMDNetworkRouterFirewallRuleCloudZone, "verifyNetworkDeclarationsFromRecord:signatureVerificationPublicKeys:error:", v13, v53, &v66);
            v39 = v66;
            v40 = CFSTR("VALID");
            v11 = v52;
            if (!v38)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INVALID: %@"), v39);
              v40 = (const __CFString *)objc_claimAutoreleasedReturnValue();
              v50 = (__CFString *)v40;
            }
            objc_msgSend(CFSTR("CD_networkDeclarationsSignature"), "stringByAppendingString:", CFSTR("[VALIDATION_RESULT]"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v40, v41);

            if (!v38)
            i = v57;
          }
        }
        else
        {
          v11 = v52;
          i = v57;
          v37 = v59;
        }
        v22 = v56;
        if (!v53 || ((v61 ^ 1) & 1) != 0)
        {
          v42 = v60;
        }
        else
        {
          v65 = 0;
          v43 = +[HMDNetworkRouterFirewallRuleCloudZone verifyPairedMetadataFromRecord:signatureVerificationPublicKeys:error:](HMDNetworkRouterFirewallRuleCloudZone, "verifyPairedMetadataFromRecord:signatureVerificationPublicKeys:error:", v13, v53, &v65);
          v63 = v65;
          v44 = CFSTR("VALID");
          if (!v43)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INVALID: %@"), v63);
            v44 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            v49 = (__CFString *)v44;
          }
          objc_msgSend(CFSTR("CD_pairedMetadataSignature"), "stringByAppendingString:", CFSTR("[VALIDATION_RESULT]"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v44, v45);

          if (!v43)
          v42 = v60;
LABEL_51:

        }
      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    }
    while (v55);
  }

  objc_msgSend((id)objc_opt_class(), "__jsonStringFromDictionary:rawOutput:error:", v11, v64, a6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

+ (id)__createProcessingOptionsWithLabel:(id)a3 qualityOfService:(int64_t)a4
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldEnqueueMirrorOutput:", 0);
  objc_msgSend(v5, "setQualityOfService:", a4);
  return v5;
}

+ (id)__createProcessingOptionsWithLabel:(id)a3
{
  return (id)objc_msgSend(a1, "__createProcessingOptionsWithLabel:qualityOfService:", a3, 17);
}

+ (id)__networkDeclarationDataDictionaryFromOverrideObjectDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __125__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromOverrideObjectDictionary___block_invoke;
  v9[3] = &unk_1E89B4388;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = 0;

  return v7;
}

+ (id)__pairedMetadataDictionaryFromOverrideObjectDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDictionaryFromOverrideObjectDictionary___block_invoke;
  v9[3] = &unk_1E89B4388;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = 0;

  return v7;
}

+ (id)__networkDeclarationDataDictionaryFromRecordDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromRecordDictionary___block_invoke;
  v9[3] = &unk_1E89B4388;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (id)__pairedMetadataDataDictionaryFromRecordDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDataDictionaryFromRecordDictionary___block_invoke;
  v9[3] = &unk_1E89B4388;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __113__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDataDictionaryFromRecordDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromRecordDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __117__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___pairedMetadataDictionaryFromOverrideObjectDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pairedMetadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __125__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___networkDeclarationDataDictionaryFromOverrideObjectDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("networkDeclarations"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __103__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromPairedMetadata_rawOutput_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDCloudPairedMetadata *v15;
  HMDCloudPairedMetadata *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "productGroup");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "productNumber");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
    v9 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v9);
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v15 = -[HMDCloudPairedMetadata initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDCloudPairedMetadata alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v7, v6, 1);
    if (v15)
    {
      v16 = v15;
      -[HMDCloudPairedMetadata prettyJSONDictionary](v15, "prettyJSONDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v10);

      goto LABEL_9;
    }
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v21;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse declaration for %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v10);

LABEL_9:
}

void __101__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator___jsonFromDeclarations_rawOutput_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v15;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[HMDNetworkRouterFirewallRuleAccessoryIdentifier identifierFromRecordID:](HMDNetworkRouterFirewallRuleAccessoryIdentifier, "identifierFromRecordID:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "productGroup");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "productNumber");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
    v9 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v9);
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v15 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:allowUnzippedData:]([HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc], "initWithBaseAccessoryIdentifier:data:allowUnzippedData:", v7, v6, 1);
    if (v15)
    {
      v16 = v15;
      -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations prettyJSONDictionary](v15, "prettyJSONDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v10);

      goto LABEL_9;
    }
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v21;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse declaration for %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v10);

LABEL_9:
}

void __73__HMDNetworkRouterFirewallRuleManagerBackingStoreCoordinator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_116171;
  logCategory__hmf_once_v1_116171 = v0;

}

@end
