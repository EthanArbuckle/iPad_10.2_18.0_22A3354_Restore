@implementation MLState

- (MLState)initWithBackings:(id)a3
{
  id v4;
  MLState *v5;
  MLState *v6;
  uint64_t v7;
  NSDictionary *backings;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MLState;
  v5 = -[MLState init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_featureProviderRepresentationCacheLock._os_unfair_lock_opaque = 0;
    v5->_stateBuffersLock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    backings = v6->_backings;
    v6->_backings = (NSDictionary *)v7;

  }
  return v6;
}

- (void)getMultiArrayForStateNamed:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  os_unfair_lock_s *p_stateBuffersLock;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  p_stateBuffersLock = &self->_stateBuffersLock;
  os_unfair_lock_lock(&self->_stateBuffersLock);
  v9 = (void *)MEMORY[0x1A1AD6ED8]();
  -[MLState backings](self, "backings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "The backing object for the state named %@ doens't exist.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The backing object for the state named %@ doens't exist."), v6);
  }
  v7[2](v7, v11);

  objc_autoreleasePoolPop(v9);
  os_unfair_lock_unlock(p_stateBuffersLock);

}

- (MLFeatureProvider)featureProviderRepresentation
{
  os_unfair_lock_s *p_stateBuffersLock;
  os_unfair_lock_s *p_featureProviderRepresentationCacheLock;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  MLState *v13;
  void *v14;
  MLState *v15;
  void *v16;
  MLDictionaryFeatureProvider *v17;
  MLFeatureProvider *featureProviderRepresentationCache;
  os_unfair_lock_s *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_stateBuffersLock = &self->_stateBuffersLock;
  os_unfair_lock_lock(&self->_stateBuffersLock);
  p_featureProviderRepresentationCacheLock = &self->_featureProviderRepresentationCacheLock;
  os_unfair_lock_lock(&self->_featureProviderRepresentationCacheLock);
  if (!self->_featureProviderRepresentationCache)
  {
    v20 = p_stateBuffersLock;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[MLState backings](self, "backings");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[MLState backings](self, "backings");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = [MLState alloc];
          v26 = v10;
          v27 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[MLState initWithBackings:](v13, "initWithBackings:", v14);

          +[MLFeatureValue internalFeatureValueWithState:](MLFeatureValue, "internalFeatureValueWithState:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v10);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v7);
    }

    v17 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v5, 0);
    featureProviderRepresentationCache = self->_featureProviderRepresentationCache;
    self->_featureProviderRepresentationCache = (MLFeatureProvider *)v17;

    p_featureProviderRepresentationCacheLock = &self->_featureProviderRepresentationCacheLock;
    p_stateBuffersLock = v20;
  }
  os_unfair_lock_unlock(p_featureProviderRepresentationCacheLock);
  os_unfair_lock_unlock(p_stateBuffersLock);
  return self->_featureProviderRepresentationCache;
}

- (void)getMultiArrayWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__MLState_getMultiArrayWithHandler___block_invoke;
  v6[3] = &unk_1E3D67020;
  v7 = v4;
  v5 = v4;
  -[MLState internalGetMultiArrayWithHandler:](self, "internalGetMultiArrayWithHandler:", v6);

}

- (void)internalGetMultiArrayWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  -[MLState backings](self, "backings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 1)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
    }

  }
  -[MLState backings](self, "backings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__MLState_internalGetMultiArrayWithHandler___block_invoke;
  v12[3] = &unk_1E3D67020;
  v13 = v4;
  v11 = v4;
  -[MLState getMultiArrayForStateNamed:handler:](self, "getMultiArrayForStateNamed:handler:", v10, v12);

}

- (id)description
{
  void *v2;
  void *v3;

  -[MLState backings](self, "backings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)backings
{
  return self->_backings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backings, 0);
  objc_storeStrong((id *)&self->_featureProviderRepresentationCache, 0);
}

uint64_t __44__MLState_internalGetMultiArrayWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __36__MLState_getMultiArrayWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (MLState)emptyState
{
  if (emptyState_onceToken != -1)
    dispatch_once(&emptyState_onceToken, &__block_literal_global_26555);
  return (MLState *)(id)emptyState_s_emptyState;
}

void __21__MLState_emptyState__block_invoke()
{
  MLState *v0;
  uint64_t v1;
  void *v2;

  v0 = [MLState alloc];
  v1 = -[MLState initWithBackings:](v0, "initWithBackings:", MEMORY[0x1E0C9AA70]);
  v2 = (void *)emptyState_s_emptyState;
  emptyState_s_emptyState = v1;

}

@end
