@implementation _DKKnowledgeStorage

- (uint64_t)_saveObjects:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  _CDMemoryUsageInterval *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint8_t buf[4];
  _BYTE v48[14];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
    if (v5)
    {
      -[_DKKnowledgeStorage removeBadObjects:](a1, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      if (v7 != objc_msgSend(v5, "count"))
      {
        v8 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v8, "removeObjectsInArray:", v6);
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[_DKKnowledgeStorage _saveObjects:error:].cold.1();

      }
      if (!objc_msgSend(v6, "count"))
      {
        if (a3)
          *a3 = 0;
        a1 = 1;
        goto LABEL_31;
      }
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 1;
      v37 = 0;
      v38 = &v37;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__13;
      v41 = __Block_byref_object_dispose__13;
      v42 = 0;
      objc_msgSend(v5, "count");
      objc_msgSend(v6, "count");
      kdebug_trace();
      v30 = (void *)objc_msgSend(v5, "count");
      v10 = v5;
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v20 = CFSTR("unknown");
LABEL_23:

          goto LABEL_24;
        }
        objc_msgSend(v10, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stream");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 == 0;

        if (!v16)
        {
          objc_msgSend(v10, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stream");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v10, "count") < 2)
          {
            v19 = v11;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ +more..."), v11);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v20 = v19;
          goto LABEL_23;
        }
      }
      v20 = CFSTR("unknown");
LABEL_24:

      _cdknowledge_signpost_save_begin(v30, v20);
      v21 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("saveObjects"), 0);
      -[_CDMemoryUsageInterval begin](v21, "begin");
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v48 = v23;
        _os_log_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_INFO, "[Storage] Starting saveObjects with %lu objects.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 96), "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(a1 + 72));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __42___DKKnowledgeStorage__saveObjects_error___block_invoke;
      v31[3] = &unk_1E26E5138;
      v32 = v6;
      v25 = v24;
      v35 = &v37;
      v36 = &v43;
      v33 = v25;
      v34 = a1;
      objc_msgSend(v25, "performWithOptions:andBlock:", 4, v31);
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = *((unsigned __int8 *)v44 + 24);
        v28 = v38[5];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v48 = v27;
        *(_WORD *)&v48[4] = 2112;
        *(_QWORD *)&v48[6] = v28;
        _os_log_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_INFO, "[Storage] Completed saveObjects with success=%d. Error: %@.", buf, 0x12u);
      }

      -[_CDMemoryUsageInterval end](v21, "end");
      if (a3)
        *a3 = objc_retainAutorelease((id)v38[5]);
      a1 = *((_BYTE *)v44 + 24) != 0;

      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v43, 8);
LABEL_31:

      goto LABEL_32;
    }
    if (a3)
    {
      -[_DKKnowledgeStorage nilArrayError]((void *)a1);
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
LABEL_32:

  return a1;
}

- (unint64_t)deleteAllEventsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *executionQueue;
  id v8;
  unint64_t v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = 0;
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_error___block_invoke;
  v11[3] = &unk_1E26E5110;
  v13 = &v21;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  dispatch_sync(executionQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = v22[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (id)removeBadObjects:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = a2;
    objc_msgSend(v2, "indexesOfObjectsPassingTest:", &__block_literal_global_45);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v4, "removeObjectsAtIndexes:", v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (dispatch_queue_t)_deleteAllEventsMatchingPredicate:(_QWORD *)a3 error:
{
  id v5;
  uint64_t v6;
  _DKBiomeQuery *v7;
  _DKBiomeQuery *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    if (_os_feature_enabled_impl()
      && !+[_DKBiomeQuery shimDisabled](_DKBiomeQuery, "shimDisabled"))
    {
      v7 = -[_DKBiomeQuery initWithDeletionPredicate:]([_DKBiomeQuery alloc], "initWithDeletionPredicate:", v5);
      v8 = v7;
      if (v7)
      {
        v14 = 0;
        v6 = -[_DKBiomeQuery executeDeletionQuery:](v7, "executeDeletionQuery:", &v14);
        v9 = v14;
        v10 = v9;
        if (a3 && v9)
          *a3 = objc_retainAutorelease(v9);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
    -[_DKKnowledgeStorage _tombstoneObjectsMatchingPredicate:batchSize:error:](a1, v5, 256, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (dispatch_queue_t *)(-[dispatch_queue_t deleteEventsMatchingPredicate:limit:](a1, "deleteEventsMatchingPredicate:limit:", v12, 0)+ v6);

  }
  return a1;
}

- (dispatch_queue_t)_tombstoneObjectsMatchingPredicate:(uint64_t)a3 batchSize:(_QWORD *)a4 error:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD *v26;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  dispatch_queue_t *v36;
  void *context;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  dispatch_queue_t *v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];
  id v74;
  _BYTE v75[128];
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    if (v6)
    {
      v38 = a3;
      v35 = v6;
      v36 = a1;
      v72 = 0;
      v73[0] = &v72;
      v73[1] = 0x3032000000;
      v73[2] = __Block_byref_object_copy__13;
      v73[3] = __Block_byref_object_dispose__13;
      v74 = 0;
      v68 = 0;
      v69 = &v68;
      v70 = 0x2020000000;
      v71 = 0;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[dispatch_queue_t storage](v36, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], v36[9]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v26 = v73;
      while (1)
      {
        context = (void *)MEMORY[0x193FEE914]();
        v62 = 0;
        v63 = &v62;
        v64 = 0x3032000000;
        v65 = __Block_byref_object_copy__13;
        v66 = __Block_byref_object_dispose__13;
        v67 = 0;
        v56 = 0;
        v57 = &v56;
        v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__13;
        v60 = __Block_byref_object_dispose__13;
        v61 = 0;
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __74___DKKnowledgeStorage__tombstoneObjectsMatchingPredicate_batchSize_error___block_invoke;
        v44[3] = &unk_1E26E5160;
        v45 = v35;
        v54 = v10;
        v55 = v38;
        v29 = v33;
        v46 = v29;
        v47 = v36;
        v11 = v31;
        v48 = v11;
        v50 = &v72;
        v34 = v32;
        v49 = v34;
        v51 = &v62;
        v52 = &v56;
        v53 = &v68;
        v30 = v11;
        objc_msgSend(v11, "performWithOptions:andBlock:", 4, v44);
        if (objc_msgSend((id)v63[5], "count"))
        {
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v12 = (id)v63[5];
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v75, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v41 != v14)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "metadata", v26);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                  objc_msgSend(v8, "addObject:", v18);

              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v75, 16);
            }
            while (v13);
          }

          v19 = (void *)v63[5];
          v20 = (id *)(v73[0] + 40);
          obj = *(id *)(v73[0] + 40);
          -[_DKKnowledgeStorage _saveObjects:error:]((uint64_t)v36, v19, &obj);
          objc_storeStrong(v20, obj);
        }
        v21 = (void *)v57[5];
        if (v21 && objc_msgSend(v21, "count"))
        {
          objc_msgSend((id)v57[5], "allObjects");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObjectsFromArray:", v22);

        }
        _Block_object_dispose(&v56, 8);

        _Block_object_dispose(&v62, 8);
        objc_autoreleasePoolPop(context);
        v23 = *(_QWORD *)(v73[0] + 40);
        if (v69[3] != v38)
          break;
        v10 += v38;
        if (v23)
          goto LABEL_23;
      }
      if (v23)
      {
LABEL_23:
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel", v26);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[_DKKnowledgeStorage _tombstoneObjectsMatchingPredicate:batchSize:error:].cold.1();
        goto LABEL_27;
      }
      -[_DKKnowledgeStorage _sendTombstoneNotificationsWithStreamNameCounts:]((uint64_t)v36, v8);
      if (!objc_msgSend(v28, "count"))
        goto LABEL_28;
      v24 = objc_msgSend(v28, "copy");
      +[_DKTombstoneNotifier sendDistributedNotificationsForTombstoneRequirementIdentifiers:queue:](_DKTombstoneNotifier, "sendDistributedNotificationsForTombstoneRequirementIdentifiers:queue:", v24, v36[11]);
LABEL_27:

LABEL_28:
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(v73[0] + 40));
      a1 = (dispatch_queue_t *)objc_msgSend(v34, "copy", v26);

      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v72, 8);

      v6 = v35;
    }
    else
    {
      a1 = (dispatch_queue_t *)MEMORY[0x1E0C9AA60];
    }
  }

  return a1;
}

- (_DKCoreDataStorage)storage
{
  return self->_storage;
}

- (unint64_t)deleteEventsMatchingPredicate:(id)a3 limit:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3928];
  v7 = a3;
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent entityName](_DKEvent, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 0;
  v12 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v9, v10, v7, v11, a4, 0, v14);

  return v12;
}

- (void)_sendTombstoneNotificationsWithStreamNameCounts:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id obj;
  void *v17;
  _QWORD v18[6];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[4];
  id v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && v3 && objc_msgSend(v3, "count"))
  {
    v17 = v4;
    obj = *(id *)(a1 + 56);
    objc_sync_enter(obj);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = *(id *)(a1 + 56);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = *(void **)(a1 + 32);
            v18[0] = v8;
            v18[1] = 3221225472;
            v18[2] = __71___DKKnowledgeStorage__sendTombstoneNotificationsWithStreamNameCounts___block_invoke;
            v18[3] = &unk_1E26E35A8;
            v18[4] = v10;
            v18[5] = a1;
            v19 = v17;
            v12 = v18;
            v13 = v11;
            v14 = (void *)os_transaction_create();
            block[0] = v8;
            block[1] = 3221225472;
            block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
            block[3] = &unk_1E26E3380;
            v25 = v14;
            v26 = v12;
            v15 = v14;
            dispatch_async(v13, block);

          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v6);
    }

    objc_sync_exit(obj);
    v4 = v17;
  }

}

- (void)_sendInsertEventsNotificationWithObjects:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    -[_DKKnowledgeStorage _sendEventsNotificationName:withObjects:](a1, CFSTR("_DKKnowledgeStorageDidInsertEventsNotification"), v3);
    +[_DKQuery predicateForEventsWithNullSourceDeviceID](_DKQuery, "predicateForEventsWithNullSourceDeviceID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DKKnowledgeStorage _sendEventsNotificationName:withObjects:](a1, CFSTR("_DKKnowledgeStorageDidInsertLocalEventsNotification"), v4);
  }
}

- (void)_sendEventsNotificationName:(void *)a3 withObjects:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  _QWORD *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id obj;
  id v38;
  uint64_t v39;
  _QWORD v40[6];
  id v41;
  _QWORD v42[6];
  id v43;
  _QWORD v44[6];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t block;
  uint64_t v55;
  uint64_t (*v56)(uint64_t);
  void *v57;
  id v58;
  id v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v39 = a1;
  if (a1)
  {
    v7 = (void *)objc_opt_new();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v38 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(v13, "stream");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              objc_msgSend(v7, "addObject:", v15);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v7, "count"))
    {
      obj = *(id *)(v39 + 56);
      objc_sync_enter(obj);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v16 = *(id *)(v39 + 56);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
      if (!v17)
        goto LABEL_31;
      v18 = *(_QWORD *)v47;
      while (1)
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j);
          if (objc_msgSend(v5, "isEqualToString:", CFSTR("_DKKnowledgeStorageDidInsertEventsNotification")))
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
              continue;
            v21 = *(void **)(v39 + 32);
            v44[0] = MEMORY[0x1E0C809B0];
            v44[1] = 3221225472;
            v44[2] = __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke;
            v44[3] = &unk_1E26E35A8;
            v44[4] = v20;
            v44[5] = v39;
            v45 = v7;
            v22 = v44;
            v23 = v21;
            v24 = (void *)os_transaction_create();
            block = MEMORY[0x1E0C809B0];
            v55 = 3221225472;
            v56 = __cd_dispatch_async_capture_tx_block_invoke_6;
            v57 = &unk_1E26E3380;
            v58 = v24;
            v59 = v22;
            v25 = v24;
            dispatch_async(v23, &block);

            v26 = &v45;
            goto LABEL_28;
          }
          if (objc_msgSend(v5, "isEqualToString:", CFSTR("_DKKnowledgeStorageDidInsertLocalEventsNotification")))
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
              continue;
            v27 = *(void **)(v39 + 32);
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_2;
            v42[3] = &unk_1E26E35A8;
            v42[4] = v20;
            v42[5] = v39;
            v43 = v7;
            v28 = v42;
            v29 = v27;
            v30 = (void *)os_transaction_create();
            block = MEMORY[0x1E0C809B0];
            v55 = 3221225472;
            v56 = __cd_dispatch_async_capture_tx_block_invoke_6;
            v57 = &unk_1E26E3380;
            v58 = v30;
            v59 = v28;
            v31 = v30;
            dispatch_async(v29, &block);

            v26 = &v43;
            goto LABEL_28;
          }
          if (objc_msgSend(v5, "isEqualToString:", CFSTR("_DKKnowledgeStorageDidDeleteEventsNotification"))&& (objc_opt_respondsToSelector() & 1) != 0)
          {
            v32 = *(void **)(v39 + 32);
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_3;
            v40[3] = &unk_1E26E35A8;
            v40[4] = v20;
            v40[5] = v39;
            v41 = v7;
            v33 = v40;
            v34 = v32;
            v35 = (void *)os_transaction_create();
            block = MEMORY[0x1E0C809B0];
            v55 = 3221225472;
            v56 = __cd_dispatch_async_capture_tx_block_invoke_6;
            v57 = &unk_1E26E3380;
            v58 = v35;
            v59 = v33;
            v36 = v35;
            dispatch_async(v34, &block);

            v26 = &v41;
LABEL_28:

            continue;
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        if (!v17)
        {
LABEL_31:

          objc_sync_exit(obj);
          break;
        }
      }
    }

    v6 = v38;
  }

}

- (_DKTombstonePolicy)tombstonePolicy
{
  return (_DKTombstonePolicy *)objc_getProperty(self, a2, 80, 1);
}

- (dispatch_queue_t)_executeQuery:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  dispatch_queue_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  id v30;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ((objc_msgSend(v5, "executeConcurrently") & 1) == 0)
      dispatch_assert_queue_V2(a1[11]);
    +[_DKQuery executableQueryForQuery:](_DKQuery, "executableQueryForQuery:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__13;
      v29[4] = __Block_byref_object_dispose__13;
      v30 = 0;
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__13;
      v27 = __Block_byref_object_dispose__13;
      v28 = 0;
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __43___DKKnowledgeStorage__executeQuery_error___block_invoke;
      v16 = &unk_1E26E5240;
      v8 = v6;
      v17 = v8;
      v18 = v7;
      v19 = a1;
      v20 = &v23;
      v21 = v29;
      v22 = a3;
      v9 = (void (**)(_QWORD))MEMORY[0x193FEEAF4](&v13);
      objc_msgSend(v8, "tracker", v13, v14, v15, v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v8, "tracker");
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void (**)(_QWORD)))v11)[2](v11, v9);

      }
      else
      {
        v9[2](v9);
      }
      a1 = (dispatch_queue_t *)(id)v24[5];

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(v29, 8);

    }
    else if (a3)
    {
      +[_DKQuery queryNotExecutableError](_DKQuery, "queryNotExecutableError");
      a1 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)executeQuery:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  OS_dispatch_queue **p_executionQueue;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__13;
  v31 = __Block_byref_object_dispose__13;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42___DKKnowledgeStorage_executeQuery_error___block_invoke;
  v12[3] = &unk_1E26E5218;
  v14 = &v17;
  v15 = &v21;
  v12[4] = self;
  v7 = v6;
  v13 = v7;
  v16 = &v27;
  v8 = (void (**)(_QWORD))MEMORY[0x193FEEAF4](v12);
  p_executionQueue = &self->_executionQueue;
  if (dispatch_get_specific(p_executionQueue) != p_executionQueue
    && !objc_msgSend(v7, "executeConcurrently"))
  {
    *((_BYTE *)v18 + 24) = 1;
    dispatch_sync((dispatch_queue_t)*p_executionQueue, v8);
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_BYTE *)v18 + 24) = 0;
  v8[2](v8);
  if (a4)
LABEL_4:
    *a4 = objc_retainAutorelease((id)v28[5]);
LABEL_5:
  v10 = (id)v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v10;
}

- (void)saveObjects:(id)a3 tracker:(id)a4 responseQueue:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *executionQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = (void *)os_transaction_create();
  v15 = (void *)MEMORY[0x193FEEAF4](v13);

  executionQueue = self->_executionQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke;
  v22[3] = &unk_1E26E50E8;
  v22[4] = self;
  v23 = v10;
  v26 = v15;
  v27 = v12;
  v24 = v11;
  v25 = v14;
  v17 = v14;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v21 = v15;
  dispatch_async(executionQueue, v22);

}

- (BOOL)saveObjects:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *executionQueue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__13;
  v23 = __Block_byref_object_dispose__13;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41___DKKnowledgeStorage_saveObjects_error___block_invoke;
  v11[3] = &unk_1E26E5110;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v19;
  dispatch_sync(executionQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)initWithDirectory:(uint64_t)a3 readOnly:(int)a4 localOnly:
{
  id v8;
  _CDMemoryUsageInterval *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  _DKCoreDataStorage *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  id v26;
  dispatch_queue_t v27;
  id v28;
  void *v29;
  __int16 v31[8];
  objc_super v32;

  v8 = a2;
  if (a1)
  {
    v32.receiver = a1;
    v32.super_class = (Class)_DKKnowledgeStorage;
    a1 = (id *)objc_msgSendSuper2(&v32, sel_init);
    if (a1)
    {
      v9 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("init"), 0);
      -[_CDMemoryUsageInterval begin](v9, "begin");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pathForResource:ofType:", CFSTR("_DKDataModel"), CFSTR("momd"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((_DWORD)a3)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v31[0] = 0;
          _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_INFO, "readOnly is true, forcing localOnly", (uint8_t *)v31, 2u);
        }

      }
      else if (!a4)
      {
        v15 = -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:sync:]([_DKCoreDataStorage alloc], "initWithDirectory:databaseName:modelURL:sync:", v8, CFSTR("knowledge"), v12, 0);
        v14 = 0;
        goto LABEL_10;
      }
      v14 = 1;
      v15 = -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:readOnly:localOnly:]([_DKCoreDataStorage alloc], "initWithDirectory:databaseName:modelURL:readOnly:localOnly:", v8, CFSTR("knowledge"), v12, a3, 1);
LABEL_10:
      v16 = a1[12];
      a1[12] = v15;

      objc_msgSend(a1[12], "setDelegate:", a1);
      objc_msgSend(a1[12], "setRequiresManualMigration:", 1);
      *((_BYTE *)a1 + 9) = v14;
      objc_storeStrong(a1 + 5, a2);
      v17 = a1[6];
      a1[6] = v12;
      v18 = v12;

      +[_DKTombstonePolicy defaultPolicy](_DKTombstonePolicy, "defaultPolicy");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = a1[10];
      a1[10] = (id)v19;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = a1[7];
      a1[7] = (id)v21;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_UTILITY, 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v25 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.coreduet.knowledgestorage.execution"), "UTF8String"), v24);
      v26 = a1[11];
      a1[11] = v25;

      v27 = dispatch_queue_create("com.apple.coreduet.knowledgestorage.response", v24);
      v28 = a1[4];
      a1[4] = v27;

      +[_DKKnowledgeStorageLogging sharedInstance]();
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "addKnowledgeStorageEventNotificationDelegate:", v29);
      *((_BYTE *)a1 + 8) = 1;
      -[_CDMemoryUsageInterval end](v9, "end");

    }
  }

  return a1;
}

- (void)addKnowledgeStorageEventNotificationDelegate:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_knowledgeStorageEventNotificationDelegates;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_knowledgeStorageEventNotificationDelegates, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_databaseChangedWithNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  OS_dispatch_queue *executionQueue;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSHashTable *obj;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD block[4];
  id v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_databaseChangedWithNotification__syncCounterInitialized != -1)
    dispatch_once(&_databaseChangedWithNotification__syncCounterInitialized, &__block_literal_global_540);
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_DKCoreDataStorage isManagedObjectContextFor:equalToManagedObjectContext:](self->_storage, "isManagedObjectContextFor:equalToManagedObjectContext:", *MEMORY[0x1E0CB2AC0], v5))
  {
    v23 = v5;
    v24 = v4;
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    obj = self->_knowledgeStorageEventNotificationDelegates;
    objc_sync_enter(obj);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v8 = self->_knowledgeStorageEventNotificationDelegates;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "addObject:", v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "addObject:", v12);
        }
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v9);
    }

    v5 = v23;
    v4 = v24;
    objc_sync_exit(obj);

    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__13;
    v48 = __Block_byref_object_dispose__13;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__13;
    v42 = __Block_byref_object_dispose__13;
    v43 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2;
    v32[3] = &unk_1E26E5470;
    v33 = v24;
    v14 = v6;
    v34 = v14;
    v36 = &v44;
    v15 = v7;
    v35 = v15;
    v37 = &v38;
    objc_msgSend(v23, "performWithOptions:andBlock:", 4, v32);
    v16 = objc_msgSend((id)v45[5], "count");
    v17 = objc_msgSend((id)v39[5], "count");
    if (v17 + v16)
    {
      executionQueue = self->_executionQueue;
      v26[0] = v13;
      v26[1] = 3221225472;
      v26[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_549;
      v26[3] = &unk_1E26E54C0;
      v26[4] = self;
      v31 = v17 + v16;
      v27 = v14;
      v29 = &v44;
      v28 = v15;
      v30 = &v38;
      v19 = v26;
      v20 = executionQueue;
      v21 = (void *)os_transaction_create();
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
      block[3] = &unk_1E26E3380;
      v55 = v21;
      v56 = v19;
      v22 = v21;
      dispatch_async(v20, block);

    }
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
  }

}

+ (_DKKnowledgeStorage)storageWithDirectory:(id)a3 readOnly:(BOOL)a4 localOnly:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  id *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = -[_DKKnowledgeStorage initWithDirectory:readOnly:localOnly:]((id *)objc_alloc((Class)a1), v8, v6, v5);

  return (_DKKnowledgeStorage *)v9;
}

+ (_DKKnowledgeStorage)storageWithDirectory:(id)a3 readOnly:(BOOL)a4
{
  return (_DKKnowledgeStorage *)objc_msgSend(a1, "storageWithDirectory:readOnly:localOnly:", a3, a4, a4);
}

- (id)initWithShallowCopyFromStorage:(void *)a3 clientIdentifier:
{
  id *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  id v16;
  id v17;
  id v19;
  objc_super v20;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)_DKKnowledgeStorage;
    a1 = (id *)objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      objc_msgSend(v5, "storage");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[12];
      a1[12] = (id)v7;

      *((_BYTE *)a1 + 9) = 1;
      if (v5)
      {
        objc_storeStrong(a1 + 5, v5[5]);
        v9 = v5[6];
      }
      else
      {
        v19 = a1[5];
        a1[5] = 0;

        v9 = 0;
      }
      objc_storeStrong(a1 + 6, v9);
      objc_msgSend(v5, "tombstonePolicy");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = a1[10];
      a1[10] = (id)v10;

      if (v5)
        v12 = v5[4];
      else
        v12 = 0;
      objc_storeStrong(a1 + 4, v12);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.coreduet.knowledgestorage.execution"), "UTF8String"), v14);
      v16 = a1[11];
      a1[11] = v15;

      if (v5)
        v17 = v5[7];
      else
        v17 = 0;
      objc_storeStrong(a1 + 7, v17);
      objc_storeStrong(a1 + 9, a3);
      *((_BYTE *)a1 + 8) = 1;

    }
  }

  return a1;
}

+ (_DKKnowledgeStorage)storageWithShallowCopyFromStorage:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  id *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_DKKnowledgeStorage initWithShallowCopyFromStorage:clientIdentifier:]((id *)objc_alloc((Class)a1), v7, v6);

  return (_DKKnowledgeStorage *)v8;
}

- (_QWORD)syncStorageIfAvailable
{
  id v1;
  NSObject *v2;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    if (!a1[12])
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        -[_DKKnowledgeStorage syncStorageIfAvailable].cold.1();
      goto LABEL_8;
    }
    if (*((_BYTE *)a1 + 9))
      goto LABEL_4;
    if (!+[_DKCloudUtilities isSyncAvailableAndEnabled](_DKCloudUtilities, "isSyncAvailableAndEnabled"))
    {
      if (!*((_BYTE *)v1 + 9))
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
          -[_DKKnowledgeStorage syncStorageIfAvailable].cold.2();
        goto LABEL_8;
      }
LABEL_4:
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        -[_DKKnowledgeStorage syncStorageIfAvailable].cold.3();
LABEL_8:

      a1 = 0;
      return a1;
    }
    if (*((_QWORD *)v1 + 2))
    {
      if (!+[_DKKnowledgeSyncStorageAssertion assertionCount]())
        objc_msgSend(v1, "closeSyncStorage");
    }
    else
    {
      objc_msgSend(v1, "syncStorage");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)*((_QWORD *)v1 + 2);
      *((_QWORD *)v1 + 2) = v4;

    }
    a1 = *((id *)v1 + 2);
  }
  return a1;
}

- (_DKCoreDataStorage)syncStorage
{
  _DKCoreDataStorage *v3;

  v3 = self->_syncStorage;
  if (!v3)
  {
    v3 = -[_DKCoreDataStorage initWithDirectory:databaseName:modelURL:sync:]([_DKCoreDataStorage alloc], "initWithDirectory:databaseName:modelURL:sync:", self->_directory, CFSTR("knowledge-sync"), self->_modelURL, 1);
    -[_DKCoreDataStorage setDelegate:](v3, "setDelegate:", self);
  }
  return v3;
}

- (BOOL)deleteStorage
{
  BOOL v3;

  v3 = -[_DKCoreDataStorage deleteStorageFor:](self->_storage, "deleteStorageFor:", *MEMORY[0x1E0CB2AC0]);
  return -[_DKKnowledgeStorage deleteSyncStorage](self, "deleteSyncStorage") && v3;
}

- (BOOL)deleteSyncStorage
{
  void *v2;
  void *v3;
  char v4;

  -[_DKKnowledgeStorage syncStorage](self, "syncStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "deleteStorageFor:", *MEMORY[0x1E0CB2AC0]);
  else
    v4 = 1;

  return v4;
}

- (void)removeKnowledgeStorageEventNotificationDelegate:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_knowledgeStorageEventNotificationDelegates;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_knowledgeStorageEventNotificationDelegates, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)nilArrayError
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, MEMORY[0x1E0C9AA70]);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)errorForException:(uint64_t)a1
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(a2, "reason");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("Exception Caught");
  if (v3)
    v5 = (const __CFString *)v3;
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.DKKnowledgeStorage"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[_DKBiomeStreamCache sharedCache](_DKBiomeStreamCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)_DKKnowledgeStorage;
  -[_DKKnowledgeStorage dealloc](&v4, sel_dealloc);
}

- (uint64_t)executionQueue
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (void)saveObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *executionQueue;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke;
  v19[3] = &unk_1E26E50C0;
  v19[4] = self;
  v20 = v8;
  v23 = v10;
  v21 = v9;
  v22 = v11;
  v14 = v22;
  v15 = v19;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E26E3380;
  v25 = v14;
  v26 = v15;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  dispatch_async(executionQueue, block);

}

- (void)deleteObjects:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *executionQueue;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke;
  v19[3] = &unk_1E26E50C0;
  v19[4] = self;
  v20 = v8;
  v23 = v10;
  v21 = v9;
  v22 = v11;
  v14 = v22;
  v15 = v19;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E26E3380;
  v25 = v14;
  v26 = v15;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  dispatch_async(executionQueue, block);

}

- (BOOL)_deleteObjects:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _CDMemoryUsageInterval *v20;
  NSObject *v21;
  uint64_t v22;
  _DKBiomeQuery *v23;
  _DKBiomeQuery *v24;
  id v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  _QWORD *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  _QWORD v48[3];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_27;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 88));
  if (!v5)
  {
    if (a3)
    {
      -[_DKKnowledgeStorage nilArrayError]((void *)a1);
      v27 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
LABEL_27:
    v27 = 0;
    goto LABEL_45;
  }
  v40 = a3;
  -[_DKKnowledgeStorage removeBadObjects:](a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 != objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "removeObjectsInArray:", v6);
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage _deleteObjects:error:].cold.2();

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 96), "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(a1 + 72));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v13);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("deleteObjects"), 0);
    -[_CDMemoryUsageInterval begin](v20, "begin");
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v48[0] = v22;
      _os_log_impl(&dword_18DDBE000, v21, OS_LOG_TYPE_INFO, "[Storage] Starting deleteObjects with %lu objects.", buf, 0xCu);
    }

    if (_os_feature_enabled_impl())
    {
      v23 = -[_DKBiomeQuery initWithDeletionArray:]([_DKBiomeQuery alloc], "initWithDeletionArray:", v6);
      v24 = v23;
      if (v23)
      {
        v42 = 0;
        v38 = -[_DKBiomeQuery executeDeletionQuery:](v23, "executeDeletionQuery:", &v42);
        v25 = v42;
        v26 = v25;
        if (v40 && v25)
          *v40 = objc_retainAutorelease(v25);

      }
      else
      {
        v38 = 0;
      }

    }
    else
    {
      v38 = 0;
    }
    v28 = (void *)MEMORY[0x193FEE914]();
    +[_DKObject entityName](_DKObject, "entityName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v36) = 1;
    v37 = (void *)v12;
    v30 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v12, v29, v39, 0, 0x7FFFFFFFFFFFFFFFLL, 1, v36);

    v27 = v30 >= objc_msgSend(v14, "count");
    if (v30 > objc_msgSend(v14, "count"))
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[_DKKnowledgeStorage _deleteObjects:error:].cold.1(v14);

    }
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = v30 >= objc_msgSend(v14, "count");
      *(_DWORD *)buf = 67109376;
      LODWORD(v48[0]) = v33;
      WORD2(v48[0]) = 2048;
      *(_QWORD *)((char *)v48 + 6) = v30;
      _os_log_impl(&dword_18DDBE000, v32, OS_LOG_TYPE_INFO, "[Storage] Completed deleteObjects with success=%d. Deleted: %lu.", buf, 0x12u);
    }

    if (v30 + v38)
    {
      v41 = 0;
      -[_DKKnowledgeStorage _tombstoneObjects:error:]((dispatch_queue_t *)a1, v6, &v41);
      v34 = v41;
      -[_DKKnowledgeStorage _sendEventsNotificationName:withObjects:](a1, CFSTR("_DKKnowledgeStorageDidDeleteEventsNotification"), v6);
    }
    else
    {
      v34 = 0;
    }
    objc_autoreleasePoolPop(v28);
    -[_CDMemoryUsageInterval end](v20, "end");
    if (v40)
      *v40 = objc_retainAutorelease(v34);
    if (_os_feature_enabled_impl())
      v27 = v38 >= objc_msgSend(v14, "count");

  }
  else
  {
    v27 = 1;
  }

LABEL_45:
  return v27;
}

- (BOOL)deleteObjects:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *executionQueue;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__13;
  v23 = __Block_byref_object_dispose__13;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  executionQueue = self->_executionQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43___DKKnowledgeStorage_deleteObjects_error___block_invoke;
  v11[3] = &unk_1E26E5110;
  v13 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v19;
  dispatch_sync(executionQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (void)_tombstoneObjects:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[11]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_424);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_queue_t tombstonePolicy](a1, "tombstonePolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v8, "tombstonesForEvents:resultingFromRequirementsWithIdentifiers:", v7, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v33;

    v10 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    if (!objc_msgSend(v9, "count"))
      goto LABEL_17;
    v23 = v7;
    v24 = v6;
    v25 = a3;
    v26 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "metadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKTombstoneMetadataKey eventStreamName](_DKTombstoneMetadataKey, "eventStreamName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v10, "addObject:", v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v13);
    }

    v28 = 0;
    -[_DKKnowledgeStorage _saveObjects:error:]((uint64_t)a1, v11, &v28);
    v19 = v28;
    a3 = v25;
    v5 = v26;
    v7 = v23;
    v6 = v24;
    if (v19)
    {
      v20 = v19;
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[_DKKnowledgeStorage _tombstoneObjects:error:].cold.1(v11, (uint64_t)v20, v21);

      v22 = v27;
      if (!v25)
        goto LABEL_21;
    }
    else
    {
LABEL_17:
      -[_DKKnowledgeStorage _sendTombstoneNotificationsWithStreamNameCounts:]((uint64_t)a1, v10);
      v22 = v27;
      if (objc_msgSend(v27, "count"))
        +[_DKTombstoneNotifier sendDistributedNotificationsForTombstoneRequirementIdentifiers:queue:](_DKTombstoneNotifier, "sendDistributedNotificationsForTombstoneRequirementIdentifiers:queue:", v27, a1[11]);
      v20 = 0;
      if (!a3)
        goto LABEL_21;
    }
    *a3 = objc_retainAutorelease(v20);
LABEL_21:

  }
}

- (void)deleteAllEventsInEventStream:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "name");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKKnowledgeStorage deleteAllEventsMatchingPredicate:responseQueue:withCompletion:](self, "deleteAllEventsMatchingPredicate:responseQueue:withCompletion:", v10, v9, v8);

}

- (unint64_t)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(a3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_DKKnowledgeStorage deleteAllEventsMatchingPredicate:error:](self, "deleteAllEventsMatchingPredicate:error:", v7, a4);

  return v8;
}

- (void)deleteAllEventsMatchingPredicate:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *executionQueue;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke;
  v19[3] = &unk_1E26E50C0;
  v19[4] = self;
  v20 = v8;
  v23 = v10;
  v21 = v9;
  v22 = v11;
  v14 = v22;
  v15 = v19;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E26E3380;
  v25 = v14;
  v26 = v15;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  dispatch_async(executionQueue, block);

}

- (void)executeQuery:(id)a3 responseQueue:(id)a4
{
  -[_DKKnowledgeStorage executeQuery:responseQueue:withCompletion:](self, "executeQuery:responseQueue:withCompletion:", a3, a4, 0);
}

- (void)executeQuery:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *executionQueue;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)os_transaction_create();
  executionQueue = self->_executionQueue;
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke;
  v19[3] = &unk_1E26E50C0;
  v19[4] = self;
  v20 = v8;
  v23 = v10;
  v21 = v9;
  v22 = v11;
  v14 = v22;
  v15 = v19;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E26E3380;
  v25 = v14;
  v26 = v15;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  dispatch_async(executionQueue, block);

}

- (unint64_t)deleteObjectsOlderThanDate:(id)a3 excludingPredicate:(id)a4 limit:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3528];
    v22[0] = v9;
    v22[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent entityName](_DKEvent, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  v18 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v15, v16, v9, v17, a5, 0, v20);

  return v18;
}

- (unint64_t)deleteEventsStartingEarlierThanDate:(id)a3 limit:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3928];
  v7 = a3;
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent entityName](_DKEvent, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate < %@"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = 0;
  v13 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v9, v10, v11, v12, a4, 0, v15);

  return v13;
}

- (unint64_t)deleteOldObjectsIfNeededToLimitTotalNumber:(unint64_t)a3 excludingPredicate:(id)a4 limit:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent entityName](_DKEvent, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v17) = 0;
  v15 = +[_DKCoreDataStorage deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", a3, v12, v13, v9, v14, a5, v17);

  return v15;
}

- (unint64_t)deleteOrphanedEntities
{
  void *v2;
  unint64_t v3;

  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[_DKCoreDataStorage deleteOrphanedEntitiesInContext:](_DKCoreDataStorage, "deleteOrphanedEntitiesInContext:", v2);

  return v3;
}

- (unint64_t)eventCount
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent entityName](_DKEvent, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[_DKCoreDataStorage countObjectsInContext:entityName:predicate:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "countObjectsInContext:entityName:predicate:includeSubentities:includePendingChanges:", v2, v3, v4, 0, 0);

  return v5;
}

- (unint64_t)totalEventCountForStreams:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10), (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:](_DKEventQuery, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", 0, v12, 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setResultType:", 1);
  -[_DKKnowledgeStorage executeQuery:error:](self, "executeQuery:error:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "unsignedIntegerValue");
  return v16;
}

- (id)eventCountPerStreamName
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke;
  v6[3] = &unk_1E26E4A80;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performWithOptions:andBlock:", 4, v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)eventCountsForStreams:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v20 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v10 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "numberWithUnsignedInteger:", -[_DKKnowledgeStorage totalEventCountForStreams:](self, "totalEventCountForStreams:", v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }

  return v5;
}

- (unint64_t)deleteObjectsInEventStreams:(id)a3 olderThanDate:(id)a4 limit:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8 && (objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AA60]) & 1) == 0)
  {
    +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@ OR startDate < %@"), v9, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v26 = v11;
    v34[0] = v11;
    v34[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "predicateFormat");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateFormat");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "predicateFormat");
      *(_DWORD *)buf = 138412802;
      v29 = v25;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v33;
      _os_log_debug_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_DEBUG, "deleteObjectsInEventStreams:olderThanDate:\n namePredicate = %@\n agePredicate = %@\n andPred = %@\n", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKEvent entityName](_DKEvent, "entityName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = 0;
    v10 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v18, v19, v15, v20, a5, 0, v24);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)deleteObjectsInEventStream:(id)a3 ifNeededToLimitEventCount:(unint64_t)a4 batchLimit:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  +[_DKQuery predicateForEventsWithStreamName:](_DKQuery, "predicateForEventsWithStreamName:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKEvent entityName](_DKEvent, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v15) = 0;
  v13 = +[_DKCoreDataStorage deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsIfNeededToLimitTotal:context:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", a4, v10, v11, v8, v12, a5, v15);

  return v13;
}

- (void)closeStorage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Closing knowledge storage connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)closeSyncStorage
{
  _DKCoreDataStorage *syncStorage;

  syncStorage = self->_syncStorage;
  if (syncStorage)
    -[_DKCoreDataStorage closeStorageForProtectionClass:](syncStorage, "closeStorageForProtectionClass:", *MEMORY[0x1E0CB2AC0]);
}

- (id)migrationStreamsWithMOC:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Event"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B20], "entityForName:inManagedObjectContext:", CFSTR("Event"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResultType:", 2);
    objc_msgSend(v5, "propertiesByName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("streamName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPropertiesToFetch:", v8);

    objc_msgSend(v4, "setReturnsDistinctResults:", 1);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__13;
    v20 = __Block_byref_object_dispose__13;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47___DKKnowledgeStorage_migrationStreamsWithMOC___block_invoke;
    v12[3] = &unk_1E26E2CA8;
    v15 = &v16;
    v13 = v3;
    v9 = v4;
    v14 = v9;
    objc_msgSend(v13, "performBlockAndWait:", v12);
    objc_msgSend((id)v17[5], "_pas_mappedArrayWithTransform:", &__block_literal_global_462);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)migrateEventBatchToBiomeStream:(void *)a3 fetchRequest:(void *)a4 managedObjectContex:(void *)a5 converter:(_QWORD *)a6 eventCount:(_QWORD *)a7 offset:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];
  _BYTE v56[16];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v31 = v14;
  v32 = v15;
  if (a1)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__13;
    v53 = __Block_byref_object_dispose__13;
    v54 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__13;
    v47 = __Block_byref_object_dispose__13;
    v48 = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __115___DKKnowledgeStorage_migrateEventBatchToBiomeStream_fetchRequest_managedObjectContex_converter_eventCount_offset___block_invoke;
    v37[3] = &unk_1E26E5138;
    v38 = v15;
    v17 = v14;
    v39 = v17;
    v41 = &v49;
    v42 = &v43;
    v40 = v16;
    objc_msgSend(v38, "performBlockAndWait:", v37);
    *a6 = objc_msgSend((id)v44[5], "count");
    *a7 += objc_msgSend(v17, "fetchLimit");
    v18 = v50[5];
    v30 = v18 == 0;
    if (v18)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKKnowledgeStorage migrateEventBatchToBiomeStream:fetchRequest:managedObjectContex:converter:eventCount:offset:].cold.1(v20, (uint64_t)v56, v19);
      }
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v19 = (id)v44[5];
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v55, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v34;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v34 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
            v25 = (void *)MEMORY[0x193FEE914]();
            -[objc_class eventWithDKEvent:](getBMDKEventClass(), "eventWithDKEvent:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "creationDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "source");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "timeIntervalSinceReferenceDate");
            objc_msgSend(v28, "sendEvent:timestamp:", v26);

            objc_autoreleasePoolPop(v25);
            ++v23;
          }
          while (v21 != v23);
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v55, 16);
        }
        while (v21);
      }
    }

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)verifyBiomeMigration:(uint64_t)a3 expectedEventCount:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    objc_msgSend(v5, "publisherFromStartTime:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63___DKKnowledgeStorage_verifyBiomeMigration_expectedEventCount___block_invoke_2;
    v15[3] = &unk_1E26E52A8;
    v15[4] = &v16;
    v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_464, v15);

    v9 = v17[3];
    a1 = v9 == a3;
    if (v9 != a3)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "identifier");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = objc_msgSend(v12, "UTF8String");
        v14 = v17[3];
        *(_DWORD *)buf = 136446722;
        v21 = v13;
        v22 = 2048;
        v23 = v14;
        v24 = 2048;
        v25 = a3;
        _os_log_error_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_ERROR, "Unexpected mismatch in Biome stream event count encountered during migration of stream %{public}s Biome count: %lu CD count: %lu", buf, 0x20u);

      }
    }
    _Block_object_dispose(&v16, 8);
  }

  return a1;
}

- (BOOL)deleteKnowledgeStream:(void *)a3 context:(uint64_t)a4 expectedEventCount:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    v8 = a3;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStreamName:](_DKEventQuery, "predicateForEventsWithStreamName:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKEvent entityName](_DKEvent, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = 1;
    v12 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v8, v11, v10, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v16);

    a1 = v12 == a4;
    if (v12 != a4)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "name");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136446722;
        v18 = objc_msgSend(v14, "UTF8String");
        v19 = 2048;
        v20 = a4;
        v21 = 2048;
        v22 = v12;
        _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEFAULT, "Unexpected number of events deleted after Biome migration of stream: %{public}s expected: %lu deleted: %lu", buf, 0x20u);

      }
    }

  }
  return a1;
}

- (BOOL)biomeStreamContainsEntries:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    objc_msgSend(v3, "publisherWithStartTime:endTime:maxEvents:reversed:", 0, 0, &unk_1E272ACC0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50___DKKnowledgeStorage_biomeStreamContainsEntries___block_invoke_2;
    v9[3] = &unk_1E26E52A8;
    v9[4] = &v10;
    v6 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", &__block_literal_global_467, v9);
    v7 = *((_BYTE *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)migrateStream:(void *)a3 context:
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _DKObjectMOConverter *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  uint64_t v37;
  NSObject *v38;
  BOOL v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *context;
  uint64_t v55;
  void *v56;
  void *v57;
  _QWORD v58[2];
  void *v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v53 = a3;
  if (a1)
  {
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(getBMDKEventStreamClass()), "initWithDKStreamIdentifier:contentProtection:", v6, *MEMORY[0x1E0CB2AC0]);
    if (v7)
    {
      if (-[_DKKnowledgeStorage biomeStreamContainsEntries:](a1, v7))
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v61 = (uint64_t)v9;
          _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "Skipping migration of Biome stream since entries already exist, stream %{public}@", buf, 0xCu);

        }
        v10 = 1;
      }
      else
      {
        +[_CDEventStreams eventStreamPropertiesForEventStream:](_CDEventStreams, "eventStreamPropertiesForEventStream:", v5);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = 2419200.0;
        v48 = v6;
        if (v11)
        {
          -[NSObject timeToLive](v11, "timeToLive");
          if (v14 > 0.0)
          {
            -[NSObject timeToLive](v12, "timeToLive");
            v13 = v15;
          }
        }
        v47 = v12;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v13);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = (uint64_t)v18;
          v62 = 2114;
          v63 = v16;
          _os_log_impl(&dword_18DDBE000, v17, OS_LOG_TYPE_DEFAULT, "Migrating events to Biome from stream %{public}@ since %{public}@", buf, 0x16u);

        }
        v49 = v5;
        objc_msgSend(v5, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v19;
        v20 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v46 = (void *)v16;
        +[_DKQuery predicateForEventsBetweenStartDate:endDate:](_DKQuery, "predicateForEventsBetweenStartDate:endDate:", v16, v50);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0CB3528];
        v44 = (void *)v23;
        v45 = (void *)v22;
        v58[0] = v22;
        v58[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "andPredicateWithSubpredicates:", v25);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        +[_DKQuery creationDateSortDescriptorAscending:](_DKQuery, "creationDateSortDescriptorAscending:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0;
        v55 = 0;
        v56 = 0;
        do
        {
          context = (void *)MEMORY[0x193FEE914]();
          v28 = objc_alloc_init(MEMORY[0x1E0C97B48]);
          v29 = (void *)MEMORY[0x1E0C97B20];
          +[_DKEvent entityName](_DKEvent, "entityName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "entityForName:inManagedObjectContext:", v30, v53);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setEntity:", v31);

          objc_msgSend(v28, "setFetchLimit:", 500);
          objc_msgSend(v28, "setFetchOffset:", v56);
          objc_msgSend(v28, "setPredicate:", v52);
          objc_msgSend(v28, "setSortDescriptors:", v51);
          v32 = objc_alloc_init(_DKObjectMOConverter);
          -[_DKObjectMOConverter setReadMetadata:](v32, "setReadMetadata:", 1);
          -[_DKObjectMOConverter setDeduplicateValues:](v32, "setDeduplicateValues:", 1);
          v33 = a1;
          v34 = a1;
          v35 = v7;
          v36 = -[_DKKnowledgeStorage migrateEventBatchToBiomeStream:fetchRequest:managedObjectContex:converter:eventCount:offset:](v34, v7, v28, v53, v32, &v55, &v56);
          v37 = v55;
          if (!v36)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v49, "name");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v61 = (uint64_t)v40;
              v62 = 2048;
              v63 = (uint64_t)v56;
              _os_log_error_impl(&dword_18DDBE000, v38, OS_LOG_TYPE_ERROR, "Error migrating event batch for stream: %{public}@ offset: %lu", buf, 0x16u);

            }
          }
          v27 += v37;
          v20 &= v36;

          objc_autoreleasePoolPop(context);
          v39 = v37 == 500;
          v7 = v35;
          a1 = v33;
        }
        while (v39);
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v41 = objc_claimAutoreleasedReturnValue();
        v5 = v49;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v49, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v61 = v27;
          v62 = 2114;
          v63 = (uint64_t)v42;
          _os_log_impl(&dword_18DDBE000, v41, OS_LOG_TYPE_DEFAULT, "Migrated %lu events to Biome from stream %{public}@", buf, 0x16u);

        }
        v10 = v20 & -[_DKKnowledgeStorage verifyBiomeMigration:expectedEventCount:](v33, v7, v27);
        v8 = v47;
        v6 = v48;
        if (*(_BYTE *)(v33 + 8))
          v10 = v10 & -[_DKKnowledgeStorage deleteKnowledgeStream:context:expectedEventCount:](v33, v49, v53, v27);

      }
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_DKKnowledgeStorage migrateStream:context:].cold.1(v5, v8);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)migrateDataToBiomeWithManagedObjectContext:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[_DKKnowledgeStorage migrationStreamsWithMOC:]((uint64_t)self, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v9 &= -[_DKKnowledgeStorage migrateStream:context:]((uint64_t)self, *(void **)(*((_QWORD *)&v12 + 1) + 8 * i), v4);
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage migrateDataToBiomeWithManagedObjectContext:].cold.1();
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)coreDataStorage:(id)a3 shouldCallDelegateBeforeAutoMigrationFromManagedObjectModelHavingVersion:(unint64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[_DKKnowledgeStorage versionsRequiringManualSetup]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (BOOL)coreDataStorage:(id)a3 shouldCallDelegateAfterAutoMigrationToManagedObjectModelHavingVersion:(unint64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[_DKKnowledgeStorage versionsRequiringManualMigration]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (id)coreDataStorage:(id)a3 needsManagedObjectModelNameForVersion:(unint64_t)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = CFSTR("_DKDataModel");
  }
  else if (a4 == 2)
  {
    v6 = CFSTR("_DKDataModel 2");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("_DKDataModelVERSION-NUMBER"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("VERSION-NUMBER"), v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)coreDataStorage:(id)a3 willAutoMigrateStoreAtURL:(id)a4 fromManagedObjectModel:(id)a5 havingVersion:(unint64_t)a6 error:(id *)a7
{
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (-[_DKKnowledgeStorage finalMigrationVersion]((uint64_t)self) > a6)
  {
    v16 = 0;
    v11 = -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:]((uint64_t)self, a6, v10, &v16);
    v12 = v16;
    if (!a7)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[_DKKnowledgeStorage coreDataStorage:willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:].cold.1(a6);
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v17 = *MEMORY[0x1E0CB2D50];
  v18[0] = CFSTR("Unexpected model version number");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.DKKnowledgeStorage"), 1, v14);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (a7)
LABEL_7:
    *a7 = objc_retainAutorelease(v12);
LABEL_8:

  return v11;
}

- (BOOL)coreDataStorage:(id)a3 didAutoMigratePersistentStore:(id)a4 toManagedObjectModel:(id)a5 havingVersion:(unint64_t)a6 error:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (-[_DKKnowledgeStorage finalMigrationVersion]((uint64_t)self) >= a6)
  {
    v16 = 0;
    v14 = -[_DKKnowledgeStorage updateDataAfterAutoMigrationToVersion:inPersistentStore:error:](self, a6, v10, &v16);
    v13 = v16;
    if (!a7)
      goto LABEL_8;
LABEL_7:
    *a7 = objc_retainAutorelease(v13);
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[_DKKnowledgeStorage coreDataStorage:didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:].cold.1(a6);
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v17 = *MEMORY[0x1E0CB2D50];
  v18[0] = CFSTR("Unexpected model version number");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.DKKnowledgeStorage"), 1, v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (a7)
    goto LABEL_7;
LABEL_8:

  return v14;
}

- (void)saveHistogram:(id)a3 responseQueue:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_queue *executionQueue;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  executionQueue = self->_executionQueue;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke;
  v20[3] = &unk_1E26E52F0;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v13 = v20;
  v14 = executionQueue;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  v18 = (void *)os_transaction_create();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
  block[3] = &unk_1E26E3380;
  v25 = v18;
  v26 = v13;
  v19 = v18;
  dispatch_async(v14, block);

}

- (unint64_t)deleteHistogram:(id)a3
{
  _DKCoreDataStorage *storage;
  uint64_t v4;
  NSString *clientID;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v14;

  storage = self->_storage;
  v4 = *MEMORY[0x1E0CB2AC0];
  clientID = self->_clientID;
  v6 = a3;
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](storage, "managedObjectContextFor:identifier:", v4, clientID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKHistogram entityName](_DKHistogram, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "predicateWithFormat:", CFSTR("identifier == %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = 1;
  v12 = +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v7, v8, v11, 0, 0x7FFFFFFFFFFFFFFFLL, 1, v14);

  return v12;
}

- (id)_requestForChangeSinceDate:(uint64_t)a1
{
  id v2;
  void *v3;

  if (a1)
  {
    v2 = a2;
    -[objc_class performSelector:withObject:](NSClassFromString(CFSTR("NSPersistentHistoryChangeRequest")), "performSelector:withObject:", sel_fetchHistoryAfterDate_, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)fetchLocalChangesSinceDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _CDMemoryUsageInterval *v10;
  _CDMemoryUsageInterval *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  _CDMemoryUsageInterval *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__13;
  v37 = __Block_byref_object_dispose__13;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__13;
  v31 = __Block_byref_object_dispose__13;
  v32 = 0;
  if (fetchLocalChangesSinceDate_error__syncCounterInitialized != -1)
    dispatch_once(&fetchLocalChangesSinceDate_error__syncCounterInitialized, &__block_literal_global_485);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKKnowledgeStorage _requestForChangeSinceDate:]((uint64_t)self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKCoreDataStorage managedObjectContextFor:identifier:](self->_storage, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("fetchLocalChanges"), 0);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498;
    v20 = &unk_1E26E5318;
    v11 = v10;
    v21 = v11;
    v22 = v9;
    v23 = v8;
    v25 = &v27;
    v24 = v6;
    v26 = &v33;
    objc_msgSend(v22, "performWithOptions:andBlock:", 4, &v17);
    -[_CDMemoryUsageInterval end](v11, "end", v17, v18, v19, v20);
    if (a4)
      *a4 = objc_retainAutorelease((id)v28[5]);
    if (!v28[5])
    {
      v12 = fetchLocalChangesSinceDate_error__fetchLocalChangesTimerCounter;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v12, (uint64_t)v7, v13);

    }
    v14 = (id)v34[5];

  }
  else
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage fetchLocalChangesSinceDate:error:].cold.1();

    if (a4)
    {
      +[_DKSyncErrors failedToFetchChanges](_DKSyncErrors, "failedToFetchChanges");
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v14;
}

- (id)fetchSyncChangesSinceDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _CDMemoryUsageInterval *v12;
  _CDMemoryUsageInterval *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  _CDMemoryUsageInterval *v23;
  id v24;
  id v25;
  id v26;
  _DKKnowledgeStorage *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__13;
  v40 = __Block_byref_object_dispose__13;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__13;
  v34 = __Block_byref_object_dispose__13;
  v35 = 0;
  if (fetchSyncChangesSinceDate_error__syncCounterInitialized != -1)
    dispatch_once(&fetchSyncChangesSinceDate_error__syncCounterInitialized, &__block_literal_global_507);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKKnowledgeStorage _requestForChangeSinceDate:]((uint64_t)self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKKnowledgeStorage syncStorageIfAvailable](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], self->_clientID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("fetchSyncChanges"), 0);
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516;
      v22 = &unk_1E26E47D0;
      v13 = v12;
      v23 = v13;
      v24 = v11;
      v25 = v8;
      v28 = &v30;
      v26 = v6;
      v27 = self;
      v29 = &v36;
      objc_msgSend(v24, "performWithOptions:andBlock:", 4, &v19);
      -[_CDMemoryUsageInterval end](v13, "end", v19, v20, v21, v22);
      if (a4)
        *a4 = objc_retainAutorelease((id)v31[5]);
      if (!v31[5])
      {
        v14 = fetchSyncChangesSinceDate_error__fetchSyncChangesTimerCounter;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v14, (uint64_t)v7, v15);

      }
      v16 = (id)v37[5];

    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_DKKnowledgeStorage fetchLocalChangesSinceDate:error:].cold.1();

      if (a4)
      {
        +[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser");
        v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
    }

  }
  else if (a4)
  {
    +[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser");
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v16;
}

- (BOOL)saveChangeSetsForSync:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *executionQueue;
  id v8;
  BOOL v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  v19 = 0;
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke;
  block[3] = &unk_1E26E47A8;
  block[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  dispatch_sync(executionQueue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (unint64_t)lastSequenceNumberForChangeSetWithEntityName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *executionQueue;
  id v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__13;
  v32 = __Block_byref_object_dispose__13;
  v33 = 0;
  +[_DKChangeSet additionChangeSetEntityName](_DKChangeSet, "additionChangeSetEntityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    +[_DKChangeSetMO fetchAdditionChangeSetRequest]();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_DKChangeSet deletionChangeSetEntityName](_DKChangeSet, "deletionChangeSetEntityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (!v11)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_DKKnowledgeStorage lastSequenceNumberForChangeSetWithEntityName:error:].cold.1();

      goto LABEL_10;
    }
    +[_DKChangeSetMO fetchDeletionChangeSetRequest]();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;
  if (v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("sequenceNumber"), 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
    objc_msgSend(v12, "setSortDescriptors:", v14);
    v15 = (void *)MEMORY[0x1E0CB3880];
    -[_DKKnowledgeStorage deviceUUID](self, "deviceUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("deviceIdentifier == %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v17);

    objc_msgSend(v12, "setFetchLimit:", 1);
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke;
    block[3] = &unk_1E26E5388;
    block[4] = self;
    v19 = v12;
    v25 = v19;
    v26 = &v34;
    v27 = &v28;
    dispatch_sync(executionQueue, block);

    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, MEMORY[0x1E0C9AA70]);
  v21 = objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = (void *)v29[5];
  v29[5] = v21;
LABEL_11:

  if (a4)
    *a4 = objc_retainAutorelease((id)v29[5]);
  v22 = v35[3];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (void)startSyncDownFromCloudWithResponseQueue:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _CDMemoryUsageInterval *v8;
  NSObject *executionQueue;
  uint64_t v10;
  _CDMemoryUsageInterval *v11;
  id v12;
  id v13;
  NSObject *v14;
  OS_dispatch_queue *defaultResponseQueue;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  _QWORD block[4];
  _CDMemoryUsageInterval *v24;
  _DKKnowledgeStorage *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__13;
  v33 = __Block_byref_object_dispose__13;
  v34 = 0;
  v8 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("startSyncDown"), 0);
  executionQueue = self->_executionQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke;
  block[3] = &unk_1E26E5400;
  v11 = v8;
  v24 = v11;
  v25 = self;
  v12 = v7;
  v27 = v12;
  v13 = v6;
  v26 = v13;
  v28 = &v29;
  dispatch_sync(executionQueue, block);
  -[_CDMemoryUsageInterval end](v11, "end");
  if (v30[5])
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage startSyncDownFromCloudWithResponseQueue:withCompletion:].cold.1();

    if (v12)
    {
      defaultResponseQueue = (OS_dispatch_queue *)v13;
      if (!v13)
        defaultResponseQueue = self->_defaultResponseQueue;
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_533;
      v20[3] = &unk_1E26E5428;
      v21 = v12;
      v22 = &v29;
      v16 = v20;
      v17 = defaultResponseQueue;
      v18 = (void *)os_transaction_create();
      v35[0] = v10;
      v35[1] = 3221225472;
      v35[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
      v35[3] = &unk_1E26E3380;
      v36 = v18;
      v37 = v16;
      v19 = v18;
      dispatch_async(v17, v35);

    }
  }

  _Block_object_dispose(&v29, 8);
}

- (void)startSyncUpToCloudWithResponseQueue:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _CDMemoryUsageInterval *v8;
  NSObject *executionQueue;
  uint64_t v10;
  _CDMemoryUsageInterval *v11;
  id v12;
  id v13;
  NSObject *v14;
  OS_dispatch_queue *defaultResponseQueue;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  _QWORD block[4];
  _CDMemoryUsageInterval *v24;
  _DKKnowledgeStorage *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__13;
  v33 = __Block_byref_object_dispose__13;
  v34 = 0;
  v8 = -[_CDMemoryUsageInterval initWithName:client:]([_CDMemoryUsageInterval alloc], "initWithName:client:", CFSTR("startSyncUp"), 0);
  executionQueue = self->_executionQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke;
  block[3] = &unk_1E26E5400;
  v11 = v8;
  v24 = v11;
  v25 = self;
  v12 = v7;
  v27 = v12;
  v13 = v6;
  v26 = v13;
  v28 = &v29;
  dispatch_sync(executionQueue, block);
  -[_CDMemoryUsageInterval end](v11, "end");
  if (v30[5])
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage startSyncUpToCloudWithResponseQueue:withCompletion:].cold.1();

    if (v12)
    {
      defaultResponseQueue = (OS_dispatch_queue *)v13;
      if (!v13)
        defaultResponseQueue = self->_defaultResponseQueue;
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_539;
      v20[3] = &unk_1E26E5428;
      v21 = v12;
      v22 = &v29;
      v16 = v20;
      v17 = defaultResponseQueue;
      v18 = (void *)os_transaction_create();
      v35[0] = v10;
      v35[1] = 3221225472;
      v35[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
      v35[3] = &unk_1E26E3380;
      v36 = v18;
      v37 = v16;
      v19 = v18;
      dispatch_async(v17, v35);

    }
  }

  _Block_object_dispose(&v29, 8);
}

- (id)lastChangeSetWithEntityName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *executionQueue;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  _QWORD block[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__13;
  v38 = __Block_byref_object_dispose__13;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__13;
  v32 = __Block_byref_object_dispose__13;
  v33 = 0;
  +[_DKChangeSet additionChangeSetEntityName](_DKChangeSet, "additionChangeSetEntityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    +[_DKChangeSetMO fetchAdditionChangeSetRequest]();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_DKChangeSet deletionChangeSetEntityName](_DKChangeSet, "deletionChangeSetEntityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10);

    if (!v11)
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_DKKnowledgeStorage lastSequenceNumberForChangeSetWithEntityName:error:].cold.1();

      goto LABEL_10;
    }
    +[_DKChangeSetMO fetchDeletionChangeSetRequest]();
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;
  if (v9)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("sequenceNumber"), 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
    objc_msgSend(v12, "setSortDescriptors:", v14);
    v15 = (void *)MEMORY[0x1E0CB3880];
    -[_DKKnowledgeStorage deviceUUID](self, "deviceUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateWithFormat:", CFSTR("deviceIdentifier == %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v17);

    objc_msgSend(v12, "setFetchLimit:", 1);
    executionQueue = self->_executionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke;
    block[3] = &unk_1E26E5388;
    block[4] = self;
    v19 = v12;
    v25 = v19;
    v26 = &v34;
    v27 = &v28;
    dispatch_sync(executionQueue, block);

    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, MEMORY[0x1E0C9AA70]);
  v21 = objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = (void *)v29[5];
  v29[5] = v21;
LABEL_11:

  if (a4)
    *a4 = objc_retainAutorelease((id)v29[5]);
  v22 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (void)incrementInsertsAndDeletesObserverCount
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___DKKnowledgeStorage_incrementInsertsAndDeletesObserverCount__block_invoke;
  block[3] = &unk_1E26E2F20;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)decrementInsertsAndDeletesObserverCount
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___DKKnowledgeStorage_decrementInsertsAndDeletesObserverCount__block_invoke;
  block[3] = &unk_1E26E2F20;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (NSUUID)deviceUUID
{
  _DKKnowledgeStorage *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = objc_sync_enter(v2);
  if (!v2->_deviceUUID)
  {
    v4 = (void *)MEMORY[0x193FEE914](v3);
    -[_DKKnowledgeStorage configureDeviceUUID](v2);
    objc_autoreleasePoolPop(v4);
  }
  objc_sync_exit(v2);

  return v2->_deviceUUID;
}

- (void)configureDeviceUUID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Unable to fetch device id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (id)sourceDeviceIdentityFromDeviceID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

  if (v3)
  {
    v13[0] = 0;
    v13[1] = 0;
    objc_msgSend(v3, "getUUIDBytes:", v13);
    BYTE4(v12) = 0;
    LODWORD(v12) = 0;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v13, 16, v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceBytesInRange:withBytes:", 11, 5, &v12);
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v6 = objc_retainAutorelease(v4);
    v7 = (void *)objc_msgSend(v5, "initWithUUIDBytes:", objc_msgSend(v6, "bytes"));
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 10, 10);
    v10 = (void *)objc_msgSend(v9, "copy");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sourceDeviceIdentityFromObject:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sourceDeviceIdentity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_DKKnowledgeStorage deviceUUID](self, "deviceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKKnowledgeStorage sourceDeviceIdentityFromDeviceID:]((uint64_t)_DKKnowledgeStorage, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)syncStorageAssertion
{
  return objc_alloc_init(_DKKnowledgeSyncStorageAssertion);
}

- (void)setTombstonePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)enableBiomeMigrationDeletion
{
  return self->_enableBiomeMigrationDeletion;
}

- (void)setEnableBiomeMigrationDeletion:(BOOL)a3
{
  self->_enableBiomeMigrationDeletion = a3;
}

- (BOOL)localOnly
{
  return self->_localOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_tombstonePolicy, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_knowledgeStorageEventNotificationDelegates, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_defaultResponseQueue, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_syncStorage, 0);
}

- (id)syncPeersWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _DKKnowledgeStorage *v14;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__15;
  v28 = __Block_byref_object_dispose__15;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = 0;
  +[_DKSyncPeerMO fetchRequest](_DKSyncPeerMO, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKKnowledgeStorage executionQueue]((uint64_t)self);
  v6 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke;
  v13 = &unk_1E26E5388;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v16 = &v24;
  v17 = &v18;
  dispatch_sync(v6, &v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (void *)objc_msgSend((id)v25[5], "copy", v10, v11, v12, v13, v14);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (BOOL)saveSyncPeer:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  -[_DKKnowledgeStorage executionQueue]((uint64_t)self);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke;
  block[3] = &unk_1E26E47A8;
  block[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  dispatch_sync(v7, block);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)removeSyncPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("uuid == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKKnowledgeStorage executionQueue]((uint64_t)self);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke;
  block[3] = &unk_1E26E35A8;
  block[4] = self;
  v12 = v7;
  v13 = v4;
  v9 = v4;
  v10 = v7;
  dispatch_sync(v8, block);

}

- (id)keyValueStoreForDomain:(id)a3
{
  id v4;
  id *v5;
  _DKKeyValueStore *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_DKKnowledgeStorageSimpleKeyValueStore initWithStorage:domain:]((id *)[_DKKnowledgeStorageSimpleKeyValueStore alloc], self, v4);

    v6 = -[_DKKeyValueStore initWithSimpleKeyValueStore:]([_DKKeyValueStore alloc], "initWithSimpleKeyValueStore:", v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)keyValueObjectForKey:(void *)a3 domain:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__22;
    v21 = __Block_byref_object_dispose__22;
    v22 = 0;
    +[_DKKeyValueMO fetchRequest](_DKKeyValueMO, "fetchRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %@ && key == %@"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v8);

    objc_msgSend(v7, "setFetchLimit:", 1);
    -[_DKKnowledgeStorage executionQueue]((uint64_t)a1);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke;
    block[3] = &unk_1E26E65F8;
    block[4] = a1;
    v13 = v7;
    v16 = &v17;
    v14 = v5;
    v15 = v6;
    v10 = v7;
    dispatch_sync(v9, block);

    a1 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  return a1;
}

- (void)setKeyValueObject:(void *)a3 forKey:(void *)a4 domain:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3908], "allowedTopLevelClasses");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            -[_DKKnowledgeStorage executionQueue](a1);
            v16 = objc_claimAutoreleasedReturnValue();
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke;
            v17[3] = &unk_1E26E4A58;
            v17[4] = a1;
            v18 = v9;
            v19 = v8;
            v20 = v7;
            dispatch_sync(v16, v17);

            goto LABEL_14;
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[_DKKnowledgeStorage setKeyValueObject:forKey:domain:].cold.1((uint64_t)v7, (uint64_t)v10, v15);

LABEL_14:
  }

}

- (void)removeKeyValueObjectForKey:(void *)a3 domain:
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("domain == %@ && key == %@"), v5, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKKnowledgeStorage executionQueue](a1);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke;
    block[3] = &unk_1E26E4A58;
    block[4] = a1;
    v11 = v6;
    v12 = v9;
    v13 = v5;
    v8 = v6;
    dispatch_sync(v7, block);

  }
}

- (void)updateToFinalMetadata:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    if (updateToFinalMetadata__onceToken != -1)
      dispatch_once(&updateToFinalMetadata__onceToken, &__block_literal_global_73);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (id)updateToFinalMetadata__metadataTranslation;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v3, "objectForKeyedSubscript:", v9, (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)updateToFinalMetadata__metadataTranslation, "objectForKeyedSubscript:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v12);

            objc_msgSend(v3, "removeObjectForKey:", v9);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    objc_msgSend(v3, "removeObjectsForKeys:", updateToFinalMetadata__metadataRemoval);
  }

}

- (uint64_t)finalMigrationVersion
{
  if (a1)
    return 35;
  else
    return 0;
}

- (id)versionsRequiringManualSetup
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 28);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "addObject:", v3);

      v2 = (v2 + 1);
    }
    while ((_DWORD)v2 != 28);
    v4 = (void *)objc_msgSend(v1, "copy");

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)versionsRequiringManualMigration
{
  if (a1)
    return &unk_1E272BF68;
  else
    return 0;
}

- (BOOL)updateDataBeforeAutoMigrationFromVersion:(void *)a3 inStoreAtURL:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  BOOL v49;
  uint8_t buf[4];
  void *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    -[_DKKnowledgeStorage versionsRequiringManualSetup](a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.6();
      v48 = 0;
      v11 = objc_msgSend(MEMORY[0x1E0C97C00], "removePersistentHistoryFromPersistentStoreAtURL:options:error:", v7, 0, &v48);
      v12 = v48;
      if (v12 || (v11 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.5();

      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.4();
      }
      v14 = objc_alloc(MEMORY[0x1E0C97C00]);
      v47 = 0;
      objc_msgSend(MEMORY[0x1E0C97BF8], "cachedModelForPersistentStoreWithURL:options:error:", v7, 0, &v47);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v47;
      v17 = (void *)objc_msgSend(v14, "initWithManagedObjectModel:", v15);

      if (!v17 || v16)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.1();
      }
      else
      {
        v18 = *MEMORY[0x1E0C979E8];
        v46 = 0;
        v19 = (id)objc_msgSend(v17, "addPersistentStoreWithType:configuration:URL:options:error:", v18, 0, v7, 0, &v46);
        v20 = v46;
        if (!v20)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
          objc_msgSend(v23, "setPersistentStoreCoordinator:", v17);
          objc_msgSend(v23, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
          objc_msgSend(v23, "setUndoManager:", 0);
          objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Object"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_alloc_init(MEMORY[0x1E0C97B30]);
          objc_msgSend(v25, "setName:", CFSTR("SELF"));
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setExpression:", v26);

          objc_msgSend(v25, "setExpressionResultType:", 2000);
          v52[0] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPropertiesToFetch:", v27);

          objc_msgSend(v24, "setPropertiesToGroupBy:", &unk_1E272BF80);
          objc_msgSend(v24, "setResultType:", 2);
          objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Object"));
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0C97B58];
          v43 = v24;
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v23);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "expressionForFetch:context:countOnly:", v30, v31, 0);
          v32 = objc_claimAutoreleasedReturnValue();

          v33 = (void *)v28;
          v34 = (void *)v32;

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT SELF IN %@"), v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setPredicate:", v35);

          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v33);
          objc_msgSend(v36, "setResultType:", 2);
          v45 = 0;
          objc_msgSend(v23, "executeRequest:error:", v36, &v45);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v45;
          if (v16)
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.2();

          }
          +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v44, "result");
            v42 = v25;
            v39 = v34;
            v40 = v33;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v41;
            _os_log_impl(&dword_18DDBE000, v38, OS_LOG_TYPE_DEFAULT, "Deleted %@ objects with duplicate UUIDs.", buf, 0xCu);

            v33 = v40;
            v34 = v39;
            v25 = v42;
          }

          if (a4)
            *a4 = objc_retainAutorelease(v16);
          v49 = v16 == 0;

          goto LABEL_25;
        }
        v16 = v20;
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.1();
      }

      if (a4)
        *a4 = objc_retainAutorelease(v16);
      v49 = 0;
LABEL_25:

      v13 = v49;
      goto LABEL_26;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:].cold.7(a2);
  }
  v13 = 0;
LABEL_26:

  return v13;
}

- (uint64_t)updateDataAfterAutoMigrationToVersion:(void *)a3 inPersistentStore:(_QWORD *)a4 error:
{
  void *v6;
  char v7;
  _DKObjectFromMOCache *v8;
  _DKObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _DKObject *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v27;
  _DKObjectFromMOCache *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  _QWORD v35[4];
  _DKObject *v36;
  _DKObjectFromMOCache *v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (!a1)
  {
LABEL_10:
    v25 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1E272BF68, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_DKKnowledgeStorage updateDataAfterAutoMigrationToVersion:inPersistentStore:error:].cold.1(a2);
    goto LABEL_10;
  }
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v8 = objc_alloc_init(_DKObjectFromMOCache);
  v9 = objc_alloc_init(_DKObject);
  objc_msgSend(v34, "persistentStoreCoordinator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(v10, "setPersistentStoreCoordinator:", v32);
  objc_msgSend(v10, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  objc_msgSend(v10, "setUndoManager:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("metadata != NULL"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("value != NULL AND valueTypeCode == NULL"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY objectAttributeValue != NULL"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v46[0] = v31;
  v46[1] = v30;
  v29 = (void *)v11;
  v46[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke;
  v35[3] = &unk_1E26E6928;
  v39 = &v40;
  v15 = v9;
  v36 = v15;
  v28 = v8;
  v37 = v28;
  v38 = a1;
  v16 = (void *)MEMORY[0x193FEEAF4](v35);
  LOBYTE(v27) = 1;
  v17 = +[_DKCoreDataStorage updateObjectsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:updateBlock:](_DKCoreDataStorage, "updateObjectsInContext:entityName:predicate:sortDescriptors:batchFetchLimit:totalFetchLimit:includeSubentities:updateBlock:", v10, CFSTR("Object"), v14, 0, 1024, 0, v27, v16);
  v18 = v17;
  if (a4)
  {
    v19 = v41[3];
    if (v17 != v19)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Only able to convert %lu/%lu objects during v%lu migration."), v17, v19, a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.DKKnowledgeStorage"), 1, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = objc_retainAutorelease(v23);
      *a4 = v24;

    }
  }
  if (a2 == 34)
    v25 = objc_msgSend(a1, "migrateDataToBiomeWithManagedObjectContext:", v10);
  else
    v25 = v18 == v41[3];

  _Block_object_dispose(&v40, 8);
LABEL_13:

  return v25;
}

- (BOOL)copyValueToManagedObject:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "valueForKey:", CFSTR("value"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "setValueClass:", 1);
          v6 = v5;
          objc_msgSend(v6, "string");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setValueString:", v7);

          v8 = objc_msgSend(v6, "identifierType");
          v9 = v4;
          v10 = v8;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "setValueClass:", 2);
            v11 = objc_msgSend(v5, "categoryType");
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v4, "setValueClass:", 0);
              goto LABEL_12;
            }
            objc_msgSend(v4, "setValueClass:", 3);
            v11 = objc_msgSend(v5, "quantityType");
          }
          v10 = v11;
          v9 = v4;
        }
        objc_msgSend(v9, "setValueTypeCode:", v10);
      }
LABEL_12:

    }
  }

  return a1 != 0;
}

- (void)syncStorageIfAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Unable to sync, local only store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_saveObjects:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, v0, v1, "%s: found foreign objects: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_deleteObjects:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v1, v2, "Duplicate objects detected during deletion: %lu deleted vs. %lu requested.", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteObjects:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, v0, v1, "%s: found foreign objects: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)_tombstoneObjects:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_ERROR, "Error saving %lu tombstones: %@", v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_tombstoneObjectsMatchingPredicate:batchSize:error:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v1, v2, "Error saving tombstones matching predicate: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)migrateEventBatchToBiomeStream:(NSObject *)a3 fetchRequest:managedObjectContex:converter:eventCount:offset:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a3, (uint64_t)a3, "Query error encountered while attempting to migrate stream %{public}@ to Biome", (uint8_t *)a2);

}

- (void)migrateStream:(void *)a1 context:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "Unexpected nil Biome stream encountered during migration of stream %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)migrateDataToBiomeWithManagedObjectContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Encountered nil managed object context while attempting to update to Biome storage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)coreDataStorage:(uint64_t)a1 willAutoMigrateStoreAtURL:fromManagedObjectModel:havingVersion:error:.cold.1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)0x1E0CB3000, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_16_2());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, MEMORY[0x1E0C81028], v3, "Unexpected model version number: %@ >= %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)coreDataStorage:(uint64_t)a1 didAutoMigratePersistentStore:toManagedObjectModel:havingVersion:error:.cold.1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)0x1E0CB3000, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_16_2());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, MEMORY[0x1E0C81028], v3, "Unexpected model version number: %@ is not %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fetchLocalChangesSinceDate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Missing context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)lastSequenceNumberForChangeSetWithEntityName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Illegal change set entity name: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)startSyncDownFromCloudWithResponseQueue:withCompletion:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v1, v2, "Failed to sync down from the cloud: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)startSyncUpToCloudWithResponseQueue:withCompletion:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v1, v2, "Failed to sync up to the cloud: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)setKeyValueObject:(uint64_t)a1 forKey:(uint64_t)a2 domain:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = objc_opt_class();
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_FAULT, "Attempt to set value of class %@ in key-value store is unsupported. Supported classes: %@", (uint8_t *)&v5, 0x16u);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Failed to create persistent store coordinator: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Failed to delete duplicate events: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Finished removing persistent history from store.", v0, 2u);
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Failed to remove persistent history from store: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

- (void)updateDataBeforeAutoMigrationFromVersion:inStoreAtURL:error:.cold.6()
{
  uint8_t v0[24];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18DDBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Attempting to remove persistent history from store: %@", v0, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)updateDataBeforeAutoMigrationFromVersion:(uint64_t)a1 inStoreAtURL:error:.cold.7(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Pre-migration update called at unexpected version: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)updateDataAfterAutoMigrationToVersion:(uint64_t)a1 inPersistentStore:error:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v2, "Migration called at unexpected version: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

@end
