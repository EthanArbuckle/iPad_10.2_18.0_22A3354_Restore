@implementation CALNNotificationRecordsDiffApplier

+ (void)applyDiff:(id)a3 toNotificationManager:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "removedRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "modifiedRecords");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "addedRecords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v51 = v10;
    v52 = 2112;
    v53 = v13;
    v54 = 2112;
    v55 = v16;
    _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Applying diff to notification manager. Removed: %@, Modified: %@, Added: %@", buf, 0x20u);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v5, "removedRecords");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v22, "sourceIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sourceClientIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeRecordWithSourceIdentifier:sourceClientIdentifier:", v23, v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v19);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "modifiedRecords");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(v6, "updateRecord:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v27);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v5, "addedRecords", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(v6, "addRecord:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v32);
  }

}

+ (void)refreshNotificationManager:(id)a3 withNotificationRecords:(id)a4 forSourceWithIdentifier:(id)a5 filteredBySourceClientIDs:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "fetchRecordsWithSourceIdentifier:", a5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationRecordsDiffer diffOldRecords:withNewRecords:filteredBySourceClientIDs:](CALNNotificationRecordsDiffer, "diffOldRecords:withNewRecords:filteredBySourceClientIDs:", v14, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "applyDiff:toNotificationManager:", v13, v12);
}

@end
