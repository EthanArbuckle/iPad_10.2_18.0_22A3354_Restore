@implementation CADStatsStores

+ (id)eventName
{
  return CFSTR("cadstats.Store");
}

- (BOOL)wantsStores
{
  return 1;
}

- (void)prepareWithContext:(id)a3
{
  NSMutableArray *v5;
  NSMutableArray *storeInfos;
  id v7;

  objc_storeStrong((id *)&self->_context, a3);
  v7 = a3;
  v5 = (NSMutableArray *)objc_opt_new();
  storeInfos = self->_storeInfos;
  self->_storeInfos = v5;

}

- (void)processStores:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_opt_new();
        -[NSMutableArray addObject:](self->_storeInfos, "addObject:", v9);
        *(_QWORD *)(v9 + 8) = CalStoreGetType();
        *(_BYTE *)(v9 + 32) = CalStoreIsDelegate();
        *(_BYTE *)(v9 + 33) = CalStoreIsEnabled();
        v10 = CalStoreCopyUUID();
        if (v10)
        {
          v11 = (const void *)v10;
          -[CADStatCollectionContext accountStore](self->_context, "accountStore");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accountWithIdentifier:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "displayAccount");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "accountType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = *(void **)(v9 + 24);
          *(_QWORD *)(v9 + 24) = v16;

          if (*(_QWORD *)(v9 + 24))
            *(_QWORD *)(v9 + 16) = PCSettingsGetStyle();
          CFRelease(v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (id)eventDictionaries
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_storeInfos, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_storeInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E6A50750, CFSTR("instance"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v8 + 8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("storeType"));

        v11 = *(_QWORD *)(v8 + 24);
        if (v11)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("accountType"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v8 + 16));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("syncStyle"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v8 + 32));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("isDelegate"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(v8 + 33));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("isEnabled"));

        objc_msgSend(v3, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeInfos, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
