@implementation DKForegroundServicesMonitor

void __37___DKForegroundServicesMonitor_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE80CF8];
  v4 = a2;
  objc_msgSend(v3, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStateDescriptor:", v5);

  v6 = (void *)MEMORY[0x24BE80CD8];
  objc_msgSend(*(id *)(a1 + 32), "servicesOfInterestForWatchCommunication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateMatchingBundleIdentifiers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v9);

  objc_msgSend(*(id *)(a1 + 32), "processUpdateHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdateHandler:", v10);

}

void __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)os_transaction_create();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke_2;
    block[3] = &unk_24DA67388;
    block[4] = v11;
    v15 = v13;
    v16 = v8;
    v17 = v7;
    dispatch_sync(v12, block);

  }
}

uint64_t __52___DKForegroundServicesMonitor_processUpdateHandler__block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 144) == *(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "processMonitor:didUpdateState:forProcess:");
  return result;
}

@end
