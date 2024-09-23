@implementation DSContinuityStore

- (DSContinuityStore)init
{
  DSContinuityStore *v2;
  os_log_t v3;
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSContinuityStore;
  v2 = -[DSContinuityStore init](&v8, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.DigitalSeparation", "DSContinuityStore");
    v4 = (void *)DSLog_3;
    DSLog_3 = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x24BE80818]);
    -[DSContinuityStore setReplicatorProxy:](v2, "setReplicatorProxy:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BE2A8D0]);
    -[DSContinuityStore setContinuityPairing:](v2, "setContinuityPairing:", v6);

  }
  return v2;
}

- (void)fetchPairedDevicesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  DSContinuityStore *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[DSContinuityStore replicatorProxy](self, "replicatorProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "deviceID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  -[DSContinuityStore continuityPairing](self, "continuityPairing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__DSContinuityStore_fetchPairedDevicesWithCompletion___block_invoke;
  v17[3] = &unk_24F081DA8;
  v18 = v5;
  v19 = self;
  v20 = v4;
  v15 = v4;
  v16 = v5;
  objc_msgSend(v14, "fetchContinuityEligibleDevicesWithCompletion:", v17);

}

void __54__DSContinuityStore_fetchPairedDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v22 = a3;
  obj = v5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v24 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v9, "deviceID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "initialDiscoveryDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setInitialDiscoveryDate:", v13);
        objc_msgSend(*(id *)(a1 + 40), "replicatorProxy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "relationshipID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pushTokenForRelationshipID:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "length");
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 2 * v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_retainAutorelease(v16);
        v20 = objc_msgSend(v19, "bytes");
        if (objc_msgSend(v19, "length"))
        {
          v21 = 0;
          do
            objc_msgSend(v18, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v20 + v21++));
          while (v21 < objc_msgSend(v19, "length"));
        }
        objc_msgSend(v9, "setPushToken:", v18);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)unpairAllDevicesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke;
  v6[3] = &unk_24F081DD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[DSContinuityStore fetchPairedDevicesWithCompletion:](self, "fetchPairedDevicesWithCompletion:", v6);

}

void __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
      __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("deviceID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_227D24000, v9, OS_LOG_TYPE_INFO, "Unpairing all devices %@ by identifiers %@", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "unpairDevicesWithIDs:completion:", v8, *(_QWORD *)(a1 + 40));

  }
}

- (void)unpairDevicesWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id obj;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        dispatch_group_enter(v8);
        -[DSContinuityStore continuityPairing](self, "continuityPairing");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke;
        v22[3] = &unk_24F081DF8;
        v22[4] = v13;
        v23 = v7;
        v24 = v8;
        objc_msgSend(v14, "unpairHostWithDeviceID:completion:", v13, v22);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_11;
  block[3] = &unk_24F081658;
  v20 = v7;
  v21 = v17;
  v15 = v17;
  v16 = v7;
  dispatch_group_notify(v8, MEMORY[0x24BDAC9B8], block);

}

void __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = DSLog_3;
    if (os_log_type_enabled((os_log_t)DSLog_3, OS_LOG_TYPE_ERROR))
      __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[DSError errorWithCode:underlyingErrors:](DSError, "errorWithCode:underlyingErrors:", 10, *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)formattedStartDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DSContinuityStore continuityPairing](self, "continuityPairing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStartDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)formattedDurationFromStart:(id)a3 toEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[DSContinuityStore continuityPairing](self, "continuityPairing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "formattedDurationStart:toEnd:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (RPLReplicatorControlClient)replicatorProxy
{
  return self->_replicatorProxy;
}

- (void)setReplicatorProxy:(id)a3
{
  objc_storeStrong((id *)&self->_replicatorProxy, a3);
}

- (DSContinuityPairingWrapper)continuityPairing
{
  return self->_continuityPairing;
}

- (void)setContinuityPairing:(id)a3
{
  objc_storeStrong((id *)&self->_continuityPairing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuityPairing, 0);
  objc_storeStrong((id *)&self->_replicatorProxy, 0);
}

void __52__DSContinuityStore_unpairAllDevicesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_227D24000, a2, OS_LOG_TYPE_ERROR, "Fetch failed with error %{public}@, bailing unpair call...", (uint8_t *)&v2, 0xCu);
}

void __53__DSContinuityStore_unpairDevicesWithIDs_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_227D24000, log, OS_LOG_TYPE_ERROR, "Failed to unpair device with ID %@ because %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
