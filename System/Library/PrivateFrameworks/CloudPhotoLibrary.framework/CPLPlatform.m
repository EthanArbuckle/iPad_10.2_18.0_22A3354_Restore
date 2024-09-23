@implementation CPLPlatform

+ (void)setProxyImplementationForPlatform:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v3 = objc_opt_class();
  objc_msgSend(v6, "setPlatformImplementation:forClass:", v3, objc_opt_class());
  v4 = objc_opt_class();
  objc_msgSend(v6, "setPlatformImplementation:forClass:", v4, objc_opt_class());
  v5 = objc_opt_class();
  objc_msgSend(v6, "setPlatformImplementation:forClass:", v5, objc_opt_class());

}

- (CPLPlatform)init
{
  CPLPlatform *v2;
  uint64_t v3;
  NSMapTable *abstractClassToImplementation;
  dispatch_queue_t v5;
  OS_dispatch_queue *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPLPlatform;
  v2 = -[CPLPlatform init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    abstractClassToImplementation = v2->_abstractClassToImplementation;
    v2->_abstractClassToImplementation = (NSMapTable *)v3;

    v5 = dispatch_queue_create("com.apple.cpl.platform", 0);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)setPlatformImplementation:(Class)a3 forClass:(Class)a4
{
  NSObject *v8;
  id v9;
  NSObject *lock;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[7];
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  Class v26;
  __int16 v27;
  Class v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLPlatformOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = a3;
        v23 = 2112;
        v24 = (id)objc_opt_class();
        v12 = v24;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "%@ should be a subclass of %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v14, 89, CFSTR("%@ should be a subclass of %@"), a3, objc_opt_class());

    abort();
  }
  if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_1EEEBA410) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLPlatformOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        NSStringFromProtocol((Protocol *)&unk_1EEEBA410);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = a4;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "%@ should conform to %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)&unk_1EEEBA410);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 90, CFSTR("%@ should conform to %@"), a4, v19);

    abort();
  }
  if (!_CPLSilentLogging)
  {
    __CPLPlatformOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v22 = (id)objc_opt_class();
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = a4;
      v27 = 2112;
      v28 = a3;
      v9 = v22;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEBUG, "<%@ %p> registering platform implementation %@ -> %@", buf, 0x2Au);

    }
  }
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CPLPlatform_setPlatformImplementation_forClass___block_invoke;
  block[3] = &unk_1E60DD5C8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(lock, block);
}

- (Class)implementationClassForAbstractClass:(Class)a3
{
  NSObject *lock;
  void *v6;
  void *v7;
  id v8;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v20 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CPLPlatform_implementationClassForAbstractClass___block_invoke;
  block[3] = &unk_1E60DD5F0;
  block[5] = &v17;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(lock, block);
  v6 = (void *)v18[3];
  if (v6)
  {
    if (!objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()))
    {
      if (!_CPLSilentLogging)
      {
        __CPLPlatformOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = v18[3];
          v12 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v22 = v11;
          v23 = 2112;
          v24 = v12;
          v13 = v12;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "%@ is not a subclass of %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 132, CFSTR("%@ is not a subclass of %@"), v18[3], objc_opt_class());

      abort();
    }
    v7 = (void *)v18[3];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v17, 8);
  return (Class)v8;
}

- (id)newPlatformImplementationForObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(-[CPLPlatform implementationClassForAbstractClass:](self, "implementationClassForAbstractClass:", objc_opt_class())), "initWithAbstractObject:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  NSObject *lock;
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ "), objc_opt_class());
  lock = self->_lock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CPLPlatform_description__block_invoke;
  block[3] = &unk_1E60D6F88;
  block[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(lock, block);
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  v6 = v10;
  v7 = v5;

  return v7;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_abstractClassToImplementation, 0);
}

void __26__CPLPlatform_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("[%@]"), *(_QWORD *)(v2 + 24));
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (objc_msgSend(*(id *)(v2 + 8), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dictionaryRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __26__CPLPlatform_description__block_invoke_2;
    v4[3] = &unk_1E60DD618;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

  }
}

uint64_t __26__CPLPlatform_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ -> %@\n"), a2, a3);
}

void __51__CPLPlatform_implementationClassForAbstractClass___block_invoke(_QWORD *a1, __n128 a2)
{
  objc_class *v3;
  void *v4;
  NSString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  NSObject *v10;
  uint64_t v11;
  objc_class *v12;
  __n128 v13;
  uint8_t buf[4];
  objc_class *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)a1[6];
  a2.n128_u64[0] = 138412290;
  v13 = a2;
  while (1)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = (id)objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", v3, *(_OWORD *)&v13);
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
      break;
    if (*(_QWORD *)(a1[4] + 24))
    {
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", *(_QWORD *)(a1[4] + 24));
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = NSClassFromString(v5);
      v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      if (v6)
      {
        if (!_CPLSilentLogging)
        {
          __CPLPlatformOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v11 = a1[6];
            v12 = *(objc_class **)(*(_QWORD *)(a1[5] + 8) + 24);
            *(_DWORD *)buf = 138412546;
            v15 = v12;
            v16 = 2112;
            v17 = v11;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Found %@ as implementation for %@", buf, 0x16u);
          }

          v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
        }
        objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", v6, a1[6]);

        return;
      }

    }
    v3 = (objc_class *)-[objc_class superclass](v3, "superclass");
    if (!_CPLSilentLogging)
    {
      __CPLPlatformOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v13.n128_u32[0];
        v15 = v3;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Trying %@", buf, 0xCu);
      }

    }
    if (v3 == (objc_class *)objc_opt_class())
    {
      if (!_CPLSilentLogging)
      {
        __CPLPlatformOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = (objc_class *)a1[6];
          *(_DWORD *)buf = v13.n128_u32[0];
          v15 = v9;
          _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Found no implementation for %@", buf, 0xCu);
        }

      }
      return;
    }
  }
  if (v3 != (objc_class *)a1[6])
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:");
}

uint64_t __50__CPLPlatform_setPlatformImplementation_forClass___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKey:", a1[5], a1[6]);
}

+ (void)setDefaultPlatform:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  if (!_CPLSilentLogging)
  {
    __CPLPlatformOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "Setting default platform to %@", (uint8_t *)&v7, 0xCu);
    }

  }
  v6 = (void *)_defaultPlatform;
  _defaultPlatform = (uint64_t)v3;

  objc_sync_exit(v4);
}

+ (id)defaultPlatform
{
  void *v2;
  id v3;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  v3 = (id)_defaultPlatform;
  objc_sync_exit(v2);

  return v3;
}

@end
