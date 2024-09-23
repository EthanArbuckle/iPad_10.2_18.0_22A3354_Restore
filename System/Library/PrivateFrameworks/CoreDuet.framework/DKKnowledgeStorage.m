@implementation DKKnowledgeStorage

uint64_t __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didInsertLocalEventsWithStreamNameCounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didInsertEventsWithStreamNameCounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __43___DKKnowledgeStorage__executeQuery_error___block_invoke(uint64_t a1)
{
  _CDMemoryUsageInterval *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _CDMemoryUsageInterval *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __CFString *v14;
  __uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __uint64_t v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  _BOOL4 v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  _BYTE v41[24];
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = [_CDMemoryUsageInterval alloc];
  objc_msgSend(*(id *)(a1 + 32), "clientName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("unknown");
  v6 = -[_CDMemoryUsageInterval initWithName:client:](v2, "initWithName:client:", CFSTR("executeQuery"), v5);

  -[_CDMemoryUsageInterval begin](v6, "begin");
  v7 = _DKQueryLoggingEnabled();
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 32), "clientName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v39 = v10;
    v40 = 2112;
    *(_QWORD *)v41 = v11;
    _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "[Storage] Starting executeQuery for '%{public}@' with query %@.", buf, 0x16u);
  }
  else
  {
    if (!v9)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 32), "clientName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    v13 = objc_opt_respondsToSelector();
    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "explicitEventStreamsOrEventStreamsInPredicate");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("n/a");
    }
    *(_DWORD *)buf = 138543874;
    v39 = v10;
    v40 = 2114;
    *(_QWORD *)v41 = v12;
    *(_WORD *)&v41[8] = 2114;
    *(_QWORD *)&v41[10] = v14;
    _os_log_impl(&dword_18DDBE000, v8, OS_LOG_TYPE_DEFAULT, "[Storage] Starting executeQuery for '%{public}@' with query type %{public}@ over streams %{public}@.", buf, 0x20u);
    if ((v13 & 1) != 0)

  }
LABEL_14:

  v15 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  v16 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
  v37 = 0;
  objc_msgSend(v16, "executeUsingCoreDataStorage:error:", v17, &v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v37;
  v20 = v37;
  objc_msgSend(*(id *)(a1 + 40), "handleResults:error:", v18, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v19);
  v24 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  if (*(_QWORD *)(a1 + 72))
    **(_QWORD **)(a1 + 72) = objc_retainAutorelease(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  -[_CDMemoryUsageInterval end](v6, "end");
  v25 = (double)(v24 - v15) / 1000000000.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        objc_msgSend(*(id *)(a1 + 32), "clientName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
        v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138544130;
        v39 = v27;
        v40 = 1024;
        *(_DWORD *)v41 = v35;
        *(_WORD *)&v41[4] = 2112;
        *(_QWORD *)&v41[6] = v36;
        *(_WORD *)&v41[14] = 2048;
        *(double *)&v41[16] = v25;
        v32 = "[Storage] Completed executeQuery for '%{public}@' with success=%d. Error: %@. Elapsed: %.3fs.";
        v33 = v26;
        v34 = 38;
        goto LABEL_21;
      }
    }
  }
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v29 = v28 != 0;
    v30 = objc_msgSend(v28, "count");
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138544386;
    v39 = v27;
    v40 = 1024;
    *(_DWORD *)v41 = v29;
    *(_WORD *)&v41[4] = 2048;
    *(_QWORD *)&v41[6] = v30;
    *(_WORD *)&v41[14] = 2112;
    *(_QWORD *)&v41[16] = v31;
    v42 = 2048;
    v43 = v25;
    v32 = "[Storage] Completed executeQuery for '%{public}@' with success=%d, count=%lu. Error: %@. Elapsed: %.3fs.";
    v33 = v26;
    v34 = 48;
LABEL_21:
    _os_log_impl(&dword_18DDBE000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);

  }
LABEL_22:

}

void __42___DKKnowledgeStorage__saveObjects_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  __CFString *v41;
  __CFString *v42;
  uint64_t v43;
  int v44;
  _DKObjectMOConverter *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v45 = objc_alloc_init(_DKObjectMOConverter);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v48 = a1;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v2)
  {
    v41 = 0;
    v44 = 0;
    v47 = *(_QWORD *)v51;
    v43 = *MEMORY[0x1E0CB2D50];
    v40 = *MEMORY[0x1E0CB2AC0];
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v51 != v47)
          objc_enumerationMutation(obj);
        v4 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v4, "stream");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = _os_feature_enabled_impl();
        LODWORD(v5) = _os_feature_enabled_impl();
        v8 = +[_DKBiomeQuery canShimDuetStreamNamed:](_DKBiomeQuery, "canShimDuetStreamNamed:", v6);
        if ((v8 & v5 & 1) == 0)
        {
          -[_DKObjectMOConverter insertObject:inManagedObjectContext:](v45, "insertObject:inManagedObjectContext:", v4, *(_QWORD *)(v48 + 40));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(*(id *)(v48 + 40), "refreshObject:mergeChanges:", v9, 1);
          }
          else
          {
            +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v4;
              _os_log_fault_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_FAULT, "Unable to convert to MO for saving: %@", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to convert _DKObject to MO for saving: %@"), v4);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)MEMORY[0x1E0CB35C8];
            v56 = v43;
            v57 = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, v13);
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(*(_QWORD *)(v48 + 56) + 8);
            v16 = *(void **)(v15 + 40);
            *(_QWORD *)(v15 + 40) = v14;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v48 + 64) + 8) + 24) = 0;
            ++v44;
          }

        }
        if ((v8 & v7) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v4;
            objc_msgSend(v17, "creationDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18 == 0;

            if (v19)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setCreationDate:", v20);

            }
            objc_msgSend(v17, "localCreationDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

            if (v22)
            {
              objc_msgSend(v17, "creationDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setLocalCreationDate:", v23);

            }
            objc_msgSend(v17, "stream");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25 && objc_msgSend(v25, "length"))
            {
              +[_DKBiomeStreamCache sharedCache](_DKBiomeStreamCache, "sharedCache");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "source");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v28)
              {
                v29 = (void *)objc_msgSend(objc_alloc(getBMDKEventStreamClass()), "initWithDKStreamIdentifier:contentProtection:", v25, v40);
                objc_msgSend(v29, "source");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  objc_msgSend(v26, "setObject:forKey:", v29, v25);
                }
                else
                {
                  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v59 = v25;
                    _os_log_error_impl(&dword_18DDBE000, v30, OS_LOG_TYPE_ERROR, "nil BMDKEventStream for DK stream %@", buf, 0xCu);
                  }

                }
                if (AnalyticsIsEventUsed())
                {
                  v31 = v41;
                  if (!v41)
                  {
                    _CDCurrentOrXPCProcessName();
                    v32 = objc_claimAutoreleasedReturnValue();
                    v33 = (void *)v32;
                    v34 = CFSTR("unknown");
                    if (v32)
                      v34 = (__CFString *)v32;
                    v42 = v34;

                    v31 = v42;
                  }
                  v54[0] = CFSTR("client");
                  v54[1] = CFSTR("stream");
                  v41 = v31;
                  v55[0] = v31;
                  v55[1] = v25;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  AnalyticsSendEvent();

                }
              }
              v36 = (void *)objc_msgSend(objc_alloc(getBMDKEventClass()), "initWithDKEvent:", v17);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v28, "sendEvent:timestampNumber:notifyCompute:", v36, 0, 0);
              else
                objc_msgSend(v28, "sendEvent:", v36);

            }
          }
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v2);
  }
  else
  {
    v41 = 0;
  }

  if (objc_msgSend(*(id *)(v48 + 40), "hasChanges"))
  {
    v37 = *(void **)(v48 + 40);
    v38 = *(_QWORD *)(*(_QWORD *)(v48 + 56) + 8);
    v49 = *(id *)(v38 + 40);
    v39 = objc_msgSend(v37, "save:", &v49);
    objc_storeStrong((id *)(v38 + 40), v49);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v48 + 64) + 8) + 24) = v39;
  }
  _cdknowledge_signpost_save_end(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v48 + 56) + 8) + 40), "code"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v48 + 56) + 8) + 40), "code");
  kdebug_trace();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v48 + 64) + 8) + 24))
    -[_DKKnowledgeStorage _sendInsertEventsNotificationWithObjects:](*(_QWORD *)(v48 + 48), *(void **)(v48 + 32));

}

void __74___DKKnowledgeStorage__tombstoneObjectsMatchingPredicate_batchSize_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[_DKEventMO entity](_DKEventMO, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setFetchOffset:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v5, "setFetchLimit:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v5, "setSortDescriptors:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "tombstonePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertiesToFetchForTombstones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToFetch:", v7);

  objc_msgSend(v5, "setResultType:", 2);
  objc_msgSend(v5, "setAllocationType:", 1);
  v8 = *(void **)(a1 + 56);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v8, "executeFetchRequest:error:", v5, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10 && objc_msgSend(v10, "count"))
  {
    v11 = *(void **)(a1 + 64);
    objc_msgSend(v10, "valueForKey:", CFSTR("objectID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    objc_msgSend(*(id *)(a1 + 48), "tombstonePolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateForEventsRequiredToBeTombstoned");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "tombstonePolicy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v21 = *(id *)(v17 + 40);
      objc_msgSend(v16, "tombstonesForPartialEvents:resultingFromRequirementsWithIdentifiers:", v10, &v21);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v17 + 40), v21);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v10, "count");

}

uint64_t __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __62___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_error___block_invoke(_QWORD *a1)
{
  dispatch_queue_t *v2;
  void *v3;
  uint64_t v4;
  dispatch_queue_t *v5;
  id obj;

  v2 = (dispatch_queue_t *)a1[4];
  v3 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = -[_DKKnowledgeStorage _deleteAllEventsMatchingPredicate:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

void __42___DKKnowledgeStorage_executeQuery_error___block_invoke(_QWORD *a1)
{
  dispatch_queue_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    dispatch_queue_set_specific(*(dispatch_queue_t *)(a1[4] + 88), (const void *)(a1[4] + 88), (void *)(a1[4] + 88), 0);
  v2 = (dispatch_queue_t *)a1[4];
  v3 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  -[_DKKnowledgeStorage _executeQuery:error:](v2, v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    dispatch_queue_set_specific(*(dispatch_queue_t *)(a1[4] + 88), (const void *)(a1[4] + 88), 0, 0);
}

BOOL __40___DKKnowledgeStorage_removeBadObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[6];
  __int128 v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v2 = (void *)MEMORY[0x193FEE914]();
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E26E50C0;
    v4 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v4;
    v17 = *(id *)(a1 + 72);
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    (*(void (**)(uint64_t, _QWORD *))(v3 + 16))(v3, v13);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_4;
    v10[3] = &unk_1E26E50C0;
    v5 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v5;
    v6 = *(void **)(a1 + 72);
    v11 = *(_OWORD *)(a1 + 48);
    v12 = v6;
    v7 = (id)v11;
    v8 = v6;
    v9 = v5;
    __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_4(v10);

  }
  objc_autoreleasePoolPop(v2);
}

void __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  v4 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &v17);
  v5 = v17;
  v6 = (void *)a1[8];
  if (v6)
  {
    v7 = a1[6];
    if (!v7)
      v7 = *(NSObject **)(a1[4] + 32);
    v8 = (void *)a1[7];
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_3;
    v13[3] = &unk_1E26E5098;
    v15 = v6;
    v16 = v4;
    v14 = v5;
    v10 = v8;
    v11 = v13;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E26E3380;
    v19 = v10;
    v20 = v11;
    v12 = v10;
    dispatch_async(v7, block);

  }
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C97878]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C97840]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend((id)objc_opt_class(), "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("entity.name == %@ && shouldSync == %@"), v6, MEMORY[0x1E0C9AAB0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "filteredSetUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "count") && objc_msgSend(v9, "count"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_2(v9, v10);

      v11 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v11;
      objc_msgSend(v11, "objectsFromManagedObjects:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v16 = _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v16, (uint64_t)v12, v17);

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v19;
        v40 = 2112;
        v41 = v20;
        _os_log_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_INFO, "Converted %@ of %@ inserted synced event objects", buf, 0x16u);

      }
    }

  }
  if (objc_msgSend(v4, "count") && objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v21 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend((id)objc_opt_class(), "entityName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "predicateWithFormat:", CFSTR("entity.name == %@ && shouldSync == %@"), v22, MEMORY[0x1E0C9AAB0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "filteredSetUsingPredicate:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 48), "count") && objc_msgSend(v25, "count"))
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_1(v25, v26);

      v27 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectsFromManagedObjects:", v25);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

      v32 = _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v32, (uint64_t)v28, v33);

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v35;
        v40 = 2112;
        v41 = v36;
        _os_log_impl(&dword_18DDBE000, v34, OS_LOG_TYPE_INFO, "Converted %@ of %@ deleted synced event objects", buf, 0x16u);

      }
    }

  }
}

void __41___DKKnowledgeStorage_saveObjects_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __63___DKKnowledgeStorage__sendEventsNotificationName_withObjects___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didDeleteEventsWithStreamNameCounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71___DKKnowledgeStorage__sendTombstoneNotificationsWithStreamNameCounts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didTombstoneEventsWithStreamNameCounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  v4 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &v17);
  v5 = v17;
  v6 = (void *)a1[8];
  if (v6)
  {
    v7 = a1[6];
    if (!v7)
      v7 = *(NSObject **)(a1[4] + 32);
    v8 = (void *)a1[7];
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E26E5098;
    v15 = v6;
    v16 = v4;
    v14 = v5;
    v10 = v8;
    v11 = v13;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E26E3380;
    v19 = v10;
    v20 = v11;
    v12 = v10;
    dispatch_async(v7, block);

  }
}

uint64_t __64___DKKnowledgeStorage_saveObjects_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  v4 = -[_DKKnowledgeStorage _saveObjects:error:](v2, v3, &v17);
  v5 = v17;
  v6 = (void *)a1[8];
  if (v6)
  {
    v7 = a1[6];
    if (!v7)
      v7 = *(NSObject **)(a1[4] + 32);
    v8 = (void *)a1[7];
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_5;
    v13[3] = &unk_1E26E5098;
    v15 = v6;
    v16 = v4;
    v14 = v5;
    v10 = v8;
    v11 = v13;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E26E3380;
    v19 = v10;
    v20 = v11;
    v12 = v10;
    dispatch_async(v7, block);

  }
}

uint64_t __72___DKKnowledgeStorage_saveObjects_tracker_responseQueue_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  v4 = -[_DKKnowledgeStorage _deleteObjects:error:](v2, v3, &v17);
  v5 = v17;
  v6 = (void *)a1[8];
  if (v6)
  {
    v7 = a1[6];
    if (!v7)
      v7 = *(NSObject **)(a1[4] + 32);
    v8 = (void *)a1[7];
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E26E5098;
    v15 = v6;
    v16 = v4;
    v14 = v5;
    v10 = v8;
    v11 = v13;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E26E3380;
    v19 = v10;
    v20 = v11;
    v12 = v10;
    dispatch_async(v7, block);

  }
}

uint64_t __66___DKKnowledgeStorage_deleteObjects_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __43___DKKnowledgeStorage_deleteObjects_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  id obj;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = -[_DKKnowledgeStorage _deleteObjects:error:](v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __47___DKKnowledgeStorage__tombstoneObjects_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke(_QWORD *a1)
{
  dispatch_queue_t *v2;
  void *v3;
  dispatch_queue_t *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  dispatch_queue_t *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = (dispatch_queue_t *)a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  v4 = -[_DKKnowledgeStorage _deleteAllEventsMatchingPredicate:error:](v2, v3, &v17);
  v5 = v17;
  v6 = (void *)a1[8];
  if (v6)
  {
    v7 = a1[6];
    if (!v7)
      v7 = *(NSObject **)(a1[4] + 32);
    v8 = (void *)a1[7];
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E26E51C8;
    v15 = v6;
    v16 = v4;
    v14 = v5;
    v10 = v8;
    v11 = v13;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E26E3380;
    v19 = v10;
    v20 = v11;
    v12 = v10;
    dispatch_async(v7, block);

  }
}

uint64_t __85___DKKnowledgeStorage_deleteAllEventsMatchingPredicate_responseQueue_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke(_QWORD *a1)
{
  dispatch_queue_t *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;

  v2 = (dispatch_queue_t *)a1[4];
  v3 = (void *)a1[5];
  v17 = 0;
  -[_DKKnowledgeStorage _executeQuery:error:](v2, v3, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  v6 = (void *)a1[8];
  if (v6)
  {
    v7 = a1[6];
    if (!v7)
      v7 = *(NSObject **)(a1[4] + 32);
    v8 = (void *)a1[7];
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke_2;
    v13[3] = &unk_1E26E51F0;
    v16 = v6;
    v14 = v4;
    v15 = v5;
    v10 = v8;
    v11 = v13;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __cd_dispatch_async_capture_tx_block_invoke_6;
    block[3] = &unk_1E26E3380;
    v19 = v10;
    v20 = v11;
    v12 = v10;
    dispatch_async(v7, block);

  }
}

uint64_t __65___DKKnowledgeStorage_executeQuery_responseQueue_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  NSObject *obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  const __CFString *v42;
  _QWORD v43[2];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  v3 = (void *)MEMORY[0x1E0C97B20];
  +[_DKEvent entityName](_DKEvent, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityForName:inManagedObjectContext:", v4, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:", v5);

  objc_msgSend(v2, "setIncludesSubentities:", 0);
  objc_msgSend(v2, "setIncludesPendingChanges:", 0);
  objc_msgSend(v2, "setResultType:", 2);
  v6 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v6, "setName:", CFSTR("eventCount"));
  v7 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expressionForFunction:arguments:", CFSTR("count:"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpression:", v10);

  objc_msgSend(v6, "setExpressionResultType:", 200);
  v43[0] = CFSTR("streamName");
  v43[1] = v6;
  v35 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToFetch:", v11);

  v42 = CFSTR("streamName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToGroupBy:", v12);

  v13 = *(void **)(a1 + 32);
  v40 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v2, &v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v40;
  if (v15)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v14;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v19)
    {
      v20 = v19;
      v33 = v14;
      v21 = a1;
      v22 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v35, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26)
            v28 = (void *)v26;
          else
            v28 = &unk_1E272ACA8;
          v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(v21 + 40) + 8) + 40);
          objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("streamName"));
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v30)
            v32 = (const __CFString *)v30;
          else
            v32 = CFSTR("nil");
          objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v32);

        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v20);
      v14 = v33;
      v15 = 0;
    }
  }

}

void __47___DKKnowledgeStorage_migrationStreamsWithMOC___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "executeFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __47___DKKnowledgeStorage_migrationStreamsWithMOC___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("streamName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_DKBiomeQuery canShimDuetStreamNamed:](_DKBiomeQuery, "canShimDuetStreamNamed:", v2))
  {
    +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __115___DKKnowledgeStorage_migrateEventBatchToBiomeStream_fetchRequest_managedObjectContex_converter_eventCount_offset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  objc_msgSend(*(id *)(a1 + 48), "objectsFromManagedObjects:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

uint64_t __63___DKKnowledgeStorage_verifyBiomeMigration_expectedEventCount___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __50___DKKnowledgeStorage_biomeStreamContainsEntries___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_2;
  v6[3] = &unk_1E26E50C0;
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v11 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v5 = v2;
  objc_msgSend(v5, "performWithOptions:andBlock:", 4, v6);

}

void __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;

  objc_msgSend(*(id *)(a1 + 32), "insertInManagedObjectContext:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
    {
      v3 = *(void **)(a1 + 40);
      v24 = 0;
      v4 = objc_msgSend(v3, "save:", &v24);
      v5 = v24;
    }
    else
    {
      v5 = 0;
      v4 = 1;
    }
    v13 = *(void **)(a1 + 64);
    if (v13)
    {
      v14 = *(void **)(a1 + 48);
      if (!v14)
        v14 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
      v15 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_477;
      v20[3] = &unk_1E26E5098;
      v22 = v13;
      v23 = v4;
      v5 = v5;
      v21 = v5;
      v16 = v20;
      v17 = v14;
      v18 = (void *)os_transaction_create();
      block = v15;
      v28 = 3221225472;
      v29 = __cd_dispatch_async_capture_tx_block_invoke_6;
      v30 = &unk_1E26E3380;
      v31 = v18;
      v32 = v16;
      v19 = v18;
      dispatch_async(v17, &block);

    }
  }
  else
  {
    v6 = *(void **)(a1 + 64);
    if (!v6)
      return;
    v7 = *(void **)(a1 + 48);
    if (!v7)
      v7 = *(void **)(*(_QWORD *)(a1 + 56) + 32);
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_3;
    v25[3] = &unk_1E26E3358;
    v26 = v6;
    v9 = v25;
    v10 = v7;
    v11 = (void *)os_transaction_create();
    block = v8;
    v28 = 3221225472;
    v29 = __cd_dispatch_async_capture_tx_block_invoke_6;
    v30 = &unk_1E26E3380;
    v31 = v11;
    v32 = v9;
    v12 = v11;
    dispatch_async(v10, &block);

    v5 = v26;
  }

}

uint64_t __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_477(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchLocalChanges"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fetchLocalChangesSinceDate_error__fetchLocalChangesTimerCounter;
  fetchLocalChangesSinceDate_error__fetchLocalChangesTimerCounter = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchLocalChangesExecuteRequest"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)fetchLocalChangesSinceDate_error__executeRequestTimerCounter;
  fetchLocalChangesSinceDate_error__executeRequestTimerCounter = v2;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchLocalChangesExistingObjectWithID"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)fetchLocalChangesSinceDate_error__executeFetchRequestTimerCounter;
  fetchLocalChangesSinceDate_error__executeFetchRequestTimerCounter = v4;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchLocalChangesObjectsFromManagedObjects"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)fetchLocalChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
  fetchLocalChangesSinceDate_error__objectsFromManagedObjectsTimerCounter = v6;

}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  unint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  _DKObjectMOConverter *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id obj;
  uint64_t v92;
  uint64_t v93;
  void *context;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  void *v114;
  __int16 v115;
  void *v116;
  __int16 v117;
  void *v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v110 = 0;
  objc_msgSend(v3, "executeRequest:error:", v4, &v110);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v110;
  if (v6)
  {
    v7 = v6;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_6();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v7;
    v11 = v7;

    goto LABEL_74;
  }
  if (v5)
  {
    v12 = fetchLocalChangesSinceDate_error__executeRequestTimerCounter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v12, (uint64_t)v2, (void *)v13);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performSelector:", sel_result);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v14, "conformsToProtocol:", &unk_1EE109BC0);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v89 = v14;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v112 = v17;
        _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_INFO, "Processing %@ persistent history change transactions", buf, 0xCu);

      }
      if ((unint64_t)objc_msgSend(v14, "count") <= 5)
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_4();

      }
      v86 = a1;
      v87 = v2;
      v88 = v5;
      v97 = (void *)objc_opt_new();
      v96 = (void *)objc_opt_new();
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v14;
      v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
      if (v93)
      {
        v92 = *(_QWORD *)v107;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v107 != v92)
              objc_enumerationMutation(obj);
            v95 = v19;
            v20 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v19);
            context = (void *)MEMORY[0x193FEE914]();
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v105 = 0u;
            objc_msgSend(v20, "changes");
            v98 = (id)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v102, v119, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v103;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v103 != v23)
                    objc_enumerationMutation(v98);
                  v25 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
                  v26 = (void *)MEMORY[0x193FEE914]();
                  objc_msgSend(v25, "changedObjectID");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "URIRepresentation");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "absoluteString");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!objc_msgSend(v25, "changeType"))
                  {
                    objc_msgSend(v25, "changedObjectID");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "entity");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "name");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    +[_DKEvent entityName](_DKEvent, "entityName");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v36) = objc_msgSend(v31, "isEqualToString:", v37);

                    if ((_DWORD)v36)
                    {
                      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v112 = v29;
                        v113 = 2112;
                        v114 = v25;
                        _os_log_debug_impl(&dword_18DDBE000, v38, OS_LOG_TYPE_DEBUG, "May fetch insertion change %@: %@", buf, 0x16u);
                      }

                      objc_msgSend(v25, "changedObjectID");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v97, "addObject:", v33);
LABEL_39:

                    }
                    goto LABEL_41;
                  }
                  if (objc_msgSend(v25, "changeType") == 2)
                  {
                    objc_msgSend(v25, "tombstone");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v30)
                    {
                      v31 = v30;
                      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("shouldSync"));
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = v32;
                      if (v32)
                        v34 = objc_msgSend(v32, "BOOLValue");
                      else
                        v34 = 0;
                      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("uuid"));
                      v39 = objc_claimAutoreleasedReturnValue();
                      v40 = (void *)v39;
                      if (v34 && v39)
                      {
                        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                        v41 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412546;
                          v112 = v29;
                          v113 = 2112;
                          v114 = v25;
                          _os_log_debug_impl(&dword_18DDBE000, v41, OS_LOG_TYPE_DEBUG, "Fetched tombstone %@: %@", buf, 0x16u);
                        }

                        objc_msgSend(v96, "addObject:", v31);
                      }

                      goto LABEL_39;
                    }
                  }
LABEL_41:

                  objc_autoreleasePoolPop(v26);
                }
                v22 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v102, v119, 16);
              }
              while (v22);
            }

            objc_autoreleasePoolPop(context);
            v19 = v95 + 1;
          }
          while (v95 + 1 != v93);
          v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
        }
        while (v93);
      }

      v42 = v97;
      if (objc_msgSend(v97, "count") || objc_msgSend(v96, "count"))
      {
        v43 = v86;
        v2 = v87;
        v44 = *(void **)(v86 + 56);
        v5 = v88;
        if (v44)
        {
          v45 = v44;
          v46 = 0x1E0C99000;
        }
        else
        {
          v46 = 0x1E0C99000uLL;
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v45 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v97, "count"))
        {
          v52 = objc_alloc_init(MEMORY[0x1E0C97B48]);
          v53 = (void *)MEMORY[0x1E0C97B20];
          +[_DKEvent entityName](_DKEvent, "entityName");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "entityForName:inManagedObjectContext:", v54, *(_QWORD *)(v86 + 40));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setEntity:", v55);

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF IN %@ AND shouldSync == YES"), v97);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setPredicate:", v56);

          objc_msgSend(*(id *)(v46 + 3432), "date");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = *(void **)(v86 + 40);
          v101 = 0;
          objc_msgSend(v58, "executeFetchRequest:error:", v52, &v101);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v101;
          v11 = v60;
          if (!v59 || v60)
          {
            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_2();
            v66 = 0;
          }
          else
          {
            v99 = v45;
            v61 = fetchLocalChangesSinceDate_error__executeFetchRequestTimerCounter;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v61, (uint64_t)v57, v62);

            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_3(v59, v97);

            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v64 = objc_claimAutoreleasedReturnValue();
            v65 = objc_alloc_init(_DKObjectMOConverter);
            -[_DKObjectMOConverter objectsFromManagedObjects:](v65, "objectsFromManagedObjects:", v59);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v67 = fetchLocalChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v67, (uint64_t)v64, v68);

            +[_CDLogging syncChannel](_CDLogging, "syncChannel");
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v66, "count"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v59, "count"));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v112 = v70;
              v113 = 2112;
              v114 = v71;
              _os_log_impl(&dword_18DDBE000, v69, OS_LOG_TYPE_INFO, "Converted %@ of %@ insertion changes", buf, 0x16u);

            }
            v45 = v99;
          }

          v2 = v87;
          v5 = v88;
          v43 = v86;
        }
        else
        {
          v66 = 0;
          v11 = 0;
        }
        v72 = -[_DKLocalChanges initWithInsertedObjects:tombstones:startDate:endDate:]((id *)[_DKLocalChanges alloc], v66, v96, v45, v90);
        v73 = *(_QWORD *)(*(_QWORD *)(v43 + 72) + 8);
        v74 = *(void **)(v73 + 40);
        *(_QWORD *)(v73 + 40) = v72;

        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v76 = v43;
          v77 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v76 + 72) + 8) + 40), "insertedObjects");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v66;
          v80 = v45;
          v81 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v76 + 72) + 8) + 40), "tombstones");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "numberWithUnsignedInteger:", objc_msgSend(v82, "count"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v76 + 72) + 8) + 40), "startDate");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v76 + 72) + 8) + 40), "endDate");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v112 = v79;
          v113 = 2112;
          v114 = v83;
          v115 = 2112;
          v116 = v84;
          v117 = 2112;
          v118 = v85;
          _os_log_impl(&dword_18DDBE000, v75, OS_LOG_TYPE_INFO, "Created local changes object with %@ inserted objects, %@ tombstones for period %@ to %@", buf, 0x2Au);

          v45 = v80;
          v66 = v100;

          v5 = v88;
        }

        v42 = v97;
      }
      else
      {
        v11 = 0;
        v2 = v87;
        v5 = v88;
      }

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_5();

      +[_DKSyncErrors failedToFetchChanges](_DKSyncErrors, "failedToFetchChanges");
      v50 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v51 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v42 = *(void **)(v51 + 40);
      *(_QWORD *)(v51 + 40) = v50;
    }

    goto LABEL_74;
  }
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_1();

  +[_DKSyncErrors failedToFetchChanges](_DKSyncErrors, "failedToFetchChanges");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(id *)(v49 + 40);
  *(_QWORD *)(v49 + 40) = v48;
LABEL_74:

}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchSyncChanges"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fetchSyncChangesSinceDate_error__fetchSyncChangesTimerCounter;
  fetchSyncChangesSinceDate_error__fetchSyncChangesTimerCounter = v0;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchSyncChangesExecuteRequest"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)fetchSyncChangesSinceDate_error__executeRequestTimerCounter;
  fetchSyncChangesSinceDate_error__executeRequestTimerCounter = v2;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchSyncChangesExistingObjectWithID"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)fetchSyncChangesSinceDate_error__executeFetchRequestTimerCounter;
  fetchSyncChangesSinceDate_error__executeFetchRequestTimerCounter = v4;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("fetchSyncChangesObjectsFromManagedObjects"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)fetchSyncChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
  fetchSyncChangesSinceDate_error__objectsFromManagedObjectsTimerCounter = v6;

}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _DKChangeSet *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  _DKChangeSet *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  _DKChangeSet *v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  _BOOL4 v89;
  NSObject *v90;
  NSObject *v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  _DKChangeSet *v97;
  id *v98;
  uint64_t v99;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _DKChangeSet *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id obj;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  void *v128;
  NSObject *v129;
  void *v130;
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  id v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  id v151;
  uint8_t buf[4];
  void *v153;
  __int16 v154;
  _DKChangeSet *v155;
  __int16 v156;
  void *v157;
  __int16 v158;
  void *v159;
  char v160[16];
  char v161[24];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v118 = a1;
  v151 = 0;
  objc_msgSend(v3, "executeRequest:error:", v4, &v151);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v151;
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v13 = fetchSyncChangesSinceDate_error__executeRequestTimerCounter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v13, (uint64_t)v2, (void *)v14);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performSelector:", sel_result);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v117, "conformsToProtocol:", &unk_1EE109BC0);
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v14 & 1) == 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_5();

      +[_DKSyncErrors failedToFetchChanges](_DKSyncErrors, "failedToFetchChanges");
      v44 = objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v45 = *(_QWORD *)(*(_QWORD *)(v118 + 72) + 8);
      v39 = *(void **)(v45 + 40);
      *(_QWORD *)(v45 + 40) = v44;
      v12 = v116;
      goto LABEL_101;
    }
    v114 = v2;
    v115 = v5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v117, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v153 = v17;
      _os_log_impl(&dword_18DDBE000, v16, OS_LOG_TYPE_INFO, "Processing %@ sync change transactions", buf, 0xCu);

    }
    v130 = (void *)objc_opt_new();
    v128 = (void *)objc_opt_new();
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    obj = v117;
    v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v165, 16);
    if (v125)
    {
      v124 = *(_QWORD *)v148;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v148 != v124)
            objc_enumerationMutation(obj);
          v126 = v18;
          v19 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v18);
          v143 = 0u;
          v144 = 0u;
          v145 = 0u;
          v146 = 0u;
          objc_msgSend(v19, "changes");
          v131 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v143, v164, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v144;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v144 != v22)
                  objc_enumerationMutation(v131);
                v24 = *(_DKChangeSet **)(*((_QWORD *)&v143 + 1) + 8 * v23);
                v25 = (void *)MEMORY[0x193FEE914]();
                -[_DKChangeSet changedObjectID](v24, "changedObjectID");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "URIRepresentation");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "absoluteString");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (-[_DKChangeSet changeType](v24, "changeType"))
                {
                  -[_DKChangeSet changeType](v24, "changeType");
                  goto LABEL_33;
                }
                -[_DKChangeSet changedObjectID](v24, "changedObjectID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "entity");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "name");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                +[_DKChangeSet additionChangeSetEntityName](_DKChangeSet, "additionChangeSetEntityName");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v30) = objc_msgSend(v31, "isEqualToString:", v32);

                if ((_DWORD)v30)
                {
                  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v153 = v28;
                    v154 = 2112;
                    v155 = v24;
                    _os_log_debug_impl(&dword_18DDBE000, v33, OS_LOG_TYPE_DEBUG, "May fetch inserted addition change set %@: %@", buf, 0x16u);
                  }

                  -[_DKChangeSet changedObjectID](v24, "changedObjectID");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = v130;
LABEL_31:
                  objc_msgSend(v35, "addObject:", v34);

                  goto LABEL_32;
                }
                +[_DKChangeSet deletionChangeSetEntityName](_DKChangeSet, "deletionChangeSetEntityName");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v31, "isEqualToString:", v36);

                if (v37)
                {
                  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v153 = v28;
                    v154 = 2112;
                    v155 = v24;
                    _os_log_debug_impl(&dword_18DDBE000, v38, OS_LOG_TYPE_DEBUG, "May fetch inserted deletion change set %@: %@", buf, 0x16u);
                  }

                  -[_DKChangeSet changedObjectID](v24, "changedObjectID");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = v128;
                  goto LABEL_31;
                }
LABEL_32:

LABEL_33:
                objc_autoreleasePoolPop(v25);
                ++v23;
              }
              while (v21 != v23);
              v21 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v143, v164, 16);
            }
            while (v21);
          }

          ++v18;
        }
        while (v126 + 1 != v125);
        v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v147, v165, 16);
      }
      while (v125);
    }

    v39 = v130;
    v40 = v128;
    if (!objc_msgSend(v130, "count") && !objc_msgSend(v128, "count"))
    {
      v8 = 0;
      v2 = v114;
      v5 = v115;
      v12 = v116;
LABEL_100:

LABEL_101:
      goto LABEL_102;
    }
    v41 = v118;
    v42 = *(void **)(v118 + 56);
    if (v42)
    {
      v112 = v42;
      v43 = 0x1E0C99000;
    }
    else
    {
      v43 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v112 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(v43 + 3432), "date");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v130, "count"))
    {
      v46 = objc_alloc_init(MEMORY[0x1E0C97B48]);
      v47 = (void *)MEMORY[0x1E0C97B20];
      +[_DKChangeSet additionChangeSetEntityName](_DKChangeSet, "additionChangeSetEntityName");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "entityForName:inManagedObjectContext:", v48, *(_QWORD *)(v118 + 40));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setEntity:", v49);

      v50 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(*(id *)(v118 + 64), "deviceUUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "UUIDString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "predicateWithFormat:", CFSTR("SELF IN %@ AND deviceIdentifier != %@"), v130, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setPredicate:", v53);

      v41 = v118;
      v54 = *(void **)(v118 + 40);
      v142 = 0;
      objc_msgSend(v54, "executeFetchRequest:error:", v46, &v142);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v142;

      if (v8)
      {
        v56 = 0;
        v5 = v115;
        v12 = v116;
        goto LABEL_52;
      }
    }
    else
    {
      v55 = 0;
    }
    v111 = v55;
    if (objc_msgSend(v128, "count"))
    {
      v57 = objc_alloc_init(MEMORY[0x1E0C97B48]);
      v58 = (void *)MEMORY[0x1E0C97B20];
      +[_DKChangeSet deletionChangeSetEntityName](_DKChangeSet, "deletionChangeSetEntityName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "entityForName:inManagedObjectContext:", v59, *(_QWORD *)(v41 + 40));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setEntity:", v60);

      v61 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(*(id *)(v41 + 64), "deviceUUID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "UUIDString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "predicateWithFormat:", CFSTR("SELF IN %@ AND deviceIdentifier != %@"), v128, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setPredicate:", v64);

      v65 = *(void **)(v118 + 40);
      v141 = 0;
      objc_msgSend(v65, "executeFetchRequest:error:", v57, &v141);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v141;

      if (v8)
      {
        v5 = v115;
        v12 = v116;
        v55 = v111;
LABEL_52:
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v127 = objc_claimAutoreleasedReturnValue();
        v2 = v114;
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
          __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_2();
LABEL_99:

        goto LABEL_100;
      }
      v5 = v115;
      v55 = v111;
    }
    else
    {
      v56 = 0;
      v5 = v115;
    }
    v66 = fetchSyncChangesSinceDate_error__executeFetchRequestTimerCounter;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v66, (uint64_t)v113, v67);

    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v68 = objc_claimAutoreleasedReturnValue();
    v2 = v114;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "count") + objc_msgSend(v55, "count"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)MEMORY[0x1E0CB37E8];
      v71 = objc_msgSend(v130, "count");
      v72 = objc_msgSend(v128, "count") + v71;
      v5 = v115;
      objc_msgSend(v70, "numberWithUnsignedInteger:", v72);
      v73 = (_DKChangeSet *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v153 = v69;
      v154 = 2112;
      v155 = v73;
      _os_log_impl(&dword_18DDBE000, v68, OS_LOG_TYPE_INFO, "Fetched %@ of %@ insertion changes", buf, 0x16u);

      v55 = v111;
    }

    if (objc_msgSend(v55, "count") || objc_msgSend(v56, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v74 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v129 = objc_claimAutoreleasedReturnValue();
      v75 = (void *)objc_opt_new();
      if (objc_msgSend(v55, "count"))
        objc_msgSend(v75, "addObject:", v55);
      v127 = v74;
      if (objc_msgSend(v56, "count"))
        objc_msgSend(v75, "addObject:", v56);
      v139 = 0u;
      v140 = 0u;
      v137 = 0u;
      v138 = 0u;
      v119 = v75;
      v132 = v56;
      v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
      if (v121)
      {
        v120 = *(_QWORD *)v138;
        do
        {
          v76 = 0;
          do
          {
            if (*(_QWORD *)v138 != v120)
              objc_enumerationMutation(v119);
            v122 = v76;
            v77 = *(id *)(*((_QWORD *)&v137 + 1) + 8 * v76);
            v133 = 0u;
            v134 = 0u;
            v135 = 0u;
            v136 = 0u;
            v78 = v77;
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v133, v162, 16);
            if (v79)
            {
              v80 = v79;
              v81 = *(_QWORD *)v134;
              do
              {
                v82 = 0;
                do
                {
                  if (*(_QWORD *)v134 != v81)
                    objc_enumerationMutation(v78);
                  v83 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * v82);
                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  v85 = -[_DKChangeSet initWithManagedObject:]([_DKChangeSet alloc], "initWithManagedObject:", v83);
                  if (v85)
                  {
                    v86 = fetchSyncChangesSinceDate_error__objectsFromManagedObjectsTimerCounter;
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_DKEventStatsTimerCounter addTimingWithStartDate:endDate:](v86, (uint64_t)v84, v87);

                    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                    v88 = objc_claimAutoreleasedReturnValue();
                    v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG);
                    v56 = v132;
                    if (v77 == v132)
                    {
                      if (v89)
                      {
                        objc_msgSend(v83, "objectID");
                        v94 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v153 = v94;
                        v154 = 2112;
                        v155 = v85;
                        _os_log_debug_impl(&dword_18DDBE000, v88, OS_LOG_TYPE_DEBUG, "Fetched inserted deletion change set %@: %@", buf, 0x16u);

                      }
                      v90 = v127;
                    }
                    else
                    {
                      if (v89)
                      {
                        objc_msgSend(v83, "objectID");
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v153 = v93;
                        v154 = 2112;
                        v155 = v85;
                        _os_log_debug_impl(&dword_18DDBE000, v88, OS_LOG_TYPE_DEBUG, "Fetched inserted addition change set %@: %@", buf, 0x16u);

                      }
                      v90 = v129;
                    }
                    -[NSObject addObject:](v90, "addObject:", v85);
                  }
                  else
                  {
                    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
                    v91 = objc_claimAutoreleasedReturnValue();
                    v92 = os_log_type_enabled(v91, OS_LOG_TYPE_ERROR);
                    v56 = v132;
                    if (v77 == v132)
                    {
                      if (v92)
                        __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_2((uint64_t)v161, (uint64_t)v83);
                    }
                    else if (v92)
                    {
                      __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_3((uint64_t)v160, (uint64_t)v83);
                    }

                  }
                  ++v82;
                }
                while (v80 != v82);
                v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v133, v162, 16);
              }
              while (v80);
            }

            v76 = v122 + 1;
          }
          while (v122 + 1 != v121);
          v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v137, v163, 16);
        }
        while (v121);
      }

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v127, "count") + -[NSObject count](v129, "count"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "count") + objc_msgSend(v111, "count"));
        v97 = (_DKChangeSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v153 = v96;
        v154 = 2112;
        v155 = v97;
        _os_log_impl(&dword_18DDBE000, v95, OS_LOG_TYPE_INFO, "Converted %@ of %@ inserted change sets", buf, 0x16u);

      }
      v12 = v116;
      v98 = -[_DKSyncChanges initWithAdditionChangeSets:deletionChangeSets:startDate:endDate:]((id *)[_DKSyncChanges alloc], v129, v127, v112, v116);
      v99 = *(_QWORD *)(*(_QWORD *)(v118 + 80) + 8);
      v100 = *(void **)(v99 + 40);
      *(_QWORD *)(v99 + 40) = v98;

      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v101 = objc_claimAutoreleasedReturnValue();
      v2 = v114;
      v39 = v130;
      v40 = v128;
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        v102 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v118 + 80) + 8) + 40), "additionChangeSets");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "numberWithUnsignedInteger:", objc_msgSend(v103, "count"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v118 + 80) + 8) + 40), "deletionChangeSets");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "numberWithUnsignedInteger:", objc_msgSend(v106, "count"));
        v107 = (_DKChangeSet *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v118 + 80) + 8) + 40), "startDate");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v118 + 80) + 8) + 40), "endDate");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v153 = v104;
        v154 = 2112;
        v155 = v107;
        v156 = 2112;
        v157 = v108;
        v158 = 2112;
        v159 = v109;
        _os_log_impl(&dword_18DDBE000, v101, OS_LOG_TYPE_INFO, "Created sync changes object with %@ addition change sets, and %@ deletion change sets for period %@ to %@", buf, 0x2Au);

        v56 = v132;
        v12 = v116;
      }

      v8 = 0;
      v5 = v115;
      v55 = v111;
    }
    else
    {
      +[_CDLogging syncChannel](_CDLogging, "syncChannel");
      v110 = objc_claimAutoreleasedReturnValue();
      v12 = v116;
      v127 = v110;
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DDBE000, v110, OS_LOG_TYPE_INFO, "No inserted remote change sets to process", buf, 2u);
      }
      v8 = 0;
    }
    goto LABEL_99;
  }
  v8 = v6;
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_1();

  +[_DKSyncErrors failedToFetchChanges](_DKSyncErrors, "failedToFetchChanges");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(v118 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;
LABEL_102:

}

void __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  -[_DKKnowledgeStorage syncStorageIfAvailable](*(_QWORD **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2;
    v7[3] = &unk_1E26E5360;
    v8 = *(id *)(a1 + 40);
    v9 = v4;
    v5 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v6 = v4;
    objc_msgSend(v6, "performWithOptions:andBlock:", 4, v7);

  }
}

void __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v5), "insertInManagedObjectContext:", *(_QWORD *)(a1 + 40));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, MEMORY[0x1E0C9AA70]);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

          return;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v3)
        continue;
      break;
    }
  }

  if (objc_msgSend(*(id *)(a1 + 40), "hasChanges"))
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v8, "save:", &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
  }
}

void __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;

  -[_DKKnowledgeStorage syncStorageIfAvailable](*(_QWORD **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, MEMORY[0x1E0C9AA70]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2;
    v9[3] = &unk_1E26E5388;
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    v12 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v10, "performWithOptions:andBlock:", 4, v9);

  }
}

void __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v11 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sequenceNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v7, "integerValue");

LABEL_7:
    goto LABEL_8;
  }
  if (!v4)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2_cold_1();

    v9 = *(_QWORD *)(a1[7] + 8);
    v10 = v5;
    v6 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
    goto LABEL_7;
  }
LABEL_8:

}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  -[_DKKnowledgeStorage syncStorageIfAvailable](*(_QWORD **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_cold_1();

    +[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Starting sync down from the cloud", buf, 2u);
  }

  if (!+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_2;
    v22[3] = &unk_1E26E53D8;
    v26 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 40);
    v23 = v18;
    v24 = v19;
    v20 = v3;
    v21 = *(_QWORD *)(a1 + 64);
    v25 = v20;
    v27 = v21;
    objc_msgSend(v20, "performBlockAndWait:", v22);

    v9 = v26;
LABEL_17:

    goto LABEL_18;
  }
  v11 = *(void **)(a1 + 56);
  if (v11)
  {
    v12 = *(void **)(a1 + 48);
    if (!v12)
      v12 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_528;
    v28[3] = &unk_1E26E3358;
    v29 = v11;
    v14 = v28;
    v15 = v12;
    v16 = (void *)os_transaction_create();
    *(_QWORD *)buf = v13;
    v31 = 3221225472;
    v32 = __cd_dispatch_async_capture_tx_block_invoke_6;
    v33 = &unk_1E26E3380;
    v34 = v16;
    v35 = v14;
    v17 = v16;
    dispatch_async(v15, buf);

    v9 = v29;
    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_528(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id obj;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setQualityOfService:", 25);
  v3 = objc_alloc(MEMORY[0x1E0C97AF8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3;
  v11[3] = &unk_1E26E53B0;
  v14 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v12 = v4;
  v13 = v5;
  v6 = (void *)objc_msgSend(v3, "initWithOptions:completionBlock:", v2, v11);
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  v9 = (id)objc_msgSend(v7, "executeRequest:error:", v6, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v3 = a2;
  v4 = objc_msgSend(v3, "success");
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "Finished sync down from the cloud", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(v3, v6);
  }

  v7 = (void *)a1[6];
  if (v7)
  {
    v8 = (void *)a1[4];
    if (!v8)
      v8 = *(void **)(a1[5] + 32);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_531;
    v14[3] = &unk_1E26E3380;
    v16 = v7;
    v15 = v3;
    v10 = v14;
    v11 = v8;
    v12 = (void *)os_transaction_create();
    *(_QWORD *)buf = v9;
    v18 = 3221225472;
    v19 = __cd_dispatch_async_capture_tx_block_invoke_6;
    v20 = &unk_1E26E3380;
    v21 = v12;
    v22 = v10;
    v13 = v12;
    dispatch_async(v11, buf);

  }
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_531(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "success");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

uint64_t __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_533(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  id v35;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  -[_DKKnowledgeStorage syncStorageIfAvailable](*(_QWORD **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_cold_1();

    +[_DKSyncErrors unavailableForCurrentUser](_DKSyncErrors, "unavailableForCurrentUser");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_INFO, "Starting sync up to the cloud", buf, 2u);
  }

  if (!+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_2;
    v22[3] = &unk_1E26E53D8;
    v26 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 40);
    v23 = v18;
    v24 = v19;
    v20 = v3;
    v21 = *(_QWORD *)(a1 + 64);
    v25 = v20;
    v27 = v21;
    objc_msgSend(v20, "performBlockAndWait:", v22);

    v9 = v26;
LABEL_17:

    goto LABEL_18;
  }
  v11 = *(void **)(a1 + 56);
  if (v11)
  {
    v12 = *(void **)(a1 + 48);
    if (!v12)
      v12 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v13 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_536;
    v28[3] = &unk_1E26E3358;
    v29 = v11;
    v14 = v28;
    v15 = v12;
    v16 = (void *)os_transaction_create();
    *(_QWORD *)buf = v13;
    v31 = 3221225472;
    v32 = __cd_dispatch_async_capture_tx_block_invoke_6;
    v33 = &unk_1E26E3380;
    v34 = v16;
    v35 = v14;
    v17 = v16;
    dispatch_async(v15, buf);

    v9 = v29;
    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_536(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id obj;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setQualityOfService:", 25);
  v3 = objc_alloc(MEMORY[0x1E0C97AE8]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3;
  v11[3] = &unk_1E26E53B0;
  v14 = *(id *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v12 = v4;
  v13 = v5;
  v6 = (void *)objc_msgSend(v3, "initWithOptions:completionBlock:", v2, v11);
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  v9 = (id)objc_msgSend(v7, "executeRequest:error:", v6, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v3 = a2;
  v4 = objc_msgSend(v3, "success");
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v6, OS_LOG_TYPE_INFO, "Finished sync up to the cloud", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(v3, v6);
  }

  v7 = (void *)a1[6];
  if (v7)
  {
    v8 = (void *)a1[4];
    if (!v8)
      v8 = *(void **)(a1[5] + 32);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_538;
    v14[3] = &unk_1E26E3380;
    v16 = v7;
    v15 = v3;
    v10 = v14;
    v11 = v8;
    v12 = (void *)os_transaction_create();
    *(_QWORD *)buf = v9;
    v18 = 3221225472;
    v19 = __cd_dispatch_async_capture_tx_block_invoke_6;
    v20 = &unk_1E26E3380;
    v21 = v12;
    v22 = v10;
    v13 = v12;
    dispatch_async(v11, buf);

  }
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_538(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "success");
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);

}

uint64_t __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_539(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;

  -[_DKKnowledgeStorage syncStorageIfAvailable](*(_QWORD **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:identifier:", *MEMORY[0x1E0CB2AC0], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, MEMORY[0x1E0C9AA70]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke_2;
    v9[3] = &unk_1E26E5388;
    v10 = v3;
    v11 = *(id *)(a1 + 40);
    v12 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v10, "performWithOptions:andBlock:", 4, v9);

  }
}

void __57___DKKnowledgeStorage_lastChangeSetWithEntityName_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _DKChangeSet *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v13 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_DKChangeSet initWithManagedObject:]([_DKChangeSet alloc], "initWithManagedObject:", v6);
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

LABEL_7:
    goto LABEL_8;
  }
  if (!v4)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2_cold_1();

    v11 = *(_QWORD *)(a1[7] + 8);
    v12 = v5;
    v6 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
    goto LABEL_7;
  }
LABEL_8:

}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_DKEventStatsTimerCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsTimerCounter, CFSTR("portraitknowledge"), CFSTR("databaseChangedObjectsFromManagedObjects"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter;
  _databaseChangedWithNotification__objectsFromManagedObjectsTimerCounter = v0;

}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_549(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id obj;
  id obja;
  _QWORD v38[7];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[7];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[7];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t block;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  id v57;
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_sync_enter(obj);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v50;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v50 != v4)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(void **)(v8 + 32);
          v48[0] = v5;
          v48[1] = 3221225472;
          v48[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_552;
          v48[3] = &unk_1E26E5498;
          v48[4] = v7;
          v48[5] = v8;
          v48[6] = *(_QWORD *)(a1 + 72);
          v10 = v48;
          v11 = v9;
          v12 = (void *)os_transaction_create();
          block = v5;
          v54 = 3221225472;
          v55 = __cd_dispatch_async_capture_tx_block_invoke_6;
          v56 = &unk_1E26E3380;
          v57 = v12;
          v58 = v10;
          v13 = v12;
          dispatch_async(v11, &block);

        }
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    }
    while (v3);
  }

  objc_sync_exit(obj);
  if (objc_msgSend(*(id *)(a1 + 40), "count")
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = *(id *)(a1 + 40);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v45;
      v16 = MEMORY[0x1E0C809B0];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v45 != v15)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v17);
          v19 = *(_QWORD *)(a1 + 32);
          v20 = *(void **)(v19 + 32);
          v43[0] = v16;
          v43[1] = 3221225472;
          v43[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_3;
          v43[3] = &unk_1E26E47A8;
          v43[4] = v18;
          v43[5] = v19;
          v43[6] = *(_QWORD *)(a1 + 56);
          v21 = v43;
          v22 = v20;
          v23 = (void *)os_transaction_create();
          block = v16;
          v54 = 3221225472;
          v55 = __cd_dispatch_async_capture_tx_block_invoke_6;
          v56 = &unk_1E26E3380;
          v57 = v23;
          v58 = v21;
          v24 = v23;
          dispatch_async(v22, &block);

          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      }
      while (v14);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count", obj)
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obja = *(id *)(a1 + 48);
    v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v40;
      v27 = MEMORY[0x1E0C809B0];
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(obja);
          v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v28);
          v30 = *(_QWORD *)(a1 + 32);
          v31 = *(void **)(v30 + 32);
          v38[0] = v27;
          v38[1] = 3221225472;
          v38[2] = __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_4;
          v38[3] = &unk_1E26E47A8;
          v38[4] = v29;
          v38[5] = v30;
          v38[6] = *(_QWORD *)(a1 + 64);
          v32 = v38;
          v33 = v31;
          v34 = (void *)os_transaction_create();
          block = v27;
          v54 = 3221225472;
          v55 = __cd_dispatch_async_capture_tx_block_invoke_6;
          v56 = &unk_1E26E3380;
          v57 = v34;
          v58 = v32;
          v35 = v34;
          dispatch_async(v33, &block);

          ++v28;
        }
        while (v25 != v28);
        v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v39, v59, 16);
      }
      while (v25);
    }

  }
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_552(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didHaveInsertsAndDeletesWithCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didInsertSyncedEvents:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "knowledgeStorage:didDeleteSyncedEvents:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __62___DKKnowledgeStorage_incrementInsertsAndDeletesObserverCount__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 64);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__databaseChangedWithNotification_, *MEMORY[0x1E0C978A0], 0);

    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(v1 + 64);
  }
  *(_QWORD *)(v1 + 64) = v2 + 1;
}

void __62___DKKnowledgeStorage_decrementInsertsAndDeletesObserverCount__block_invoke(uint64_t a1)
{
  id v2;

  if (!--*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C978A0], 0);

  }
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2;
    v11[3] = &unk_1E26E5388;
    v12 = v3;
    v13 = *(id *)(a1 + 40);
    v14 = *(_OWORD *)(a1 + 48);
    -[NSObject performWithOptions:andBlock:](v12, "performWithOptions:andBlock:", 4, v11);

    v4 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, MEMORY[0x1E0C9AA70]);
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    v6 = a1 + 56;
    v8 = *(_QWORD *)(v7 + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v5;

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_cold_1(v6, v4, v10);
  }

}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v31 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v26 = v5;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v15 = (void *)objc_opt_new();
          objc_msgSend(v14, "cloudID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setZoneName:", v16);

          objc_msgSend(v14, "deviceID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setSourceDeviceID:", v17);

          objc_msgSend(v14, "rapportID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setIdsDeviceIdentifier:", v18);

          objc_msgSend(v14, "lastSeenDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setLastSeenDate:", v19);

          objc_msgSend(v14, "model");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setModel:", v20);

          objc_msgSend(v14, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setUuid:", v21);

          objc_msgSend(v14, "version");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setVersion:", v22);

          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
      v5 = v26;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v5)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2_cold_1();

    v24 = *(_QWORD *)(a1[7] + 8);
    v25 = v5;
    v9 = *(id *)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v25;
    goto LABEL_14;
  }
LABEL_15:

}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2;
    v10[3] = &unk_1E26E3AC0;
    v11 = v3;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 32);
    v12 = v4;
    v13 = v5;
    v14 = *(_QWORD *)(a1 + 48);
    -[NSObject performWithOptions:andBlock:](v11, "performWithOptions:andBlock:", 4, v10);

    v6 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 6, MEMORY[0x1E0C9AA70]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_cold_1(a1);
  }

}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("SyncPeer"), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCloudID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "sourceDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceID:", v4);

  objc_msgSend(*(id *)(a1 + 40), "lastSeenDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastSeenDate:", v5);

  objc_msgSend(*(id *)(a1 + 40), "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setModel:", v6);

  objc_msgSend(*(id *)(a1 + 40), "idsDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRapportID:", v7);

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUuid:", v8);

  objc_msgSend(*(id *)(a1 + 40), "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVersion:", v9);

  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v10 = *(void **)(a1 + 32);
    v16 = 0;
    objc_msgSend(v10, "save:", &v16);
    v11 = v16;
    if (v11)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2_cold_1((id *)(a1 + 40));

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v11;
      v15 = v11;

    }
  }

}

void __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LOBYTE(v5) = 1;
    +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v3, CFSTR("SyncPeer"), *(_QWORD *)(a1 + 40), 0, 0x7FFFFFFFFFFFFFFFLL, 1, v5);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke_cold_1(a1, v4);

  }
}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2;
    v7[3] = &unk_1E26E65F8;
    v8 = v3;
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 64);
    v9 = v4;
    v12 = v5;
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    -[NSObject performWithOptions:andBlock:](v8, "performWithOptions:andBlock:", 4, v7);

    v6 = v8;
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_cold_1();
  }

}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v10 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject value](v6, "value");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[8] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

LABEL_6:
    goto LABEL_7;
  }
  if (v5)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2_cold_1();
    goto LABEL_6;
  }
LABEL_7:

}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_2;
    v7[3] = &unk_1E26E6620;
    v8 = v3;
    v9 = a1[5];
    v10 = a1[6];
    v4 = a1[7];
    v5 = a1[4];
    v11 = v4;
    v12 = v5;
    -[NSObject performWithOptions:andBlock:](v8, "performWithOptions:andBlock:", 4, v7);

    v6 = v8;
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_cold_1();
  }

}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("KeyValue"), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDomain:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setValue:", *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v3 = *(void **)(a1 + 32);
    v8 = 0;
    objc_msgSend(v3, "save:", &v8);
    v4 = v8;
    if (v4)
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v6 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        v13 = 2112;
        v14 = v4;
        _os_log_error_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_ERROR, "Failed to save '%@' in domain '%@': %@", buf, 0x20u);
      }

    }
  }

}

void __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContextFor:", *MEMORY[0x1E0CB2AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LOBYTE(v5) = 1;
    +[_DKCoreDataStorage deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:](_DKCoreDataStorage, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:", v3, CFSTR("KeyValue"), *(_QWORD *)(a1 + 40), 0, 0x7FFFFFFFFFFFFFFFLL, 1, v5);
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke_cold_1();

  }
}

void __60___DKKnowledgeStorage_DataMigration__updateToFinalMetadata___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[8];
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("serializedInteraction");
  +[_DKIntentMetadataKey serializedInteraction](_DKIntentMetadataKey, "serializedInteraction");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v0;
  v15[1] = CFSTR("decayRate");
  +[_CDPortraitMetadataKey decayRate](_CDPortraitMetadataKey, "decayRate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v1;
  v15[2] = CFSTR("algorithm");
  +[_CDPortraitMetadataKey algorithm](_CDPortraitMetadataKey, "algorithm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v2;
  v15[3] = CFSTR("score");
  +[_CDPortraitMetadataKey score](_CDPortraitMetadataKey, "score");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v3;
  v15[4] = CFSTR("sentimentScore");
  +[_CDPortraitMetadataKey sentimentScore](_CDPortraitMetadataKey, "sentimentScore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v4;
  v15[5] = CFSTR("osBuild");
  +[_CDPortraitMetadataKey osBuild](_CDPortraitMetadataKey, "osBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v5;
  v15[6] = CFSTR("assetVersion");
  +[_CDPortraitMetadataKey assetVersion](_CDPortraitMetadataKey, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v6;
  v15[7] = CFSTR("compatibilityVersion");
  +[_CDPortraitMetadataKey compatibilityVersion](_CDPortraitMetadataKey, "compatibilityVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v7;
  v15[8] = CFSTR("name");
  +[_CDEntityMetadataKey name](_CDEntityMetadataKey, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v8;
  v15[9] = CFSTR("bestLanguage");
  +[_CDEntityMetadataKey bestLanguage](_CDEntityMetadataKey, "bestLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)updateToFinalMetadata__metadataTranslation;
  updateToFinalMetadata__metadataTranslation = v10;

  v14[0] = CFSTR("_DKGlanceLaunchMetadataKey-deviceIdentifier");
  v14[1] = CFSTR("_DKSunriseSunsetMetadataKey__previousSunset");
  v14[2] = CFSTR("_DKSunriseSunsetMetadataKey__previousSunrise");
  v14[3] = CFSTR("_DKSunriseSunsetMetadataKey__currentSunset");
  v14[4] = CFSTR("_DKSunriseSunsetMetadataKey__currentSunrise");
  v14[5] = CFSTR("_DKSunriseSunsetMetadataKey__nextSunset");
  v14[6] = CFSTR("_DKSunriseSunsetMetadataKey__nextSunrise");
  v14[7] = CFSTR("_DKSunriseSunsetMetadataKey__isDaylight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)updateToFinalMetadata__metadataRemoval;
  updateToFinalMetadata__metadataRemoval = v12;

}

uint64_t __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = -[_DKKnowledgeStorage copyValueToManagedObject:](a1[6], v4);
      v12 = 1;
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "customMetadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v8 = (void *)a1[4];
        objc_msgSend(v5, "valueForKey:", CFSTR("objectAttributeValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "metadataFromCustomMetadata:cache:", v9, a1[5]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("objectAttributeValue"));
        v11 = (void *)objc_msgSend(v10, "mutableCopy");
        -[_DKKnowledgeStorage updateToFinalMetadata:](a1[6], v11);
        v12 = objc_msgSend((id)objc_opt_class(), "copyMetadata:toManagedObject:", v11, v5);

      }
      else
      {
        v12 = 1;
      }

    }
    else
    {
      v12 = 1;
    }
    objc_msgSend(v4, "valueForKey:", CFSTR("metadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v25 = 1;
      goto LABEL_23;
    }
    v28 = v12;
    v32 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    v30 = objc_opt_class();
    v29 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v31, v30, v29, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v22, v15, &v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    if (v24)
    {
      if (objc_msgSend(v15, "length") != 135)
      {
        v12 = v28;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke_cold_1();
        v25 = 1;
        goto LABEL_22;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v23, "mutableCopy");
        -[_DKKnowledgeStorage updateToFinalMetadata:](a1[6], v26);
        v25 = objc_msgSend((id)objc_opt_class(), "copyMetadata:toManagedObject:", v26, v4);

LABEL_21:
        v12 = v28;
LABEL_22:
        objc_msgSend(v4, "setValue:forKey:", 0, CFSTR("metadata"));

LABEL_23:
        v14 = -[_DKKnowledgeStorage copyValueToManagedObject:](a1[6], v4);
        if (!v25)
        {
          v13 = 0;
          goto LABEL_26;
        }
LABEL_24:
        v13 = v14 & v12;
LABEL_26:

        goto LABEL_27;
      }
    }
    v25 = 1;
    goto LABEL_21;
  }
  v13 = 0;
LABEL_27:

  return v13;
}

void __42___DKKnowledgeStorage__saveObjects_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "saveObjects caught %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __46___DKKnowledgeStorage_eventCountPerStreamName__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Failed to get event count per stream: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __66___DKKnowledgeStorage_saveHistogram_responseQueue_withCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "saveHistogram caught %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "No changes to fetch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Ignoring insertion changes: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_3(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_9(&dword_18DDBE000, v5, v6, "Fetched %@ of %@ insertion changes", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_7();
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Transactions: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Missing transactions, unable to fetch local changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56___DKKnowledgeStorage_fetchLocalChangesSinceDate_error___block_invoke_498_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Failed to fetch changes: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Missing context: device is locked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_18_3(a1, a2), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_13_1(&dword_18DDBE000, v5, v6, "Unable to instatiate deletion change set %@");

  OUTLINED_FUNCTION_17_2();
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_3(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_18_3(a1, a2), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_13_1(&dword_18DDBE000, v5, v6, "Unable to instatiate addition change set %@");

  OUTLINED_FUNCTION_17_2();
}

void __55___DKKnowledgeStorage_fetchSyncChangesSinceDate_error___block_invoke_516_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Missing transactions, unable to fetch sync changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __51___DKKnowledgeStorage_saveChangeSetsForSync_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18DDBE000, v0, v1, "saveChangesForSync caught %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __74___DKKnowledgeStorage_lastSequenceNumberForChangeSetWithEntityName_error___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "error fetching the results: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Skipping sync down from the cloud, cloud currently unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78___DKKnowledgeStorage_startSyncDownFromCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "Failed to sync down from the cloud: %@", v5);

  OUTLINED_FUNCTION_1();
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18DDBE000, v0, v1, "Skipping sync up to the cloud, cloud currently unavailable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __74___DKKnowledgeStorage_startSyncUpToCloudWithResponseQueue_withCompletion___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "Failed to sync up to the cloud: %@", v5);

  OUTLINED_FUNCTION_1();
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v4, "Notified of %@ synced events deleted", v5);

  OUTLINED_FUNCTION_1();
}

void __56___DKKnowledgeStorage__databaseChangedWithNotification___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v4, "Notified of %@ synced event(s) inserted", v5);

  OUTLINED_FUNCTION_1();
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, a3, "Failed to fetch sync peers: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __55___DKKnowledgeStorage__DKSyncPeer__syncPeersWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, v0, v1, "Failed to fetch sync peers: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v2, v3, "Failed to save sync peer '%@': %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_18DDBE000, v2, v3, "Failed to save sync peer '%@': %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __55___DKKnowledgeStorage__DKSyncPeer__saveSyncPeer_error___block_invoke_2_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "saveSyncPeer caught %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __51___DKKnowledgeStorage__DKSyncPeer__removeSyncPeer___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "Failed to remove sync peer '%@' due to unavailable store", v5);

}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, v0, v1, "Failed to fetch '%@' in domain '%@' due to unavailable store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __69___DKKnowledgeStorage__DKKeyValueStore__keyValueObjectForKey_domain___block_invoke_2_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_11();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_18DDBE000, v2, OS_LOG_TYPE_ERROR, "Failed to fetch '%@' in domain '%@': %@", v3, 0x20u);
}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, v0, v1, "Failed to save '%@' in domain '%@' due to unavailable store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __73___DKKnowledgeStorage__DKKeyValueStore__setKeyValueObject_forKey_domain___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_FAULT, "setKeyValueObject caught %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __75___DKKnowledgeStorage__DKKeyValueStore__removeKeyValueObjectForKey_domain___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_9_2(&dword_18DDBE000, v0, v1, "Failed to remove '%@' in domain '%@' due to unavailable store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __100___DKKnowledgeStorage_DataMigration__updateDataAfterAutoMigrationToVersion_inPersistentStore_error___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, MEMORY[0x1E0C81028], v0, "Error unarchiving object %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_5();
}

@end
