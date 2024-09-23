@implementation ACPersonaManager

+ (void)performWithinPersonaForAccount:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void (**v9)(id);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v5 = a3;
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0DC5EE0];
    v9 = (void (**)(id))a4;
    objc_msgSend(v10, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentPersona");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userPersonaNickName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _ACPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ACPersonaManager performWithinPersonaForAccount:withBlock:].cold.1();

    v9[2](v9);
    goto LABEL_8;
  }
  v6 = a4;
  objc_msgSend(v5, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "performWithinPersona:withBlock:", v7, v6);

  if ((v8 & 1) == 0)
  {
    _ACPLogSystem();
    v9 = (void (**)(id))objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_FAULT))
      +[ACPersonaManager performWithinPersonaForAccount:withBlock:].cold.2(v5, v9);
LABEL_8:

  }
}

+ (BOOL)performWithinPersona:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPersona");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v8, "userPersonaUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v5);

    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      _ACPLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[ACPersonaManager performWithinPersona:withBlock:].cold.3(v8, (uint64_t)v5, v15);

      v11 = v5;
    }
  }
  else if ((objc_msgSend(v8, "isEnterprisePersona") & 1) != 0 || objc_msgSend(v8, "isGuestPersona"))
  {
    +[ACPersonaManager sharedInstance](ACPersonaManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "personalPersonaUID");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    _ACPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v14)
        +[ACPersonaManager performWithinPersona:withBlock:].cold.2();
    }
    else
    {
      if (v14)
        +[ACPersonaManager performWithinPersona:withBlock:].cold.1();
      v11 = 0;
    }

    v10 = 0;
  }
  else
  {
    v11 = 0;
    v10 = 1;
  }

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke;
  v18[3] = &unk_1E4893FA8;
  v19 = v6;
  v16 = v6;
  +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:](ACPersonaManager, "_changePersonaContextUsingPersonaID:withCompletion:", v11, v18);

  return v10;
}

+ (void)_changePersonaContextUsingPersonaID:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (v5)
  {
    _ACPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.5();

    objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentPersona");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v11 = (void *)objc_msgSend(v10, "copyCurrentPersonaContextWithError:", &v21);
    v12 = v21;
    if (!v11)
    {
      _ACPLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.1();

      v7[2](v7, 0);
      goto LABEL_24;
    }
    objc_msgSend(v10, "createPersonaContextForBackgroundProcessingWithPersonaUniqueString:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      ((void (**)(_QWORD, void *))v7)[2](v7, v11);
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v13, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CB2FE0];
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v16 = objc_msgSend(v13, "code");

      if (v16 == 1)
      {
        _ACPLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.3();
        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v13, "domain");
    v17 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v17, "isEqualToString:", v15))
    {
      v19 = objc_msgSend(v13, "code");

      if (v19 != 22)
      {
LABEL_21:
        _ACPLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.2();

        v7[2](v7, 0);
        goto LABEL_24;
      }
      _ACPLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[ACPersonaManager _changePersonaContextUsingPersonaID:withCompletion:].cold.4();
    }
LABEL_20:

    goto LABEL_21;
  }
  (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_25:

}

void __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentPersona");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _ACPLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_2(v5, v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentPersona");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v8, "restorePersonaWithSavedPersonaContext:", v3);
    _ACPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_1(v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (ACPersonaManager)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (ACPersonaManager *)(id)sharedInstance_sharedInstance;
}

void __34__ACPersonaManager_sharedInstance__block_invoke()
{
  ACPersonaManager *v0;
  void *v1;

  v0 = objc_alloc_init(ACPersonaManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (ACPersonaManager)init
{
  ACPersonaManager *v2;
  ACPersonaManager *v3;
  NSObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACPersonaManager;
  v2 = -[ACPersonaManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_personaStorageLock._os_unfair_lock_opaque = 0;
    _ACPLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ACPersonaManager init].cold.1(v4);

    -[ACPersonaManager _lockedLoadCache](v3, "_lockedLoadCache");
    -[ACPersonaManager _lockedUpdatePersonasUIDsIfNeeded](v3, "_lockedUpdatePersonasUIDsIfNeeded");
  }
  return v3;
}

- (void)updatePersonasUIDs
{
  os_unfair_lock_s *p_personaStorageLock;
  _QWORD *v3;
  _QWORD v4[2];
  uint64_t (*v5)(uint64_t);
  void *v6;
  ACPersonaManager *v7;

  p_personaStorageLock = &self->_personaStorageLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v5 = __38__ACPersonaManager_updatePersonasUIDs__block_invoke;
  v6 = &unk_1E4892AD8;
  v7 = self;
  v3 = v4;
  os_unfair_lock_lock(p_personaStorageLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_personaStorageLock);

}

uint64_t __38__ACPersonaManager_updatePersonasUIDs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockedUpdatePersonasUIDsIfNeeded");
}

- (void)_lockedUpdatePersonasUIDsIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"personaGenerationIdentifierWithError: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (id)_cacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Accounts"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("persona.cache"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_lockedSaveCurrentCache
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, v0, (uint64_t)v0, "\"ACPersonaManager: writing out %@ to %@\", v1);
  OUTLINED_FUNCTION_0();
}

- (void)_lockedLoadCache
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1A2BCD000, v0, OS_LOG_TYPE_DEBUG, "\"Loading persona cache from dictionary\", v1, 2u);
  OUTLINED_FUNCTION_8();
}

- (NSString)enterprisePersonaUID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__ACPersonaManager_enterprisePersonaUID__block_invoke;
  v3[3] = &unk_1E4893F80;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __40__ACPersonaManager_enterprisePersonaUID__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lockedUpdatePersonasUIDsIfNeeded");
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

- (NSString)personalPersonaUID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__ACPersonaManager_personalPersonaUID__block_invoke;
  v3[3] = &unk_1E4893F80;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __38__ACPersonaManager_personalPersonaUID__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lockedUpdatePersonasUIDsIfNeeded");
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

- (NSSet)guestPersonasUIDs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__ACPersonaManager_guestPersonasUIDs__block_invoke;
  v3[3] = &unk_1E4893F80;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v3);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

id __37__ACPersonaManager_guestPersonasUIDs__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lockedUpdatePersonasUIDsIfNeeded");
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

- (NSArray)dataSeparatedPersonasUIDs
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__ACPersonaManager_dataSeparatedPersonasUIDs__block_invoke;
  v3[3] = &unk_1E4893F80;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_personaStorageLock, v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

id __45__ACPersonaManager_dataSeparatedPersonasUIDs__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_lockedUpdatePersonasUIDsIfNeeded");
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

- (id)store
{
  ACAccountStore *store;
  ACAccountStore *v4;
  ACAccountStore *v5;

  store = self->_store;
  if (!store)
  {
    v4 = objc_alloc_init(ACAccountStore);
    v5 = self->_store;
    self->_store = v4;

    store = self->_store;
  }
  return store;
}

+ (void)performWithinPersonaForAccountIdentifier:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  +[ACPersonaManager sharedInstance](ACPersonaManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountWithIdentifier:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[ACPersonaManager performWithinPersonaForAccount:withBlock:](ACPersonaManager, "performWithinPersonaForAccount:withBlock:", v9, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_dataSeparatedPersonasUIDs, 0);
  objc_storeStrong((id *)&self->_guestPersonasUID, 0);
  objc_storeStrong((id *)&self->_personalPersonaUID, 0);
  objc_storeStrong((id *)&self->_enterprisePersonaUID, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = ACIsAccountsd();
  v4 = CFSTR("shouldn't cache");
  if (v2)
    v4 = CFSTR("should cache");
  v5 = 138412290;
  v6 = v4;
  OUTLINED_FUNCTION_4_0(&dword_1A2BCD000, a1, v3, "\"ACPersonaManager init, %@\", (uint8_t *)&v5);
}

+ (void)performWithinPersonaForAccount:withBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"No account found for scoping operation! Performing block within %@ persona.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)performWithinPersonaForAccount:(void *)a1 withBlock:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_fault_impl(&dword_1A2BCD000, a2, OS_LOG_TYPE_FAULT, "Operation on account (%@) of type (%@) was not properly scoped.", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_3_0();
}

+ (void)performWithinPersona:withBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"We are currently running in the enterprise or guest persona and we're unable resolve the correct one for adoption!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)performWithinPersona:withBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"We are currently running in the Enterprise or Guest persona, but shouldn't be! Will set to %@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)performWithinPersona:(NSObject *)a3 withBlock:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userPersonaNickName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, a3, v6, "\"Current persona (%@) does not match requested persona identifier (%@).\", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3_0();
}

void __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE0], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPersona");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userPersonaNickName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1A2BCD000, a1, v5, "\"Back to the %@ persona.\", v6);

  OUTLINED_FUNCTION_3_0();
}

void __51__ACPersonaManager_performWithinPersona_withBlock___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userPersonaNickName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userPersonaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_4(&dword_1A2BCD000, a2, v6, "\"Performing block within persona nickname (%@) unique string (%@) \", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3_0();
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Could not get current persona context with error %@. Leaving current persona intact.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1A2BCD000, v0, OS_LOG_TYPE_ERROR, "\"Failed to set persona ID (%@) with error %@\", v1, 0x16u);
  OUTLINED_FUNCTION_0();
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"This process needs entitlement com.apple.usermanagerd.persona.background\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1A2BCD000, v0, v1, "\"This process is not permitted for the appropriate mach service lookup. Please file a radar to the owner of the current process.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)_changePersonaContextUsingPersonaID:withCompletion:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1A2BCD000, v0, v1, "\"Changing persona to %@\", v2);
  OUTLINED_FUNCTION_0();
}

@end
