@implementation GEOConfigStorageExpiryCached

- (BOOL)getConfigKeyIsExpired:(id)a3
{
  void *v3;
  char v4;

  -[GEOConfigStorageExpiryCached _expiryForKey:](self, "_expiryForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpired");

  return v4;
}

- (id)_expiryForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[NSDictionary objectForKeyedSubscript:](self->_cachedValues, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)initForSource:(int64_t)a3
{
  GEOConfigStorageExpiryCached *v4;
  GEOConfigStorageExpiryCached *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *cachedValues;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOConfigStorageExpiryCached;
  v4 = -[GEOConfigStorageExpiryCached init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((unint64_t)a3 > 9)
      v6 = 983040;
    else
      v6 = qword_189CE4700[a3];
    v4->_options = v6;
    v4->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = (NSDictionary *)v7;

    -[GEOConfigStorageExpiryCached resync](v5, "resync");
  }
  return v5;
}

- (void)resync
{
  void *v3;
  unint64_t options;
  _QWORD v5[5];

  +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__GEOConfigStorageExpiryCached_resync__block_invoke;
  v5[3] = &unk_1E1C21838;
  v5[4] = self;
  objc_msgSend(v3, "getExpiringKeys:result:", options, v5);

}

void __38__GEOConfigStorageExpiryCached_resync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  os_unfair_lock_lock_with_options();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;
  v6 = v3;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)getAllExpiringKeys
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cachedValues;
  os_unfair_lock_unlock(p_lock);
  return v4;
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
  -[GEOConfigStorageExpiryCached _expiryForKey:](self, "_expiryForKey:", v8);
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
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfigKeyExpiry:options:date:osVersion:", v10, self->_options, v9, v8);

}

- (void)clearConfigKeyExpiry:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfigKeyExpiry:options:date:osVersion:", v4, self->_options, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
}

@end
