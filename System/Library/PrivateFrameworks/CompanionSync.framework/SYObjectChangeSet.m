@implementation SYObjectChangeSet

- (id)changesBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  SYObjectChangeSet *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  SYObjectChangeSet *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v5);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v7);
    v8 = objc_alloc_init(SYObjectChangeSet);
    -[SYObjectChangeSet added](v8, "added");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v7);

    -[SYObjectChangeSet added](v8, "added");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minusSet:", v9);

    -[SYObjectChangeSet deleted](v8, "deleted");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v5);

    -[SYObjectChangeSet deleted](v8, "deleted");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minusSet:", v10);

    -[SYObjectChangeSet added](v8, "added");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      -[SYObjectChangeSet deleted](v8, "deleted");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17)
      {
        v34 = v10;
        v35 = v9;
        v36 = v7;
        v37 = v5;
        v43 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v42 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        -[SYObjectChangeSet added](v8, "added");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v40)
        {
          v39 = *(_QWORD *)v49;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v49 != v39)
                objc_enumerationMutation(obj);
              v41 = v18;
              v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v18);
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v47 = 0u;
              v20 = v8;
              -[SYObjectChangeSet deleted](v8, "deleted", v34, v35, v36, v37);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v45;
                do
                {
                  v25 = 0;
                  do
                  {
                    if (*(_QWORD *)v45 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v25);
                    objc_msgSend(v19, "syncId");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "syncId");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v27, "isEqual:", v28);

                    if (v29)
                    {
                      objc_msgSend(v43, "addObject:", v19);
                      objc_msgSend(v42, "addObject:", v26);
                      -[SYObjectChangeSet updated](v20, "updated");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "addObject:", v19);

                    }
                    ++v25;
                  }
                  while (v23 != v25);
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                }
                while (v23);
              }

              v18 = v41 + 1;
              v8 = v20;
            }
            while (v41 + 1 != v40);
            v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
          }
          while (v40);
        }

        -[SYObjectChangeSet added](v8, "added");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "minusSet:", v43);

        -[SYObjectChangeSet deleted](v8, "deleted");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "minusSet:", v42);

        v7 = v36;
        v5 = v37;
        v10 = v34;
        v9 = v35;
      }
    }
    else
    {

    }
  }

  return v8;
}

- (SYObjectChangeSet)init
{
  SYObjectChangeSet *v2;
  NSMutableSet *v3;
  NSMutableSet *added;
  NSMutableSet *v5;
  NSMutableSet *updated;
  NSMutableSet *v7;
  NSMutableSet *deleted;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SYObjectChangeSet;
  v2 = -[SYObjectChangeSet init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    added = v2->_added;
    v2->_added = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    updated = v2->_updated;
    v2->_updated = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    deleted = v2->_deleted;
    v2->_deleted = v7;

  }
  return v2;
}

- (SYObjectChangeSet)initWithChangesBetween:(id)a3 and:(id)a4
{
  id v6;
  id v7;
  SYObjectChangeSet *v8;
  SYObjectChangeSet *v9;
  void *v10;
  uint64_t v11;
  NSMutableSet *added;
  uint64_t v13;
  NSMutableSet *updated;
  uint64_t v15;
  NSMutableSet *deleted;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SYObjectChangeSet;
  v8 = -[SYObjectChangeSet init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SYObjectChangeSet changesBetween:and:](v8, "changesBetween:and:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "added");
    v11 = objc_claimAutoreleasedReturnValue();
    added = v9->_added;
    v9->_added = (NSMutableSet *)v11;

    objc_msgSend(v10, "updated");
    v13 = objc_claimAutoreleasedReturnValue();
    updated = v9->_updated;
    v9->_updated = (NSMutableSet *)v13;

    objc_msgSend(v10, "deleted");
    v15 = objc_claimAutoreleasedReturnValue();
    deleted = v9->_deleted;
    v9->_deleted = (NSMutableSet *)v15;

  }
  return v9;
}

- (void)applyToStore:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __34__SYObjectChangeSet_applyToStore___block_invoke;
  v3[3] = &unk_24CC65050;
  v3[4] = self;
  objc_msgSend(a3, "transaction:", v3);
}

void __34__SYObjectChangeSet_applyToStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "added");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "updated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "updateObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "deleted", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v16);
  }

}

- (NSMutableSet)added
{
  return self->_added;
}

- (void)setAdded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableSet)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableSet)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleted, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_added, 0);
}

@end
