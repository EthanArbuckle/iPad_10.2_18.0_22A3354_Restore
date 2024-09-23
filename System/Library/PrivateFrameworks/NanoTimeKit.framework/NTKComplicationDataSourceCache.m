@implementation NTKComplicationDataSourceCache

void __87__NTKComplicationDataSourceCache__dataSourceClassForComplicationType_family_forDevice___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_dataSourceClassForComplicationType_family_forDevice____dataSourceClasses;
  _dataSourceClassForComplicationType_family_forDevice____dataSourceClasses = v0;

}

void __48__NTKComplicationDataSourceCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = v0;

}

- (NTKComplicationDataSourceCache)init
{
  NTKComplicationDataSourceCache *v2;
  NTKComplicationDataSourceCache *v3;
  uint64_t v4;
  NSMutableDictionary *lock_cache;
  const char *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationDataSourceCache;
  v2 = -[NTKComplicationDataSourceCache init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    lock_cache = v3->_lock_cache;
    v3->_lock_cache = (NSMutableDictionary *)v4;

    objc_initWeak(&location, v3);
    v6 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D517F0], "UTF8String");
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__NTKComplicationDataSourceCache_init__block_invoke;
    v10[3] = &unk_1E6BCE7B0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v3->_capabilitiesChangedNotificationToken, v7, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (Class)dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  objc_class *v14;
  objc_class *v15;
  void *v16;

  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "nrDeviceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNrDeviceUUID:", v10);

  objc_msgSend(v9, "setComplicationType:", a3);
  objc_msgSend(v9, "setComplicationFamily:", a4);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_cache, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
  {
    v14 = -[NTKComplicationDataSourceCache _dataSourceClassForComplicationType:family:forDevice:](self, "_dataSourceClassForComplicationType:family:forDevice:", a3, a4, v8);
    os_unfair_lock_lock(&self->_lock);
    if (v14)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_cache, "setObject:forKeyedSubscript:", v14, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_cache, "setObject:forKeyedSubscript:", v16, v9);

    }
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  v14 = (objc_class *)v11;
  if ((v13 & 1) == 0)
  {
LABEL_8:
    v15 = v14;
    goto LABEL_9;
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (Class)_dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (_dataSourceClassForComplicationType_family_forDevice__onceToken != -1)
    dispatch_once(&_dataSourceClassForComplicationType_family_forDevice__onceToken, &__block_literal_global_43_1);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__NTKComplicationDataSourceCache__dataSourceClassForComplicationType_family_forDevice___block_invoke_2;
  v20[3] = &unk_1E6BD5E68;
  v20[4] = &v21;
  v20[5] = a3;
  objc_msgSend(v8, "enumerateBundlesForComplicationFamily:device:withBlock:", a4, v7, v20);

  if (*((_BYTE *)v22 + 24))
  {
    v9 = 0;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = (id)_dataSourceClassForComplicationType_family_forDevice____dataSourceClasses;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
LABEL_7:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "acceptsComplicationType:withFamily:forDevice:", a3, a4, v7, (_QWORD)v16) & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
          if (v11)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      v14 = 0;
    }

    v9 = v14;
  }
  _Block_object_dispose(&v21, 8);

  return (Class)v9;
}

+ (NTKComplicationDataSourceCache)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1)
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_113);
  return (NTKComplicationDataSourceCache *)(id)sharedInstance_instance_1;
}

void __38__NTKComplicationDataSourceCache_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateCache");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_capabilitiesChangedNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationDataSourceCache;
  -[NTKComplicationDataSourceCache dealloc](&v3, sel_dealloc);
}

- (void)_invalidateCache
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_lock_cache, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

void __87__NTKComplicationDataSourceCache__dataSourceClassForComplicationType_family_forDevice___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v10 && objc_msgSend(v10, "integerValue") == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_cache, 0);
}

@end
