@implementation _DKTombstoneNotifier

+ (void)sendDistributedNotificationsForTombstoneRequirementIdentifiers:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_DKThrottledActivity standardInstance](_DKThrottledActivity, "standardInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke;
        v16[3] = &unk_1E26E2F20;
        v16[4] = v13;
        v14 = (void *)MEMORY[0x193FEEAF4](v16);
        objc_msgSend(v7, "performWithMinimumIntervalInSecondsOf:name:queue:activityBlock:", v13, v6, v14, 2.0);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

@end
