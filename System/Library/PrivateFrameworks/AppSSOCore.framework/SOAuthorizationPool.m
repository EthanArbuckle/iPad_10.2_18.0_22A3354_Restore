@implementation SOAuthorizationPool

- (SOAuthorizationPool)init
{
  SOAuthorizationPool *v2;
  uint64_t v3;
  NSMutableArray *pool;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SOAuthorizationPool;
  v2 = -[SOAuthorizationPool init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    pool = v2->_pool;
    v2->_pool = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addAuthorization:(id)a3 delegate:(id)a4
{
  id v6;
  SOAuthorizationPool *v7;
  SOAuthorizationPoolItem *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  objc_msgSend(v9, "setDelegate:", v6);
  v8 = -[SOAuthorizationPoolItem initWithAuthorization:delegate:]([SOAuthorizationPoolItem alloc], "initWithAuthorization:delegate:", v9, v6);
  -[NSMutableArray addObject:](v7->_pool, "addObject:", v8);

  objc_sync_exit(v7);
}

- (void)removeAuthorization:(id)a3
{
  id v4;
  SOAuthorizationPool *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5->_pool;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "authorization", (_QWORD)v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v11 == v4;

        if (v12)
        {
          v13 = v10;

          if (v13)
            -[NSMutableArray removeObject:](v5->_pool, "removeObject:", v13);
          goto LABEL_12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

  v13 = 0;
LABEL_12:

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pool, 0);
}

@end
