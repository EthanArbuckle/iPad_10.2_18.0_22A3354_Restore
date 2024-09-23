@implementation _UIDocumentPickerCloudDirectoryObserver

- (_UIDocumentPickerCloudDirectoryObserver)initWithScopes:(id)a3 delegate:(id)a4
{
  id v6;
  _UIDocumentPickerCloudDirectoryObserver *v7;
  _UIDocumentPickerCloudDirectoryObserver *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queryQueue;
  NSOperationQueue *v20;
  NSOperationQueue *queryWorkerQueue;
  uint64_t v22;
  NSOrderedSet *staticItems;
  void *v24;
  NSOperationQueue *v25;
  _QWORD v27[4];
  _UIDocumentPickerCloudDirectoryObserver *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  v7 = -[_UIArrayController initWithDelegate:](&v33, sel_initWithDelegate_, a4);
  v8 = v7;
  if (v7)
  {
    -[_UIDocumentPickerCloudDirectoryObserver setScopes:](v7, "setScopes:", v6);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_storeStrong((id *)&v8->_firstURL, v14);
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("directory observer queue for %@"), v16);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), 0);
    queryQueue = v8->_queryQueue;
    v8->_queryQueue = (OS_dispatch_queue *)v18;

    v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    queryWorkerQueue = v8->_queryWorkerQueue;
    v8->_queryWorkerQueue = v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_queryWorkerQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v8->_queryWorkerQueue, "setUnderlyingQueue:", v8->_queryQueue);
    -[NSOperationQueue setQualityOfService:](v8->_queryWorkerQueue, "setQualityOfService:", 25);
    v22 = objc_opt_new();
    staticItems = v8->_staticItems;
    v8->_staticItems = (NSOrderedSet *)v22;

    -[_UIDocumentPickerCloudDirectoryObserver isVisiblePredicate](v8, "isVisiblePredicate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIArrayController setPredicate:](v8, "setPredicate:", v24);

    -[_UIDocumentPickerCloudDirectoryObserver setQueryPredicate:](v8, "setQueryPredicate:", 0);
    v25 = v8->_queryWorkerQueue;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67___UIDocumentPickerCloudDirectoryObserver_initWithScopes_delegate___block_invoke;
    v27[3] = &unk_24E43A808;
    v28 = v8;
    -[NSOperationQueue addOperationWithBlock:](v25, "addOperationWithBlock:", v27);

  }
  return v8;
}

- (_UIDocumentPickerCloudDirectoryObserver)initWithRecursiveScopes:(id)a3 delegate:(id)a4
{
  self->_recursive = 1;
  return -[_UIDocumentPickerCloudDirectoryObserver initWithScopes:delegate:](self, "initWithScopes:delegate:", a3, a4);
}

- (void)assertOnQueryQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queryQueue);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  -[_UIArrayController dealloc](&v2, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queryQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  -[_UIArrayController invalidate](&v5, sel_invalidate);
  queryQueue = self->_queryQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___UIDocumentPickerCloudDirectoryObserver_invalidate__block_invoke;
  block[3] = &unk_24E43A808;
  block[4] = self;
  dispatch_async(queryQueue, block);
}

- (void)setQuery:(id)a3
{
  NSMetadataQuery *query;
  void *v6;
  NSMetadataQuery *v7;

  v7 = (NSMetadataQuery *)a3;
  -[_UIDocumentPickerCloudDirectoryObserver assertOnQueryQueue](self, "assertOnQueryQueue");
  query = self->_query;
  if (query != v7)
  {
    -[NSMetadataQuery stopQuery](query, "stopQuery");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, 0, self->_query);

    objc_storeStrong((id *)&self->_query, a3);
  }

}

- (void)_updateQuery
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _UIDocumentPickerCloudDirectoryObserver *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _UIDocumentPickerCloudDirectoryObserver *v17;
  _BOOL4 recursive;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSPredicate *v26;
  NSPredicate *queryPredicate;
  void *v28;
  int v29;
  NSPredicate *v30;
  NSMetadataQuery *query;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (self->_query)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD1078], self->_query);

  }
  v4 = objc_alloc_init(MEMORY[0x24BDD1670]);
  -[_UIDocumentPickerCloudDirectoryObserver setQuery:](self, "setQuery:", v4);

  -[_UIDocumentPickerCloudDirectoryObserver queryWorkerQueue](self, "queryWorkerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMetadataQuery setOperationQueue:](self->_query, "setOperationQueue:", v5);

  -[_UIDocumentPickerCloudDirectoryObserver scopes](self, "scopes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", *MEMORY[0x24BDD1080]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMetadataQuery setSearchScopes:](self->_query, "setSearchScopes:", v7);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE175F8], "allContainersByContainerID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = self;
  -[_UIDocumentPickerCloudDirectoryObserver scopes](self, "scopes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v9)
  {
    v36 = 0;
    goto LABEL_23;
  }
  v10 = v9;
  v36 = 0;
  v11 = *(_QWORD *)v41;
  v12 = *MEMORY[0x24BDD10A8];
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
LABEL_11:
        v17 = v8;
        goto LABEL_12;
      }
      objc_msgSend(v37, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "documentsURL");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_11;
      v17 = v8;
      v24 = v36;
      if (!v36)
        v24 = (void *)objc_opt_new();
      v36 = v24;
      objc_msgSend(v24, "URLForUbiquityContainerIdentifier:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
      recursive = v17->_recursive;
      v19 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v15, "path");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (recursive)
        v22 = CFSTR("%K.URLByDeletingLastPathComponent.path BEGINSWITH %@");
      else
        v22 = CFSTR("%K.URLByDeletingLastPathComponent.path = %@");
      objc_msgSend(v19, "predicateWithFormat:", v22, v12, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "addObject:", v23);
      ++v13;
    }
    while (v10 != v13);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    v10 = v25;
  }
  while (v25);
LABEL_23:

  v26 = (NSPredicate *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 2, v39);
  queryPredicate = v8->_queryPredicate;
  if (queryPredicate)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSPredicate isEqual:](queryPredicate, "isEqual:", v28);

    if (v29)
    {
      v30 = v8->_queryPredicate;
      query = v8->_query;
      goto LABEL_27;
    }
    v32 = objc_alloc(MEMORY[0x24BDD14C0]);
    v44[0] = v8->_queryPredicate;
    v44[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithType:subpredicates:", 1, v33);
    -[NSMetadataQuery setPredicate:](v8->_query, "setPredicate:", v34);

  }
  else
  {
    query = v8->_query;
    v30 = v26;
LABEL_27:
    -[NSMetadataQuery setPredicate:](query, "setPredicate:", v30);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObserver:selector:name:object:", v8, sel__initialGatherFinished_, *MEMORY[0x24BDD1070], v8->_query);

  -[NSMetadataQuery startQuery](v8->_query, "startQuery");
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
  v7[2] = __61___UIDocumentPickerCloudDirectoryObserver_setQueryPredicate___block_invoke;
  v7[3] = &unk_24E43A858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](queryWorkerQueue, "addOperationWithBlock:", v7);

}

- (NSPredicate)queryPredicate
{
  NSObject *queryQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queryQueue = self->_queryQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57___UIDocumentPickerCloudDirectoryObserver_queryPredicate__block_invoke;
  v5[3] = &unk_24E43AAD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSPredicate *)v3;
}

- (void)_initialGatherFinished:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _OWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_UIDocumentPickerCloudDirectoryObserver assertOnQueryQueue](self, "assertOnQueryQueue");
  v5 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDD1070], self->_query);

  if (!-[NSMetadataQuery resultCount](self->_query, "resultCount")
    && !self->_queryPredicate
    && -[NSArray count](self->_scopes, "count"))
  {
    v20 = v4;
    objc_msgSend(MEMORY[0x24BE175F8], "allContainersByContainerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = self->_scopes;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v21 = *(_QWORD *)v24;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "documentsURL");
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v16 = v14;
          }
          v17 = objc_alloc_init(MEMORY[0x24BDD1580]);
          memset(v22, 0, sizeof(v22));
          objc_msgSend(v17, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v16, 0, 4, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", v22, v27, 16);

          if (v19)
          {
            v4 = v20;
            v5 = 0x24BDD1000;
            goto LABEL_7;
          }
          ++v13;
        }
        while (v12 != v13);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v12)
          continue;
        break;
      }
    }

    v4 = v20;
    v5 = 0x24BDD1000;
  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDD1088]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[_UIDocumentPickerCloudDirectoryObserver _updateObservers:](self, "_updateObservers:", v9);
LABEL_7:

  objc_msgSend(*(id *)(v5 + 1744), "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__queryUpdated_, *MEMORY[0x24BDD1078], self->_query);

}

- (void)_queryUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIDocumentPickerCloudDirectoryObserver assertOnQueryQueue](self, "assertOnQueryQueue");
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD1088]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[_UIDocumentPickerCloudDirectoryObserver _updateObservers:](self, "_updateObservers:", v6);

}

- (id)_queryResultsWithChangedObjects:(id)a3 changedResults:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMetadataQuery *query;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  void *v20;

  v6 = a3;
  -[_UIDocumentPickerCloudDirectoryObserver assertOnQueryQueue](self, "assertOnQueryQueue");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __90___UIDocumentPickerCloudDirectoryObserver__queryResultsWithChangedObjects_changedResults___block_invoke;
  v17[3] = &unk_24E43AB00;
  v10 = v7;
  v18 = v10;
  v19 = v6;
  v20 = v8;
  v11 = v8;
  v12 = v6;
  -[NSMetadataQuery enumerateResultsUsingBlock:](query, "enumerateResultsUsingBlock:", v17);
  v13 = objc_retainAutorelease(v11);
  *a4 = v13;
  v14 = v20;
  v15 = v10;

  return v15;
}

- (void)_updateObservers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[_UIDocumentPickerCloudDirectoryObserver assertOnQueryQueue](self, "assertOnQueryQueue");
  -[_UIDocumentPickerCloudDirectoryObserver query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableUpdates");

  v11 = 0;
  -[_UIDocumentPickerCloudDirectoryObserver _queryResultsWithChangedObjects:changedResults:](self, "_queryResultsWithChangedObjects:changedResults:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  -[_UIDocumentPickerCloudDirectoryObserver query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enableUpdates");

  if (self->_staticItems)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOrderedSet array](self->_staticItems, "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v10);

    -[_UIArrayController processUpdate:changedObjects:](self, "processUpdate:changedObjects:", v9, v7);
  }
  else
  {
    -[_UIArrayController processUpdate:changedObjects:](self, "processUpdate:changedObjects:", v6, v7);
  }

}

- (void)setStaticItems:(id)a3
{
  id v4;
  NSObject *queryQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queryQueue = self->_queryQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58___UIDocumentPickerCloudDirectoryObserver_setStaticItems___block_invoke;
  v7[3] = &unk_24E43A858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queryQueue, v7);

}

- (NSOrderedSet)staticItems
{
  NSObject *queryQueue;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queryQueue = self->_queryQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54___UIDocumentPickerCloudDirectoryObserver_staticItems__block_invoke;
  v5[3] = &unk_24E43AAD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queryQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;

  objc_msgSend(a4, "modificationDate", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[_UIDocumentPickerCloudDirectoryObserver lastSnapshotDate](self, "lastSnapshotDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v7 > v9;

  return v10;
}

- (id)isVisiblePredicate
{
  void *v2;

  if (self->_recursive)
    v2 = &__block_literal_global_2;
  else
    v2 = &__block_literal_global_29;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
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
  -[_UIDocumentPickerCloudDirectoryObserver setLastSnapshotDate:](self, "setLastSnapshotDate:", v8);

  if (v7 || !-[_UIDocumentPickerCloudDirectoryObserver afterInitialUpdate](self, "afterInitialUpdate"))
  {
    -[_UIDocumentPickerCloudDirectoryObserver setAfterInitialUpdate:](self, "setAfterInitialUpdate:", 1);
    v9.receiver = self;
    v9.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
    -[_UIArrayController callUpdateHandler:changeDictionary:](&v9, sel_callUpdateHandler_changeDictionary_, v6, v7);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_UIDocumentPickerCloudDirectoryObserver;
  -[_UIDocumentPickerCloudDirectoryObserver description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_scopes, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSMetadataQuery)query
{
  return self->_query;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
  objc_storeStrong((id *)&self->_scopes, a3);
}

- (NSDate)lastSnapshotDate
{
  return self->_lastSnapshotDate;
}

- (void)setLastSnapshotDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshotDate, a3);
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryQueue, a3);
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
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_lastSnapshotDate, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_firstURL, 0);
  objc_storeStrong((id *)&self->_queryPredicate, 0);
  objc_storeStrong((id *)&self->_staticItems, 0);
}

@end
