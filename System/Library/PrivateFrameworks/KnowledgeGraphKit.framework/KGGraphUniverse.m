@implementation KGGraphUniverse

- (KGGraphUniverse)init
{
  KGGraphUniverse *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *graphManagerByURL;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KGGraphUniverse;
  v2 = -[KGGraphUniverse init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    graphManagerByURL = v2->_graphManagerByURL;
    v2->_graphManagerByURL = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)managerForGraphStoreAtURL:(id)a3 entityFactory:(id)a4
{
  id v6;
  id v7;
  KGGraphManagerRecord *v8;
  KGGraphManagerRecord *v9;
  KGGraphManager *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_graphManagerByURL, "objectForKeyedSubscript:", v6);
  v8 = (KGGraphManagerRecord *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = -[KGGraphManager initWithURL:entityFactory:]([KGGraphManager alloc], "initWithURL:entityFactory:", v6, v7);
    v9 = -[KGGraphManagerRecord initWithGraphManager:]([KGGraphManagerRecord alloc], "initWithGraphManager:", v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_graphManagerByURL, "setObject:forKeyedSubscript:", v9, v6);
    goto LABEL_5;
  }
  v9 = v8;
  -[KGGraphManagerRecord incrementUseCount](v8, "incrementUseCount");
  if (v7)
  {
    -[KGGraphManagerRecord graphManager](v9, "graphManager");
    v10 = (KGGraphManager *)objc_claimAutoreleasedReturnValue();
    -[KGGraphManager setEntityFactory:](v10, "setEntityFactory:", v7);
LABEL_5:

  }
  os_unfair_lock_unlock(&self->_lock);
  -[KGGraphManagerRecord graphManager](v9, "graphManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)releaseManagerForGraphStoreAtURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_graphManagerByURL, "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "decrementUseCount"))
  {
    objc_msgSend(v5, "graphManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "close");

    -[NSMutableDictionary removeObjectForKey:](self->_graphManagerByURL, "removeObjectForKey:", v7);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)hasManagerForGraphStoreAtURL:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_graphManagerByURL, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6 != 0;
}

- (BOOL)swapDatabaseFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[KGGraphUniverse managerForGraphStoreAtURL:entityFactory:](self, "managerForGraphStoreAtURL:entityFactory:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[KGGraphUniverse managerForGraphStoreAtURL:entityFactory:](self, "managerForGraphStoreAtURL:entityFactory:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__1409;
    v24 = __Block_byref_object_dispose__1410;
    v25 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__KGGraphUniverse_swapDatabaseFromURL_toURL_error___block_invoke;
    v16[3] = &unk_1E83E32E8;
    v18 = &v26;
    v13 = v12;
    v17 = v13;
    v19 = &v20;
    objc_msgSend(v11, "performReadBlock:", v16);
    v14 = *((unsigned __int8 *)v27 + 24);
    if (a5 && !*((_BYTE *)v27 + 24))
    {
      *a5 = objc_retainAutorelease((id)v21[5]);
      v14 = *((unsigned __int8 *)v27 + 24);
    }
    v10 = v14 != 0;

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

  }
  return v10;
}

- (void)removeDatabaseByURL:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_graphManagerByURL, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)closeDatabaseAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KGGraphUniverse managerForGraphStoreAtURL:entityFactory:](self, "managerForGraphStoreAtURL:entityFactory:", v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asyncClose:", v6);

  -[KGGraphUniverse removeDatabaseByURL:](self, "removeDatabaseByURL:", v7);
}

- (NSMutableDictionary)graphManagerByURL
{
  return self->_graphManagerByURL;
}

- (void)setGraphManagerByURL:(id)a3
{
  objc_storeStrong((id *)&self->_graphManagerByURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphManagerByURL, 0);
}

BOOL __51__KGGraphUniverse_swapDatabaseFromURL_toURL_error___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  _BOOL8 v10;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = (void *)a1[4];
    v12 = 0;
    v8 = objc_msgSend(v7, "replaceFromGraph:error:", v5, &v12);
    v9 = v12;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v8;
  }
  else if (v6)
  {
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v10 = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v9);
    v10 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) != 0;
  }

  return v10;
}

+ (void)initialize
{
  KGGraphUniverse *v2;
  void *v3;

  v2 = objc_alloc_init(KGGraphUniverse);
  v3 = (void *)_sInstance;
  _sInstance = (uint64_t)v2;

}

+ (id)instance
{
  return (id)_sInstance;
}

+ (id)managerForGraphStoreAtURL:(id)a3 entityFactory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managerForGraphStoreAtURL:entityFactory:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)releaseManagerForGraphStoreAtURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "instance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "releaseManagerForGraphStoreAtURL:", v4);

}

+ (BOOL)hasManagerForGraphStoreAtURL:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "instance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasManagerForGraphStoreAtURL:", v4);

  return v6;
}

+ (BOOL)swapDatabaseFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "instance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "swapDatabaseFromURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

+ (void)closeDatabaseAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "instance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closeDatabaseAtURL:completion:", v7, v6);

}

@end
