@implementation _GEOConfigStorageLocalHelper

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v10;
  id v11;
  GEOConfigStorageReadWrite *direct;
  void *v13;

  v10 = a3;
  v11 = a4;
  if ((a5 & 0x2000) == 0
    || (direct = self->_direct) == 0
    || (-[GEOConfigStorageReadWrite getConfigValueForKey:countryCode:options:source:](direct, "getConfigValueForKey:countryCode:options:source:", v10, v11, a5, a6), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0)&& (GEOConfig_migrateEntitledKey(v10, a5, self->_direct, (uint64_t)a6), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[GEOConfigStorageReadWrite getConfigValueForKey:countryCode:options:source:](self->_store, "getConfigValueForKey:countryCode:options:source:", v10, v11, a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      GEOConfig_migrateEntitledKey(v10, a5, self->_store, (uint64_t)a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  GEOConfigStorageReadWrite *direct;
  int64_t source;
  void *v15;
  _QWORD v16[2];

  v6 = a6;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if ((a5 & 0x2000) != 0)
  {
    direct = self->_direct;
    if (direct)
    {
      _deleteOldEntitledKey(v11, a5, direct);
      if (v10)
        GEOConfig_createEntitledKeyPathForKey(v12, a5, self->_direct);
      -[GEOConfigStorageReadWrite setConfigValue:forKey:options:synchronous:](self->_direct, "setConfigValue:forKey:options:synchronous:", v10, v12, a5, v6);
    }
  }
  _deleteOldEntitledKey(v12, a5, self->_store);
  if (v10)
    GEOConfig_createEntitledKeyPathForKey(v12, a5, self->_store);
  -[GEOConfigStorageReadWrite setConfigValue:forKey:options:synchronous:](self->_store, "setConfigValue:forKey:options:synchronous:", v10, v12, a5, v6);
  if ((a5 & 0x1000) != 0)
  {
    source = self->_source;
    if ((unint64_t)(source - 6) >= 3)
    {
      if (source == 2)
        GEOUserDefaultsTriggerWatchSync(v12);
    }
    else
    {
      notify_post(GEOConfigNeedsWatchSyncDarwinNotification);
    }
  }
  if (objc_msgSend(v12, "length"))
  {
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigPostKeysChangedNotification(v15, a5);

  }
}

- (_GEOConfigStorageLocalHelper)initWithSource:(int64_t)a3 store:(id)a4 directStore:(id)a5
{
  id v9;
  id v10;
  _GEOConfigStorageLocalHelper *v11;
  _GEOConfigStorageLocalHelper *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_GEOConfigStorageLocalHelper;
  v11 = -[_GEOConfigStorageLocalHelper init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_source = a3;
    objc_storeStrong((id *)&v11->_store, a4);
    objc_storeStrong((id *)&v12->_direct, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_direct, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
