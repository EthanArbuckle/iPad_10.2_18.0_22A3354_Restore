@implementation DKNotificationKeybagLockMonitor

uint64_t __61___DKNotificationKeybagLockMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveNotificationEvent:", *(_QWORD *)(a1 + 40));
}

void __39___DKNotificationKeybagLockMonitor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.monitors", "_DKNotificationKeybagLockMonitor");
  v1 = (void *)log_log_0;
  log_log_0 = (uint64_t)v0;

}

id __41___DKNotificationKeybagLockMonitor_start__block_invoke(uint64_t a1)
{
  id result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)_DKNotificationKeybagLockMonitor;
  result = objc_msgSendSuper2(&v3, sel__instantMonitorNeedsActivation);
  if ((_DWORD)result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "_activate");
  return result;
}

void __45___DKNotificationKeybagLockMonitor__activate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double Current;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[7];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend((id)objc_opt_class(), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219056000, v2, OS_LOG_TYPE_DEFAULT, "Checking current state of Device.KeybagLocked stream", buf, 2u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 1, 1, 0);
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "KeybagLocked");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisherWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45___DKNotificationKeybagLockMonitor__activate__block_invoke_2;
  v18[3] = &unk_24DA66F38;
  v18[5] = buf;
  v18[6] = &v25;
  v18[4] = *(_QWORD *)(a1 + 32);
  v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_20, v18);
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemUptime");
  v12 = Current - v11;

  v13 = (void *)*((_QWORD *)v20 + 5);
  if (!v13 || (objc_msgSend(v13, "starting") & 1) == 0 && v26[3] < v12)
  {
    v14 = objc_alloc(MEMORY[0x24BE0C350]);
    v15 = (void *)objc_msgSend(v14, "initWithStarting:", MEMORY[0x24BDBD1C8]);
    objc_msgSend(*(id *)(a1 + 32), "_updateWithKeybagLocked:timestamp:", v15, v12);
    v16 = (void *)*((_QWORD *)v20 + 5);
    *((_QWORD *)v20 + 5) = v15;
    v17 = v15;

    v26[3] = v12;
  }
  if ((objc_msgSend(*((id *)v20 + 5), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *((id *)v20 + 5));
    *(double *)(*(_QWORD *)(a1 + 32) + 160) = v26[3];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateWithKeybagLocked:timestamp:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v25, 8);
}

void __45___DKNotificationKeybagLockMonitor__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timestamp");
    v11 = 138543618;
    v12 = v9;
    v13 = 2048;
    v14 = v10;
    _os_log_impl(&dword_219056000, v8, OS_LOG_TYPE_DEFAULT, "Loaded last Device.KeybagLocked event %{public}@ at %f", (uint8_t *)&v11, 0x16u);

  }
}

id __40___DKNotificationKeybagLockMonitor_stop__block_invoke(uint64_t a1)
{
  id result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)_DKNotificationKeybagLockMonitor;
  result = objc_msgSendSuper2(&v3, sel__instantMonitorNeedsDeactivation);
  if ((_DWORD)result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "_deactivate");
  return result;
}

void __47___DKNotificationKeybagLockMonitor__deactivate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  *(_QWORD *)(v2 + 176) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
}

uint64_t __73___DKNotificationKeybagLockMonitor__enqueueKeybagLockedUpdate_timestamp___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(double *)(v1 + 160) <= *(double *)(result + 48))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 168), "isEqual:", *(_QWORD *)(result + 40));
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(v2 + 32), "_updateWithKeybagLocked:timestamp:", *(_QWORD *)(v2 + 40), *(double *)(v2 + 48));
  }
  return result;
}

@end
