@implementation CDPRecoveryKeyCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  return (id)sharedInstance_rKCache;
}

void __37__CDPRecoveryKeyCache_sharedInstance__block_invoke()
{
  CDPRecoveryKeyCache *v0;
  void *v1;

  v0 = objc_alloc_init(CDPRecoveryKeyCache);
  v1 = (void *)sharedInstance_rKCache;
  sharedInstance_rKCache = (uint64_t)v0;

}

- (CDPRecoveryKeyCache)init
{
  CDPRecoveryKeyCache *v2;
  AAFKeychainManager *v3;
  AAFKeychainManager *keychainManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPRecoveryKeyCache;
  v2 = -[CDPRecoveryKeyCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (AAFKeychainManager *)objc_alloc_init(MEMORY[0x24BDFC2F0]);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v3;

  }
  return v2;
}

- (BOOL)cacheRecoveryKey:(id)a3 forAltDSID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AAFKeychainManager *keychainManager;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v8 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDPKeychainItemDescriptor recoveryKeyDescriptorForAltDSID:](CDPKeychainItemDescriptor, "recoveryKeyDescriptorForAltDSID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFC2E0]), "initWithDescriptor:value:", v10, v9);
  keychainManager = self->_keychainManager;
  v24 = 0;
  -[AAFKeychainManager addOrUpdateKeychainItem:error:](keychainManager, "addOrUpdateKeychainItem:error:", v11, &v24);
  v13 = v24;
  v14 = v13;
  if (v13)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  else
  {
    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CDPRecoveryKeyCache cacheRecoveryKey:forAltDSID:error:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  return v14 == 0;
}

- (id)fetchRecoveryKeyFromCacheForAltDSID:(id)a3
{
  void *v4;
  AAFKeychainManager *keychainManager;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  +[CDPKeychainItemDescriptor recoveryKeyDescriptorForAltDSID:](CDPKeychainItemDescriptor, "recoveryKeyDescriptorForAltDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  keychainManager = self->_keychainManager;
  v13 = 0;
  -[AAFKeychainManager keychainItemForDescriptor:error:](keychainManager, "keychainItemForDescriptor:error:", v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPRecoveryKeyCache fetchRecoveryKeyFromCacheForAltDSID:].cold.1((uint64_t)v7, v8);
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v6, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v11, "initWithData:encoding:", v8, 4);
  }

LABEL_8:
  return v9;
}

- (void)deleteCache
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a2, a3, "\"Cleared RK cache with error: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
}

- (void)cacheRecoveryKey:(uint64_t)a3 forAltDSID:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_20D7E6000, a1, a3, "\"Cached RK with error: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)fetchRecoveryKeyFromCacheForAltDSID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D7E6000, a2, OS_LOG_TYPE_ERROR, "\"Failed to fetch RK from cache: %@\", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
