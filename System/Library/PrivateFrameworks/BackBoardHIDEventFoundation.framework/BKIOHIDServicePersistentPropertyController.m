@implementation BKIOHIDServicePersistentPropertyController

uint64_t __90__BKIOHIDServicePersistentPropertyController_setPersistentProperties_forSenderDescriptor___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "setPersistentProperties:forServicesMatchingDescriptor:", a1[4], a1[5]);
  if (v4 == 1)
  {
    BKLogHID();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1[6] + 40);
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = (id)objc_opt_class();
      v15 = 2048;
      v16 = v3;
      v7 = v14;
      _os_log_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEFAULT, "setPersistentProperties(%{public}@): properties disallowed by handler <%{public}@: %p>", (uint8_t *)&v11, 0x20u);
      goto LABEL_7;
    }
  }
  else
  {
    if (v4)
    {
      v9 = 1;
      goto LABEL_10;
    }
    BKLogHID();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1[6] + 40);
      v11 = 138543874;
      v12 = v6;
      v13 = 2114;
      v14 = (id)objc_opt_class();
      v15 = 2048;
      v16 = v3;
      v7 = v14;
      _os_log_debug_impl(&dword_1C8914000, v5, OS_LOG_TYPE_DEBUG, "setPersistentProperties(%{public}@): handler <%{public}@: %p> does not handle this sender descriptor", (uint8_t *)&v11, 0x20u);
LABEL_7:

    }
  }

  v9 = 0;
LABEL_10:

  return v9;
}

- (void)setPersistentProperties:(id)a3 forSenderDescriptor:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  BKIOHIDServicePersistentPropertyController *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  NSString *defaultsKey;
  BKIOHIDServicePersistentPropertyController *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  NSString *v23;
  id v24;
  id v25;
  void *DeepCopy;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSString *v42;
  objc_class *v43;
  BKIOHIDServicePersistentPropertyController *v44;
  id v45;
  void *v46;
  os_unfair_lock_t lock;
  void *v48;
  BKIOHIDServicePersistentPropertyController *v49;
  id v50;
  BKIOHIDServicePersistentPropertyController *v51;
  _QWORD v52[4];
  id v53;
  BKIOHIDServicePersistentPropertyController *v54;
  BKIOHIDServicePersistentPropertyController *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[2];
  _QWORD v61[2];
  uint8_t buf[4];
  NSString *v63;
  __int16 v64;
  BKIOHIDServicePersistentPropertyController *v65;
  __int16 v66;
  BKIOHIDServicePersistentPropertyController *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!CFPropertyListIsValid(v7, kCFPropertyListXMLFormat_v1_0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("non-plistable type in %@"), v7);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v42 = (NSString *)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (BKIOHIDServicePersistentPropertyController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v63 = v42;
      v64 = 2114;
      v65 = v44;
      v66 = 2048;
      v67 = self;
      v68 = 2114;
      v69 = CFSTR("BKIOHIDServicePersistentPropertyController.m");
      v70 = 1024;
      v71 = 143;
      v72 = 2114;
      v73 = v41;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v41), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C8918504);
  }
  -[BKIOHIDServicePersistentPropertyController _handlersForSenderDescriptor:](self, "_handlersForSenderDescriptor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __90__BKIOHIDServicePersistentPropertyController_setPersistentProperties_forSenderDescriptor___block_invoke;
  v52[3] = &unk_1E81F79A0;
  v10 = v7;
  v53 = v10;
  v11 = (BKIOHIDServicePersistentPropertyController *)v8;
  v54 = v11;
  v55 = self;
  objc_msgSend(v9, "bs_filter:", v52);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  BKLogHID();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      defaultsKey = self->_defaultsKey;
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v10);
      v17 = (BKIOHIDServicePersistentPropertyController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = defaultsKey;
      v64 = 2114;
      v65 = v17;
      v66 = 2114;
      v67 = v11;
      _os_log_impl(&dword_1C8914000, v14, OS_LOG_TYPE_DEFAULT, "setPersistentProperties(%{public}@): %{public}@ forServicesMatching:(%{public}@)", buf, 0x20u);

    }
    lock = &self->_defaultsLock;
    os_unfair_lock_lock(&self->_defaultsLock);
    v49 = v11;
    -[BKIOHIDServicePersistentPropertyController propertyListEncoded](v11, "propertyListEncoded");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSLocalDefaults valueForKey:defaultValueProvider:](self->_defaultsLock_defaults, "valueForKey:defaultValueProvider:", self->_defaultsKey, &__block_literal_global_17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    v21 = v19;
    if (v20)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v48 = v12;
    v51 = self;
    v24 = v22;

    v25 = (id)objc_msgSend(v24, "mutableCopy");
    if (!v25)
      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = v18;
    v50 = v10;
    v45 = v10;
    v46 = v25;
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v25, 1uLL);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v27 = DeepCopy;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v57;
      while (2)
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v57 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v31);
          v33 = objc_opt_class();
          v34 = v32;
          if (v33)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v35 = v34;
            else
              v35 = 0;
          }
          else
          {
            v35 = 0;
          }
          v36 = v35;

          if (v36)
          {
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("sender"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("props"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v37, "isEqual:", v14))
            {
              v39 = v45;
              objc_msgSend(v38, "addEntriesFromDictionary:", v45);

              v40 = v27;
              goto LABEL_31;
            }

          }
          ++v31;
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
        if (v29)
          continue;
        break;
      }
    }

    v60[0] = CFSTR("sender");
    v60[1] = CFSTR("props");
    v39 = v45;
    v61[0] = v14;
    v61[1] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v40);
LABEL_31:

    -[BKSLocalDefaults setValue:forKey:](v51->_defaultsLock_defaults, "setValue:forKey:", v27, v51->_defaultsKey);
    os_unfair_lock_unlock(lock);

    v11 = v49;
    v10 = v50;
    v12 = v48;
  }
  else if (v15)
  {
    v23 = self->_defaultsKey;
    *(_DWORD *)buf = 138543618;
    v63 = v23;
    v64 = 2114;
    v65 = v11;
    _os_log_impl(&dword_1C8914000, v14, OS_LOG_TYPE_DEFAULT, "setPersistentProperties(%{public}@): no support for <%{public}@>", buf, 0x16u);
  }

}

- (id)allPersistentPropertiesForServicesMatchingDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_unfair_lock_t lock;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  lock = &self->_defaultsLock;
  os_unfair_lock_lock(&self->_defaultsLock);
  -[BKSLocalDefaults valueForKey:defaultValueProvider:](self->_defaultsLock_defaults, "valueForKey:defaultValueProvider:", self->_defaultsKey, &__block_literal_global_24_2347);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sender"), lock);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00D30]), "initFromPropertyList:", v11);
        if (objc_msgSend(v4, "matchesDescriptor:failureReason:", v12, 0))
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("props"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
            objc_msgSend(v16, "addEntriesFromDictionary:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  os_unfair_lock_unlock(lock);

  return v16;
}

- (BKIOHIDServicePersistentPropertyController)initWithClientEntitlement:(id)a3 defaults:(id)a4 defaultsKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKIOHIDServicePersistentPropertyController *v12;
  BKIOHIDServicePersistentPropertyController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKIOHIDServicePersistentPropertyController;
  v12 = -[BKIOHIDServicePersistentPropertyController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientEntitlement, a3);
    objc_storeStrong((id *)&v13->_defaultsLock_defaults, a4);
    objc_storeStrong((id *)&v13->_defaultsKey, a5);
    *(_QWORD *)&v13->_handlersLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)registerHandler:(id)a3
{
  NSMutableArray *handlersLock_handlers;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_handlersLock);
  handlersLock_handlers = self->_handlersLock_handlers;
  if (!handlersLock_handlers)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_handlersLock_handlers;
    self->_handlersLock_handlers = v5;

    handlersLock_handlers = self->_handlersLock_handlers;
  }
  -[NSMutableArray addObject:](handlersLock_handlers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_handlersLock);

}

- (id)_handlersForSenderDescriptor:(id)a3
{
  id v4;
  os_unfair_lock_s *p_handlersLock;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_handlersLock = &self->_handlersLock;
  os_unfair_lock_lock(&self->_handlersLock);
  v6 = (void *)-[NSMutableArray copy](self->_handlersLock_handlers, "copy");
  os_unfair_lock_unlock(p_handlersLock);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__BKIOHIDServicePersistentPropertyController__handlersForSenderDescriptor___block_invoke;
  v10[3] = &unk_1E81F7978;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)persistentPropertiesForKeys:(id)a3 forSenderDescriptor:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_defaultsLock;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  id v31;
  id v32;
  os_unfair_lock_s *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_defaultsLock = &self->_defaultsLock;
  os_unfair_lock_lock(&self->_defaultsLock);
  objc_msgSend(v7, "propertyListEncoded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSLocalDefaults valueForKey:defaultValueProvider:](self->_defaultsLock_defaults, "valueForKey:defaultValueProvider:", self->_defaultsKey, &__block_literal_global_18_2353);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v33 = &self->_defaultsLock;
    v12 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("sender"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqual:", v9))
        {
          v30 = v9;
          v31 = v7;
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("props"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v32 = v6;
          v18 = v6;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v36 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
                objc_msgSend(v17, "objectForKeyedSubscript:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v24;
                if (v24)
                {
                  v26 = (void *)objc_msgSend(v24, "copy");
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, v23);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v20);
          }

          v7 = v31;
          v6 = v32;
          v9 = v30;
          goto LABEL_20;
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v11)
        continue;
      break;
    }
    v16 = 0;
LABEL_20:
    p_defaultsLock = v33;
  }
  else
  {
    v16 = 0;
  }

  os_unfair_lock_unlock(p_defaultsLock);
  if (v16)
    v27 = v16;
  else
    v27 = (void *)MEMORY[0x1E0C9AA70];
  v28 = v27;

  return v28;
}

- (NSString)clientEntitlement
{
  return self->_clientEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_clientEntitlement, 0);
  objc_storeStrong((id *)&self->_handlersLock_handlers, 0);
  objc_storeStrong((id *)&self->_defaultsLock_defaults, 0);
}

uint64_t __99__BKIOHIDServicePersistentPropertyController_allPersistentPropertiesForServicesMatchingDescriptor___block_invoke()
{
  return 0;
}

uint64_t __94__BKIOHIDServicePersistentPropertyController_persistentPropertiesForKeys_forSenderDescriptor___block_invoke()
{
  return 0;
}

uint64_t __90__BKIOHIDServicePersistentPropertyController_setPersistentProperties_forSenderDescriptor___block_invoke_15()
{
  return 0;
}

uint64_t __75__BKIOHIDServicePersistentPropertyController__handlersForSenderDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handlesPersistentPropertiesForSenderDescriptor:", *(_QWORD *)(a1 + 32));
}

+ (id)sharedInstances
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__BKIOHIDServicePersistentPropertyController_sharedInstances__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstances_onceToken != -1)
    dispatch_once(&sharedInstances_onceToken, block);
  return (id)sharedInstances_sharedInstances;
}

+ (id)digitizerServicePersistentPropertyController
{
  if (digitizerServicePersistentPropertyController_onceToken != -1)
    dispatch_once(&digitizerServicePersistentPropertyController_onceToken, &__block_literal_global_2379);
  return (id)digitizerServicePersistentPropertyController_sharedController;
}

+ (id)touchSensitiveButtonServicePersistentPropertyController
{
  if (touchSensitiveButtonServicePersistentPropertyController_onceToken != -1)
    dispatch_once(&touchSensitiveButtonServicePersistentPropertyController_onceToken, &__block_literal_global_4_2374);
  return (id)touchSensitiveButtonServicePersistentPropertyController_sharedController;
}

void __101__BKIOHIDServicePersistentPropertyController_touchSensitiveButtonServicePersistentPropertyController__block_invoke()
{
  BKIOHIDServicePersistentPropertyController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [BKIOHIDServicePersistentPropertyController alloc];
  objc_msgSend(MEMORY[0x1E0D00C68], "localDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[BKIOHIDServicePersistentPropertyController initWithClientEntitlement:defaults:defaultsKey:](v0, "initWithClientEntitlement:defaults:defaultsKey:", CFSTR("com.apple.backboardd.hidPersistentProperty-TouchSensitiveButton"), v3, CFSTR("BKTouchSensitiveButtonPersistentServiceProperties"));
  v2 = (void *)touchSensitiveButtonServicePersistentPropertyController_sharedController;
  touchSensitiveButtonServicePersistentPropertyController_sharedController = v1;

}

void __90__BKIOHIDServicePersistentPropertyController_digitizerServicePersistentPropertyController__block_invoke()
{
  BKIOHIDServicePersistentPropertyController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [BKIOHIDServicePersistentPropertyController alloc];
  objc_msgSend(MEMORY[0x1E0D00C68], "localDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[BKIOHIDServicePersistentPropertyController initWithClientEntitlement:defaults:defaultsKey:](v0, "initWithClientEntitlement:defaults:defaultsKey:", CFSTR("com.apple.backboardd.hidPersistentProperty-digitizer"), v3, CFSTR("BKDigitizerPersistentServiceProperties"));
  v2 = (void *)digitizerServicePersistentPropertyController_sharedController;
  digitizerServicePersistentPropertyController_sharedController = v1;

}

void __61__BKIOHIDServicePersistentPropertyController_sharedInstances__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(*(id *)(a1 + 32), "digitizerServicePersistentPropertyController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "touchSensitiveButtonServicePersistentPropertyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithObjects:", v6, v3, 0);
  v5 = (void *)sharedInstances_sharedInstances;
  sharedInstances_sharedInstances = v4;

}

@end
