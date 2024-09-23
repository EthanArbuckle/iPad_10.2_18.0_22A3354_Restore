@implementation AMSMutableSet

+ (id)setWithHashBlock:(id)a3
{
  id v3;
  AMSMutableSet *v4;

  v3 = a3;
  v4 = -[AMSMutableSet initWithHashBlock:]([AMSMutableSet alloc], "initWithHashBlock:", v3);

  return v4;
}

- (AMSMutableSet)initWithHashBlock:(id)a3
{
  id v4;
  AMSMutableSet *v5;
  NSMutableSet *v6;
  NSMutableSet *backingSet;
  void *v8;
  id hashBlock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSMutableSet;
  v5 = -[AMSMutableSet init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    backingSet = v5->_backingSet;
    v5->_backingSet = v6;

    v8 = _Block_copy(v4);
    hashBlock = v5->_hashBlock;
    v5->_hashBlock = v8;

  }
  return v5;
}

- (void)addObject:(id)a3
{
  NSMutableSet *backingSet;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, id);

  backingSet = self->_backingSet;
  v5 = a3;
  -[AMSMutableSet hashBlock](self, "hashBlock");
  v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSSetItem setItemWithObject:hashKey:](AMSSetItem, "setItemWithObject:hashKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](backingSet, "addObject:", v7);
}

- (void)addObjectsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AMSMutableSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)count
{
  return -[NSMutableSet count](self->_backingSet, "count");
}

- (id)anyObject
{
  void *v2;
  void *v3;

  -[NSMutableSet anyObject](self->_backingSet, "anyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)member:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSMutableSet hashBlock](self, "hashBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSSetItem setItemWithObject:hashKey:](AMSSetItem, "setItemWithObject:hashKey:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableSet allObjects](self->_backingSet, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "hashKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hashKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v12, "object");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)objectEnumerator
{
  void *v2;
  void *v3;

  -[AMSMutableSet _allObjectsFromBackingSet](self, "_allObjectsFromBackingSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)containsObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AMSMutableSet _allObjectsFromBackingSet](self, "_allObjectsFromBackingSet", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_allObjectsFromBackingSet
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[AMSMutableSet count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableSet allObjects](self->_backingSet, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "object");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)hashBlock
{
  return self->_hashBlock;
}

- (void)setHashBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hashBlock, 0);
  objc_storeStrong((id *)&self->_backingSet, 0);
}

@end
