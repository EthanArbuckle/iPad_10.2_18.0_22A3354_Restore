@implementation NSPersistentStore

- (id)_deleteChangesWithDuration:(void *)a3 entity:(uint64_t)a4 context:(double)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = a3;
    v9 = a2;
    objc_msgSend(v8, "hmd_assertIsExecuting");
    objc_msgSend(MEMORY[0x24BDBB708], "fetchRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertiesByName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("changedEntity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "propertiesByName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("changeType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD1758];
    v28 = v13;
    objc_msgSend(v13, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %ld)"), v17, v18, v19, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setPredicate:", v20);
    if (a5 <= 2.22044605e-16 || fabs(a5 + -2.22044605e-16) < 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryWithFetchRequest:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateByAddingTimeInterval:", -a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFetchRequest:", v10);

    }
    v30[0] = a1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAffectedStores:", v24);

    objc_msgSend(v23, "setFetchBatchSize:", 20);
    objc_msgSend(v23, "setResultType:", 4);
    objc_msgSend(v8, "executeRequest:error:", v23, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v25, "result");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }
  return v26;
}

void __83__NSPersistentStore_HomeKitDaemon__hmd_tombstonesForEntity_duration_context_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "changedObjectID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tombstone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1B8];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __93__NSPersistentStore_HomeKitDaemon__hmd_deletedModelIDsForEntity_modelIDKey_duration_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "tombstone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v4 = v5;
  }

}

void __97__NSPersistentStore_HomeKitDaemon__hmd_modelWasDeletedWithID_modelIDKey_entity_duration_context___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  objc_msgSend(a2, "tombstone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", a1[4]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", a1[5]))
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }

}

@end
