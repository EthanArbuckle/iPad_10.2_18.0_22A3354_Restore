@implementation HDCloudSyncValidateZonesOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint8_t buf[4];
  HDCloudSyncValidateZonesOperation *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "zonesByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      v9 = (os_log_t *)MEMORY[0x1E0CB5370];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v11, "validatedForSharing") & 1) == 0)
          {
            _HKInitializeLogging();
            v12 = *v9;
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v31 = self;
              v32 = 2114;
              v33 = v11;
              _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarding zone for invalid sharing state: %{public}@", buf, 0x16u);
            }
            -[HDCloudSyncOperation cloudState](self, "cloudState");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v11;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "cloudStateByRemovingZones:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation setCloudState:](self, "setCloudState:", v15);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v7);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "zonesByIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          if (objc_msgSend(v23, "hasOrphanedSequenceRecords"))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 719, CFSTR("Orphaned sequence record found in zone %@"), v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v24);

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v20);
    }

  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
}

@end
