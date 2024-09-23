@implementation CPLActiveDownloadQueue

- (CPLActiveDownloadQueue)initWithName:(id)a3 type:(unint64_t)a4 FIFOQueue:(BOOL)a5 maximumBatchSize:(unint64_t)a6 maximumConcurrentTransportTasks:(unint64_t)a7 coalescingInterval:(int64_t)a8 groupConstructor:(id)a9
{
  id v15;
  id v16;
  CPLActiveDownloadQueue *v17;
  uint64_t v18;
  NSString *name;
  NSMutableArray *v20;
  NSMutableArray *transferTasks;
  NSMutableArray *v22;
  NSMutableArray *transportTasks;
  uint64_t v24;
  id groupConstructor;
  objc_super v27;

  v15 = a3;
  v16 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CPLActiveDownloadQueue;
  v17 = -[CPLActiveDownloadQueue init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_FIFOQueue = a5;
    v17->_type = a4;
    v17->_maximumBatchSize = a6;
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transferTasks = v17->_transferTasks;
    v17->_transferTasks = v20;

    v17->_maximumConcurrentTransportTasks = a7;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transportTasks = v17->_transportTasks;
    v17->_transportTasks = v22;

    v17->_coalescingInterval = a8;
    v24 = MEMORY[0x1B5E08DC4](v16);
    groupConstructor = v17->_groupConstructor;
    v17->_groupConstructor = (id)v24;

  }
  return v17;
}

- (void)addTransferTask:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_FIFOQueue && objc_msgSend(v4, "willGenerateReport"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_transferTasks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "noteTaskHasBeenPreempted", (_QWORD)v11);
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  -[NSMutableArray addObject:](self->_transferTasks, "addObject:", v5, (_QWORD)v11);

}

- (void)removeTransferTask:(id)a3
{
  -[NSMutableArray removeObject:](self->_transferTasks, "removeObject:", a3);
}

- (unint64_t)countOfTransferTasks
{
  return -[NSMutableArray count](self->_transferTasks, "count");
}

- (id)dequeueBatchOfTransferTasksDequeuedSize:(unint64_t *)a3
{
  id v5;
  NSMutableArray *transferTasks;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t maximumBatchSize;
  BOOL v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  _BOOL4 FIFOQueue;
  NSMutableArray *v23;
  NSMutableArray *v24;
  uint64_t v25;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  transferTasks = self->_transferTasks;
  if (self->_FIFOQueue)
    -[NSMutableArray objectEnumerator](transferTasks, "objectEnumerator");
  else
    -[NSMutableArray reverseObjectEnumerator](transferTasks, "reverseObjectEnumerator");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v27 = a3;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v31;
    while (2)
    {
      v13 = 0;
      v28 = v11;
      v29 = v11 + v9;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        objc_msgSend(v14, "cloudResource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "estimatedResourceSize");

        maximumBatchSize = self->_maximumBatchSize;
        v18 = maximumBatchSize > v10;
        v19 = maximumBatchSize - v10;
        v20 = v18 && v19 >= v16;
        if (!v20 && objc_msgSend(v5, "count"))
        {
          v21 = v28 + v13;
          goto LABEL_18;
        }
        objc_msgSend(v5, "addObject:", v14);
        v10 += v16;
        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v21 = v29;
      v11 = v29;
      if (v9)
        continue;
      break;
    }
LABEL_18:

    if (v21)
    {
      if (v27)
        *v27 = v10;
      FIFOQueue = self->_FIFOQueue;
      v23 = self->_transferTasks;
      if (FIFOQueue)
      {
        v24 = v23;
        v25 = 0;
      }
      else
      {
        v25 = -[NSMutableArray count](v23, "count") - v21;
        v24 = v23;
      }
      -[NSMutableArray removeObjectsInRange:](v24, "removeObjectsInRange:", v25, v21);
    }
  }
  else
  {

  }
  return v5;
}

- (NSArray)allTransferTasks
{
  return (NSArray *)self->_transferTasks;
}

- (void)removeAllTransferTasks
{
  -[NSMutableArray removeAllObjects](self->_transferTasks, "removeAllObjects");
}

- (void)addTransportTask:(id)a3
{
  -[NSMutableArray addObject:](self->_transportTasks, "addObject:", a3);
}

- (void)removeTransportTask:(id)a3
{
  -[NSMutableArray removeObject:](self->_transportTasks, "removeObject:", a3);
}

- (unint64_t)countOfTransportTasks
{
  return -[NSMutableArray count](self->_transportTasks, "count");
}

- (unint64_t)countOfTransferTasksInTransportTasks
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_transportTasks;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "downloadTasks", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dequeueLastTransportTask
{
  void *v3;

  -[NSMutableArray lastObject](self->_transportTasks, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableArray removeLastObject](self->_transportTasks, "removeLastObject");
  return v3;
}

- (id)status
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSMutableArray count](self->_transferTasks, "count");
  v4 = -[NSMutableArray count](self->_transportTasks, "count");
  v5 = -[CPLActiveDownloadQueue countOfTransferTasksInTransportTasks](self, "countOfTransferTasksInTransportTasks");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ queued: %lu - transport: %lu for %lu resources"), self->_name, v3, v4, v5);
  }
  else
  {
    if (!v3)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ queued: %lu"), self->_name, v3, v8, v9);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (BOOL)isHighPriority
{
  return self->_type - 1 < 2;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isFIFOQueue
{
  return self->_FIFOQueue;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (int64_t)coalescingInterval
{
  return self->_coalescingInterval;
}

- (id)groupConstructor
{
  return self->_groupConstructor;
}

- (unint64_t)maximumConcurrentTransportTasks
{
  return self->_maximumConcurrentTransportTasks;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupConstructor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_transportTasks, 0);
  objc_storeStrong((id *)&self->_transferTasks, 0);
}

@end
