@implementation AALoginContextManager

+ (AALoginContextManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_128);
  return (AALoginContextManager *)(id)sharedManager_sharedManager_1;
}

void __38__AALoginContextManager_sharedManager__block_invoke()
{
  AALoginContextManager *v0;
  void *v1;

  v0 = objc_alloc_init(AALoginContextManager);
  v1 = (void *)sharedManager_sharedManager_1;
  sharedManager_sharedManager_1 = (uint64_t)v0;

}

- (AALoginContextManager)init
{
  AALoginContextManager *v2;
  AALoginContextManager *v3;
  AAStorableLoginContext *stashedContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AALoginContextManager;
  v2 = -[AALoginContextManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    stashedContext = v2->_stashedContext;
    v2->_stashedContext = 0;

    v3->_stashedContextLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (AAStorableLoginContext)stashedContext
{
  os_unfair_lock_s *p_stashedContextLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  AALoginContextManager *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  p_stashedContextLock = &self->_stashedContextLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v7 = __39__AALoginContextManager_stashedContext__block_invoke;
  v8 = &unk_1E41713A0;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_stashedContextLock);
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_stashedContextLock);
  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (AAStorableLoginContext *)v4;
}

void __39__AALoginContextManager_stashedContext__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)setStashedContext:(id)a3
{
  id v4;
  os_unfair_lock_s *p_stashedContextLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_stashedContextLock = &self->_stashedContextLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AALoginContextManager_setStashedContext___block_invoke;
  v7[3] = &unk_1E416E8E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_stashedContextLock);
  __43__AALoginContextManager_setStashedContext___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_stashedContextLock);

}

void __43__AALoginContextManager_setStashedContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)persistStashedContext
{
  os_unfair_lock_s *p_stashedContextLock;
  _QWORD v3[5];

  p_stashedContextLock = &self->_stashedContextLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__AALoginContextManager_persistStashedContext__block_invoke;
  v3[3] = &unk_1E416E3A8;
  v3[4] = self;
  os_unfair_lock_lock(&self->_stashedContextLock);
  __46__AALoginContextManager_persistStashedContext__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_stashedContextLock);
}

void __46__AALoginContextManager_persistStashedContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    +[AALoginContextTransientStorage sharedStorage](AALoginContextTransientStorage, "sharedStorage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "save:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = 0;

  }
  else
  {
    _AALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__AALoginContextManager_persistStashedContext__block_invoke_cold_1();

  }
}

+ (void)stashLoginResponseWithAuthenticationResults:(id)a3 cloudKitToken:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  AAStorableLoginContext *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  _AALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.6();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.5();

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.4();

  }
  v32 = (void *)v8;
  v12 = -[AAStorableLoginContext initWithAppleID:altDSID:]([AAStorableLoginContext alloc], "initWithAppleID:altDSID:", v8, v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v13 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v13;
  if (v13)
  {
    -[AAStorableLoginContext setDSID:](v12, "setDSID:", v13);
  }
  else
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.3();

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[AAStorableLoginContext setRawPassword:](v12, "setRawPassword:", v15);
  }
  else
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.2();

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF78]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    _AALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "AuthResult is indicating that we're dealing with a beneficiary account.", buf, 2u);
    }

    -[AAStorableLoginContext setBeneficiaryLogin:](v12, "setBeneficiaryLogin:", 1);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF68]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    -[AAStorableLoginContext setFirstName:](v12, "setFirstName:", v19);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF90]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    -[AAStorableLoginContext setLastName:](v12, "setLastName:", v20);
  if (v6)
  {
    -[AAStorableLoginContext setCloudKitToken:](v12, "setCloudKitToken:", v6);
  }
  else
  {
    _AALogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[AALoginContextManager stashLoginResponseWithAuthenticationResults:cloudKitToken:].cold.1();

  }
  v33 = v6;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "aa_authKitAccountForAltDSID:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "credential");
    v25 = objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v24;
      _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "Trying to add CK and PRK for %@ to login context...", buf, 0xCu);
    }

    -[NSObject credentialItemForKey:](v25, "credentialItemForKey:", *MEMORY[0x1E0C8F190]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setContinuationKey:](v12, "setContinuationKey:", v27);

    -[NSObject credentialItemForKey:](v25, "credentialItemForKey:", *MEMORY[0x1E0C8F238]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setPasswordResetKey:](v12, "setPasswordResetKey:", v28);

  }
  else
  {
    _AALogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl(&dword_19EACA000, v25, OS_LOG_TYPE_DEFAULT, "No AuthKit account to grab CK and PRK from for altDSID: %@", buf, 0xCu);
    }
  }

  +[AALoginContextManager sharedManager](AALoginContextManager, "sharedManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStashedContext:", v12);

  +[AALoginContextManager sharedManager](AALoginContextManager, "sharedManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "persistStashedContext");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedContext, 0);
}

void __46__AALoginContextManager_persistStashedContext__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Asked to persist stashedContext without a stashedContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Stash call missing cloudKitToken!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Login response results missing rp!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Login response results missing DSID!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Login response results missing altDSID!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_19EACA000, v0, v1, "Login response results missing username!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)stashLoginResponseWithAuthenticationResults:cloudKitToken:.cold.6()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_19EACA000, v0, OS_LOG_TYPE_DEBUG, "Stashing login response because caller said so...", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
