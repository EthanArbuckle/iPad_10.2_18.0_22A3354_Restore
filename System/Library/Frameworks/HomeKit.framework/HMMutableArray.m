@implementation HMMutableArray

- (NSArray)array
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (NSMutableArray)internal
{
  return self->_internal;
}

- (void)addObjectsFromArray:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    -[HMMutableArray internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)setArray:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setArray:", v6);
  else
    objc_msgSend(v5, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (id)firstItemWithUUID:(id)a3
{
  return -[HMMutableArray firstItemWithValue:forKey:](self, "firstItemWithValue:forKey:", a3, CFSTR("uuid"));
}

- (id)firstItemWithValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMMutableArray internal](self, "internal", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "valueForKeyPath:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if ((v15 & 1) != 0)
        {
          v16 = v13;

          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = 0;
LABEL_11:
  os_unfair_lock_unlock(p_lock);

  return v16;
}

- (void)removeObjectsInArray:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

+ (id)array
{
  HMMutableArray *v2;
  void *v3;
  HMMutableArray *v4;

  v2 = [HMMutableArray alloc];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMMutableArray initWithArray:](v2, "initWithArray:", v3);

  return v4;
}

- (HMMutableArray)initWithArray:(id)a3
{
  id v4;
  HMMutableArray *v5;
  uint64_t v6;
  NSMutableArray *internal;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMutableArray;
  v5 = -[HMMutableArray init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    internal = v5->_internal;
    v5->_internal = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)replaceObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v7);

  -[HMMutableArray internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObjectsAtIndexes:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsAtIndexes:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
}

- (void)addObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addObjectIfNotPresent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    -[HMMutableArray internal](self, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v4);

  }
  os_unfair_lock_unlock(p_lock);

  return v7 ^ 1;
}

- (id)filteredArrayUsingPredicate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)itemsWithValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  os_unfair_lock_t lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMMutableArray internal](self, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "valueForKeyPath:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if (v15)
          objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(lock);
  return v8;
}

- (void)setIfDifferent:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[HMMutableArray internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToSet:", v10) & 1) == 0)
  {
    -[HMMutableArray internal](self, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArray:", v9);

  }
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)containsObject:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMutableArray internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HMMutableArray *v4;
  HMMutableArray *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMMutableArray *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMMutableArray array](self, "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMutableArray array](v5, "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

+ (HMMutableArray)arrayWithArray:(id)a3
{
  id v3;
  HMMutableArray *v4;

  v3 = a3;
  v4 = -[HMMutableArray initWithArray:]([HMMutableArray alloc], "initWithArray:", v3);

  return v4;
}

- (id)firstItemWithName:(id)a3
{
  return -[HMMutableArray firstItemWithValue:forKey:](self, "firstItemWithValue:forKey:", a3, CFSTR("name"));
}

- (id)firstItemWithUniqueIdentifier:(id)a3
{
  return -[HMMutableArray firstItemWithValue:forKey:](self, "firstItemWithValue:forKey:", a3, CFSTR("uniqueIdentifier"));
}

- (id)firstItemWithInstanceID:(id)a3
{
  return -[HMMutableArray firstItemWithValue:forKey:](self, "firstItemWithValue:forKey:", a3, CFSTR("instanceID"));
}

- (id)firstItemWithCharacteristicType:(id)a3
{
  return -[HMMutableArray firstItemWithValue:forKey:](self, "firstItemWithValue:forKey:", a3, CFSTR("characteristicType"));
}

@end
