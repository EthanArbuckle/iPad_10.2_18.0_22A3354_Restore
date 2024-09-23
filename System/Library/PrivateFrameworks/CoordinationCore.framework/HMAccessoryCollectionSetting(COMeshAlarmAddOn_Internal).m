@implementation HMAccessoryCollectionSetting(COMeshAlarmAddOn_Internal)

- (void)co_withLock:()COMeshAlarmAddOn_Internal
{
  void (**v3)(_QWORD);

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&co_withLock__funnel);
  v3[2](v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&co_withLock__funnel);
}

- (void)co_enqueueOperation:()COMeshAlarmAddOn_Internal
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = a1;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "co_withLock:", v6);

}

- (void)co_flushQueue
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  id v10;
  _QWORD v11[6];
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  COCoreLogForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_impl(&dword_215E92000, v2, OS_LOG_TYPE_DEFAULT, "%p performing coalesced writes", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke;
  v11[3] = &unk_24D4B07E0;
  v11[4] = a1;
  v11[5] = &buf;
  objc_msgSend(a1, "co_withLock:", v11);
  objc_msgSend(a1, "co_mappedAlarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_2;
  v9[3] = &unk_24D4B12F8;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "removeObjectsAtIndexes:", v7);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_3;
  v8[3] = &unk_24D4B1320;
  v8[4] = a1;
  v8[5] = &buf;
  objc_msgSend(a1, "co_setMappedAlarms:completionHandler:", v6, v8);

  _Block_object_dispose(&buf, 8);
}

- (id)co_cachedWrite
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__6;
  v8 = __Block_byref_object_dispose__6;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_cachedWrite__block_invoke;
  v3[3] = &unk_24D4B07E0;
  v3[4] = a1;
  v3[5] = &v4;
  objc_msgSend(a1, "co_withLock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (void)co_setCachedWrite:()COMeshAlarmAddOn_Internal
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke;
  v6[3] = &unk_24D4B0858;
  v6[4] = a1;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "co_withLock:", v6);

}

- (id)co_mappedAlarms
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "co_cachedWrite");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    COCoreLogForCategory(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[HMAccessoryCollectionSetting(COMeshAlarmAddOn_Internal) co_mappedAlarms].cold.1((uint64_t)a1, v5, v6, v7, v8, v9, v10, v11);

  }
  else
  {
    objc_msgSend(a1, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "co_alarm", (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "alarmID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "objectForKey:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "COPreferredAlarm:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v21, v19);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  return v2;
}

- (void)co_setMappedAlarms:()COMeshAlarmAddOn_Internal completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27[2];
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v6, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x24BDD7348], "co_accessoryCollectionSettingItemWithAlarm:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "value");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x24BDBD1A8];
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  objc_initWeak(&location, a1);
  v19 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke;
  v23[3] = &unk_24D4B13C0;
  v27[1] = v19;
  v20 = v18;
  v24 = v20;
  v21 = v8;
  v25 = v21;
  objc_copyWeak(v27, &location);
  v22 = v7;
  v26 = v22;
  objc_msgSend(a1, "replaceItems:withItems:completionHandler:", v20, v21, v23);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

}

- (void)co_mappedAlarms
{
  OUTLINED_FUNCTION_7(&dword_215E92000, a2, a3, "using cached write for %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
