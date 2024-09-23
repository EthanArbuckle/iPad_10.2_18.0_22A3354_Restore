@implementation SGHistoryObserver

- (SGHistoryObserver)initWithStore:(id)a3
{
  id v4;
  SGHistoryObserver *v5;
  SGHistoryObserver *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGHistoryObserver;
  v5 = -[SGHistoryObserver init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_store, v4);

  return v6;
}

- (void)processNewConfirmOrRejectEventHashes:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  SGJournalEntry *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "duplicateKeysMatchingAnyEventHash:", v4);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v20)
    {
      v7 = 0;
      v19 = *(_QWORD *)v29;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(obj);
          v22 = v8;
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v23 = v9;
          objc_msgSend(obj, "objectForKeyedSubscript:");
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
                objc_msgSend(v6, "loadEventByDuplicateKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  objc_msgSend(v6, "journal");
                  v16 = objc_claimAutoreleasedReturnValue();
                  v17 = -[SGJournalEntry initWithOperation:event:]([SGJournalEntry alloc], "initWithOperation:event:", 8, v15);
                  -[NSObject addEntry:](v16, "addEntry:", v17);

                  v7 = 1;
                }
                else
                {
                  sgLogHandle();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v23, "base64EncodedDataWithOptions:", 0);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v33 = v18;
                    _os_log_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEFAULT, "Database inconsistency; found key for event hash %@ but event is missing",
                      buf,
                      0xCu);

                  }
                }

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
            }
            while (v12);
          }

          v8 = v22 + 1;
        }
        while (v22 + 1 != v20);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v20);
      if ((v7 & 1) != 0)
        +[SGDSuggestManager clearRequestCache](SGDSuggestManager, "clearRequestCache");
    }

  }
}

- (void)processNewConfirmedOrRejectedReminderHashes:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  SGJournalEntry *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  SGJournalEntry *v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "duplicateKeysMatchingAnyReminderHash:", v4);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (!v19)
      goto LABEL_22;
    v18 = *(_QWORD *)v27;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v21 = v7;
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v7);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(obj, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v23;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v6, "loadReminderByKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                objc_msgSend(v6, "journal");
                v15 = objc_claimAutoreleasedReturnValue();
                v16 = -[SGJournalEntry initWithOperation:reminder:]([SGJournalEntry alloc], "initWithOperation:reminder:", 20, v14);
                -[NSObject addEntry:](v15, "addEntry:", v16);
LABEL_14:

                goto LABEL_16;
              }
              sgRemindersLogHandle();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v8, "base64EncodedDataWithOptions:", 0);
                v16 = (SGJournalEntry *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v31 = v16;
                _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGDSuggestManager - Database inconsistency: Found key for reminder hash %@ but reminder is missing", buf, 0xCu);
                goto LABEL_14;
              }
LABEL_16:

              ++v13;
            }
            while (v11 != v13);
            v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
            v11 = v17;
          }
          while (v17);
        }

        v7 = v21 + 1;
      }
      while (v21 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      if (!v19)
      {
LABEL_22:

        break;
      }
    }
  }

}

- (void)hashesDidChange
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "clearMasterEntityCache");
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
}

@end
