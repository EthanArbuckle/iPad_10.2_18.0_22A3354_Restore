@implementation TKTokenAccessDBBackedByUserDefaults

- (TKTokenAccessDBBackedByUserDefaults)init
{
  TKTokenAccessDBBackedByUserDefaults *v2;
  uint64_t v3;
  NSUserDefaults *db;
  NSObject *v5;
  TKTokenAccessDBBackedByUserDefaults *v6;
  _QWORD block[4];
  TKTokenAccessDBBackedByUserDefaults *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TKTokenAccessDBBackedByUserDefaults;
  v2 = -[TKTokenAccessDBBackedByUserDefaults init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.ctkd.access-db"));
    db = v2->_db;
    v2->_db = (NSUserDefaults *)v3;

  }
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__TKTokenAccessDBBackedByUserDefaults_init__block_invoke;
  block[3] = &unk_1E70891E8;
  v6 = v2;
  v9 = v6;
  dispatch_async(v5, block);

  return v6;
}

void __43__TKTokenAccessDBBackedByUserDefaults_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v18;
    *(_QWORD *)&v4 = 138412290;
    v15 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "rangeOfString:", CFSTR(","), v15);
        if (v9)
          v10 = v9 == 0x7FFFFFFFFFFFFFFFLL;
        else
          v10 = 1;
        if (!v10)
        {
          objc_msgSend(v8, "substringWithRange:", 0, v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "applicationIsInstalled:", v11);

            if ((v13 & 1) == 0)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v8);
              if (TK_LOG_token_access_registry_once != -1)
                dispatch_once(&TK_LOG_token_access_registry_once, &__block_literal_global_1);
              v14 = TK_LOG_token_access_registry_log;
              if (os_log_type_enabled((os_log_t)TK_LOG_token_access_registry_log, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v15;
                v22 = v11;
                _os_log_debug_impl(&dword_1B9768000, v14, OS_LOG_TYPE_DEBUG, "'%@' removed from token registry DB", buf, 0xCu);
              }
            }
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v5);
  }

}

- (int64_t)fetchAccessForRequest:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[TKTokenAccessDBBackedByUserDefaults _keyRefForRequest:](self, "_keyRefForRequest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_db, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[NSUserDefaults BOOLForKey:](self->_db, "BOOLForKey:", v4))
      v6 = 1;
    else
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)storeAccess:(int64_t)a3 forRequest:(id)a4
{
  id v6;

  if (a3)
  {
    -[TKTokenAccessDBBackedByUserDefaults _keyRefForRequest:](self, "_keyRefForRequest:", a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setBool:forKey:](self->_db, "setBool:forKey:", a3 == 1, v6);

  }
}

- (void)clearAllAccessRecords
{
  void *v3;
  void *v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSUserDefaults dictionaryRepresentation](self->_db, "dictionaryRepresentation", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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
        -[NSUserDefaults removeObjectForKey:](self->_db, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_keyRefForRequest:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "clientBundleID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E708AD68;
  objc_msgSend(v4, "tokenID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@,%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
