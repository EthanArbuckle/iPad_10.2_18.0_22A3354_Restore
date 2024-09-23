@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler)initWithIdentifier:(id)a3 interval:(double)a4 retryInterval:(double)a5 delegate:(id)a6
{
  id v11;
  id v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v13;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v14;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v15;
  objc_super v17;

  v11 = a3;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler;
  v13 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_interval = a4;
    v14->_retryInterval = a5;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_running = 0;
    v15 = v14;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v4;
  NSObject *v5;
  void *v6;
  NSString *identifier;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_running)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = v4->_identifier;
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      v11 = 2112;
      v12 = identifier;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Scheduler dying while activity '%@' was still active", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend((id)objc_opt_class(), "__unregisterActivity:", v4->_identifier);
  }
  v8.receiver = self;
  v8.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler interval](self, "interval");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler retryInterval](self, "retryInterval");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Identifier = %@, Interval=%@, retryInterval=%@>"), v4, v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)__initialCriteria
{
  xpc_object_t v3;
  const char *v4;
  double v5;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (const char *)*MEMORY[0x24BDAC5F0];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler interval](self, "interval");
  xpc_dictionary_set_int64(v3, v4, llround(v5));
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC6E0], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC658], (const char *)*MEMORY[0x24BDAC660]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x24BDAC5D0], *MEMORY[0x24BDAC610]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x24BDAC688], 1);
  return v3;
}

- (void)__registerActivity
{
  void *v3;
  void *v4;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v5;
  NSObject *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering activity '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_initWeak((id *)buf, v5);
  v8 = objc_retainAutorelease(v3);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___registerActivity__block_invoke;
  v12[3] = &unk_24E78A570;
  objc_copyWeak(&v14, (id *)buf);
  v10 = (void *)*MEMORY[0x24BDAC5A0];
  v11 = v8;
  v13 = v11;
  xpc_activity_register(v9, v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)__checkInActivity:(id)a3
{
  _xpc_activity_s *v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD applier[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (_xpc_activity_s *)a3;
  v5 = xpc_activity_copy_criteria(v4);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v10;
      v29 = 2112;
      v30 = v11;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' resurrected with criteria: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler __initialCriteria](self, "__initialCriteria");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler overrideCriteria](self, "overrideCriteria");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](v14, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler overrideCriteria](v14, "overrideCriteria");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' applying override criteria: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler overrideCriteria](v14, "overrideCriteria");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___checkInActivity___block_invoke;
      applier[3] = &unk_24E78A598;
      v26 = v6;
      xpc_dictionary_apply(v19, applier);

    }
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](v21, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' created for the first time with criteria: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    xpc_activity_set_criteria(v4, v6);
  }
  self->_currentInterval = (double)xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x24BDAC5F0]);

}

- (void)__runActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (xpc_activity_should_defer((xpc_activity_t)v4))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' was ready to run but it should be deferred", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler __transitionActivity:state:](v7, "__transitionActivity:state:", v4, 3);
  }
  else
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)MEMORY[0x227676638](-[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler __transitionActivity:state:](self, "__transitionActivity:state:", v4, 4));
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Activity '%@' running", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler setRunningActivity:](v12, "setRunningActivity:", v4);
      objc_initWeak((id *)buf, v12);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __84__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___runActivity___block_invoke;
      v19[3] = &unk_24E796418;
      objc_copyWeak(&v22, (id *)buf);
      v20 = v5;
      v21 = v4;
      objc_msgSend(v10, "cloudFetchSchedulerFired:completion:", v12, v19);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' was ready to run but delegate has died", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler __transitionActivity:state:](v16, "__transitionActivity:state:", v4, 5);
    }

  }
}

- (void)__unregisterActivity
{
  void *v3;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unregistering activity '%@'", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend((id)objc_opt_class(), "__unregisterActivity:", v4->_identifier);
}

- (void)__transitionActivity:(id)a3 state:(int64_t)a4
{
  _xpc_activity_s *v6;
  _BOOL4 v7;
  void *v8;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (_xpc_activity_s *)a3;
  v7 = xpc_activity_set_state(v6, a4);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](v9, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2048;
      v22 = a4;
      v14 = "%{public}@Activity '%@' transitioned to state %ld";
      v15 = v11;
      v16 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v15, v16, v14, (uint8_t *)&v17, 0x20u);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler identifier](v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2048;
    v22 = a4;
    v14 = "%{public}@Activity '%@' failed to transition to state %ld";
    v15 = v11;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v8);
}

- (void)start
{
  id v3;

  if (!-[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler setRunning:](self, "setRunning:", 1);
    self->_currentInterval = 0.0;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler __registerActivity](self, "__registerActivity");
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "cloudFetchSchedulerStarted:", self);

  }
}

- (void)stop
{
  id v3;

  if (-[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler isRunning](self, "isRunning"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler setRunning:](self, "setRunning:", 0);
    self->_currentInterval = 0.0;
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler __unregisterActivity](self, "__unregisterActivity");
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "cloudFetchSchedulerStopped:", self);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)interval
{
  return self->_interval;
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchSchedulerDelegate)delegate
{
  return (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_xpc_object)runningActivity
{
  return self->_runningActivity;
}

- (void)setRunningActivity:(id)a3
{
  objc_storeStrong((id *)&self->_runningActivity, a3);
}

- (OS_xpc_object)overrideCriteria
{
  return self->_overrideCriteria;
}

- (void)setOverrideCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_overrideCriteria, a3);
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCriteria, 0);
  objc_storeStrong((id *)&self->_runningActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __84__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___runActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  double *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  xpc_object_t v10;
  const char *v11;
  int64_t int64;
  double v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x227676638]();
  if (WeakRetained)
  {
    v6 = (double *)WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v22 = 138543874;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = (uint64_t)v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' completion handler called with error: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setRunningActivity:", 0);
    v10 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 40));
    v11 = (const char *)*MEMORY[0x24BDAC5F0];
    int64 = xpc_dictionary_get_int64(v10, (const char *)*MEMORY[0x24BDAC5F0]);
    if (v3)
      objc_msgSend(v6, "retryInterval");
    else
      objc_msgSend(v6, "interval");
    v21 = (uint64_t)v13;
    if (int64 != (uint64_t)v13)
    {
      xpc_dictionary_set_int64(v10, v11, (uint64_t)v13);
      xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 40), v10);
      v6[8] = (double)v21;
    }
    objc_msgSend(v6, "__transitionActivity:state:", *(_QWORD *)(a1 + 40), 5);

  }
  else
  {
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v22 = 138543874;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = (uint64_t)v3;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' completion handler called after scheduler has died with error: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
    {
      v17 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        v22 = 138543874;
        v23 = v19;
        v24 = 2112;
        v25 = v20;
        v26 = 2048;
        v27 = 5;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' failed to transition to state %ld", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
    }
  }

}

uint64_t __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___checkInActivity___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

void __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___registerActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  xpc_activity_state_t state;
  xpc_activity_state_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  xpc_activity_state_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' handler ran after scheduler has died", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_11;
  }
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    objc_msgSend(WeakRetained, "__runActivity:", v3);
    goto LABEL_12;
  }
  v6 = state;
  if (state)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 2048;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Activity %@ callback with unhandled state: %ld", (uint8_t *)&v14, 0x20u);

    }
LABEL_11:

    objc_autoreleasePoolPop(v7);
    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "__checkInActivity:", v3);
LABEL_12:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_156863 != -1)
    dispatch_once(&logCategory__hmf_once_t0_156863, &__block_literal_global_156864);
  return (id)logCategory__hmf_once_v1_156865;
}

+ (void)__unregisterActivity:(id)a3
{
  xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

void __81__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_156865;
  logCategory__hmf_once_v1_156865 = v0;

}

@end
