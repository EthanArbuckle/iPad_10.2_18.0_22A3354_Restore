@implementation HMAccessoryCollectionSetting(COMeshAlarmAddOn)

- (id)co_alarms
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "co_mappedAlarms");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)co_rawAlarms
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "_co_alarm");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "alarmID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "COPreferredAlarm:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v12, v10);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  objc_msgSend(v2, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)co_addAlarm:()COMeshAlarmAddOn completionHandler:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[COAlarmOperation initForAdding:completion:]([COAlarmOperation alloc], "initForAdding:completion:", v7, v6);

  objc_msgSend(a1, "co_enqueueOperation:", v8);
}

- (void)co_updateAlarm:()COMeshAlarmAddOn completionHandler:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[COAlarmOperation initForUpdating:completion:]([COAlarmOperation alloc], "initForUpdating:completion:", v7, v6);

  objc_msgSend(a1, "co_enqueueOperation:", v8);
}

- (void)co_removeAlarm:()COMeshAlarmAddOn completionHandler:
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[COAlarmOperation initForRemoving:completion:]([COAlarmOperation alloc], "initForRemoving:completion:", v7, v6);

  objc_msgSend(a1, "co_enqueueOperation:", v8);
}

@end
