@implementation _HMAccessoryCollectionSettingItemClassManager

- (_HMAccessoryCollectionSettingItemClassManager)init
{
  _HMAccessoryCollectionSettingItemClassManager *v2;
  uint64_t v3;
  NSMutableDictionary *classes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HMAccessoryCollectionSettingItemClassManager;
  v2 = -[_HMAccessoryCollectionSettingItemClassManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    classes = v2->_classes;
    v2->_classes = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)hasCustomItemValueClassesForKeyPath:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_classes, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v6 != 0;

  os_unfair_lock_unlock(p_lock);
  return (char)self;
}

- (id)itemValueClassesForKeyPath:(id)a3
{
  os_unfair_lock_s *v3;
  id v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  void *v10;
  _Unwind_Exception *v12;

  v5 = a3;
  if (!v5)
  {
    v12 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v12);
  }
  v6 = v5;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_classes, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v8, "count"))
  {
    v9 = v8;
  }
  else
  {
    +[_HMAccessoryCollectionSettingItemClassManager defaultItemValueClasses](_HMAccessoryCollectionSettingItemClassManager, "defaultItemValueClasses");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (void)setItemValueClasses:(id)a3 forKeyPath:(id)a4
{
  os_unfair_lock_s *v4;
  id v7;
  void *v8;
  void *v9;
  _Unwind_Exception *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (!v7)
  {
    v10 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v4);
    _Unwind_Resume(v10);
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(v11, "copy");
  os_unfair_lock_lock_with_options();
  if (objc_msgSend(v9, "count"))
    -[NSMutableDictionary setObject:forKey:](self->_classes, "setObject:forKey:", v9, v8);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeItemValueClassesForKeyPath:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_classes, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);
}

+ (NSSet)defaultItemValueClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (_HMAccessoryCollectionSettingItemClassManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_412);
  return (_HMAccessoryCollectionSettingItemClassManager *)(id)sharedManager_sharedManager;
}

@end
