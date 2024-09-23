@implementation HMAccessoryCollectionSetting

void __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  void *v18;
  uint64_t v19;
  id v20[2];
  id location;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_setAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_, v2, (void *)1);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v4 = dispatch_time(0, 90000000);
    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_2;
    v18 = &unk_24D4B12D0;
    objc_copyWeak(v20, &location);
    v19 = *(_QWORD *)(a1 + 32);
    v20[1] = v3;
    dispatch_after(v4, v5, &v15);

    COCoreLogForCategory(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      v23 = v7;
      _os_log_impl(&dword_215E92000, v6, OS_LOG_TYPE_DEFAULT, "Preparing coalesced writes for %p", buf, 0xCu);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40), v15, v16, v17, v18);
  COCoreLogForCategory(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 40);
    v9 = (id *)(a1 + 40);
    v11 = (uint64_t)*(v9 - 1);
    v12 = objc_msgSend(v10, "type");
    objc_msgSend(*v9, "alarm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alarmID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v23 = v11;
    v24 = 2048;
    v25 = v12;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "%p enqueued %ld for %@", buf, 0x20u);

  }
}

void __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];
  id v8[2];

  v2 = a1 + 5;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "co_cachedWrite");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = dispatch_time(0, 90000000);
      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_3;
      block[3] = &unk_24D4B12D0;
      objc_copyWeak(v8, v2);
      v8[1] = a1[6];
      block[4] = WeakRetained;
      dispatch_after(v5, v6, block);

      objc_destroyWeak(v8);
    }
    else
    {
      objc_msgSend(WeakRetained, "co_flushQueue");
    }
  }

}

void __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    AnalyticsSendEventLazy();
    objc_msgSend(*(id *)(a1 + 32), "co_flushQueue");
  }

}

id __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(unint64_t *)(a1 + 32) / 1000000000.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("items");
  v4[2] = CFSTR("replacements");
  v5[0] = v1;
  v5[1] = &unk_24D4CF360;
  v5[2] = &unk_24D4CF360;
  v5[3] = CFSTR("delayed");
  v4[3] = CFSTR("domain");
  v4[4] = CFSTR("code");
  v5[4] = &unk_24D4CF378;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_getAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_setAssociatedObject(*(id *)(a1 + 32), sel_co_enqueueOperation_, 0, (void *)1);
}

uint64_t __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performOperationWithMappedAlarms:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  COCoreLogForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v18 = v5;
    _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "%p completed coalesced writes", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "completion", (_QWORD)v12);
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v11)[2](v11, v3);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

void __73__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_cachedWrite__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_getAssociatedObject(*(id *)(a1 + 32), sel_co_cachedWrite);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id location;

  v1 = a1 + 32;
  objc_setAssociatedObject(*(id *)(a1 + 32), sel_co_cachedWrite, *(id *)(a1 + 40), (void *)3);
  objc_getAssociatedObject(*(id *)v1, "co_observer");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (*(_QWORD *)(v1 + 8))
  {
    COCoreLogForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_3(v1, v4, v5, v6, v7, v8, v9, v10);

    if (!v3)
    {
      COCoreLogForCategory(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_2(v1, v11, v12, v13, v14, v15, v16, v17);

      objc_initWeak(&location, *(id *)v1);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(id *)v1;
      objc_msgSend(MEMORY[0x24BDD1710], "currentQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BDD4E98];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_46;
      v30[3] = &unk_24D4B1348;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", v21, v19, v20, v30);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      objc_setAssociatedObject(*(id *)v1, "co_observer", v3, (void *)1);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObserver:", v3);

    }
    objc_setAssociatedObject(*(id *)v1, "co_observer", 0, (void *)1);
    COCoreLogForCategory(2);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_1(v1, v23, v24, v25, v26, v27, v28, v29);

  }
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_46(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "co_setCachedWrite:", 0);
    WeakRetained = v2;
  }

}

void __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __uint64_t v4;
  id *v5;
  id *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  __uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[2];

  v3 = a2;
  v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - *(_QWORD *)(a1 + 64);
  if (v3)
  {
    v12 = v4;
    v5 = &v9;
    v9 = *(id *)(a1 + 32);
    v6 = &v10;
    v10 = *(id *)(a1 + 40);
    v11 = v3;
    AnalyticsSendEventLazy();
    v7 = v11;
  }
  else
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke_2;
    v16 = &unk_24D4B1370;
    v18[1] = v4;
    v5 = &v17;
    v17 = *(id *)(a1 + 32);
    v6 = (id *)v18;
    v18[0] = *(id *)(a1 + 40);
    AnalyticsSendEventLazy();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v7 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "co_setCachedWrite:", *(_QWORD *)(a1 + 40));
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(unint64_t *)(a1 + 48) / 1000000000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("items");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("replacements");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)*(unint64_t *)(a1 + 56) / 1000000000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("items");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("replacements");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("domain");
  objc_msgSend(*(id *)(a1 + 48), "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a2, a3, "invalidated write cache for %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a2, a3, "starting observation for %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a2, a3, "write cached for %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
