@implementation _DPBlacklist

+ (void)initialize
{
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_13);
}

- (_DPBlacklist)init
{

  return 0;
}

- (_DPBlacklist)initWithKey:(id)a3 fromConfigurationsFile:(id)a4
{
  id v7;
  id v8;
  _DPBlacklist *v9;
  _DPBlacklist *v10;
  uint64_t v11;
  NSSet *blacklist;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSSet *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_DPBlacklist;
  v9 = -[_DPBlacklist init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    v10->_version = -1;
    v11 = objc_opt_new();
    blacklist = v10->_blacklist;
    v10->_blacklist = (NSSet *)v11;

    objc_msgSend((id)objc_opt_class(), "filePathWithKey:inDirectory:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "nonEmptyStringsFromFileAtPath:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)MEMORY[0x1E0CB3900];
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scannerWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "scanInteger:", 0) && objc_msgSend(v18, "isAtEnd"))
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10->_version = (int)objc_msgSend(v19, "intValue");

        objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
        v20 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)objc_opt_new();
        objc_msgSend(v21, "addObjectsFromArray:", v20);
        v22 = objc_msgSend(v21, "copy");
        v23 = v10->_blacklist;
        v10->_blacklist = (NSSet *)v22;

        v15 = (void *)v20;
      }

    }
  }

  return v10;
}

+ (id)blacklistForKey:(id)a3 systemBlacklistDirectory:(id)a4 runtimeBlacklistDirectory:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  id v16;
  void *v17;
  NSObject *v18;
  objc_class *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (id)_allBlacklists;
  objc_sync_enter(v11);
  objc_msgSend((id)_allBlacklists, "objectForKeyedSubscript:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend((id)objc_opt_class(), "blacklistForKey:fromConfigurationsFile:", v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "version") < 1)
    {
      objc_msgSend((id)objc_opt_class(), "blacklistForKey:fromConfigurationsFile:", v8, v9);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (-[NSObject version](v14, "version") >= 1)
      {
        +[_DPLog framework](_DPLog, "framework");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v24 = -[NSObject version](v14, "version");
          -[NSObject blacklist](v14, "blacklist");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v28 = v26;
          v29 = 2112;
          v30 = v21;
          v31 = 2112;
          v32 = v8;
          v33 = 2048;
          v34 = v24;
          v35 = 2048;
          v36 = objc_msgSend(v22, "count");
          v37 = 2112;
          v38 = v9;
          _os_log_debug_impl(&dword_1D3FAA000, v18, OS_LOG_TYPE_DEBUG, "%@, %@: selecting system blacklist with key: %@, version: %li, values count: %li, from directory: %@", buf, 0x3Eu);

        }
      }
      v12 = v14;
    }
    else
    {
      v12 = v13;
      +[_DPLog framework](_DPLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v12, "version");
        objc_msgSend(v12, "blacklist");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v28 = v25;
        v29 = 2112;
        v30 = v16;
        v31 = 2112;
        v32 = v8;
        v33 = 2048;
        v34 = v23;
        v35 = 2048;
        v36 = objc_msgSend(v17, "count");
        v37 = 2112;
        v38 = v10;
        _os_log_debug_impl(&dword_1D3FAA000, v14, OS_LOG_TYPE_DEBUG, "%@, %@: selecting runtime blacklist with key: %@, version: %li, values count: %li, from directory: %@", buf, 0x3Eu);

      }
    }

    if (v12)
      objc_msgSend((id)_allBlacklists, "setObject:forKeyedSubscript:", v12, v8);

  }
  objc_sync_exit(v11);

  return v12;
}

+ (void)resetAllBlacklists
{
  id obj;

  obj = (id)_allBlacklists;
  objc_sync_enter(obj);
  objc_msgSend((id)_allBlacklists, "removeAllObjects");
  objc_sync_exit(obj);

}

+ (void)removeBlackListForKey:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)_allBlacklists;
  objc_sync_enter(v3);
  objc_msgSend((id)_allBlacklists, "removeObjectForKey:", v4);
  objc_sync_exit(v3);

}

+ (void)removeBlackListsForKeys:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = (id)_allBlacklists;
  objc_sync_enter(v3);
  objc_msgSend((id)_allBlacklists, "removeObjectsForKeys:", v4);
  objc_sync_exit(v3);

}

+ (id)blacklistForKey:(id)a3 fromConfigurationsFile:(id)a4
{
  id v5;
  id v6;
  _DPBlacklist *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_DPBlacklist initWithKey:fromConfigurationsFile:]([_DPBlacklist alloc], "initWithKey:fromConfigurationsFile:", v6, v5);

  return v7;
}

+ (id)filePathWithKey:(id)a3 inDirectory:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@%@"), a4, a3, CFSTR(".blacklist"));
}

+ (BOOL)blacklistExistsWithKey:(id)a3 inDirectory:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@%@"), v6, v7, CFSTR(".blacklist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "fileExistsAtPath:", v9);
  return (char)v7;
}

+ (id)extractKeyFromFileName:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR(".blacklist")))
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E95DA470;
  }

  return v4;
}

- (NSSet)blacklist
{
  return self->_blacklist;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_blacklist, 0);
}

@end
