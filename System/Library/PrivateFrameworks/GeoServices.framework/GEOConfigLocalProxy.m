@implementation GEOConfigLocalProxy

- (id)configExpiryForSource:(int64_t)a3
{
  void *v4;
  id result;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 5:
    case 9:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_8;
      goto LABEL_3;
    case 2:
    case 7:
      _GEOConfigStorageExpiryUser();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
    case 4:
      goto LABEL_6;
    case 6:
    case 8:
      _GEOConfigStorageExpirySystem();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      result = v4;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
LABEL_8:
        GEODefaultsSourceAsString(a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v6;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %{public}@", (uint8_t *)&v7, 0xCu);

      }
LABEL_3:
      result = 0;
      break;
  }
  return result;
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
      return -[GEOConfigLocalProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
    }
    if (v3 == 0x20000)
    {
      v4 = 6;
      return -[GEOConfigLocalProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
    }
LABEL_13:
    v4 = 0;
    return -[GEOConfigLocalProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    v4 = 7;
    return -[GEOConfigLocalProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
  }
  if (v3 == 0x80000)
  {
    v4 = 8;
    return -[GEOConfigLocalProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
  }
  if (v3 != 983040)
    goto LABEL_13;
  v4 = 2;
  return -[GEOConfigLocalProxy configExpiryForSource:](self, "configExpiryForSource:", v4);
}

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
      return -[GEOConfigLocalProxy configStoreForSource:](self, "configStoreForSource:", v4);
    }
    if (v3 == 0x20000)
    {
      v4 = 6;
      return -[GEOConfigLocalProxy configStoreForSource:](self, "configStoreForSource:", v4);
    }
LABEL_13:
    v4 = 0;
    return -[GEOConfigLocalProxy configStoreForSource:](self, "configStoreForSource:", v4);
  }
  if ((a3 & 0xFF0000) == 0x40000)
  {
    v4 = 7;
    return -[GEOConfigLocalProxy configStoreForSource:](self, "configStoreForSource:", v4);
  }
  if (v3 == 0x80000)
  {
    v4 = 8;
    return -[GEOConfigLocalProxy configStoreForSource:](self, "configStoreForSource:", v4);
  }
  if (v3 != 983040)
    goto LABEL_13;
  v4 = 2;
  return -[GEOConfigLocalProxy configStoreForSource:](self, "configStoreForSource:", v4);
}

- (id)configStoreForSource:(int64_t)a3
{
  _GEOConfigStorageLocalHelper *v5;
  uint64_t v6;
  GEOConfigStorageReadWriteAdapter *v8;
  void *v9;
  uint64_t v10;
  _GEOConfigStorageLocalHelper *v11;
  _GEOConfigStorageLocalHelper *v12;
  uint64_t v13;
  _GEOConfigStorageLocalHelper *v14;
  void *v15;
  _GEOConfigStorageLocalHelper *v16;
  uint64_t v17;
  _GEOConfigStorageLocalHelper *v18;
  _GEOConfigStorageLocalHelper *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  -[NSPointerArray pointerAtIndex:](self->_configStores, "pointerAtIndex:", a3);
  v5 = (_GEOConfigStorageLocalHelper *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  if (!v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    -[NSPointerArray pointerAtIndex:](self->_configStores, "pointerAtIndex:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = (_GEOConfigStorageLocalHelper *)v6;
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
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = 138543362;
            v22 = v20;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %{public}@", (uint8_t *)&v21, 0xCu);

          }
          return 0;
        case 2:
          v11 = [_GEOConfigStorageLocalHelper alloc];
          _GEOConfigStorageCFPrefsReadWrite();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          v13 = 2;
          goto LABEL_15;
        case 3:
        case 4:
          v8 = [GEOConfigStorageReadWriteAdapter alloc];
          _GEOGetConfigStorageRemote();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[GEOConfigStorageReadWriteAdapter initWithStorage:](v8, "initWithStorage:", v9);
          goto LABEL_16;
        case 6:
          v14 = [_GEOConfigStorageLocalHelper alloc];
          _GEOConfigStorageSystem();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          _GEOConfigStorageDirectSystemReadWrite();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v14;
          v17 = 6;
          goto LABEL_13;
        case 7:
          v18 = [_GEOConfigStorageLocalHelper alloc];
          _GEOConfigStorageUser();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          _GEOConfigStorageDirectUserReadWrite();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v18;
          v17 = 7;
LABEL_13:
          v5 = -[_GEOConfigStorageLocalHelper initWithSource:store:directStore:](v16, "initWithSource:store:directStore:", v17, v9, v15);

          goto LABEL_17;
        case 8:
          v19 = [_GEOConfigStorageLocalHelper alloc];
          _GEOConfigStorageXPC();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v19;
          v13 = 8;
LABEL_15:
          v10 = -[_GEOConfigStorageLocalHelper initWithSource:store:directStore:](v12, "initWithSource:store:directStore:", v13, v9, 0);
LABEL_16:
          v5 = (_GEOConfigStorageLocalHelper *)v10;
LABEL_17:

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

- (GEOConfigLocalProxy)init
{
  GEOConfigLocalProxy *v2;
  GEOConfigLocalProxy *v3;
  uint64_t v4;
  NSPointerArray *configStores;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOConfigLocalProxy;
  v2 = -[GEOConfigLocalProxy init](&v7, sel_init);
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
  objc_storeStrong((id *)&self->_configStores, 0);
}

@end
