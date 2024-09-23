@implementation _DKEventStatsCollection

+ (id)collectionWithName:(uint64_t)a1
{
  id v2;
  objc_class *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  v3 = (objc_class *)objc_opt_self();
  if (collectionWithName__initialized != -1)
    dispatch_once(&collectionWithName__initialized, &__block_literal_global_53);
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = v2;
  objc_msgSend((id)_DKEventStatsCollections, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[_DKEventStatsCollection initWithName:]([v3 alloc], v5);
    objc_msgSend((id)_DKEventStatsCollections, "setObject:forKeyedSubscript:", v6, v5);
  }

  objc_sync_exit(v4);
  return v6;
}

- (_QWORD)initWithName:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_DKEventStatsCollection;
    v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      v6 = objc_opt_new();
      v7 = (void *)a1[1];
      a1[1] = v6;

    }
  }

  return a1;
}

+ (id)counterWithClass:(void *)a3 collectionName:(void *)a4 eventName:(void *)a5 eventType:(void *)a6 eventTypePossibleValues:(char)a7 hasResult:(int)a8 scalar:
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = objc_opt_self();
  +[_DKEventStatsCollection collectionWithName:](v17, v13);
  v18 = (id *)(id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v18);
  if (v15)
  {
    v24[0] = v14;
    v24[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v14;
  }
  v20 = v19;
  -[_DKSyncDeletedEventIDs deletedEventIDsForSourceDeviceID:](v18, (uint64_t)v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v21 = (void *)objc_opt_new();
    v22 = -[_DKEventStatsCounterInternal initWithCollectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((id *)[_DKEventStatsCounterInternal alloc], v13, v14, v15, v16, a7, a8);
    objc_msgSend(v21, "setInternal:", v22);
    if (v18)
      objc_msgSend(v18[1], "setObject:forKeyedSubscript:", v21, v20);

  }
  objc_sync_exit(v18);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventCounterStats, 0);
}

@end
