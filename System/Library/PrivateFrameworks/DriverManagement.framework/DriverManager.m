@implementation DriverManager

- (DriverManager)initWithSwiftManager:(id)a3
{
  id v5;
  DriverManager *v6;
  DriverManager *v7;
  uint64_t v8;
  NSMutableArray *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DriverManager;
  v6 = -[DriverManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_swiftManager, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;

  }
  return v7;
}

+ (id)sharedManager
{
  DriverManager *v2;
  void *v3;
  DriverManager *v4;

  v2 = [DriverManager alloc];
  +[_SwiftDriverManager sharedManager](_SwiftDriverManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DriverManager initWithSwiftManager:](v2, "initWithSwiftManager:", v3);

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  ProxyDriverManagerObserver *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ProxyDriverManagerObserver initWithObserver:]([ProxyDriverManagerObserver alloc], "initWithObserver:", v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (*(id *)(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 8) == v4)
        {

          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[_SwiftDriverManager addObserver:](self->_swiftManager, "addObserver:", v5, (_QWORD)v11);
  -[NSMutableArray addObject:](self->_observers, "addObject:", v5);
LABEL_11:

}

- (void)removeObserver:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableArray count](self->_observers, "count"))
  {
    v4 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->_observers, "objectAtIndex:", v4);
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if ((id)v5[1] == v6)
        break;

      if (++v4 >= (unint64_t)-[NSMutableArray count](self->_observers, "count"))
        goto LABEL_7;
    }
    -[NSMutableArray removeObjectAtIndex:](self->_observers, "removeObjectAtIndex:", v4);
    -[_SwiftDriverManager removeObserver:](self->_swiftManager, "removeObserver:", v5);

  }
LABEL_7:

}

- (int64_t)driverCount
{
  return -[_SwiftDriverManager driverCount](self->_swiftManager, "driverCount");
}

- (int64_t)thirdPartyDriverCount
{
  return -[_SwiftDriverManager thirdPartyDriverCount](self->_swiftManager, "thirdPartyDriverCount");
}

- (int64_t)driverCountForAppID:(id)a3
{
  return -[_SwiftDriverManager driverCountForAppID:](self->_swiftManager, "driverCountForAppID:", a3);
}

- (void)refresh
{
  -[_SwiftDriverManager refresh](self->_swiftManager, "refresh");
}

- (void)setDriverState:(id)a3 approved:(BOOL)a4
{
  -[_SwiftDriverManager setDriverState:approved:](self->_swiftManager, "setDriverState:approved:", *((_QWORD *)a3 + 1), a4);
}

- (id)driverApprovalStatesForThirdPartyApp:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DriverApprovalState *v11;
  DriverApprovalState *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[_SwiftDriverManager driverApprovalStatesForThirdPartyApp:](self->_swiftManager, "driverApprovalStatesForThirdPartyApp:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [DriverApprovalState alloc];
        v12 = -[DriverApprovalState initWithSwiftDriverApprovalState:](v11, "initWithSwiftDriverApprovalState:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_swiftManager, 0);
}

@end
