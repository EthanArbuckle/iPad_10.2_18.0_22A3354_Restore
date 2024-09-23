@implementation DKSunriseSunsetMonitor

uint64_t __31___DKSunriseSunsetMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedUpdateSunriseSunsetTime:", 0);
}

void __31___DKSunriseSunsetMonitor_init__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BDBFA88]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEffectiveBundle:delegate:onQueue:", v6, v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setManager:", v5);

}

void __31___DKSunriseSunsetMonitor_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x24BDBFA88];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationStatus:", objc_msgSend(v2, "authorizationStatusForBundle:", v3));

}

void __31___DKSunriseSunsetMonitor_init__block_invoke_25(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31___DKSunriseSunsetMonitor_init__block_invoke_2_26;
  v7[3] = &unk_24DA66D10;
  v8 = *(id *)(a1 + 32);
  v4 = v7;
  v5 = (void *)os_transaction_create();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_9;
  block[3] = &unk_24DA66E28;
  v10 = v5;
  v11 = v4;
  v6 = v5;
  dispatch_async(v2, block);

}

uint64_t __31___DKSunriseSunsetMonitor_init__block_invoke_2_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedUpdateSunriseSunsetTime:", 0);
}

void __31___DKSunriseSunsetMonitor_stop__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 152));
}

uint64_t __47___DKSunriseSunsetMonitor_respondToTimeChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedUpdateSunriseSunsetTime:", 0);
}

uint64_t __72___DKSunriseSunsetMonitor_locationManager_didChangeAuthorizationStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unprotectedUpdateSunriseSunsetTime:", 0);
}

void __62___DKSunriseSunsetMonitor_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unprotectedUpdateSunriseSunsetTime:", v2);

}

@end
