@implementation NSSQLCoreDispatchManager

- (uint64_t)routeStoreRequest:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(void **)(result + 16);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v9;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD **)(*((_QWORD *)&v8 + 1) + 8 * v6);
          if (v7 && ((*(uint64_t (**)(void))(v7[2] + 16))() & 1) != 0)
            return objc_msgSend(v7, "handleStoreRequest:", a2);
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)disconnectAllConnections
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v1 = *(void **)(result + 16);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v6;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "disconnectAllConnections");
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_sqlCore = 0;

  v3.receiver = self;
  v3.super_class = (Class)NSSQLCoreDispatchManager;
  -[NSSQLCoreDispatchManager dealloc](&v3, sel_dealloc);
}

- (NSSQLCoreDispatchManager)initWithSQLCore:(id)a3 seedConnection:(id)a4
{
  NSSQLCoreDispatchManager *v6;
  NSSQLCoreDispatchManager *v7;
  uint64_t v8;
  __objc2_class **v9;
  objc_class *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSSQLCoreDispatchManager;
  v6 = -[NSSQLCoreDispatchManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_sqlCore = (NSSQLCore *)a3;
    v6->_connectionManagers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3)
    {
      v8 = objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"));
      v9 = off_1E1EDAD30;
      if (!v8)
        v9 = off_1E1EDACF8;
      v10 = (objc_class *)*v9;
    }
    else
    {
      v10 = (objc_class *)NSSQLDefaultConnectionManager;
    }
    v11 = (void *)objc_msgSend([v10 alloc], "initWithSQLCore:seedConnection:", a3, a4);
    if (v11)
    {
      -[NSMutableArray addObject:](v7->_connectionManagers, "addObject:", v11);

    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (uint64_t)enumerateAvailableConnectionsWithBlock:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = *(void **)(result + 16);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "enumerateAvailableConnectionsWithBlock:", a2);
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[NSMutableArray count](self->_connectionManagers, "count") == 1)
    objc_msgSend((id)-[NSMutableArray firstObject](self->_connectionManagers, "firstObject"), "setExclusiveLockingMode:", v3);
}

- (void)scheduleBarrierBlock:(id)a3
{
  objc_msgSend((id)-[NSMutableArray firstObject](self->_connectionManagers, "firstObject"), "scheduleBarrierBlock:", a3);
}

@end
