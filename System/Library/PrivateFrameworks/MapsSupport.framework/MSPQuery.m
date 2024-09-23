@implementation MSPQuery

- (id)_initWithSource:(id)a3
{
  id v5;
  MSPQuery *v6;
  MSPQuery *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *changeHandlerQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSPQuery;
  v6 = -[MSPQuery init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.MSPQuery.SerialQueue", v8);
    changeHandlerQueue = v7->_changeHandlerQueue;
    v7->_changeHandlerQueue = (OS_dispatch_queue *)v9;

    -[MSPQuerySource _addObserver:](v7->_source, "_addObserver:", v7);
  }

  return v7;
}

- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5
{
  id v7;
  id v8;
  MSPQuery *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_changeHandlerQueue;
  v11 = (void *)MEMORY[0x1B5E2B4E8](v9->_changeHandler);
  objc_sync_exit(v9);

  if (v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__MSPQuery__didChangeSourceWithNewState_context_inContainer___block_invoke;
    v12[3] = &unk_1E6653850;
    v12[4] = v9;
    v13 = v7;
    v15 = v11;
    v14 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    -[MSPQuery _setLastState:](v9, "_setLastState:", v7);
  }

}

void __61__MSPQuery__didChangeSourceWithNewState_context_inContainer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "_setLastState:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_sync_exit(obj);

}

- (_MSPQueryState)_lastState
{
  MSPQuery *v2;
  _MSPQueryState *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastState;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setLastState:(id)a3
{
  _MSPQueryState *v4;
  _MSPQueryState *lastState;
  MSPQuery *obj;

  v4 = (_MSPQueryState *)a3;
  obj = self;
  objc_sync_enter(obj);
  lastState = obj->_lastState;
  obj->_lastState = v4;

  objc_sync_exit(obj);
}

- (NSArray)contents
{
  void *v2;
  void *v3;

  -[MSPQuery _visibleState](self, "_visibleState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)originalIdentifierForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[MSPQuery _visibleState](self, "_visibleState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "contents"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "indexOfObject:", v4),
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v6, "identifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)originalIdentifierForObjectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MSPQuery _visibleState](self, "_visibleState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setChangeHandler:(id)a3 queue:(id)a4
{
  id v6;
  dispatch_queue_t v7;
  MSPQuery *v8;
  uint64_t v9;
  id changeHandler;
  NSObject *v11;
  OS_dispatch_queue *changeHandlerQueue;
  _QWORD v13[5];
  OS_dispatch_queue *v14;

  v6 = a3;
  v7 = (dispatch_queue_t)a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_msgSend(v6, "copy");
  changeHandler = v8->_changeHandler;
  v8->_changeHandler = (id)v9;

  if (!v6)
  {
    changeHandlerQueue = v8->_changeHandlerQueue;
    v8->_changeHandlerQueue = 0;
    goto LABEL_7;
  }
  if (!v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.MSPQuery.SerialQueue", v11);

  }
  objc_storeStrong((id *)&v8->_changeHandlerQueue, v7);
  if (v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35__MSPQuery_setChangeHandler_queue___block_invoke;
    v13[3] = &unk_1E6653330;
    v13[4] = v8;
    v14 = (OS_dispatch_queue *)v6;
    dispatch_async(v7, v13);
    changeHandlerQueue = v14;
LABEL_7:

  }
  objc_sync_exit(v8);

}

uint64_t __35__MSPQuery_setChangeHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (OS_dispatch_queue)changeHandlerQueue
{
  return self->_changeHandlerQueue;
}

- (NSArray)unmappedContents
{
  return self->_unmappedContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmappedContents, 0);
  objc_storeStrong((id *)&self->_changeHandlerQueue, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_lastState, 0);
}

@end
