@implementation DSRemotePairingStore

- (DSRemotePairingStore)init
{
  dispatch_queue_t v3;
  DSRemotePairingWrapper *v4;

  if (self)
  {
    v3 = dispatch_queue_create("RemotePairingStoreQueue", 0);
    -[DSRemotePairingStore setWorkQueue:](self, "setWorkQueue:", v3);

    v4 = objc_alloc_init(DSRemotePairingWrapper);
    -[DSRemotePairingStore setRemotePairingSwift:](self, "setRemotePairingSwift:", v4);

  }
  return self;
}

- (void)fetchPairedDevicesOnQueue:(id)a3 completion:(id)a4
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
  -[DSRemotePairingStore workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke;
  block[3] = &unk_250B2D338;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  DSPairedComputer *v18;
  void *v19;
  DSPairedComputer *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v43;
  void *v44;
  void *v45;
  id obj;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  _QWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  _QWORD v61[5];
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy_;
  v61[4] = __Block_byref_object_dispose_;
  v62 = 0;
  objc_msgSend(*(id *)(a1 + 32), "remotePairingSwift");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2;
  v60[3] = &unk_250B2D2A8;
  v60[4] = v61;
  objc_msgSend(v2, "getPairedDevicesWithCompletion:", v60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  v56 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v57 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v8 = objc_msgSend(v1, "indexOfObject:", v7);
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v1, "addObject:", v7);
        }
        else
        {
          objc_msgSend(v1, "objectAtIndexedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "datePaired");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "datePaired");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "earlierDate:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDatePaired:", v12);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v4);
  }

  v47 = (void *)lockdown_copy_paired_host_info();
  if (v47)
  {
    objc_msgSend(v47, "allKeys");
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v53 != v14)
            objc_enumerationMutation(v43);
          v16 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
          objc_msgSend(v47, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = [DSPairedComputer alloc];
          objc_msgSend(v17, "objectForKey:", CFSTR("HostName"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[DSPairedComputer initWithDeviceName:](v18, "initWithDeviceName:", v19);

          -[DSPairedComputer setLockdownFrameworkKey:](v20, "setLockdownFrameworkKey:", v16);
          objc_msgSend(v17, "objectForKey:", CFSTR("SystemBUID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[DSPairedComputer setLockdownFrameworkIdentifier:](v20, "setLockdownFrameworkIdentifier:", v21);

          objc_msgSend(v17, "objectForKey:", CFSTR("SerialNumber"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("SerialNumber"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "length"))
              -[DSPairedComputer setSerialNumber:](v20, "setSerialNumber:", v23);

          }
          objc_msgSend(v17, "objectForKey:", CFSTR("MarketingName"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("MarketingName"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[DSPairedComputer setMarketingName:](v20, "setMarketingName:", v25);

          }
          objc_msgSend(v17, "objectForKey:", CFSTR("WallTimeWhenCreated"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v17, "objectForKey:", CFSTR("WallTimeWhenCreated"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "unsignedLongLongValue");

            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[DSPairedComputer setDatePaired:](v20, "setDatePaired:", v29);

          }
          v30 = objc_msgSend(v1, "indexOfObject:", v20);
          if (v30 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v1, "addObject:", v20);
          }
          else
          {
            objc_msgSend(v1, "objectAtIndexedSubscript:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "datePaired");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[DSPairedComputer datePaired](v20, "datePaired");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "earlierDate:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setDatePaired:", v34);

            -[DSPairedComputer marketingName](v20, "marketingName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              -[DSPairedComputer marketingName](v20, "marketingName");
              v36 = objc_claimAutoreleasedReturnValue();
              v45 = (void *)v36;
            }
            else
            {
              objc_msgSend(v31, "marketingName");
              v36 = objc_claimAutoreleasedReturnValue();
              v44 = (void *)v36;
            }
            objc_msgSend(v31, "setMarketingName:", v36);
            v37 = v45;
            if (!v35)
              v37 = v44;

            -[DSPairedComputer lockdownFrameworkIdentifier](v20, "lockdownFrameworkIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setLockdownFrameworkIdentifier:", v38);

            -[DSPairedComputer lockdownFrameworkKey](v20, "lockdownFrameworkKey");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setLockdownFrameworkKey:", v39);

          }
        }
        v13 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      }
      while (v13);
    }

  }
  objc_msgSend(v1, "sortUsingComparator:", &__block_literal_global);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_3;
  block[3] = &unk_250B2D310;
  v40 = *(NSObject **)(a1 + 40);
  v50 = *(id *)(a1 + 48);
  v51 = v61;
  v49 = v1;
  v41 = v1;
  dispatch_async(v40, block);

  _Block_object_dispose(v61, 8);
}

void __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

uint64_t __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "datePaired");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "datePaired");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __61__DSRemotePairingStore_fetchPairedDevicesOnQueue_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (DSRemotePairingWrapper)remotePairingSwift
{
  return self->_remotePairingSwift;
}

- (void)setRemotePairingSwift:(id)a3
{
  objc_storeStrong((id *)&self->_remotePairingSwift, a3);
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
  objc_storeStrong((id *)&self->_remotePairingSwift, 0);
}

@end
