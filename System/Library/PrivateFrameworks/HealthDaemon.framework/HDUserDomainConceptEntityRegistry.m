@implementation HDUserDomainConceptEntityRegistry

- (HDUserDomainConceptEntityRegistry)initWithDaemon:(id)a3
{
  id v4;
  HDUserDomainConceptEntityRegistry *v5;
  HDUserDomainConceptEntityRegistry *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDUserDomainConceptEntityRegistry;
  v5 = -[HDUserDomainConceptEntityRegistry init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

+ (HDUserDomainConceptEntityRegistry)sharedInstance
{
  id v4;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_211);
  v4 = (id)qword_1ED552378;
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_211);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDUserDomainConceptEntityRegistry.m"), 52, CFSTR("The shared instance of HDUserDomainConceptEntityRegistry is nil. Something went wrong at initialization, and the static variable was never set."));

  }
  return (HDUserDomainConceptEntityRegistry *)v4;
}

+ (void)_setSharedInstance:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_211);
  v4 = (void *)qword_1ED552378;
  qword_1ED552378 = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_211);
}

+ (HDUserDomainConceptEntityRegistry)registryWithDaemon:(id)a3 setSharedInstance:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HDUserDomainConceptEntityRegistry *v7;

  v4 = a4;
  v6 = a3;
  v7 = -[HDUserDomainConceptEntityRegistry initWithDaemon:]([HDUserDomainConceptEntityRegistry alloc], "initWithDaemon:", v6);

  if (v4)
    objc_msgSend(a1, "_setSharedInstance:", v7);
  return v7;
}

- (Class)userDomainConceptEntityClassForTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDUserDomainConceptEntityRegistry _registeredUserDomainConceptEntityClasses](self, "_registeredUserDomainConceptEntityClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (id)registeredUserDomainConceptEntityClasses
{
  void *v2;
  void *v3;

  -[HDUserDomainConceptEntityRegistry _registeredUserDomainConceptEntityClasses](self, "_registeredUserDomainConceptEntityClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_registeredUserDomainConceptEntityClasses
{
  os_unfair_lock_s *p_lock;
  NSDictionary *lock_typeIdentifierToEntityClass;
  NSDictionary *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_typeIdentifierToEntityClass = self->_lock_typeIdentifierToEntityClass;
  if (!lock_typeIdentifierToEntityClass)
  {
    -[HDUserDomainConceptEntityRegistry _lock_loadUserDomainConceptEntities](self, "_lock_loadUserDomainConceptEntities");
    lock_typeIdentifierToEntityClass = self->_lock_typeIdentifierToEntityClass;
  }
  v5 = lock_typeIdentifierToEntityClass;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_registerUserDomainConceptClassesFromProvider:(id)a3 classRegistry:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  HDUserDomainConceptEntityRegistry *v17;
  void *v18;
  const char *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "userDomainConceptEntityClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "objectForKeyedSubscript:", v15))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = a2;
          v20 = v7;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "description");
          v17 = self;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v19, v17, CFSTR("HDUserDomainConceptEntityRegistry.m"), 115, CFSTR("Attempting to register an already existing User Domain Concept identifier (%@) is unsupported. Please update the providing class (%@) and make sure the identifier schema is not used in any other plugin."), v18, objc_opt_class());

          self = v17;
          a2 = v19;
          v7 = v20;
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", v15), v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

}

- (void)_lock_loadUserDomainConceptEntities
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *v15;
  NSDictionary *lock_typeIdentifierToEntityClass;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[HDUserDomainConceptEntityRegistry _builtinUserDomainConceptEntityClasses](self, "_builtinUserDomainConceptEntityClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "pluginManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginsConformingToProtocol:", &unk_1EF252458);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[HDUserDomainConceptEntityRegistry _registerUserDomainConceptClassesFromProvider:classRegistry:](self, "_registerUserDomainConceptClassesFromProvider:classRegistry:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), v5, (_QWORD)v17);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v15 = (NSDictionary *)objc_msgSend(v5, "copy");
  lock_typeIdentifierToEntityClass = self->_lock_typeIdentifierToEntityClass;
  self->_lock_typeIdentifierToEntityClass = v15;

}

- (id)_builtinUserDomainConceptEntityClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6D48], "baseUserDomainConceptIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB6D48], "medicalUserDomainConceptIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB6D48], "listUserDomainConceptIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  v8[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_lock_typeIdentifierToEntityClass, 0);
}

@end
