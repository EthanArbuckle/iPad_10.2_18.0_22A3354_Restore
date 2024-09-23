@implementation GTObservableService

- (GTObservableService)init
{
  GTObservableService *v2;
  uint64_t v3;
  NSMutableDictionary *observerIdToObserver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTObservableService;
  v2 = -[GTObservableService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    observerIdToObserver = v2->_observerIdToObserver;
    v2->_observerIdToObserver = (NSMutableDictionary *)v3;

    v2->_nextObserverId = 1;
  }
  return v2;
}

- (unint64_t)registerObserver:(id)a3
{
  unint64_t nextObserverId;
  NSMutableDictionary *observerIdToObserver;
  void *v5;
  id v6;
  void *v7;

  observerIdToObserver = self->_observerIdToObserver;
  nextObserverId = self->_nextObserverId;
  self->_nextObserverId = nextObserverId + 1;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", nextObserverId);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](observerIdToObserver, "setObject:forKeyedSubscript:", v6, v7);

  return nextObserverId;
}

- (void)deregisterObserver:(unint64_t)a3
{
  NSMutableDictionary *observerIdToObserver;
  id v4;

  observerIdToObserver = self->_observerIdToObserver;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](observerIdToObserver, "removeObjectForKey:", v4);

}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  NSMutableDictionary *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = a4;
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v8 = -[NSMutableDictionary count](self->_observerIdToObserver, "count");
  v9 = v7;
  v10 = v6;
  v27 = (void *)objc_msgSend(v9, "initWithCapacity:", v8);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_observerIdToObserver;
  v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  v29 = v6;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_observerIdToObserver, "objectForKeyedSubscript:", v15, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "connection");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "connection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "connection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v19)
        {
          objc_msgSend(v16, "replyPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = MessagePathEndsWith(v20, v28);

          v10 = v29;
          if (v21)
            objc_msgSend(v27, "addObject:", v15);
        }
        else
        {

        }
      }
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v12);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v27;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        -[GTObservableService deregisterObserver:](self, "deregisterObserver:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "unsignedLongValue", v27));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

}

- (void)notifyAll:(id)a3
{
  void (**v4)(id, void *);
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observerIdToObserver;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_observerIdToObserver, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_observerIdToObserver, "count");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdToObserver, 0);
}

@end
