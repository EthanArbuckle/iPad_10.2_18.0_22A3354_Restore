@implementation CALNNotificationRecordsDiffer

+ (id)diffOldRecords:(id)a3 withNewRecords:(id)a4 filteredBySourceClientIDs:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  CALNNotificationIdentifier *v16;
  void *v17;
  void *v18;
  CALNNotificationIdentifier *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CALNNotificationIdentifier *v25;
  void *v26;
  void *v27;
  CALNNotificationIdentifier *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id obj;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v42 = a5;
  v45 = (void *)objc_opt_new();
  v44 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v16 = [CALNNotificationIdentifier alloc];
        objc_msgSend(v15, "sourceIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sourceClientIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:](v16, "initWithSourceIdentifier:sourceClientIdentifier:", v17, v18);

        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v12);
  }
  v41 = v10;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v23);
        v25 = [CALNNotificationIdentifier alloc];
        objc_msgSend(v24, "sourceIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sourceClientIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[CALNNotificationIdentifier initWithSourceIdentifier:sourceClientIdentifier:](v25, "initWithSourceIdentifier:sourceClientIdentifier:", v26, v27);

        objc_msgSend(v9, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v45;
        if (!v29)
          goto LABEL_20;
        objc_msgSend(v9, "removeObjectForKey:", v28);
        objc_msgSend(v29, "content");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "content");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v31)
          v34 = v32 == 0;
        else
          v34 = 1;
        if (v34)
        {

          v30 = v44;
          if (v31 == v33)
            goto LABEL_21;
LABEL_20:
          objc_msgSend(v30, "addObject:", v24);
          goto LABEL_21;
        }
        v35 = objc_msgSend(v31, "isEqualForDiffingPurposesToContent:", v32);

        v30 = v44;
        if ((v35 & 1) == 0)
          goto LABEL_20;
LABEL_21:

        ++v23;
      }
      while (v21 != v23);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      v21 = v36;
    }
    while (v36);
  }

  if (v42)
  {
    v37 = (void *)objc_msgSend(v9, "copy");
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __89__CALNNotificationRecordsDiffer_diffOldRecords_withNewRecords_filteredBySourceClientIDs___block_invoke;
    v46[3] = &unk_24D4845A0;
    v47 = v42;
    v48 = v9;
    objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v46);

  }
  objc_msgSend(v9, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNNotificationRecordsDiff diffWithAddedRecords:removedRecords:modifiedRecords:](CALNNotificationRecordsDiff, "diffWithAddedRecords:removedRecords:modifiedRecords:", v45, v38, v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __89__CALNNotificationRecordsDiffer_diffOldRecords_withNewRecords_filteredBySourceClientIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  +[CALNNotificationFilterUtils filterIdentifierForNotificationRecord:](CALNNotificationFilterUtils, "filterIdentifierForNotificationRecord:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v6);

}

@end
