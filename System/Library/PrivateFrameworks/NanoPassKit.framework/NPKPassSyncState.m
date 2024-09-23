@implementation NPKPassSyncState

- (NPKPassSyncState)initWithProtoSyncState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NPKPassSyncStateItem *v11;
  NPKPassSyncState *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "passSyncStateItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = -[NPKPassSyncStateItem initWithProtoSyncStateItem:]([NPKPassSyncStateItem alloc], "initWithProtoSyncStateItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = -[NPKPassSyncState initWithSyncStateItems:version:](self, "initWithSyncStateItems:version:", v5, objc_msgSend(v4, "version"));
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (id)protoSyncState
{
  NPKProtoPassSyncState *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(NPKProtoPassSyncState);
  -[NPKProtoPassSyncState setVersion:](v3, "setVersion:", -[NPKPassSyncState version](self, "version"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NPKPassSyncState syncStateItems](self, "syncStateItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "protoSyncStateItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKProtoPassSyncState addPassSyncStateItems:](v3, "addPassSyncStateItems:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (NPKPassSyncState)init
{
  return -[NPKPassSyncState initWithVersion:](self, "initWithVersion:", objc_msgSend((id)objc_opt_class(), "minRemoteDevicePassSyncStateVersionSupport"));
}

- (NPKPassSyncState)initWithVersion:(unint64_t)a3
{
  void *v5;
  NPKPassSyncState *v6;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NPKPassSyncState initWithPasses:version:](self, "initWithPasses:version:", v5, a3);

  return v6;
}

- (NPKPassSyncState)initWithPasses:(id)a3
{
  id v4;
  NPKPassSyncState *v5;

  v4 = a3;
  v5 = -[NPKPassSyncState initWithPasses:version:](self, "initWithPasses:version:", v4, objc_msgSend((id)objc_opt_class(), "minRemoteDevicePassSyncStateVersionSupport"));

  return v5;
}

- (NPKPassSyncState)initWithPasses:(id)a3 version:(unint64_t)a4
{
  id v6;
  NPKPassSyncState *v7;
  NPKPassSyncState *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NPKPassSyncStateItem *v15;
  NPKPassSyncStateItem *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NPKPassSyncState;
  v7 = -[NPKPassSyncState init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NPKPassSyncState _commonInitWithVersion:](v7, "_commonInitWithVersion:", a4);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          v15 = [NPKPassSyncStateItem alloc];
          v16 = -[NPKPassSyncStateItem initWithPass:](v15, "initWithPass:", v14, (_QWORD)v19);
          -[NPKPassSyncStateItem uniqueID](v16, "uniqueID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            -[NSMutableDictionary setObject:forKey:](v8->_syncStateItems, "setObject:forKey:", v16, v17);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (NPKPassSyncState)initWithSyncStateItems:(id)a3
{
  id v4;
  NPKPassSyncState *v5;

  v4 = a3;
  v5 = -[NPKPassSyncState initWithSyncStateItems:version:](self, "initWithSyncStateItems:version:", v4, objc_msgSend((id)objc_opt_class(), "minRemoteDevicePassSyncStateVersionSupport"));

  return v5;
}

- (NPKPassSyncState)initWithSyncStateItems:(id)a3 version:(unint64_t)a4
{
  id v6;
  NPKPassSyncState *v7;
  NPKPassSyncState *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NPKPassSyncState;
  v7 = -[NPKPassSyncState init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NPKPassSyncState _commonInitWithVersion:](v7, "_commonInitWithVersion:", a4);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v14, "uniqueID", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[NSMutableDictionary setObject:forKey:](v8->_syncStateItems, "setObject:forKey:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v11);
    }

  }
  return v8;
}

- (void)_commonInitWithVersion:(unint64_t)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *syncStateItems;

  self->_version = a3;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  syncStateItems = self->_syncStateItems;
  self->_syncStateItems = v4;

}

- (id)description
{
  void *v3;
  NSMutableDictionary *syncStateItems;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncStateItems = self->_syncStateItems;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __31__NPKPassSyncState_description__block_invoke;
  v15 = &unk_24CFEC530;
  v16 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](syncStateItems, "enumerateKeysAndObjectsUsingBlock:", &v12);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_opt_class();
  -[NPKPassSyncState syncStateHash](self, "syncStateHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hexEncoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p sync state hash: %@, items: %@ version:%lu>"), v7, self, v9, v5, self->_version, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __31__NPKPassSyncState_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "shortDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)compareWithBaselinePassSyncState:(id)a3 outAddedSyncItems:(id *)a4 outUpdatedSyncItems:(id *)a5 outRemovedSyncItems:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  id *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v10, "syncStateItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_syncStateItems, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v18 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v18, "minusSet:", v14);
    _sortedSyncItemsByUniqueID(v18, self->_syncStateItems);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a5)
  {
    v33 = a5;
    v34 = v14;
    v35 = a6;
    v19 = (void *)objc_msgSend(v14, "mutableCopy");
    v32 = v17;
    objc_msgSend(v19, "intersectSet:", v17);
    v20 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v25);
          objc_msgSend(v10, "syncStateItems");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKey:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary objectForKey:](self->_syncStateItems, "objectForKey:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "isEqualToPassSyncStateItem:", v29) & 1) == 0)
            objc_msgSend(v20, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v23);
    }

    _sortedSyncItemsByUniqueID(v20, self->_syncStateItems);
    *v33 = (id)objc_claimAutoreleasedReturnValue();

    v14 = v34;
    a6 = v35;
    v17 = v32;
  }
  if (a6)
  {
    v30 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v30, "minusSet:", v17);
    objc_msgSend(v10, "syncStateItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _sortedSyncItemsByUniqueID(v30, v31);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (id)passSyncStateByApplyingChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "changeType") > 1)
  {
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKPassSyncState passSyncStateByRemovingPassWithUniqueID:](self, "passSyncStateByRemovingPassWithUniqueID:", v5);
  }
  else
  {
    objc_msgSend(v4, "syncStateItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NPKPassSyncState passSyncStateByAddingOrUpdatingSyncStateItem:](self, "passSyncStateByAddingOrUpdatingSyncStateItem:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)passSyncStateByAddingOrUpdatingSyncStateItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)-[NPKPassSyncState copy](self, "copy");
  objc_msgSend(v5, "syncStateItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v7);

  return v5;
}

- (id)passSyncStateByRemovingPassWithUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)-[NPKPassSyncState copy](self, "copy");
  objc_msgSend(v5, "syncStateItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  return v5;
}

- (id)commonBaselinePassSyncStateWithState:(id)a3 version:(unint64_t)a4
{
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v6 = (_QWORD *)-[NPKPassSyncState copy](self, "copy");
  v6[2] = a4;
  v21 = v6;
  objc_msgSend(v6, "syncStateItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12);
        objc_msgSend(v23, "syncStateItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKPassSyncState syncStateItems](self, "syncStateItems");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "isEqual:", v17);

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v21, "syncStateItems");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v21;
}

- (BOOL)stateIsSubsetOfUnionOfPassSyncStates:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id obj;
  uint64_t v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  -[NSMutableDictionary allKeys](self->_syncStateItems, "allKeys");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v18 = *(_QWORD *)v26;
    while (1)
    {
      v5 = 0;
LABEL_4:
      if (*(_QWORD *)v26 != v18)
        objc_enumerationMutation(obj);
      v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v5);
      -[NSMutableDictionary objectForKey:](self->_syncStateItems, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = v20;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (!v9)
        break;
      v10 = v9;
      v11 = *(_QWORD *)v22;
LABEL_8:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v12), "syncStateItems");
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v13, "objectForKey:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v13) = objc_msgSend(v7, "isEqual:", v14);
        if ((v13 & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v10)
            goto LABEL_8;
          goto LABEL_18;
        }
      }

      if (++v5 != v4)
        goto LABEL_4;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v15 = 1;
      if (!v4)
        goto LABEL_20;
    }
LABEL_18:

    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
LABEL_20:

  return v15;
}

- (BOOL)diffWithBaselineState:(id)a3 representsMaterialDifferenceFromState:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[NPKPassSyncState version](self, "version");
  if (v8 == objc_msgSend(v6, "version"))
  {
    v29 = 0;
    v30 = 0;
    v28 = 0;
    -[NPKPassSyncState compareWithBaselinePassSyncState:outAddedSyncItems:outUpdatedSyncItems:outRemovedSyncItems:](self, "compareWithBaselinePassSyncState:outAddedSyncItems:outUpdatedSyncItems:outRemovedSyncItems:", v6, &v30, &v29, &v28);
    v9 = v30;
    v10 = v29;
    v11 = v28;
    if (objc_msgSend(v11, "count"))
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v12)
      {
        v21 = v11;
        v22 = v10;
        v23 = v9;
        v14 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v13);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v7, "syncStateItems");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uniqueID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v16) = PKEqualObjects();
            if (!(_DWORD)v16)
            {
              LOBYTE(v12) = 1;
              goto LABEL_15;
            }
          }
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          if (v12)
            continue;
          break;
        }
LABEL_15:
        v10 = v22;
        v9 = v23;
        v11 = v21;
      }

    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)stateContainsSyncStateItem:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *syncStateItems;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    syncStateItems = self->_syncStateItems;
    objc_msgSend(v4, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](syncStateItems, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = PKEqualObjects();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSData)syncStateHash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_syncStateItems, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        -[NSMutableDictionary objectForKey:](self->_syncStateItems, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "manifestHash");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x24BDBCEC8], "data");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "appendData:", v11);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "SHA256Hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v12;
}

- (BOOL)isEqual:(id)a3
{
  NPKPassSyncState *v4;
  NPKPassSyncState *v5;
  BOOL v6;

  v4 = (NPKPassSyncState *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NPKPassSyncState isEqualToPassSyncState:](self, "isEqualToPassSyncState:", v5);

  return v6;
}

- (BOOL)isEqualToPassSyncState:(id)a3
{
  if (self->_version == *((_QWORD *)a3 + 2))
    return PKEqualObjects();
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_syncStateItems);
  v4 = PKCombinedHash();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPKPassSyncState *v4;
  void *v5;

  v4 = -[NPKPassSyncState initWithVersion:](+[NPKPassSyncState allocWithZone:](NPKPassSyncState, "allocWithZone:", a3), "initWithVersion:", self->_version);
  v5 = (void *)-[NSMutableDictionary mutableCopy](self->_syncStateItems, "mutableCopy");
  -[NPKPassSyncState setSyncStateItems:](v4, "setSyncStateItems:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *syncStateItems;
  id v5;
  id v6;

  syncStateItems = self->_syncStateItems;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", syncStateItems, CFSTR("syncStateItems"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_version);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("syncStateVersion"));

}

- (NPKPassSyncState)initWithCoder:(id)a3
{
  id v4;
  NPKPassSyncState *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *syncStateItems;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKPassSyncState;
  v5 = -[NPKPassSyncState init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("syncStateItems"));
    v7 = objc_claimAutoreleasedReturnValue();
    syncStateItems = v5->_syncStateItems;
    v5->_syncStateItems = (NSMutableDictionary *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("syncStateVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_version = objc_msgSend(v9, "unsignedIntegerValue");

  }
  return v5;
}

- (NSMutableDictionary)syncStateItems
{
  return self->_syncStateItems;
}

- (void)setSyncStateItems:(id)a3
{
  objc_storeStrong((id *)&self->_syncStateItems, a3);
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncStateItems, 0);
}

+ (unint64_t)minRemoteDevicePassSyncStateVersionSupport
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  char v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!PKCloudKitPassSyncEnabled())
    return 0;
  objc_msgSend(a1, "_deviceDomainAccessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = objc_msgSend(v3, "integerForKey:keyExistsAndHasValidFormat:", CFSTR("NPKPassSyncStateVersion"), &v13);
  if (v13)
  {
    v5 = v4;
    pk_Sync_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Sync_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v15 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: fetched from user defaults version:%lu", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(a1, "_currentActiveDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("AAA2622E-C2DC-45BF-A337-F8A4BCED8CFD"));
    v11 = objc_msgSend(v9, "supportsCapability:", v10);

    v5 = v11;
  }

  return v5;
}

+ (void)setMinRemoteDevicePassSyncStateVersionSupport:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_Sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Sync_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Updated expected pass sync state version to:%lu", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(a1, "_deviceDomainAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInteger:forKey:", a3, CFSTR("NPKPassSyncStateVersion"));

}

+ (id)_deviceDomainAccessor
{
  return NPKDomainAccessorForDomain(CFSTR("com.apple.nanopassbook"));
}

@end
