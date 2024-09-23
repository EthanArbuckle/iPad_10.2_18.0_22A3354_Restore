@implementation EKSyncStatusChangeListener

- (EKSyncStatusChangeListener)initWithEventStore:(id)a3
{
  id v5;
  EKSyncStatusChangeListener *v6;
  EKSyncStatusChangeListener *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncStatusChangeListener;
  v6 = -[EKSyncStatusChangeListener init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventStore, a3);
    -[EKSyncStatusChangeListener _setupSources](v7, "_setupSources");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__eventStoreChanged_, CFSTR("EKEventStoreChangedNotification"), v5);

  }
  return v7;
}

- (void)_setupSources
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *sourceLastSyncingEndDates;
  id v7;
  _QWORD v8[5];

  -[EKEventStore eventSources](self->_eventStore, "eventSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterUsingPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  sourceLastSyncingEndDates = self->_sourceLastSyncingEndDates;
  self->_sourceLastSyncingEndDates = v5;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__EKSyncStatusChangeListener__setupSources__block_invoke_2;
  v8[3] = &unk_1E4785E18;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

BOOL __43__EKSyncStatusChangeListener__setupSources__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "sourceType");
  return (v2 & 0xFFFFFFFFFFFFFFFBLL) != 0 && v2 != 5;
}

void __43__EKSyncStatusChangeListener__setupSources__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSyncEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v4, v5);
}

- (void)_eventStoreChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[EKEventStore eventSources](self->_eventStore, "eventSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_sourceLastSyncingEndDates, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastSyncEndDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && (!v12 || objc_msgSend(v13, "CalIsAfterDate:", v12)))
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceLastSyncingEndDates, "setObject:forKeyedSubscript:", v14, v11);
          objc_msgSend(v4, "addObject:", v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "accountsSyncFinished:", v4);

}

- (EKSyncStatusChangeListenerDelegate)delegate
{
  return (EKSyncStatusChangeListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceLastSyncingEndDates, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
