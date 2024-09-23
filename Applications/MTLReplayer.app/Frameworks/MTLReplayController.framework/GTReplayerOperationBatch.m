@implementation GTReplayerOperationBatch

- (GTReplayerOperationBatch)initWithRequestID:(unint64_t)a3
{
  GTReplayerOperationBatch *v4;
  GTReplayerOperationBatch *v5;
  NSMutableArray *v6;
  NSMutableArray *operations;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GTReplayerOperationBatch;
  v4 = -[GTReplayerOperationBatch init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_uuid = a3;
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 16);
    operations = v5->_operations;
    v5->_operations = v6;

    GTCoreOperationControl_addOperation(a3);
  }
  return v5;
}

- (void)addOperation:(id)a3
{
  -[NSMutableArray addObject:](self->_operations, "addObject:", a3);
}

- (void)flush:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_operations;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addOperation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
  }

}

- (void)finish:(id)a3
{
  id v4;
  void *v5;
  unint64_t uuid;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];

  v4 = a3;
  if (-[NSMutableArray count](self->_operations, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_operations, "lastObject"));
    uuid = self->_uuid;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __35__GTReplayerOperationBatch_finish___block_invoke;
    v16[3] = &__block_descriptor_40_e5_v8__0l;
    v16[4] = uuid;
    objc_msgSend(v5, "setCompletionBlock:", v16);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_operations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "addOperation:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), (_QWORD)v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }

    -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
  }
  else
  {
    GTCoreOperationControl_removeOperation(self->_uuid);
  }

}

- (unint64_t)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
}

uint64_t __35__GTReplayerOperationBatch_finish___block_invoke(uint64_t a1)
{
  return GTCoreOperationControl_removeOperation(*(_QWORD *)(a1 + 32));
}

@end
