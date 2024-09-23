@implementation HFAccessoryBrowsingManager

- (HFAccessoryBrowsingManager)init
{
  HFAccessoryBrowsingManager *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryBrowsingManager;
  v2 = -[HFAccessoryBrowsingManager init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CBA1C8]);
    -[HFAccessoryBrowsingManager setAccessoryBrowser:](v2, "setAccessoryBrowser:", v3);

    -[HFAccessoryBrowsingManager accessoryBrowser](v2, "accessoryBrowser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v2);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBrowsingManager setMutableDiscoveredSharingDevices:](v2, "setMutableDiscoveredSharingDevices:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0D97450]);
    -[HFAccessoryBrowsingManager setSharingDeviceBrowser:](v2, "setSharingDeviceBrowser:", v6);

    -[HFAccessoryBrowsingManager sharingDeviceBrowser](v2, "sharingDeviceBrowser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscoveryFlags:", 16);

    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __34__HFAccessoryBrowsingManager_init__block_invoke;
    v15[3] = &unk_1EA738EE0;
    objc_copyWeak(&v16, &location);
    -[HFAccessoryBrowsingManager sharingDeviceBrowser](v2, "sharingDeviceBrowser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceFoundHandler:", v15);

    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __34__HFAccessoryBrowsingManager_init__block_invoke_3;
    v13[3] = &unk_1EA738EE0;
    objc_copyWeak(&v14, &location);
    -[HFAccessoryBrowsingManager sharingDeviceBrowser](v2, "sharingDeviceBrowser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceLostHandler:", v13);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryBrowsingManager setObservers:](v2, "setObservers:", v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__HFAccessoryBrowsingManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x3AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "didFindNewSharingDevice: %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "mutableDiscoveredSharingDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v3);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(WeakRetained, "observers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "accessoryBrowsingManager:didFindNewSharingDevice:", WeakRetained, v3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

void __34__HFAccessoryBrowsingManager_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory(0x3AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_debug_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEBUG, "didRemoveNewSharingDevice: %@", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "mutableDiscoveredSharingDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v3);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(WeakRetained, "observers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "accessoryBrowsingManager:didRemoveNewSharingDevice:", WeakRetained, v3);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (NSArray)discoveredHMAccessories
{
  void *v2;
  void *v3;

  -[HFAccessoryBrowsingManager accessoryBrowser](self, "accessoryBrowser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveredAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)discoveredSharingDevices
{
  void *v2;
  void *v3;
  void *v4;

  -[HFAccessoryBrowsingManager mutableDiscoveredSharingDevices](self, "mutableDiscoveredSharingDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)startSearchingForNewAccessories
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  HFLogForCategory(0x3AuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "startSearchingForNewAccessories", buf, 2u);
  }

  -[HFAccessoryBrowsingManager setIsBrowsing:](self, "setIsBrowsing:", 1);
  -[HFAccessoryBrowsingManager accessoryBrowser](self, "accessoryBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startSearchingForNewAccessories");

  -[HFAccessoryBrowsingManager sharingDeviceBrowser](self, "sharingDeviceBrowser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HFAccessoryBrowsingManager_startSearchingForNewAccessories__block_invoke;
  v7[3] = &unk_1EA726968;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "activateWithCompletion:", v7);

}

void __61__HFAccessoryBrowsingManager_startSearchingForNewAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x3AuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      v7 = "Failed to start sharing device browser (%@). Error: %@";
      v8 = v4;
      v9 = 22;
LABEL_6:
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
  else if (v5)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v10;
    v7 = "Started sharing device browser (%@)";
    v8 = v4;
    v9 = 12;
    goto LABEL_6;
  }

}

- (void)stopSearchingForNewAccessoriesWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  HFLogForCategory(0x3AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "stopSearchingForNewAccessoriesWithError", v8, 2u);
  }

  -[HFAccessoryBrowsingManager setIsBrowsing:](self, "setIsBrowsing:", 0);
  -[HFAccessoryBrowsingManager accessoryBrowser](self, "accessoryBrowser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopSearchingForNewAccessoriesWithError:", v4);

  -[HFAccessoryBrowsingManager sharingDeviceBrowser](self, "sharingDeviceBrowser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

}

- (void)addBrowsingObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessoryBrowsingManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeBrowsingObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFAccessoryBrowsingManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)accessoryBrowser:(id)a3 didFindNewAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x3AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_INFO, "didFindNewAccessory: %@", buf, 0xCu);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HFAccessoryBrowsingManager observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "accessoryBrowsingManager:didFindNewAccessory:", self, v5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)accessoryBrowser:(id)a3 didRemoveNewAccessory:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory(0x3AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_INFO, "didRemoveNewAccessory: %@", buf, 0xCu);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HFAccessoryBrowsingManager observers](self, "observers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "accessoryBrowsingManager:didRemoveNewAccessory:", self, v5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (HMAccessoryBrowser)accessoryBrowser
{
  return self->_accessoryBrowser;
}

- (void)setAccessoryBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryBrowser, a3);
}

- (SFDeviceDiscovery)sharingDeviceBrowser
{
  return self->_sharingDeviceBrowser;
}

- (void)setSharingDeviceBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_sharingDeviceBrowser, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableSet)mutableDiscoveredSharingDevices
{
  return self->_mutableDiscoveredSharingDevices;
}

- (void)setMutableDiscoveredSharingDevices:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDiscoveredSharingDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDiscoveredSharingDevices, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sharingDeviceBrowser, 0);
  objc_storeStrong((id *)&self->_accessoryBrowser, 0);
}

@end
