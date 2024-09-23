@implementation MPCPlaybackEngineEnvironmentConsumer

+ (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.MediaPlaybackCore/environment");
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_snapshotDeviceWithEvent:nudge:", v4, 1);
  objc_msgSend(*(id *)(a1 + 32), "_snapshotNetworkReachabilityWithEvent:nudge:", v4, 2);
  objc_msgSend(*(id *)(a1 + 32), "_snapshotNetworkTypeWithEvent:nudge:", v4, 3);

  return 1;
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_updateNetworkInfo");
  v2 = *(void **)(a1 + 32);
  MPCPlaybackEngineEventGetMonotonicTime(v4);
  return objc_msgSend(v2, "_snapshotNetworkTypeAtTime:", v4);
}

- (void)_snapshotNetworkTypeWithEvent:(id)a3 nudge:(int)a4
{
  uint64_t v6;
  int64x2_t v7;
  uint64_t v8;
  double v9;
  _OWORD v10[2];
  double v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  double v15;

  if (a3)
  {
    objc_msgSend(a3, "monotonicTime");
    v6 = *(_QWORD *)&v10[0];
    v7 = *(int64x2_t *)((char *)v10 + 8);
    v8 = *((_QWORD *)&v10[1] + 1);
    v9 = v11;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v11 = 0.0;
    v7 = 0uLL;
    memset(v10, 0, sizeof(v10));
    v9 = 0.0;
  }
  v12 = v6;
  v13 = vaddq_s64(v7, vdupq_n_s64(a4));
  v14 = v8;
  v15 = (double)a4 / 1000000000.0 + v9;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotNetworkTypeAtTime:](self, "_snapshotNetworkTypeAtTime:", &v12, v10[0], v10[1], *(_QWORD *)&v11);
}

- (void)_snapshotNetworkTypeAtTime:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v6;
  NSDictionary *v7;
  int64_t networkType;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  _OWORD v26[2];
  double var4;
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_signalStrength;
  v7 = self->_signalInfo;
  networkType = self->_networkType;
  v9 = self->_isNetworkConstrained;
  v10 = self->_isCurrentNetworkLinkExpensive;
  v11 = self->_isCurrentNetworkLinkHighQuality;
  os_unfair_lock_unlock(p_lock);
  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "eventStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("network-signal-info");
  v12 = (uint64_t)v7;
  v25 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v12;
  v29[0] = v12;
  v28[1] = CFSTR("network-signal-strength");
  v13 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v13;
  v29[1] = v13;
  v28[2] = CFSTR("network-type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", networkType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v14;
  v28[3] = CFSTR("network-constrained");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[3] = v15;
  v28[4] = CFSTR("network-expensive");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v6;
  v29[4] = v16;
  v28[5] = CFSTR("network-high-quality");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[5] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)&a3->var2;
  v26[0] = *(_OWORD *)&a3->var0;
  v26[1] = v20;
  var4 = a3->var4;
  objc_msgSend(v23, "emitEventType:payload:atTime:", CFSTR("network-type-changed"), v19, v26);

  if (!v11)
  if (v10)
  {
    if (v9)
      goto LABEL_15;
  }
  else
  {

    if (v9)
      goto LABEL_15;
  }

LABEL_15:
  if (!v17)
  {

    if (v25)
      goto LABEL_17;
LABEL_21:

    goto LABEL_17;
  }
  if (!v25)
    goto LABEL_21;
LABEL_17:

}

- (void)_snapshotNetworkReachabilityWithEvent:(id)a3 nudge:(int)a4
{
  uint64_t v6;
  int64x2_t v7;
  uint64_t v8;
  double v9;
  _OWORD v10[2];
  double v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  double v15;

  if (a3)
  {
    objc_msgSend(a3, "monotonicTime");
    v6 = *(_QWORD *)&v10[0];
    v7 = *(int64x2_t *)((char *)v10 + 8);
    v8 = *((_QWORD *)&v10[1] + 1);
    v9 = v11;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v11 = 0.0;
    v7 = 0uLL;
    memset(v10, 0, sizeof(v10));
    v9 = 0.0;
  }
  v12 = v6;
  v13 = vaddq_s64(v7, vdupq_n_s64(a4));
  v14 = v8;
  v15 = (double)a4 / 1000000000.0 + v9;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotNetworkReachabilityAtTime:force:](self, "_snapshotNetworkReachabilityAtTime:force:", &v12, 1, v10[0], v10[1], *(_QWORD *)&v11);
}

- (void)_snapshotDeviceWithEvent:(id)a3 nudge:(int)a4
{
  uint64_t v6;
  int64x2_t v7;
  uint64_t v8;
  double v9;
  _OWORD v10[2];
  double v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  double v15;

  if (a3)
  {
    objc_msgSend(a3, "monotonicTime");
    v6 = *(_QWORD *)&v10[0];
    v7 = *(int64x2_t *)((char *)v10 + 8);
    v8 = *((_QWORD *)&v10[1] + 1);
    v9 = v11;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    v11 = 0.0;
    v7 = 0uLL;
    memset(v10, 0, sizeof(v10));
    v9 = 0.0;
  }
  v12 = v6;
  v13 = vaddq_s64(v7, vdupq_n_s64(a4));
  v14 = v8;
  v15 = (double)a4 / 1000000000.0 + v9;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotDeviceAtTime:](self, "_snapshotDeviceAtTime:", &v12, v10[0], v10[1], *(_QWORD *)&v11);
}

- (void)_snapshotNetworkReachabilityAtTime:(id *)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int64_t v8;
  int v9;
  NSDictionary *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  _OWORD v19[2];
  double var4;
  _QWORD v21[3];
  _QWORD v22[4];

  v4 = a4;
  v22[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isRemoteServerReachable") & 1) != 0)
    v8 = 2;
  else
    v8 = objc_msgSend(v7, "isRemoteServerLikelyReachable");
  os_unfair_lock_lock(&self->_lock);
  v9 = self->_reachability != v8 || v4;
  if (v9 == 1)
    self->_reachability = v8;
  v10 = self->_signalStrength;
  v11 = self->_signalInfo;
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "eventStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("network-signal-info");
    v14 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22[0] = v14;
    v21[1] = CFSTR("network-signal-strength");
    v15 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22[1] = v15;
    v21[2] = CFSTR("network-reachability");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_OWORD *)&a3->var2;
    v19[0] = *(_OWORD *)&a3->var0;
    v19[1] = v18;
    var4 = a3->var4;
    objc_msgSend(v13, "emitEventType:payload:atTime:", CFSTR("network-reachability-changed"), v17, v19);

    if (v10)
    {
      if (v11)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

      if (v11)
        goto LABEL_16;
    }

    goto LABEL_16;
  }
LABEL_17:

}

- (void)subscribeToEventStream:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPCPlaybackEngineEventStreamSubscription *subscription;
  MPCPlaybackEngineEventStreamSubscription *v19;
  MPCPlaybackEngineEventStreamSubscription *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD block[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_subscription, a3);
  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerObserver:", self);

  dispatch_get_global_queue(17, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(v7, block);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDDC548];
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__devicePrivateListeningDidChange_, *MEMORY[0x24BDDC548], 0);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__devicePrivateListeningDidChange_, v10, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__allowsExplicitContentDidChange_, *MEMORY[0x24BDDC598], 0);

  if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__allowsExplicitContentDidChange_, *MEMORY[0x24BDDBAB0], 0);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__applicationWillTerminate_, *MEMORY[0x24BEBE018], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__applicationWillEnterForeground_, *MEMORY[0x24BEBE008], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);

  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerObserver:", self);

  subscription = self->_subscription;
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_2;
  v23[3] = &unk_24CAB94A0;
  v23[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:options:handler:](subscription, "subscribeToEventType:options:handler:", CFSTR("session-begin"), 257, v23);
  v19 = self->_subscription;
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_3;
  v22[3] = &unk_24CAB94A0;
  v22[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:options:handler:](v19, "subscribeToEventType:options:handler:", CFSTR("session-migrate-begin"), 257, v22);
  v20 = self->_subscription;
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_4;
  v21[3] = &unk_24CAB94A0;
  v21[4] = self;
  -[MPCPlaybackEngineEventStreamSubscription subscribeToEventType:options:handler:](v20, "subscribeToEventType:options:handler:", CFSTR("queue-add"), 257, v21);

}

- (void)_snapshotAccount:(id)a3 eventType:(id)a4 atTime:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  $C192BC3A89177E9F9906E5732115C753 *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  _OWORD v47[2];
  double var4;
  _QWORD v49[8];
  _QWORD v50[8];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountForHashedDSID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v41 = a5;
    v46 = v9;
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "DSIDForUserIdentity:outError:", v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC8890], "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastKnownHouseholdID");
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "allowsExplicitContent");

    v20 = (void *)v17;
    if (objc_msgSend(MEMORY[0x24BDDC748], "isCurrentDeviceValidHomeAccessory"))
    {
      v21 = (void *)MEMORY[0x24BDDC750];
      objc_msgSend(v12, "userIdentity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userMonitorWithUserIdentity:fromUserIdentityStore:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        v19 = objc_msgSend(v24, "isExplicitSettingEnabled");
      v40 = v19;

    }
    else
    {
      v40 = v19;
    }
    objc_msgSend(v10, "eventStream");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = CFSTR("account-metadata");
    v52[0] = v8;
    v51[0] = CFSTR("account-id");
    v49[0] = CFSTR("store-front-id");
    objc_msgSend(v12, "storeFrontIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (!v25)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v37 = (void *)v25;
    v50[0] = v25;
    v49[1] = CFSTR("store-account-id");
    v27 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v42 = (void *)v15;
    v36 = (void *)v27;
    v50[1] = v27;
    v49[2] = CFSTR("active");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isActiveAccount"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v39;
    v49[3] = CFSTR("delegated");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isDelegated"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v38;
    v49[4] = CFSTR("subscription-status");
    objc_msgSend(v12, "subscriptionStatus");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v43 = v10;
    v44 = v8;
    v50[4] = v29;
    v49[5] = CFSTR("household-id");
    v30 = v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v50[5] = v20;
    v49[6] = CFSTR("private-listening-enabled");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "isPrivateListeningEnabled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v31;
    v49[7] = CFSTR("explicit-allowed");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v40);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_OWORD *)&v41->var2;
    v47[0] = *(_OWORD *)&v41->var0;
    v47[1] = v35;
    var4 = v41->var4;
    objc_msgSend(v45, "emitEventType:payload:atTime:", v46, v34, v47);

    if (!v30)
    v10 = v43;
    v8 = v44;
    if (!v28)

    if (!v42)
    v9 = v46;
    if (!v26)

  }
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (MPCPlaybackEngineEnvironmentConsumer)initWithPlaybackEngine:(id)a3
{
  id v4;
  MPCPlaybackEngineEnvironmentConsumer *v5;
  MPCPlaybackEngineEnvironmentConsumer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCPlaybackEngineEnvironmentConsumer;
  v5 = -[MPCPlaybackEngineEnvironmentConsumer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)_snapshotDeviceAtTime:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int IsInternalCarry;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  void *v61;
  void *v62;
  _OWORD v63[2];
  double var4;
  _QWORD v65[16];
  _QWORD v66[16];
  const __CFString *v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x24BDAC8D0];
  v4 = MGCopyAnswer();
  objc_msgSend(MEMORY[0x24BEC87B8], "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC8770], "defaultInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "isDevicePrivateListeningEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isFocusModePrivateListeningEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x24BEC89F8]);
  objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithIdentity:", v12);
  objc_msgSend(v13, "userAgent");
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "infoDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
  v17 = objc_claimAutoreleasedReturnValue();

  MSVProcessCopyUUID();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  MSVProcessCopyMediaFrameworksDescriptions();
  v19 = objc_claimAutoreleasedReturnValue();
  IsInternalCarry = MSVDeviceIsInternalCarry();
  if (v10)
  {
    if (objc_msgSend(v10, "BOOLValue"))
      v20 = 1;
    else
      v20 = 2;
  }
  else
  {
    v20 = 0;
  }
  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "eventStream");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = CFSTR("device-metadata");
  v65[0] = CFSTR("device-name");
  objc_msgSend(v5, "deviceName");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v53;
  v65[1] = CFSTR("device-model");
  objc_msgSend(v5, "deviceModel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v52;
  v65[2] = CFSTR("device-software-variant");
  v21 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v21;
  v66[2] = v21;
  v65[3] = CFSTR("application-name");
  objc_msgSend(v6, "processName");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v22;
  v66[3] = v22;
  v65[4] = CFSTR("application-bundle-id");
  objc_msgSend(v6, "bundleIdentifier");
  v24 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v51 = v23;
  v41 = (void *)v24;
  v66[4] = v24;
  v65[5] = CFSTR("application-version");
  objc_msgSend(v6, "clientVersion");
  v25 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v25;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v25;
  v66[5] = v25;
  v65[6] = CFSTR("system-name");
  objc_msgSend(v5, "productPlatform");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v47;
  v65[7] = CFSTR("system-version");
  objc_msgSend(v5, "productVersion");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v26;
  v66[7] = v26;
  v65[8] = CFSTR("system-build");
  objc_msgSend(v5, "buildVersion");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v46;
  v65[9] = CFSTR("private-listening-enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v60);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v45;
  v65[10] = CFSTR("focus-mode-private-listening-enabled");
  if (v10)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v61 = (void *)v4;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v66[10] = v44;
  v65[11] = CFSTR("user-agent");
  v28 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v28;
  v66[11] = v28;
  v65[12] = CFSTR("media-frameworks");
  v29 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v19;
  v57 = (void *)v17;
  v59 = v10;
  v66[12] = v29;
  v65[13] = CFSTR("application-source-version");
  v30 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v14;
  v32 = v6;
  v66[13] = v30;
  v65[14] = CFSTR("application-uuid");
  v33 = v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v66[14] = v33;
  v65[15] = CFSTR("internal-carry");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IsInternalCarry);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v66[15] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 16);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *(_OWORD *)&a3->var2;
  v63[0] = *(_OWORD *)&a3->var0;
  v63[1] = v37;
  var4 = a3->var4;
  objc_msgSend(v62, "emitEventType:payload:atTime:", CFSTR("device-changed"), v36, v63);

  if (!v58)
  if (!v57)

  if (v56)
  {
    if (v31)
      goto LABEL_33;
  }
  else
  {

    if (v31)
      goto LABEL_33;
  }

LABEL_33:
  if (!v27)

  if (!v49)
  if (!v50)

  if (!v51)
  if (!v61)

}

- (void)accountManager:(id)a3 didChangeAccounts:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventDeliveryDeferralAssertionOfType:forReason:", 0, CFSTR("Updating Accounts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "hashedDSID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        MPCPlaybackEngineEventGetMonotonicTime(v15);
        -[MPCPlaybackEngineEnvironmentConsumer _snapshotAccount:eventType:atTime:](self, "_snapshotAccount:eventType:atTime:", v14, CFSTR("account-update"), v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "invalidate");
}

- (void)_addEventForAccountIdentifier:(id)a3 cursor:(id)a4 event:(id)a5 nudge:(int)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v21[0] = CFSTR("session-begin");
  v21[1] = CFSTR("session-migrate-begin");
  v21[2] = CFSTR("session-restore-begin");
  v12 = (void *)MEMORY[0x24BDBCE30];
  v13 = a4;
  objc_msgSend(v12, "arrayWithObjects:count:", v21, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "findPreviousEventWithTypes:matchingPayload:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "cursorUntilEvent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = CFSTR("account-id");
  v20 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "findPreviousEventWithType:matchingPayload:", CFSTR("account-begin"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    -[MPCPlaybackEngineEnvironmentConsumer _snapshotAccount:eventType:event:nudge:](self, "_snapshotAccount:eventType:event:nudge:", v10, CFSTR("account-begin"), v11, -a6);

}

- (void)_snapshotAccount:(id)a3 eventType:(id)a4 event:(id)a5 nudge:(int)a6
{
  id v10;
  id v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  double v15;
  _OWORD v16[2];
  double v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t v20;
  double v21;

  v10 = a3;
  v11 = a4;
  if (a5)
  {
    objc_msgSend(a5, "monotonicTime");
    v12 = *(_QWORD *)&v16[0];
    v13 = *(int64x2_t *)((char *)v16 + 8);
    v14 = *((_QWORD *)&v16[1] + 1);
    v15 = v17;
  }
  else
  {
    v14 = 0;
    v12 = 0;
    v17 = 0.0;
    v13 = 0uLL;
    memset(v16, 0, sizeof(v16));
    v15 = 0.0;
  }
  v18 = v12;
  v19 = vaddq_s64(v13, vdupq_n_s64(a6));
  v20 = v14;
  v21 = (double)a6 / 1000000000.0 + v15;
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotAccount:eventType:atTime:](self, "_snapshotAccount:eventType:atTime:", v10, v11, &v18, v16[0], v16[1], *(_QWORD *)&v17);

}

- (void)_applicationWillEnterForeground:(id)a3
{
  void *v3;
  id v4;

  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emitEventType:payload:", CFSTR("application-foreground"), 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPCPlaybackEngineEnvironmentConsumer;
  -[MPCPlaybackEngineEnvironmentConsumer dealloc](&v4, sel_dealloc);
}

- (void)unsubscribeFromEventStream:(id)a3
{
  void *v4;
  void *v5;
  MPCPlaybackEngineEventStreamSubscription *subscription;

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterObserver:", self);

  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", self);

  subscription = self->_subscription;
  self->_subscription = 0;

}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventDeliveryDeferralAssertionOfType:forReason:", 0, CFSTR("Updating NetworkReachability"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineEnvironmentConsumer _updateNetworkInfo](self, "_updateNetworkInfo");
  MPCPlaybackEngineEventGetMonotonicTime(v7);
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotNetworkReachabilityAtTime:force:](self, "_snapshotNetworkReachabilityAtTime:force:", v7, 0);
  objc_msgSend(v6, "invalidate");

}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventDeliveryDeferralAssertionOfType:forReason:", 0, CFSTR("Updating NetworkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackEngineEnvironmentConsumer _updateNetworkInfo](self, "_updateNetworkInfo");
  MPCPlaybackEngineEventGetMonotonicTime(v7);
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotNetworkTypeAtTime:](self, "_snapshotNetworkTypeAtTime:", v7);
  objc_msgSend(v6, "invalidate");

}

- (void)_applicationDidEnterBackground:(id)a3
{
  void *v3;
  id v4;

  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emitEventType:payload:", CFSTR("application-background"), 0);

}

- (void)_applicationWillTerminate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emitEventType:payload:", CFSTR("application-termination"), 0);

  objc_msgSend(v5, "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushEvents");

}

- (void)_devicePrivateListeningDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[MPCPlaybackEngineEnvironmentConsumer playbackEngine](self, "playbackEngine", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventDeliveryDeferralAssertionOfType:forReason:", 0, CFSTR("Updating Device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MPCPlaybackEngineEventGetMonotonicTime(v7);
  -[MPCPlaybackEngineEnvironmentConsumer _snapshotDeviceAtTime:](self, "_snapshotDeviceAtTime:", v7);
  objc_msgSend(v6, "invalidate");

}

- (void)_allowsExplicitContentDidChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isDelegated") & 1) == 0)
        {
          objc_msgSend(v10, "hashedDSID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          MPCPlaybackEngineEventGetMonotonicTime(v12);
          -[MPCPlaybackEngineEnvironmentConsumer _snapshotAccount:eventType:atTime:](self, "_snapshotAccount:eventType:atTime:", v11, CFSTR("account-update"), v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_updateNetworkInfo
{
  NSDictionary *v3;
  NSDictionary *v4;
  int64_t v5;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSDictionary *signalInfo;
  NSDictionary *v10;
  NSDictionary *signalStrength;
  NSDictionary *v12;
  NSNumber *isNetworkConstrained;
  NSNumber *v14;
  NSNumber *isCurrentNetworkLinkExpensive;
  NSNumber *v16;
  NSNumber *isCurrentNetworkLinkHighQuality;
  id v18;

  objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "signalStrength");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "signalInfo");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "networkType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v18, "isNetworkConstrained"));
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v18, "isCurrentNetworkLinkExpensive"));
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v18, "isCurrentNetworkLinkHighQuality"));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  signalInfo = self->_signalInfo;
  self->_signalInfo = v4;
  v10 = v4;

  signalStrength = self->_signalStrength;
  self->_signalStrength = v3;
  v12 = v3;

  isNetworkConstrained = self->_isNetworkConstrained;
  self->_networkType = v5;
  self->_isNetworkConstrained = v6;
  v14 = v6;

  isCurrentNetworkLinkExpensive = self->_isCurrentNetworkLinkExpensive;
  self->_isCurrentNetworkLinkExpensive = v7;
  v16 = v7;

  isCurrentNetworkLinkHighQuality = self->_isCurrentNetworkLinkHighQuality;
  self->_isCurrentNetworkLinkHighQuality = v8;

  os_unfair_lock_unlock(&self->_lock);
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (NSDictionary)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)signalInfo
{
  return self->_signalInfo;
}

- (void)setSignalInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int64_t)a3
{
  self->_networkType = a3;
}

- (NSNumber)isNetworkConstrained
{
  return self->_isNetworkConstrained;
}

- (void)setIsNetworkConstrained:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)isCurrentNetworkLinkExpensive
{
  return self->_isCurrentNetworkLinkExpensive;
}

- (void)setIsCurrentNetworkLinkExpensive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)isCurrentNetworkLinkHighQuality
{
  return self->_isCurrentNetworkLinkHighQuality;
}

- (void)setIsCurrentNetworkLinkHighQuality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isCurrentNetworkLinkHighQuality, 0);
  objc_storeStrong((id *)&self->_isCurrentNetworkLinkExpensive, 0);
  objc_storeStrong((id *)&self->_isNetworkConstrained, 0);
  objc_storeStrong((id *)&self->_signalInfo, 0);
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_snapshotDeviceWithEvent:nudge:", v4, 1);
  objc_msgSend(*(id *)(a1 + 32), "_snapshotNetworkReachabilityWithEvent:nudge:", v4, 2);
  objc_msgSend(*(id *)(a1 + 32), "_snapshotNetworkTypeWithEvent:nudge:", v4, 3);

  return 1;
}

uint64_t __63__MPCPlaybackEngineEnvironmentConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("account-id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("queue-delegated-account-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "_addEventForAccountIdentifier:cursor:event:nudge:", v10, v6, v5, 1);
    objc_msgSend(*(id *)(a1 + 32), "_addEventForAccountIdentifier:cursor:event:nudge:", v8, v6, v5, 2);

  }
  return 1;
}

@end
