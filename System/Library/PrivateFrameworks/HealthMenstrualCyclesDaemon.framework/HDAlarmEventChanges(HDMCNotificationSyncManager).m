@implementation HDAlarmEventChanges(HDMCNotificationSyncManager)

- (void)hdmc_enumerateNotificationInstructionsFromAnalysisSampleInfo:()HDMCNotificationSyncManager block:
{
  id v6;
  void (**v7)(id, void *, void *);
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (objc_msgSend(v6, "isDeleted"))
      v8 = (objc_class *)MEMORY[0x24BE40B30];
    else
      v8 = (objc_class *)MEMORY[0x24BE40B38];
    v9 = [v8 alloc];
    objc_msgSend(v6, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUID:", v10);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1, "removedEvents", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "hdmc_notificationHoldInstruction");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v17, v11);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

@end
