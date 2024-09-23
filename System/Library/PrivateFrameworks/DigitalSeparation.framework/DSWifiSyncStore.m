@implementation DSWifiSyncStore

- (DSWifiSyncStore)init
{
  id v3;
  id v4;
  os_log_t v5;
  void *v6;
  dispatch_queue_t v7;

  if (self)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE2A8E0]);
    -[DSWifiSyncStore setRemotePairing:](self, "setRemotePairing:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BE2A8D8]);
    -[DSWifiSyncStore setRemotePairingStore:](self, "setRemotePairingStore:", v4);

    v5 = os_log_create("com.apple.DigitalSeparation", "DSWifiSyncStore");
    v6 = (void *)DSLog_0;
    DSLog_0 = (uint64_t)v5;

    v7 = dispatch_queue_create("WifiSyncQueue", 0);
    -[DSWifiSyncStore setWorkQueue:](self, "setWorkQueue:", v7);

  }
  return self;
}

- (BOOL)fetchWifiSyncStatus
{
  void *v2;
  char v3;

  -[DSWifiSyncStore remotePairingStore](self, "remotePairingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWifiSyncEnabled");

  return v3;
}

- (void)fetchPairedDevicesOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DSWifiSyncStore remotePairingStore](self, "remotePairingStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchPairedDevicesOnQueue:completion:", v7, v6);

}

- (void)removeAllPairedDevicesOnQueue:(id)a3 completion:(id)a4
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
  -[DSWifiSyncStore workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke;
  block[3] = &unk_24F081928;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = lockdown_delete_pair_records();
  if (v3)
  {
    v4 = v3;
    v5 = DSLog_0;
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR))
      __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_2(v4, v5);
    +[DSError errorWithCode:](DSError, "errorWithCode:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "remotePairing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllPairedDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = DSLog_0;
    if (os_log_type_enabled((os_log_t)DSLog_0, OS_LOG_TYPE_ERROR))
      __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_1((uint64_t)v8, v9);
    objc_msgSend(v2, "addObject:", v8);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_6;
  v12[3] = &unk_24F081658;
  v13 = v2;
  v10 = *(NSObject **)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v11 = v2;
  dispatch_async(v10, v12);

}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[DSError errorWithCode:underlyingErrors:](DSError, "errorWithCode:underlyingErrors:", 9, *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = (id)v2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removePairedDevices:(id)a3 onQueue:(id)a4 withCompletion:(id)a5
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
  DSWifiSyncStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DSWifiSyncStore workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke;
  v15[3] = &unk_24F0819E0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "remotePairingFrameworkIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v2, "addObject:", v9);
        objc_msgSend(v9, "lockdownFrameworkIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_2;
  v15[3] = &unk_24F0819B8;
  v12 = *(void **)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v17 = v3;
  v18 = v13;
  v14 = v3;
  objc_msgSend(v12, "removeComputersFromRemotePairing:withCompletion:", v2, v15);

}

void __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[4];
  id v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_3;
    block[3] = &unk_24F081590;
    v5 = &v21;
    v21 = *(id *)(a1 + 48);
    v20 = v3;
    dispatch_async(v4, block);

  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "lockdownFrameworkKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          lockdown_unpair_host_by_id();

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v8);
    }

    v12 = *(NSObject **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_4;
    v13[3] = &unk_24F081900;
    v5 = &v14;
    v14 = *(id *)(a1 + 48);
    dispatch_async(v12, v13);
  }

}

uint64_t __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __62__DSWifiSyncStore_removePairedDevices_onQueue_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeComputersFromRemotePairing:(id)a3 withCompletion:(id)a4
{
  DSRemotePairingWrapper *remotePairing;
  id v7;
  id v8;
  id v9;

  remotePairing = self->_remotePairing;
  v7 = a4;
  v8 = a3;
  -[DSWifiSyncStore workQueue](self, "workQueue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[DSRemotePairingWrapper removeSelectedDevices:onQueue:withCompletion:](remotePairing, "removeSelectedDevices:onQueue:withCompletion:", v8, v9, v7);

}

- (DSRemotePairingWrapper)remotePairing
{
  return self->_remotePairing;
}

- (void)setRemotePairing:(id)a3
{
  objc_storeStrong((id *)&self->_remotePairing, a3);
}

- (DSRemotePairingStore)remotePairingStore
{
  return self->_remotePairingStore;
}

- (void)setRemotePairingStore:(id)a3
{
  objc_storeStrong((id *)&self->_remotePairingStore, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_remotePairingStore, 0);
  objc_storeStrong((id *)&self->_remotePairing, 0);
}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_227D24000, a2, OS_LOG_TYPE_ERROR, "Remote Pairing - Error removing at least one paired device: %@", (uint8_t *)&v2, 0xCu);
}

void __60__DSWifiSyncStore_removeAllPairedDevicesOnQueue_completion___block_invoke_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_227D24000, a2, OS_LOG_TYPE_ERROR, "liblockdown - Error removing at least one paired device: %d", (uint8_t *)v2, 8u);
}

@end
