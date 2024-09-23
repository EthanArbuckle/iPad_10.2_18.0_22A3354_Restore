@implementation _GCDevicePhysicalInput

- (_GCDevicePhysicalInput)initWithFacade:(id)a3 elements:(id)a4 attributes:(id)a5
{
  void *v9;
  _GCDevicePhysicalInput *v10;
  NSMutableArray *v11;
  const char *v12;
  id v13;
  const char *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  id v18;
  const char *v19;
  id v20;
  _DWORD *v21;
  uint64_t v22;
  objc_super v24;

  v9 = (void *)objc_opt_new();
  v24.receiver = self;
  v24.super_class = (Class)_GCDevicePhysicalInput;
  v10 = -[_GCDevicePhysicalInputBase _initWithFacadeTemplate:elementsTemplates:attributes:context:](&v24, sel__initWithFacadeTemplate_elementsTemplates_attributes_context_, a3, objc_msgSend(a4, "allObjects"), a5, v9);
  v11 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", 2);
  v13 = -[_GCDevicePhysicalInputBase viewConfiguration](v10, v12);
  v15 = -[_GCDevicePhysicalInputBase viewState](v10, v14);
  v16 = +[_GCDevicePhysicalInputTransaction transactionWithImplementation:configuration:state:]((uint64_t)_GCDevicePhysicalInputTransaction, v10, (uint64_t)v13, (uint64_t)v15);
  -[NSMutableArray addObject:](v11, "addObject:", v16);
  v18 = -[_GCDevicePhysicalInputBase viewConfiguration](v10, v17);
  v20 = -[_GCDevicePhysicalInputBase viewState](v10, v19);
  v21 = +[_GCDevicePhysicalInputStateTable stateTableWithCopyOfStateTable:]((uint64_t)_GCDevicePhysicalInputStateTable, (uint64_t)v20);
  v22 = +[_GCDevicePhysicalInputTransaction transactionWithImplementation:configuration:state:]((uint64_t)_GCDevicePhysicalInputTransaction, v10, (uint64_t)v18, (uint64_t)v21);
  -[NSMutableArray addObject:](v11, "addObject:", v22);
  v10->_allTransactions = v11;
  v10->_currentTransaction = (_GCDevicePhysicalInputTransaction *)v16;
  v10->_pendingTransaction = (_GCDevicePhysicalInputTransaction *)v22;
  v10->_bufferedTransactionsQueueDepth = 1;
  v10->_bufferedTransactions = (NSMutableArray *)objc_msgSend(objc_alloc((Class)&off_254DEBB20), "initWithCapacity:", 1);

  return v10;
}

- (_GCDevicePhysicalInput)initWithFacade:(id)a3 elements:(id)a4
{
  return -[_GCDevicePhysicalInput initWithFacade:elements:attributes:](self, "initWithFacade:elements:attributes:", a3, a4, +[NSSet set](&off_254DEBEC0, "set"));
}

- (_GCDevicePhysicalInput)updateWithElements:(_GCDevicePhysicalInput *)result
{
  _GCDevicePhysicalInput *v3;
  _GCDevicePhysicalInputTransaction *pendingTransaction;
  void *v5;
  uint64_t v6;
  const char *v7;
  id v8;
  char *v9;
  _GCDevicePhysicalInputTransaction *currentTransaction;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  _BOOL4 v27;
  _GCDevicePhysicalInputTransaction *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  _BOOL4 v37;
  _GCDevicePhysicalInput *v38;
  uint64_t v39;
  _GCDevicePhysicalInput *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[6];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    pendingTransaction = result->_pendingTransaction;
    v5 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)pendingTransaction);
    v6 = objc_msgSend(v5, "count");
    if (v6 != objc_msgSend(a2, "count"))
      objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateWithElements_, v3, CFSTR("_GCDevicePhysicalInput.m"), 82, CFSTR("*** Update is attempting to add or remove physical input elements.  Current elements: %@, New Elements: %@"), v5, a2);
    v8 = -[_GCDevicePhysicalInputBase viewConfiguration](v3->_pendingTransaction, v7);
    v9 = (char *)+[_GCDevicePhysicalInputStateTable stateTableWithCopyOfStateTable:]((uint64_t)_GCDevicePhysicalInputStateTable, (uint64_t)v8);
    -[_GCDevicePhysicalInputBase setViewConfiguration:](v3->_pendingTransaction, v9);
    objc_sync_enter(v3);
    currentTransaction = v3->_currentTransaction;
    v40 = v3;
    objc_sync_exit(v3);
    -[_GCDevicePhysicalInputTransaction lastEventTimestamp](currentTransaction, "lastEventTimestamp");
    -[_GCDevicePhysicalInputTransaction setLastEventTimestamp:]((uint64_t)pendingTransaction, v11);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v5);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v18 = objc_msgSend(a2, "member:", objc_msgSend(v17, "identifier"));
          if (!v18)
            objc_msgSend((id)unk_254DEC4F8(&off_254DEC660, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateWithElements_, v40, CFSTR("_GCDevicePhysicalInput.m"), 93, CFSTR("*** Update is attempting to add or remove physical input elements.  Current elements: %@, New Elements: %@"), v5, a2);
          v50[0] = MEMORY[0x24BDAC760];
          v50[1] = 3221225472;
          v50[2] = __45___GCDevicePhysicalInput_updateWithElements___block_invoke;
          v50[3] = &unk_24D2B5658;
          v50[4] = v17;
          v50[5] = v18;
          -[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:]((uint64_t)pendingTransaction, v14 + i, (uint64_t)v50);
        }
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        v14 += i;
      }
      while (v13);
    }
    v19 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)v40);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          v45 = 0;
          v26 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](pendingTransaction, v22 + j, &v45, 1);
          if (v26)
            objc_msgSend(v25, "preCommit:sender:", v26, v40);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        v22 += j;
      }
      while (v21);
    }
    v27 = -[_GCDevicePhysicalInput _commitTransaction:](v40, 1);
    objc_sync_enter(v40);
    v28 = v40->_currentTransaction;
    objc_sync_exit(v40);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v29)
    {
      v31 = v29;
      v32 = 0;
      v33 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v19);
          v35 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
          v45 = 0;
          v36 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](v28, v32 + k, &v45, 1);
          if (v36)
            objc_msgSend(v35, "postCommit:sender:", v36, v40);
        }
        v31 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        v32 += k;
      }
      while (v31);
    }
    result = (_GCDevicePhysicalInput *)objc_getProperty(v40, v30, 120, 1);
    if (result)
      v37 = v27;
    else
      v37 = 0;
    if (v37)
    {
      v38 = result;
      v39 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v40);
      return (_GCDevicePhysicalInput *)((uint64_t (*)(_GCDevicePhysicalInput *, uint64_t))v38->super._dataSource)(v38, v39);
    }
  }
  return result;
}

- (uint64_t)currentTransaction
{
  uint64_t v2;

  if (!a1)
    return 0;
  objc_sync_enter(a1);
  v2 = a1[17];
  objc_sync_exit(a1);
  return v2;
}

- (BOOL)_commitTransaction:(_GCDevicePhysicalInput *)a1
{
  const char *v4;
  char *v5;
  NSMutableArray *allTransactions;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _GCDevicePhysicalInputTransaction *pendingTransaction;
  id v13;
  const char *v14;
  id v15;
  _BOOL8 v16;
  char *v18;
  id v19;
  const char *v20;
  id v21;
  _DWORD *v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  objc_sync_enter(a1);
  if (a2)
  {
    v18 = (char *)-[_GCDevicePhysicalInputBase viewConfiguration](a1->_pendingTransaction, v4);
    -[_GCDevicePhysicalInputBase setViewConfiguration:](a1, v18);
  }
  v5 = (char *)-[_GCDevicePhysicalInputBase viewState](a1->_pendingTransaction, v4);
  -[_GCDevicePhysicalInputBase setViewState:](a1, v5);
  objc_storeStrong((id *)&a1->_currentTransaction, a1->_pendingTransaction);
  objc_storeStrong((id *)&a1->_pendingTransaction, 0);
  -[NSMutableArray addObject:](a1->_bufferedTransactions, "addObject:", a1->_currentTransaction);
  while (-[NSMutableArray count](a1->_bufferedTransactions, "count") > a1->_bufferedTransactionsQueueDepth)
  {
    -[NSMutableArray removeObjectAtIndex:](a1->_bufferedTransactions, "removeObjectAtIndex:", 0);
    -[_GCDevicePhysicalInputTransaction invalidateAllUpdateContexts](-[NSMutableArray firstObject](a1->_bufferedTransactions, "firstObject"));
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  allTransactions = a1->_allTransactions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allTransactions, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(allTransactions);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v11, "retainCount") == 1)
        {
          objc_storeStrong((id *)&a1->_pendingTransaction, v11);
          goto LABEL_17;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allTransactions, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_17:
  pendingTransaction = a1->_pendingTransaction;
  if (pendingTransaction)
  {
    if (a2)
    {
      v24 = (char *)-[_GCDevicePhysicalInputBase viewConfiguration](a1, v7);
      -[_GCDevicePhysicalInputBase setViewConfiguration:](a1->_pendingTransaction, v24);
      pendingTransaction = a1->_pendingTransaction;
    }
    v13 = -[_GCDevicePhysicalInputBase viewState](pendingTransaction, v7);
    v15 = -[_GCDevicePhysicalInputBase viewState](a1->_currentTransaction, v14);
    -[_GCDevicePhysicalInputStateTable updateStateTableWithContentsOf:]((uint64_t)v13, (uint64_t)v15);
  }
  else
  {
    v19 = -[_GCDevicePhysicalInputBase viewConfiguration](a1, v7);
    v21 = -[_GCDevicePhysicalInputBase viewState](a1, v20);
    v22 = +[_GCDevicePhysicalInputStateTable stateTableWithCopyOfStateTable:]((uint64_t)_GCDevicePhysicalInputStateTable, (uint64_t)v21);
    v23 = +[_GCDevicePhysicalInputTransaction transactionWithImplementation:configuration:state:]((uint64_t)_GCDevicePhysicalInputTransaction, a1, (uint64_t)v19, (uint64_t)v22);
    -[NSMutableArray addObject:](a1->_allTransactions, "addObject:", v23);
    a1->_pendingTransaction = (_GCDevicePhysicalInputTransaction *)v23;
  }
  v16 = -[NSMutableArray count](a1->_bufferedTransactions, "count") == 1;
  objc_sync_exit(a1);
  return v16;
}

- (id)inputStateAvailableHandler
{
  if (result)
    return objc_getProperty(result, a2, 120, 1);
  return result;
}

- (void)dealloc
{
  NSMutableArray **p_allTransactions;
  NSMutableArray *allTransactions;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  p_allTransactions = &self->_allTransactions;
  allTransactions = self->_allTransactions;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allTransactions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(allTransactions);
        -[_GCDevicePhysicalInputTransaction detach](*(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allTransactions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  objc_storeStrong((id *)&self->_pendingTransaction, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  -[NSMutableArray removeAllObjects](self->_bufferedTransactions, "removeAllObjects");
  objc_storeStrong((id *)&self->_bufferedTransactions, 0);
  -[NSMutableArray removeAllObjects](*p_allTransactions, "removeAllObjects");
  objc_storeStrong((id *)p_allTransactions, 0);

  self->_inputStateAvailableHandler = 0;
  self->_elementValueDidChangeHandler = 0;
  objc_setAssociatedObject(self, (const void *)GCDevicePhysicalInputQueueKey, 0, (void *)0x301);
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInput;
  -[_GCDevicePhysicalInputBase dealloc](&v9, sel_dealloc);
}

- (void)setDevice:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInput;
  -[_GCDevicePhysicalInputBase setDevice:](&v5, sel_setDevice_);
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_allTransactions, "makeObjectsPerformSelector:withObject:", sel_setDevice_, a3);
}

- (void)setDataSource:(id)a3
{
  objc_super v5;

  if (!a3 && -[_GCDevicePhysicalInputBase dataSource](self, "dataSource"))
    objc_setAssociatedObject(self, (const void *)GCDevicePhysicalInputQueueKey, (id)objc_msgSend(0, "physicalInputQueue:", self), (void *)0x301);
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInput;
  -[_GCDevicePhysicalInputBase setDataSource:](&v5, sel_setDataSource_, a3);
}

- (id)queue
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(result, "dataSource");
    if (v2)
      return (id)objc_msgSend(v2, "physicalInputQueue:", v1);
    else
      return objc_getAssociatedObject(v1, (const void *)GCDevicePhysicalInputQueueKey);
  }
  return result;
}

- (void)setQueue:(void *)result
{
  void *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(result, "dataSource");
    if (v4)
    {
      return (void *)objc_msgSend(v4, "physicalInput:setQueue:", v3, a2);
    }
    else
    {
      objc_msgSend((id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v3), "willChangeValueForKey:", CFSTR("queue"));
      objc_setAssociatedObject(v3, (const void *)GCDevicePhysicalInputQueueKey, a2, (void *)0x301);
      return (void *)objc_msgSend((id)-[_GCDevicePhysicalInputBase facade]((uint64_t)v3), "didChangeValueForKey:", CFSTR("queue"));
    }
  }
  return result;
}

- (uint64_t)transactionQueueDepth
{
  uint64_t v2;

  if (!a1)
    return 0;
  objc_sync_enter(a1);
  v2 = a1[20];
  objc_sync_exit(a1);
  return v2;
}

- (_QWORD)setTransactionQueueDepth:(_QWORD *)result
{
  _QWORD *v2;
  uint64_t v3;

  if (result)
  {
    v2 = result;
    if (a2 <= 1)
      v3 = 1;
    else
      v3 = a2;
    objc_sync_enter(result);
    if (v3 != v2[20])
      v2[20] = v3;
    objc_sync_exit(v2);
    return (_QWORD *)objc_msgSend((id)objc_msgSend(v2, "dataSource"), "physicalInputTransactionQueueDepthDidChange:", v2);
  }
  return result;
}

- (uint64_t)pendingTransaction
{
  uint64_t v2;

  if (!a1)
    return 0;
  objc_sync_enter(a1);
  v2 = a1[18];
  objc_sync_exit(a1);
  return v2;
}

- (id)popTransaction
{
  void *v3;
  id v4;

  -[_GCDevicePhysicalInputDataSource physicalInputPoll:forLatest:](-[_GCDevicePhysicalInputBase dataSource](self, "dataSource"), "physicalInputPoll:forLatest:", self, 0);
  objc_sync_enter(self);
  v3 = (void *)-[NSMutableArray firstObject](self->_bufferedTransactions, "firstObject");
  if (v3)
  {
    v4 = v3;
    -[NSMutableArray removeObjectAtIndex:](self->_bufferedTransactions, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(self);
  return v4;
}

- (void)updateViewStateIfNeeded
{
  -[_GCDevicePhysicalInputDataSource physicalInputPoll:forLatest:](-[_GCDevicePhysicalInputBase dataSource](self, "dataSource"), "physicalInputPoll:forLatest:", self, 1);
}

- (BOOL)isSnapshot
{
  return 0;
}

- (double)lastEventTimestamp
{
  double result;

  -[_GCDevicePhysicalInput updateViewStateIfNeeded](self, "updateViewStateIfNeeded");
  objc_msgSend((id)-[_GCDevicePhysicalInput currentTransaction](self), "lastEventTimestamp");
  return result;
}

- (id)elementValueDidChangeHandler
{
  if (result)
    return objc_getProperty(result, a2, 112, 1);
  return result;
}

- (void)setElementValueDidChangeHandler:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 112);
}

- (void)setInputStateAvailableHandler:(void *)a1
{
  if (a1)
    objc_setProperty_atomic_copy(a1, newValue, newValue, 120);
}

- (_GCDevicePhysicalInput)_handleEventTransaction:(_GCDevicePhysicalInput *)result
{
  _GCDevicePhysicalInput *v2;
  unsigned __int8 *p_isHandlingEvent;
  _GCDevicePhysicalInputTransaction *pendingTransaction;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  _GCDevicePhysicalInputTransaction *currentTransaction;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  SEL v28;
  void (**Property)(id, uint64_t, _QWORD);
  const char *v30;
  void (**v31)(id, uint64_t, _QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  _GCDevicePhysicalInput *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v2 = result;
    p_isHandlingEvent = (unsigned __int8 *)&result->_isHandlingEvent;
    do
    {
      if (__ldaxr(p_isHandlingEvent))
      {
        __clrex();
        -[_GCDevicePhysicalInput _handleEventTransaction:].cold.1();
      }
    }
    while (__stlxr(1u, p_isHandlingEvent));
    pendingTransaction = result->_pendingTransaction;
    v6 = (*(double (**)(uint64_t, _GCDevicePhysicalInputTransaction *))(a2 + 16))(a2, pendingTransaction);
    -[_GCDevicePhysicalInputTransaction setLastEventTimestamp:]((uint64_t)pendingTransaction, v6);
    v7 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)v2);
    v8 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](v8, CFSTR("lastEventTimestamp"));
    v9 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](v9, CFSTR("lastEventLatency"));
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v7);
          v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v50 = 0;
          v16 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](pendingTransaction, v12 + i, &v50, 1);
          if (v16)
            objc_msgSend(v15, "preCommit:sender:", v16, v2);
        }
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        v12 += i;
      }
      while (v11);
    }
    v17 = -[_GCDevicePhysicalInput _commitTransaction:](v2, 0);
    objc_sync_enter(v2);
    currentTransaction = v2->_currentTransaction;
    objc_sync_exit(v2);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v7);
          v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          v50 = 0;
          v25 = -[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](currentTransaction, v21 + j, &v50, 1);
          if (v25)
            objc_msgSend(v24, "postCommit:sender:", v25, v2);
        }
        v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        v21 += j;
      }
      while (v20);
    }
    v26 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](v26, CFSTR("lastEventLatency"));
    v27 = (void *)-[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](v27, CFSTR("lastEventTimestamp"));
    Property = (void (**)(id, uint64_t, _QWORD))objc_getProperty(v2, v28, 112, 1);
    if (Property)
    {
      v31 = Property;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v32 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      if (v32)
      {
        v33 = v32;
        v34 = 0;
        v35 = *(_QWORD *)v43;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v43 != v35)
              objc_enumerationMutation(v7);
            v37 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k);
            if (-[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](currentTransaction, v34 + k, 0, 1))
            {
              v38 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
              v31[2](v31, v38, v37);
            }
          }
          v33 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
          v34 += k;
        }
        while (v33);
      }
    }
    result = (_GCDevicePhysicalInput *)objc_getProperty(v2, v30, 120, 1);
    if (result)
      v39 = v17;
    else
      v39 = 0;
    if (v39)
    {
      v40 = result;
      v41 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v2);
      result = (_GCDevicePhysicalInput *)((uint64_t (*)(_GCDevicePhysicalInput *, uint64_t))v40->super._dataSource)(v40, v41);
    }
    atomic_store(0, (unsigned __int8 *)&v2->_isHandlingEvent);
  }
  return result;
}

- (uint64_t)handleGamepadEvent:(uint64_t)result
{
  _GCDevicePhysicalInput *v3;
  _QWORD v4[5];

  if (result)
  {
    v3 = (_GCDevicePhysicalInput *)result;
    objc_msgSend(a2, "timestamp");
    objc_msgSend((id)-[_GCDevicePhysicalInputBase attributes]((uint64_t)v3), "count");
    kdebug_trace();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __60___GCDevicePhysicalInput_EventHandling__handleGamepadEvent___block_invoke;
    v4[3] = &unk_24D2B56A8;
    v4[4] = a2;
    -[_GCDevicePhysicalInput _handleEventTransaction:](v3, (uint64_t)v4);
    objc_msgSend(a2, "timestamp");
    objc_msgSend((id)-[_GCDevicePhysicalInputBase attributes]((uint64_t)v3), "count");
    return kdebug_trace();
  }
  return result;
}

- (_GCDevicePhysicalInput)handleMouseEvent:(_GCDevicePhysicalInput *)result
{
  _QWORD v2[4];
  __int128 v3;
  uint64_t v4;

  if (result)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __58___GCDevicePhysicalInput_EventHandling__handleMouseEvent___block_invoke;
    v2[3] = &__block_descriptor_56_e43_d16__0___GCDevicePhysicalInputTransaction_8l;
    v3 = *a2;
    v4 = *((_QWORD *)a2 + 2);
    return -[_GCDevicePhysicalInput _handleEventTransaction:](result, (uint64_t)v2);
  }
  return result;
}

- (void)_handleEventTransaction:.cold.1()
{
  qword_254DBDE78 = (uint64_t)"BUG IN _GCDevicePhysicalInput: -handleEvent called recursively.";
  __break(1u);
}

@end
