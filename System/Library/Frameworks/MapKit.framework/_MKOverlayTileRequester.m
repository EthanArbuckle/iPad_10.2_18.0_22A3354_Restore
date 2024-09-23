@implementation _MKOverlayTileRequester

+ (unsigned)tileProviderIdentifier
{
  return *MEMORY[0x1E0D26AB0];
}

+ (unsigned)registerDataSource:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  unsigned int v6;
  uint64_t **v7;
  unsigned int v9;

  v3 = a3;
  if (qword_1EDFB7CD0 != -1)
    dispatch_once(&qword_1EDFB7CD0, &__block_literal_global_79_0);
  v4 = qword_1EDFB7CC8;
  v5 = v3;
  std::mutex::lock((std::mutex *)(v4 + 24));
  v6 = *(_DWORD *)(v4 + 88) + 1;
  *(_DWORD *)(v4 + 88) = v6;
  v9 = v6;
  v7 = std::__tree<std::__value_type<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>,std::__map_value_compare<unsigned int,objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak},std::less<unsigned int>,true>,std::allocator<objc_object  {objcproto24_MKOverlayTileDataSource}* {__weak}>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::piecewise_construct_t const&<>>((uint64_t **)v4, v6, &v9);
  objc_storeWeak((id *)v7 + 5, v5);
  std::mutex::unlock((std::mutex *)(v4 + 24));

  return v6;
}

+ (void)unregisterDataSource:(unsigned int)a3
{
  _QWORD *v4;
  std::mutex *v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  BOOL v15;

  if (qword_1EDFB7CD0 != -1)
    dispatch_once(&qword_1EDFB7CD0, &__block_literal_global_79_0);
  v4 = (_QWORD *)qword_1EDFB7CC8;
  v5 = (std::mutex *)(qword_1EDFB7CC8 + 24);
  std::mutex::lock((std::mutex *)(qword_1EDFB7CC8 + 24));
  v6 = (uint64_t *)v4[1];
  if (v6)
  {
    v7 = v4 + 1;
    v8 = v4[1];
    do
    {
      v9 = *(_DWORD *)(v8 + 32);
      v10 = v9 >= a3;
      if (v9 >= a3)
        v11 = (uint64_t *)v8;
      else
        v11 = (uint64_t *)(v8 + 8);
      if (v10)
        v7 = (_QWORD *)v8;
      v8 = *v11;
    }
    while (*v11);
    if (v7 != v4 + 1 && *((_DWORD *)v7 + 8) <= a3)
    {
      v12 = (_QWORD *)v7[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        v14 = v7;
        do
        {
          v13 = (_QWORD *)v14[2];
          v15 = *v13 == (_QWORD)v14;
          v14 = v13;
        }
        while (!v15);
      }
      if ((_QWORD *)*v4 == v7)
        *v4 = v13;
      --v4[2];
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, v7);
      objc_destroyWeak((id *)v7 + 5);
      operator delete(v7);
    }
  }
  std::mutex::unlock(v5);
}

- (_MKOverlayTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  _MKOverlayTileRequester *v5;
  id v6;
  uint64_t v7;
  OS_dispatch_queue *workQueue;
  _MKOverlayTileRequester *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MKOverlayTileRequester;
  v5 = -[GEOTileRequester initWithTileRequest:delegateQueue:delegate:](&v11, sel_initWithTileRequest_delegateQueue_delegate_, a3, a4, a5);
  if (v5)
  {
    if (qword_1EDFB7CE0 != -1)
      dispatch_once(&qword_1EDFB7CE0, &__block_literal_global_80);
    v6 = (id)qword_1EDFB7CD8;
    v7 = geo_dispatch_queue_create_with_target();
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)_doWorkOrFinish
{
  void *v3;
  NSMutableSet *running;
  NSObject *v5;
  _QWORD block[5];

  if (qword_1EDFB7CC0 != -1)
    dispatch_once(&qword_1EDFB7CC0, &__block_literal_global_2);
  while (-[NSMutableArray count](self->_waiting, "count"))
  {
    if (_MergedGlobals_4 && (unint64_t)-[NSMutableSet count](self->_running, "count") > 3)
      break;
    -[NSMutableArray lastObject](self->_waiting, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](self->_running, "addObject:", v3);
    -[NSMutableArray removeLastObject](self->_waiting, "removeLastObject");
    objc_msgSend(v3, "start");

  }
  running = self->_running;
  if (running)
  {
    if (!-[NSMutableSet count](running, "count"))
    {
      -[GEOTileRequester delegateQueue](self, "delegateQueue");
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42___MKOverlayTileRequester__doWorkOrFinish__block_invoke_2;
      block[3] = &unk_1E20DA4A0;
      block[4] = self;
      dispatch_async(v5, block);

      -[_MKOverlayTileRequester _cleanup](self, "_cleanup");
    }
  }
}

- (void)_cleanup
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  NSMutableSet *running;
  NSMutableArray *waiting;
  NSMutableArray *errors;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_running;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "cancel");
        objc_msgSend(v7, "setDelegate:", 0);
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_waiting;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "setDelegate:", 0, (_QWORD)v15);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v9);
  }

  running = self->_running;
  self->_running = 0;

  waiting = self->_waiting;
  self->_waiting = 0;

  errors = self->_errors;
  self->_errors = 0;

}

- (void)_operationFinished:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  _MKOverlayTileRequester *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_cancelled)
  {
    -[NSMutableSet removeObject:](self->_running, "removeObject:", v4);
    v5 = objc_msgSend(v4, "key");
    v7 = v6;
    -[GEOTileRequester delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46___MKOverlayTileRequester__operationFinished___block_invoke;
    block[3] = &unk_1E20DF010;
    v10 = v4;
    v11 = self;
    v12 = v5;
    v13 = v7;
    dispatch_async(v8, block);

    -[_MKOverlayTileRequester _doWorkOrFinish](self, "_doWorkOrFinish");
  }

}

- (void)_operationFailed:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *errors;
  NSMutableArray *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!self->_cancelled)
  {
    if (v7)
    {
      errors = self->_errors;
      if (!errors)
      {
        v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = self->_errors;
        self->_errors = v10;

        errors = self->_errors;
      }
      -[NSMutableArray addObject:](errors, "addObject:", v8);
    }
    -[NSMutableSet removeObject:](self->_running, "removeObject:", v6);
    v12 = objc_msgSend(v6, "key");
    v14 = v13;
    -[GEOTileRequester delegateQueue](self, "delegateQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50___MKOverlayTileRequester__operationFailed_error___block_invoke;
    block[3] = &unk_1E20DF010;
    block[4] = self;
    v17 = v8;
    v18 = v12;
    v19 = v14;
    dispatch_async(v15, block);

    -[_MKOverlayTileRequester _doWorkOrFinish](self, "_doWorkOrFinish");
  }

}

- (void)start
{
  NSObject *workQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MKOverlayTileRequester;
  -[GEOTileRequester start](&v5, sel_start);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___MKOverlayTileRequester_start__block_invoke;
  block[3] = &unk_1E20DA4A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_startOnWorkQueue
{
  id v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *waiting;
  NSMutableSet *v8;
  NSMutableSet *running;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  MKTileOverlayRequesterOp *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[GEOTileRequester tileRequest](self, "tileRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));
  waiting = self->_waiting;
  self->_waiting = v6;

  v8 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 4);
  running = self->_running;
  self->_running = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[GEOTileRequester tileRequest](self, "tileRequest", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16 = objc_alloc_init(MKTileOverlayRequesterOp);
        -[MKTileOverlayRequesterOp setKey:](v16, "setKey:", *v15, v15[1]);
        -[MKTileOverlayRequesterOp setDelegate:](v16, "setDelegate:", self);
        -[MKTileOverlayRequesterOp setDelegateQueue:](v16, "setDelegateQueue:", self->_workQueue);
        -[NSMutableArray insertObject:atIndex:](self->_waiting, "insertObject:atIndex:", v16, 0);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  -[_MKOverlayTileRequester _doWorkOrFinish](self, "_doWorkOrFinish");
}

- (BOOL)isRunning
{
  NSObject *workQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36___MKOverlayTileRequester_isRunning__block_invoke;
  v5[3] = &unk_1E20DF038;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33___MKOverlayTileRequester_cancel__block_invoke;
  block[3] = &unk_1E20DA4A0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)cancelKey:(__int128 *)a3
{
  NSObject *v3;
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(NSObject **)(a1 + 96);
  v5 = *a3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37___MKOverlayTileRequester_cancelKey___block_invoke;
  v4[3] = &unk_1E20DF060;
  v4[4] = a1;
  dispatch_async(v3, v4);
}

- (void)dealloc
{
  objc_super v3;

  -[_MKOverlayTileRequester _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)_MKOverlayTileRequester;
  -[_MKOverlayTileRequester dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_running, 0);
  objc_storeStrong((id *)&self->_waiting, 0);
}

@end
