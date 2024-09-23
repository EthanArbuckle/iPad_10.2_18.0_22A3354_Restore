@implementation _UIDocumentPickerLocalDirectoryObserver

- (_UIDocumentPickerLocalDirectoryObserver)initWithScopes:(id)a3 delegate:(id)a4
{
  id v6;
  _UIDocumentPickerLocalDirectoryObserver *v7;
  NSOperationQueue *v8;
  NSOperationQueue *queryWorkerQueue;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queryDispatchQueue;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _UIDocumentPickerVnodeDispatchSource *v21;
  uint64_t v22;
  NSMutableDictionary *resultsForSources;
  uint64_t v24;
  NSArray *sources;
  uint64_t v26;
  NSOrderedSet *staticItems;
  void *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
  v7 = -[_UIArrayController initWithDelegate:](&v36, sel_initWithDelegate_, a4);
  if (v7)
  {
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queryWorkerQueue = v7->_queryWorkerQueue;
    v7->_queryWorkerQueue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_queryWorkerQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v7->_queryWorkerQueue, "setQualityOfService:", 17);
    -[NSOperationQueue name](v7->_queryWorkerQueue, "name");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0);
    queryDispatchQueue = v7->_queryDispatchQueue;
    v7->_queryDispatchQueue = (OS_dispatch_queue *)v11;

    -[NSOperationQueue setUnderlyingQueue:](v7->_queryWorkerQueue, "setUnderlyingQueue:", v7->_queryDispatchQueue);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("observer %p"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v7->_queryWorkerQueue, "setName:", v13);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v6;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = -[_UIDocumentPickerVnodeDispatchSource initWithTarget:url:queue:]([_UIDocumentPickerVnodeDispatchSource alloc], "initWithTarget:url:queue:", v7, v20, v7->_queryDispatchQueue);
            objc_msgSend(v14, "addObject:", v21);

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v17);
    }

    v22 = objc_opt_new();
    resultsForSources = v7->_resultsForSources;
    v7->_resultsForSources = (NSMutableDictionary *)v22;

    v24 = objc_msgSend(v14, "copy");
    sources = v7->_sources;
    v7->_sources = (NSArray *)v24;

    v26 = objc_opt_new();
    staticItems = v7->_staticItems;
    v7->_staticItems = (NSOrderedSet *)v26;

    -[_UIDocumentPickerLocalDirectoryObserver isVisiblePredicate](v7, "isVisiblePredicate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIArrayController setPredicate:](v7, "setPredicate:", v28);

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerLocalDirectoryObserver setQueryPredicate:](v7, "setQueryPredicate:", v29);

    -[_UIDocumentPickerLocalDirectoryObserver initialUpdate](v7, "initialUpdate");
    v6 = v31;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NSArray componentsJoinedByString:](self->_sources, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>, %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
  -[_UIArrayController dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;

  -[NSArray makeObjectsPerformSelector:](self->_sources, "makeObjectsPerformSelector:", sel_invalidate);
  -[NSOperationQueue cancelAllOperations](self->_queryWorkerQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
  -[_UIArrayController invalidate](&v3, sel_invalidate);
}

- (void)setQueryPredicate:(id)a3
{
  id v4;
  NSOperationQueue *queryWorkerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61___UIDocumentPickerLocalDirectoryObserver_setQueryPredicate___block_invoke;
  v7[3] = &unk_24E43A858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](queryWorkerQueue, "addOperationWithBlock:", v7);

}

- (NSPredicate)queryPredicate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57___UIDocumentPickerLocalDirectoryObserver_queryPredicate__block_invoke;
  v6[3] = &unk_24E43AAD8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](self->_queryWorkerQueue, "addOperation:", v3);
  objc_msgSend(v3, "waitUntilFinished");
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return (NSPredicate *)v4;
}

- (void)setStaticItems:(id)a3
{
  id v4;
  NSOperationQueue *queryWorkerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58___UIDocumentPickerLocalDirectoryObserver_setStaticItems___block_invoke;
  v7[3] = &unk_24E43A858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](queryWorkerQueue, "addOperationWithBlock:", v7);

}

- (NSOrderedSet)staticItems
{
  NSOperationQueue *queryWorkerQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queryWorkerQueue = self->_queryWorkerQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54___UIDocumentPickerLocalDirectoryObserver_staticItems__block_invoke;
  v5[3] = &unk_24E43AAD8;
  v5[4] = self;
  v5[5] = &v6;
  -[NSOperationQueue addOperationWithBlock:](queryWorkerQueue, "addOperationWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "attributesModified:", v7);
  }
  else
  {
    objc_msgSend(v7, "modificationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = v10;
    -[_UIDocumentPickerLocalDirectoryObserver lastSnapshotDate](self, "lastSnapshotDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v8 = v11 > v13;

    v7 = v9;
  }

  return v8;
}

- (id)isVisiblePredicate
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_8);
}

- (void)callUpdateHandler:(id)a3 changeDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerLocalDirectoryObserver setLastSnapshotDate:](self, "setLastSnapshotDate:", v8);

  if (objc_msgSend(v7, "count")
    || !-[_UIDocumentPickerLocalDirectoryObserver afterInitialUpdate](self, "afterInitialUpdate"))
  {
    -[_UIDocumentPickerLocalDirectoryObserver setAfterInitialUpdate:](self, "setAfterInitialUpdate:", 1);
    v9.receiver = self;
    v9.super_class = (Class)_UIDocumentPickerLocalDirectoryObserver;
    -[_UIArrayController callUpdateHandler:changeDictionary:](&v9, sel_callUpdateHandler_changeDictionary_, v6, v7);
  }

}

- (id)gatherResultsForSource:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _UIDocumentPickerContainerURLItem *v15;
  _UIDocumentPickerContainerURLItem *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v3, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerContainerURLItem defaultKeys](_UIDocumentPickerContainerURLItem, "defaultKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v6, 1, &__block_literal_global_28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = [_UIDocumentPickerContainerURLItem alloc];
        v16 = -[_UIDocumentPickerContainerURLItem initWithURL:](v15, "initWithURL:", v14, (_QWORD)v18);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)gatherResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_resultsForSources, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[NSOrderedSet array](self->_staticItems, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  if (self->_queryPredicate)
  {
    objc_msgSend(v3, "filteredArrayUsingPredicate:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

- (void)initialUpdate
{
  NSOperationQueue *queryWorkerQueue;
  _QWORD v3[5];

  queryWorkerQueue = self->_queryWorkerQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56___UIDocumentPickerLocalDirectoryObserver_initialUpdate__block_invoke;
  v3[3] = &unk_24E43A808;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](queryWorkerQueue, "addOperationWithBlock:", v3);
}

- (void)updateResultsForSource:(id)a3
{
  id v4;
  NSOperationQueue *queryWorkerQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  _UIDocumentPickerLocalDirectoryObserver *v9;

  v4 = a3;
  queryWorkerQueue = self->_queryWorkerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66___UIDocumentPickerLocalDirectoryObserver_updateResultsForSource___block_invoke;
  v7[3] = &unk_24E43A858;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](queryWorkerQueue, "addOperationWithBlock:", v7);

}

- (void)dispatchSourceDidReceiveEvent:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *queryDispatchQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!self->_updateScheduled)
  {
    self->_updateScheduled = 1;
    v5 = dispatch_time(0, 500000000);
    queryDispatchQueue = self->_queryDispatchQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __73___UIDocumentPickerLocalDirectoryObserver_dispatchSourceDidReceiveEvent___block_invoke;
    v7[3] = &unk_24E43A858;
    v7[4] = self;
    v8 = v4;
    dispatch_after(v5, queryDispatchQueue, v7);

  }
}

- (NSDate)lastSnapshotDate
{
  return self->_lastSnapshotDate;
}

- (void)setLastSnapshotDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshotDate, a3);
}

- (NSOperationQueue)queryWorkerQueue
{
  return self->_queryWorkerQueue;
}

- (void)setQueryWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryWorkerQueue, a3);
}

- (BOOL)afterInitialUpdate
{
  return self->_afterInitialUpdate;
}

- (void)setAfterInitialUpdate:(BOOL)a3
{
  self->_afterInitialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryWorkerQueue, 0);
  objc_storeStrong((id *)&self->_lastSnapshotDate, 0);
  objc_storeStrong((id *)&self->_resultsForSources, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_queryDispatchQueue, 0);
  objc_storeStrong((id *)&self->_queryPredicate, 0);
  objc_storeStrong((id *)&self->_staticItems, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
