@implementation CXTransactionManager

- (CXTransactionManager)initWithQueue:(id)a3
{
  id v5;
  CXTransactionManager *v6;
  CXTransactionManager *v7;
  uint64_t v8;
  NSMutableSet *outstandingTransactionGroups;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXTransactionManager;
  v6 = -[CXTransactionManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    outstandingTransactionGroups = v7->_outstandingTransactionGroups;
    v7->_outstandingTransactionGroups = (NSMutableSet *)v8;

  }
  return v7;
}

- (CXTransactionManager)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXTransactionManager outstandingTransactionGroups](self, "outstandingTransactionGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p outstandingTransactionGroups=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addOutstandingTransactionGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id obj;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  -[CXTransactionManager outstandingTransactionGroups](self, "outstandingTransactionGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v4;
  objc_msgSend(v4, "callSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "transactionForCallSource:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v10, "actions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v16, "setCommitDate:", v7);
              -[CXTransactionManager _setUpTimeoutForActionIfNecessary:callSource:](self, "_setUpTimeoutForActionIfNecessary:callSource:", v16, v9);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v13);
        }

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

}

- (void)updateWithCompletedAction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  CXTransactionManager *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "completedAction: %@", buf, 0xCu);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = self;
  -[CXTransactionManager outstandingTransactionGroups](self, "outstandingTransactionGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v26 = v8;
        objc_msgSend(v8, "allActions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
LABEL_10:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
            objc_msgSend(v14, "UUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if ((v17 & 1) != 0)
              break;
            if (v11 == ++v13)
            {
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v11)
                goto LABEL_10;
              goto LABEL_16;
            }
          }
          objc_msgSend(v4, "updateCopy:withZone:", v14, 0);
          v18 = v26;

          if (!v18)
            continue;

          if (objc_msgSend(v18, "isComplete"))
          {
            -[CXTransactionManager outstandingTransactionGroups](v22, "outstandingTransactionGroups");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeObject:", v18);

            -[CXTransactionManager delegate](v22, "delegate");
            v19 = objc_claimAutoreleasedReturnValue();
            -[NSObject transactionManager:transactionGroupCompleted:](v19, "transactionManager:transactionGroupCompleted:", v22, v18);
            goto LABEL_25;
          }
          goto LABEL_26;
        }
LABEL_16:

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v25)
        continue;
      break;
    }
  }

  CXDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    -[CXTransactionManager outstandingTransactionGroups](v22, "outstandingTransactionGroups");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v20;
    _os_log_impl(&dword_1A402D000, v19, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find transaction group with completed action. All transactions groups: %@", buf, 0xCu);

  }
  v18 = 0;
LABEL_25:

LABEL_26:
}

- (void)failOutstandingActionsForCallWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CXTransactionManager outstandingTransactionGroups](self, "outstandingTransactionGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  obj = v7;
  v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v8;
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v9, "allActions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = v15;
                objc_msgSend(v16, "callUUID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqual:", v4);

                if (v18)
                {
                  CXDefaultLog();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v33 = v16;
                    _os_log_impl(&dword_1A402D000, v19, OS_LOG_TYPE_DEFAULT, "Failing action by system request: %@", buf, 0xCu);
                  }

                  objc_msgSend(v16, "updateAsFailedWithReason:", 3);
                  -[CXTransactionManager updateWithCompletedAction:](self, "updateWithCompletedAction:", v16);
                }

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v12);
        }

        v8 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v22);
  }

}

- (void)failOutstandingActionsForChannelWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CXTransactionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_barrier(v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CXTransactionManager outstandingTransactionGroups](self, "outstandingTransactionGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  obj = v7;
  v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v8;
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v9, "allActions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = v15;
                objc_msgSend(v16, "channelUUID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqual:", v4);

                if (v18)
                {
                  CXDefaultLog();
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v33 = v16;
                    _os_log_impl(&dword_1A402D000, v19, OS_LOG_TYPE_DEFAULT, "Failing action by system request: %@", buf, 0xCu);
                  }

                  objc_msgSend(v16, "updateAsFailedWithReason:", 3);
                  -[CXTransactionManager updateWithCompletedAction:](self, "updateWithCompletedAction:", v16);
                }

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v12);
        }

        v8 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v22);
  }

}

- (void)_setUpTimeoutForActionIfNecessary:(id)a3 callSource:(id)a4
{
  id v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  dispatch_block_t v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "shouldTimeout"))
  {
    objc_msgSend((id)objc_opt_class(), "timeout");
    v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    -[CXTransactionManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__CXTransactionManager__setUpTimeoutForActionIfNecessary_callSource___block_invoke;
    block[3] = &unk_1E4B88AC0;
    block[4] = self;
    v13 = v6;
    v14 = v7;
    v11 = dispatch_block_create(DISPATCH_BLOCK_BARRIER, block);
    dispatch_after(v9, v10, v11);

  }
}

uint64_t __69__CXTransactionManager__setUpTimeoutForActionIfNecessary_callSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutReachedForAction:callSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_timeoutReachedForAction:(id)a3 callSource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isComplete") & 1) == 0)
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Timeout reached for incomplete action %@ and call source %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(v6, "updateAsFailedWithReason:", 2);
    -[CXTransactionManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transactionManager:actionTimedOut:forCallSource:", self, v6, v7);

    -[CXTransactionManager updateWithCompletedAction:](self, "updateWithCompletedAction:", v6);
  }

}

- (CXTransactionManagerDelegate)delegate
{
  return (CXTransactionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableSet)outstandingTransactionGroups
{
  return self->_outstandingTransactionGroups;
}

- (void)setOutstandingTransactionGroups:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingTransactionGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTransactionGroups, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
