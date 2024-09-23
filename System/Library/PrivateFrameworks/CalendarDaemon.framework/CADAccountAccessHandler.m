@implementation CADAccountAccessHandler

- (CADCalendarDatabaseDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  return 1;
}

- (CADAccountAccessHandler)initWithDatabaseDataProvider:(id)a3
{
  id v5;
  CADAccountAccessHandler *v6;
  CADAccountAccessHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADAccountAccessHandler;
  v6 = -[CADAccountAccessHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataProvider, a3);

  return v7;
}

- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[CADAccountAccessHandler gatherRestrictedStoreRowIDs:forAction:inDatabase:](self, "gatherRestrictedStoreRowIDs:forAction:inDatabase:", v7, a3, a4);
  return v7;
}

- (void)gatherRestrictedStoreRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CADCalendarDatabaseDataProvider storesInDatabase:](self->_dataProvider, "storesInDatabase:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!-[CADAccountAccessHandler isActionAllowed:forStore:inDatabase:](self, "isActionAllowed:forStore:inDatabase:", a4, v14, a5))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CADCalendarDatabaseDataProvider storeUIDForStore:inDatabase:](self->_dataProvider, "storeUIDForStore:inDatabase:", v14, a5));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[CADAccountAccessHandler gatherRestrictedCalendarRowIDs:forAction:inDatabase:](self, "gatherRestrictedCalendarRowIDs:forAction:inDatabase:", v7, a3, a4);
  return v7;
}

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CADCalendarDatabaseDataProvider storesInDatabase:](self->_dataProvider, "storesInDatabase:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (!-[CADAccountAccessHandler isActionAllowed:forStore:inDatabase:](self, "isActionAllowed:forStore:inDatabase:", a4, v14, a5))-[CADCalendarDatabaseDataProvider gatherCalendarRowIDs:inStore:inDatabase:](self->_dataProvider, "gatherCalendarRowIDs:inStore:inDatabase:", v8, v14, a5);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
