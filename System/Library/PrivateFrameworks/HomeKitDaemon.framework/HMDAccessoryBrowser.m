@implementation HMDAccessoryBrowser

- (id)browsingConnections
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_browsingConnections, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)__inactivate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HMDAccessoryBrowser___inactivate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)__identifiersOfPairedAccessoriesWithTransports:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v11, "transports", (_QWORD)v15) & a3) != 0)
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (NSHashTable)discoveringAccessoryServerBrowsers
{
  return self->_discoveringAccessoryServerBrowsers;
}

- (HAPAccessoryServerBrowserBTLE)btleAccessoryServerBrowser
{
  return self->_btleAccessoryServerBrowser;
}

void __33__HMDAccessoryBrowser___activate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Activating", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 1);
  v6 = isWatch();
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "_startOrStopAccessoryDiscovery");
  }
  else
  {
    if ((objc_msgSend(v7, "areThereAnyPairedBTLEAccessories") & 1) != 0)
      v8 = 1;
    else
      v8 = objc_msgSend(*(id *)(a1 + 32), "areThereAnyPairedUnknownLinkTypeAccessories");
    if (objc_msgSend(*(id *)(a1 + 32), "areThereAnyAssociatedAirPlayAccessories"))
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaBrowser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startDiscoveringAssociatedAccessoriesViaBonjour");

    }
    if (v8)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@HomeKit App came into foreground - enabling BTLE scanning since there is atleast one paired (potential) BTLE accessory", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(*(id *)(a1 + 32), "btleAccessoryReachabilityProbeTimer:", 1);
    }
    if (isiOSDevice() || isMac())
    {
      objc_msgSend(*(id *)(a1 + 32), "hap2AccessoryServerBrowser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startConfirmingPairedAccessoryReachability");

    }
  }
}

void __52__HMDAccessoryBrowser_handleConnectionDeactivation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v6 = v3;

  if (v6)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2503);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_removeBrowsingConnection:error:", v6, v5);

  }
}

- (void)_stopDiscoveryForAccessoryServerBrowser:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "stopDiscoveringAccessoryServers");
  -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isEqual:", v4);

  if (v5)
  {
    -[HMDAccessoryBrowser chipAccessoryServerBrowser](self, "chipAccessoryServerBrowser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopBluetoothScan");

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryBrowser discoveringAccessoryServerBrowsers](self, "discoveringAccessoryServerBrowsers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

  os_unfair_lock_unlock(p_lock);
}

- (void)handleXPCConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryBrowser *v9;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDAccessoryBrowser_handleXPCConnectionInvalidated___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_removeBrowsingConnection:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6)
  {
    -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    observerMatchingConnection(v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v14;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@De-registering connection for accessory browsing: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDAccessoryBrowser __removeBrowsingObserver:error:](v12, "__removeBrowsingObserver:error:", v10, v7);
    }

  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)__handleProcessStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  HMDAccessoryBrowser *v12;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDD6360]);
  if ((_DWORD)v7)
  {
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__HMDAccessoryBrowser___handleProcessStateChange___block_invoke;
    v10[3] = &unk_24E79C268;
    v11 = v4;
    v12 = self;
    dispatch_async(v9, v10);

  }
}

- (void)accessoryServerBrowser:(id)a3 didStopDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDAccessoryBrowser discoveredAccessoryServerIdentifiers](self, "discoveredAccessoryServerIdentifiers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          -[HMDAccessoryBrowser _removeDiscoveredAccessoryServerIdentifier:](self, "_removeDiscoveredAccessoryServerIdentifier:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v11);
  }

  if (v7)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v19;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop discovering accessories for server browser %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (id)beginActiveAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  __HMDPairedAccessoryBrowseAssertion *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Taking active assertion with reason: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[__HMDPairedAccessoryBrowseAssertion initWithAccessoryBrowser:reason:]([__HMDPairedAccessoryBrowseAssertion alloc], "initWithAccessoryBrowser:reason:", v6, v4);
  os_unfair_lock_lock_with_options();
  -[NSHashTable addObject:](v6->_activeAssertions, "addObject:", v9);
  os_unfair_lock_unlock(&v6->_lock);

  return v9;
}

void __35__HMDAccessoryBrowser___inactivate__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "isValid", (_QWORD)v24) & 1) != 0)
        {

          os_unfair_lock_unlock(v2);
          v11 = (void *)MEMORY[0x227676638]();
          v12 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v29 = v14;
            _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Not inactivating, there is an active assertion", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v11);
          return;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v4)
        continue;
      break;
    }
  }

  os_unfair_lock_unlock(v2);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Inactivating", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  if (isWatch())
  {
    objc_msgSend(*(id *)(a1 + 32), "_startOrStopAccessoryDiscovery");
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@No HomeKit App in foreground - disabling BTLE scanning", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v19 = *(void **)(a1 + 32);
    objc_msgSend(v19, "btleAccessoryServerBrowser");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_stopDiscoveryForAccessoryServerBrowser:", v20);

    objc_msgSend(*(id *)(a1 + 32), "ipAccessoryServerBrowser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stopDiscoveringWACAccessoryServersWithInvalidation:", 1);

    if (isiOSDevice() || isMac())
    {
      objc_msgSend(*(id *)(a1 + 32), "hap2AccessoryServerBrowser", (_QWORD)v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stopConfirmingPairedAccessoryReachability");

    }
    objc_msgSend(*(id *)(a1 + 32), "mediaBrowser", (_QWORD)v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stopDiscoveringAssociatedAccessoriesViaBonjour");

  }
}

void __54__HMDAccessoryBrowser_handleXPCConnectionInvalidated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2503);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_removeBrowsingConnection:error:", v4, v6);

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received connection invalidated notification, but no connection object was found: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)handleConnectionDeactivation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryBrowser *v9;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__HMDAccessoryBrowser_handleConnectionDeactivation___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (HMDAccessoryBrowser)initWithMessageDispatcher:(id)a3
{
  id v4;
  HMDAccessoryBrowserInjectedSettingsDevice *v5;
  HMDAccessoryBrowser *v6;

  v4 = a3;
  v5 = objc_alloc_init(HMDAccessoryBrowserInjectedSettingsDevice);
  v6 = -[HMDAccessoryBrowser initWithMessageDispatcher:injectedSettings:](self, "initWithMessageDispatcher:injectedSettings:", v4, v5);

  return v6;
}

- (HMDAccessoryBrowser)initWithMessageDispatcher:(id)a3 injectedSettings:(id)a4
{
  id v7;
  id v8;
  HMDAccessoryBrowser *v9;
  uint64_t v10;
  NSUUID *uuid;
  uint64_t v12;
  OS_dispatch_queue *workQueue;
  uint64_t v14;
  NSMutableArray *accessoryServerBrowsers;
  uint64_t v16;
  HAPAccessoryServerBrowserIP *ipAccessoryServerBrowser;
  uint64_t v18;
  HAPAccessoryServerBrowserBTLE *btleAccessoryServerBrowser;
  uint64_t v20;
  HMMTRAccessoryServerBrowser *chipAccessoryServerBrowser;
  HMDHAP2Storage *v22;
  HMDHAP2Storage *hap2Storage;
  void *v24;
  uint64_t v25;
  HAPAccessoryServerBrowser *hap2AccessoryServerBrowser;
  HAPAccessoryServerBrowser *v27;
  uint64_t v28;
  NSMutableArray *pairedAccessories;
  uint64_t v30;
  NSMutableSet *unpairedHAPAccessories;
  uint64_t v32;
  NSMutableSet *unassociatedMediaAccessories;
  uint64_t v34;
  NSMutableSet *deviceSetupMediaAccessories;
  uint64_t v36;
  NSMutableSet *unassociatedWACAccessories;
  HMDWACBrowser *v38;
  HMDWACScanner *v39;
  uint64_t v40;
  HMDWACBrowser *wacBrowser;
  uint64_t v42;
  NSMutableSet *browsingConnections;
  uint64_t v44;
  NSHashTable *activeAssertions;
  uint64_t v46;
  NSMutableSet *discoveredAccessoryServerIdentifiers;
  uint64_t v48;
  NSHashTable *tombstonedHAPAccessoryServers;
  uint64_t v50;
  NSMutableArray *currentlyPairingAccessories;
  uint64_t v52;
  NSMutableArray *currentlyPairingProgressHandlers;
  uint64_t v54;
  NSHashTable *discoveringBLEAccessoryServerIdentifiers;
  uint64_t v56;
  NSHashTable *discoveringAccessoryServerBrowsers;
  uint64_t v58;
  HMDAuthServer *authServer;
  uint64_t v60;
  HMFTimer *stopReprovisioningTimer;
  void *v62;
  uint64_t v63;
  HMFTimer *stopBrowsingAccessoriesNeedingReprovisioningTimer;
  void *v65;
  void *v66;
  HMDAccessoryBrowser *v67;
  NSObject *v68;
  void *v69;
  NSArray *browseableLinkTypes;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  const __CFString *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)HMDAccessoryBrowser;
  v9 = -[HMDAccessoryBrowser init](&v72, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BF2B0921-858B-42F5-B2EB-C915FB953E5B"));
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    objc_msgSend(v8, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_messageDispatcher, a3);
    v9->_generationCounter = 0;
    v9->_btlePowerState = 0;
    v9->_exposeAccessoryTypesFeatureEnabled = objc_msgSend(v8, "exposeAccessoryTypesFeatureEnabled");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    accessoryServerBrowsers = v9->_accessoryServerBrowsers;
    v9->_accessoryServerBrowsers = (NSMutableArray *)v14;

    objc_msgSend(v8, "createIpAccessoryBrowser");
    v16 = objc_claimAutoreleasedReturnValue();
    ipAccessoryServerBrowser = v9->_ipAccessoryServerBrowser;
    v9->_ipAccessoryServerBrowser = (HAPAccessoryServerBrowserIP *)v16;

    -[HAPAccessoryServerBrowserIP setDelegate:queue:](v9->_ipAccessoryServerBrowser, "setDelegate:queue:", v9, v9->_workQueue);
    -[NSMutableArray addObject:](v9->_accessoryServerBrowsers, "addObject:", v9->_ipAccessoryServerBrowser);
    objc_msgSend(v8, "createBtleAccessoryBrowser");
    v18 = objc_claimAutoreleasedReturnValue();
    btleAccessoryServerBrowser = v9->_btleAccessoryServerBrowser;
    v9->_btleAccessoryServerBrowser = (HAPAccessoryServerBrowserBTLE *)v18;

    -[HAPAccessoryServerBrowserBTLE setDelegate:queue:](v9->_btleAccessoryServerBrowser, "setDelegate:queue:", v9, v9->_workQueue);
    -[NSMutableArray addObject:](v9->_accessoryServerBrowsers, "addObject:", v9->_btleAccessoryServerBrowser);
    objc_msgSend(v8, "createCHIPAccessoryBrowser");
    v20 = objc_claimAutoreleasedReturnValue();
    chipAccessoryServerBrowser = v9->_chipAccessoryServerBrowser;
    v9->_chipAccessoryServerBrowser = (HMMTRAccessoryServerBrowser *)v20;

    -[HMMTRAccessoryServerBrowser setDelegate:queue:](v9->_chipAccessoryServerBrowser, "setDelegate:queue:", v9, v9->_workQueue);
    -[NSMutableArray addObject:](v9->_accessoryServerBrowsers, "addObject:", v9->_chipAccessoryServerBrowser);
    v22 = -[HMDHAP2Storage initWithAccessoryBrowser:]([HMDHAP2Storage alloc], "initWithAccessoryBrowser:", v9);
    hap2Storage = v9->_hap2Storage;
    v9->_hap2Storage = v22;

    -[HMDAccessoryBrowser hap2Storage](v9, "hap2Storage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createHap2AccessoryBrowserWithStorage:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    hap2AccessoryServerBrowser = v9->_hap2AccessoryServerBrowser;
    v9->_hap2AccessoryServerBrowser = (HAPAccessoryServerBrowser *)v25;

    v27 = v9->_hap2AccessoryServerBrowser;
    if (v27)
    {
      -[HAPAccessoryServerBrowser setDelegate:queue:](v27, "setDelegate:queue:", v9, v9->_workQueue);
      -[NSMutableArray addObject:](v9->_accessoryServerBrowsers, "addObject:", v9->_hap2AccessoryServerBrowser);
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    pairedAccessories = v9->_pairedAccessories;
    v9->_pairedAccessories = (NSMutableArray *)v28;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    unpairedHAPAccessories = v9->_unpairedHAPAccessories;
    v9->_unpairedHAPAccessories = (NSMutableSet *)v30;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v32 = objc_claimAutoreleasedReturnValue();
    unassociatedMediaAccessories = v9->_unassociatedMediaAccessories;
    v9->_unassociatedMediaAccessories = (NSMutableSet *)v32;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v34 = objc_claimAutoreleasedReturnValue();
    deviceSetupMediaAccessories = v9->_deviceSetupMediaAccessories;
    v9->_deviceSetupMediaAccessories = (NSMutableSet *)v34;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v36 = objc_claimAutoreleasedReturnValue();
    unassociatedWACAccessories = v9->_unassociatedWACAccessories;
    v9->_unassociatedWACAccessories = (NSMutableSet *)v36;

    v38 = [HMDWACBrowser alloc];
    v39 = objc_alloc_init(HMDWACScanner);
    v40 = -[HMDWACBrowser initWithWACScanner:messageDispatcher:](v38, "initWithWACScanner:messageDispatcher:", v39, v9->_messageDispatcher);
    wacBrowser = v9->_wacBrowser;
    v9->_wacBrowser = (HMDWACBrowser *)v40;

    -[HMDWACBrowser setDelegate:queue:](v9->_wacBrowser, "setDelegate:queue:", v9, v9->_workQueue);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v42 = objc_claimAutoreleasedReturnValue();
    browsingConnections = v9->_browsingConnections;
    v9->_browsingConnections = (NSMutableSet *)v42;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v44 = objc_claimAutoreleasedReturnValue();
    activeAssertions = v9->_activeAssertions;
    v9->_activeAssertions = (NSHashTable *)v44;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v46 = objc_claimAutoreleasedReturnValue();
    discoveredAccessoryServerIdentifiers = v9->_discoveredAccessoryServerIdentifiers;
    v9->_discoveredAccessoryServerIdentifiers = (NSMutableSet *)v46;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v48 = objc_claimAutoreleasedReturnValue();
    tombstonedHAPAccessoryServers = v9->_tombstonedHAPAccessoryServers;
    v9->_tombstonedHAPAccessoryServers = (NSHashTable *)v48;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v50 = objc_claimAutoreleasedReturnValue();
    currentlyPairingAccessories = v9->_currentlyPairingAccessories;
    v9->_currentlyPairingAccessories = (NSMutableArray *)v50;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v52 = objc_claimAutoreleasedReturnValue();
    currentlyPairingProgressHandlers = v9->_currentlyPairingProgressHandlers;
    v9->_currentlyPairingProgressHandlers = (NSMutableArray *)v52;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v54 = objc_claimAutoreleasedReturnValue();
    discoveringBLEAccessoryServerIdentifiers = v9->_discoveringBLEAccessoryServerIdentifiers;
    v9->_discoveringBLEAccessoryServerIdentifiers = (NSHashTable *)v54;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v56 = objc_claimAutoreleasedReturnValue();
    discoveringAccessoryServerBrowsers = v9->_discoveringAccessoryServerBrowsers;
    v9->_discoveringAccessoryServerBrowsers = (NSHashTable *)v56;

    v9->_active = 0;
    objc_msgSend(v8, "createAuthServerWithDelegate:", v9);
    v58 = objc_claimAutoreleasedReturnValue();
    authServer = v9->_authServer;
    v9->_authServer = (HMDAuthServer *)v58;

    v60 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 120.0);
    stopReprovisioningTimer = v9->_stopReprovisioningTimer;
    v9->_stopReprovisioningTimer = (HMFTimer *)v60;

    -[HMFTimer setDelegate:](v9->_stopReprovisioningTimer, "setDelegate:", v9);
    -[HMDAccessoryBrowser workQueue](v9, "workQueue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFTimer setDelegateQueue:](v9->_stopReprovisioningTimer, "setDelegateQueue:", v62);

    v63 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 60.0);
    stopBrowsingAccessoriesNeedingReprovisioningTimer = v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer;
    v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer = (HMFTimer *)v63;

    -[HMFTimer setDelegate:](v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer, "setDelegate:", v9);
    -[HMDAccessoryBrowser workQueue](v9, "workQueue");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFTimer setDelegateQueue:](v9->_stopBrowsingAccessoriesNeedingReprovisioningTimer, "setDelegateQueue:", v65);

    v66 = (void *)MEMORY[0x227676638]();
    v67 = v9;
    HMFGetOSLogHandle();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v74 = v69;
      v75 = 2112;
      v76 = CFSTR("Enabled");
      _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Whole Home Bluetooth %@ on target OS", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v66);
    browseableLinkTypes = v67->_browseableLinkTypes;
    v67->_browseableLinkTypes = (NSArray *)&unk_24E971198;

    -[HMDAccessoryBrowser _registerForMessages](v67, "_registerForMessages");
    -[HMDAccessoryBrowser _registerForNotifications](v67, "_registerForNotifications");
  }

  return v9;
}

- (void)configureWithHomeManager:(id)a3
{
  -[HMDAccessoryBrowser configureWithHomeManager:mediaBrowserFactory:](self, "configureWithHomeManager:mediaBrowserFactory:", a3, &__block_literal_global_196897);
}

- (void)configureWithHomeManager:(id)a3 mediaBrowserFactory:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__HMDAccessoryBrowser_configureWithHomeManager_mediaBrowserFactory___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)configureAccessory:(id)a3 trackState:(BOOL)a4 connectionPriority:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__HMDAccessoryBrowser_configureAccessory_trackState_connectionPriority___block_invoke;
  block[3] = &unk_24E790028;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)setQOS:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__HMDAccessoryBrowser_setQOS___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)retrieveCurrentStateForIdentifier:(id)a3 stateNumber:(id *)a4 isReachable:(BOOL *)a5 linkQuality:(unint64_t *)a6 lastSeen:(id *)a7
{
  id v12;
  id v13;

  v12 = a3;
  -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "retrieveCurrentStateForIdentifier:stateNumber:isReachable:linkQuality:lastSeen:", v12, a4, a5, a6, a7);

}

- (void)updateStateForIdentifier:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateStateForIdentifier:stateNumber:", v7, v6);

}

- (void)updateBroadcastKeyForIdentifier:(id)a3 key:(id)a4 keyUpdatedStateNumber:(id)a5 keyUpdatedTime:(double)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__HMDAccessoryBrowser_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke;
  block[3] = &unk_24E796BC0;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMDAccessoryBrowser messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryBrowser;
  -[HMDAccessoryBrowser dealloc](&v5, sel_dealloc);
}

- (void)validateLinkTypes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "intValue");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setBrowseableLinkTypes:(id)a3
{
  NSArray *v4;
  NSArray *browseableLinkTypes;

  v4 = (NSArray *)a3;
  -[HMDAccessoryBrowser validateLinkTypes:](self, "validateLinkTypes:", v4);
  os_unfair_lock_lock_with_options();
  browseableLinkTypes = self->_browseableLinkTypes;
  self->_browseableLinkTypes = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)configureDemoBrowserWithDemoAccessories:(id)a3 finalized:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  HMDAccessoryServerBrowserDemo *v7;
  void *v8;
  HMDAccessoryServerBrowserDemo *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && !v6)
  {
    v7 = [HMDAccessoryServerBrowserDemo alloc];
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HAPAccessoryServerBrowser initWithQueue:](v7, "initWithQueue:", v8);
    -[HMDAccessoryBrowser setDemoAccessoryServerBrowser:](self, "setDemoAccessoryServerBrowser:", v9);

    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:queue:", self, v11);

    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadDemoData:finalized:", v15, v4);

    -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
}

- (void)_handleTestModeConfigRequest:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryServerBrowserDemo *v18;
  void *v19;
  HMDAccessoryServerBrowserDemo *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  HMDAccessoryBrowser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessoryBrowser *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kConfigTestingResetAccessoriesKey"));
  objc_msgSend(v4, "arrayForKey:", CFSTR("kConfigTestingAddAccessoriesKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && !v5)
  {
    objc_msgSend(v4, "messagePayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("kConfigTestingAccessoryControlKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(v10, "_handleTestModeConfigRequest:response:", v8, &v36);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v36;

LABEL_24:
        objc_msgSend(v4, "respondWithPayload:error:", v12, v11);

        goto LABEL_25;
      }
      v32 = (void *)MEMORY[0x227676638]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v35;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Demo accessory browser not yet started", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = 0;
    goto LABEL_24;
  }
  if ((v5 & 1) != 0
    || (-[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resetDemoAccessories");

      -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v17);

    }
    v18 = [HMDAccessoryServerBrowserDemo alloc];
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HAPAccessoryServerBrowser initWithQueue:](v18, "initWithQueue:", v19);
    -[HMDAccessoryBrowser setDemoAccessoryServerBrowser:](self, "setDemoAccessoryServerBrowser:", v20);

    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:queue:", self, v22);

    -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v24);

  }
  if (objc_msgSend(v6, "count"))
    v25 = 1;
  else
    v25 = v5;
  if ((v25 & 1) != 0)
  {
    -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendDemoData:", v6);

    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Request to add test/demo accessories but none found", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v31);

  }
LABEL_25:

}

- (void)addUnassociatedAccessory:(id)a3 forDeviceSetup:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    -[HMDAccessoryBrowser addUnassociatedMediaAccessory:forDeviceSetup:](self, "addUnassociatedMediaAccessory:forDeviceSetup:", v8, v4);
  }
  else
  {
    v9 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      -[HMDAccessoryBrowser addUnpairedHAPAccessory:](self, "addUnpairedHAPAccessory:", v11);
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v15;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown unassociated accessory type: %@ - dropping...", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

- (void)removeUnassociatedAccessoryWithIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDAccessoryBrowser *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser unassociatedAccessories](self, "unassociatedAccessories");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqual:", v11);

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
            *(_DWORD *)buf = 138543618;
            v22 = v16;
            v23 = 2112;
            v24 = v10;
            _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing unassociated accessory: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          -[HMDAccessoryBrowser removeUnassociatedAccessory:](v14, "removeUnassociatedAccessory:", v10);
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)removeUnassociatedAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDAccessoryBrowser *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDAccessoryBrowser removeUnassociatedMediaAccessory:](self, "removeUnassociatedMediaAccessory:", v6);
  }
  else
  {
    v7 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      -[HMDAccessoryBrowser removeUnassociatedWACAccessory:](self, "removeUnassociatedWACAccessory:", v9);
    }
    else
    {
      v10 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      if (v12)
      {
        -[HMDAccessoryBrowser removeUnpairedHAPAccessory:](self, "removeUnpairedHAPAccessory:", v12);
      }
      else
      {
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v16;
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown unassociated accessory type: %@ - dropping...", (uint8_t *)&v17, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
      }

    }
  }

}

- (NSArray)unassociatedAccessories
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDUnassociatedMediaAccessory *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_unpairedHAPAccessories, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[NSMutableSet allObjects](self->_unassociatedMediaAccessories, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  -[NSMutableSet allObjects](self->_deviceSetupMediaAccessories, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  -[NSMutableSet allObjects](self->_unassociatedWACAccessories, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  v9 = self->_unassociatedCurrentAccessory;
  if (v9)
    objc_msgSend(v3, "addObject:", v9);

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v10;
}

- (void)populateUnassociatedCurrentAccessory
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessoryBrowser *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_unassociatedCurrentAccessory)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_unassociatedCurrentAccessory, v5);

    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543618;
        v11 = v9;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Populated unassociated current accessory: %@", (uint8_t *)&v10, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDAccessoryBrowser _sendNewAccessoryData:messageName:](v7, "_sendNewAccessoryData:messageName:", v5, CFSTR("kNewAccessoriesFoundNotificationKey"));

    }
  }
}

- (void)resetUnassociatedCurrentAccessory
{
  os_unfair_lock_s *p_lock;
  HMDUnassociatedMediaAccessory *v4;
  HMDUnassociatedMediaAccessory *unassociatedCurrentAccessory;
  void *v6;
  HMDAccessoryBrowser *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_unassociatedCurrentAccessory;
  unassociatedCurrentAccessory = self->_unassociatedCurrentAccessory;
  self->_unassociatedCurrentAccessory = 0;

  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Resetting unassociated current accessory", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessoryBrowser _sendNewAccessoryData:messageName:](v7, "_sendNewAccessoryData:messageName:", v4, CFSTR("kNewAccessoriesRemovedNotificationKey"));
  }

}

- (id)unassociatedAccessoriesForClientRequest:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  unsigned __int8 isKindOfClass;
  id v13;
  char v14;
  _BOOL4 v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v22;
  void *v23;
  int v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isEntitledForSPIAccess");
  v22 = v4;
  v24 = objc_msgSend(v4, "isEntitledToProvideAccessorySetupPayload");
  if (v5)
    -[HMDAccessoryBrowser populateUnassociatedCurrentAccessory](self, "populateUnassociatedCurrentAccessory");
  -[HMDAccessoryBrowser unassociatedAccessories](self, "unassociatedAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v13 = v11;
        objc_opt_class();
        v14 = objc_opt_isKindOfClass();

        v15 = 0;
        if ((v14 & 1) != 0 && v11)
          v15 = -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](self, "exposeAccessoryTypesFeatureEnabled");
        if (isKindOfClass & (v11 != 0) | v5 & 1 || v15)
        {
          objc_msgSend(v13, "category");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isTelevisionAccessoryCategory");

          if (((v17 ^ 1 | v5) & 1) != 0
            || -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](self, "exposeAccessoryTypesFeatureEnabled"))
          {
            objc_msgSend(v13, "category");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isWiFiRouterAccessoryCategory");

            if (((v19 ^ 1 | v24) & 1) != 0
              || -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](self, "exposeAccessoryTypesFeatureEnabled"))
            {
              objc_msgSend(v23, "addObject:", v13);
            }
          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  v20 = (void *)objc_msgSend(v23, "copy");
  return v20;
}

- (id)_unassociatedMediaAccessoryWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessoryBrowser unassociatedMediaAccessories](self, "unassociatedMediaAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)unassociatedMediaAccessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_unassociatedMediaAccessories, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)deviceSetupMediaAccessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_deviceSetupMediaAccessories, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)handleAddedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __44__HMDAccessoryBrowser_handleAddedAccessory___block_invoke;
    v6[3] = &unk_24E79C268;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)_handleAddedAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Added accessory: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessoryBrowser _sendNewAccessoryData:messageName:](v6, "_sendNewAccessoryData:messageName:", v4, CFSTR("kNewAccessoriesFoundNotificationKey"));
    -[HMDAccessoryBrowser _notifyManagerOfNewAccessory](v6, "_notifyManagerOfNewAccessory");
    -[HMDAccessoryBrowser setGenerationCounter:](v6, "setGenerationCounter:", -[HMDAccessoryBrowser generationCounter](v6, "generationCounter") + 1);
  }

}

- (void)handleRemovedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__HMDAccessoryBrowser_handleRemovedAccessory___block_invoke;
    v6[3] = &unk_24E79C268;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

- (void)_handleRemovedAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removed accessory: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessoryBrowser _sendNewAccessoryData:messageName:](v6, "_sendNewAccessoryData:messageName:", v4, CFSTR("kNewAccessoriesRemovedNotificationKey"));
    -[HMDAccessoryBrowser setGenerationCounter:](v6, "setGenerationCounter:", -[HMDAccessoryBrowser generationCounter](v6, "generationCounter") + 1);
  }

}

- (void)_sendNewAccessoryData:(id)a3 messageName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  unsigned __int8 isKindOfClass;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  int v30;
  HMDAccessoryBrowserXPCMessageSendPolicy *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  void *v44;
  id v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[HMDAccessoryBrowser __isAccessoryBrowsingRequested](self, "__isAccessoryBrowsingRequested"))
  {
    v46[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObjectForIncomingXPCMessage(v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObjectForSPIClients(v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v43 = CFSTR("kAccessoriesInfoDataKey");
    v44 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v11;
    v41 = CFSTR("kAccessoriesInfoDataKey");
    v42 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BF2B0921-858B-42F5-B2EB-C915FB953E5B"));
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1B8]), "initWithTarget:", v37);
    v39 = (void *)v12;
    objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](self, "exposeAccessoryTypesFeatureEnabled");
    v15 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;
    v18 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v14)
    {
      v21 = v18;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v23 = (v21 != 0) & isKindOfClass;
      if (!v17)
        v23 = 1;
      if (v23)
        v24 = 1;
      else
        v24 = 5;
    }
    else
    {
      v35 = v7;
      v25 = v9;
      if (v17
        || (objc_msgSend(v20, "category"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "isTelevisionAccessoryCategory"),
            v26,
            v27))
      {
        v28 = 5;
      }
      else
      {
        v28 = 1;
      }
      objc_msgSend(v20, "category");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isWiFiRouterAccessoryCategory");

      if (v30)
        v24 = v28 | 0x40;
      else
        v24 = v28;
      v9 = v25;
      v7 = v35;
    }

    v31 = -[HMDAccessoryBrowserXPCMessageSendPolicy initWithRequiredEntitlements:]([HMDAccessoryBrowserXPCMessageSendPolicy alloc], "initWithRequiredEntitlements:", v24);
    objc_msgSend(v13, "setSendPolicy:", v31);

    objc_msgSend(v13, "setRequiresNoSPIEntitlement:", 1);
    -[HMDAccessoryBrowser messageDispatcher](self, "messageDispatcher");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sendMessage:completionHandler:", v13, 0);

    v33 = (void *)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v33, "setMessagePayload:", v38);
    objc_msgSend(v33, "setRequiresNoSPIEntitlement:", 0);
    objc_msgSend(v33, "setRequiresSPIEntitlement:", 1);
    -[HMDAccessoryBrowser messageDispatcher](self, "messageDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "sendMessage:completionHandler:", v33, 0);

  }
}

- (id)dumpBrowsingConnections
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  const __CFString *v14;
  __CFString *v15;
  HMDAccessoryBrowser *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v17 = self;
  -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "observedObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v11 = v10;
          else
            v11 = 0;
          v12 = v11;

          if (v12)
          {
            if ((objc_msgSend(v12, "isEntitledForSPIAccess") & 1) != 0
              || (v13 = -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](v17, "exposeAccessoryTypesFeatureEnabled"), v14 = &stru_24E79DB48, v13))
            {
              v14 = CFSTR("(Media)");
            }
            objc_msgSend(v3, "appendFormat:", CFSTR("Browsing%@: %@\n"), v14, v12);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    v15 = v3;
  }
  else
  {
    v15 = CFSTR("Browsing Connections: None");
  }

  return v15;
}

- (BOOL)internalDiscoveryRequest
{
  HMDAccessoryBrowser *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_internalDiscoveryRequest;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setInternalDiscoveryRequest:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_internalDiscoveryRequest = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)__resetBrowsingConnections
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeAllObjects](self->_browsingConnections, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)__isAccessoryBrowsingRequested
{
  void *v2;
  BOOL v3;

  -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)__isMediaAccessoryBrowsingRequested
{
  _BOOL4 v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](self, "exposeAccessoryTypesFeatureEnabled");
  -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    LOBYTE(v6) = objc_msgSend(v4, "count") != 0;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "observedObject", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v10 = v9;
          else
            v10 = 0;
          v11 = v10;

          if (v11 && (objc_msgSend(v11, "isEntitledForSPIAccess") & 1) != 0)
          {

            LOBYTE(v6) = 1;
            goto LABEL_17;
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
  return v6;
}

- (void)__removeBrowsingObserver:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAccessoryBrowser *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v6))
    {
      objc_msgSend(v6, "setDeallocationBlock:", 0);
      os_unfair_lock_lock_with_options();
      -[NSMutableSet removeObject:](self->_browsingConnections, "removeObject:", v6);
      os_unfair_lock_unlock(&self->_lock);
      -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = v9;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v10)
      {
        v11 = 0;
        v12 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "observedObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v15 = v14;
            else
              v15 = 0;
            v16 = v15;

            if (v16)
            {
              if ((objc_msgSend(v16, "isEntitledForSPIAccess") & 1) != 0
                || -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](self, "exposeAccessoryTypesFeatureEnabled"))
              {

                goto LABEL_26;
              }
              v11 = 1;
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v10)
            continue;
          break;
        }

        if ((v11 & 1) != 0)
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v31 = v20;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@No more clients interested in media accessory browsing - stopping", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v17);
          -[HMDAccessoryBrowser _stopDiscoveringMediaAccessories](v18, "_stopDiscoveringMediaAccessories");
          goto LABEL_26;
        }
      }
      else
      {

      }
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@No more clients interested in accessory browsing - stopping", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDAccessoryBrowser _stopDiscoveringAccessoriesWithError:](v22, "_stopDiscoveringAccessoriesWithError:", v25);
    }
LABEL_26:

  }
}

- (void)__addBrowsingConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HMDAccessoryBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  int v23;
  void *v24;
  HMDAccessoryBrowser *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  HMDAccessoryBrowser *v31;
  NSObject *v32;
  void *v33;
  id *v34;
  id *v35;
  id val;
  __CFString *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id from;
  id location;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v37 = (__CFString *)a3;
  -[HMDAccessoryBrowser browsingConnections](self, "browsingConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  observerMatchingConnection(v37, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
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
      v49 = (uint64_t)v9;
      v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Already have an active accessory browsing request from the connection: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    val = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F218]), "initWithObservedObject:", v37);
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = (uint64_t)v13;
      v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Registering connection for accessory browsing: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_initWeak(&location, v11);
    objc_initWeak(&from, val);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke;
    v42[3] = &unk_24E790050;
    v34 = &v43;
    objc_copyWeak(&v43, &location);
    v35 = &v44;
    objc_copyWeak(&v44, &from);
    objc_msgSend(val, "setDeallocationBlock:", v42);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v39;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v17), "observedObject", v34, v35);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v19 = v18;
          else
            v19 = 0;
          v20 = v19;

          if (v20 && ((objc_msgSend(v20, "isEntitledForSPIAccess") & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0))
          {

            v21 = 0;
            goto LABEL_22;
          }

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v15)
          continue;
        break;
      }
    }
    v21 = 1;
LABEL_22:

    os_unfair_lock_lock_with_options();
    -[NSMutableSet addObject:](v11->_browsingConnections, "addObject:", val);
    os_unfair_lock_unlock(&v11->_lock);
    -[HMDAccessoryBrowser browsingConnections](v11, "browsingConnections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v4, "count");
    v23 = (-[__CFString isEntitledForSPIAccess](v37, "isEntitledForSPIAccess") & 1) != 0
       || -[HMDAccessoryBrowser exposeAccessoryTypesFeatureEnabled](v11, "exposeAccessoryTypesFeatureEnabled");
    if (v22 == 1)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v11;
      HMFGetOSLogHandle();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        v29 = &stru_24E79DB48;
        if (v23)
          v29 = CFSTR("(and media)");
        *(_DWORD *)buf = 138543618;
        v49 = v27;
        v50 = 2112;
        v51 = v29;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@First connection interested in accessory%@ browsing - starting", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      -[HMDAccessoryBrowser _startDiscoveringAccessoriesWithLinkType:](v25, "_startDiscoveringAccessoriesWithLinkType:", 0);
    }
    else if ((v21 & v23) == 1)
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = v11;
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = (uint64_t)v33;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@First connection interested in media accessory browsing - starting", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDAccessoryBrowser _startDiscoveringMediaAccessories](v31, "_startDiscoveringMediaAccessories");
    }
    objc_destroyWeak(v35);
    objc_destroyWeak(v34);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

- (NSMutableArray)pairedAccessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_pairedAccessories, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSMutableArray *)v4;
}

- (void)addPairedAccessory:(id)a3
{
  id v4;
  NSMutableArray *pairedAccessories;
  id v6;
  void *v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    pairedAccessories = self->_pairedAccessories;
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __42__HMDAccessoryBrowser_addPairedAccessory___block_invoke;
    v17 = &unk_24E790078;
    v6 = v4;
    v18 = v6;
    -[NSMutableArray hmf_objectPassingTest:](pairedAccessories, "hmf_objectPassingTest:", &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = v8;
        HMFGetLogIdentifier();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing existing paired accessory instance %@", buf, 0x16u);

        v8 = v13;
      }

      objc_autoreleasePoolPop(v8);
      -[NSMutableArray removeObject:](self->_pairedAccessories, "removeObject:", v7);
    }
    -[NSMutableArray addObject:](self->_pairedAccessories, "addObject:", v6, v13, v14, v15, v16, v17);

    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)removePairedAccessory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableArray removeObject:](self->_pairedAccessories, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)resetPairedAccessories
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_pairedAccessories, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)removePairedAccessoryInfoWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_pairedAccessories;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v12 = v9;

          if (v12)
            -[NSMutableArray removeObject:](self->_pairedAccessories, "removeObject:", v12);
          goto LABEL_12;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  v12 = 0;
LABEL_12:

  os_unfair_lock_unlock(&self->_lock);
}

- (id)pairedAccessoryInformationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pairedAccessoryInformationWithSetupID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "setupHash");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = HAPValidateSetupHash();

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pairedHMDHAPAccessoryWithAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v4, "primaryAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmdHAPAccessoryWithHAPAccessory:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)areThereAnyPairedAccessories
{
  void *v2;
  BOOL v3;

  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)identifiersOfPairedBTLEAccessories
{
  return -[HMDAccessoryBrowser __identifiersOfPairedAccessoriesWithTransports:](self, "__identifiersOfPairedAccessoriesWithTransports:", 2);
}

- (BOOL)areThereAnyPairedUnknownLinkTypeAccessories
{
  void *v2;
  char v3;

  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_347_196854);

  return v3;
}

- (id)identifiersOfPairedUnknownLinkTypeAccessories
{
  void *v2;
  void *v3;

  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_349);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)areThereAnyPairedBTLEAccessories
{
  void *v2;
  BOOL v3;

  -[HMDAccessoryBrowser identifiersOfPairedBTLEAccessories](self, "identifiersOfPairedBTLEAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)identifiersOfAssociatedMediaAccessories
{
  return -[HMDAccessoryBrowser __identifiersOfPairedAccessoriesWithTransports:](self, "__identifiersOfPairedAccessoriesWithTransports:", 16);
}

- (BOOL)areThereAnyAssociatedAirPlayAccessories
{
  void *v2;
  BOOL v3;

  -[HMDAccessoryBrowser identifiersOfAssociatedMediaAccessories](self, "identifiersOfAssociatedMediaAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (unint64_t)numPairedIPAccessories
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryBrowser __identifiersOfPairedAccessoriesWithTransports:](self, "__identifiersOfPairedAccessoriesWithTransports:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)endActiveAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMDAccessoryBrowser *v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid assertion object"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v6, "accessoryBrowser");
  v7 = (HMDAccessoryBrowser *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid assertion object not created by HMHomeManager instance"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    objc_exception_throw(v12);
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Releasing active assertion : %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "invalidate");
  os_unfair_lock_lock_with_options();
  -[NSHashTable removeObject:](v9->_activeAssertions, "removeObject:", v6);
  os_unfair_lock_unlock(&v9->_lock);

}

- (void)__activate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMDAccessoryBrowser___activate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyDelegateOfReachabilityChange:(BOOL)a3 forAccessoryWithIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("unreachable");
      v14 = 138544130;
      v15 = v12;
      if (v4)
        v13 = CFSTR("reachable");
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that accessory with identifier %@ is %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "accessoryBrowser:identifier:reachable:", v10, v6, v4);
  }

}

- (void)_handleAddedAccessoryAdvertisements:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  HMDAccessoryBrowser *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMDAccessoryBrowser *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  HMDAccessoryBrowser *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAccessoryBrowser *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDAccessoryBrowser *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDAccessoryBrowser *v61;
  int v62;
  id v63;
  _BOOL4 v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  void *v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v65 = -[HMDAccessoryBrowser __isAccessoryBrowsingRequested](self, "__isAccessoryBrowsingRequested");
  v64 = -[HMDAccessoryBrowser __isMediaAccessoryBrowsingRequested](self, "__isMediaAccessoryBrowsingRequested");
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v5 = v4;
  v67 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  if (!v67)
    goto LABEL_55;
  v66 = *(_QWORD *)v69;
  v63 = v5;
  while (2)
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v69 != v66)
        objc_enumerationMutation(v5);
      v7 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v6);
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v13, "setAssociated:", 1);
          -[HMDAccessoryBrowser _associate:hapAccessoryWithAdvertisement:](self, "_associate:hapAccessoryWithAdvertisement:", 1, v13);
          objc_msgSend(v10, "delegate");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "accessoryBrowser:didAddAccessoryAdvertisement:", self, v11);
          -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v8;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateSessionsForAccessories:", v16);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_32:
            -[HMDAccessoryBrowser _notifyDelegateOfReachabilityChange:forAccessoryWithIdentifier:](self, "_notifyDelegateOfReachabilityChange:forAccessoryWithIdentifier:", 1, v8);
LABEL_33:

            goto LABEL_34;
          }
          v25 = v11;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
          v14 = v26;

          v27 = (void *)MEMORY[0x227676638]();
          v28 = self;
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v73 = v30;
            v74 = 2112;
            v75 = v14;
            _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unsupported operation - not creating HMDHAPAccessory from advertisement data: %@", buf, 0x16u);

            v5 = v63;
          }

          objc_autoreleasePoolPop(v27);
        }

        goto LABEL_32;
      }
      if (!v65)
        goto LABEL_34;
      v17 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v13 = v18;

      if (!v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = 0;
          goto LABEL_33;
        }
        v31 = v17;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;
        v20 = v32;

        v33 = (void *)MEMORY[0x227676638]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v73 = v36;
          v74 = 2112;
          v75 = v20;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unsupported operation - not  creating HMDHAPUnassociatedAccessory from advertisement data: %@", buf, 0x16u);

          v5 = v63;
        }

        objc_autoreleasePoolPop(v33);
LABEL_52:

        goto LABEL_33;
      }
      if (v64)
      {
        objc_msgSend(v13, "setAssociated:", 0);
        -[HMDAccessoryBrowser _unassociatedMediaAccessoryWithIdentifier:](self, "_unassociatedMediaAccessoryWithIdentifier:", v8);
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (id)v19;
          v21 = (void *)MEMORY[0x227676638]();
          v22 = self;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v73 = v24;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Advertisement is for known accessory, updating", buf, 0xCu);

            v5 = v63;
          }

          objc_autoreleasePoolPop(v21);
          objc_msgSend(v20, "updateAdvertisementData:", v13);
        }
        else
        {
          -[HMDAccessoryBrowser getActiveWACSession](self, "getActiveWACSession");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37 && objc_msgSend(v13, "conformsToProtocol:", &unk_25588D518))
          {
            v38 = (void *)MEMORY[0x227676638]();
            v39 = self;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v73 = v41;
              _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Advertisement supports WAC matching, checking active sessions for match", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v38);
            v42 = v13;
            v61 = v39;
            -[HMDAccessoryBrowser getActiveWACSession](v39, "getActiveWACSession");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "wacDeviceID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v42, "matchesWACDeviceID:", v44);
            v45 = v42;

            if (v62)
            {
              -[HMDAccessoryBrowser mediaBrowser](v61, "mediaBrowser");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "unassociatedAccessoryFromAdvertisementData:", v42);
              v49 = (void *)objc_claimAutoreleasedReturnValue();

              -[HMDAccessoryBrowser getActiveWACSession](v61, "getActiveWACSession");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "uuid");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setUUID:", v51);

              v52 = (void *)MEMORY[0x227676638]();
              v53 = v61;
              HMFGetOSLogHandle();
              v54 = objc_claimAutoreleasedReturnValue();
              v55 = v54;
              v56 = v45;
              if (v49)
              {
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v73 = v57;
                  _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Advertisement matches WAC device, performing handoff", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v52);
                -[HMDAccessoryBrowser getActiveWACSession](v53, "getActiveWACSession");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "updateWithMatchingUnassociatedAccessory:", v49);
              }
              else
              {
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  -[HMDAccessoryBrowser getActiveWACSession](v53, "getActiveWACSession");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v73 = v59;
                  v74 = 2112;
                  v75 = v56;
                  v76 = 2112;
                  v77 = v60;
                  _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Could not create accessory from advertisement %@ for matching WAC device %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v52);
                -[HMDAccessoryBrowser getActiveWACSession](v53, "getActiveWACSession");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "cancelConfigurationWithCompletionHandler:", &__block_literal_global_368);
              }

              -[HMDAccessoryBrowser setActiveWACSession:](v53, "setActiveWACSession:", 0);
              goto LABEL_55;
            }
          }
          -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "unassociatedAccessoryFromAdvertisementData:", v13);
          v20 = (id)objc_claimAutoreleasedReturnValue();

          if (!v20)
            goto LABEL_33;
          -[HMDAccessoryBrowser addUnassociatedAccessory:forDeviceSetup:](self, "addUnassociatedAccessory:forDeviceSetup:", v20, 0);
        }
        goto LABEL_52;
      }
      v10 = v13;
LABEL_34:

      ++v6;
    }
    while (v67 != v6);
    v47 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    v67 = v47;
    if (v47)
      continue;
    break;
  }
LABEL_55:

}

- (void)_handleRemovedAccessoryAdvertisements:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HMDAccessoryBrowser *v26;
  NSObject *v27;
  HMDAccessoryBrowser *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v43;
    v30 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      v31 = v5;
      do
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "accessoryBrowser:didRemoveAccessoryAdvertisement:", self, v8);
          objc_msgSend(v8, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser _notifyDelegateOfReachabilityChange:forAccessoryWithIdentifier:](self, "_notifyDelegateOfReachabilityChange:forAccessoryWithIdentifier:", 0, v12);
        }
        else
        {
          v36 = v8;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          -[HMDAccessoryBrowser unassociatedAccessories](self, "unassociatedAccessories");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          if (v13)
          {
            v14 = v13;
            v33 = v11;
            v34 = v10;
            v35 = v7;
            v15 = *(_QWORD *)v39;
            v16 = v36;
            v37 = v12;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v39 != v15)
                  objc_enumerationMutation(v37);
                v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                objc_msgSend(v18, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v19, "isEqual:", v20);

                if (v21)
                {
                  v22 = v18;
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v23 = v22;
                  else
                    v23 = 0;
                  v24 = v23;

                  if (v24)
                  {
                    -[HMDAccessoryBrowser removeUnassociatedMediaAccessory:](self, "removeUnassociatedMediaAccessory:", v24);
                  }
                  else
                  {
                    v25 = (void *)MEMORY[0x227676638]();
                    v26 = self;
                    HMFGetOSLogHandle();
                    v27 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v28 = self;
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v47 = v29;
                      v48 = 2112;
                      v49 = v36;
                      v50 = 2112;
                      v51 = v22;
                      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory advertisement data not routed through AccessoryBrowser: %@ - %@", buf, 0x20u);

                      self = v28;
                    }

                    objc_autoreleasePoolPop(v25);
                    v16 = v36;
                  }

                }
              }
              v12 = v37;
              v14 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
            }
            while (v14);
            v6 = v30;
            v5 = v31;
            v10 = v34;
            v7 = v35;
            v11 = v33;
          }
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v5);
  }

}

- (void)resetConfiguration
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDAccessoryBrowser_resetConfiguration__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isDiscoveringAccessoriesWithLinkType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDAccessoryBrowser discoveringAccessoryServerBrowsers](self, "discoveringAccessoryServerBrowsers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "linkType") == a3)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)startDiscoveringPairedAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDAccessoryBrowser_startDiscoveringPairedAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startDiscoveringPairedAccessoriesWithLinkType:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__HMDAccessoryBrowser_startDiscoveringPairedAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)startDiscoveringAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__HMDAccessoryBrowser_startDiscoveringAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)startDiscoveringAccessoriesWithLinkType:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__HMDAccessoryBrowser_startDiscoveringAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)startDiscoveringMediaAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HMDAccessoryBrowser_startDiscoveringMediaAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDAccessoryBrowser_stopDiscoveringAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscoveringAccessoriesWithLinkType:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__HMDAccessoryBrowser_stopDiscoveringAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)stopDiscoveringForUnpairedAccessoriesWithLinkType:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__HMDAccessoryBrowser_stopDiscoveringForUnpairedAccessoriesWithLinkType___block_invoke;
  v6[3] = &unk_24E797C10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)stopDiscoveringMediaAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDAccessoryBrowser_stopDiscoveringMediaAccessories__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)btleAccessoryReachabilityProbeTimer:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__HMDAccessoryBrowser_btleAccessoryReachabilityProbeTimer___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)stopTrackingBTLEAccessoriesWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAccessoryBrowser_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)discoverAccessoryServer:(id)a3 linkType:(int64_t)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__HMDAccessoryBrowser_discoverAccessoryServer_linkType_errorHandler___block_invoke;
  v13[3] = &unk_24E79BE60;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)activate:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__HMDAccessoryBrowser_activate___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

- (void)reprovisionAccessoryWithIdentifier:(id)a3 wiFiPSK:(id)a4 countryCode:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__HMDAccessoryBrowser_reprovisionAccessoryWithIdentifier_wiFiPSK_countryCode_withCompletion___block_invoke;
  block[3] = &unk_24E799A68;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)_reprovisionAccessoryWithIdentifier:(id)a3 wiFiPSK:(id)a4 countryCode:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  void *v22;
  HMDAccessoryBrowser *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDAccessoryBrowser *v39;
  NSObject *v40;
  void *v41;
  _BYTE v42[22];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138543362;
      *(_QWORD *)&v42[4] = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to reprovision accessory without a IP accessory server browser", v42, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    v26 = _Block_copy(v13);
    if (!v26)
      goto LABEL_16;
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = 57;
    goto LABEL_15;
  }
  -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](self, "identifierOfAccessoryBeingReprovisioned");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138543362;
      *(_QWORD *)&v42[4] = v20;
      v21 = "%{public}@Unable to reprovision accessory since provisioing is already in progress";
LABEL_12:
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, v21, v42, 0xCu);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138543362;
      *(_QWORD *)&v42[4] = v20;
      v21 = "%{public}@Unable to reprovision accessory since an addAccessory operation is already in progress";
      goto LABEL_12;
    }
LABEL_13:

    objc_autoreleasePoolPop(v17);
    v26 = _Block_copy(v13);
    if (!v26)
    {
LABEL_16:

      goto LABEL_17;
    }
    v27 = (void *)MEMORY[0x24BDD1540];
    v28 = 15;
LABEL_15:
    objc_msgSend(v27, "hmErrorWithCode:", v28, *(_OWORD *)v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v26 + 2))(v26, v31);

    goto LABEL_16;
  }
  -[HMDAccessoryBrowser setIdentifierOfAccessoryBeingReprovisioned:](self, "setIdentifierOfAccessoryBeingReprovisioned:", v10);
  -[HMDAccessoryBrowser setWiFiPSKForAccessoryReprovisioning:](self, "setWiFiPSKForAccessoryReprovisioning:", v11);
  v32 = (void *)MEMORY[0x227676638](-[HMDAccessoryBrowser setCountrycodeForAccessoryReprovisioning:](self, "setCountrycodeForAccessoryReprovisioning:", v12));
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543618;
    *(_QWORD *)&v42[4] = v34;
    *(_WORD *)&v42[12] = 2112;
    *(_QWORD *)&v42[14] = v10;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Start searching for accessory: %@ for reprovisioning", v42, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
  objc_msgSend(v15, "startDiscoveringWACAccessoryServerWithIdentifier:", v10);
  -[HMDAccessoryBrowser stopReprovisioningTimer](self, "stopReprovisioningTimer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "resume");

  v36 = _Block_copy(v13);
  v37 = v36;
  if (v36)
    (*((void (**)(void *, _QWORD))v36 + 2))(v36, 0);

  v38 = (void *)MEMORY[0x227676638]();
  v39 = self;
  HMFGetOSLogHandle();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543362;
    *(_QWORD *)&v42[4] = v41;
    _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Started the stop reprovisioning timer", v42, 0xCu);

  }
  objc_autoreleasePoolPop(v38);
LABEL_17:

}

- (void)updateRemoteAccessoryBrowsing:(BOOL)a3 whbScan:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  BOOL v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDAccessoryBrowser *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v4 = a4;
  v5 = a3;
  v32 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAccessoryBrowser supportsRemoteBrowsing](self, "supportsRemoteBrowsing"))
  {
    v7 = v5 && v4;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating WHB Browsing (%@) and Scan (%@).", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessoryBrowser btleAccessoryServerBrowser](v9, "btleAccessoryServerBrowser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateRemoteBrowsing:shouldScan:", v5, v4);

    if (v5 && v4)
    {
      objc_msgSend(&unk_24E9711B0, "arrayByAddingObject:", &unk_24E96C698);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser setBrowseableLinkTypes:](v9, "setBrowseableLinkTypes:", v15);

    }
    else
    {
      -[HMDAccessoryBrowser setBrowseableLinkTypes:](v9, "setBrowseableLinkTypes:", &unk_24E9711B0);
    }
    -[HMDAccessoryBrowser btleAccessoryServerBrowser](v9, "btleAccessoryServerBrowser");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "scanState");

    if (v17)
    {
      if (v7)
      {
        if (-[HMDAccessoryBrowser areThereAnyPairedBTLEAccessories](v9, "areThereAnyPairedBTLEAccessories")
          || -[HMDAccessoryBrowser areThereAnyPairedUnknownLinkTypeAccessories](v9, "areThereAnyPairedUnknownLinkTypeAccessories"))
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v9;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138543362;
            v27 = v21;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Start probing for paired BTLE accessories due to remote browsing change.", (uint8_t *)&v26, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
          -[HMDAccessoryBrowser btleAccessoryReachabilityProbeTimer:](v19, "btleAccessoryReachabilityProbeTimer:", 1);
        }
      }
      else
      {
        -[HMDAccessoryBrowser stopDiscoveringAccessoriesWithLinkType:](v9, "stopDiscoveringAccessoriesWithLinkType:", 2);
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v9;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v25;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping start/stop of BTLE browser since it's in idle state.", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
    }
  }
}

- (void)homeLocationChangeNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HMDAccessoryBrowser *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received notification: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryBrowser workQueue](v6, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__HMDAccessoryBrowser_homeLocationChangeNotification___block_invoke;
  v12[3] = &unk_24E79C268;
  v13 = v4;
  v14 = v6;
  v11 = v4;
  dispatch_async(v10, v12);

}

- (void)handleNewlyPairedAccessory:(id)a3 linkType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__HMDAccessoryBrowser_handleNewlyPairedAccessory_linkType___block_invoke;
  block[3] = &unk_24E796490;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (BOOL)isBrowsingAllowed
{
  return 1;
}

- (void)probeReachabilityForBTLEAccessoryServersWithIdentifiers:(id)a3 forceScan:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __104__HMDAccessoryBrowser_probeReachabilityForBTLEAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke;
  v13[3] = &unk_24E7962D8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (NSArray)unpairedHAPAccessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_unpairedHAPAccessories, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)unpairedAccessoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDAccessoryBrowser unpairedHAPAccessories](self, "unpairedHAPAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_unpairedAccessoryMatchingPairingInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDAccessoryBrowser unpairedHAPAccessories](self, "unpairedHAPAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v4, "matchesUnpairedAccessory:", v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pairingInformationForUnpairedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "matchesUnpairedAccessory:", v4) & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_pairingInformationForAccessoryIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "accessoryServerIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v14 = v11;
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[HMDAccessoryBrowser unpairedAccessoryWithServerIdentifier:](self, "unpairedAccessoryWithServerIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_progressHandlerForUnpairedAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDAccessoryBrowser currentlyPairingProgressHandlers](self, "currentlyPairingProgressHandlers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "accessoryUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)addUnassociatedMediaAccessory:(id)a3 forDeviceSetup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  NSObject *v16;
  id v17;
  BOOL v18;
  _QWORD block[4];
  id v20;
  HMDAccessoryBrowser *v21;
  id v22;
  char v23;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v18 = v4;
    if (v4)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = self->_deviceSetupMediaAccessories;
      v8 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v11, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if (v14)
            {
              v8 = v11;
              -[NSMutableSet removeObject:](self->_deviceSetupMediaAccessories, "removeObject:", v8);
              goto LABEL_15;
            }
          }
          v8 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_15:

      -[NSMutableSet addObject:](self->_deviceSetupMediaAccessories, "addObject:", v6);
    }
    else
    {
      if ((-[NSMutableSet containsObject:](self->_unassociatedMediaAccessories, "containsObject:", v6) & 1) != 0)
      {
        v15 = 0;
        v8 = 0;
LABEL_18:
        -[HMDAccessoryBrowser workQueue](self, "workQueue");
        v16 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __68__HMDAccessoryBrowser_addUnassociatedMediaAccessory_forDeviceSetup___block_invoke;
        block[3] = &unk_24E790140;
        v20 = v8;
        v21 = self;
        v22 = v6;
        v23 = v15;
        v24 = v18;
        v17 = v8;
        dispatch_async(v16, block);

        os_unfair_lock_unlock(&self->_lock);
        goto LABEL_19;
      }
      -[NSMutableSet addObject:](self->_unassociatedMediaAccessories, "addObject:", v6);
      v8 = 0;
    }
    v15 = 1;
    goto LABEL_18;
  }
LABEL_19:

}

- (void)_associate:(BOOL)a3 hapAccessoryWithAdvertisement:(id)a4
{
  id v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  os_unfair_lock_t lock;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v25 = a3;
  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_unpairedHAPAccessories;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (v13)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          if (v25)
          {
            HMFGetOSLogHandle();
            v20 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v21;
              v33 = 2112;
              v34 = v5;
              v35 = 2112;
              v36 = v10;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Associating Advertisement: %@ with HAPAccessory: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v18);
            v22 = v5;
          }
          else
          {
            HMFGetOSLogHandle();
            v23 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v24;
              v33 = 2112;
              v34 = v5;
              v35 = 2112;
              v36 = v10;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Disassociating Advertisement: %@ from HAPAccessory: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v18);
            v22 = 0;
          }
          objc_msgSend(v10, "associateWithAccessoryAdvertisement:", v22);

          goto LABEL_20;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v7)
        continue;
      break;
    }
  }

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v17;
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@No unpaired HAP accessory yet for advertisement: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
LABEL_20:
  os_unfair_lock_unlock(lock);

}

- (void)_associateMediaAccessoryForServer:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "compatibilityFeatures") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Found server: %@ supporting HAP+AP2", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _unassociatedMediaAccessoryWithIdentifier:](v6, "_unassociatedMediaAccessoryWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "isHAPAirPlay2Accessory"))
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = v6;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v14;
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Associating unpaired HAP Accessory: %@ with media Accessory: %@", (uint8_t *)&v16, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v10, "advertisement");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser _associate:hapAccessoryWithAdvertisement:](v12, "_associate:hapAccessoryWithAdvertisement:", 1, v15);

    }
  }

}

- (void)removeUnassociatedMediaAccessory:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryBrowser *v9;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    v5 = -[NSMutableSet containsObject:](self->_unassociatedMediaAccessories, "containsObject:", v4);
    if (v5)
      -[NSMutableSet removeObject:](self->_unassociatedMediaAccessories, "removeObject:", v4);
    if (-[NSMutableSet containsObject:](self->_deviceSetupMediaAccessories, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_deviceSetupMediaAccessories, "removeObject:", v4);
    }
    else if (!v5)
    {
LABEL_8:
      os_unfair_lock_unlock(&self->_lock);
      goto LABEL_9;
    }
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __56__HMDAccessoryBrowser_removeUnassociatedMediaAccessory___block_invoke;
    v7[3] = &unk_24E79C268;
    v8 = v4;
    v9 = self;
    dispatch_async(v6, v7);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)addUnassociatedWACAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_unassociatedWACAccessories, "containsObject:", v6) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_unassociatedWACAccessories, "addObject:", v6);
      -[HMDAccessoryBrowser workQueue](self, "workQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelegate:withQueue:", self, v5);

      -[HMDAccessoryBrowser handleAddedAccessory:](self, "handleAddedAccessory:", v6);
    }
    os_unfair_lock_unlock(&self->_lock);
    v4 = v6;
  }

}

- (void)removeUnassociatedWACAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  HMDAccessoryBrowser *v8;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_unassociatedWACAccessories, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_unassociatedWACAccessories, "removeObject:", v4);
      -[HMDAccessoryBrowser workQueue](self, "workQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __54__HMDAccessoryBrowser_removeUnassociatedWACAccessory___block_invoke;
      v6[3] = &unk_24E79C268;
      v7 = v4;
      v8 = self;
      dispatch_async(v5, v6);

    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)setActiveWACSession:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  HMDAccessoryBrowser *v11;

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_accessoryPerformingWAC, a3);
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__HMDAccessoryBrowser_setActiveWACSession___block_invoke;
  v9[3] = &unk_24E79C268;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(v7, v9);

  os_unfair_lock_unlock(p_lock);
}

- (HMDUnassociatedWACAccessory)getActiveWACSession
{
  os_unfair_lock_s *p_lock;
  HMDUnassociatedWACAccessory *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accessoryPerformingWAC;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)requestPermissionToAssociateWACAccessory:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[HMDAccessoryBrowser getActiveWACSession](self, "getActiveWACSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v7[2](v7, 1);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Requesting permission from user to share network credentials with WAC accessory", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser workQueue](v10, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestUserPermissionForLegacyWACAccessory:withContext:queue:completionHandler:", v14, v6, v15, v7);

  }
}

- (void)unassociatedWACAccessoryDidStartAssociation:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Tracking active WAC session: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessoryBrowser setActiveWACSession:](v6, "setActiveWACSession:", v4);
  }

}

- (void)unassociatedWACAccessoryDidFinishAssociation:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissPendingDialogWithContext:queue:completionHandler:", v6, v9, &__block_literal_global_381);

  if (v7)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@WAC session for %@ failed with %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDAccessoryBrowser setActiveWACSession:](v11, "setActiveWACSession:", 0);
  }

}

- (void)addUnpairedHAPAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_unpairedHAPAccessories, "containsObject:", v4) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_unpairedHAPAccessories, "addObject:", v4);
      -[HMDAccessoryBrowser workQueue](self, "workQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __47__HMDAccessoryBrowser_addUnpairedHAPAccessory___block_invoke;
      v6[3] = &unk_24E79C268;
      v6[4] = self;
      v7 = v4;
      dispatch_async(v5, v6);

    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)removeUnpairedHAPAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_unpairedHAPAccessories, "containsObject:", v4))
    {
      -[NSMutableSet removeObject:](self->_unpairedHAPAccessories, "removeObject:", v4);
      -[HMDAccessoryBrowser workQueue](self, "workQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __50__HMDAccessoryBrowser_removeUnpairedHAPAccessory___block_invoke;
      v6[3] = &unk_24E79C268;
      v6[4] = self;
      v7 = v4;
      dispatch_async(v5, v6);

    }
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)_handleRemovedUnpairedHAPAccessory:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessoryBrowser _removePairingInformationForUnpairedAccessory:](self, "_removePairingInformationForUnpairedAccessory:", v5);
}

- (void)_removePairingInformationForUnpairedAccessory:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairingRetryTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "pairingRetryTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspend");

    objc_msgSend(v5, "setPairingRetryTimer:", 0);
  }
  objc_msgSend(v5, "pairingInterruptionTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "pairingInterruptionTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suspend");

    objc_msgSend(v5, "setPairingInterruptionTimer:", 0);
  }
  objc_msgSend(v5, "reconfirmTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "reconfirmTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suspend");

    objc_msgSend(v5, "setReconfirmTimer:", 0);
  }
  if (v5)
  {
    -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v5);

  }
  objc_msgSend(v16, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](self, "_progressHandlerForUnpairedAccessory:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDAccessoryBrowser currentlyPairingProgressHandlers](self, "currentlyPairingProgressHandlers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObject:", v14);

  }
}

- (void)_handleWACAccessoryFound
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDAccessoryBrowser homeManager](self, "homeManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "homeLocationHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "isoCountryCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(v8, "homeLocationHandler");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "updateHomeLocation");

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_setupHMMTRAccessoryServer:(id)a3 pairingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "homeUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPairingTargetHomeUUID:", v8);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDAccessoryBrowser homeManager](self, "homeManager", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "homeUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (v18)
        {
          objc_msgSend(v15, "fabric");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setPairingTargetFabric:", v19);

          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_addUnpairedAccessoryForServer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDUnpairedHAPAccessory *v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  HMDUnpairedHAPAccessory *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMDAccessoryBrowser *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  void *v35;
  void *v36;
  HMDAddAccessoryProgressState *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDAddAccessoryProgressState *v42;
  id v43;
  void *v44;
  __CFString *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  HMDUnpairedHAPAccessory *v50;
  void *v51;
  HMDAccessoryBrowser *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  _BOOL4 v62;
  void *v63;
  id v64;
  void *v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  void *v67;
  void *v68;
  char v69;
  HMDAddAccessoryProgressState *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  HMDAddAccessoryProgressState *v75;
  void *v76;
  id v77;
  HMDUnpairedHAPAccessory *v78;
  id v79;
  id v80;
  void *v81;
  int v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  _QWORD v94[7];
  _BYTE buf[12];
  __int16 v96;
  HMDUnpairedHAPAccessory *v97;
  __int16 v98;
  HMDUnpairedHAPAccessory *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser unpairedAccessoryWithServerIdentifier:](self, "unpairedAccessoryWithServerIdentifier:", v6);
  v7 = (HMDUnpairedHAPAccessory *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "linkType");
      if (v12 > 2)
        v13 = CFSTR("Undefined");
      else
        v13 = off_24E780090[v12];
      v23 = v13;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v11;
      v96 = 2112;
      v97 = (HMDUnpairedHAPAccessory *)v23;
      v98 = 2112;
      v99 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Found accessory server (transport %@) for unpaired accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDUnpairedHAPAccessory addAccessoryServer:](v7, "addAccessoryServer:", v4);
    -[HMDAccessoryBrowser _associateMediaAccessoryForServer:](v9, "_associateMediaAccessoryForServer:", v4);
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](v9, "_pairingInformationForUnpairedAccessory:", v7);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      v24 = objc_msgSend(v89, "linkType");
      if (v24 == objc_msgSend(v4, "linkType"))
      {
        v25 = v4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
        v87 = v26;

        if (v87)
        {
          objc_msgSend(v89, "setWacAccessory:", objc_msgSend(v87, "isWacAccessory"));
          v27 = objc_msgSend(v89, "setLegacyWAC:", objc_msgSend(v87, "isWacLegacy"));
        }
        v28 = (void *)MEMORY[0x227676638](v27);
        v29 = v9;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v31;
          v96 = 2112;
          v97 = v7;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Restarting the pairing process for unpaired accessory: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        objc_msgSend(v89, "pairingActivity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v90[0] = MEMORY[0x24BDAC760];
        v90[1] = 3221225472;
        v90[2] = __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke_388;
        v90[3] = &unk_24E79BBD0;
        v85 = v32;
        v91 = v85;
        v33 = v89;
        v92 = v33;
        v83 = v25;
        v93 = v83;
        __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke_388(v90);
        objc_msgSend(v33, "addAccessoryProgressHandler");
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v34)
          goto LABEL_25;
        -[HMDUnassociatedAccessory uuid](v7, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](v29, "_progressHandlerForUnpairedAccessory:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "progressHandler");
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v34)
        {
LABEL_25:
          v37 = [HMDAddAccessoryProgressState alloc];
          -[HMDUnassociatedAccessory uuid](v7, "uuid");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUnassociatedAccessory name](v7, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUnassociatedAccessory category](v7, "category");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "productData");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v37, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v38, v39, 0, v40, 0, v41);

          ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v34)[2](v34, 11, v42);
        }
        objc_msgSend(v85, "begin");
        v43 = v85;
        *(_QWORD *)buf = v43;
        objc_msgSend(v33, "pairingRequest");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "startPairingWithRequest:", v44);

        __HMFActivityScopeLeave();
      }
    }
    -[HMDAccessoryBrowser _handleAddedAccessory:](v9, "_handleAddedAccessory:", v7);
  }
  else
  {
    v14 = [HMDUnpairedHAPAccessory alloc];
    -[HMDAccessoryBrowser messageDispatcher](self, "messageDispatcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDUnpairedHAPAccessory initWithAccessoryServer:messageDispatcher:](v14, "initWithAccessoryServer:messageDispatcher:", v4, v15);

    -[HMDAccessoryBrowser unpairedAccessoryManagerDelegate](self, "unpairedAccessoryManagerDelegate");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_msgSend(v89, "updatedUUIDForDiscoveredUnpairedAccessory:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[HMDUnassociatedAccessory setUUID:](v7, "setUUID:", v16);

    }
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v4, "linkType");
      if (v21 > 2)
        v22 = CFSTR("Undefined");
      else
        v22 = off_24E780090[v21];
      v45 = v22;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v20;
      v96 = 2112;
      v97 = v7;
      v98 = 2112;
      v99 = (HMDUnpairedHAPAccessory *)v45;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Found new unpaired accessory: %@ with transport %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDAccessoryBrowser addUnpairedHAPAccessory:](v18, "addUnpairedHAPAccessory:", v7);
    -[HMDAccessoryBrowser _associateMediaAccessoryForServer:](v18, "_associateMediaAccessoryForServer:", v4);
    v46 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v47 = v46;
    else
      v47 = 0;
    v88 = v47;

    if (objc_msgSend(v88, "isWacAccessory"))
      -[HMDAccessoryBrowser _handleWACAccessoryFound](v18, "_handleWACAccessoryFound");
    v48 = v46;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v49 = v48;
    else
      v49 = 0;
    v86 = v49;

    if (v86)
      v82 = objc_msgSend(v86, "isLocallyDiscoveredServer") ^ 1;
    else
      LOBYTE(v82) = 0;
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](v18, "_pairingInformationForUnpairedAccessory:", v7);
    v50 = (HMDUnpairedHAPAccessory *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      v51 = (void *)MEMORY[0x227676638]();
      v52 = v18;
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v54;
        v96 = 2112;
        v97 = v7;
        v98 = 2112;
        v99 = v50;
        _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Starting the pairing process for unpaired accessory: %@ matching setup description %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v51);
      -[HMDUnpairedHAPAccessory accessoryName](v50, "accessoryName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55 == 0;

      if (v56)
      {
        -[HMDUnassociatedAccessory name](v7, "name");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUnpairedHAPAccessory setAccessoryName:](v50, "setAccessoryName:", v57);

      }
      -[HMDUnpairedHAPAccessory accessoryUUID](v50, "accessoryUUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58 == 0;

      if (v59)
      {
        -[HMDUnassociatedAccessory uuid](v7, "uuid");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUnpairedHAPAccessory setAccessoryUUID:](v50, "setAccessoryUUID:", v60);

      }
      -[HMDUnpairedHAPAccessory accessoryServerIdentifier](v50, "accessoryServerIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v61 == 0;

      if (v62)
      {
        -[HMDUnassociatedAccessory identifier](v7, "identifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUnpairedHAPAccessory setAccessoryServerIdentifier:](v50, "setAccessoryServerIdentifier:", v63);

      }
      if (!-[HMDUnpairedHAPAccessory linkType](v50, "linkType"))
        -[HMDUnpairedHAPAccessory setLinkType:](v50, "setLinkType:", objc_msgSend(v48, "linkType"));
      -[HMDUnpairedHAPAccessory setWacAccessory:](v50, "setWacAccessory:", objc_msgSend(v88, "isWacAccessory"));
      -[HMDUnpairedHAPAccessory setLegacyWAC:](v50, "setLegacyWAC:", objc_msgSend(v88, "isWacLegacy"));
      v64 = v48;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v65 = v64;
      else
        v65 = 0;
      v84 = v65;

      if (v84)
        -[HMDAccessoryBrowser _setupHMMTRAccessoryServer:pairingInfo:](v52, "_setupHMMTRAccessoryServer:pairingInfo:", v84, v50);
      -[HMDUnpairedHAPAccessory addAccessoryProgressHandler](v50, "addAccessoryProgressHandler");
      v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        -[HMDUnassociatedAccessory uuid](v7, "uuid");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](v52, "_progressHandlerForUnpairedAccessory:", v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "progressHandler");
        v66 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      }
      if (v66)
        v69 = v82;
      else
        v69 = 1;
      if ((v69 & 1) == 0)
      {
        v70 = [HMDAddAccessoryProgressState alloc];
        -[HMDUnassociatedAccessory uuid](v7, "uuid");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUnassociatedAccessory name](v7, "name");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUnassociatedAccessory category](v7, "category");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "productData");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v70, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v71, v72, 0, v73, 0, v74);

        ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v66)[2](v66, 2, v75);
      }
      -[HMDUnpairedHAPAccessory pairingActivity](v50, "pairingActivity");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = MEMORY[0x24BDAC760];
      v94[1] = 3221225472;
      v94[2] = __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke;
      v94[3] = &unk_24E79BBD0;
      v77 = v76;
      v94[4] = v77;
      v78 = v50;
      v94[5] = v78;
      v79 = v64;
      v94[6] = v79;
      __54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke(v94);
      objc_msgSend(v77, "begin");
      v80 = v77;
      *(_QWORD *)buf = v80;
      -[HMDUnpairedHAPAccessory pairingRequest](v78, "pairingRequest");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "startPairingWithRequest:", v81);

      __HMFActivityScopeLeave();
    }

  }
}

- (void)registerPairedAccessory:(id)a3 transports:(unint64_t)a4 setupHash:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDAccessoryBrowser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessoryBrowser *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAccessoryBrowser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDPairedAccessoryInformation *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!v10)
    goto LABEL_20;
  if (a4)
  {
    if ((a4 & 2) != 0)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v16;
        v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Registering BTLE accessory server %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDAccessoryBrowser btleAccessoryServerBrowser](v14, "btleAccessoryServerBrowser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "registerPairedAccessoryWithIdentifier:", v10);

    }
    if ((a4 & 0x10) != 0)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v21;
        v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Registering media accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDAccessoryBrowser mediaBrowser](v19, "mediaBrowser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "registerAccessories:", v23);

      goto LABEL_15;
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v27;
      v47 = 2112;
      v48 = v10;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Registering paired accessory: %@ with all browser types since transport type is none", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    -[HMDAccessoryBrowser btleAccessoryServerBrowser](v25, "btleAccessoryServerBrowser");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerPairedAccessoryWithIdentifier:", v10);

    -[HMDAccessoryBrowser mediaBrowser](v25, "mediaBrowser");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerAccessories:", v30);

    -[HMDAccessoryBrowser hap2AccessoryServerBrowser](v25, "hap2AccessoryServerBrowser");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "registerPairedAccessoryWithIdentifier:", v10);

    -[HMDAccessoryBrowser hap2Storage](v25, "hap2Storage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "registerPairedAccessoryWithIdentifier:", v10);

    -[HMDAccessoryBrowser ipAccessoryServerBrowser](v25, "ipAccessoryServerBrowser");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "registerPairedAccessoryWithIdentifier:", v10);

    -[HMDAccessoryBrowser chipAccessoryServerBrowser](v25, "chipAccessoryServerBrowser");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "registerPairedAccessoryWithIdentifier:", v10);

  }
  -[HMDAccessoryBrowser hap2AccessoryServerBrowser](self, "hap2AccessoryServerBrowser");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerPairedAccessoryWithIdentifier:", v10);

  -[HMDAccessoryBrowser hap2Storage](self, "hap2Storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerPairedAccessoryWithIdentifier:", v10);
LABEL_15:

  if ((a4 & 1) != 0)
  {
    v36 = (void *)MEMORY[0x227676638]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      v47 = 2112;
      v48 = v10;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Registering IP accessory server %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    -[HMDAccessoryBrowser ipAccessoryServerBrowser](v37, "ipAccessoryServerBrowser");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "registerPairedAccessoryWithIdentifier:", v10);

    -[HMDAccessoryBrowser chipAccessoryServerBrowser](v37, "chipAccessoryServerBrowser");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "registerPairedAccessoryWithIdentifier:", v10);

  }
  v42 = -[HMDPairedAccessoryInformation initWithIdentifier:transports:setupHash:delegate:]([HMDPairedAccessoryInformation alloc], "initWithIdentifier:transports:setupHash:delegate:", v10, a4, v11, v12);
  -[HMDAccessoryBrowser addPairedAccessory:](self, "addPairedAccessory:", v42);

LABEL_20:
}

- (void)deregisterPairedAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@De-registering accessory server %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccessoryBrowser removePairedAccessoryInfoWithIdentifier:](v6, "removePairedAccessoryInfoWithIdentifier:", v4);
    -[HMDAccessoryBrowser btleAccessoryServerBrowser](v6, "btleAccessoryServerBrowser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deRegisterAccessoryWithIdentifier:", v4);

    -[HMDAccessoryBrowser ipAccessoryServerBrowser](v6, "ipAccessoryServerBrowser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deRegisterAccessoryWithIdentifier:", v4);

    -[HMDAccessoryBrowser hap2AccessoryServerBrowser](v6, "hap2AccessoryServerBrowser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deRegisterAccessoryWithIdentifier:", v4);

    -[HMDAccessoryBrowser hap2Storage](v6, "hap2Storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deregisterPairedAccessoryWithIdentifier:", v4);

    -[HMDAccessoryBrowser chipAccessoryServerBrowser](v6, "chipAccessoryServerBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deRegisterAccessoryWithIdentifier:", v4);

    -[HMDAccessoryBrowser mediaBrowser](v6, "mediaBrowser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deregisterAccessories:", v15);

  }
}

- (void)addUnpairedAccessoryServer:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDAccessoryBrowser *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__HMDAccessoryBrowser_addUnpairedAccessoryServer_identifier___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)discoveredAccessoryServers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_discoveredAccessoryServerIdentifiers, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_addDiscoveredAccessoryServerIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableSet addObject:](self->_discoveredAccessoryServerIdentifiers, "addObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)_removeDiscoveredAccessoryServerIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSMutableSet removeObject:](self->_discoveredAccessoryServerIdentifiers, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)registerProgressHandler:(id)a3 unpairedAccessoryUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDAccessoryBrowser_registerProgressHandler_unpairedAccessoryUUID___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)pairAccessory:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__HMDAccessoryBrowser_pairAccessory_configuration_completionHandler___block_invoke;
  v15[3] = &unk_24E79B3F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)pairAccessoryWithDescription:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__HMDAccessoryBrowser_pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke;
  block[3] = &unk_24E7901A8;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (id)unpairedHAPAccessoryWithAccessoryDescription:(id)a3
{
  void *v4;
  void *v5;

  -[HMDAccessoryBrowser findAccessoryServerForAccessoryDescription:](self, "findAccessoryServerForAccessoryDescription:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removePairingInformationForAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAccessoryBrowser_removePairingInformationForAccessoryServer___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didReceiveUserConsentResponseForSetupAccessoryDetail:(id)a3 consent:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDAccessoryBrowser_didReceiveUserConsentResponseForSetupAccessoryDetail_consent___block_invoke;
  block[3] = &unk_24E799CF0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)handleSetupCodeAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryBrowser_handleSetupCodeAvailable___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelPairingWithAccessory:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__HMDAccessoryBrowser_cancelPairingWithAccessory_error_context___block_invoke;
  v15[3] = &unk_24E79A910;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_btleAccessoryReachabilityProbeTimer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_source_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  dispatch_time_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  HMDAccessoryBrowser *v25;
  NSObject *v26;
  void *v27;
  _QWORD handler[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  if (isBTLECapableDevice())
  {
    if (-[HMDAccessoryBrowser isBrowsingAllowed](self, "isBrowsingAllowed"))
    {
      -[HMDAccessoryBrowser reachabilityTimerForBTLE](self, "reachabilityTimerForBTLE");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[HMDAccessoryBrowser reachabilityTimerForBTLE](self, "reachabilityTimerForBTLE");
        v6 = objc_claimAutoreleasedReturnValue();
        dispatch_source_cancel(v6);

        -[HMDAccessoryBrowser setReachabilityTimerForBTLE:](self, "setReachabilityTimerForBTLE:", 0);
      }
      -[HMDAccessoryBrowser workQueue](self, "workQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);
      -[HMDAccessoryBrowser setReachabilityTimerForBTLE:](self, "setReachabilityTimerForBTLE:", v8);

      v9 = btleReachabilityLeewayNanoseconds;
      v10 = btleReachabilityTimerNanoseconds;
      if (v3)
        v11 = 0;
      else
        v11 = btleReachabilityTimerNanoseconds;
      v12 = dispatch_time(0, v11);
      -[HMDAccessoryBrowser homeManager](self, "homeManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "homes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "na_firstObjectPassingTest:", &__block_literal_global_392_196764);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v10 = btleReachabilityTimerNanoseconds / (unint64_t)btleReachabilityProbeReduceFactor;
        if (!v3)
          v12 = dispatch_time(0, btleReachabilityTimerNanoseconds / (unint64_t)btleReachabilityProbeReduceFactor);
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "shortDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v19;
          v32 = 2112;
          v33 = v20;
          v34 = 2048;
          v35 = v10 / 0x3B9ACA00;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@In home: %@ location probing reachability every %llu sec", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
      }
      isWatch();
      if (-[HMDAccessoryBrowser unitTestBTLEReachabilityInterval](self, "unitTestBTLEReachabilityInterval"))
      {
        v10 = -[HMDAccessoryBrowser unitTestBTLEReachabilityInterval](self, "unitTestBTLEReachabilityInterval");
        v9 = 0;
      }
      -[HMDAccessoryBrowser reachabilityTimerForBTLE](self, "reachabilityTimerForBTLE");
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v21, v12, v10, v9);

      objc_initWeak((id *)buf, self);
      -[HMDAccessoryBrowser reachabilityTimerForBTLE](self, "reachabilityTimerForBTLE");
      v22 = objc_claimAutoreleasedReturnValue();
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_393;
      handler[3] = &unk_24E797318;
      objc_copyWeak(&v29, (id *)buf);
      dispatch_source_set_event_handler(v22, handler);

      -[HMDAccessoryBrowser reachabilityTimerForBTLE](self, "reachabilityTimerForBTLE");
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v23);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to start BTLE reachability timer", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
    }
  }
}

- (void)_stopBtleAccessoryReachabilityProbeTimer
{
  void *v3;
  void *v4;
  HMDAccessoryBrowser *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (isBTLECapableDevice())
  {
    -[HMDAccessoryBrowser reachabilityTimerForBTLE](self, "reachabilityTimerForBTLE");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v7;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Suspending the BTLE reachability probe timer", (uint8_t *)&v9, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      -[HMDAccessoryBrowser reachabilityTimerForBTLE](v5, "reachabilityTimerForBTLE");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v8);

      -[HMDAccessoryBrowser setReachabilityTimerForBTLE:](v5, "setReachabilityTimerForBTLE:", 0);
    }
    -[HMDAccessoryBrowser _notifyDelegateOfReachabilityChangeChange:forBTLEAccessories:](self, "_notifyDelegateOfReachabilityChangeChange:forBTLEAccessories:", 0, 0);
  }
}

- (void)evaluateAccessoryDiscoveryState
{
  NSObject *v3;
  _QWORD block[5];

  if (isWatch())
  {
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HMDAccessoryBrowser_evaluateAccessoryDiscoveryState__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

- (void)_stopReprovisioningTimerHandler
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Stop reprovisioning timer fired", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Stopping browsing for WAC servers", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopDiscoveringWACAccessoryServersWithInvalidation:", 1);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](self, "identifierOfAccessoryBeingReprovisioned");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:error:](self, "_notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:error:", v14, v13);

  v15 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Clean up reprovisioning accessory", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDAccessoryBrowser setIdentifierOfAccessoryBeingReprovisioned:](self, "setIdentifierOfAccessoryBeingReprovisioned:", 0);
  -[HMDAccessoryBrowser setWiFiPSKForAccessoryReprovisioning:](self, "setWiFiPSKForAccessoryReprovisioning:", 0);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  _BOOL4 v14;
  id v15;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _QWORD v40[7];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBrowser stopReprovisioningTimer](self, "stopReprovisioningTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDAccessoryBrowser _stopReprovisioningTimerHandler](self, "_stopReprovisioningTimerHandler");
    goto LABEL_39;
  }
  -[HMDAccessoryBrowser stopBrowsingAccessoriesNeedingReprovisioningTimer](self, "stopBrowsingAccessoriesNeedingReprovisioningTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopDiscoveringWACAccessoryServersWithInvalidation:", 1);

    goto LABEL_39;
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (!v9)
    goto LABEL_38;
  v10 = *(_QWORD *)v46;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v46 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v12, "pairingInterruptionTimer");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v13 == v4;

      if (v14)
      {
        -[HMDAccessoryBrowser _unpairedAccessoryMatchingPairingInfo:](self, "_unpairedAccessoryMatchingPairingInfo:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser _handlePairingInterruptedTimeout:error:](self, "_handlePairingInterruptedTimeout:error:", v34, v20);
LABEL_37:

        goto LABEL_38;
      }
      objc_msgSend(v12, "reconfirmTimer");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v15 == v4;

      if (v16)
      {
        -[HMDAccessoryBrowser _unpairedAccessoryMatchingPairingInfo:](self, "_unpairedAccessoryMatchingPairingInfo:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v34, "accessoryServers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v42 != v22)
                objc_enumerationMutation(v20);
              v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
              v25 = objc_msgSend(v24, "linkType");
              if (v25 == objc_msgSend(v12, "linkType"))
              {
                objc_msgSend(v12, "pairingActivity");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v40[0] = MEMORY[0x24BDAC760];
                v40[1] = 3221225472;
                v40[2] = __36__HMDAccessoryBrowser_timerDidFire___block_invoke;
                v40[3] = &unk_24E79BBD0;
                v32 = v31;
                v40[4] = v32;
                v40[5] = v12;
                v40[6] = v24;
                __36__HMDAccessoryBrowser_timerDidFire___block_invoke(v40);
                objc_msgSend(v32, "begin");
                v39 = v32;
                objc_msgSend(v12, "pairingRequest");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "startPairingWithRequest:", v33);

                __HMFActivityScopeLeave();
                goto LABEL_37;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            if (v21)
              continue;
            break;
          }
        }
        goto LABEL_37;
      }
      objc_msgSend(v12, "pairingRetryTimer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v17 == v4;

      if (v18)
      {
        -[HMDAccessoryBrowser _unpairedAccessoryMatchingPairingInfo:](self, "_unpairedAccessoryMatchingPairingInfo:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v34, "accessoryServers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v36;
          while (2)
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v36 != v27)
                objc_enumerationMutation(v20);
              v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
              v30 = objc_msgSend(v29, "linkType");
              if (v30 == objc_msgSend(v12, "linkType"))
              {
                -[HMDAccessoryBrowser _promptForPairingPasswordForServer:reason:](self, "_promptForPairingPasswordForServer:reason:", v29, CFSTR("HMSetupCodeProviderReasontTimeoutRetry"));
                goto LABEL_37;
              }
            }
            v26 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
            if (v26)
              continue;
            break;
          }
        }
        goto LABEL_37;
      }
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v9)
      continue;
    break;
  }
LABEL_38:

LABEL_39:
}

- (void)_discoverAccessoryServer:(id)a3 linkType:(int64_t)a4 errorHandler:(id)a5
{
  __CFString *v8;
  void (**v9)(id, void *);
  void *v10;
  int v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a3;
  v9 = (void (**)(id, void *))a5;
  if (!v8)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)a4 > 2)
        v21 = CFSTR("Undefined");
      else
        v21 = off_24E780090[a4];
      v27 = v21;
      v30 = 138543618;
      v31 = v20;
      v32 = 2112;
      v33 = v27;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to discover accessory for link type: %@ due to missing server identifier", (uint8_t *)&v30, 0x16u);

    }
    goto LABEL_21;
  }
  switch(a4)
  {
    case 0:
      -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "discoverAccessoryServerWithIdentifier:", v8);

      goto LABEL_13;
    case 1:
LABEL_13:
      -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
      else
        -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 2:
      -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](self, "discoveringBLEAccessoryServerIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v8);

      if (v11)
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("BTLE");
          v30 = 138543874;
          v31 = v15;
          v32 = 2112;
          v33 = v8;
          v34 = 2112;
          v35 = CFSTR("BTLE");
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Retrieval already in progress for accessory with server %@/%@", (uint8_t *)&v30, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
LABEL_26:
        v28 = 0;
        if (!v9)
          goto LABEL_23;
        goto LABEL_22;
      }
      -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      v29 = v24;
      objc_msgSend(v24, "discoverAccessoryServerWithIdentifier:", v8);

      goto LABEL_26;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("Undefined");
    v30 = 138543874;
    v31 = v25;
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = CFSTR("Undefined");
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve server for accessory with identifier %@, due to unknown link type: %@", (uint8_t *)&v30, 0x20u);

  }
LABEL_21:

  objc_autoreleasePoolPop(v17);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
LABEL_22:
    v9[2](v9, v28);
LABEL_23:

}

- (void)currentlyFoundHAPAccessoryServerWithIdentifier:(id)a3 linkType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (a4 == 1)
    {
      -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 2)
      {
        v12 = (void *)MEMORY[0x227676638]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)a4 > 2)
            v16 = CFSTR("Undefined");
          else
            v16 = off_24E780090[a4];
          v17 = v16;
          *(_DWORD *)buf = 138543874;
          v21 = v15;
          v22 = 2112;
          v23 = v8;
          v24 = 2112;
          v25 = v17;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve server for identifier %@ for link type: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
        goto LABEL_14;
      }
      -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;
    if (v10)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __90__HMDAccessoryBrowser_currentlyFoundHAPAccessoryServerWithIdentifier_linkType_completion___block_invoke;
      v18[3] = &unk_24E790218;
      v19 = v9;
      objc_msgSend(v11, "matchAccessoryServerWithSetupID:serverIdentifier:completionHandler:", 0, v8, v18);

      goto LABEL_15;
    }
LABEL_14:
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }
LABEL_15:

}

- (void)_startDiscoveringPairedAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAccessoryBrowser areThereAnyPairedAccessories](self, "areThereAnyPairedAccessories"))
  {
    if (-[HMDAccessoryBrowser isBrowsingAllowed](self, "isBrowsingAllowed"))
    {
      if (!v4 || objc_msgSend(v4, "integerValue") == 1)
      {
        -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser _startDiscoveryForAccessoryServerBrowser:](self, "_startDiscoveryForAccessoryServerBrowser:", v5);

        -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser identifiersOfAssociatedMediaAccessories](self, "identifiersOfAssociatedMediaAccessories");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "updateSessionsForAccessories:", v7);

        -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          -[HMDAccessoryBrowser demoAccessoryServerBrowser](self, "demoAccessoryServerBrowser");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser _startDiscoveryForAccessoryServerBrowser:](self, "_startDiscoveryForAccessoryServerBrowser:", v9);

        }
        -[HMDAccessoryBrowser hap2AccessoryServerBrowser](self, "hap2AccessoryServerBrowser");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[HMDAccessoryBrowser hap2AccessoryServerBrowser](self, "hap2AccessoryServerBrowser");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser _startDiscoveryForAccessoryServerBrowser:](self, "_startDiscoveryForAccessoryServerBrowser:", v11);

        }
        -[HMDAccessoryBrowser chipAccessoryServerBrowser](self, "chipAccessoryServerBrowser");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[HMDAccessoryBrowser chipAccessoryServerBrowser](self, "chipAccessoryServerBrowser");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser _startDiscoveryForAccessoryServerBrowser:](self, "_startDiscoveryForAccessoryServerBrowser:", v13);

        }
      }
      if (-[HMDAccessoryBrowser areThereAnyPairedBTLEAccessories](self, "areThereAnyPairedBTLEAccessories")
        || -[HMDAccessoryBrowser areThereAnyPairedUnknownLinkTypeAccessories](self, "areThereAnyPairedUnknownLinkTypeAccessories"))
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543362;
          v23 = v17;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Have paired BTLE accessories, starting reachability scan", (uint8_t *)&v22, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        -[HMDAccessoryBrowser _btleAccessoryReachabilityProbeTimer:](v15, "_btleAccessoryReachabilityProbeTimer:", 1);
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring request for start discovering paired accessories", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
    }
  }

}

- (void)_startDiscoveringAccessoriesWithLinkType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAccessoryBrowser isBrowsingAllowed](self, "isBrowsingAllowed"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
          if (!v4
            || (v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "linkType"),
                v11 == objc_msgSend(v4, "integerValue")))
          {
            -[HMDAccessoryBrowser _startDiscoveryForAccessoryServerBrowser:](self, "_startDiscoveryForAccessoryServerBrowser:", v10);
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    if (-[HMDAccessoryBrowser __isAccessoryBrowsingRequested](self, "__isAccessoryBrowsingRequested"))
    {
      if (v4 && objc_msgSend(v4, "integerValue") != 1)
      {
        -[HMDAccessoryBrowser __isMediaAccessoryBrowsingRequested](self, "__isMediaAccessoryBrowsingRequested");
        goto LABEL_22;
      }
      -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startDiscoveringWACAccessoryServers");

    }
    v13 = -[HMDAccessoryBrowser __isMediaAccessoryBrowsingRequested](self, "__isMediaAccessoryBrowsingRequested");
    if (!v4 && v13)
      -[HMDAccessoryBrowser _startDiscoveringMediaAccessories](self, "_startDiscoveringMediaAccessories");
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to start discovering accessories because browsing is not allowed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
LABEL_22:

}

- (void)_startDiscoveryForAccessoryServerBrowser:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "startDiscoveringAccessoryServers");
  -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isEqual:", v4);

  if (v5)
  {
    -[HMDAccessoryBrowser chipAccessoryServerBrowser](self, "chipAccessoryServerBrowser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startBluetoothScan");

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDAccessoryBrowser discoveringAccessoryServerBrowsers](self, "discoveringAccessoryServerBrowsers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  os_unfair_lock_unlock(p_lock);
}

- (void)_startDiscoveringMediaAccessories
{
  void *v3;
  void *v4;
  id v5;

  -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDiscoveringUnassociatedAccessories");

  -[HMDAccessoryBrowser wacBrowser](self, "wacBrowser");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startBrowsingForAirPlayWACAccessoriesWithBrowser:", v4);

}

- (void)_stopDiscoveringMediaAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopDiscoveringUnassociatedAccessories");

  -[HMDAccessoryBrowser wacBrowser](self, "wacBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopBrowsingForAccessories");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HMDAccessoryBrowser unassociatedMediaAccessories](self, "unassociatedMediaAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[HMDAccessoryBrowser removeUnassociatedMediaAccessory:](self, "removeUnassociatedMediaAccessory:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_stopDiscoveringAccessoriesWithLinkType:(id)a3 force:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    if (!-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v8, 1))
      goto LABEL_4;
    goto LABEL_3;
  }
  -[HMDAccessoryBrowser _stopDiscoveringMediaAccessories](self, "_stopDiscoveringMediaAccessories");
  if (self)
  {
LABEL_3:
    -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopDiscoveringWACAccessoryServersWithInvalidation:", 1);

  }
LABEL_4:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v8, objc_msgSend(v17, "linkType"))
          && (a4
           || !-[HMDAccessoryBrowser areThereAnyPairedAccessories](self, "areThereAnyPairedAccessories")
           || objc_msgSend(v17, "linkType") != 1))
        {
          -[HMDAccessoryBrowser _stopDiscoveryForAccessoryServerBrowser:](self, "_stopDiscoveryForAccessoryServerBrowser:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v14);
  }

  if (v9)
    v18 = objc_msgSend(v9, "code");
  else
    v18 = 2504;
  -[HMDAccessoryBrowser _cancelCurrentlyPairingAccessories:linkType:](self, "_cancelCurrentlyPairingAccessories:linkType:", v18, v8);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HMDAccessoryBrowser unpairedHAPAccessories](self, "unpairedHAPAccessories", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        if ((objc_msgSend(v25, "hasIPLink") & 1) == 0)
          -[HMDAccessoryBrowser removeUnpairedHAPAccessory:](self, "removeUnpairedHAPAccessory:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v22);
  }

  -[HMDAccessoryBrowser __resetBrowsingConnections](self, "__resetBrowsingConnections");
}

- (void)_stopDiscoveringAccessoriesWithError:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessoryBrowser _stopDiscoveringAccessoriesWithLinkType:force:error:](self, "_stopDiscoveringAccessoriesWithLinkType:force:error:", 0, 0, v5);
}

- (void)startDiscoveringAccessoriesNeedingReprovisioning
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDAccessoryBrowser_startDiscoveringAccessoriesNeedingReprovisioning__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startDiscoveringAccessoriesNeedingReprovisioning
{
  void *v3;
  void *v4;
  HMDAccessoryBrowser *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[HMDAccessoryBrowser isBrowsingAllowed](self, "isBrowsingAllowed"))
  {
    -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](self, "identifierOfAccessoryBeingReprovisioned");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v7;
        v8 = "%{public}@Ignoring request for start discovering accessories need reprovision since provisioing is already in progress";
LABEL_7:
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v19, 0xCu);

        goto LABEL_8;
      }
      goto LABEL_8;
    }
    -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](self, "identifierOfAccessoryBeingReprovisioned");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x227676638]();
      if (v10)
      {
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v14 = objc_claimAutoreleasedReturnValue();
          v19 = 138543362;
          v20 = v14;
          v15 = "%{public}@Unable to start discovering accessories need reprovision since provisioing is in progress";
LABEL_16:
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, 0xCu);

        }
      }
      else
      {
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v17 = objc_claimAutoreleasedReturnValue();
          v19 = 138543362;
          v20 = v17;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Start discovering accessories need reprovision", (uint8_t *)&v19, 0xCu);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v9, "startDiscoveringWACAccessoryServers");
        -[HMDAccessoryBrowser stopBrowsingAccessoriesNeedingReprovisioningTimer](self, "stopBrowsingAccessoriesNeedingReprovisioningTimer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "resume");

        v11 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v12 = (HMDAccessoryBrowser *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        HMFGetLogIdentifier();
        v13 = objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v13;
        _os_log_impl(&dword_2218F0000, &v12->super.super, OS_LOG_TYPE_INFO, "%{public}@Started the stop browsing accessories needing reprovisioning timer", (uint8_t *)&v19, 0xCu);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = objc_claimAutoreleasedReturnValue();
        v19 = 138543362;
        v20 = v14;
        v15 = "%{public}@Unable to start discovering accessories need reprovision without a IP accessory server browser";
        goto LABEL_16;
      }
    }

LABEL_22:
    objc_autoreleasePoolPop(v11);

    return;
  }
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v7;
    v8 = "%{public}@Ignoring request for start discovering accessories need reprovision since browsing is not allowed";
    goto LABEL_7;
  }
LABEL_8:

  objc_autoreleasePoolPop(v4);
}

- (void)_restartBrowsers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  HMDAccessoryBrowser *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessoryBrowser *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[HMDAccessoryBrowser accessoryServerBrowsers](self, "accessoryServerBrowsers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "recommendBrowserReset");
          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
          if (v12)
          {
            if (v16)
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "description");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v32 = v17;
              v33 = 2112;
              v34 = v18;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Restarting browser %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v13);
            objc_msgSend(v11, "stopDiscoveringAccessoryServers");
            objc_msgSend(v11, "startDiscoveringAccessoryServers");
          }
          else
          {
            if (v16)
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "description");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v32 = v19;
              v33 = 2112;
              v34 = v20;
              _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping Restarting browser %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v13);
          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v8);
    }

    v4 = v25;
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@No accessory browsers yet --- reset request ignored", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)restartBrowsers
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HMDAccessoryBrowser_restartBrowsers__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleConnectionUpdateWithBonjourDeviceInfo:(id)a3 socketInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleConnectionUpdateWithBonjourDeviceInfo:socketInfo:", v7, v6);

}

- (void)discoverAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HMDAccessoryBrowser_discoverAccessories___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)tombstoneAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryBrowser_tombstoneAccessoryServer___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)resurrectAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDAccessoryBrowser_resurrectAccessoryServer___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setManagerDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_managerDelegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDAccessoryBrowserUnpairedAccessoryManagerDelegate)unpairedAccessoryManagerDelegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_unpairedAccessoryManagerDelegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDAccessoryBrowserUnpairedAccessoryManagerDelegate *)WeakRetained;
}

- (void)setUnpairedAccessoryManagerDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_unpairedAccessoryManagerDelegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_registerForMessages
{
  void *v3;
  HMDAccessoryBrowser *v4;
  NSObject *v5;
  void *v6;
  HMDRemoteAccountMessageFilter *v7;
  void *v8;
  HMDRemoteAccountMessageFilter *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering remote account message filter", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = [HMDRemoteAccountMessageFilter alloc];
  -[HMDAccessoryBrowser messageDestination](v4, "messageDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDRemoteAccountMessageFilter initWithTarget:](v7, "initWithTarget:", v8);

  -[HMDAccessoryBrowser homeManager](v4, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "msgFilterChain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addMessageFilter:", v9);

  -[HMDAccessoryBrowser messageDispatcher](v4, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "productPlatform");

  if (v14 == 1)
    v15 = 5;
  else
    v15 = 1;
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", CFSTR("kFetchNewAccessoriesRequestKey"), v4, v17, sel__handleRequestFetchNewAccessories_);
  objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", CFSTR("kSearchForNewAccessoriesRequestKey"), v4, v17, sel__handleRequestSearchForNewAccessories_);

}

- (void)_registerForNotifications
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel___handleProcessStateChange_, CFSTR("HMDProcessInfoStateDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_handleXPCConnectionInvalidated_, CFSTR("HMDXPCClientConnectionInvalidatedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleCurrentWiFiNetworkChangedNotification_, *MEMORY[0x24BE3F130], 0);

}

- (void)_cancelCurrentlyPairingAccessories:(int64_t)a3 linkType:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessoryBrowser *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAccessoryBrowser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  int64_t v48;
  void *v49;
  void *v50;
  HMDAccessoryBrowser *v51;
  id obj;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  _BYTE v72[128];
  uint64_t v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v57 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v48 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD1540];
  v73 = *MEMORY[0x24BDD1398];
  v74[0] = v7;
  v56 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmErrorWithCode:userInfo:", 79, v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  obj = v11;
  v55 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v59;
    *(_QWORD *)&v12 = 138543874;
    v47 = v12;
    v51 = self;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v59 != v54)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        -[HMDAccessoryBrowser _unpairedAccessoryMatchingPairingInfo:](self, "_unpairedAccessoryMatchingPairingInfo:", v14, v47);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDMatterAccessoryPairingEndContext hmdContextWithCancelledError:](HMDMatterAccessoryPairingEndContext, "hmdContextWithCancelledError:", v56);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          if (-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v57, objc_msgSend(v15, "linkType")))
          {
            v17 = (void *)MEMORY[0x227676638]();
            v18 = self;
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "hmStringFromErrorCode:", v48);
              v53 = v17;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v63 = v20;
              v64 = 2112;
              v65 = v21;
              v66 = 2112;
              v67 = v22;
              v68 = 2112;
              v69 = v23;
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@%@ - sending addAccessory failure for accessory %@/%@", buf, 0x2Au);

              self = v51;
              v17 = v53;

            }
            objc_autoreleasePoolPop(v17);
            if (objc_msgSend(v15, "supportsCHIP"))
              v24 = v16;
            else
              v24 = 0;
            -[HMDAccessoryBrowser _cancelPairingWithAccessory:error:context:](v18, "_cancelPairingWithAccessory:error:context:", v15, v49, v24);
LABEL_18:
            -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "removeObject:", v14);

            objc_msgSend(v14, "accessoryUUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](self, "_progressHandlerForUnpairedAccessory:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              -[HMDAccessoryBrowser currentlyPairingProgressHandlers](self, "currentlyPairingProgressHandlers");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "removeObject:", v34);

            }
            goto LABEL_24;
          }
        }
        else if (-[HMDAccessoryBrowser doesLinkTypeNumber:matchLinkType:]((uint64_t)self, v57, objc_msgSend(v14, "linkType")))
        {
          v25 = (void *)MEMORY[0x227676638]();
          v26 = self;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "accessoryName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "accessoryUUID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v47;
            v63 = v28;
            v64 = 2112;
            v65 = v29;
            v66 = 2112;
            v67 = v30;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Removing pending pairing for accessory %@/%@", buf, 0x20u);

            self = v51;
          }

          objc_autoreleasePoolPop(v25);
          v31 = (void *)objc_msgSend(v56, "copy");
          -[HMDAccessoryBrowser _removePairingInformation:error:context:](v26, "_removePairingInformation:error:context:", v14, v31, v16);

          goto LABEL_18;
        }
        v36 = (void *)MEMORY[0x227676638]();
        v37 = self;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accessoryName");
          v50 = v36;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accessoryUUID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "linkType"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v63 = v39;
          v64 = 2112;
          v65 = v40;
          v66 = 2112;
          v67 = v41;
          v68 = 2112;
          v69 = v42;
          v70 = 2112;
          v71 = v57;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Not canceling pairing for accessory %@/%@ as link type %@ does not match stopped link type %@", buf, 0x34u);

          self = v51;
          v36 = v50;

        }
        objc_autoreleasePoolPop(v36);
LABEL_24:

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v55);
  }

  if (!v57)
  {
    -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeAllObjects");

    -[HMDAccessoryBrowser currentlyPairingProgressHandlers](self, "currentlyPairingProgressHandlers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "removeAllObjects");

  }
  -[HMDAccessoryBrowser getActiveWACSession](self, "getActiveWACSession");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
    objc_msgSend(v45, "cancelConfigurationWithCompletionHandler:", &__block_literal_global_415_196737);

}

- (void)_handleCurrentWiFiNetworkChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  +[HMDThreadNetworkMetadataStore defaultStore](HMDThreadNetworkMetadataStore, "defaultStore", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__HMDAccessoryBrowser__handleCurrentWiFiNetworkChangedNotification___block_invoke;
    v6[3] = &unk_24E79BD80;
    v6[4] = self;
    objc_msgSend(v4, "triggerPreferredNetworkUpdateWithCompletion:", v6);
  }

}

- (void)_handleRequestFetchNewAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  const __CFString *v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kConfigGenerationCounterKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
    v8 = -[HMDAccessoryBrowser generationCounter](self, "generationCounter");
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v7 == v8)
    {
      if (v12)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v13;
        v38 = 2048;
        v39 = -[HMDAccessoryBrowser generationCounter](v10, "generationCounter");
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory browser's generation counter matches client's value of %lu", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v42 = CFSTR("kConfigGenerationCounterKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessoryBrowser generationCounter](v10, "generationCounter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v37 = v17;
        v38 = 2048;
        v39 = -[HMDAccessoryBrowser generationCounter](v10, "generationCounter");
        v40 = 2048;
        v41 = objc_msgSend(v6, "unsignedIntegerValue");
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory browser's generation counter %lu does not match client's value of %lu", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDAccessoryBrowser unassociatedAccessoriesForClientRequest:](v10, "unassociatedAccessoriesForClientRequest:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      encodeRootObjectForIncomingXPCMessage(v18, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = v14;
      v34[0] = CFSTR("kAccessoriesInfoDataKey");
      v34[1] = CFSTR("kConfigGenerationCounterKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessoryBrowser generationCounter](v10, "generationCounter"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "respondWithPayload:", v15);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[HMDAccessoryBrowser unassociatedAccessories](v10, "unassociatedAccessories", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v26 = v25;
          else
            v26 = 0;
          v27 = v26;

          if (objc_msgSend(v27, "hasIPLink"))
          {
            objc_msgSend(v27, "preferredAccessoryServer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "reconfirm");

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v22);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v16);

  }
}

- (void)_handleRequestSearchForNewAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v19;
  id v20;
  void *v21;
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v22;
  void *v23;
  HMDAccessoryBrowser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessoryBrowser *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDAccessoryBrowser *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  const __CFString *v38;
  HMDAccessoryBrowserXPCMessageSendPolicyParameters *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "messagePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("kStartSearch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "transport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      v11 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kStartSearch"));
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (!v11)
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v27;
          v42 = 2112;
          v43 = v10;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request to stop searching for new accessories for XPC connection: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v4, "errorForKey:", CFSTR("kStopSearchReason"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (!v20 || (objc_msgSend(v4, "isEntitledForSPIAccess") & 1) != 0)
        {
          -[HMDAccessoryBrowser _removeBrowsingConnection:error:](v13, "_removeBrowsingConnection:error:", v10, v20);
          v19 = -[HMDAccessoryBrowserXPCMessageSendPolicyParameters initWithEntitlements:browsing:]([HMDAccessoryBrowserXPCMessageSendPolicyParameters alloc], "initWithEntitlements:browsing:", objc_msgSend(v10, "entitlements"), 0);
          objc_msgSend(v10, "updateSendPolicyParameters:", v19);
          v21 = 0;
          goto LABEL_20;
        }
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v13;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v35;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Received invalid request to stop searching for new accessories with stop reason", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 80);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v36);

LABEL_25:
        goto LABEL_26;
      }
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v16;
        v42 = 2112;
        v43 = v10;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request to start searching for new accessories for XPC connection: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v4, "proxyConnection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "processInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      objc_msgSend(v18, "clientIdentifierSalt:", &v37);
      v19 = (HMDAccessoryBrowserXPCMessageSendPolicyParameters *)objc_claimAutoreleasedReturnValue();
      v20 = v37;

      if (v19)
      {
        v38 = CFSTR("kIdentifierSaltKey");
        v39 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser __addBrowsingConnection:](v13, "__addBrowsingConnection:", v10);
        v22 = -[HMDAccessoryBrowserXPCMessageSendPolicyParameters initWithEntitlements:browsing:]([HMDAccessoryBrowserXPCMessageSendPolicyParameters alloc], "initWithEntitlements:browsing:", objc_msgSend(v10, "entitlements"), 1);
        objc_msgSend(v10, "updateSendPolicyParameters:", v22);

LABEL_20:
        objc_msgSend(v4, "respondWithPayload:", v21);

LABEL_26:
        goto LABEL_27;
      }
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v13;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v31;
        v42 = 2112;
        v43 = v20;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot search for new accessories because client identifier salt could not be determined: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "respondWithError:", v20);
    goto LABEL_25;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v41 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Received invalid message in _handleRequestSearchForNewAccessories", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
LABEL_27:

}

- (void)_setBTLEPowerChangeCompletionHandler
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __59__HMDAccessoryBrowser__setBTLEPowerChangeCompletionHandler__block_invoke;
  v8 = &unk_24E790260;
  objc_copyWeak(&v9, &location);
  v3 = _Block_copy(&v5);
  -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReachabilityCompletionHandler:", v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)unpairedAccessoryWithServerIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessoryBrowser unpairedHAPAccessories](self, "unpairedHAPAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)unpairedAccessoryForServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser unpairedAccessoryWithServerIdentifier:](self, "unpairedAccessoryWithServerIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_notifyManagerOfNewAccessory
{
  void *v3;
  void *v4;
  HMDAccessoryBrowser *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBrowser managerDelegate](self, "managerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying Home manager that a new unpaired accessory was discovered", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "accessoryBrowserDidFindNewAccessory");
  }

}

- (void)_handleSetupCodeAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "provideNetworkCredentialsToAccessory"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "accessoryServers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "linkType");
          if (v13 == objc_msgSend(v6, "linkType"))
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = self;
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "UUIDString");
              v21 = v14;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v27 = v17;
              v28 = 2112;
              v29 = v18;
              v30 = 2112;
              v31 = v20;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@WAC accessory %@/%@: continuing pairing after setup code has been provided", buf, 0x20u);

              v14 = v21;
            }

            objc_autoreleasePoolPop(v14);
            objc_msgSend(v12, "continuePairingAfterAuthPrompt");
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    objc_msgSend(v6, "setSetupCodeProvided:", 1);
  }

}

- (void)_cancelPairingWithAccessory:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  HMDAccessoryBrowser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  HMDAccessoryBrowser *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  HMDAccessoryBrowser *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  HMDAccessoryBrowser *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  id v60;
  HMDAccessoryBrowser *v61;
  void *v62;
  void *v63;
  id obj;
  void (**v65)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void (**v66)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v69 = v8;
  if (objc_msgSend(v8, "supportsCHIP"))
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v75 = v16;
      v76 = 2112;
      v77 = v9;
      v78 = 2112;
      v79 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Cancel pairing matter accessory with error %@ context %@", buf, 0x20u);

      v10 = v15;
    }

    objc_autoreleasePoolPop(v12);
  }
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v69);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAccessoryCompletionHandler");
  v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v60 = v9;
  v62 = v17;
  if (!v18)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v75 = v22;
      v76 = 2112;
      v77 = v23;
      v78 = 2112;
      v79 = v24;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Cancel pairing with accessory but addAccessoryCompletion is nil %@/%@", buf, 0x20u);

      v18 = 0;
    }

    objc_autoreleasePoolPop(v19);
    v9 = v60;
    v17 = v62;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v69, "accessoryServers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = self;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v71;
    *(_QWORD *)&v25 = 138544386;
    v59 = v25;
    do
    {
      for (i = 0; i != v68; ++i)
      {
        if (*(_QWORD *)v71 != v67)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        if (v17)
        {
          v28 = objc_msgSend(v17, "linkType");
          v29 = v28 == objc_msgSend(v27, "linkType");
        }
        else
        {
          v29 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v17 != 0;
        else
          v30 = v29;
        if (v30)
        {
          if (objc_msgSend(v27, "isPaired"))
          {
            v31 = (void *)MEMORY[0x227676638]();
            v32 = self;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v31;
              objc_msgSend(v69, "name");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "uuid");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "UUIDString");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "identifier");
              v65 = v18;
              v38 = v10;
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v75 = v34;
              v76 = 2112;
              v77 = v35;
              v78 = 2112;
              v79 = v37;
              v80 = 2112;
              v81 = v39;
              _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Cancelling pairing of the accessory that completed pair-setup: %@/%@/%@", buf, 0x2Au);

              v10 = v38;
              v18 = v65;

              v31 = v63;
              self = v61;

              v17 = v62;
              v9 = v60;
            }

            objc_autoreleasePoolPop(v31);
          }
          if (objc_msgSend(v69, "supportsCHIP", v59) && !v10)
          {
            +[HMDMatterAccessoryPairingEndContext hmContextWithCancelledError:](HMDMatterAccessoryPairingEndContext, "hmContextWithCancelledError:", v9);
            v10 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (v18)
          {
            if (objc_msgSend(v69, "supportsCHIP"))
            {
              v66 = v18;
              v40 = (void *)MEMORY[0x227676638]();
              v41 = self;
              HMFGetOSLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "name");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "uuid");
                v45 = v10;
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v59;
                v75 = v43;
                v76 = 2112;
                v77 = v44;
                v78 = 2112;
                v79 = v46;
                v80 = 2112;
                v81 = v9;
                v82 = 2112;
                v83 = v45;
                _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Calling addAccessoryCompletion for unpaired accessory %@/%@, error %@, context %@", buf, 0x34u);

                v10 = v45;
                v17 = v62;

                self = v61;
              }

              objc_autoreleasePoolPop(v40);
              v18 = v66;
            }
            objc_msgSend(v69, "uuid");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, void *, uint64_t, uint64_t, uint64_t, id, id))v18)[2](v18, v27, v47, objc_msgSend(v69, "certificationStatus"), objc_msgSend(v17, "wacAccessory"), objc_msgSend(v17, "legacyWAC"), v9, v10);

          }
          objc_msgSend(v27, "stopPairingWithError:", 0);
          v18 = 0;
        }
      }
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v84, 16);
    }
    while (v68);
  }

  if (v18)
  {
    if (objc_msgSend(v69, "supportsCHIP"))
    {
      v48 = (void *)MEMORY[0x227676638]();
      v49 = self;
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "name");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "uuid");
        v53 = v10;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v75 = v51;
        v76 = 2112;
        v77 = v52;
        v78 = 2112;
        v79 = v54;
        v80 = 2112;
        v81 = v60;
        v82 = 2112;
        v83 = v53;
        _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Calling addAccessoryCompletion explicitly because accessoryServer went away %@/%@, error %@, context %@", buf, 0x34u);

        v10 = v53;
        self = v61;

      }
      objc_autoreleasePoolPop(v48);
      v9 = v60;
      v17 = v62;
    }
    objc_msgSend(v69, "uuid", v59);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, uint64_t, uint64_t, uint64_t, id, id))v18)[2](v18, 0, v55, objc_msgSend(v69, "certificationStatus"), objc_msgSend(v17, "wacAccessory"), objc_msgSend(v17, "legacyWAC"), v9, v10);

  }
  -[HMDAccessoryBrowser _removePairingInformationForUnpairedAccessory:](self, "_removePairingInformationForUnpairedAccessory:", v69, v59);
  objc_msgSend(v69, "identifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser removePairedAccessoryInfoWithIdentifier:](self, "removePairedAccessoryInfoWithIdentifier:", v56);

  objc_msgSend(v69, "accessoryServers");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  if (!v58)
    -[HMDAccessoryBrowser removeUnpairedHAPAccessory:](self, "removeUnpairedHAPAccessory:", v69);

}

- (id)findAccessoryServerForAccessoryDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDAccessoryBrowser unpairedHAPAccessories](self, "unpairedHAPAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accessoryUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v10, "preferredAccessoryServer");
          v20 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v10, "accessoryServers", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v23;
LABEL_9:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
            if ((objc_msgSend(v4, "matchesAccessoryServer:", v19) & 1) != 0)
              break;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v16)
                goto LABEL_9;
              goto LABEL_15;
            }
          }
          v20 = v19;

          if (v20)
            goto LABEL_22;
        }
        else
        {
LABEL_15:

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v20 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_22:

  return v20;
}

- (id)currentControllerPairingIdentity
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bgOpsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getHH2ControllerKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4
{
  -[HMDAccessoryBrowser cancelPairingWithAccessoryDescription:error:context:](self, "cancelPairingWithAccessoryDescription:error:context:", a3, a4, 0);
}

- (void)cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__HMDAccessoryBrowser_cancelPairingWithAccessoryDescription_error_context___block_invoke;
  v15[3] = &unk_24E79A910;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_cancelPairingWithAccessoryDescription:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  HMDAccessoryBrowser *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDAccessoryBrowser *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v8, "cancellationReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_5;
  if (objc_msgSend(v12, "isHMError"))
  {
    +[HMDMatterAccessoryPairingEndContext hmContextWithCancelledError:](HMDMatterAccessoryPairingEndContext, "hmContextWithCancelledError:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v14;
  }
  if ((objc_msgSend(v13, "isHMError") & 1) == 0)
  {
LABEL_5:
    v15 = v9;

    v13 = v15;
  }
  -[HMDAccessoryBrowser unpairedHAPAccessoryWithAccessoryDescription:](self, "unpairedHAPAccessoryWithAccessoryDescription:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[HMDAccessoryBrowser _cancelPairingWithAccessory:error:context:](self, "_cancelPairingWithAccessory:error:context:", v16, v13, v10);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v20;
      v46 = 2112;
      v47 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@There is no unpaired accessory for %@ - removing with pairingInfo", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[HMDAccessoryBrowser currentlyPairingAccessories](v18, "currentlyPairingAccessories");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v23)
    {
      v24 = v23;
      v37 = v18;
      v38 = v10;
      v39 = v9;
      v25 = *(_QWORD *)v41;
LABEL_12:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v26);
        objc_msgSend(v27, "setupID", v37);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "accessoryServerIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v8, "matchesSetupID:serverIdentifier:", v28, v29);

        if ((v30 & 1) != 0)
          break;
        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          if (v24)
            goto LABEL_12;
          v31 = v22;
          v10 = v38;
          v9 = v39;
          v16 = 0;
          goto LABEL_24;
        }
      }
      v31 = v27;

      v10 = v38;
      v9 = v39;
      v16 = 0;
      if (!v31)
        goto LABEL_25;
      v32 = (void *)MEMORY[0x227676638]();
      v33 = v37;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "debugDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v35;
        v46 = 2112;
        v47 = v36;
        v48 = 2112;
        v49 = v31;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Accessory description %@ matches accessory pending to be paired %@ - aborting the operation", buf, 0x20u);

        v10 = v38;
        v9 = v39;
      }

      objc_autoreleasePoolPop(v32);
      -[HMDAccessoryBrowser _removePairingInformation:error:context:](v33, "_removePairingInformation:error:context:", v31, v13, v10);
    }
    else
    {
      v31 = v22;
    }
LABEL_24:

  }
LABEL_25:

}

- (void)_pairAccessoryWithDescription:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  HMDAccessoryBrowser *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessoryBrowser *v33;
  NSObject *v34;
  void *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  HMDAccessoryBrowser *v52;
  NSObject *v53;
  void *v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void *v56;
  HMDAccessoryBrowser *v57;
  NSObject *v58;
  void *v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void *v61;
  id v62;
  void *v63;
  HMDAccessoryBrowser *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  HMDUnpairedHAPAccessoryPairingInformation *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  BOOL v83;
  void *v84;
  HMDAccessoryBrowser *v85;
  NSObject *v86;
  void *v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void *v89;
  HMDAccessoryBrowser *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  HMDAccessoryBrowser *v98;
  NSObject *v99;
  void *v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void *v102;
  HMDAccessoryBrowser *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  dispatch_group_t v111;
  NSObject *v112;
  void (**v113)(void *, void *);
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  BOOL v120;
  void *v121;
  void *v122;
  HMDAccessoryBrowser *v123;
  NSObject *v124;
  void *v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void *v127;
  id v128;
  void *v129;
  HMDAccessoryBrowser *v130;
  NSObject *v131;
  void *v132;
  void *v133;
  void *v134;
  _BOOL4 v135;
  void *v136;
  void *v137;
  _BOOL4 v138;
  void *v139;
  void *v140;
  HMDAccessoryBrowser *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  HMDUnpairedHAPAccessoryPairingInformation *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  HMDAddAccessoryProgressState *v165;
  void *v166;
  void *v167;
  void *v168;
  HMDAddAccessoryProgressState *v169;
  void *v170;
  HMDAccessoryBrowser *v171;
  NSObject *v172;
  void *v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  id v175;
  id v176;
  void *v177;
  void *v178;
  NSObject *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  id obj;
  HMDUnpairedHAPAccessoryPairingInformation *obja;
  HMDUnpairedHAPAccessoryPairingInformation *objb;
  void *v188;
  id v189;
  void (**v190)(id, uint64_t, void *);
  id aBlock;
  HMDAccessoryBrowser *v192;
  id v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  _QWORD v198[7];
  _QWORD block[4];
  id v200;
  HMDAccessoryBrowser *v201;
  id v202;
  id v203;
  _BYTE *v204;
  _QWORD *v205;
  _QWORD v206[4];
  NSObject *v207;
  id v208;
  id v209;
  _BYTE *v210;
  _QWORD *v211;
  _QWORD v212[3];
  char v213;
  _QWORD v214[5];
  id v215;
  HMDUnpairedHAPAccessoryPairingInformation *v216;
  id v217;
  void (**v218)(id, uint64_t, void *);
  id v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[2];
  _QWORD v233[2];
  _BYTE buf[24];
  uint64_t (*v235)(uint64_t, uint64_t);
  void (*v236)(uint64_t);
  id v237;
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  uint64_t v241;

  v241 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v189 = a4;
  v190 = (void (**)(id, uint64_t, void *))a5;
  aBlock = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x227676638]();
  v192 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received request to start pairing accessory with description %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](v192, "identifierOfAccessoryBeingReprovisioned");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Pairing accessory with description %@ failed since reprovisioning is in progress", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v20);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = _Block_copy(aBlock);
    v22 = v21;
    if (v21)
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id, void *))v21 + 2))(v21, 0, 0, 0, 0, 0, v20, v194);

    goto LABEL_24;
  }
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  -[HMDAccessoryBrowser tombstonedHAPAccessoryServers](v192, "tombstonedHAPAccessoryServers");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v228, v240, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v229;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v229 != v24)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v228 + 1) + 8 * i);
        if (objc_msgSend(v10, "matchesAccessoryServer:", v26))
        {
          v32 = (void *)MEMORY[0x227676638]();
          v33 = v192;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "debugDescription");
            v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v26;
            *(_WORD *)&buf[22] = 2112;
            v235 = v36;
            _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@A tombstoned accessoryServer %@ matches the accessory with description %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v32);
          objc_msgSend(v26, "identifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:](v33, "updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:", v37, v190);

          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 13);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v194);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD, _QWORD, void *, void *))aBlock + 2))(aBlock, v26, 0, 0, 0, 0, v194, v38);

          goto LABEL_24;
        }
      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v228, v240, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v10, "isPaired"))
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v192;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Accessory description indicates that the accessory is already paired - aborting...", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 11);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v20);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *, void *))aBlock + 2))(aBlock, 0, 0, 0, 0, 0, v31, v195);

    goto LABEL_25;
  }
  objc_msgSend(v10, "setupAccessoryPayload");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "chipAccessorySetupPayload");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
    goto LABEL_29;
  if (!-[HMDAccessoryBrowser _isHomeHubMatterSharedAdminPairingCapableWithConfiguration:](v192, "_isHomeHubMatterSharedAdminPairingCapableWithConfiguration:", v189))
  {
    v63 = (void *)MEMORY[0x227676638]();
    v64 = v192;
    HMFGetOSLogHandle();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v66;
      _os_log_impl(&dword_2218F0000, v65, OS_LOG_TYPE_INFO, "%{public}@HomeHub is not capable to handle Matter Shared Admin Pairing requests", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v63);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 92);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v20);
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id, void *))aBlock + 2))(aBlock, 0, 0, 0, 0, 0, v20, v196);

    goto LABEL_25;
  }
  if ((isFeatureMatteriPhoneOnlyPairingControlEnabled() & 1) != 0)
    goto LABEL_29;
  if (!-[HMDAccessoryBrowser _isHomeHubAvailableWithConfiguration:](v192, "_isHomeHubAvailableWithConfiguration:", v189))
  {
    v129 = (void *)MEMORY[0x227676638]();
    v130 = v192;
    HMFGetOSLogHandle();
    v131 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v132;
      _os_log_impl(&dword_2218F0000, v131, OS_LOG_TYPE_ERROR, "%{public}@HomeHub is not available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v129);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v20);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = _Block_copy(aBlock);
    v94 = v133;
    if (v133)
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id, void *))v133 + 2))(v133, 0, 0, 0, 0, 0, v20, v194);
    goto LABEL_73;
  }
  if (!-[HMDAccessoryBrowser _isPrimaryResidentReachableWithConfiguration:](v192, "_isPrimaryResidentReachableWithConfiguration:", v189))
  {
    v89 = (void *)MEMORY[0x227676638]();
    v90 = v192;
    HMFGetOSLogHandle();
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v92;
      _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_ERROR, "%{public}@Primary resident is not reachable", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v89);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2709);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v20);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = _Block_copy(aBlock);
    v94 = v93;
    if (v93)
      (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id, void *))v93 + 2))(v93, 0, 0, 0, 0, 0, v20, v194);
LABEL_73:

    goto LABEL_24;
  }
LABEL_29:
  v226 = 0u;
  v227 = 0u;
  v224 = 0u;
  v225 = 0u;
  -[HMDAccessoryBrowser unpairedHAPAccessories](v192, "unpairedHAPAccessories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, v239, 16);
  if (!v41)
  {
    v194 = 0;
    goto LABEL_60;
  }
  v194 = 0;
  v42 = *(_QWORD *)v225;
  do
  {
    for (j = 0; j != v41; ++j)
    {
      if (*(_QWORD *)v225 != v42)
        objc_enumerationMutation(obj);
      v44 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * j);
      v220 = 0u;
      v221 = 0u;
      v222 = 0u;
      v223 = 0u;
      objc_msgSend(v44, "accessoryServers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v220, v238, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v221;
LABEL_36:
        v48 = 0;
        while (1)
        {
          if (*(_QWORD *)v221 != v47)
            objc_enumerationMutation(v45);
          v49 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * v48);
          if ((objc_msgSend(v10, "matchesAccessoryServer:", v49) & 1) != 0)
            break;
          if (v46 == ++v48)
          {
            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v220, v238, 16);
            if (v46)
              goto LABEL_36;
            goto LABEL_42;
          }
        }
        v50 = v44;

        v20 = v49;
        if (!v20)
        {
          v194 = v50;
          continue;
        }

        v51 = (void *)MEMORY[0x227676638]();
        v52 = v192;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "debugDescription");
          v55 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v54;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2112;
          v235 = v55;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@Matched accessoryServer %@ to pair accessory %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v51);
        if ((objc_msgSend(v20, "isPaired") & 1) != 0 || objc_msgSend(v20, "hasPairings"))
        {
          v56 = (void *)MEMORY[0x227676638]();
          v57 = v52;
          HMFGetOSLogHandle();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "debugDescription");
            v60 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v59;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2112;
            v235 = v60;
            _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Matched accessoryServer %@ is already paired while attempting to pair accessory %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v56);
          if (!aBlock)
          {

            goto LABEL_25;
          }
          objc_msgSend(v20, "identifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:](v57, "updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:", v61, v190);

          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 13);
          v62 = (id)objc_claimAutoreleasedReturnValue();
          +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v62);
          obja = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, _QWORD, id, HMDUnpairedHAPAccessoryPairingInformation *))aBlock
           + 2))(aBlock, v20, 0, 0, 0, 0, v62, obja);
          goto LABEL_134;
        }
        objc_msgSend(v20, "identifier");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](v52, "pairedAccessoryInformationWithIdentifier:", v121);
        v62 = (id)objc_claimAutoreleasedReturnValue();

        if (v62 && (objc_msgSend(v62, "transports") & 0x10) == 0)
        {
          v122 = (void *)MEMORY[0x227676638]();
          v123 = v52;
          HMFGetOSLogHandle();
          v124 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "debugDescription");
            v126 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v125;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2112;
            v235 = v126;
            _os_log_impl(&dword_2218F0000, v124, OS_LOG_TYPE_INFO, "%{public}@Matched accessoryServer %@ is part of paired accessories while attempting to pair accessory %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v122);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 13);
          obja = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
          +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, obja);
          v197 = (id)objc_claimAutoreleasedReturnValue();
          v127 = _Block_copy(aBlock);
          v128 = v127;
          if (v127)
            (*((void (**)(void *, id, _QWORD, _QWORD, _QWORD, _QWORD, HMDUnpairedHAPAccessoryPairingInformation *, id))v127
             + 2))(v127, v20, 0, 0, 0, 0, obja, v197);
          goto LABEL_133;
        }
        objc_msgSend(v10, "accessoryName");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = v134 == 0;

        if (v135)
        {
          objc_msgSend(v50, "name");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAccessoryName:", v136);

        }
        objc_msgSend(v10, "accessoryUUID");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = v137 == 0;

        if (v138)
        {
          objc_msgSend(v50, "uuid");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAccessoryUUID:", v139);

        }
        -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](v52, "_pairingInformationForUnpairedAccessory:", v50);
        obja = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
        if (obja)
        {
          v140 = (void *)MEMORY[0x227676638]();
          v141 = v52;
          HMFGetOSLogHandle();
          v142 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v143;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v50;
            _os_log_impl(&dword_2218F0000, v142, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ is currently being paired", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v140);
          v232[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to start pairing with the accessory %@"), v50);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v233[0] = v144;
          v232[1] = *MEMORY[0x24BDD0FD8];
          v145 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1540], "hmStringFromErrorCode:", 15);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "stringWithFormat:", CFSTR("%ld (%@) This accessory is already being added to a home."), 15, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          v233[1] = v147;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v233, v232, 2);
          v197 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 15, v197);
          v128 = (id)objc_claimAutoreleasedReturnValue();
          +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v128);
          v193 = (id)objc_claimAutoreleasedReturnValue();
          v148 = _Block_copy(aBlock);
          if (v148)
          {
            objc_msgSend(v50, "uuid");
            v149 = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, HMDUnpairedHAPAccessoryPairingInformation *, uint64_t, _QWORD, _QWORD, id, id))v148
             + 2))(v148, 0, v149, objc_msgSend(v50, "certificationStatus"), 0, 0, v128, v193);
            goto LABEL_131;
          }
        }
        else
        {
          v197 = objc_alloc_init(MEMORY[0x24BE1B9A8]);
          -[HMDAccessoryBrowser currentControllerPairingIdentity](v52, "currentControllerPairingIdentity");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setPairingIdentity:", v150);

          objc_msgSend(v197, "setRequiresUserConsent:", objc_msgSend(v189, "requiresUserConsent"));
          objc_msgSend(v10, "ownershipToken");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "internalData");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setOwnershipToken:", v152);

          objc_msgSend(v189, "networkCredential");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "wiFiPSK");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setPsk:", v154);

          objc_msgSend(v189, "isoCountryCode");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setIsoCountryCode:", v155);

          objc_msgSend(v189, "chipFabricID");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setChipFabricID:", v156);

          objc_msgSend(v197, "setDoNetworkScan:", objc_msgSend(v10, "doNetworkScan"));
          objc_msgSend(v197, "setOwnerPairing:", -[HMDAccessoryBrowser _isOwnerPairingAccessoryWithConfiguration:](v52, "_isOwnerPairingAccessoryWithConfiguration:", v189));
          objb = -[HMDUnpairedHAPAccessoryPairingInformation initWithAccessoryDescription:linkType:completionHandler:progressHandler:pairingRequest:]([HMDUnpairedHAPAccessoryPairingInformation alloc], "initWithAccessoryDescription:linkType:completionHandler:progressHandler:pairingRequest:", v10, objc_msgSend(v20, "linkType"), aBlock, v190, v197);
          -[HMDUnpairedHAPAccessoryPairingInformation setPairingActivity:](objb, "setPairingActivity:", v188);
          -[HMDUnpairedHAPAccessoryPairingInformation homeUUID](objb, "homeUUID");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v156) = v157 == 0;

          if ((_DWORD)v156)
          {
            objc_msgSend(v189, "homeUUID");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUnpairedHAPAccessoryPairingInformation setHomeUUID:](objb, "setHomeUUID:", v158);

          }
          v159 = v20;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v160 = v159;
          else
            v160 = 0;
          v128 = v160;

          if (v128)
          {
            -[HMDUnpairedHAPAccessoryPairingInformation setWacAccessory:](objb, "setWacAccessory:", objc_msgSend(v128, "isWacAccessory"));
            -[HMDUnpairedHAPAccessoryPairingInformation setLegacyWAC:](objb, "setLegacyWAC:", objc_msgSend(v128, "isWacLegacy"));
          }
          v184 = v159;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v161 = v184;
          else
            v161 = 0;
          v193 = v161;

          if (v193)
            -[HMDAccessoryBrowser _setupHMMTRAccessoryServer:pairingInfo:](v52, "_setupHMMTRAccessoryServer:pairingInfo:", v193, objb);
          -[HMDAccessoryBrowser currentlyPairingAccessories](v52, "currentlyPairingAccessories");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "addObject:", objb);

          if (v190)
            goto LABEL_127;
          objc_msgSend(v50, "uuid");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](v52, "_progressHandlerForUnpairedAccessory:", v163);
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "progressHandler");
          v190 = (void (**)(id, uint64_t, void *))objc_claimAutoreleasedReturnValue();

          if (v190)
          {
LABEL_127:
            v165 = [HMDAddAccessoryProgressState alloc];
            objc_msgSend(v50, "uuid");
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "name");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "category");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "productData");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v169 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v165, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v182, v166, 0, v167, 0, v168);

            v190[2](v190, 2, v169);
          }
          else
          {
            v190 = 0;
          }
          v170 = (void *)MEMORY[0x227676638]();
          v171 = v52;
          HMFGetOSLogHandle();
          v172 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v189, "requiresUserConsent");
            HMFBooleanToString();
            v174 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v173;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v50;
            *(_WORD *)&buf[22] = 2112;
            v235 = v174;
            _os_log_impl(&dword_2218F0000, v172, OS_LOG_TYPE_INFO, "%{public}@Starting pairing with accessory %@, needs consent: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v170);
          v198[0] = MEMORY[0x24BDAC760];
          v198[1] = 3221225472;
          v198[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_438;
          v198[3] = &unk_24E79BBD0;
          v175 = v188;
          v198[4] = v175;
          v149 = objb;
          v198[5] = v149;
          v176 = v184;
          v198[6] = v176;
          __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_438(v198);
          objc_msgSend(v175, "begin");
          v148 = v175;
          *(_QWORD *)buf = v148;
          -[HMDUnpairedHAPAccessoryPairingInformation pairingRequest](v149, "pairingRequest");
          v177 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "startPairingWithRequest:", v177);

          __HMFActivityScopeLeave();
          obja = v149;
LABEL_131:

        }
LABEL_133:

LABEL_134:
        v194 = v50;
        goto LABEL_140;
      }
LABEL_42:

    }
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, v239, 16);
  }
  while (v41);
LABEL_60:

  v62 = objc_alloc_init(MEMORY[0x24BE1B9A8]);
  -[HMDAccessoryBrowser currentControllerPairingIdentity](v192, "currentControllerPairingIdentity");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setPairingIdentity:", v67);

  objc_msgSend(v62, "setRequiresUserConsent:", objc_msgSend(v189, "requiresUserConsent"));
  objc_msgSend(v10, "ownershipToken");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "internalData");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setOwnershipToken:", v69);

  objc_msgSend(v189, "networkCredential");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "wiFiPSK");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setPsk:", v71);

  objc_msgSend(v189, "isoCountryCode");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setIsoCountryCode:", v72);

  objc_msgSend(v189, "chipFabricID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setChipFabricID:", v73);

  objc_msgSend(v62, "setDoNetworkScan:", objc_msgSend(v10, "doNetworkScan"));
  objc_msgSend(v62, "setOwnerPairing:", -[HMDAccessoryBrowser _isOwnerPairingAccessoryWithConfiguration:](v192, "_isOwnerPairingAccessoryWithConfiguration:", v189));
  v74 = -[HMDUnpairedHAPAccessoryPairingInformation initWithAccessoryDescription:linkType:completionHandler:progressHandler:pairingRequest:]([HMDUnpairedHAPAccessoryPairingInformation alloc], "initWithAccessoryDescription:linkType:completionHandler:progressHandler:pairingRequest:", v10, 0, aBlock, v190, v62);
  -[HMDUnpairedHAPAccessoryPairingInformation setPairingActivity:](v74, "setPairingActivity:", v188);
  -[HMDUnpairedHAPAccessoryPairingInformation homeUUID](v74, "homeUUID");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v73) = v75 == 0;

  if ((_DWORD)v73)
  {
    objc_msgSend(v189, "homeUUID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUnpairedHAPAccessoryPairingInformation setHomeUUID:](v74, "setHomeUUID:", v76);

  }
  -[HMDAccessoryBrowser currentlyPairingAccessories](v192, "currentlyPairingAccessories");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addObject:", v74);

  v78 = MEMORY[0x24BDAC760];
  v214[0] = MEMORY[0x24BDAC760];
  v214[1] = 3221225472;
  v214[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke;
  v214[3] = &unk_24E790288;
  v214[4] = v192;
  v190 = v190;
  v218 = v190;
  v79 = aBlock;
  v219 = v79;
  v215 = v188;
  obja = v74;
  v216 = obja;
  v80 = v10;
  v217 = v80;
  v81 = _Block_copy(v214);
  objc_msgSend(v80, "accessoryServerIdentifier");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](v192, "pairedAccessoryInformationWithIdentifier:", v183);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82 == 0;

    if (!v83)
    {
      v84 = (void *)MEMORY[0x227676638]();
      v85 = v192;
      HMFGetOSLogHandle();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "debugDescription");
        v88 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v183;
        *(_WORD *)&buf[22] = 2112;
        v235 = v88;
        _os_log_impl(&dword_2218F0000, v86, OS_LOG_TYPE_INFO, "%{public}@Accessory with identifier %@ is already paired while attempting to pair %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v84);
      (*((void (**)(void *, uint64_t, _QWORD, _QWORD, _QWORD))v81 + 2))(v81, 1, 0, 0, 0);
      goto LABEL_139;
    }
  }
  objc_msgSend(v80, "setupID");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v181;
  if (v181)
  {
    -[HMDAccessoryBrowser pairedAccessoryInformationWithSetupID:](v192, "pairedAccessoryInformationWithSetupID:", v181);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v181;
    if (v96)
    {
      v97 = (void *)MEMORY[0x227676638]();
      v98 = v192;
      HMFGetOSLogHandle();
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "debugDescription");
        v101 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v100;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v181;
        *(_WORD *)&buf[22] = 2112;
        v235 = v101;
        _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_INFO, "%{public}@Accessory with setupID %@ is already paired while attempting to pair %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v97);
      v102 = (void *)MEMORY[0x227676638]();
      v103 = v98;
      HMFGetOSLogHandle();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v105;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v96;
        _os_log_impl(&dword_2218F0000, v104, OS_LOG_TYPE_INFO, "%{public}@Already paired accessory info: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v102);
      objc_msgSend(v96, "identifier");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:](v103, "updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:", v106, v190);

      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 13);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = _Block_copy(v79);
      v110 = v109;
      if (v109)
        (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *, void *))v109 + 2))(v109, 0, 0, 0, 0, 0, v107, v108);

      goto LABEL_138;
    }
  }
  v212[0] = 0;
  v212[1] = v212;
  v212[2] = 0x2020000000;
  v213 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v235 = __Block_byref_object_copy__196696;
  v236 = __Block_byref_object_dispose__196697;
  v237 = 0;
  v111 = dispatch_group_create();
  v206[0] = v78;
  v206[1] = 3221225472;
  v206[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_431;
  v206[3] = &unk_24E7902D8;
  v112 = v111;
  v207 = v112;
  v208 = v95;
  v209 = v183;
  v210 = buf;
  v211 = v212;
  v113 = (void (**)(void *, void *))_Block_copy(v206);
  objc_msgSend(v80, "setupAccessoryPayload");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v114;
  if ((!v114 || objc_msgSend(v114, "supportsIP"))
    && (-[HMDAccessoryBrowser ipAccessoryServerBrowser](v192, "ipAccessoryServerBrowser"),
        v116 = (void *)objc_claimAutoreleasedReturnValue(),
        v113[2](v113, v116),
        v116,
        !v115)
    || objc_msgSend(v115, "supportsBTLE"))
  {
    -[HMDAccessoryBrowser btleAccessoryServerBrowser](v192, "btleAccessoryServerBrowser");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v113[2](v113, v117);

  }
  -[HMDAccessoryBrowser chipAccessoryServerBrowser](v192, "chipAccessoryServerBrowser");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v118;
  if (v118)
  {
    if (v115)
    {
      v120 = objc_msgSend(v115, "communicationProtocol") == 2;

      if (!v120)
        goto LABEL_137;
    }
    else
    {

    }
    -[HMDAccessoryBrowser chipAccessoryServerBrowser](v192, "chipAccessoryServerBrowser");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v113[2](v113, v178);

  }
LABEL_137:
  -[HMDAccessoryBrowser workQueue](v192, "workQueue");
  v179 = objc_claimAutoreleasedReturnValue();
  block[0] = v78;
  block[1] = 3221225472;
  block[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_3;
  block[3] = &unk_24E790328;
  v200 = v115;
  v201 = v192;
  v204 = buf;
  v202 = v189;
  v203 = v81;
  v205 = v212;
  v180 = v115;
  dispatch_group_notify(v112, v179, block);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v212, 8);
LABEL_138:

LABEL_139:
  v20 = 0;
LABEL_140:

LABEL_24:
LABEL_25:

}

- (BOOL)_isOwnerPairingAccessoryWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "homes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "homeUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

        if (v13)
        {
          LOBYTE(v7) = objc_msgSend(v10, "isOwnerUser");
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (BOOL)_isPrimaryResidentReachableWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__HMDAccessoryBrowser__isPrimaryResidentReachableWithConfiguration___block_invoke;
  v11[3] = &unk_24E796248;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "primaryResident");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "isReachable");

  return (char)v6;
}

- (BOOL)_isHomeHubAvailableWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__HMDAccessoryBrowser__isHomeHubAvailableWithConfiguration___block_invoke;
  v11[3] = &unk_24E796248;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "primaryResident");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v9 != 0;

  return (char)v5;
}

- (BOOL)_isHomeHubMatterSharedAdminPairingCapableWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "homes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "homeUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

        if (v13)
        {
          if ((objc_msgSend(v10, "isOwnerUser") & 1) != 0)
          {
            LOBYTE(v7) = 1;
          }
          else
          {
            objc_msgSend(v10, "primaryResident");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "capabilities");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = objc_msgSend(v15, "supportsMatterSharedAdminPairing");

          }
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (void)_pairAccessory:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  HMDUnpairedHAPAccessoryPairingInformation *v18;
  HMDUnpairedHAPAccessoryPairingInformation *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  HMDAccessoryBrowser *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDAccessoryBrowser *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDUnpairedHAPAccessoryPairingInformation *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  HMDUnpairedHAPAccessoryPairingInformation *v67;
  void *v68;
  id v69;
  char v70;
  void *v71;
  id v72;
  char v73;
  void *v74;
  void *v75;
  HMDAccessoryBrowser *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  HMDUnpairedHAPAccessoryPairingInformation *v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  HMDAccessoryBrowser *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  HMDAccessoryBrowser *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  HMDAccessoryBrowser *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id context;
  void *contexta;
  void *v102;
  id v103;
  void *v104;
  id aBlock;
  void *v106;
  _QWORD v107[7];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE buf[12];
  __int16 v113;
  id v114;
  __int16 v115;
  void *v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _BYTE v119[128];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[5];

  v123[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v103 = a4;
  aBlock = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v13;
    v113 = 2112;
    v114 = v8;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received request to start pairing accessory %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](v11, "identifierOfAccessoryBeingReprovisioned");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v8, "preferredAccessoryServer");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v106)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v11;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v40;
        v113 = 2112;
        v114 = v8;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Could not find a server for unpaired accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      v122[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to start pairing with the accessory %@"), v8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = v41;
      v122[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("There was no server present for the accessory."), &stru_24E79DB48, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v123[1] = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 2, v104);
      v19 = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v19);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *, uint64_t, _QWORD, _QWORD, HMDUnpairedHAPAccessoryPairingInformation *, id))aBlock
       + 2))(aBlock, 0, v44, objc_msgSend(v8, "certificationStatus"), 0, 0, v19, v25);

      goto LABEL_48;
    }
    objc_msgSend(v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](v11, "pairedAccessoryInformationWithIdentifier:", v20);
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v104 && (objc_msgSend(v104, "transports") & 0x10) == 0)
    {
      v120[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Accessory %@ is already associated with a home"), v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v120[1] = *MEMORY[0x24BDD0FD8];
      v121[0] = v21;
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1540], "hmStringFromErrorCode:", 15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%ld (%@) This accessory is already part of a home."), 13, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v121[1] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 2);
      v19 = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 15, v19);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *, uint64_t, _QWORD, _QWORD, id, void *))aBlock + 2))(aBlock, 0, v27, objc_msgSend(v8, "certificationStatus"), 0, 0, v25, v26);

LABEL_48:
      goto LABEL_49;
    }
    context = v106;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_15;
    if (!-[HMDAccessoryBrowser _isHomeHubMatterSharedAdminPairingCapableWithConfiguration:](v11, "_isHomeHubMatterSharedAdminPairingCapableWithConfiguration:", v103))
    {
      v85 = (void *)MEMORY[0x227676638]();
      v86 = v11;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v88;
        _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_INFO, "%{public}@HomeHub is not capable to handle Matter Shared Admin Pairing requests", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v85);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 92);
      v19 = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v19);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, HMDUnpairedHAPAccessoryPairingInformation *, id))aBlock
       + 2))(aBlock, 0, 0, 0, 0, 0, v19, v25);
      goto LABEL_48;
    }
    if ((isFeatureMatteriPhoneOnlyPairingControlEnabled() & 1) != 0)
    {
LABEL_15:
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      -[HMDAccessoryBrowser currentlyPairingAccessories](v11, "currentlyPairingAccessories");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v109;
LABEL_17:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v109 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v32);
          objc_msgSend(v33, "accessoryUUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uuid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "isEqual:", v35);

          if ((v36 & 1) != 0)
            break;
          if (v30 == ++v32)
          {
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
            if (v30)
              goto LABEL_17;
            goto LABEL_23;
          }
        }
        v19 = v33;

        if (!v19)
          goto LABEL_31;
        v45 = (void *)MEMORY[0x227676638]();
        v46 = v11;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v48;
          v113 = 2112;
          v114 = v8;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ is currently being paired", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v45);
        v117[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to start pairing with the accessory %@"), v8);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v117[1] = *MEMORY[0x24BDD0FD8];
        v118[0] = v49;
        v50 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1540], "hmStringFromErrorCode:", 15);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", CFSTR("%ld (%@) This accessory is already being added to a home."), 15, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v118[1] = v52;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
        v25 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], 15, v25);
        v53 = (id)objc_claimAutoreleasedReturnValue();
        +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v53);
        v54 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v55 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id, uint64_t, _QWORD, _QWORD, id, id))aBlock + 2))(aBlock, 0, v55, objc_msgSend(v8, "certificationStatus"), 0, 0, v53, v54);
      }
      else
      {
LABEL_23:

LABEL_31:
        v25 = objc_alloc_init(MEMORY[0x24BE1B9A8]);
        -[HMDAccessoryBrowser currentControllerPairingIdentity](v11, "currentControllerPairingIdentity");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPairingIdentity:", v56);

        objc_msgSend(v25, "setRequiresUserConsent:", 1);
        objc_msgSend(v103, "networkCredential");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "wiFiPSK");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPsk:", v58);

        objc_msgSend(v103, "isoCountryCode");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setIsoCountryCode:", v59);

        objc_msgSend(v103, "chipFabricID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setChipFabricID:", v60);

        objc_msgSend(v25, "setOwnerPairing:", -[HMDAccessoryBrowser _isOwnerPairingAccessoryWithConfiguration:](v11, "_isOwnerPairingAccessoryWithConfiguration:", v103));
        v61 = [HMDUnpairedHAPAccessoryPairingInformation alloc];
        objc_msgSend(v8, "uuid");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(context, "linkType");
        objc_msgSend(v103, "setupCode");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "setupCodeProvider");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = -[HMDUnpairedHAPAccessoryPairingInformation initWithAccessoryUUID:accessoryName:linkType:setupCode:completionHandler:setupCodeProvider:pairingRequest:](v61, "initWithAccessoryUUID:accessoryName:linkType:setupCode:completionHandler:setupCodeProvider:pairingRequest:", v62, v63, v64, v65, aBlock, v66, v25);

        -[HMDUnpairedHAPAccessoryPairingInformation setPairingActivity:](v67, "setPairingActivity:", v102);
        objc_msgSend(v103, "homeUUID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUnpairedHAPAccessoryPairingInformation setHomeUUID:](v67, "setHomeUUID:", v68);

        v69 = context;
        objc_opt_class();
        v70 = objc_opt_isKindOfClass();
        if ((v70 & 1) != 0)
          v71 = v69;
        else
          v71 = 0;
        v53 = v71;

        if ((v70 & 1) != 0)
        {
          -[HMDUnpairedHAPAccessoryPairingInformation setWacAccessory:](v67, "setWacAccessory:", objc_msgSend(v69, "isWacAccessory"));
          -[HMDUnpairedHAPAccessoryPairingInformation setLegacyWAC:](v67, "setLegacyWAC:", objc_msgSend(v69, "isWacLegacy"));
        }
        v72 = v69;
        objc_opt_class();
        v73 = objc_opt_isKindOfClass();
        if ((v73 & 1) != 0)
          v74 = v72;
        else
          v74 = 0;
        v54 = v74;

        if ((v73 & 1) != 0)
          -[HMDAccessoryBrowser _setupHMMTRAccessoryServer:pairingInfo:](v11, "_setupHMMTRAccessoryServer:pairingInfo:", v72, v67);
        -[HMDAccessoryBrowser currentlyPairingAccessories](v11, "currentlyPairingAccessories");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "addObject:", v67);

        contexta = (void *)MEMORY[0x227676638]();
        v76 = v11;
        HMFGetOSLogHandle();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUnpairedHAPAccessoryPairingInformation pairingRequest](v67, "pairingRequest");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v78;
          v113 = 2112;
          v114 = v8;
          v115 = 2112;
          v116 = v79;
          _os_log_impl(&dword_2218F0000, v77, OS_LOG_TYPE_INFO, "%{public}@Starting pairing with accessory %@, request: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(contexta);
        v107[0] = MEMORY[0x24BDAC760];
        v107[1] = 3221225472;
        v107[2] = __70__HMDAccessoryBrowser__pairAccessory_configuration_completionHandler___block_invoke;
        v107[3] = &unk_24E79BBD0;
        v80 = v102;
        v81 = v67;
        v82 = v80;
        v107[4] = v80;
        v19 = v81;
        v107[5] = v19;
        v83 = v72;
        v107[6] = v83;
        __70__HMDAccessoryBrowser__pairAccessory_configuration_completionHandler___block_invoke(v107);
        objc_msgSend(v82, "begin");
        v55 = v82;
        *(_QWORD *)buf = v55;
        -[HMDUnpairedHAPAccessoryPairingInformation pairingRequest](v19, "pairingRequest");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "startPairingWithRequest:", v84);

        __HMFActivityScopeLeave();
      }

      goto LABEL_48;
    }
    if (-[HMDAccessoryBrowser _isHomeHubAvailableWithConfiguration:](v11, "_isHomeHubAvailableWithConfiguration:", v103))
    {
      if (-[HMDAccessoryBrowser _isPrimaryResidentReachableWithConfiguration:](v11, "_isPrimaryResidentReachableWithConfiguration:", v103))
      {
        goto LABEL_15;
      }
      v89 = (void *)MEMORY[0x227676638]();
      v90 = v11;
      HMFGetOSLogHandle();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v92;
        _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_ERROR, "%{public}@Primary resident is not reachable", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v89);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2709);
      v19 = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v19);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v93 = _Block_copy(aBlock);
      v94 = v93;
      if (v93)
        (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, HMDUnpairedHAPAccessoryPairingInformation *, id))v93
         + 2))(v93, 0, 0, 0, 0, 0, v19, v25);
    }
    else
    {
      v95 = (void *)MEMORY[0x227676638]();
      v96 = v11;
      HMFGetOSLogHandle();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v98;
        _os_log_impl(&dword_2218F0000, v97, OS_LOG_TYPE_ERROR, "%{public}@HomeHub is not available", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v95);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
      v19 = (HMDUnpairedHAPAccessoryPairingInformation *)objc_claimAutoreleasedReturnValue();
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v19);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v99 = _Block_copy(aBlock);
      v94 = v99;
      if (v99)
        (*((void (**)(void *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, HMDUnpairedHAPAccessoryPairingInformation *, id))v99
         + 2))(v99, 0, 0, 0, 0, 0, v19, v25);
    }

    goto LABEL_48;
  }
  v15 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v17;
    v113 = 2112;
    v114 = v8;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Pairing accessory %@ failed since reprovisioning is in progress", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 15);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v106);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (HMDUnpairedHAPAccessoryPairingInformation *)_Block_copy(aBlock);
  v19 = v18;
  if (v18)
    ((void (*)(HMDUnpairedHAPAccessoryPairingInformation *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *, void *))v18->_linkType)(v18, 0, 0, 0, 0, 0, v106, v104);
LABEL_49:

}

- (void)_promptForPairingPasswordForServer:(id)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  id inited;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMDAccessoryBrowser *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDAccessoryBrowser *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[6];
  id location;
  _QWORD aBlock[4];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v32 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke;
  aBlock[3] = &unk_24E7967E8;
  v9 = v6;
  v44 = v9;
  v33 = _Block_copy(aBlock);
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setupCodeProviderCompletionHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      inited = objc_initWeak(&location, self);
      v14 = (void *)MEMORY[0x227676638](inited);
      v15 = self;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v17;
        v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Invoking setupCode provider for accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v41[0] = v8;
      v41[1] = 3221225472;
      v41[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_454;
      v41[3] = &unk_24E79C268;
      v18 = v9;
      v41[4] = v18;
      v19 = v32;
      v41[5] = v19;
      __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_454((uint64_t)v41);
      v34[0] = v8;
      v34[1] = 3221225472;
      v34[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2_458;
      v34[3] = &unk_24E790378;
      objc_copyWeak(&v40, &location);
      v39 = v33;
      v20 = v19;
      v35 = v20;
      v21 = v18;
      v36 = v21;
      v37 = v10;
      v11 = v11;
      v38 = v11;
      ((void (**)(_QWORD, id, id, _QWORD *))v12)[2](v12, v37, v20, v34);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        v47 = 2112;
        v48 = v9;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Received request to prompt for pairing password for accessory server %@ but there is no setupCodeProvider", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2002);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, id, void *))v33 + 2))(v33, v32, v30);
      objc_msgSend(v9, "stopPairingWithError:", 0);
      if (objc_msgSend(v10, "supportsCHIP"))
      {
        +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
      -[HMDAccessoryBrowser _sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:](v27, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", v9, v30, v31, 0);

      v12 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v25;
      v47 = 2112;
      v48 = v9;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Received request to prompt for pairing password for accessory server %@ that cannot be mapped to an unpaired accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(0, "supportsCHIP"))
    {
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v11);
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[HMDAccessoryBrowser _sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:](v23, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", v9, v11, v12, 0);
    objc_msgSend(v9, "stopPairingWithError:", 0);
  }

}

- (void)_updatePairingRetryTimerForAccessory:(id)a3 delay:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "pairingRetryTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "suspend");
      objc_msgSend(v9, "setPairingRetryTimer:", 0);

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, (double)a4);
    objc_msgSend(v9, "setPairingRetryTimer:", v12);
    objc_msgSend(v12, "setDelegate:", self);
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegateQueue:", v13);

    objc_msgSend(v12, "resume");
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Not starting a pairing retry timer for unpaired accessory %@/%@ - pairing information does not exist", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)_sendPairingCompletionStatusForServer:(id)a3 error:(id)a4 matterPairingEndContext:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_initWeak(&location, self);
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __109__HMDAccessoryBrowser__sendPairingCompletionStatusForServer_error_matterPairingEndContext_completionHandler___block_invoke;
    v19[3] = &unk_24E7903A0;
    objc_copyWeak(&v25, &location);
    v24 = v13;
    v20 = v15;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    objc_msgSend(v14, "dismissPendingDialogWithContext:queue:completionHandler:", v20, v16, v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = _Block_copy(v13);
    v18 = v17;
    if (v17)
      (*((void (**)(void *))v17 + 2))(v17);

  }
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDAccessoryBrowser messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (BOOL)_isAccessoryServerTombstoned:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDAccessoryBrowser tombstonedHAPAccessoryServers](self, "tombstonedHAPAccessoryServers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_tombstonedAccessoryServerWithServerIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessoryBrowser tombstonedHAPAccessoryServers](self, "tombstonedHAPAccessoryServers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_shouldAccessoryServerBeTombstoned:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v10 = objc_msgSend(v4, "isPaired");
    v9 = v10 ^ objc_msgSend(v4, "hasPairings");
  }

  return v9;
}

- (void)_notifyDelegateOfTombstonedAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ was tombstoned", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v7, "accessoryBrowser:didTombstoneAccessoryServer:", v9, v4);
  }

}

- (void)_tombstoneAccessoryServer:(id)a3 forceNotify:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  HMDAccessoryBrowser *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[HMDAccessoryBrowser _isAccessoryServerTombstoned:](self, "_isAccessoryServerTombstoned:", v6))
  {
    if (!v4)
      goto LABEL_9;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Tombstoning paired accessory server '%{public}@'", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessoryBrowser tombstonedHAPAccessoryServers](v8, "tombstonedHAPAccessoryServers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v6);

  }
  -[HMDAccessoryBrowser _notifyDelegateOfTombstonedAccessoryServer:](self, "_notifyDelegateOfTombstonedAccessoryServer:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HMDAccessoryBrowser btleAccessoryServerBrowser](self, "btleAccessoryServerBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "disconnectFromBTLEAccessoryServer:", v6);

  }
LABEL_9:

}

- (id)_requiredCharacteristicsTypesToReadFromBTLEServer:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    -[HMDAccessoryBrowser pairedHMDHAPAccessoryWithAccessoryServer:](self, "pairedHMDHAPAccessoryWithAccessoryServer:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _pairingInformationForAccessoryIdentifier:](self, "_pairingInformationForAccessoryIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v6 | v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "productData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        objc_msgSend(v9, "addObject:", CFSTR("00000220-0000-1000-8000-0026BB765291"));
      objc_msgSend((id)v6, "providedName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        objc_msgSend(v9, "addObject:", *MEMORY[0x24BDD5928]);
      objc_msgSend((id)v6, "model");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        objc_msgSend(v9, "addObject:", *MEMORY[0x24BDD5910]);
      objc_msgSend((id)v6, "manufacturer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        objc_msgSend(v9, "addObject:", *MEMORY[0x24BDD5908]);
      objc_msgSend((id)v6, "serialNumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        objc_msgSend(v9, "addObject:", *MEMORY[0x24BDD59B8]);
      objc_msgSend((id)v6, "firmwareVersion");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15
        || (v16 = (void *)v15,
            v17 = objc_msgSend((id)v6, "configNumber"),
            v18 = objc_msgSend(v4, "configNumber"),
            v16,
            v17 != v18))
      {
        objc_msgSend(v9, "addObject:", *MEMORY[0x24BDD58C0]);
        if (objc_msgSend((id)v6, "supportsCHIP"))
          objc_msgSend(v9, "addObject:", *MEMORY[0x24BE1B568]);
      }
      objc_msgSend((id)v6, "accessoryFlags");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        objc_msgSend(v9, "addObject:", CFSTR("000000A6-0000-1000-8000-0026BB765291"));
      if (v8)
      {
        objc_msgSend(v9, "addObject:", CFSTR("00000703-0000-1000-8000-0026BB765291"));
        objc_msgSend(v9, "addObject:", CFSTR("0000022B-0000-1000-8000-0026BB765291"));
        objc_msgSend(v9, "addObject:", CFSTR("00000702-0000-1000-8000-0026BB765291"));
      }
      objc_msgSend(v9, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)_discoverAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "linkType") == 2)
  {
    -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](self, "discoveringBLEAccessoryServerIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v12;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory discovery already in progress for BLE Accessory with server: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      v13 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;

      -[HMDAccessoryBrowser _requiredCharacteristicsTypesToReadFromBTLEServer:](self, "_requiredCharacteristicsTypesToReadFromBTLEServer:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v15, "connectReason"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138544130;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        v29 = 2112;
        v30 = v22;
        v31 = 2112;
        v32 = v16;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Adding BLE Accessory server: %@ to the discovering list. Connection Reason: %@. Reading characteristic types: %@", (uint8_t *)&v25, 0x2Au);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](v18, "discoveringBLEAccessoryServerIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

      objc_msgSend(v15, "discoverAccessoriesAndReadCharacteristicTypes:", v16);
    }
  }
  else
  {
    objc_msgSend(v4, "discoverAccessories");
  }

}

- (void)_resurrectAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessoryBrowser *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDAccessoryBrowser _isAccessoryServerTombstoned:](self, "_isAccessoryServerTombstoned:", v4))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Resurrecting paired accessory server '%@'", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessoryBrowser tombstonedHAPAccessoryServers](v7, "tombstonedHAPAccessoryServers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v4);

    if (objc_msgSend(v4, "isPaired"))
      -[HMDAccessoryBrowser _discoverAccessories:](v7, "_discoverAccessories:", v4);
  }

}

- (void)_notifyDelegateOfNewPairedAccessoryServer:(id)a3 stateChanged:(BOOL)a4 stateNumber:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[3];
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v22 = -[HMDAccessoryBrowser _shouldAccessoryServerBeTombstoned:](self, "_shouldAccessoryServerBeTombstoned:", v8);
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v17;
      v25 = 2112;
      v26 = v13;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate %@ that a paired accessory server was added %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke;
    v18[3] = &unk_24E7903F0;
    v18[4] = v15;
    v20 = v21;
    v19 = v8;
    objc_msgSend(v13, "accessoryBrowser:didFindAccessoryServer:stateChanged:stateNumber:completion:", v15, v19, v6, v9, v18);

  }
  _Block_object_dispose(v21, 8);

}

- (void)accessoryServerBrowser:(id)a3 accessoryServer:(id)a4 didUpdateValuesForCharacteristics:(id)a5 stateNumber:(id)a6 broadcast:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryBrowser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = a7;
  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _addDiscoveredAccessoryServerIdentifier:](self, "_addDiscoveredAccessoryServerIdentifier:", v17);

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:queue:", self, v18);

  if (!v16)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v24 = v19;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v22;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      v31 = 2112;
      v32 = v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of value update for :%@, stateNumber: %@, broadcast:%@", buf, 0x2Au);

      v19 = v24;
    }

    objc_autoreleasePoolPop(v19);
    -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:](v20, "_notifyDelegateOfAccessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v13, v14, v15, v7);
  }

}

- (void)_removePairingInformation:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  HMDAccessoryBrowser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v15;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing current pairing info %@ error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __63__HMDAccessoryBrowser__removePairingInformation_error_context___block_invoke;
  v31 = &unk_24E79C268;
  v16 = v8;
  v32 = v16;
  v17 = v9;
  v33 = v17;
  __63__HMDAccessoryBrowser__removePairingInformation_error_context___block_invoke((uint64_t)&v28);
  objc_msgSend(v16, "addAccessoryCompletionHandler", v28, v29, v30, v31, v32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v16, "addAccessoryCompletionHandler");
    v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id, id))v19)[2](v19, 0, 0, 0, 0, 0, v17, v10);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v13;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@No addAccessory completion handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
  -[HMDAccessoryBrowser currentlyPairingAccessories](v13, "currentlyPairingAccessories");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeObject:", v16);

  objc_msgSend(v16, "accessoryUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](v13, "_progressHandlerForUnpairedAccessory:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[HMDAccessoryBrowser currentlyPairingProgressHandlers](v13, "currentlyPairingProgressHandlers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObject:", v26);

  }
}

- (void)_checkIfPairingWithPairedAccessoryServer:(id)a3 errorCode:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  HMDAccessoryBrowser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char isKindOfClass;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "matchesAccessoryServer:", v6) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v13;

    if (!v14)
      goto LABEL_18;
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Paired Accessory server %@ matches accessory pending to be paired %@ - aborting the operation", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAccessoryProgressHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:](v16, "updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:", v20, v21);

    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v25 = 0;
    if (v23 && (isKindOfClass & 1) != 0)
    {
      +[HMDMatterAccessoryPairingEndContext hmdContextWithCancelledError:](HMDMatterAccessoryPairingEndContext, "hmdContextWithCancelledError:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDAccessoryBrowser _removePairingInformation:error:context:](v16, "_removePairingInformation:error:context:", v14, v22, v25);

  }
  else
  {
LABEL_9:
    v14 = v8;
  }

LABEL_18:
}

- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServer:(id)a4 stateChanged:(BOOL)a5 stateNumber:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMDAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessoryBrowser *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  objc_msgSend(v11, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _addDiscoveredAccessoryServerIdentifier:](self, "_addDiscoveredAccessoryServerIdentifier:", v14);
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:queue:", self, v15);

  if ((objc_msgSend(v11, "isKnownToSystemCommissioner") & 1) == 0 && objc_msgSend(v11, "isPaired"))
  {
    -[HMDAccessoryBrowser _checkIfPairingWithPairedAccessoryServer:errorCode:](self, "_checkIfPairingWithPairedAccessoryServer:errorCode:", v11, 13);
    -[HMDAccessoryBrowser _notifyDelegateOfNewPairedAccessoryServer:stateChanged:stateNumber:](self, "_notifyDelegateOfNewPairedAccessoryServer:stateChanged:stateNumber:", v11, v7, v12);
    goto LABEL_14;
  }
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isRemoteGatewayCapable") & 1) != 0 || !objc_msgSend(v11, "hasPairings"))
  {

  }
  else
  {
    v17 = objc_msgSend(v11, "isKnownToSystemCommissioner");

    if ((v17 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v21;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Ignoring found accessory server %@ that already has pairings", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDAccessoryBrowser _checkIfPairingWithPairedAccessoryServer:errorCode:](v19, "_checkIfPairingWithPairedAccessoryServer:errorCode:", v11, 11);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 53);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser _notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:](v19, "_notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:", v22, v14, objc_msgSend(v10, "linkType"));

      goto LABEL_14;
    }
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Found unpaired accessory server and notifying delegates", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  -[HMDAccessoryBrowser _addUnpairedAccessoryForServer:](v24, "_addUnpairedAccessoryForServer:", v11);
LABEL_14:

}

- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServerForReprovisioning:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](v11, "identifierOfAccessoryBeingReprovisioned");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Currently reprovisioning:%@,  Found accessory server: %@ for reprovisioning", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAccessoryBrowser workQueue](v11, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:queue:", v11, v15);

  if (objc_msgSend(v7, "isPaired"))
  {
    -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](v11, "identifierOfAccessoryBeingReprovisioned");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v9);

    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x24BE1B9A8]);
      -[HMDAccessoryBrowser wiFiPSKForAccessoryReprovisioning](v11, "wiFiPSKForAccessoryReprovisioning");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPsk:", v19);

      -[HMDAccessoryBrowser countrycodeForAccessoryReprovisioning](v11, "countrycodeForAccessoryReprovisioning");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setIsoCountryCode:", v20);

      v21 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      objc_msgSend(v23, "startReprovisioningWithPairingRequest:", v18);
    }
  }

}

- (void)_notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v12;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@[Accessory Browser] Notifying '%@' on provision complete for accessory: %@ with error: %@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "accessoryBrowser:didFinishWACForAccessoryWithIdentifier:error:", self, v6, v7);
  }

}

- (void)accessoryServerBrowser:(id)a3 didFindAccessoryServerNeedingReprovisioning:(id)a4 error:(id)a5
{
  -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServerNeedingReprovisioning:error:](self, "_notifyDelegateOfAccessoryServerNeedingReprovisioning:error:", a4, a5);
}

- (void)_notifyDelegateOfAccessoryServerNeedingReprovisioning:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v14;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@'' that a paired accessory server %@ needs reprovisioning with error: %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "accessoryBrowser:didFindAccessoryServerNeedingReprovisioning:error:", v12, v6, v7);
  }

}

- (void)accessoryServerBrowser:(id)a3 didFinishWACForAccessoryWithIdentifier:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[HMDAccessoryBrowser identifierOfAccessoryBeingReprovisioned](self, "identifierOfAccessoryBeingReprovisioned");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v10);

  if (v9)
  {
    -[HMDAccessoryBrowser setIdentifierOfAccessoryBeingReprovisioned:](self, "setIdentifierOfAccessoryBeingReprovisioned:", 0);
    -[HMDAccessoryBrowser _notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:error:](self, "_notifyDelegateOfWACCompletionForAccessoryServerWithIdentifier:error:", v10, v7);
  }

}

- (void)_notifyDelegateOfRemovedAccessoryServer:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v14;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that a paired accessory server %@ was removed with error: %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "accessoryBrowser:didRemoveAccessoryServer:error:", v12, v6, v7);
  }

}

- (void)_handlePairingInterruptedTimeout:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __62__HMDAccessoryBrowser__handlePairingInterruptedTimeout_error___block_invoke;
  v17 = &unk_24E7965D0;
  objc_copyWeak(&v20, &location);
  v10 = v6;
  v18 = v10;
  v11 = v7;
  v19 = v11;
  objc_msgSend(v8, "dismissPendingDialogWithContext:queue:completionHandler:", v10, v9, &v14);

  objc_msgSend(v10, "accessoryServers", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
    -[HMDAccessoryBrowser removeUnpairedHAPAccessory:](self, "removeUnpairedHAPAccessory:", v10);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_stopReconfirmTimer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reconfirmTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Canceling reconfirm timer for unpaired accessory %@/%@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "reconfirmTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suspend");

    objc_msgSend(v6, "setReconfirmTimer:", 0);
  }

}

- (void)_startPairingInterruptionTimer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "pairingInterruptionTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v16 = objc_alloc(MEMORY[0x24BE3F298]);
      v17 = (void *)objc_msgSend(v16, "initWithTimeInterval:options:", 0, *(double *)&pairingInterruptionGracePeriod);
      objc_msgSend(v7, "setPairingInterruptionTimer:", v17);
      objc_msgSend(v17, "setDelegate:", self);
      -[HMDAccessoryBrowser workQueue](self, "workQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDelegateQueue:", v18);

      objc_msgSend(v17, "resume");
      goto LABEL_10;
    }
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v15 = "%{public}@Pairing interrupted timer exists for unpaired accessory %@/%@ - skipping";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v19, 0x20u);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v15 = "%{public}@Not starting a pairing interrupted timer for unpaired accessory %@/%@ - pairing information does not exist";
      goto LABEL_7;
    }
  }

  objc_autoreleasePoolPop(v9);
LABEL_10:

}

- (void)_addReconfirmTimer:(id)a3 accessoryServer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  HMDAccessoryBrowser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      v18 = "%{public}@Not starting a reconfirm timer for unpaired accessory %@/%@ - pairing information does not exist";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v12);
    goto LABEL_12;
  }
  objc_msgSend(v9, "reconfirmTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543874;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      v32 = 2112;
      v33 = v17;
      v18 = "%{public}@WAC/Bonjour reconfirm timer exists for unpaired accessory %@/%@ - skipping";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v28, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v19 = (void *)MEMORY[0x227676638](objc_msgSend(v7, "reconfirm"));
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting a WAC/Bonjour reconfirm timer for unpaired accessory %@/%@", (uint8_t *)&v28, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  v25 = objc_alloc(MEMORY[0x24BE3F298]);
  v26 = (void *)objc_msgSend(v25, "initWithTimeInterval:options:", 0, *(double *)&pairingReconfirmWaitPeriod);
  objc_msgSend(v10, "setReconfirmTimer:", v26);
  objc_msgSend(v26, "setDelegate:", v20);
  -[HMDAccessoryBrowser workQueue](v20, "workQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegateQueue:", v27);

  objc_msgSend(v26, "resume");
LABEL_12:

}

- (void)accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5
{
  -[HMDAccessoryBrowser _accessoryServerBrowser:didRemoveAccessoryServer:error:matterPairingEndContext:](self, "_accessoryServerBrowser:didRemoveAccessoryServer:error:matterPairingEndContext:", a3, a4, a5, 0);
}

- (void)_accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5 matterPairingEndContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char isKindOfClass;
  id v21;
  void *v22;
  HMDAccessoryBrowser *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMDAccessoryBrowser *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDAccessoryBrowser *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _removeDiscoveredAccessoryServerIdentifier:](self, "_removeDiscoveredAccessoryServerIdentifier:", v15);

  if (objc_msgSend(v10, "linkType") == 2)
  {
    -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](self, "discoveringBLEAccessoryServerIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v17);

  }
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    if (!objc_msgSend(v11, "isPaired"))
      goto LABEL_28;
    goto LABEL_27;
  }
  v19 = v11;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (v19 && (isKindOfClass & 1) != 0)
  {
    v21 = v12;
    v58 = v10;
    v22 = (void *)MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v56 = v13;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v54 = v22;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v62 = v25;
      v63 = 2112;
      v64 = v26;
      v65 = 2112;
      v66 = v27;
      v67 = 2112;
      v68 = v21;
      v69 = 2112;
      v70 = v56;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Removing unpaired accessory server %@/%@ error %@ context %@", buf, 0x34u);

      v22 = v54;
      v13 = v56;
    }

    objc_autoreleasePoolPop(v22);
    v10 = v58;
    v12 = v21;
  }
  objc_msgSend(v18, "removeAccessoryServer:", v19);
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
  {
    objc_msgSend(v18, "accessoryServers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (!v37)
    {
      v55 = v12;
      v59 = v10;
      v38 = (void *)MEMORY[0x227676638]();
      v39 = self;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v53 = v38;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identifier");
        v57 = v13;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = v41;
        v63 = 2112;
        v64 = v42;
        v65 = 2112;
        v66 = v43;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Removing unpaired accessory server %@ (%@)", buf, 0x20u);

        v13 = v57;
        v38 = v53;
      }

      objc_autoreleasePoolPop(v38);
      -[HMDAccessoryBrowser removeUnpairedHAPAccessory:](v39, "removeUnpairedHAPAccessory:", v18);
      v10 = v59;
      v12 = v55;
    }
LABEL_26:

    if ((objc_msgSend(v19, "isPaired") & 1) != 0)
      goto LABEL_27;
    goto LABEL_28;
  }
  objc_msgSend(v28, "setupID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = v10;
    v32 = v12;
    v33 = v12;
    v34 = v33;
    if (v33 && (objc_msgSend(v33, "isHMError") & 1) == 0)
    {
      mapHAPPairingErrorToHMError(v34);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 79);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v52 = (void *)v35;

    -[HMDAccessoryBrowser _cancelPairingWithAccessory:error:context:](self, "_cancelPairingWithAccessory:error:context:", v18, v52, v13);
    v10 = v31;
    v12 = v32;
    goto LABEL_26;
  }

  if ((objc_msgSend(v19, "isPaired") & 1) != 0)
  {
LABEL_27:
    -[HMDAccessoryBrowser _notifyDelegateOfRemovedAccessoryServer:error:](self, "_notifyDelegateOfRemovedAccessoryServer:error:", v11, v12);
    goto LABEL_28;
  }
  -[HMDAccessoryBrowser _stopReconfirmTimer:](self, "_stopReconfirmTimer:", v18);
  v44 = (void *)MEMORY[0x227676638](-[HMDAccessoryBrowser accessoryServer:updatePairingProgress:](self, "accessoryServer:updatePairingProgress:", v19, 9));
  v45 = self;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v60 = v44;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v49 = v13;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v62 = v47;
    v63 = 2112;
    v64 = v48;
    v65 = 2112;
    v66 = v50;
    _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Lost the accessory before setup code was scanned - likely unplugged: %@/%@", buf, 0x20u);

    v13 = v49;
    v44 = v60;
  }

  objc_autoreleasePoolPop(v44);
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2015);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _handlePairingInterruptedTimeout:error:](v45, "_handlePairingInterruptedTimeout:error:", v18, v51);

LABEL_28:
}

- (void)accessoryServerBrowser:(id)a3 didStartDiscoveringWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to start discovering accessories for server browser %@ with error %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_notifyDelegateOfDiscoveryFailure:(id)a3 accessoryServer:(id)a4 linkType:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  HMDAccessoryBrowser *v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  _QWORD v27[6];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[HMDAccessoryBrowser _pairingInformationForAccessoryIdentifier:](self, "_pairingInformationForAccessoryIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pairingActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __82__HMDAccessoryBrowser__notifyDelegateOfDiscoveryFailure_accessoryServer_linkType___block_invoke;
    v27[3] = &unk_24E79C268;
    v27[4] = v12;
    v27[5] = v8;
    __82__HMDAccessoryBrowser__notifyDelegateOfDiscoveryFailure_accessoryServer_linkType___block_invoke((uint64_t)v27);
  }
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v16;
        if ((unint64_t)a5 > 2)
          v20 = CFSTR("Undefined");
        else
          v20 = off_24E780090[a5];
        v25 = v20;
        *(_DWORD *)buf = 138544130;
        v29 = v19;
        v30 = 2112;
        v31 = v15;
        v32 = 2112;
        v33 = v9;
        v34 = 2112;
        v35 = v25;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that accessory server discovery failed %@ over %@", buf, 0x2Au);

        v16 = v26;
      }

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v15, "accessoryBrowser:discoveryFailedWithError:accessoryServer:linkType:", v17, v8, v9, a5);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v24;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Not notifying of discovery failure for %@ because no paired accessory information exists", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)accessoryServerBrowser:(id)a3 didFailToDiscoverAccessoryServerWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAccessoryBrowser *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "linkType") == 2)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v12;
      v33 = 2112;
      v34 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing BLE Accessory: %@ from discovering list", (uint8_t *)&v31, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](v10, "discoveringBLEAccessoryServerIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v7);
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "linkType") == 1)
  {
    -[HMDAccessoryBrowser ipAccessoryServerBrowser](self, "ipAccessoryServerBrowser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v14) & 1) != 0)
    {
      -[HMDAccessoryBrowser hap2AccessoryServerBrowser](self, "hap2AccessoryServerBrowser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v16 = (void *)MEMORY[0x227676638]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v19;
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@IP Browser couldn't find Server with Identifier %@. Giving HAP2 a chance...", (uint8_t *)&v31, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        -[HMDAccessoryBrowser hap2AccessoryServerBrowser](v17, "hap2AccessoryServerBrowser");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v26 = v20;
        objc_msgSend(v20, "discoverAccessoryServerWithIdentifier:", v7);
        goto LABEL_25;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v6, "linkType") == 1)
  {
    -[HMDAccessoryBrowser hap2AccessoryServerBrowser](self, "hap2AccessoryServerBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v13) & 1) == 0)
    {
LABEL_5:

      goto LABEL_20;
    }
    -[HMDAccessoryBrowser chipAccessoryServerBrowser](self, "chipAccessoryServerBrowser");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v25;
        v33 = 2112;
        v34 = v7;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@HAP2 Browser couldn't find Server with Identifier %@. Maybe it's a CHIP accessory, checking...", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDAccessoryBrowser chipAccessoryServerBrowser](v23, "chipAccessoryServerBrowser");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
LABEL_20:
  -[HMDAccessoryBrowser _tombstonedAccessoryServerWithServerIdentifier:](self, "_tombstonedAccessoryServerWithServerIdentifier:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27 && (v29 = objc_msgSend(v27, "linkType"), v29 == objc_msgSend(v6, "linkType")))
    v30 = 53;
  else
    v30 = 4;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:](self, "_notifyDelegateOfDiscoveryFailure:accessoryServer:linkType:", v26, v7, objc_msgSend(v6, "linkType"));

LABEL_25:
}

- (void)accessoryServerBrowser:(id)a3 didChangeReachability:(BOOL)a4 forAccessoryServerWithIdentifier:(id)a5
{
  -[HMDAccessoryBrowser _notifyDelegateOfReachabilityChangeChange:forBTLEAccessories:](self, "_notifyDelegateOfReachabilityChangeChange:forBTLEAccessories:", a4, a5);
}

- (void)_notifyDelegateOfReachabilityChangeChange:(BOOL)a3 forBTLEAccessories:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying '%@' that reachability has changed to %@ for BTLE accessories %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "accessoryBrowser:didUpdateReachability:forBTLEAccessoriesWithServerIdentifier:", v10, v4, v6);
  }

}

- (void)accessoryServerBrowser:(id)a3 saveCache:(id)a4 serverIdentifier:(id)a5
{
  if (a5)
    +[HMDHomeManager saveAccessoryCache:forIdentifier:](HMDHomeManager, "saveAccessoryCache:forIdentifier:", a4, a5);
}

- (void)accessoryServerBrowser:(id)a3 getCacheForAccessoryWithIdentifier:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  +[HMDHomeManager getAccessoryCacheForIdentifier:](HMDHomeManager, "getAccessoryCacheForIdentifier:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (void)accessoryServerBrowser:(id)a3 removeCacheForAccessoryWithIdentifier:(id)a4
{
  +[HMDHomeManager removeAccessoryCacheForIdentifier:](HMDHomeManager, "removeAccessoryCacheForIdentifier:", a4);
}

- (BOOL)isServerLinkTypeBrowseable:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDAccessoryBrowser browseableLinkTypes](self, "browseableLinkTypes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "intValue") == a3)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HAPLinkTypeDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@LinkType %@ browseable %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  return v7;
}

- (void)saveAccessoryCache:(id)a3 forIdentifier:(id)a4
{
  -[HMDAccessoryBrowser accessoryServerBrowser:saveCache:serverIdentifier:](self, "accessoryServerBrowser:saveCache:serverIdentifier:", 0, a3, a4);
}

- (void)fetchAccessoryCacheForIdentifier:(id)a3 completion:(id)a4
{
  -[HMDAccessoryBrowser accessoryServerBrowser:getCacheForAccessoryWithIdentifier:withCompletion:](self, "accessoryServerBrowser:getCacheForAccessoryWithIdentifier:withCompletion:", 0, a3, a4);
}

- (void)removeAccessoryCacheForIdentifier:(id)a3
{
  -[HMDAccessoryBrowser accessoryServerBrowser:removeCacheForAccessoryWithIdentifier:](self, "accessoryServerBrowser:removeCacheForAccessoryWithIdentifier:", 0, a3);
}

- (void)accessoryServerBrowser:(id)a3 getCommissioningCertificatesForNodeID:(id)a4 fabricID:(id)a5 publicKey:(id)a6 completion:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDAccessoryBrowser *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v38 = a4;
  v37 = a5;
  v36 = a6;
  v12 = a7;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homeUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v35 = v13;
  objc_msgSend(v13, "homes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v21);
      objc_msgSend(v22, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqual:", v16);

      if ((v24 & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v19)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v26 = v22;

    v25 = v39;
    if (!v26)
      goto LABEL_12;
    v28 = v37;
    v27 = v38;
    v29 = v36;
    objc_msgSend(v26, "retrieveOperationalCertificatesForFabricID:commissionerNodeID:commissioneeNodeID:publicKey:completion:", v37, 0, v38, v36, v12);
  }
  else
  {
LABEL_9:

    v25 = v39;
LABEL_12:
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v29 = v36;
    v28 = v37;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v33;
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, v34);

    v26 = 0;
    v27 = v38;
  }

}

- (BOOL)supportsCommissioningCertificateRetrievalForCurrentlyPairingAccessory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  HMDAccessoryBrowser *v20;
  NSObject *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "homes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v6);

      if ((v14 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (!v15)
      goto LABEL_12;
    objc_msgSend(v15, "primaryResident");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "capabilities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "supportsMatterOwnerCertFetch");

  }
  else
  {
LABEL_9:

LABEL_12:
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v15 = 0;
    v18 = 0;
  }

  return v18;
}

- (BOOL)supportsCommissioningCertificateRetrievalForHomeUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  HMDAccessoryBrowser *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  HMDAccessoryBrowser *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "homes", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v4);

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (!v14)
      goto LABEL_16;
    v15 = objc_msgSend(v14, "hasAnyResident");
    if (!v15)
      goto LABEL_14;
    objc_msgSend(v14, "primaryResident");
    v16 = (HMDAccessoryBrowser *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v19 = 1;
      goto LABEL_22;
    }
    self = v16;
    objc_msgSend(v14, "primaryResident");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "capabilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v19 = 1;
    }
    else
    {
LABEL_14:
      objc_msgSend(v14, "primaryResident");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "capabilities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "supportsMatterOwnerCertFetch");

      if (!v15)
        goto LABEL_22;
    }

  }
  else
  {
LABEL_9:

LABEL_16:
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v14 = 0;
    v19 = 0;
  }
LABEL_22:

  return v19;
}

- (void)accessoryServerBrowser:(id)a3 cacheOperationalCertData:(id)a4 forFabricID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Caching operational certificate data for fabric %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  +[HMDHomeLocalOperationalCertificateDataStore localOperationalCertDataStore](HMDHomeLocalOperationalCertificateDataStore, "localOperationalCertDataStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveOperationalCertData:forFabricID:", v9, v10);

}

- (void)accessoryServerBrowser:(id)a3 getCachedOperationalCertificateDataForFabricID:(id)a4 completion:(id)a5
{
  void (**v6)(id, id);
  id v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, id))a5;
  v7 = a4;
  +[HMDHomeLocalOperationalCertificateDataStore localOperationalCertDataStore](HMDHomeLocalOperationalCertificateDataStore, "localOperationalCertDataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "operationalCertDataForFabricID:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9);
}

- (void)accessoryServerBrowser:(id)a3 didFinishPairingForAccessoryServer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessoryBrowser:didFinishPairingForAccessoryServer:", self, v5);

}

- (void)accessoryServerBrowser:(id)a3 getThreadNetworkCredentialsForAccessoryWithIdentifier:(id)a4 withCompletion:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessoryBrowser *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDAccessoryBrowser *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  _QWORD block[5];
  id v42;
  void (**v43)(id, void *, _QWORD);
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v38 = a4;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[HMDAccessoryBrowser homeManager](self, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser currentlyPairingAccessories](self, "currentlyPairingAccessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v40 = v9;
  objc_msgSend(v9, "homes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v45;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v17);
      objc_msgSend(v18, "uuid", v38);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v12);

      if ((v20 & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v21 = v18;

    if (!v21)
      goto LABEL_15;
    v23 = v38;
    v22 = v39;
    if (isFeatureMatteriPhoneOnlyPairingControlEnabled()
      && objc_msgSend(v21, "isSharedAdmin"))
    {
      objc_msgSend(v21, "threadOperationalDataset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = objc_alloc(MEMORY[0x24BE1BC30]);
        objc_msgSend(v21, "threadOperationalDataset");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithActiveOperationalDataSet:", v26);

        v8[2](v8, v27, 0);
        goto LABEL_22;
      }
      v33 = (void *)MEMORY[0x227676638]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v36;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Unexpected, shared admin does not have thread operational dataset for home. Falling back to request credentials from primary resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v33);
    }
    -[HMDAccessoryBrowser workQueue](self, "workQueue");
    v37 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke;
    block[3] = &unk_24E79B440;
    block[4] = self;
    v43 = v8;
    v21 = v21;
    v42 = v21;
    dispatch_async(v37, block);

  }
  else
  {
LABEL_9:

LABEL_15:
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v22 = v39;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v31;
      v50 = 2112;
      v51 = v12;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@no home found for home uuid %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v32);

    v21 = 0;
    v23 = v38;
  }
LABEL_22:

}

- (void)accessoryServerBrowser:(id)a3 getLockedState:(BOOL *)a4
{
  *a4 = isDeviceLocked();
}

- (id)_getHAPMetadataFromHMMetadata:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BE1BC30];
    v4 = a3;
    v5 = [v3 alloc];
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "channel");
    objc_msgSend(v4, "PANID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extendedPANID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "masterKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "passPhrase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PSKc");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "operationalDataset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(v5, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:activeOperationalDataSet:", v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)_continueAfterPPIDValidation:(BOOL)a3 server:(id)a4
{
  objc_msgSend(a4, "continueAuthAfterValidation:", a3);
}

- (void)_callProgressOrErrorOut:(id)a3 pairingInfo:(id)a4 accessoryInfo:(id)a5 unpairedAccessory:(id)a6 progress:(int64_t)a7 certStatus:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  HMDAccessoryBrowser *v20;
  NSObject *v21;
  void *v22;
  HMDAddAccessoryProgressState *v23;
  void *v24;
  HMDAddAccessoryProgressState *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  void *v40;
  HMDAccessoryBrowser *v41;
  NSObject *v42;
  void *v43;
  int64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  if (objc_msgSend(v16, "isDenylisted"))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory is blacklisted - Stopping pairing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(v14, "stopPairingWithError:", 0);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 55, 0);
    v23 = (HMDAddAccessoryProgressState *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    if (objc_msgSend(v17, "supportsCHIP"))
    {
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDAccessoryBrowser _sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:](v20, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", v14, v23, v24, 0);

  }
  else
  {
    v44 = a7;
    v25 = [HMDAddAccessoryProgressState alloc];
    objc_msgSend(v17, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v45 = v17;
    v27 = v15;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "manufacturer");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v16;
    v31 = (void *)v29;
    v32 = (void *)MEMORY[0x24BDD7338];
    v46 = v30;
    objc_msgSend(v30, "category");
    v33 = v14;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "categoryWithCategoryIdentifier:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v33;
    objc_msgSend(v33, "productData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v25, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v26, v28, v31, v35, a8, v36);

    v15 = v27;
    v17 = v45;

    objc_msgSend(v15, "addAccessoryProgressHandler");
    v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v37)
      goto LABEL_9;
    objc_msgSend(v45, "uuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](self, "_progressHandlerForUnpairedAccessory:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "progressHandler");
    v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v37)
    {
LABEL_9:
      ((void (**)(_QWORD, int64_t, HMDAddAccessoryProgressState *))v37)[2](v37, v44, v23);

      v14 = v47;
    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v43;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@no progress handler available - implicit auth", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      v14 = v47;
      objc_msgSend(v47, "continueAuthAfterValidation:", 1);
    }
    v16 = v46;
  }

}

- (void)accessoryServer:(id)a3 promtDialog:(id)a4 forNotCertifiedAccessory:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  int v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  v14 = objc_msgSend(v12, "setCertificationStatus:", 1);
  v15 = skipAuthPromptDialog;
  v16 = (void *)MEMORY[0x227676638](v14);
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: Defaults write set - skipping auth prompt", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    if (v13)
      v13[2](v13, 0);
  }
  else
  {
    if (v19)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Prompting for not certified confirmation", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v10, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser workQueue](v17, "workQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestUserPermissionForUnauthenticatedAccessory:withContext:queue:completionHandler:", v22, v10, v23, v13);

  }
}

- (void)accessoryServer:(id)a3 requestUserPermission:(int64_t)a4 accessoryInfo:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  HMDAccessoryBrowser *v37;
  NSObject *v38;
  void *v39;
  HMDAccessoryBrowser *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDAccessoryBrowser *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDAccessoryBrowser *v50;
  NSObject *v51;
  void *v52;
  HMDAccessoryBrowser *v53;
  void *v54;
  void *v55;
  HMDAccessoryBrowser *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  HMDAccessoryBrowser *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  HMDAccessoryBrowser *v67;
  void *v68;
  HMDAccessoryBrowser *v69;
  void *v70;
  HMDAccessoryBrowser *v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void (**v80)(void);
  void *v81;
  void *v82;
  HMDAccessoryBrowser *val;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD *v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  id v96;
  _QWORD *v97;
  id v98[2];
  id location;
  _QWORD v100[4];
  id v101;
  int64_t v102;
  _QWORD aBlock[4];
  id v104;
  id v105;
  HMDAccessoryBrowser *v106;
  _QWORD *v107;
  int64_t v108;
  _QWORD v109[3];
  char v110;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  int64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  val = self;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x2020000000;
  v110 = 1;
  objc_msgSend(v10, "pairingActivity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke;
  aBlock[3] = &unk_24E790440;
  v15 = v14;
  v104 = v15;
  v107 = v109;
  v16 = v11;
  v105 = v16;
  v106 = self;
  v108 = a4;
  v80 = (void (**)(void))_Block_copy(aBlock);
  v100[0] = MEMORY[0x24BDAC760];
  v100[1] = 3221225472;
  v100[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_3;
  v100[3] = &unk_24E790490;
  v76 = v15;
  v101 = v76;
  v102 = a4;
  v17 = _Block_copy(v100);
  objc_initWeak(&location, self);
  v93[0] = MEMORY[0x24BDAC760];
  v93[1] = 3221225472;
  v93[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_5;
  v93[3] = &unk_24E7904B8;
  objc_copyWeak(v98, &location);
  v18 = v10;
  v94 = v18;
  v19 = v17;
  v96 = v19;
  v97 = v109;
  v98[1] = (id)a4;
  v75 = v12;
  v95 = v75;
  v20 = _Block_copy(v93);
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "categoryForOther");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "category");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v16, "category");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "categoryForIdentifier:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v26;
  }
  else
  {
    v27 = v23;
  }
  v77 = v27;
  objc_msgSend(v27, "name");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x24BDAC760];
  v84[1] = 3221225472;
  v84[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_497;
  v84[3] = &unk_24E7904E0;
  objc_copyWeak(&v92, &location);
  v28 = v20;
  v89 = v28;
  v74 = v19;
  v90 = v74;
  v91 = v109;
  v29 = v22;
  v85 = v29;
  v30 = v18;
  v86 = v30;
  v31 = v16;
  v87 = v31;
  v32 = v21;
  v88 = v32;
  v33 = _Block_copy(v84);
  v78 = v33;
  switch(a4)
  {
    case 0:
      if (!objc_msgSend(v29, "allowAddUnauthenticatedAccessory", v74, v75, v76))
        goto LABEL_38;
      v36 = (void *)MEMORY[0x227676638]();
      v37 = val;
      HMFGetOSLogHandle();
      v38 = (id)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        goto LABEL_37;
      goto LABEL_36;
    case 1:
      if (objc_msgSend(v29, "provideNetworkCredentialsToAccessory", v74, v75, v76))
      {
        v36 = (void *)MEMORY[0x227676638]();
        v53 = val;
        HMFGetOSLogHandle();
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v112 = v54;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: User already consented to providing network credentials to accessory - skipping prompt", buf, 0xCu);

        }
      }
      else
      {
        if (!skipAuthPromptDialog)
        {
          v80[2]();
          objc_msgSend(v30, "name");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser workQueue](val, "workQueue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "requestUserPermissionForLegacyWACAccessory:withContext:queue:completionHandler:", v47, v30, v48, v28);
          goto LABEL_47;
        }
        v36 = (void *)MEMORY[0x227676638]();
        v67 = val;
        HMFGetOSLogHandle();
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v112 = v68;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: Defaults write set - skipping auth prompt", buf, 0xCu);

        }
      }
      goto LABEL_37;
    case 2:
      v39 = (void *)MEMORY[0x227676638](v33, v34, v35);
      v40 = val;
      HMFGetOSLogHandle();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v112 = v42;
        v113 = 2112;
        v114 = (int64_t)v31;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Confirming Accessory Info: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      if ((objc_msgSend(v31, "isCertified", v74, v75, v76) & 1) != 0)
      {
        v43 = (void *)MEMORY[0x227676638]();
        v44 = v40;
        HMFGetOSLogHandle();
        v45 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v112 = v46;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@need to confirm PPID", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v43);
        if (showAuthDialog)
        {
          v80[2]();
          objc_msgSend(v30, "name");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDAccessoryBrowser workQueue](v44, "workQueue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "requestUserPermissionWithAccessoryPPIDInfo:name:category:withContext:queue:completionHandler:", v31, v47, v79, v30, v48, v28);
          goto LABEL_47;
        }
LABEL_30:
        -[HMDAccessoryBrowser _callProgressOrErrorOut:pairingInfo:accessoryInfo:unpairedAccessory:progress:certStatus:](val, "_callProgressOrErrorOut:pairingInfo:accessoryInfo:unpairedAccessory:progress:certStatus:", v30, v29, v31, v32, 6, 1, v74);
      }
      else if (objc_msgSend(v29, "allowAddUnauthenticatedAccessory"))
      {
        v36 = (void *)MEMORY[0x227676638]();
        v69 = v40;
        HMFGetOSLogHandle();
        v38 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
LABEL_36:
          HMFGetLogIdentifier();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v112 = v70;
          _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: User already consented to adding unauthenticated accessory to home - skipping auth prompt", buf, 0xCu);

        }
LABEL_37:

        objc_autoreleasePoolPop(v36);
        objc_msgSend(v30, "continuePairingAfterAuthPrompt");
      }
      else
      {
LABEL_38:
        if (!skipAuthPromptDialog)
          v80[2]();
        -[HMDAccessoryBrowser accessoryServer:promtDialog:forNotCertifiedAccessory:completion:](val, "accessoryServer:promtDialog:forNotCertifiedAccessory:completion:", v30, v81, v32, v78);
      }
      goto LABEL_48;
    case 3:
      v55 = (void *)MEMORY[0x227676638](v33, v34, v35);
      v56 = val;
      HMFGetOSLogHandle();
      v57 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v112 = v58;
        _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_INFO, "%{public}@need to confirm accessory info with user", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v55);
      if (!showAuthDialog)
        goto LABEL_30;
      ((void (*)(void (**)(void), uint64_t, uint64_t))v80[2])(v80, v59, v60);
      objc_msgSend(v30, "name", v74, v75, v76);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser workQueue](v56, "workQueue");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "requestUserPermissionWithAccessoryPPIDInfo:name:category:withContext:queue:completionHandler:", v31, v47, v79, v30, v48, v28);
      goto LABEL_47;
    case 4:
      if (showAuthDialog)
      {
        ((void (*)(void (**)(void), uint64_t, uint64_t))v80[2])(v80, v34, v35);
        objc_msgSend(v30, "name", v74, v75, v76);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser workQueue](val, "workQueue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "showUserDialogForIncompatibleAccessory:name:category:withContext:queue:completionHandler:", v31, v47, v79, v30, v48, v28);
        goto LABEL_47;
      }
      v49 = (void *)MEMORY[0x227676638](v33, v34, v35);
      v71 = val;
      HMFGetOSLogHandle();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v112 = v72;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Accessory is in-compatible .. cancelling", buf, 0xCu);

      }
LABEL_43:

      objc_autoreleasePoolPop(v49);
      v73 = 1;
      goto LABEL_45;
    case 5:
      v61 = (void *)MEMORY[0x227676638](v33, v34, v35);
      v62 = val;
      HMFGetOSLogHandle();
      v63 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v112 = v64;
        _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@need to confirm accessory information with user", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v61);
      if (showAuthDialog)
      {
        ((void (*)(void (**)(void), uint64_t, uint64_t))v80[2])(v80, v65, v66);
        objc_msgSend(v30, "name", v74, v75, v76);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser workQueue](v62, "workQueue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "requestUserPermissionWithAccessoryPPIDInfo:name:category:withContext:queue:completionHandler:", v31, v47, v79, v30, v48, v28);
LABEL_47:

      }
      else
      {
        v73 = 0;
LABEL_45:
        (*((void (**)(id, uint64_t))v28 + 2))(v28, v73);
      }
LABEL_48:

      objc_destroyWeak(&v92);
      objc_destroyWeak(v98);
      objc_destroyWeak(&location);

      _Block_object_dispose(v109, 8);
      return;
    default:
      v49 = (void *)MEMORY[0x227676638](v33, v34, v35);
      v50 = val;
      HMFGetOSLogHandle();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v112 = v52;
        v113 = 2048;
        v114 = a4;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Accessory Browser: Request user permission - unsupported type %tu - cancelling...", buf, 0x16u);

      }
      goto LABEL_43;
  }
}

- (void)accessoryServer:(id)a3 promptUserForPasswordWithType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  HMDAddAccessoryProgressState *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAddAccessoryProgressState *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setupCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v14;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Have a pair setup password for server %@ - trying %@", (uint8_t *)&v31, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    _normalizeSetupCode(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tryPairingPassword:onboardingSetupPayloadString:error:", v15, 0, 0);

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (a4 == 2)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v20;
        v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Need ownership proof token for server %@ but there is no productData to look up the app that can provide it", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v9, "addAccessoryProgressHandler");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v21)
        goto LABEL_10;
      objc_msgSend(v8, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](v17, "_progressHandlerForUnpairedAccessory:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "progressHandler");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      if (v21)
      {
LABEL_10:
        v24 = [HMDAddAccessoryProgressState alloc];
        objc_msgSend(v8, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "category");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "productData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v24, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v25, v26, 0, v27, 0, v28);

        ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v21)[2](v21, 10, v29);
      }
    }
    else
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v30;
        v33 = 2112;
        v34 = v6;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Do not have a pair setup password for server %@ - requesting it", (uint8_t *)&v31, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      -[HMDAccessoryBrowser _promptForPairingPasswordForServer:reason:](v17, "_promptForPairingPasswordForServer:reason:", v6, CFSTR("HMSetupCodeProviderReasonInitial"));
    }
  }

}

- (void)accessoryServer:(id)a3 didReceiveBadPasswordThrottleAttemptsWithDelay:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a4 < 1)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Bad password for server %@ - re-prompting for setup code and re-start pairing", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDAccessoryBrowser _promptForPairingPasswordForServer:reason:](v10, "_promptForPairingPasswordForServer:reason:", v6, CFSTR("HMSetupCodeProviderReasonBadPassword"));
  }
  else
  {
    -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _updatePairingRetryTimerForAccessory:delay:](self, "_updatePairingRetryTimerForAccessory:delay:", v8, a4);

  }
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didStopPairingWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server stopped pairing %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "accessoryBrowser:accessoryServer:didStopPairingWithError:", v12, v6, v7);
  }

}

- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4
{
  -[HMDAccessoryBrowser _accessoryServer:didStopPairingWithError:matterPairingEndContext:](self, "_accessoryServer:didStopPairingWithError:matterPairingEndContext:", a3, a4, 0);
}

- (void)_accessoryServer:(id)a3 didStopPairingWithError:(id)a4 matterPairingEndContext:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void (**v13)(void *, void *, uint64_t);
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDAccessoryBrowser *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  int v33;
  void *v34;
  HMDAccessoryBrowser *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  HMDAddAccessoryProgressState *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDAddAccessoryProgressState *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void (**v63)(void *, void *, uint64_t);
  void (**v64)(void *, void *, uint64_t);
  void *v65;
  id v66;
  _QWORD aBlock[4];
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v66 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(v8, "pairingActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke;
  aBlock[3] = &unk_24E790508;
  v12 = v11;
  v68 = v12;
  v13 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  if (objc_msgSend(v8, "linkType") == 2)
  {
    v63 = v13;
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v17;
      v71 = 2112;
      v72 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing BLE Accessory: %@ from discovering list", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](v15, "discoveringBLEAccessoryServerIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v20);

    v13 = v63;
  }
  v21 = v9;
  v22 = v21;
  if (v21)
  {
    v23 = v21;
    if ((objc_msgSend(v21, "isHMError") & 1) == 0)
    {
      mapHAPPairingErrorToHMError(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v23 = 0;
  }
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServer:didStopPairingWithError:](self, "_notifyDelegateOfAccessoryServer:didStopPairingWithError:", v8, v23);
    goto LABEL_34;
  }
  v62 = v12;
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    v26 = v23;
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v70 = v30;
      v71 = 2112;
      v72 = v22;
      v73 = 2112;
      v74 = v8;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Error %@ reported for accessory server %@ corresponding to unpaired accessory that is not in list of currently pairing accessories", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v23 = v26;
    v25 = 0;
  }
  objc_msgSend(v25, "addAccessoryProgressHandler");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void (**)(_QWORD, _QWORD, _QWORD))v31;
  if (!v22)
  {
    v59 = v23;
    if (v31)
      goto LABEL_22;
    objc_msgSend(v24, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](self, "_progressHandlerForUnpairedAccessory:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "progressHandler");
    v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v32)
    {
LABEL_22:
      v58 = objc_msgSend(v24, "certificationStatus");
      v41 = [HMDAddAccessoryProgressState alloc];
      objc_msgSend(v24, "uuid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v60 = v25;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "category");
      v64 = v13;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "productData");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v41, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v42, v43, 0, v44, v58, v45);

      v13 = v64;
      v25 = v60;

      ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v32)[2](v32, 3, v46);
      ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v32)[2](v32, 19, v46);

    }
    objc_msgSend(v8, "identifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v24, "transportTypes");
    objc_msgSend(v8, "setupHash");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser registerPairedAccessory:transports:setupHash:delegate:](self, "registerPairedAccessory:transports:setupHash:delegate:", v47, v48, v49, 0);

    -[HMDAccessoryBrowser _discoverAccessories:](self, "_discoverAccessories:", v8);
    v12 = v62;
    v23 = v59;
    goto LABEL_33;
  }
  -[HMDAccessoryBrowser updateProgressForMappedErrors:accessoryServer:progressHandler:](self, "updateProgressForMappedErrors:accessoryServer:progressHandler:", v23, v8, v31);

  v33 = isIrrecoverableError(v22);
  v34 = (void *)MEMORY[0x227676638]();
  v35 = self;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
  if (!v33)
  {
    if (v37)
    {
      HMFGetLogIdentifier();
      v65 = v34;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v61 = v25;
      v51 = v23;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v70 = v50;
      v71 = 2112;
      v72 = v22;
      v73 = 2112;
      v74 = v52;
      v75 = 2112;
      v76 = v53;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Ignoring didStopPairingWithError:(%@) and starting a pairing interrupted timer for unpaired accessory %@/%@", buf, 0x2Au);

      v23 = v51;
      v25 = v61;

      v34 = v65;
    }

    objc_autoreleasePoolPop(v34);
    objc_msgSend(v25, "pairingRetryTimer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v54)
      v13[2](v13, v22, 1);
    -[HMDAccessoryBrowser _startPairingInterruptionTimer:](v35, "_startPairingInterruptionTimer:", v24);
    v12 = v62;
    if (objc_msgSend(v8, "linkType") == 1)
      -[HMDAccessoryBrowser _addReconfirmTimer:accessoryServer:](v35, "_addReconfirmTimer:accessoryServer:", v24, v8);
    if (objc_msgSend(v8, "linkType") == 2)
    {
      -[HMDAccessoryBrowser btleAccessoryServerBrowser](v35, "btleAccessoryServerBrowser");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "scanState");

      if (!v56)
      {
        -[HMDAccessoryBrowser btleAccessoryServerBrowser](v35, "btleAccessoryServerBrowser");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryBrowser _startDiscoveryForAccessoryServerBrowser:](v35, "_startDiscoveryForAccessoryServerBrowser:", v57);

      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v37)
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v70 = v38;
    v71 = 2112;
    v72 = v8;
    v73 = 2112;
    v74 = v22;
    _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Accessory server %@ failed to pair with irrecoverable error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v34);
  v13[2](v13, v22, 0);
  -[HMDAccessoryBrowser _sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:](v35, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", v8, v23, v66, 0);

  v12 = v62;
LABEL_34:

}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v20;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ finished discovering accessories [error %@]", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v16, "accessoryBrowser:accessoryServer:didDiscoverAccessories:transaction:error:", v18, v10, v11, v12, v13);
  }

}

- (void)accessoryServer:(id)a3 updatePairingProgress:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDAccessoryBrowser *v15;
  NSObject *v16;
  void *v17;
  HMDAddAccessoryProgressState *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAddAccessoryProgressState *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAccessoryProgressHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_4;
    objc_msgSend(v8, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](self, "_progressHandlerForUnpairedAccessory:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "progressHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_4:
      v24 = v9;
      if ((unint64_t)(a4 - 1) > 0x25)
        v13 = 15;
      else
        v13 = qword_2226A0850[a4 - 1];
      v18 = [HMDAddAccessoryProgressState alloc];
      objc_msgSend(v8, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "category");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v18, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v19, v20, 0, v21, 0, v22);

      -[HMDAccessoryBrowser _updateHasActiveWACPairing:](self, "_updateHasActiveWACPairing:", v13);
      ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v10)[2](v10, v13, v23);
      if (v13 == 36)
        ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v10)[2](v10, 3, v23);

      v9 = v24;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@No unpaired accessory for server %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)_updateHasActiveWACPairing:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;

  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((unint64_t)a3 <= 0x31)
  {
    if (((1 << a3) & 0x19000) != 0)
    {
      if (!-[HMDAccessoryBrowser hasActiveWACPairing](self, "hasActiveWACPairing"))
      {
        v6 = 1;
        goto LABEL_9;
      }
    }
    else if (((1 << a3) & 0x2000000002008) != 0
           && -[HMDAccessoryBrowser hasActiveWACPairing](self, "hasActiveWACPairing"))
    {
      v6 = 0;
LABEL_9:
      -[HMDAccessoryBrowser setHasActiveWACPairing:](self, "setHasActiveWACPairing:", v6);
    }
  }
}

- (void)updatePairingWithProgress:(int64_t)a3 accessoryServer:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMDAccessoryBrowser_updatePairingWithProgress_accessoryServer___block_invoke;
  block[3] = &unk_24E796490;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)updateAlreadyPairingProgressForAccessoryServerIdentifier:(id)a3 progressHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAddAccessoryProgressState *v18;
  void *v19;
  HMDAccessoryBrowser *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDAddAccessoryProgressState *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  HMDAddAccessoryProgressState *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "hapAccessoryWithIdentifier:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v7 && v12 && _os_feature_enabled_impl())
  {
    v24 = [HMDAddAccessoryProgressState alloc];
    objc_msgSend(v13, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "manufacturer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "category");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "productData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v24, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v23, v14, v15, v16, 0, v17);

    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Calling progress handler to inform already paired accessory with state: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v7[2](v7, 47, v18);

  }
}

- (void)updateProgressForMappedErrors:(id)a3 accessoryServer:(id)a4 progressHandler:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (objc_msgSend(v10, "isHMError") && _os_feature_enabled_impl())
  {
    v8 = objc_msgSend(v10, "code");
    switch(v8)
    {
      case 11:
        v9 = 11;
        goto LABEL_9;
      case 2015:
        v9 = 9;
        goto LABEL_9;
      case 2016:
        v9 = 10;
LABEL_9:
        -[HMDAccessoryBrowser accessoryServer:updatePairingProgress:](self, "accessoryServer:updatePairingProgress:", v7, v9);
        break;
    }
  }

}

- (void)accessoryServer:(id)a3 didDiscoverAccessories:(id)a4 transaction:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  HMDAccessoryBrowser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  HMDAccessoryBrowser *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  HMDAccessoryBrowser *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (objc_msgSend(v10, "linkType") == 2)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v50 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v10, "hasPairings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "stateNumber"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v65 = v18;
      v66 = 2112;
      v67 = v19;
      v68 = 2112;
      v69 = v20;
      v70 = 2112;
      v71 = v21;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Removing BLE Accessory: %@ that has pairings: %@ with state number: %@", buf, 0x2Au);

      v11 = v50;
      v12 = v54;
    }

    objc_autoreleasePoolPop(v15);
    -[HMDAccessoryBrowser discoveringBLEAccessoryServerIdentifiers](v16, "discoveringBLEAccessoryServerIdentifiers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObject:", v23);

  }
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __80__HMDAccessoryBrowser_accessoryServer_didDiscoverAccessories_transaction_error___block_invoke;
    v60[3] = &unk_24E79C268;
    v25 = v10;
    v61 = v25;
    v26 = v13;
    v62 = v26;
    __80__HMDAccessoryBrowser_accessoryServer_didDiscoverAccessories_transaction_error___block_invoke((uint64_t)v60);
    v55 = v12;
    if (v26)
    {
      v27 = v26;
      v28 = v27;
      if ((objc_msgSend(v27, "isHMError") & 1) == 0)
      {
        objc_msgSend(v27, "domain");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BE1B690]))
        {
          v30 = objc_msgSend(v27, "code");

          if (v30 == 7)
            v31 = 66;
          else
            v31 = 57;
        }
        else
        {

          v31 = 57;
        }
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", v31, CFSTR("Discovery failed."), 0, 0, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v53 = v13;
      v42 = v11;
      v43 = (void *)MEMORY[0x227676638]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = v46;
        v66 = 2112;
        v67 = v25;
        v68 = 2114;
        v69 = v27;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed HAP service discovery on accessory server %@ with error: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v43);
      objc_msgSend(v25, "identifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser deregisterPairedAccessory:](v44, "deregisterPairedAccessory:", v47);

      if (objc_msgSend(v24, "supportsCHIP"))
      {
        +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v27);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      v11 = v42;
      v12 = v55;
      -[HMDAccessoryBrowser _sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:](v44, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", v25, v28, v48, 0);
      -[HMDAccessoryBrowser workQueue](v44, "workQueue");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removePairingForCurrentControllerOnQueue:completion:", v49, 0);

      v13 = v53;
    }
    else
    {
      v32 = (void *)MEMORY[0x227676638]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v35;
        v66 = 2112;
        v67 = v25;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Completed accessory discovery on accessory server %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      -[HMDAccessoryBrowser _sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:](v33, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", v25, 0, 0, 0);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(v24, "accessoryServers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v36)
      {
        v37 = v36;
        v51 = v11;
        v52 = v13;
        v38 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v57 != v38)
              objc_enumerationMutation(v28);
            v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            v41 = objc_msgSend(v40, "linkType");
            if (v41 != objc_msgSend(v25, "linkType"))
              -[HMDAccessoryBrowser _discoverAccessories:](v33, "_discoverAccessories:", v40);
          }
          v37 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        }
        while (v37);
        v11 = v51;
        v13 = v52;
      }
      v12 = v55;
    }

  }
  else
  {
    -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServer:didDiscoverAccessories:transaction:error:](self, "_notifyDelegateOfAccessoryServer:didDiscoverAccessories:transaction:error:", v10, v11, v12, v13);
  }

}

- (void)continueAddingAccessoryToHomeAfterUserConfirmation:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMDAccessoryBrowser *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deviceID");
      v21 = v6;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v19;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ updated values for characteristics at state number %@", buf, 0x2Au);

      v6 = v21;
    }

    objc_autoreleasePoolPop(v16);
    objc_msgSend(v15, "accessoryBrowser:accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v17, v10, v11, v12, v6);
  }

}

- (void)accessoryServer:(id)a3 didUpdateValuesForCharacteristics:(id)a4 stateNumber:(id)a5 broadcast:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v10 = a4;
  v11 = a5;
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:](self, "_notifyDelegateOfAccessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v13, v10, v11, v6);

}

- (void)accessoryServer:(id)a3 didDisconnectWithError:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "primaryAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDAccessoryBrowser pairedHMDHAPAccessoryWithAccessoryServer:](self, "pairedHMDHAPAccessoryWithAccessoryServer:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateSuspendedStateWithConnectionState:hapAccessory:", 0, v5);

  }
}

- (void)accessoryServer:(id)a3 didUpdateWakeNumber:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "primaryAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDAccessoryBrowser pairedHMDHAPAccessoryWithAccessoryServer:](self, "pairedHMDHAPAccessoryWithAccessoryServer:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateSuspendedStateWithWakeNumber:hapAccessory:", v6, v7);

  }
}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v13;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ updated hasPairings to %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "accessoryBrowser:accessoryServer:didUpdateHasPairings:", v11, v6, v4);
  }

}

- (void)accessoryServer:(id)a3 didUpdateHasPairings:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  HMDAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryBrowser *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 1024;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory server %@ with new value of hasPairings: %d", (uint8_t *)&v20, 0x1Cu);

  }
  objc_autoreleasePoolPop(v8);
  if (objc_msgSend(v6, "isPaired"))
  {
    -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServer:didUpdateHasPairings:](v9, "_notifyDelegateOfAccessoryServer:didUpdateHasPairings:", v6, v4);
  }
  else
  {
    -[HMDAccessoryBrowser unpairedAccessoryForServer:](v9, "unpairedAccessoryForServer:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](v9, "_pairingInformationForUnpairedAccessory:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v9;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Ignoring pairing update for accessory server %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
    else if (v4)
    {
      if (v13)
        -[HMDAccessoryBrowser removeUnpairedHAPAccessory:](v9, "removeUnpairedHAPAccessory:", v13);
    }
    else if (!v13)
    {
      -[HMDAccessoryBrowser _addUnpairedAccessoryForServer:](v9, "_addUnpairedAccessoryForServer:", v6);
    }

  }
}

- (void)accessoryServerDidUpdateStateNumber:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, Updated State", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)_notifyDelegateOfAccessoryServer:(id)a3 didUpdateCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v14;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying '%@' that an accessory server %@ updated category to %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "accessoryBrowser:accessoryServer:didUpdateCategory:", v12, v6, v7);
  }

}

- (void)accessoryServer:(id)a3 didUpdateCategory:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "updateCategoryWithCategoryIdentifier:", v6);
  else
    -[HMDAccessoryBrowser _notifyDelegateOfAccessoryServer:didUpdateCategory:](self, "_notifyDelegateOfAccessoryServer:didUpdateCategory:", v9, v6);

}

- (void)accessoryServer:(id)a3 didUpdateName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, Updated Name to %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "setName:", v7);
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, is paired - dropping provided name update to %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)accessoryServer:(id)a3 didFinishAuth:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  HMDAccessoryBrowser *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  HMDAccessoryBrowser *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v6, "tearDownSessionOnAuthCompletion");
  if (v7)
  {
    v10 = (void *)MEMORY[0x227676638](v9);
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v13;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Auth Finished with error: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (objc_msgSend(v7, "isHAPError"))
    {
      v14 = objc_msgSend(v7, "code");
      if (v14 > 0x20)
        v15 = 52;
      else
        v15 = qword_2226A0FE0[v14];
    }
    else if (objc_msgSend(v7, "isHMError"))
    {
      v15 = objc_msgSend(v7, "code");
    }
    else
    {
      v15 = 55;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", v15, CFSTR("Authentication failed"), 0, 0, v7);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser continueAddingAccessoryToHomeAfterUserConfirmation:withError:](v11, "continueAddingAccessoryToHomeAfterUserConfirmation:withError:", v6, v18);
  }
  else
  {
    v16 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    v19 = objc_msgSend(v18, "isPostSoftAuthWacStarted");
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v19)
    {
      if (v23)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v24;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Auth finished with success", (uint8_t *)&v30, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v18, "resetPostSoftAuthWAC");
    }
    else
    {
      if (v23)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v25;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Auth finished with success .. Do regular pair-setup", (uint8_t *)&v30, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      -[HMDAccessoryBrowser unpairedAccessoryForServer:](v21, "unpairedAccessoryForServer:", v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](v21, "_pairingInformationForUnpairedAccessory:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "pairingRequest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "copy");

      objc_msgSend(v29, "setRequiresUserConsent:", 0);
      objc_msgSend(v16, "startPairingWithRequest:", v29);

    }
  }

}

- (void)accessoryServerNeedsOwnershipToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  HMDAddAccessoryProgressState *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAddAccessoryProgressState *v16;
  void *v17;
  HMDAccessoryBrowser *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAccessoryProgressHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_4;
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryBrowser _progressHandlerForUnpairedAccessory:](self, "_progressHandlerForUnpairedAccessory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "progressHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_4:
      v11 = [HMDAddAccessoryProgressState alloc];
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "category");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "productData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v11, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v12, v13, 0, v14, 0, v15);

      ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v8)[2](v8, 8, v16);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v20;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@No unpaired accessory for server %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)accessoryServer:(id)a3 validateUUID:(id)a4 token:(id)a5 model:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDAccessoryBrowser *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessoryBrowser *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDAccessoryBrowser *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v46 = a4;
  v11 = a5;
  v45 = a6;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "compatibilityFeatures") & 1) != 0)
    v14 = 2;
  else
    v14 = 1;
  -[HMDAccessoryBrowser accessoryServer:updatePairingProgress:](self, "accessoryServer:updatePairingProgress:", v10, 5);
  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v19;
      v49 = 2112;
      v50 = v10;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@While validating UUID, cannot find unpaired accessory for server %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20
    || (objc_msgSend(v20, "setupAuthToken"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
  {
    -[HMDAccessoryBrowser authServer](self, "authServer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v45;
    v35 = v46;
    objc_msgSend(v34, "sendPPIDInfoRequest:model:token:authFeatures:uuid:context:", v13, v45, v11, v14, v46, v10);
    goto LABEL_20;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Authentication using internal setup auth token", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(v21, "setupAuthToken");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToData:", v27) & 1) != 0)
  {
    objc_msgSend(v21, "setupAuthTokenUUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v46, "hmf_isEqualToUUID:", v28);

    if (v29)
    {
      v42 = objc_alloc(MEMORY[0x24BE1B9A0]);
      objc_msgSend(v10, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "primaryAccessory");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "manufacturer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "category");
      v43 = v13;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v45;
      v34 = (void *)objc_msgSend(v42, "initWithName:manufacturer:modelName:category:certificationStatus:denylisted:ppid:", v41, v40, v45, v30, CFSTR("CERTIFIED"), CFSTR("NO"), v32);

      v13 = v43;
      -[HMDAccessoryBrowser handlePPIDInfoResponse:context:error:](v24, "handlePPIDInfoResponse:context:error:", v34, v10, 0);
      v35 = v46;
      goto LABEL_20;
    }
  }
  else
  {

  }
  v36 = (void *)MEMORY[0x227676638]();
  v37 = v24;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v48 = v39;
    _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Internal token auth failed", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], -1, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser didFinishActivation:context:](v37, "didFinishActivation:context:", v34, v10);
  v33 = v45;
  v35 = v46;
LABEL_20:

}

- (void)accessoryServer:(id)a3 validateCert:(id)a4 model:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BDBCEA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "currentLocale");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser authServer](self, "authServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getPPIDInfo:model:cert:context:", v13, v9, v10, v11);

}

- (void)accessoryServer:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAccessoryBrowser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessoryBrowser *v21;
  NSObject *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@While authenticating UUID, cannot find unpaired accessory for server %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17
    && (objc_msgSend(v17, "setupAuthToken"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    v20 = (void *)MEMORY[0x227676638](-[HMDAccessoryBrowser accessoryServer:updatePairingProgress:](self, "accessoryServer:updatePairingProgress:", v8, 5));
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Emulating auth token activation following internal setup token authentication", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v24 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    LOWORD(v26) = 8270;
    v25 = 1881788898;
    objc_msgSend(v24, "appendBytes:length:", &v25, 6);
    -[HMDAccessoryBrowser handleActivationResponse:context:](v21, "handleActivationResponse:context:", v24, v8);
  }
  else
  {
    -[HMDAccessoryBrowser authServer](self, "authServer");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendActivationRequest:uuid:context:", v10, v9, v8);
  }

}

- (void)accessoryServer:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAccessoryBrowser *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessoryBrowser *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDAccessoryBrowser unpairedAccessoryForServer:](self, "unpairedAccessoryForServer:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v16;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@While confirming UUID, cannot find unpaired accessory for server %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  -[HMDAccessoryBrowser _pairingInformationForUnpairedAccessory:](self, "_pairingInformationForUnpairedAccessory:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17
    && (objc_msgSend(v17, "setupAuthToken"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    v20 = (void *)MEMORY[0x227676638](-[HMDAccessoryBrowser accessoryServer:updatePairingProgress:](self, "accessoryServer:updatePairingProgress:", v8, 5));
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Wrap up internal setup token authentication", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDAccessoryBrowser didFinishActivation:context:](v21, "didFinishActivation:context:", 0, v8);
  }
  else
  {
    -[HMDAccessoryBrowser authServer](self, "authServer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendActivationConfirmation:uuid:context:", v10, v9, v8);

  }
}

- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 linkLayerType:(int64_t)a5 withError:(id)a6
{
  -[HMDAccessoryBrowser accessoryServer:didUpdateConnectionState:sessionInfo:linkLayerType:withError:](self, "accessoryServer:didUpdateConnectionState:sessionInfo:linkLayerType:withError:", a3, a4, 0, a5, a6);
}

- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 sessionInfo:(id)a5 linkLayerType:(int64_t)a6 withError:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDAccessoryBrowser *v16;
  NSObject *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v10 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v19 = CFSTR("Connected");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Disconnected with error: %@"), v14);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543874;
    v24 = v18;
    v25 = 2112;
    v26 = v12;
    v27 = 2114;
    v28 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %@, updated connection state to %{public}@", buf, 0x20u);
    if (!v10)

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v12, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](v16, "pairedAccessoryInformationWithIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessoryBrowser:accessoryServer:didUpdateConnectionState:sessionInfo:linkLayerType:withError:", v16, v12, v10, v13, a6, v14);

}

- (void)accessoryServer:(id)a3 didUpdateConnectionState:(BOOL)a4 linkLayerType:(int64_t)a5 bookkeeping:(id)a6 withError:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDAccessoryBrowser *v16;
  NSObject *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v10 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v19 = CFSTR("Connected");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Disconnected with error: %@"), v14);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543874;
    v24 = v18;
    v25 = 2112;
    v26 = v12;
    v27 = 2114;
    v28 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory server: %@, updated connection state to %{public}@", buf, 0x20u);
    if (!v10)

  }
  objc_autoreleasePoolPop(v15);
  objc_msgSend(v12, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](v16, "pairedAccessoryInformationWithIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessoryBrowser:accessoryServer:didUpdateConnectionState:linkLayerType:bookkeeping:withError:", v16, v12, v10, a5, v13, v14);

}

- (void)browser:(id)a3 didAddAdvertisements:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__HMDAccessoryBrowser_browser_didAddAdvertisements___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)browser:(id)a3 didRemoveAdvertisements:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__HMDAccessoryBrowser_browser_didRemoveAdvertisements___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)browser:(id)a3 didRemoveSessions:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__HMDAccessoryBrowser_browser_didRemoveSessions___block_invoke;
  block[3] = &unk_24E79C240;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)browser:(id)a3 didUpdateEndpoints:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDAccessoryBrowser *v10;

  v5 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HMDAccessoryBrowser_browser_didUpdateEndpoints___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)browser:(id)a3 didFindAssociatedMediaAccessory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__HMDAccessoryBrowser_browser_didFindAssociatedMediaAccessory___block_invoke;
  v13[3] = &unk_24E790530;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v10, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setReachable:", 1);
}

- (void)browser:(id)a3 didLoseAssociatedMediaAccessory:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[HMDAccessoryBrowser pairedAccessoryInformationWithIdentifier:](self, "pairedAccessoryInformationWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__HMDAccessoryBrowser_browser_didLoseAssociatedMediaAccessory_error___block_invoke;
  v14[3] = &unk_24E790530;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v11, "na_firstObjectPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setReachable:", 0);
}

- (void)didFinishActivation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  HMDAccessoryBrowser *v14;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke;
  block[3] = &unk_24E79BBD0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)handleActivationResponse:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDAccessoryBrowser_handleActivationResponse_context___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)handlePPIDInfoResponse:(id)a3 context:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HMDAccessoryBrowser *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessoryBrowser workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke;
  v15[3] = &unk_24E79A910;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)vendorModel:(id *)a3 vendorManufacturer:(id *)a4 accessoryInfo:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a5;
  if (!((unint64_t)a3 | (unint64_t)a4))
    goto LABEL_11;
  v18 = v7;
  objc_msgSend(v7, "modelName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v18, "manufacturer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[HMDVendorDataManager sharedVendorDataManager](HMDVendorDataManager, "sharedVendorDataManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "manufacturer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "modelName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "vendorModelEntryForManufacturer:model:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "model");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "manufacturer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (v10)
          goto LABEL_6;
LABEL_14:
        objc_msgSend(v18, "manufacturer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        anonymizeUnknownVendorString(v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a3)
          goto LABEL_8;
        goto LABEL_7;
      }
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v18, "modelName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  anonymizeUnknownVendorString(v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_14;
LABEL_6:
  if (a3)
LABEL_7:
    *a3 = objc_retainAutorelease(v15);
LABEL_8:
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  v7 = v18;
LABEL_11:

}

- (void)accessoryServer:(id)a3 didStopPairingWithError:(id)a4 matterPairingEndContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    +[HMDMatterAccessoryPairingEndContext contextFromMTRContext:](HMDMatterAccessoryPairingEndContext, "contextFromMTRContext:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138544130;
    v17 = v15;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling matter didStopPairing with error %@ mtrContext %@ -> hmdContext %@", (uint8_t *)&v16, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDAccessoryBrowser _accessoryServer:didStopPairingWithError:matterPairingEndContext:](v13, "_accessoryServer:didStopPairingWithError:matterPairingEndContext:", v8, v9, v11);

}

- (void)notifyMTRMetrics:(id)a3
{
  void *v4;
  id v5;
  HMDAccessoryBrowser *v6;
  HMDAccessoryBrowser *v7;
  id v8;
  void *v9;
  HMDAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  v6 = self;
  objc_msgSend(v4, "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = v7;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying mtr metrics", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  v15 = CFSTR("HMDMatterAccessoryPairingMTRMetricsKey");
  *(_QWORD *)buf = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("HMDMatterAccessoryUpdatePairingMetricNotification"), 0, v13);

}

- (void)notifyMatterAccessoryPairingStep:(unint64_t)a3
{
  unint64_t v3;

  if (a3 - 1 < 0x16)
    v3 = a3 + 1;
  else
    v3 = 0;
  notifyMatterMetricPairingStep(self, v3);
}

- (void)accessoryServerBrowser:(id)a3 didRemoveAccessoryServer:(id)a4 error:(id)a5 matterPairingEndContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessoryBrowser *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    +[HMDMatterAccessoryPairingEndContext contextFromMTRContext:](HMDMatterAccessoryPairingEndContext, "contextFromMTRContext:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v18;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Handling matter didRemoveAccessoryServer with error %@ mtrContext %@ -> hmdContext %@", (uint8_t *)&v19, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDAccessoryBrowser _accessoryServerBrowser:didRemoveAccessoryServer:error:matterPairingEndContext:](v16, "_accessoryServerBrowser:didRemoveAccessoryServer:error:matterPairingEndContext:", v10, v11, v12, v14);

}

- (id)dumpUnassociatedAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDAccessoryBrowser unassociatedAccessories](self, "unassociatedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDAccessoryBrowser unassociatedAccessories](self, "unassociatedAccessories", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "dumpDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v6, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("kDumpStateUnassociatedAccyDescriptionKey"));
  -[HMDAccessoryBrowser mediaBrowser](self, "mediaBrowser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dumpDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("Media Advertisements"));

  return v3;
}

- (id)dumpRegisteredPairedAccessories
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDAccessoryBrowser pairedAccessories](self, "pairedAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        if ((v8 & 1) != 0)
          objc_msgSend(v3, "appendString:", CFSTR("Registered paired:\n"));
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "transports");
        HMAccessoryTransportTypesToString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("Accessory identifier: %@, Transports: %@, Delegate: %@\n"), v11, v12, v13);

        v8 = 0;
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = 0;
    }
    while (v6);
  }

  return v3;
}

- (HMMTRAccessoryServerBrowser)chipAccessoryServerBrowser
{
  return (HMMTRAccessoryServerBrowser *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)btlePowerState
{
  return self->_btlePowerState;
}

- (void)setBtlePowerState:(BOOL)a3
{
  self->_btlePowerState = a3;
}

- (HMDAccessoryBrowserManagerDelegate)managerDelegate
{
  return (HMDAccessoryBrowserManagerDelegate *)objc_loadWeakRetained((id *)&self->_managerDelegate);
}

- (NSArray)browseableLinkTypes
{
  return self->_browseableLinkTypes;
}

- (BOOL)unitTestEnableWHB
{
  return self->_unitTestEnableWHB;
}

- (void)setUnitTestEnableWHB:(BOOL)a3
{
  self->_unitTestEnableWHB = a3;
}

- (unint64_t)unitTestBTLEReachabilityInterval
{
  return self->_unitTestBTLEReachabilityInterval;
}

- (void)setUnitTestBTLEReachabilityInterval:(unint64_t)a3
{
  self->_unitTestBTLEReachabilityInterval = a3;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (void)setGenerationCounter:(unint64_t)a3
{
  self->_generationCounter = a3;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (NSMutableArray)accessoryServerBrowsers
{
  return self->_accessoryServerBrowsers;
}

- (void)setAccessoryServerBrowsers:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryServerBrowsers, a3);
}

- (void)setDiscoveringAccessoryServerBrowsers:(id)a3
{
  objc_storeStrong((id *)&self->_discoveringAccessoryServerBrowsers, a3);
}

- (HAPAccessoryServerBrowserIP)ipAccessoryServerBrowser
{
  return self->_ipAccessoryServerBrowser;
}

- (void)setIpAccessoryServerBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_ipAccessoryServerBrowser, a3);
}

- (void)setBtleAccessoryServerBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_btleAccessoryServerBrowser, a3);
}

- (HAPAccessoryServerBrowser)hap2AccessoryServerBrowser
{
  return self->_hap2AccessoryServerBrowser;
}

- (void)setHap2AccessoryServerBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_hap2AccessoryServerBrowser, a3);
}

- (HMDHAP2Storage)hap2Storage
{
  return self->_hap2Storage;
}

- (void)setHap2Storage:(id)a3
{
  objc_storeStrong((id *)&self->_hap2Storage, a3);
}

- (HMDMediaBrowser)mediaBrowser
{
  return self->_mediaBrowser;
}

- (void)setMediaBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_mediaBrowser, a3);
}

- (HMDWACBrowser)wacBrowser
{
  return self->_wacBrowser;
}

- (void)setWacBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_wacBrowser, a3);
}

- (HMDAuthServer)authServer
{
  return self->_authServer;
}

- (void)setAuthServer:(id)a3
{
  objc_storeStrong((id *)&self->_authServer, a3);
}

- (HMDAccessoryServerBrowserDemo)demoAccessoryServerBrowser
{
  return self->_demoAccessoryServerBrowser;
}

- (void)setDemoAccessoryServerBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_demoAccessoryServerBrowser, a3);
}

- (HMFTimer)stopReprovisioningTimer
{
  return self->_stopReprovisioningTimer;
}

- (HMFTimer)stopBrowsingAccessoriesNeedingReprovisioningTimer
{
  return self->_stopBrowsingAccessoriesNeedingReprovisioningTimer;
}

- (NSString)identifierOfAccessoryBeingReprovisioned
{
  return self->_identifierOfAccessoryBeingReprovisioned;
}

- (void)setIdentifierOfAccessoryBeingReprovisioned:(id)a3
{
  objc_storeStrong((id *)&self->_identifierOfAccessoryBeingReprovisioned, a3);
}

- (NSData)wiFiPSKForAccessoryReprovisioning
{
  return self->_wiFiPSKForAccessoryReprovisioning;
}

- (void)setWiFiPSKForAccessoryReprovisioning:(id)a3
{
  objc_storeStrong((id *)&self->_wiFiPSKForAccessoryReprovisioning, a3);
}

- (NSString)countrycodeForAccessoryReprovisioning
{
  return self->_countrycodeForAccessoryReprovisioning;
}

- (void)setCountrycodeForAccessoryReprovisioning:(id)a3
{
  objc_storeStrong((id *)&self->_countrycodeForAccessoryReprovisioning, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setPairedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAccessories, a3);
}

- (OS_dispatch_source)reachabilityTimerForBTLE
{
  return self->_reachabilityTimerForBTLE;
}

- (void)setReachabilityTimerForBTLE:(id)a3
{
  objc_storeStrong((id *)&self->_reachabilityTimerForBTLE, a3);
}

- (NSMutableArray)currentlyPairingAccessories
{
  return self->_currentlyPairingAccessories;
}

- (void)setCurrentlyPairingAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyPairingAccessories, a3);
}

- (NSMutableArray)currentlyPairingProgressHandlers
{
  return self->_currentlyPairingProgressHandlers;
}

- (void)setCurrentlyPairingProgressHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyPairingProgressHandlers, a3);
}

- (NSHashTable)tombstonedHAPAccessoryServers
{
  return self->_tombstonedHAPAccessoryServers;
}

- (NSHashTable)discoveringBLEAccessoryServerIdentifiers
{
  return self->_discoveringBLEAccessoryServerIdentifiers;
}

- (NSMutableSet)discoveredAccessoryServerIdentifiers
{
  return self->_discoveredAccessoryServerIdentifiers;
}

- (void)setDiscoveredAccessoryServerIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredAccessoryServerIdentifiers, a3);
}

- (BOOL)hasActiveWACPairing
{
  return self->_hasActiveWACPairing;
}

- (void)setHasActiveWACPairing:(BOOL)a3
{
  self->_hasActiveWACPairing = a3;
}

- (BOOL)exposeAccessoryTypesFeatureEnabled
{
  return self->_exposeAccessoryTypesFeatureEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveringBLEAccessoryServerIdentifiers, 0);
  objc_storeStrong((id *)&self->_tombstonedHAPAccessoryServers, 0);
  objc_storeStrong((id *)&self->_currentlyPairingProgressHandlers, 0);
  objc_storeStrong((id *)&self->_currentlyPairingAccessories, 0);
  objc_storeStrong((id *)&self->_reachabilityTimerForBTLE, 0);
  objc_storeStrong((id *)&self->_pairedAccessories, 0);
  objc_storeStrong((id *)&self->_countrycodeForAccessoryReprovisioning, 0);
  objc_storeStrong((id *)&self->_wiFiPSKForAccessoryReprovisioning, 0);
  objc_storeStrong((id *)&self->_identifierOfAccessoryBeingReprovisioned, 0);
  objc_storeStrong((id *)&self->_stopBrowsingAccessoriesNeedingReprovisioningTimer, 0);
  objc_storeStrong((id *)&self->_stopReprovisioningTimer, 0);
  objc_storeStrong((id *)&self->_demoAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_authServer, 0);
  objc_storeStrong((id *)&self->_wacBrowser, 0);
  objc_storeStrong((id *)&self->_mediaBrowser, 0);
  objc_storeStrong((id *)&self->_hap2Storage, 0);
  objc_storeStrong((id *)&self->_hap2AccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_btleAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_ipAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_discoveringAccessoryServerBrowsers, 0);
  objc_storeStrong((id *)&self->_accessoryServerBrowsers, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_browseableLinkTypes, 0);
  objc_destroyWeak((id *)&self->_unpairedAccessoryManagerDelegate);
  objc_destroyWeak((id *)&self->_managerDelegate);
  objc_storeStrong((id *)&self->_accessoryPerformingWAC, 0);
  objc_storeStrong((id *)&self->_chipAccessoryServerBrowser, 0);
  objc_storeStrong((id *)&self->_discoveredAccessoryServerIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_browsingConnections, 0);
  objc_storeStrong((id *)&self->_unassociatedCurrentAccessory, 0);
  objc_storeStrong((id *)&self->_unassociatedWACAccessories, 0);
  objc_storeStrong((id *)&self->_deviceSetupMediaAccessories, 0);
  objc_storeStrong((id *)&self->_unassociatedMediaAccessories, 0);
  objc_storeStrong((id *)&self->_unpairedHAPAccessories, 0);
}

void __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15[9];
  id v16;
  id v17;

  v2 = a1[4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v17 = 0;
  v16 = 0;
  objc_msgSend(a1[5], "vendorModel:vendorManufacturer:accessoryInfo:", &v17, &v16, a1[6]);
  v5 = v17;
  v6 = v16;
  v15[0] = (id)MEMORY[0x24BDAC760];
  v15[1] = (id)3221225472;
  v15[2] = __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke_2;
  v15[3] = &unk_24E79AD20;
  v7 = v4;
  v15[4] = v7;
  v8 = v5;
  v15[5] = v8;
  v9 = v6;
  v15[6] = v9;
  v10 = a1[6];
  v15[7] = v10;
  v11 = a1[7];
  v15[8] = v11;
  __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke_2(v15);
  objc_msgSend(a1[6], "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = a1[5];
    objc_msgSend(a1[6], "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessoryServer:didUpdateName:", v7, v14);

  }
  objc_msgSend(a1[5], "accessoryServer:requestUserPermission:accessoryInfo:error:", v7, 2, a1[6], a1[7]);

}

void __60__HMDAccessoryBrowser_handlePPIDInfoResponse_context_error___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(a1[4], "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[4], "pairingActivity");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "category");

    objc_msgSend(a1[7], "isCertified");
    v3 = (id)HMFBooleanToString();
    objc_msgSend(a1[7], "isDenylisted");
    v4 = (id)HMFBooleanToString();
    objc_msgSend(a1[8], "domain");

    objc_msgSend(a1[8], "code");
  }
}

void __56__HMDAccessoryBrowser_handleActivationResponse_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v14 = 138543874;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Got Token activation response for server: %@, T1: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(id *)(a1 + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (objc_msgSend(v10, "isPreSoftAuthWacStarted"))
  {
    objc_msgSend(v10, "setToken:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v10, "pairSetupStartSoftAuthWAC");
  }
  else
  {
    v11 = *(id *)(a1 + 40);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    objc_msgSend(v13, "provisionToken:", *(_QWORD *)(a1 + 48));
  }

}

void __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[6];

  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke_2;
  v8[3] = &unk_24E79C268;
  v5 = *(void **)(a1 + 40);
  v8[4] = v4;
  v8[5] = v5;
  v6 = v5;
  v7 = v4;
  __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke_2((uint64_t)v8);
  objc_msgSend(*(id *)(a1 + 48), "accessoryServer:didFinishAuth:", v7, *(_QWORD *)(a1 + 40));

}

void __51__HMDAccessoryBrowser_didFinishActivation_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }
}

uint64_t __69__HMDAccessoryBrowser_browser_didLoseAssociatedMediaAccessory_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __63__HMDAccessoryBrowser_browser_didFindAssociatedMediaAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __50__HMDAccessoryBrowser_browser_didUpdateEndpoints___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *j;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v14)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v3, "advertisements");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v5 = v4;
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v6; j = (char *)j + 1)
            {
              if (*(_QWORD *)v16 != v7)
                objc_enumerationMutation(v5);
              objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), "identifier");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "pairedAccessoryInformationWithIdentifier:", v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "delegate");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11)
              {
                objc_msgSend(v10, "delegate");
                v6 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_16;
              }

            }
            v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v6)
              continue;
            break;
          }
        }
LABEL_16:

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "accessoryBrowser:didUpdateEndpoint:", *(_QWORD *)(a1 + 40), v3);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

}

void __49__HMDAccessoryBrowser_browser_didRemoveSessions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v5 = CFSTR("kRemovedMediaSessionIdentifiersKey");
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("HMDMediaSessionsRemovedNotification"), 0, v4);

  }
}

uint64_t __55__HMDAccessoryBrowser_browser_didRemoveAdvertisements___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRemovedAccessoryAdvertisements:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__HMDAccessoryBrowser_browser_didAddAdvertisements___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAddedAccessoryAdvertisements:", *(_QWORD *)(a1 + 40));
}

void __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  void *v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a1[4])
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = a1[5];
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Authentication failed for adding accessory to home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
    if (objc_msgSend(a1[6], "communicationProtocol") == 2)
    {
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, a1[4]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v14 = a1[6];
    objc_msgSend(a1[5], "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke_509;
    v21[3] = &unk_24E792CD8;
    v16 = a1[6];
    v21[4] = a1[5];
    v22 = v16;
    v23 = a1[4];
    v24 = v6;
    objc_msgSend(v14, "removePairingForCurrentControllerOnQueue:completion:", v15, v21);

  }
  else
  {
    objc_msgSend(a1[5], "unpairedAccessoryForServer:", a1[6]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", a1[6], 0, 0, 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "accessoryServers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "linkType");
          if (v13 != objc_msgSend(a1[6], "linkType"))
            objc_msgSend(a1[5], "_discoverAccessories:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v9);
    }

  }
}

uint64_t __84__HMDAccessoryBrowser_continueAddingAccessoryToHomeAfterUserConfirmation_withError___block_invoke_509(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

void __80__HMDAccessoryBrowser_accessoryServer_didDiscoverAccessories_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }
}

uint64_t __65__HMDAccessoryBrowser_updatePairingWithProgress_accessoryServer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryServer:updatePairingProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v8 = a2;
  objc_msgSend(v8, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = v8;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke_2;
  v9[3] = &unk_24E799CF0;
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = a3;
  v7 = v10;
  __88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke_2(v9);

}

_QWORD *__88__HMDAccessoryBrowser__accessoryServer_didStopPairingWithError_matterPairingEndContext___block_invoke_2(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "domain");

    objc_msgSend((id)v2[5], "code");
    return (id)HMFBooleanToString();
  }
  return result;
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[8];
  id v9;
  id v10;

  if (*(_QWORD *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    if (*(_QWORD *)(a1 + 40))
    {
      v2 = *(void **)(a1 + 48);
      v9 = 0;
      v10 = 0;
      objc_msgSend(v2, "vendorModel:vendorManufacturer:accessoryInfo:", &v10, &v9);
      v3 = v10;
      v4 = v9;
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_2;
    v8[3] = &unk_24E795658;
    v5 = *(id *)(a1 + 32);
    v8[4] = v5;
    v8[5] = v3;
    v6 = *(_QWORD *)(a1 + 64);
    v8[6] = v4;
    v8[7] = v6;
    v7 = v3;
    __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_2(v8);

  }
}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_3(uint64_t a1, void *a2, char a3, char a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[7];
  char v13;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  if (v8 && (a4 & 1) == 0)
  {
    v12[1] = 3221225472;
    v12[2] = __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_4;
    v12[3] = &unk_24E790468;
    v9 = *(_QWORD *)(a1 + 40);
    v12[5] = v7;
    v12[6] = v9;
    v13 = a3;
    v12[4] = v8;
    v11 = v7;
    v12[0] = MEMORY[0x24BDAC760];
    v10 = v8;
    __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_4((uint64_t)v12);

    v7 = v11;
  }

}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_5(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  int v42;
  id v43;
  _BOOL4 v44;
  uint64_t v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if ((a2 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 72);
      v8 = (void *)MEMORY[0x227676638]();
      v9 = v5;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v7 == 2)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v12;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@User denied adding accessory after PPID conf.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(v9, "_continueAfterPPIDValidation:server:", 0, *(_QWORD *)(a1 + 32));
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v16;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@User canceled pairing, stopping pairing...\n", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(*(id *)(a1 + 32), "stopPairingWithError:", 0);
        objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2001);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = *MEMORY[0x24BDD1398];
        v46 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 23, v18);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = v17;
        v21 = v20;
        if (*(_QWORD *)(a1 + 72) == 4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", 93, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v22;
          v23 = v19;
        }
        else
        {
          v23 = v20;
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        if (objc_msgSend(*(id *)(a1 + 32), "communicationProtocol") == 2)
        {
          +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, *(_QWORD *)(a1 + 40));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        objc_msgSend(v9, "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", *(_QWORD *)(a1 + 32), v19, v24, 0);

      }
    }
    else
    {
      objc_msgSend(v5, "unpairedAccessoryForServer:", *(_QWORD *)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_pairingInformationForUnpairedAccessory:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      switch(*(_QWORD *)(a1 + 72))
      {
        case 0:
          objc_msgSend(v14, "setAllowAddUnauthenticatedAccessory:", 1);
          goto LABEL_38;
        case 1:
          objc_msgSend(v14, "setProvideNetworkCredentialsToAccessory:", 1);
          objc_msgSend(v14, "setupCode");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)MEMORY[0x227676638]();
            v27 = v5;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              goto LABEL_36;
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v29;
            v30 = "%{public}@Legacy WAC accessory - password provided ahead of time - continuing pairing process...\n";
          }
          else
          {
            v42 = objc_msgSend(v14, "setupCodeProvided");
            v26 = (void *)MEMORY[0x227676638]();
            v43 = v5;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            v44 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
            if (v42)
            {
              if (!v44)
                goto LABEL_36;
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v48 = v29;
              v30 = "%{public}@Legacy WAC accessory - setup code provided by user - continuing pairing process...\n";
            }
            else
            {
              if (!v44)
                goto LABEL_36;
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v48 = v29;
              v30 = "%{public}@Legacy WAC accessory - continuing pairing even though setup code is yet to be provided...\n";
            }
          }
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, v30, buf, 0xCu);

LABEL_36:
LABEL_37:
          objc_autoreleasePoolPop(v26);
LABEL_38:
          objc_msgSend(*(id *)(a1 + 32), "continuePairingAfterAuthPrompt");
LABEL_39:

          break;
        case 2:
          v31 = (void *)MEMORY[0x227676638](v15);
          v32 = v5;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v34;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@User confirmed accessory PPID Info .. continuing with auth.", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v31);
          objc_msgSend(v32, "_continueAfterPPIDValidation:server:", 1, *(_QWORD *)(a1 + 32));
          goto LABEL_39;
        case 3:
          v26 = (void *)MEMORY[0x227676638](v15);
          v35 = v5;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v37;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@User confirmed accessory Info .. continuing pairing", buf, 0xCu);

          }
          goto LABEL_37;
        case 5:
          v38 = (void *)MEMORY[0x227676638](v15);
          v39 = v5;
          HMFGetOSLogHandle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v41;
            _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@User confirmed accessory Info .. continuing wac pairing", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v38);
          objc_msgSend(*(id *)(a1 + 32), "continuePairingUsingWAC");
          goto LABEL_39;
        default:
          goto LABEL_39;
      }
    }
  }

}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_497(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    if (a2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "setAllowAddUnauthenticatedAccessory:", 1);
      objc_msgSend(v6, "_callProgressOrErrorOut:pairingInfo:accessoryInfo:unpairedAccessory:progress:certStatus:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 6, 2);
    }
    WeakRetained = v6;
  }

}

void __81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  id v6;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v6 = v1;
    v3 = (id)HAPUserPermissionTypeDescription();
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v5 = (id)HMFBooleanToString();
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }
}

_QWORD *__81__HMDAccessoryBrowser_accessoryServer_requestUserPermission_accessoryInfo_error___block_invoke_2(_QWORD *result)
{
  _QWORD *v1;
  id v2;

  if (result[4])
  {
    v1 = result;
    v2 = (id)HAPUserPermissionTypeDescription();
    return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v1[7]);
  }
  return result;
}

void __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *, void *);
  void *v6;
  uint64_t v7;
  id v8;

  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke_2;
  v6 = &unk_24E790418;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v2 = _Block_copy(&v3);
  objc_msgSend(*(id *)(a1 + 40), "retrieveThreadNetworkMetadataWithCompletion:", v2, v3, v4, v5, v6, v7);

}

void __115__HMDAccessoryBrowser_accessoryServerBrowser_getThreadNetworkCredentialsForAccessoryWithIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve Thread Network metadata", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_getHAPMetadataFromHMMetadata:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Returning Thread Credentials as %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __82__HMDAccessoryBrowser__notifyDelegateOfDiscoveryFailure_accessoryServer_linkType___block_invoke(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(a1 + 40);
    v4 = v1;
    objc_msgSend(v3, "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }
}

void __62__HMDAccessoryBrowser__handlePairingInterruptedTimeout_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    if (objc_msgSend(*(id *)(a1 + 32), "supportsCHIP"))
    {
      +[HMDMatterAccessoryPairingEndContext hmdContextWithCancelledError:](HMDMatterAccessoryPairingEndContext, "hmdContextWithCancelledError:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x227676638]();
      v7 = v3;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 40);
        v23 = 138544386;
        v24 = v9;
        v25 = 2112;
        v26 = v10;
        v27 = 2112;
        v28 = v11;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = v5;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Indicating addAccessory failure for matter accessory %@(%@) with error %@ context %@", (uint8_t *)&v23, 0x34u);

      }
    }
    else
    {
      v6 = (void *)MEMORY[0x227676638]();
      v13 = v3;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 40);
        v23 = 138544130;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        v27 = 2112;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Indicating addAccessory failure for accessory %@(%@) with error %@", (uint8_t *)&v23, 0x2Au);

      }
      v5 = 0;
    }

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v3, "_cancelPairingWithAccessory:error:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(v3, "_pairingInformationForUnpairedAccessory:", *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "currentlyPairingAccessories");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObject:", v18);

    }
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_progressHandlerForUnpairedAccessory:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v3, "currentlyPairingProgressHandlers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObject:", v21);

    }
  }

}

void __63__HMDAccessoryBrowser__removePairingInformation_error_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "domain");

    objc_msgSend(*(id *)(a1 + 40), "code");
  }
}

void __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke(uint64_t a1, char a2, char a3)
{
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke_2;
  v10[3] = &unk_24E7903C8;
  v7 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = a2;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  v15 = a3;
  dispatch_async(v6, v10);

}

void __90__HMDAccessoryBrowser__notifyDelegateOfNewPairedAccessoryServer_stateChanged_stateNumber___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || *(_BYTE *)(a1 + 56)
    || (v2 = objc_msgSend(*(id *)(a1 + 32), "isPaired"),
        v2 == objc_msgSend(*(id *)(a1 + 32), "hasPairings")))
  {
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 40), "_discoverAccessories:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v3 = (void *)MEMORY[0x227676638]();
      v4 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 32);
        v8 = 138543618;
        v9 = v6;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Not allowed to discover accessory server: %@", (uint8_t *)&v8, 0x16u);

      }
      objc_autoreleasePoolPop(v3);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_tombstoneAccessoryServer:forceNotify:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 57));
  }
}

void __109__HMDAccessoryBrowser__sendPairingCompletionStatusForServer_error_matterPairingEndContext_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  id v8;
  char isKindOfClass;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(v3, "_pairingInformationForUnpairedAccessory:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAccessoryCompletionHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "setAddAccessoryCompletionHandler:", 0);
    if (!v6)
    {
      v22 = (void *)MEMORY[0x227676638](v7);
      v23 = v3;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v49 = v25;
        v50 = 2112;
        v51 = v26;
        v52 = 2112;
        v53 = v27;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@No addAccessory completion handler for %@ - error %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      goto LABEL_27;
    }
    v8 = *(id *)(a1 + 40);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v10 = (void *)MEMORY[0x227676638]();
    v11 = v3;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if ((isKindOfClass & 1) != 0 && v8)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138543874;
        v49 = v14;
        v50 = 2112;
        v51 = v15;
        v52 = 2112;
        v53 = v16;
        v17 = "%{public}@Invoking addAccessory completion handler with error %@ context %@";
        v18 = v12;
        v19 = 32;
LABEL_15:
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);

      }
    }
    else if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v49 = v14;
      v50 = 2112;
      v51 = v28;
      v17 = "%{public}@Invoking addAccessory completion handler with error %@";
      v18 = v12;
      v19 = 22;
      goto LABEL_15;
    }

    objc_autoreleasePoolPop(v10);
    v29 = objc_msgSend(*(id *)(a1 + 32), "certificationStatus");
    if (v29)
      v30 = v29;
    else
      v30 = 2;
    v31 = *(id *)(a1 + 40);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    if (v33)
    {
      if (objc_msgSend(v33, "isCertified"))
        v30 = 2;
      else
        v30 = 1;
    }
    v34 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))v6)[2](v6, v34, v35, v30, objc_msgSend(v5, "wacAccessory"), objc_msgSend(v5, "legacyWAC"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

LABEL_27:
    if (*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 40), "pendingRemovePairing") != 1)
    {
      objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend(v36, "removeAccessoryKeyForName:error:", v37, &v47);
      v38 = v47;

      if (v38)
      {
        v39 = (void *)MEMORY[0x227676638]();
        v40 = v3;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *(_QWORD *)(a1 + 32);
          v44 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543874;
          v49 = v42;
          v50 = 2112;
          v51 = v43;
          v52 = 2112;
          v53 = v44;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove keychain entry for accessory %@ - error %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v39);
      }

    }
    v45 = _Block_copy(*(const void **)(a1 + 64));
    v46 = v45;
    if (v45)
      (*((void (**)(void *))v45 + 2))(v45);

    goto LABEL_37;
  }
  v20 = _Block_copy(*(const void **)(a1 + 64));
  v21 = v20;
  if (v20)
    (*((void (**)(void *))v20 + 2))(v20);

LABEL_37:
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v11 = a2;
  v5 = a3;
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
    v7 = v5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2;
  v12[3] = &unk_24E79BBD0;
  v13 = *(id *)(a1 + 32);
  v14 = v11;
  v15 = v7;
  v10 = v13;
  __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2((uint64_t)v12);

}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_454(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pairingActivity");

  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2_458(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_3;
    block[3] = &unk_24E790350;
    v22 = a1[8];
    v14 = a1[4];
    v15 = v9;
    v16 = a1[5];
    v17 = a1[6];
    v18 = v11;
    v19 = v7;
    v20 = a1[7];
    v21 = v8;
    dispatch_async(v12, block);

  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "stopPairingWithError:", 0);
    v2 = objc_msgSend(*(id *)(a1 + 56), "supportsCHIP");
    v3 = 0;
    if (v2)
    {
      +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, *(_QWORD *)(a1 + 40));
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v3;
    objc_msgSend(*(id *)(a1 + 64), "_sendPairingCompletionStatusForServer:error:matterPairingEndContext:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3, 0);

  }
  else if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 80), "setSetupCode:");
    v4 = *(void **)(a1 + 48);
    _normalizeSetupCode(*(void **)(a1 + 72));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tryPairingPassword:onboardingSetupPayloadString:error:");

  }
}

void __65__HMDAccessoryBrowser__promptForPairingPasswordForServer_reason___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pairingActivity");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "domain");

    objc_msgSend(*(id *)(a1 + 48), "code");
  }
}

_QWORD *__70__HMDAccessoryBrowser__pairAccessory_configuration_completionHandler___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "accessoryUUID");

    objc_msgSend((id)v2[5], "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)HMFBooleanToString();

    objc_msgSend((id)v2[5], "wacAccessory");
    v7 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "legacyWAC");
    v8 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "linkType");
    v9 = (id)HAPLinkTypeDescription();
    objc_msgSend((id)v2[6], "communicationProtocol");

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

BOOL __60__HMDAccessoryBrowser__isHomeHubAvailableWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

BOOL __68__HMDAccessoryBrowser__isPrimaryResidentReachableWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[6];
  BOOL v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v9, "pendingRemovePairing");
  v13 = v12 != 0;
  if (v12)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v17;
      v49 = 2112;
      v50 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Waiting for the prior pending pairing to be removed from the accessory before proceeding with adding accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  else if (a2)
  {
    if (v9)
    {
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v9, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "updateAlreadyPairingProgressForAccessoryServerIdentifier:progressHandler:", v20, *(_QWORD *)(a1 + 64));

      v21 = 13;
    }
    else
    {
      v21 = 11;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v21);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 72))
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v44 = v38;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v41;
        v49 = 2112;
        v50 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed because its already associated to home %@", buf, 0x16u);

        v38 = v44;
      }

      objc_autoreleasePoolPop(v38);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    goto LABEL_27;
  }
  if (!v10)
  {
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_426;
    v45[3] = &unk_24E799CF0;
    v25 = *(id *)(a1 + 40);
    v45[4] = v25;
    v26 = *(id *)(a1 + 48);
    v45[5] = v26;
    v46 = v13;
    v27 = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_426(v45);
    if (!v9)
    {
      v28 = (void *)MEMORY[0x227676638](v27);
      v29 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setupID");
        v43 = v28;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "debugDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v31;
        v49 = 2112;
        v50 = v32;
        v51 = 2112;
        v52 = v33;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Waiting for discovery of accessory with setupID %@ (%@) to start pairing", buf, 0x20u);

        v28 = v43;
      }

      objc_autoreleasePoolPop(v28);
    }
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  if (!v11)
  {
    v22 = (void *)objc_msgSend(v10, "copy");
    +[HMDMatterAccessoryPairingEndContext hmdContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmdContextWithStep:error:", 2, v22);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(v10, "domain");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)*MEMORY[0x24BE1B690])
    {
      mapHAPPairingErrorToHMError(v10);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = v10;
    }
    v25 = v24;

    v34 = (void *)MEMORY[0x227676638]();
    v35 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v37;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed with fatal error", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_28;
  }
LABEL_29:

}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_431(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_2;
  v7[3] = &unk_24E7902B0;
  v9 = *(_OWORD *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "matchAccessoryServerWithSetupID:serverIdentifier:completionHandler:", v6, v5, v7);

}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "chipAccessorySetupPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "chipAccessoryServerBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "homeManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "homeUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_homeWithUUID:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fabric");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "chipAccessoryServerBrowser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "chipSetupPayload");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "chipFabricID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 40), "_isOwnerPairingAccessoryWithConfiguration:", *(_QWORD *)(a1 + 48));
      v12 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "homeUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "supportsCommissioningCertificateRetrievalForHomeUUID:", v13);
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_4;
      v15[3] = &unk_24E790300;
      v16 = *(id *)(a1 + 56);
      objc_msgSend(v8, "prepareForPairingWithSetupPayload:fabric:fabricID:owner:ownerCertFetchSupported:completionHandler:", v9, v7, v10, v11, v14, v15);

      goto LABEL_5;
    }
  }
  else
  {

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_5:

}

_QWORD *__101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_438(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "accessoryUUID");

    objc_msgSend((id)v2[5], "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)HMFBooleanToString();

    objc_msgSend((id)v2[5], "wacAccessory");
    v7 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "legacyWAC");
    v8 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "linkType");
    v9 = (id)HAPLinkTypeDescription();
    objc_msgSend((id)v2[6], "communicationProtocol");

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    +[HMDMatterAccessoryPairingEndContext hmmtrContextWithStep:error:](HMDMatterAccessoryPairingEndContext, "hmmtrContextWithStep:error:", 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

_QWORD *__101__HMDAccessoryBrowser__pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke_426(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)HMFBooleanToString();

    objc_msgSend((id)v2[5], "wacAccessory");
    v7 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "linkType");

    v8 = (id)HAPLinkTypeDescription();
    return (id)HMFBooleanToString();
  }
  return result;
}

uint64_t __75__HMDAccessoryBrowser_cancelPairingWithAccessoryDescription_error_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPairingWithAccessoryDescription:error:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __59__HMDAccessoryBrowser__setBTLEPowerChangeCompletionHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  NSObject *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained
    && objc_msgSend(v7, "code") != 48
    && objc_msgSend(WeakRetained, "btlePowerState") != (_DWORD)a2)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    objc_msgSend(WeakRetained, "setBtlePowerState:", a2);
    if ((a2 & 1) != 0)
      objc_msgSend(WeakRetained, "_btleAccessoryReachabilityProbeTimer:", 1);
    else
      objc_msgSend(WeakRetained, "_notifyDelegateOfReachabilityChangeChange:forBTLEAccessories:", 0, 0);
  }

}

void __68__HMDAccessoryBrowser__handleCurrentWiFiNetworkChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR(" not");
    if (!v3)
      v9 = &stru_24E79DB48;
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@WiFi network connection changed; Thread preferred network database%@ updated",
      (uint8_t *)&v10,
      0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __50__HMDAccessoryBrowser___handleProcessStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v6 <= 4 && ((1 << v6) & 0x1A) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_cancelCurrentlyPairingAccessories:linkType:", 2501, 0);
}

- (BOOL)doesLinkTypeNumber:(uint64_t)a3 matchLinkType:
{
  id v5;
  void *v6;
  _BOOL8 v7;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (v5)
      v7 = objc_msgSend(v5, "integerValue") == a3;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __48__HMDAccessoryBrowser_resurrectAccessoryServer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resurrectAccessoryServer:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__HMDAccessoryBrowser_tombstoneAccessoryServer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tombstoneAccessoryServer:forceNotify:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __43__HMDAccessoryBrowser_discoverAccessories___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverAccessories:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__HMDAccessoryBrowser_restartBrowsers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartBrowsers");
}

uint64_t __71__HMDAccessoryBrowser_startDiscoveringAccessoriesNeedingReprovisioning__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDiscoveringAccessoriesNeedingReprovisioning");
}

uint64_t __90__HMDAccessoryBrowser_currentlyFoundHAPAccessoryServerWithIdentifier_linkType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_QWORD *__36__HMDAccessoryBrowser_timerDidFire___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "accessoryUUID");

    objc_msgSend((id)v2[5], "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)HMFBooleanToString();

    objc_msgSend((id)v2[5], "wacAccessory");
    v7 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "legacyWAC");
    v8 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "linkType");
    v9 = (id)HAPLinkTypeDescription();
    objc_msgSend((id)v2[6], "communicationProtocol");

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

uint64_t __54__HMDAccessoryBrowser_evaluateAccessoryDiscoveryState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startOrStopAccessoryDiscovery");
}

void __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_393(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "identifiersOfPairedBTLEAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_2;
  v24[3] = &unk_24E797670;
  v24[4] = WeakRetained;
  objc_msgSend(v3, "na_map:", v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(WeakRetained, "areThereAnyPairedUnknownLinkTypeAccessories"))
  {
    objc_msgSend(WeakRetained, "identifiersOfPairedUnknownLinkTypeAccessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(WeakRetained, "btleAccessoryServerBrowser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_msgSend(v5, "count");

    if (v9)
    {
      v19 = v4;
      v20 = 3221225472;
      v21 = __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_3;
      v22 = &unk_24E7901F0;
      objc_copyWeak(&v23, v1);
      v10 = _Block_copy(&v19);
      v14 = (void *)MEMORY[0x227676638](v10, v11, v12, v13);
      v15 = WeakRetained;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@BTLE reachability probe timer fired.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v15, "btleAccessoryServerBrowser", v19, v20, v21, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "probeReachabilityForAccessoryServersWithIdentifiers:forceScan:withCompletion:", v5, 0, v10);

      objc_destroyWeak(&v23);
    }
  }

}

id __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pairedAccessoryInformationWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "isCurrentDeviceAvailableResident"))
  {
    v8 = v3;
  }
  else
  {
    if (v7)
    {
      +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isResidentCapable");

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v7, "hapAccessoryWithIdentifier:instanceID:", v3, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && (objc_msgSend(v11, "reachableTransports") & 9) == 0)
        {
          v8 = v3;

          goto LABEL_12;
        }

      }
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

void __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_notifyDelegateOfReachabilityChangeChange:forBTLEAccessories:", a3, v5);

}

uint64_t __60__HMDAccessoryBrowser__btleAccessoryReachabilityProbeTimer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "homeLocation") == 1 || (objc_msgSend(v2, "isAnyBTLEAccessoryReachable") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isCurrentDeviceAvailableResident");

  return v3;
}

void __64__HMDAccessoryBrowser_cancelPairingWithAccessory_error_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_cancelPairingWithAccessory:error:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "_pairingInformationForUnpairedAccessory:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentlyPairingAccessories");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObject:", v7);

  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_progressHandlerForUnpairedAccessory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentlyPairingProgressHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v5);

  }
}

uint64_t __48__HMDAccessoryBrowser_handleSetupCodeAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupCodeAvailable:", *(_QWORD *)(a1 + 40));
}

void __84__HMDAccessoryBrowser_didReceiveUserConsentResponseForSetupAccessoryDetail_consent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  HMDAddAccessoryProgressState *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAddAccessoryProgressState *v14;
  _BOOL8 v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "findAccessoryServerForAccessoryDescription:", *(_QWORD *)(a1 + 40));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unpairedAccessoryForServer:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_pairingInformationForUnpairedAccessory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "addAccessoryProgressHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_4;
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v2, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_progressHandlerForUnpairedAccessory:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "progressHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_4:
      v9 = [HMDAddAccessoryProgressState alloc];
      objc_msgSend(v2, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "category");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "productData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAddAccessoryProgressState initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:](v9, "initWithUUID:accessoryName:manufacturerName:category:certificationStatus:productData:", v10, v11, 0, v12, 1, v13);

      ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v5)[2](v5, 2, v14);
      ((void (**)(_QWORD, uint64_t, HMDAddAccessoryProgressState *))v5)[2](v5, 7, v14);

    }
    v15 = *(_BYTE *)(a1 + 48) != 0;
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_continueAfterPPIDValidation:server:", v15, v16);

}

void __66__HMDAccessoryBrowser_removePairingInformationForAccessoryServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "unpairedAccessoryForServer:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_removePairingInformationForUnpairedAccessory:", v2);
    v2 = v3;
  }

}

uint64_t __100__HMDAccessoryBrowser_pairAccessoryWithDescription_configuration_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairAccessoryWithDescription:configuration:progressHandler:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __69__HMDAccessoryBrowser_pairAccessory_configuration_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairAccessory:configuration:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __69__HMDAccessoryBrowser_registerProgressHandler_unpairedAccessoryUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  HMDUnpairedHAPAccessoryProgressHandler *v5;

  objc_msgSend(*(id *)(a1 + 32), "_progressHandlerForUnpairedAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentlyPairingProgressHandlers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v2);

  }
  v5 = -[HMDUnpairedHAPAccessoryProgressHandler initWithAccessoryUUID:progressHandler:]([HMDUnpairedHAPAccessoryProgressHandler alloc], "initWithAccessoryUUID:progressHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "currentlyPairingProgressHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

void __61__HMDAccessoryBrowser_addUnpairedAccessoryServer_identifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_tombstonedAccessoryServerWithServerIdentifier:", *(_QWORD *)(a1 + 48));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_14;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_isAccessoryServerTombstoned:", v3)
    && (objc_msgSend(*(id *)(a1 + 40), "_shouldAccessoryServerBeTombstoned:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_resurrectAccessoryServer:", v3);
  }
  if (objc_msgSend(v3, "linkType") == 1 && (objc_msgSend(v3, "hasPairings") & 1) == 0)
  {
    if (objc_msgSend(v3, "isPaired"))
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543618;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory server %@ reports it is unpaired, but we have pairings for it", (uint8_t *)&v9, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_addUnpairedAccessoryForServer:", v3);
      objc_msgSend(v3, "reconfirm");
    }
  }
LABEL_14:

}

_QWORD *__54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "accessoryUUID");

    objc_msgSend((id)v2[5], "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)HMFBooleanToString();

    objc_msgSend((id)v2[5], "wacAccessory");
    v7 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "legacyWAC");
    v8 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "linkType");
    v9 = (id)HAPLinkTypeDescription();
    objc_msgSend((id)v2[6], "communicationProtocol");

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

_QWORD *__54__HMDAccessoryBrowser__addUnpairedAccessoryForServer___block_invoke_388(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = (void *)result[4];
  if (v1)
  {
    v2 = result;
    v3 = (void *)result[5];
    v4 = v1;
    objc_msgSend(v3, "accessoryUUID");

    objc_msgSend((id)v2[5], "setupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)HMFBooleanToString();

    objc_msgSend((id)v2[5], "wacAccessory");
    v7 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "legacyWAC");
    v8 = (id)HMFBooleanToString();
    objc_msgSend((id)v2[5], "linkType");
    v9 = (id)HAPLinkTypeDescription();
    objc_msgSend((id)v2[6], "communicationProtocol");

    return (id)HAPCommunicationProtocolDescription();
  }
  return result;
}

uint64_t __50__HMDAccessoryBrowser_removeUnpairedHAPAccessory___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleRemovedAccessory:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_handleRemovedUnpairedHAPAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__HMDAccessoryBrowser_addUnpairedHAPAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAddedAccessory:", *(_QWORD *)(a1 + 40));
}

void __43__HMDAccessoryBrowser_setActiveWACSession___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "wacBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    objc_msgSend(v2, "requestBackoff");
  else
    objc_msgSend(v2, "clearBackoff");

}

void __54__HMDAccessoryBrowser_removeUnassociatedWACAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissPendingDialogWithContext:queue:completionHandler:", v2, v3, &__block_literal_global_380);

  objc_msgSend(*(id *)(a1 + 40), "_handleRemovedAccessory:", *(_QWORD *)(a1 + 32));
}

void __56__HMDAccessoryBrowser_removeUnassociatedMediaAccessory___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isHAPAirPlay2Accessory");
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "advertisement");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_associate:hapAccessoryWithAdvertisement:", 0, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleRemovedAccessory:", *(_QWORD *)(a1 + 32));
  }
}

void __68__HMDAccessoryBrowser_addUnassociatedMediaAccessory_forDeviceSetup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 138543874;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@DeviceSetup accessory %@ already has a previous instance %@ - removing it", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 40), "_handleRemovedAccessory:", *(_QWORD *)(a1 + 32));
  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isHAPAirPlay2Accessory"))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "advertisement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_associate:hapAccessoryWithAdvertisement:", 1, v9);

    }
    else
    {
      if (*(_BYTE *)(a1 + 57))
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 48);
          v15 = 138543618;
          v16 = v13;
          v17 = 2112;
          v18 = v14;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Adding accessory %@ for deviceSetup", (uint8_t *)&v15, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
      }
      objc_msgSend(*(id *)(a1 + 40), "_handleAddedAccessory:", *(_QWORD *)(a1 + 48));
    }
  }
}

void __104__HMDAccessoryBrowser_probeReachabilityForBTLEAccessoryServersWithIdentifiers_forceScan_withCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "btleAccessoryServerBrowser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "probeReachabilityForAccessoryServersWithIdentifiers:forceScan:withCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __59__HMDAccessoryBrowser_handleNewlyPairedAccessory_linkType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "unpairedAccessoryWithServerIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v2, "accessoryServers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7))
        {
          objc_msgSend(*(id *)(a1 + 32), "_discoverAccessories:");
          objc_msgSend(*(id *)(a1 + 32), "removeUnpairedHAPAccessory:", v2);

          goto LABEL_13;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    HAPLinkTypeDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Discovering accessory server for newly added accessory: %@/%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "_discoverAccessoryServer:linkType:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
LABEL_13:

}

uint64_t __54__HMDAccessoryBrowser_homeLocationChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("HMDHomeRegionExitedNotificationKey"));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "homeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v35 = v5;
      obj = v5;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v38)
      {
        v37 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v45 != v37)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            v43 = 0;
            v9 = objc_msgSend(v8, "getReachableIPAccessories:btleAccessories:mediaAccessories:", &v43, 0, 0);
            v10 = v43;
            v11 = (void *)MEMORY[0x227676638](v9);
            v12 = *(id *)(a1 + 40);
            HMFGetOSLogHandle();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v50 = v14;
              v51 = 2112;
              v52 = v8;
              v53 = 2048;
              v54 = v43;
              _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Home: %@ Reachable IP accessories: %tu", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v11);
            objc_msgSend(v8, "homeLocationHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "regionStateAtHome");

            if (v16 == 2 && v10 == 0)
            {
              v18 = (void *)MEMORY[0x227676638]();
              v19 = *(id *)(a1 + 40);
              HMFGetOSLogHandle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v50 = v21;
                v51 = 2112;
                v52 = v8;
                _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Outside home region for home %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v18);
              objc_msgSend(v8, "accessories");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (void *)objc_msgSend(v22, "copy");

              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              v24 = v23;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v40;
                do
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v40 != v27)
                      objc_enumerationMutation(v24);
                    v29 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v30 = v29;
                    else
                      v30 = 0;
                    v31 = v30;

                    if (objc_msgSend(v31, "hasBTLELink"))
                    {
                      objc_msgSend(v31, "identifier");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "addObject:", v32);

                    }
                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
                }
                while (v26);
              }

            }
          }
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        }
        while (v38);
      }

      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "btleAccessoryServerBrowser");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "resetLastSeenForAccessoryServersWithIdentifiers:", v6);

      }
      v5 = v35;
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "btleAccessoryReachabilityProbeTimer:", 1);
}

uint64_t __93__HMDAccessoryBrowser_reprovisionAccessoryWithIdentifier_wiFiPSK_countryCode_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reprovisionAccessoryWithIdentifier:wiFiPSK:countryCode:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __32__HMDAccessoryBrowser_activate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 40);
    v11 = 138543618;
    v12 = v5;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Activating with startDiscovery %ld", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_startDiscoveringPairedAccessories:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_homeLocationChangeNotification_, CFSTR("HMDHomeRegionExitedNotificationKey"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_homeLocationChangeNotification_, CFSTR("HMDHomeRegionEnteredNotificationKey"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleConnectionDeactivation_, CFSTR("HMDXPCClientConnectionDidDeactivateNotification"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "_setBTLEPowerChangeCompletionHandler");
}

uint64_t __69__HMDAccessoryBrowser_discoverAccessoryServer_linkType_errorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverAccessoryServer:linkType:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __66__HMDAccessoryBrowser_stopTrackingBTLEAccessoriesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "btleAccessoryServerBrowser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopTrackingBTLEAccessoriesWithIdentifiers:", *(_QWORD *)(a1 + 40));

}

uint64_t __59__HMDAccessoryBrowser_btleAccessoryReachabilityProbeTimer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_btleAccessoryReachabilityProbeTimer:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __54__HMDAccessoryBrowser_stopDiscoveringMediaAccessories__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopDiscoveringMediaAccessories");
}

void __73__HMDAccessoryBrowser_stopDiscoveringForUnpairedAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HAPLinkTypeDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for unpaired accessories with link type: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_stopDiscoveringAccessoriesWithLinkType:force:error:", v8, 0, 0);

}

void __62__HMDAccessoryBrowser_stopDiscoveringAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HAPLinkTypeDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for accessories with link type: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_stopDiscoveringAccessoriesWithLinkType:force:error:", v8, 1, 0);

}

uint64_t __49__HMDAccessoryBrowser_stopDiscoveringAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping discovery for accessories", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_stopDiscoveringAccessoriesWithLinkType:force:error:", 0, 1, 0);
}

void __55__HMDAccessoryBrowser_startDiscoveringMediaAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isBrowsingAllowed") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startDiscoveringMediaAccessories");
  }
  else
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Ignoring request to start discovering media accessories", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
}

void __63__HMDAccessoryBrowser_startDiscoveringAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HAPLinkTypeDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for accessories with link Type: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_startDiscoveringAccessoriesWithLinkType:", v8);

}

uint64_t __50__HMDAccessoryBrowser_startDiscoveringAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting discovery for accessories", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_startDiscoveringAccessoriesWithLinkType:", 0);
}

void __69__HMDAccessoryBrowser_startDiscoveringPairedAccessoriesWithLinkType___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_startDiscoveringPairedAccessories:", v2);

}

uint64_t __56__HMDAccessoryBrowser_startDiscoveringPairedAccessories__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDiscoveringPairedAccessories:", 0);
}

void __41__HMDAccessoryBrowser_resetConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "btleAccessoryServerBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetPairedAccessories");

  objc_msgSend(*(id *)(a1 + 32), "ipAccessoryServerBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetPairedAccessories");

  objc_msgSend(*(id *)(a1 + 32), "chipAccessoryServerBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetPairedAccessories");

  objc_msgSend(*(id *)(a1 + 32), "hap2Storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetPairedAccessoryIdentifiers");

  objc_msgSend(*(id *)(a1 + 32), "mediaBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifiersOfAssociatedMediaAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterAccessories:", v7);

  objc_msgSend(*(id *)(a1 + 32), "resetPairedAccessories");
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2500);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stopDiscoveringAccessoriesWithError:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentlyPairingAccessories:linkType:", 2500, 0);
  objc_msgSend(*(id *)(a1 + 32), "unpairedHAPAccessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(a1 + 32), "removeUnpairedHAPAccessory:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }
  objc_msgSend(*(id *)(a1 + 32), "unassociatedMediaAccessories");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(a1 + 32), "removeUnassociatedMediaAccessory:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

id __68__HMDAccessoryBrowser_identifiersOfPairedUnknownLinkTypeAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "transports"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

BOOL __66__HMDAccessoryBrowser_areThereAnyPairedUnknownLinkTypeAccessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "transports") == 0;
}

uint64_t __42__HMDAccessoryBrowser_addPairedAccessory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

void __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "observedObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling de-allocation of connection for accessory browsing: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke_341;
    v11[3] = &unk_24E79C268;
    v11[4] = v6;
    v12 = v4;
    dispatch_async(v10, v11);

  }
}

void __47__HMDAccessoryBrowser___addBrowsingConnection___block_invoke_341(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2504);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "__removeBrowsingObserver:error:", v2, v3);

}

uint64_t __46__HMDAccessoryBrowser_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRemovedAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__HMDAccessoryBrowser_handleAddedAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAddedAccessory:", *(_QWORD *)(a1 + 40));
}

void __96__HMDAccessoryBrowser_updateBroadcastKeyForIdentifier_key_keyUpdatedStateNumber_keyUpdatedTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "btleAccessoryServerBrowser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBroadcastKeyForIdentifier:key:keyUpdatedStateNumber:keyUpdatedTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));

}

void __30__HMDAccessoryBrowser_setQOS___block_invoke(uint64_t a1)
{
  _BOOL8 v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40) == 1;
  objc_msgSend(*(id *)(a1 + 32), "btleAccessoryServerBrowser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureBTLEQoSLimits:", v1);

}

void __72__HMDAccessoryBrowser_configureAccessory_trackState_connectionPriority___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "btleAccessoryServerBrowser");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configureAccessoryWithIdentifier:trackState:connectionPriority:", v2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));

}

void __68__HMDAccessoryBrowser_configureWithHomeManager_mediaBrowserFactory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
  if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "homes", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v30;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v30 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
          objc_msgSend(*(id *)(a1 + 32), "chipAccessoryServerBrowser");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "storage");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "fabric");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setStorage:", v9);

          objc_msgSend(v7, "currentUser");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = +[HMDUser hmmtrUserPrivilegeFromHMDUserPrivilege:](HMDUser, "hmmtrUserPrivilegeFromHMDUserPrivilege:", objc_msgSend(v11, "privilege"));
          objc_msgSend(v7, "fabric");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "accessControl");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setCurrentUserPrivilege:", v12);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v4);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "chipDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "chipAccessoryServerBrowser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configureWithAccessoryServerBrowser:", v16);

  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "matterSoftwareUpdateProviderDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chipAccessoryServerBrowser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "softwareUpdateProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "configureWithSoftwareUpdateProvider:", v19);

  }
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferenceForKey:", CFSTR("enableMediaAccessories"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    v23 = *(void **)(a1 + 32);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMediaBrowser:", v24);

    objc_msgSend(*(id *)(a1 + 32), "mediaBrowser");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "identifiersOfAssociatedMediaAccessories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "mediaBrowser");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "registerAccessories:", v26);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "chipAccessoryServerBrowser");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "configure");

}

HMDMediaBrowser *__48__HMDAccessoryBrowser_configureWithHomeManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDMediaBrowser *v3;

  v2 = a2;
  v3 = -[HMDMediaBrowser initWithHomeManager:]([HMDMediaBrowser alloc], "initWithHomeManager:", v2);

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t376 != -1)
    dispatch_once(&logCategory__hmf_once_t376, &__block_literal_global_543);
  return (id)logCategory__hmf_once_v377;
}

void __34__HMDAccessoryBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v377;
  logCategory__hmf_once_v377 = v0;

}

@end
