@implementation _LTDisambiguationChangeManager

- (_LTDisambiguationChangeManager)init
{
  _LTDisambiguationChangeManager *v2;
  uint64_t v3;
  NSMutableDictionary *changeMapping;
  _LTDisambiguationChangeManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LTDisambiguationChangeManager;
  v2 = -[_LTDisambiguationChangeManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    changeMapping = v2->_changeMapping;
    v2->_changeMapping = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSDictionary)changeMapping
{
  return (NSDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", self->_changeMapping, 1);
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_changeMapping, "removeAllObjects");
}

- (void)addUserSelection:(id)a3
{
  id v4;
  NSMutableDictionary *changeMapping;
  void *v6;
  void *v7;
  _LTDisambiguationChangeSet *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    changeMapping = self->_changeMapping;
    v11 = v4;
    objc_msgSend(v4, "sourceSnippet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](changeMapping, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "addUserSelection:", v11);
    }
    else
    {
      v8 = objc_alloc_init(_LTDisambiguationChangeSet);
      -[_LTDisambiguationChangeSet addUserSelection:](v8, "addUserSelection:", v11);
      v9 = self->_changeMapping;
      objc_msgSend(v11, "sourceSnippet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

    }
    v4 = v11;
  }

}

- (BOOL)restoreChangesToResult:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "sentences", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_restoreChanges:", self);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);

    if (v7)
    {
      v10 = _LTOSLogDisambiguation();
      v11 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v19 = v7;
        _os_log_impl(&dword_235438000, v10, OS_LOG_TYPE_INFO, "Restored changes to %zu sentences in result", buf, 0xCu);
      }
      return v11;
    }
  }
  else
  {

  }
  v12 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[_LTDisambiguationChangeManager restoreChangesToResult:].cold.1(v12);
  return 0;
}

- (BOOL)hasAnyChangeOfType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[5];

  -[NSMutableDictionary allValues](self->_changeMapping, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53___LTDisambiguationChangeManager_hasAnyChangeOfType___block_invoke;
  v6[3] = &__block_descriptor_40_e36_B16__0___LTDisambiguationChangeSet_8l;
  v6[4] = a3;
  LOBYTE(a3) = objc_msgSend(v4, "lt_hasObjectPassingTest:", v6);

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMapping, 0);
}

- (void)restoreChangesToResult:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_235438000, log, OS_LOG_TYPE_DEBUG, "No sentences restored changes from previous user-selections", v1, 2u);
}

@end
