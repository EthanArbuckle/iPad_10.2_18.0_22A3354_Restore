@implementation FCFeldsparIDProvider

void __38__FCFeldsparIDProvider_sharedInstance__block_invoke()
{
  FCFeldsparIDProvider *v0;
  void *v1;

  v0 = objc_alloc_init(FCFeldsparIDProvider);
  v1 = (void *)_MergedGlobals_149;
  _MergedGlobals_149 = (uint64_t)v0;

}

- (FCFeldsparIDProvider)init
{
  FCFeldsparIDProvider *v2;
  void *v3;
  uint64_t v4;
  NSString *feldsparID;
  uint64_t v6;
  NSHashTable *observers;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCFeldsparIDProvider;
  v2 = -[FCFeldsparIDProvider init](&v9, sel_init);
  if (v2)
  {
    NewsCoreSensitiveUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringForKey:", CFSTR("provider_user_id"));
    v4 = objc_claimAutoreleasedReturnValue();
    feldsparID = v2->_feldsparID;
    v2->_feldsparID = (NSString *)v4;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;

  }
  return v2;
}

- (void)registerUserInfo:(id)a3
{
  FCUserInfo *v5;
  FCUserInfo *userInfo;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (FCUserInfo *)a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v5)
  {
    userInfo = self->_userInfo;
    if (userInfo != v5)
    {
      -[FCUserInfo removeObserver:](userInfo, "removeObserver:", self);
      -[FCUserInfo addObserver:](v5, "addObserver:", self);
      objc_storeStrong((id *)&self->_userInfo, a3);
      -[FCUserInfo feldsparID](v5, "feldsparID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCFeldsparIDProvider _updateFeldsparID:](self, "_updateFeldsparID:", v7);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userInfo");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCFeldsparIDProvider registerUserInfo:]";
    v11 = 2080;
    v12 = "FCFeldsparIDProvider.m";
    v13 = 1024;
    v14 = 67;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)_updateFeldsparID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (objc_msgSend(v4, "length"))
  {
    -[FCFeldsparIDProvider feldsparID](self, "feldsparID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

    if ((v6 & 1) == 0)
    {
      -[FCFeldsparIDProvider setFeldsparID:](self, "setFeldsparID:", v4);
      NewsCoreSensitiveUserDefaults();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v4, CFSTR("provider_user_id"));

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[FCFeldsparIDProvider observers](self, "observers", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v14, "feldsparIDProviderDidChangeFeldsparID:", self);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v11);
      }

    }
  }

}

+ (FCFeldsparIDProvider)sharedInstance
{
  if (qword_1ED0F7EF0 != -1)
    dispatch_once(&qword_1ED0F7EF0, &__block_literal_global_33);
  return (FCFeldsparIDProvider *)(id)_MergedGlobals_149;
}

- (NSString)feldsparID
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v7;

  +[FCUserInfo overrideFeldsparID](FCUserInfo, "overrideFeldsparID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    if (!self->_userInfo)
    {
      NewsCoreSensitiveUserDefaults();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringForKey:", CFSTR("provider_user_id"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    v4 = self->_feldsparID;
  }
  v5 = v4;
LABEL_6:

  return (NSString *)v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCFeldsparIDProvider observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCFeldsparIDProvider addObserver:]";
    v8 = 2080;
    v9 = "FCFeldsparIDProvider.m";
    v10 = 1024;
    v11 = 87;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    -[FCFeldsparIDProvider observers](self, "observers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer");
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCFeldsparIDProvider removeObserver:]";
    v8 = 2080;
    v9 = "FCFeldsparIDProvider.m";
    v10 = 1024;
    v11 = 98;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  id v5;

  objc_msgSend(a3, "feldsparID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FCFeldsparIDProvider _updateFeldsparID:](self, "_updateFeldsparID:", v5);

}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setFeldsparID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_feldsparID, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
