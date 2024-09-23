@implementation CatacombStateCache

- (CatacombStateCache)init
{
  CatacombStateCache *v2;
  uint64_t v3;
  NSMutableDictionary *cachedStates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CatacombStateCache;
  v2 = -[CatacombStateCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cachedStates = v2->_cachedStates;
    v2->_cachedStates = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)reset
{
  CatacombStateCache *obj;

  obj = self;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](obj->_cachedStates, "removeAllObjects");
  objc_sync_exit(obj);

}

- (int)addUserStatesFromBuffer:(id)a3
{
  id v4;
  unint64_t v5;
  CatacombStateCache *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableDictionary *cachedStates;
  void *v11;
  void *v12;
  int v13;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "length") & 7) != 0)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 136316162;
      v17 = "(buffer.length % sizeof(catacomb_state_v1_t)) == 0";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = &unk_21491C593;
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v24 = 1024;
      v25 = 520;
      _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    v13 = 261;
  }
  else
  {
    v5 = objc_msgSend(v4, "length");
    v6 = self;
    objc_sync_enter(v6);
    if (v5 >= 8)
    {
      v7 = 0;
      v8 = v5 >> 3;
      do
      {
        v9 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
        cachedStates = v6->_cachedStates;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v9 + v7 + 4));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", *(unsigned int *)(v9 + v7));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](cachedStates, "setObject:forKey:", v11, v12);

        v7 += 8;
        --v8;
      }
      while (v8);
    }
    objc_sync_exit(v6);

    v13 = 0;
  }

  return v13;
}

- (id)cachedComponents
{
  CatacombStateCache *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allKeys](v2->_cachedStates, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)cachedUserComponents
{
  void *v3;
  CatacombStateCache *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4->_cachedStates;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUserComponent", (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
  return v3;
}

- (void)removeUser:(unsigned int)a3
{
  CatacombStateCache *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](v4->_cachedStates, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "userID") == a3)
          -[NSMutableDictionary removeObjectForKey:](v4->_cachedStates, "removeObjectForKey:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

- (unsigned)stateOfComponent:(id)a3
{
  id v4;
  CatacombStateCache *v5;
  void *v6;
  unsigned int v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_cachedStates, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_sync_exit(v5);
  return v7;
}

- (unsigned)stateOfMasterComponent
{
  CatacombStateCache *v2;
  NSMutableDictionary *cachedStates;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  cachedStates = v2->_cachedStates;
  +[CatacombComponent masterComponent](CatacombComponent, "masterComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedStates, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(cachedStates) = objc_msgSend(v5, "unsignedIntValue");

  objc_sync_exit(v2);
  return cachedStates;
}

- (unsigned)stateOfUserComponent:(unsigned int)a3
{
  uint64_t v3;
  CatacombStateCache *v4;
  NSMutableDictionary *cachedStates;
  void *v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  objc_sync_enter(v4);
  cachedStates = v4->_cachedStates;
  +[CatacombComponent componentForUserID:](CatacombComponent, "componentForUserID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedStates, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(cachedStates) = objc_msgSend(v7, "unsignedIntValue");

  objc_sync_exit(v4);
  return cachedStates;
}

- (int)addGroupStatesFromBuffer:(id)a3
{
  id v4;
  unint64_t v5;
  CatacombStateCache *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableDictionary *cachedStates;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__ROR8__(0x6DB6DB6DB6DB6DB7 * objc_msgSend(v4, "length"), 2) >= 0x924924924924925uLL)
  {
    if (__osLog)
      v16 = __osLog;
    else
      v16 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 136316162;
      v18 = "buffer.length % sizeof(catacomb_group_state_t) == 0";
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = &unk_21491C593;
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/biometrickitd/BiometricKitXPCServer.m";
      v25 = 1024;
      v26 = 610;
      _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v17, 0x30u);
    }
    v14 = 261;
  }
  else
  {
    v5 = objc_msgSend(v4, "length");
    v6 = self;
    objc_sync_enter(v6);
    if (v5 >= 0x1C)
    {
      v7 = 0;
      v8 = v5 / 0x1C;
      do
      {
        v9 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
        cachedStates = v6->_cachedStates;
        v11 = v9 + v7;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v9 + v7 + 24));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CatacombComponent component:](CatacombComponent, "component:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](cachedStates, "setObject:forKey:", v12, v13);

        v7 += 28;
        --v8;
      }
      while (v8);
    }
    objc_sync_exit(v6);

    v14 = 0;
  }

  return v14;
}

- (id)cachedGroupComponentsForUser:(unsigned int)a3
{
  void *v5;
  CatacombStateCache *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != -1)
  {
    v6 = self;
    objc_sync_enter(v6);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6->_cachedStates;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isGroupComponent", (_QWORD)v13)
            && objc_msgSend(v11, "userID") == a3)
          {
            objc_msgSend(v5, "addObject:", v11);
          }
        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStates, 0);
}

@end
