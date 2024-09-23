@implementation COStateObserver

- (COStateObserver)initWithDispatchQueue:(id)a3 predicate:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  COStateObserver *v12;
  COStateObserver *v13;
  uint64_t v14;
  id block;
  uint64_t v16;
  NSMutableDictionary *lastChanges;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)COStateObserver;
  v12 = -[COStateObserver init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dispatchQueue, a3);
    v14 = MEMORY[0x212BE9A2C](v11);
    block = v13->_block;
    v13->_block = (id)v14;

    objc_storeStrong((id *)&v13->_predicate, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    lastChanges = v13->_lastChanges;
    v13->_lastChanges = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COStateObserver predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<COStateObserver: %p Predicate: %@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)notify:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[COStateObserver dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__COStateObserver_notify___block_invoke;
  block[3] = &unk_24CD3F470;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __26__COStateObserver_notify___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _QWORD v53[3];
  _QWORD v54[3];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("COStateManagerChangesCluster"));
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("COStateManagerChangesUpdatedKeyPaths"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("COStateManagerChangesRemovedKeyPaths"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    COLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __26__COStateObserver_notify___block_invoke_cold_1();
    v37 = (void *)v4;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(WeakRetained, "predicate", v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "absoluteString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "evaluateWithObject:", v14);

          if (v15)
          {
            objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", v37);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "objectForKeyedSubscript:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v17, "isEqual:", v18) & 1) == 0)
              objc_msgSend(v3, "setObject:forKey:", v18, v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      }
      while (v9);
    }
    v36 = v3;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = v35;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(WeakRetained, "predicate", v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "evaluateWithObject:", v26);

          if (v27)
            objc_msgSend(v38, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v36, "count") || objc_msgSend(v38, "count"))
    {
      v53[0] = CFSTR("COStateManagerChangesCluster");
      v53[1] = CFSTR("COStateManagerChangesUpdatedKeyPaths");
      v54[0] = v37;
      v54[1] = v36;
      v53[2] = CFSTR("COStateManagerChangesRemovedKeyPaths");
      v54[2] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 3, v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_msgSend(WeakRetained[4], "objectForKeyedSubscript:", v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v30, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (objc_msgSend(v36, "count"))
        objc_msgSend(v31, "addEntriesFromDictionary:", v36);
      if (objc_msgSend(v19, "count"))
      {
        objc_msgSend(v38, "allObjects");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObjectsForKeys:", v32);

      }
      objc_msgSend(WeakRetained[4], "setObject:forKey:", v31, v37);
      COLogForCategory(4);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v48 = WeakRetained;
        v49 = 2112;
        v50 = v28;
        v51 = 2112;
        v52 = v37;
        _os_log_impl(&dword_21214B000, v33, OS_LOG_TYPE_DEFAULT, "Observer %@ informing client of changes %@ for cluster %@", buf, 0x20u);
      }

      objc_msgSend(WeakRetained, "block");
      v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v34)[2](v34, v28);

    }
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)block
{
  return self->_block;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSMutableDictionary)lastChanges
{
  return self->_lastChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChanges, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __26__COStateObserver_notify___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_21214B000, v0, (uint64_t)v0, "Observer %@ got changes from the service for cluster %@", v1);
  OUTLINED_FUNCTION_1();
}

@end
