@implementation CADGroupedAccountAccessHandler

- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *restrictedCalendarReadCache;
  NSMutableArray *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  uint64_t v20;

  -[CADAccountAccessHandler dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "databaseID:", a4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray objectAtIndexedSubscript:](self->_restrictedCalendarReadCache, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id)v11;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CADGroupedAccountAccessHandler gatherRestrictedCalendarRowIDs:forAction:inDatabase:](self, "gatherRestrictedCalendarRowIDs:forAction:inDatabase:", v13, a3, a4);
    v12 = v13;
    if (!self->_restrictedCalendarReadCache)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      restrictedCalendarReadCache = self->_restrictedCalendarReadCache;
      self->_restrictedCalendarReadCache = v14;

      v16 = self->_restrictedCalendarReadCache;
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableArray addObject:](v16, "addObject:", v17);

      v18 = self->_restrictedCalendarReadCache;
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableArray addObject:](v18, "addObject:", v19);

      -[NSMutableArray objectAtIndexedSubscript:](self->_restrictedCalendarReadCache, "objectAtIndexedSubscript:", a3);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v20;
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v9);

  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (void)addAccountAccessHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CADGroupedAccountAccessHandler accessHandlers](self, "accessHandlers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CADGroupedAccountAccessHandler accessHandlers](self, "accessHandlers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "isActionAllowed:forStore:inDatabase:", a3, a4, a5))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (NSMutableArray)accessHandlers
{
  return self->_accessHandlers;
}

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_accessHandlers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "gatherRestrictedCalendarRowIDs:forAction:inDatabase:", v8, a4, a5, (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (CADGroupedAccountAccessHandler)initWithDatabaseDataProvider:(id)a3
{
  CADGroupedAccountAccessHandler *v3;
  uint64_t v4;
  NSMutableArray *accessHandlers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CADGroupedAccountAccessHandler;
  v3 = -[CADAccountAccessHandler initWithDatabaseDataProvider:](&v7, sel_initWithDatabaseDataProvider_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    accessHandlers = v3->_accessHandlers;
    v3->_accessHandlers = (NSMutableArray *)v4;

    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  NSMutableArray *restrictedStoreReadCache;
  NSMutableArray *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  uint64_t v20;

  -[CADAccountAccessHandler dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "databaseID:", a4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray objectAtIndexedSubscript:](self->_restrictedStoreReadCache, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (id)v11;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CADAccountAccessHandler gatherRestrictedStoreRowIDs:forAction:inDatabase:](self, "gatherRestrictedStoreRowIDs:forAction:inDatabase:", v13, a3, a4);
    v12 = v13;
    if (!self->_restrictedStoreReadCache)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      restrictedStoreReadCache = self->_restrictedStoreReadCache;
      self->_restrictedStoreReadCache = v14;

      v16 = self->_restrictedStoreReadCache;
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableArray addObject:](v16, "addObject:", v17);

      v18 = self->_restrictedStoreReadCache;
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableArray addObject:](v18, "addObject:", v19);

      -[NSMutableArray objectAtIndexedSubscript:](self->_restrictedStoreReadCache, "objectAtIndexedSubscript:", a3);
      v20 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v20;
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v9);

  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (void)reset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *restrictedCalendarReadCache;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CADGroupedAccountAccessHandler accessHandlers](self, "accessHandlers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "reset");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  os_unfair_lock_lock(&self->_lock);
  restrictedCalendarReadCache = self->_restrictedCalendarReadCache;
  self->_restrictedCalendarReadCache = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessHandlers, 0);
  objc_storeStrong((id *)&self->_restrictedStoreReadCache, 0);
  objc_storeStrong((id *)&self->_restrictedCalendarReadCache, 0);
}

@end
