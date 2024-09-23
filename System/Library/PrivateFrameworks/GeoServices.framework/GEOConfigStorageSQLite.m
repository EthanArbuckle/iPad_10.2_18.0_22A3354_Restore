@implementation GEOConfigStorageSQLite

- (BOOL)getConfigKeyIsExpired:(id)a3
{
  void *v3;
  char v4;

  -[GEOConfigStorageSQLite _getExpiringKeyForKey:](self, "_getExpiringKeyForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpired");

  return v4;
}

- (id)_getExpiringKeyForKey:(id)a3
{
  id v4;
  void *v5;
  uint8_t v7[16];

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[GEOConfigPersistence getExpireForKeyPath:](self->super._persister, "getExpireForKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: key.length > 0", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_instanceSpecificGetKey:(id)a3
{
  return -[GEOConfigPersistence defaultForKeyPath:](self->super._persister, "defaultForKeyPath:", a3);
}

- (id)_instanceSpecificGetKeyPath:(id)a3
{
  return -[GEOConfigPersistence defaultForKeyPathComponents:](self->super._persister, "defaultForKeyPathComponents:", a3);
}

- (id)getAllExpiringKeys
{
  return -[GEOConfigPersistence getAllExpiringKeys](self->super._persister, "getAllExpiringKeys");
}

- (void)_instanceSpecificSetValue:(id)a3 forKey:(id)a4
{
  -[GEOConfigPersistence setDefault:forKeyPath:](self->super._persister, "setDefault:forKeyPath:", a3, a4);
}

- (BOOL)getConfigKeyExpiry:(id)a3 date:(id *)a4 osVersion:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint8_t v13[16];

  v8 = a3;
  v9 = v8;
  if (!a4 || !a5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: date != ((void *)0) && osVersion != ((void *)0)", v13, 2u);
    }
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_5;
  }
  -[GEOConfigStorageSQLite _getExpiringKeyForKey:](self, "_getExpiringKeyForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expireTime");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expireOSVersion");
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

LABEL_5:
  return v11;
}

- (void)setConfigKeyExpiry:(id)a3 date:(id)a4 osVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOConfigPersistence *persister;
  void *v12;
  void *v13;
  uint8_t v14[16];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if (v9 || objc_msgSend(v10, "length"))
    {
      persister = self->super._persister;
      +[GEOConfigExpiringKey expiringKey:withTime:osVersion:](GEOConfigExpiringKey, "expiringKey:withTime:osVersion:", v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOConfigPersistence setExpire:](persister, "setExpire:", v12);

    }
    else
    {
      -[GEOConfigPersistence clearExpirationForKeyPath:](self->super._persister, "clearExpirationForKeyPath:", v8);
    }
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOConfigPostKeyExpirysChangedNotificationSource(v13, self->super._source);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: key.length > 0", v14, 2u);
  }

}

- (void)clearConfigKeyExpiry:(id)a3
{
  -[GEOConfigStorageSQLite setConfigKeyExpiry:date:osVersion:](self, "setConfigKeyExpiry:date:osVersion:", a3, 0, 0);
}

@end
