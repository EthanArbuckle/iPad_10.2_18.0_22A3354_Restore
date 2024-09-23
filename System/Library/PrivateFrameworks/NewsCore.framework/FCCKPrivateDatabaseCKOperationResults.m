@implementation FCCKPrivateDatabaseCKOperationResults

- (FCCKPrivateDatabaseCKOperationResults)init
{
  FCCKPrivateDatabaseCKOperationResults *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  FCThreadSafeMutableArray *v5;
  FCThreadSafeMutableArray *threadSafeItems;
  FCThreadSafeMutableArray *v7;
  FCThreadSafeMutableArray *threadSafeErrorsAndItemIDs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FCCKPrivateDatabaseCKOperationResults;
  v2 = -[FCCKPrivateDatabaseCKOperationResults init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    v5 = objc_alloc_init(FCThreadSafeMutableArray);
    threadSafeItems = v2->_threadSafeItems;
    v2->_threadSafeItems = v5;

    v7 = objc_alloc_init(FCThreadSafeMutableArray);
    threadSafeErrorsAndItemIDs = v2->_threadSafeErrorsAndItemIDs;
    v2->_threadSafeErrorsAndItemIDs = v7;

  }
  return v2;
}

- (void)operationWillStart
{
  NSObject *v2;

  -[FCCKPrivateDatabaseCKOperationResults group](self, "group");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

}

- (void)operationDidFinishWithItemIDs:(id)a3 resultItems:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "itemIDs");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCCKPrivateDatabaseCKOperationResults operationDidFinishWithItemIDs:resultItems:error:]";
    v18 = 2080;
    v19 = "FCCKPrivateDatabaseOperation.m";
    v20 = 1024;
    v21 = 169;
    v22 = 2114;
    v23 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (objc_msgSend(v9, "count"))
  {
    -[FCCKPrivateDatabaseCKOperationResults threadSafeItems](self, "threadSafeItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v9);

  }
  -[FCCKPrivateDatabaseCKOperationResults threadSafeErrorsAndItemIDs](self, "threadSafeErrorsAndItemIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  -[FCCKPrivateDatabaseCKOperationResults group](self, "group");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v14);

}

- (void)notifyWhenFinishWithQoS:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  -[FCCKPrivateDatabaseCKOperationResults group](self, "group");
  v7 = objc_claimAutoreleasedReturnValue();
  FCDispatchQueueForQualityOfService(a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__FCCKPrivateDatabaseCKOperationResults_notifyWhenFinishWithQoS_completionHandler___block_invoke;
  v10[3] = &unk_1E463B2D0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_group_notify(v7, v8, v10);

}

void __83__FCCKPrivateDatabaseCKOperationResults_notifyWhenFinishWithQoS_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "combinedResultItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "combinedError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (NSArray)combinedResultItems
{
  void *v2;
  void *v3;

  -[FCCKPrivateDatabaseCKOperationResults threadSafeItems](self, "threadSafeItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readOnlyArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSError)combinedError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[FCCKPrivateDatabaseCKOperationResults threadSafeErrorsAndItemIDs](self, "threadSafeErrorsAndItemIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readOnlyArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    if ((objc_msgSend(v3, "fc_allObjectsPassTest:", &__block_literal_global_5) & 1) != 0)
    {
      v5 = 0;
      goto LABEL_8;
    }
    v6 = objc_msgSend(v3, "fc_allObjectsPassTest:", &__block_literal_global_45_0);
    v7 = objc_msgSend(v3, "fc_allObjectsPassTest:", &__block_literal_global_46_0);
    if (!v6 || !v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D80];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_4;
      v18 = &unk_1E463AA78;
      v19 = v3;
      objc_msgSend(v8, "fc_dictionary:", &v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0C947D8];
      v12 = *MEMORY[0x1E0CB2D50];
      v20[0] = *MEMORY[0x1E0C94940];
      v20[1] = v12;
      v21[0] = v9;
      v21[1] = CFSTR("Some private database CK operations failed.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v15, v16, v17, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 2, v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return (NSError *)v5;
}

BOOL __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "second");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

BOOL __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "second");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "second");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "code") != 2;

  return v3;
}

void __54__FCCKPrivateDatabaseCKOperationResults_combinedError__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v30;
    v24 = *MEMORY[0x1E0C94940];
    *(_QWORD *)&v6 = 136315906;
    v22 = v6;
    do
    {
      v9 = 0;
      v23 = v7;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
        objc_msgSend(v10, "first", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "second");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          if (objc_msgSend(v12, "code") == 2)
          {
            objc_msgSend(v13, "userInfo");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v24);
            v15 = (id)objc_claimAutoreleasedReturnValue();

            if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("all partial failures should have a dictionary from IDs to errors"));
              *(_DWORD *)buf = v22;
              v35 = "-[FCCKPrivateDatabaseCKOperationResults combinedError]_block_invoke_4";
              v36 = 2080;
              v37 = "FCCKPrivateDatabaseOperation.m";
              v38 = 1024;
              v39 = 240;
              v40 = 2114;
              v41 = v21;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            objc_msgSend(v3, "addEntriesFromDictionary:", v15);
          }
          else
          {
            v27 = 0u;
            v28 = 0u;
            v25 = 0u;
            v26 = 0u;
            v15 = v11;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v16)
            {
              v17 = v16;
              v18 = v8;
              v19 = *(_QWORD *)v26;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v26 != v19)
                    objc_enumerationMutation(v15);
                  objc_msgSend(v3, "setObject:forKey:", v13, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              }
              while (v17);
              v8 = v18;
              v7 = v23;
            }
          }

        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v7);
  }

}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (FCThreadSafeMutableArray)threadSafeItems
{
  return self->_threadSafeItems;
}

- (void)setThreadSafeItems:(id)a3
{
  objc_storeStrong((id *)&self->_threadSafeItems, a3);
}

- (FCThreadSafeMutableArray)threadSafeErrorsAndItemIDs
{
  return self->_threadSafeErrorsAndItemIDs;
}

- (void)setThreadSafeErrorsAndItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_threadSafeErrorsAndItemIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSafeErrorsAndItemIDs, 0);
  objc_storeStrong((id *)&self->_threadSafeItems, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
