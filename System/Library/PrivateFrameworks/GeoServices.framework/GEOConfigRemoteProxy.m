@implementation GEOConfigRemoteProxy

- (id)configStoreForOptions:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = a3 & 0xFF0000;
  if ((a3 & 0xFF0000) < 0x40000)
  {
    if (v3 == 0x10000)
    {
      v4 = 3;
      return -[GEOConfigRemoteProxy configStoreForSource:](self, "configStoreForSource:", v4);
    }
    if (v3 == 0x20000)
    {
      v4 = 6;
      return -[GEOConfigRemoteProxy configStoreForSource:](self, "configStoreForSource:", v4);
    }
LABEL_13:
    v4 = 0;
    return -[GEOConfigRemoteProxy configStoreForSource:](self, "configStoreForSource:", v4);
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    v4 = 7;
    return -[GEOConfigRemoteProxy configStoreForSource:](self, "configStoreForSource:", v4);
  }
  if (v3 == 0x80000)
  {
    v4 = 8;
    return -[GEOConfigRemoteProxy configStoreForSource:](self, "configStoreForSource:", v4);
  }
  if (v3 != 983040)
    goto LABEL_13;
  v4 = 2;
  return -[GEOConfigRemoteProxy configStoreForSource:](self, "configStoreForSource:", v4);
}

- (id)configStoreForSource:(int64_t)a3
{
  GEOConfigStorageFallbackWriter *v5;
  uint64_t v6;
  GEOConfigStorageReadWriteAdapter *v8;
  void *v9;
  GEOConfigStorageFallbackWriter *v10;
  GEOConfigStorageFallbackWriter *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  -[NSPointerArray pointerAtIndex:](self->_configStores, "pointerAtIndex:", a3);
  v5 = (GEOConfigStorageFallbackWriter *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  if (!v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    -[NSPointerArray pointerAtIndex:](self->_configStores, "pointerAtIndex:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = (GEOConfigStorageFallbackWriter *)v6;
    }
    else
    {
      switch(a3)
      {
        case 0:
        case 1:
        case 5:
        case 9:
          os_unfair_recursive_lock_unlock();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            GEODefaultsSourceAsString(a3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v17 = v14;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %@", buf, 0xCu);

          }
          return 0;
        case 2:
          v11 = [GEOConfigStorageFallbackWriter alloc];
          _GEOConfigStorageCFPrefsReadOnly();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[GEOConfigStorageFallbackWriter initWithStorage:writer:](v11, "initWithStorage:writer:", v12, v13);

          goto LABEL_12;
        case 3:
        case 4:
          v8 = [GEOConfigStorageReadWriteAdapter alloc];
          _GEOGetConfigStorageRemote();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[GEOConfigStorageReadWriteAdapter initWithStorage:](v8, "initWithStorage:", v9);
LABEL_12:

          break;
        case 6:
        case 7:
          v10 = -[GEOConfigStorageCached initForSource:]([GEOConfigStorageCached alloc], "initForSource:", a3);
          goto LABEL_14;
        case 8:
          +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
          v10 = (GEOConfigStorageFallbackWriter *)objc_claimAutoreleasedReturnValue();
LABEL_14:
          v5 = v10;
          break;
        default:
          v5 = 0;
          break;
      }
      -[NSPointerArray replacePointerAtIndex:withPointer:](self->_configStores, "replacePointerAtIndex:withPointer:", a3, v5);
    }
    os_unfair_recursive_lock_unlock();
  }
  return v5;
}

- (id)configExpiryForSource:(int64_t)a3
{
  objc_class *v3;
  uint64_t v6;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v3 = 0;
  v13 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 > 9)
    return v3;
  if (((1 << a3) & 0x223) == 0)
  {
    if (((1 << a3) & 0x84) != 0)
    {
      v6 = 24;
      goto LABEL_10;
    }
    if (((1 << a3) & 0x140) != 0)
    {
      v6 = 32;
LABEL_10:
      os_unfair_recursive_lock_lock_with_options();
      v8 = (objc_class *)*(id *)((char *)&self->super.isa + v6);
      os_unfair_recursive_lock_unlock();
      if (!v8)
      {
        os_unfair_recursive_lock_lock_with_options();
        v8 = (objc_class *)*(id *)((char *)&self->super.isa + v6);
        if (!v8)
        {
          v8 = (objc_class *)-[GEOConfigStorageExpiryCached initForSource:]([GEOConfigStorageExpiryCached alloc], "initForSource:", a3);
          v9 = *(Class *)((char *)&self->super.isa + v6);
          *(Class *)((char *)&self->super.isa + v6) = v8;

        }
        os_unfair_recursive_lock_unlock();
      }
      v3 = v8;

    }
    return v3;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    GEODefaultsSourceAsString(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %@", (uint8_t *)&v11, 0xCu);

  }
  return 0;
}

- (id)configExpiryForOptions:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  v3 = a3 & 0xFF0000;
  if ((a3 & 0xFF0000) < 0x40000)
  {
    if (v3 == 0x10000)
    {
      v4 = 3;
      return -[GEOConfigRemoteProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
    }
    if (v3 == 0x20000)
    {
      v4 = 6;
      return -[GEOConfigRemoteProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
    }
LABEL_13:
    v4 = 0;
    return -[GEOConfigRemoteProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    v4 = 7;
    return -[GEOConfigRemoteProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
  }
  if (v3 == 0x80000)
  {
    v4 = 8;
    return -[GEOConfigRemoteProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
  }
  if (v3 != 983040)
    goto LABEL_13;
  v4 = 2;
  return -[GEOConfigRemoteProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
}

- (GEOConfigRemoteProxy)init
{
  GEOConfigRemoteProxy *v2;
  GEOConfigRemoteProxy *v3;
  uint64_t v4;
  NSPointerArray *configStores;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOConfigRemoteProxy;
  v2 = -[GEOConfigRemoteProxy init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock = 0;
    objc_msgSend(MEMORY[0x1E0CB3868], "strongObjectsPointerArray");
    v4 = objc_claimAutoreleasedReturnValue();
    configStores = v3->_configStores;
    v3->_configStores = (NSPointerArray *)v4;

    if (-[NSPointerArray count](v3->_configStores, "count") <= 8)
    {
      do
        -[NSPointerArray addPointer:](v3->_configStores, "addPointer:", 0);
      while (-[NSPointerArray count](v3->_configStores, "count") < 9);
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirySystem, 0);
  objc_storeStrong((id *)&self->_expiryUser, 0);
  objc_storeStrong((id *)&self->_configStores, 0);
}

@end
