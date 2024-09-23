@implementation NRDeviceCollectionHistory

- (NRDeviceCollectionHistory)init
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NRDeviceCollectionHistoryEntry *v6;
  void *v7;
  NRDeviceCollectionHistoryEntry *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NRMutableDeviceCollection *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)NRDeviceCollectionHistory;
  v2 = -[NRDeviceCollectionHistory init](&v22, sel_init);
  if (v2)
  {
    v3 = (void *)MGGetStringAnswer();
    objc_msgSend(v3, "isEqualToString:", CFSTR("Watch"));
    *((_QWORD *)v2 + 2) = 10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v4;

    v6 = [NRDeviceCollectionHistoryEntry alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NRDeviceCollectionHistoryEntry initWithHistory:index:date:diff:switchIndex:](v6, "initWithHistory:index:date:diff:switchIndex:", v2, 0, v7, 0, 0);

    objc_msgSend(*((id *)v2 + 7), "addObject:", v8);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v13;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v15;

    v17 = objc_alloc_init(NRMutableDeviceCollection);
    v18 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v17;

    objc_msgSend(*((id *)v2 + 5), "setParentDelegate:", v2);
    atomic_store(0, (unsigned __int8 *)v2 + 24);
    *((_DWORD *)v2 + 7) = 0;
    *((_DWORD *)v2 + 8) = 0;
    v19 = objc_opt_new();
    v20 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v19;

    -[NRSwitchRecordCollection addSwitchRecordWithHistoryEntry:](*((_QWORD *)v2 + 8), v8);
  }
  return (NRDeviceCollectionHistory *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)dirty
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_atomicDirty);
  return v2 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  NRSwitchRecordCollection *switchRecords;
  id v5;
  void *v6;
  void *v7;

  if (self)
    switchRecords = self->_switchRecords;
  else
    switchRecords = 0;
  v5 = a3;
  -[NRSwitchRecordCollection truncateSwitchRecords](switchRecords, "truncateSwitchRecords");
  -[NRDeviceCollectionHistory protobuf](self, "protobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("data"));

  atomic_store(0, (unsigned __int8 *)&self->_atomicDirty);
}

- (void)_createIndex
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NRMutableDeviceCollection *v10;
  NRMutableDeviceCollection *deviceCollection;
  NRMutableDeviceCollection *v12;
  NRMutableDeviceCollection *v13;
  NRMutableDeviceCollection *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_history;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        -[NRDeviceCollectionHistoryEntry setHistoryManager:](*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7++), self);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  -[NSMutableArray lastObject](self->_history, "lastObject", (_QWORD)v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NRMutableDeviceCollection *)objc_msgSend(v9, "copyWithZone:", 0);
  deviceCollection = self->_deviceCollection;
  self->_deviceCollection = v10;

  v12 = self->_deviceCollection;
  if (!v12)
  {
    v13 = objc_alloc_init(NRMutableDeviceCollection);
    v14 = self->_deviceCollection;
    self->_deviceCollection = v13;

    v12 = self->_deviceCollection;
  }
  -[NRMutableStateBase setParentDelegate:](v12, "setParentDelegate:", self);

}

- (NRDeviceCollectionHistory)initWithCoder:(id)a3
{
  id v4;
  NRDeviceCollectionHistory *v5;
  uint64_t v6;
  void *v7;
  NRPBDeviceCollectionHistory *v8;
  NRDeviceCollectionHistory *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *history;
  uint64_t v15;
  NRSwitchRecordCollection *switchRecords;
  NRSwitchRecordCollection *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *p_super;
  NSObject *v21;
  NRSwitchRecordCollection *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  uint8_t buf[136];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRDeviceCollectionHistory init](self, "init");
  if (!v5)
    goto LABEL_25;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v5->_startIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("startIndex"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("history"));
    v13 = objc_claimAutoreleasedReturnValue();
    history = v5->_history;
    v5->_history = (NSMutableArray *)v13;

    -[NRDeviceCollectionHistory _sanitizeHistory](v5, "_sanitizeHistory");
    -[NRDeviceCollectionHistory _createIndex](v5, "_createIndex");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("switchRecordCollection"));
    v15 = objc_claimAutoreleasedReturnValue();
    switchRecords = v5->_switchRecords;
    v5->_switchRecords = (NRSwitchRecordCollection *)v15;

    v17 = v5->_switchRecords;
    nr_daemon_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      if (!v19)
      {
LABEL_24:
        -[NRDeviceCollectionHistory _truncateHistory](v5, "_truncateHistory", (_QWORD)v30);
LABEL_25:
        v9 = v5;
        goto LABEL_26;
      }
      nr_daemon_log();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0BDB000, p_super, OS_LOG_TYPE_DEFAULT, "Loaded switch history", buf, 2u);
      }
    }
    else
    {
      if (v19)
      {
        nr_daemon_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0BDB000, v21, OS_LOG_TYPE_DEFAULT, "Migrating switch history", buf, 2u);
        }

      }
      v22 = [NRSwitchRecordCollection alloc];
      v23 = v5->_history;
      if (v22)
      {
        v22 = -[NRSwitchRecordCollection init](v22, "init");
        if (v22)
        {
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v24 = v23;
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v31;
            do
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v31 != v27)
                  objc_enumerationMutation(v24);
                -[NRSwitchRecordCollection addSwitchRecordWithHistoryEntry:]((uint64_t)v22, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v28++));
              }
              while (v26 != v28);
              v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v30, buf, 16);
            }
            while (v26);
          }

        }
      }

      p_super = &v5->_switchRecords->super.super.super;
      v5->_switchRecords = v22;
    }

    goto LABEL_24;
  }
  v7 = (void *)v6;
  v8 = -[NRPBDeviceCollectionHistory initWithData:]([NRPBDeviceCollectionHistory alloc], "initWithData:", v6);
  v9 = -[NRDeviceCollectionHistory initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_26:
  return v9;
}

- (NRDeviceCollectionHistory)initWithProtobuf:(id)a3
{
  _QWORD *v4;
  NRDeviceCollectionHistory *v5;
  NRDeviceCollectionHistory *v6;
  unint64_t v7;
  uint64_t v8;
  NSMutableArray *history;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  NRDeviceCollectionHistoryEntry *v18;
  NRDeviceCollectionHistoryEntry *v19;
  uint64_t v20;
  NRSwitchRecordCollection *switchRecords;
  uint64_t v22;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRDeviceCollectionHistory init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4[1];
    else
      v7 = 0;
    v5->_startIndex = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    history = v6->_history;
    v6->_history = (NSMutableArray *)v8;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    if (v4)
      v10 = (void *)v4[2];
    else
      v10 = 0;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v15);
          v17 = v6->_history;
          v18 = [NRDeviceCollectionHistoryEntry alloc];
          v19 = -[NRDeviceCollectionHistoryEntry initWithProtobuf:](v18, "initWithProtobuf:", v16, (_QWORD)v26);
          -[NSMutableArray addObject:](v17, "addObject:", v19);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    -[NRDeviceCollectionHistory _createIndex](v6, "_createIndex");
    v20 = objc_opt_new();
    switchRecords = v6->_switchRecords;
    v6->_switchRecords = (NRSwitchRecordCollection *)v20;

    v22 = (uint64_t)v6->_switchRecords;
    if (v4)
      v23 = (void *)v4[3];
    else
      v23 = 0;
    v24 = v23;
    -[NRPBSwitchRecordCollection mergeFrom:](v22, (uint64_t)v24);

    -[NRDeviceCollectionHistory _truncateHistory](v6, "_truncateHistory");
  }

  return v6;
}

- (void)_sanitizeHistory
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *history;
  NSMutableArray *v8;
  _QWORD v9[5];
  __int128 buf;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    nr_framework_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A0BDB000, v3, OS_LOG_TYPE_ERROR, "Deserialized history is not a supported type: %@", (uint8_t *)&buf, 0xCu);

    }
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    history = self->_history;
    self->_history = v6;

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  v8 = self->_history;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__NRDeviceCollectionHistory__sanitizeHistory__block_invoke;
  v9[3] = &unk_1E4496A90;
  v9[4] = &buf;
  -[NSMutableArray enumerateObjectsUsingBlock:](v8, "enumerateObjectsUsingBlock:", v9);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    -[NSMutableArray removeObjectsAtIndexes:](self->_history, "removeObjectsAtIndexes:");
  _Block_object_dispose(&buf, 8);

}

void __45__NRDeviceCollectionHistory__sanitizeHistory__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    nr_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      nr_framework_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 134218242;
        v16 = a3;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_DEFAULT, "History entry at index %lu is not recognized type: %@", (uint8_t *)&v15, 0x16u);

      }
    }
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v11, "addIndex:", a3);
  }

}

- (NRPBDeviceCollectionHistory)protobuf
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t startIndex;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_new();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    startIndex = self->_startIndex;
    *(_BYTE *)(v3 + 32) |= 1u;
    *(_QWORD *)(v3 + 8) = startIndex;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceCollectionHistory setHistorys:]((uint64_t)v4, v6);

  -[NRPBDeviceCollectionHistory setSwitchRecords:]((uint64_t)v4, self->_switchRecords);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_history;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (v4)
          v13 = (void *)v4[2];
        else
          v13 = 0;
        v14 = v13;
        objc_msgSend(v12, "protobuf", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        ++v11;
      }
      while (v9 != v11);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v9 = v16;
    }
    while (v16);
  }

  return (NRPBDeviceCollectionHistory *)v4;
}

- (unint64_t)_findIndexInHistoryStateCache:(id)a3 type:(unint64_t)a4
{
  NSMutableArray *historyStateCacheIndex;
  id v6;
  unint64_t v7;

  historyStateCacheIndex = self->_historyStateCacheIndex;
  v6 = a3;
  v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](historyStateCacheIndex, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[NSMutableArray count](historyStateCacheIndex, "count"), a4, &__block_literal_global_127);

  return v7;
}

uint64_t __64__NRDeviceCollectionHistory__findIndexInHistoryStateCache_type___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "longLongValue");
  if (v6 <= objc_msgSend(v5, "longLongValue"))
  {
    v8 = objc_msgSend(v4, "longLongValue");
    if (v8 >= objc_msgSend(v5, "longLongValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)_mostRecentStateBefore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  if (!-[NSMutableArray count](self->_historyStateCacheIndex, "count"))
    goto LABEL_7;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_historyStateCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = -[NRDeviceCollectionHistory _findIndexInHistoryStateCache:type:](self, "_findIndexInHistoryStateCache:type:", v4, 1024);
    if (v7)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_historyStateCacheIndex, "objectAtIndexedSubscript:", v7 - 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v6 = v4;
LABEL_6:
  v8 = v6;
LABEL_8:

  return v8;
}

- (void)_updateHistoryCachesWithIndex:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  NSMutableArray *historyStateCacheIndex;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[NSMutableArray removeObject:](self->_historyStateCacheMRU, "removeObject:", v9);
  -[NSMutableArray insertObject:atIndex:](self->_historyStateCacheMRU, "insertObject:atIndex:", v9, 0);
  if (!-[NSMutableArray count](self->_historyStateCacheIndex, "count"))
  {
    historyStateCacheIndex = self->_historyStateCacheIndex;
    goto LABEL_6;
  }
  v4 = -[NRDeviceCollectionHistory _findIndexInHistoryStateCache:type:](self, "_findIndexInHistoryStateCache:type:", v9, 1024);
  v5 = -[NSMutableArray count](self->_historyStateCacheIndex, "count");
  historyStateCacheIndex = self->_historyStateCacheIndex;
  if (v4 == v5)
  {
LABEL_6:
    -[NSMutableArray addObject:](historyStateCacheIndex, "addObject:", v9);
    goto LABEL_7;
  }
  -[NSMutableArray objectAtIndexedSubscript:](historyStateCacheIndex, "objectAtIndexedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "isEqual:", v7);

  if ((v8 & 1) == 0)
    -[NSMutableArray insertObject:atIndex:](self->_historyStateCacheIndex, "insertObject:atIndex:", v9, v4);
LABEL_7:
  -[NRDeviceCollectionHistory pruneStateCacheItems:](self, "pruneStateCacheItems:", 1);

}

- (void)pruneStateCacheItems:(unint64_t)a3
{
  NSMutableArray *i;
  void *v6;

  for (i = self->_historyStateCacheMRU; -[NSMutableArray count](i, "count") > a3; i = self->_historyStateCacheMRU)
  {
    -[NSMutableArray lastObject](self->_historyStateCacheMRU, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_historyStateCacheMRU, "removeLastObject");
    -[NSMutableDictionary removeObjectForKey:](self->_historyStateCache, "removeObjectForKey:", v6);
    -[NSMutableArray removeObject:](self->_historyStateCacheIndex, "removeObject:", v6);

  }
}

- (void)_truncateHistory
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint64_t i;
  _QWORD *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  id obj;
  void *v44;
  void *context;
  void *v46;
  NRMutableDeviceCollection *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray firstObject](self->_history, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  v7 = v6;
  if (-[NRDeviceCollectionHistory count](self, "count") >= 5
    && (-[NRDeviceCollectionHistory count](self, "count") > self->_maxHistoryDepth || v7 > 86400.0))
  {
    context = (void *)MEMORY[0x1A1B01C40]();
    v47 = objc_alloc_init(NRMutableDeviceCollection);
    if ((unint64_t)-[NSMutableArray count](self->_history, "count") <= self->_maxHistoryDepth)
      v8 = 0;
    else
      v8 = -[NSMutableArray count](self->_history, "count") - self->_maxHistoryDepth;
    v46 = v5;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v9 = self->_history;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v49;
      while (2)
      {
        v14 = 0;
        v15 = v11 + v12;
        do
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v14), "date");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "timeIntervalSinceDate:", v16);
          v18 = v17;

          if (v18 <= 86400.0)
          {
            v15 = v12 + v14;
            goto LABEL_18;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
        v12 = v15;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_18:

    if (v8 <= v15)
      v19 = v15;
    else
      v19 = v8;
    v20 = -[NRDeviceCollectionHistory count](self, "count");
    if (v19 >= v20 - 4)
      v21 = v20 - 4;
    else
      v21 = v19;
    -[NSMutableArray objectAtIndexedSubscript:](self->_history, "objectAtIndexedSubscript:", v21);
    v22 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "state");
    v23 = objc_claimAutoreleasedReturnValue();
    nr_daemon_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      nr_daemon_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v53 = v23;
        _os_log_impl(&dword_1A0BDB000, v26, OS_LOG_TYPE_DEFAULT, "Device collection migrated to most recent history entry %p", buf, 0xCu);
      }

    }
    +[NRMutableDeviceCollection diffFrom:to:](NRMutableDeviceCollection, "diffFrom:to:", v47, v23);
    v27 = objc_claimAutoreleasedReturnValue();
    nr_daemon_log();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (v29)
    {
      nr_daemon_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v53 = v21;
        _os_log_impl(&dword_1A0BDB000, v30, OS_LOG_TYPE_DEFAULT, "Deleting %lld items from history", buf, 0xCu);
      }

    }
    obj = (id)v27;
    v44 = (void *)v23;
    if (v21)
    {
      for (i = 0; i != v21; ++i)
      {
        -[NSMutableArray objectAtIndex:](self->_history, "objectAtIndex:", i);
        v32 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        nr_daemon_log();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

        if (v34)
        {
          nr_daemon_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            if (v32)
              v36 = v32[5];
            else
              v36 = 0;
            *(_DWORD *)buf = 134217984;
            v53 = v36;
            _os_log_impl(&dword_1A0BDB000, v35, OS_LOG_TYPE_DEFAULT, "Clearing historical device collection %p", buf, 0xCu);
          }

        }
        -[NRDeviceCollectionHistoryEntry setHistoryManager:]((uint64_t)v32, 0);

      }
    }
    -[NSMutableArray removeObjectsInRange:](self->_history, "removeObjectsInRange:", 0, v21);
    self->_startIndex += v21;
    if (v22)
      objc_storeStrong(v22 + 4, obj);
    v37 = v22;
    if (-[NSMutableArray count](self->_historyStateCacheIndex, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_startIndex);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[NRDeviceCollectionHistory _findIndexInHistoryStateCache:type:](self, "_findIndexInHistoryStateCache:type:", v38, 1024);

      if (v39 == -[NSMutableArray count](self->_historyStateCacheIndex, "count"))
      {
        -[NSMutableDictionary removeAllObjects](self->_historyStateCache, "removeAllObjects");
        -[NSMutableArray removeAllObjects](self->_historyStateCacheIndex, "removeAllObjects");
        -[NSMutableArray removeAllObjects](self->_historyStateCacheMRU, "removeAllObjects");
      }
      else
      {
        if (v39)
          v40 = v39 - 1;
        else
          v40 = 0;
        if (v39)
        {
          v41 = 0;
          do
          {
            -[NSMutableArray firstObject](self->_historyStateCacheIndex, "firstObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](self->_historyStateCache, "removeObjectForKey:", v42);
            -[NSMutableArray removeObject:](self->_historyStateCacheIndex, "removeObject:", v42);
            -[NSMutableArray removeObject:](self->_historyStateCacheMRU, "removeObject:", v42);

            ++v41;
          }
          while (v41 <= v40);
        }
      }
    }

    objc_autoreleasePoolPop(context);
    v5 = v46;
  }

}

- (id)historyEntryAtIndex:(unint64_t)a3
{
  unint64_t startIndex;
  void *v6;

  startIndex = self->_startIndex;
  if (startIndex > a3 || -[NSMutableArray count](self->_history, "count") + startIndex <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_history, "objectAtIndexedSubscript:", a3 - self->_startIndex);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_history, "count");
}

- (unint64_t)nextIndex
{
  unint64_t startIndex;

  startIndex = self->_startIndex;
  return -[NSMutableArray count](self->_history, "count") + startIndex;
}

- (id)applyDiff:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[NRMutableDeviceCollection applyDiff:upOnly:notifyParent:unconditional:](self->_deviceCollection, "applyDiff:upOnly:notifyParent:unconditional:", v4, 0, 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NSMutableArray lastObject](self->_history, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (id)v5;
    }
    else
    {
      v6 = 0;
      v4 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)addObserverQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NRDeviceCollectionHistoryObserverWrapper *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(NRDeviceCollectionHistoryObserverWrapper);
  -[NRDeviceCollectionHistoryObserverWrapper setObserver:](v8, "setObserver:", v6);

  -[NRDeviceCollectionHistoryObserverWrapper setQueue:](v8, "setQueue:", v7);
  os_unfair_lock_lock(&self->_observerLock);
  -[NSMutableOrderedSet addObject:](self->_observers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_observerLock);
  return v8;
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observerLock;
  id v5;

  p_observerLock = &self->_observerLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  -[NSMutableOrderedSet removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_observerLock);
}

- (void)child:(id)a3 didApplyDiff:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NRDeviceCollectionHistoryEntry *v9;
  unint64_t startIndex;
  unint64_t v11;
  void *v12;
  NRDeviceCollectionHistoryEntry *v13;
  NRMutableDeviceCollection *v14;

  v14 = (NRMutableDeviceCollection *)a3;
  v6 = a4;
  if (v6 && self->_deviceCollection == v14)
  {
    LODWORD(v7) = -[NRDeviceCollectionHistory switchIndex](self, "switchIndex");
    -[NRDeviceCollectionHistory switchDeviceIDFromDiff:](self, "switchDeviceIDFromDiff:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v7 = (v7 + 1);
    else
      v7 = v7;
    v9 = [NRDeviceCollectionHistoryEntry alloc];
    startIndex = self->_startIndex;
    v11 = -[NSMutableArray count](self->_history, "count") + startIndex;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NRDeviceCollectionHistoryEntry initWithHistory:index:date:diff:switchIndex:](v9, "initWithHistory:index:date:diff:switchIndex:", self, v11, v12, v6, v7);

    -[NSMutableArray addObject:](self->_history, "addObject:", v13);
    -[NRSwitchRecordCollection addSwitchRecordWithHistoryEntry:]((uint64_t)self->_switchRecords, v13);
    -[NRDeviceCollectionHistory _truncateHistory](self, "_truncateHistory");
    atomic_store(1u, (unsigned __int8 *)&self->_atomicDirty);
    -[NRDeviceCollectionHistory notifyHistoryObserversWithEntry:](self, "notifyHistoryObserversWithEntry:", v13);

  }
}

- (unsigned)switchIndex
{
  NRSwitchRecordCollection *switchRecords;
  NRSwitchRecordCollection *v3;
  _DWORD *v4;
  unsigned int v5;

  switchRecords = self->_switchRecords;
  if (switchRecords)
    switchRecords = (NRSwitchRecordCollection *)switchRecords->super._records;
  v3 = switchRecords;
  -[NRSwitchRecordCollection lastObject](v3, "lastObject");
  v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[6];
  else
    v5 = 0;

  return v5;
}

- (id)switchDeviceIDFromDiff:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  const __CFString *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v17 = *(_QWORD *)v19;
    v16 = CFSTR("isActive");
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v7, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "diff");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "diff");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAB0]);

        if (v13)
        {
          v14 = v7;

          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)deviceIDAtSwitchIndex:(unsigned int)a3 date:(id *)a4
{
  NRSwitchRecordCollection *switchRecords;
  NSMutableArray *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  switchRecords = self->_switchRecords;
  if (switchRecords)
  {
    v7 = switchRecords->super._records;

    if (v7)
    {
      v8 = objc_opt_new();
      v9 = (void *)v8;
      if (v8)
      {
        *(_BYTE *)(v8 + 28) |= 2u;
        *(_DWORD *)(v8 + 24) = a3;
      }
      v10 = switchRecords->super._records;
      v11 = switchRecords->super._records;
      v12 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v10, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, -[NSMutableArray count](v11, "count"), 256, &__block_literal_global_5);

      v13 = 0;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_14;
      -[NSMutableArray objectAtIndexedSubscript:](switchRecords->super._records, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_new();
      -[NRPBSwitchRecord mergeFrom:](v15, v14);
      if (v15)
      {
        v16 = *(id *)(v15 + 16);
        objc_msgSend(v16, "toUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!a4)
        {
LABEL_13:

LABEL_14:
          return v13;
        }
        if ((*(_BYTE *)(v15 + 28) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v15 + 8));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        v13 = 0;
        v17 = 0;
        if (!a4)
          goto LABEL_13;
      }
      *a4 = v17;
      goto LABEL_13;
    }
  }
  v13 = 0;
  return v13;
}

- (void)notifyHistoryObserversWithEntry:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observerLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  v6 = (void *)-[NSMutableOrderedSet copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_observerLock);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "queue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v13, "queue");
          v15 = objc_claimAutoreleasedReturnValue();
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __61__NRDeviceCollectionHistory_notifyHistoryObserversWithEntry___block_invoke;
          v17[3] = &unk_1E4495030;
          v17[4] = v13;
          v18 = v4;
          dispatch_async(v15, v17);

        }
        else
        {
          objc_msgSend(v13, "observer");
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, void *))v16)[2](v16, v4, v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

void __61__NRDeviceCollectionHistory_notifyHistoryObserversWithEntry___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)invalidate
{
  -[NRMutableDeviceCollection invalidate](self->_deviceCollection, "invalidate");
  os_unfair_lock_lock(&self->_observerLock);
  -[NSMutableOrderedSet removeAllObjects](self->_observers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_observerLock);
  -[NSMutableArray removeAllObjects](self->_history, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_historyStateCache, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_historyStateCacheMRU, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_historyStateCacheIndex, "removeAllObjects");
}

- (id)description
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_history;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = &stru_1E4499C68;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "description", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", v9);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = &stru_1E4499C68;
  }

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  v8 = (void *)-[NSMutableArray copy](self->_history, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  NRDeviceCollectionHistory *v4;
  BOOL v5;

  v4 = (NRDeviceCollectionHistory *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NRDeviceCollectionHistory isEqualToHistory:](self, "isEqualToHistory:", v4);
  }

  return v5;
}

- (BOOL)isEqualToHistory:(id)a3
{
  NRDeviceCollectionHistory *v4;
  NRDeviceCollectionHistory *v5;
  BOOL v6;

  v4 = (NRDeviceCollectionHistory *)a3;
  v5 = v4;
  v6 = v4 == self
    || v4
    && -[NRMutableDeviceCollection isEqual:](self->_deviceCollection, "isEqual:", v4->_deviceCollection)
    && self->_startIndex == v5->_startIndex;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NRMutableDeviceCollection *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 48) = self->_startIndex;
  v6 = -[NSMutableArray mutableCopyWithZone:](self->_history, "mutableCopyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = *(id *)(v5 + 56);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        -[NRDeviceCollectionHistoryEntry setHistoryManager:](*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12++), (void *)v5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(v5 + 56), "lastObject", (_QWORD)v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copyWithZone:", 0);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = *(void **)(v5 + 40);
  if (!v17)
  {
    v18 = objc_alloc_init(NRMutableDeviceCollection);
    v19 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v18;

    v17 = *(void **)(v5 + 40);
  }
  objc_msgSend(v17, "setParentDelegate:", v5);
  return (id)v5;
}

- (NRMutableDeviceCollection)deviceCollection
{
  return self->_deviceCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyStateCacheIndex, 0);
  objc_storeStrong((id *)&self->_historyStateCacheMRU, 0);
  objc_storeStrong((id *)&self->_historyStateCache, 0);
  objc_storeStrong((id *)&self->_switchRecords, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_deviceCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
