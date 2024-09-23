@implementation SUUIStoreItemRelationshipCounsellor

- (SUUIStoreItemRelationshipCounsellor)init
{
  SUUIStoreItemRelationshipCounsellor *v2;
  uint64_t v3;
  NSMutableDictionary *relationshipsDictionary;
  NSRecursiveLock *v5;
  NSRecursiveLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIStoreItemRelationshipCounsellor;
  v2 = -[SUUIStoreItemRelationshipCounsellor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    relationshipsDictionary = v2->_relationshipsDictionary;
    v2->_relationshipsDictionary = (NSMutableDictionary *)v3;

    v5 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    lock = v2->_lock;
    v2->_lock = v5;

    -[NSRecursiveLock setName:](v2->_lock, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIStoreItemRelationshipCounsellor"));
  }
  return v2;
}

- (BOOL)itemHasParent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "chidItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v9;
}

- (BOOL)itemHasChildren:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "singleParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v9;
}

- (id)childItemsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "singleParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if (v9)
  {
    objc_msgSend(v7, "chidItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return v10;
}

- (id)parentItemForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "chidItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
  {
    objc_msgSend(v7, "singleParent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return v10;
}

- (id)siblingItemsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "chidItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if (v9)
  {
    objc_msgSend(v7, "chidItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

  return v10;
}

- (id)familyForItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unlock");

    goto LABEL_5;
  }
  objc_msgSend(v9, "chidItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v10);

  objc_msgSend(v9, "singleParent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  if (!objc_msgSend(v6, "count"))
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v13 = (void *)objc_msgSend(v6, "copy");
LABEL_6:

  return v13;
}

- (void)setChildren:(id)a3 forParent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SUUIStoreItemRelationship *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[SUUIStoreItemRelationshipCounsellor removeAllRelationshipsForItem:](self, "removeAllRelationshipsForItem:", v7);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
          -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            -[SUUIStoreItemRelationshipCounsellor removeAllRelationshipsForItem:](self, "removeAllRelationshipsForItem:", v16);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    v19 = -[SUUIStoreItemRelationship initWithParent:andChildren:]([SUUIStoreItemRelationship alloc], "initWithParent:andChildren:", v7, v11);
    -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v7);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25);
          -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary", (_QWORD)v29);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }

    -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "unlock");

  }
}

- (void)addChildren:(id)a3 forParent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUUIStoreItemRelationship *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "chidItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setByAddingObjectsFromSet:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = -[SUUIStoreItemRelationship initWithParent:andChildren:]([SUUIStoreItemRelationship alloc], "initWithParent:andChildren:", v7, v12);
      -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v7);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19);
            -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary", (_QWORD)v23);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v17);
      }

    }
    else
    {
      -[SUUIStoreItemRelationshipCounsellor setChildren:forParent:](self, "setChildren:forParent:", v6, v7);
    }
    -[SUUIStoreItemRelationshipCounsellor lock](self, "lock", (_QWORD)v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unlock");

  }
}

- (void)removeAllRelationshipsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "singleParent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v7, "chidItems", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
          -[SUUIStoreItemRelationshipCounsellor relationshipsDictionary](self, "relationshipsDictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectForKey:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  -[SUUIStoreItemRelationshipCounsellor lock](self, "lock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unlock");

}

- (NSMutableDictionary)relationshipsDictionary
{
  return self->_relationshipsDictionary;
}

- (void)setRelationshipsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipsDictionary, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_relationshipsDictionary, 0);
}

@end
