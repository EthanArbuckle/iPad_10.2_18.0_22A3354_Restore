@implementation AAUICustodianStartSessionHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("custodian:startSession"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("custodian:startSession"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  -[AAUICustodianStartSessionHook _startSessionWithServerAttributes:completion:](self, "_startSessionWithServerAttributes:completion:", a4, a6, a5);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUICustodianStartSessionHook _startSessionWithServerAttributes:completion:](self, "_startSessionWithServerAttributes:completion:", v7, v6);

}

- (void)_startSessionWithServerAttributes:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appleId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Starting custodian recovery session for Apple ID: %@, Session ID: %@", buf, 0x16u);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0CFAC20]);
    objc_msgSend(v10, "setOwnerAppleID:", v7);
    objc_msgSend(v10, "setRecoverySessionID:", v8);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v19 = __Block_byref_object_copy__5;
    v20 = __Block_byref_object_dispose__5;
    v21 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
    v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke;
    v13[3] = &unk_1EA2DC2C0;
    v14 = v8;
    v16 = v6;
    v15 = v7;
    v17 = buf;
    objc_msgSend(v11, "startCustodianRecoveryWithContext:completion:", v10, v13);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _AAUILogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AAUICustodianStartSessionHook _startSessionWithServerAttributes:completion:].cold.1((uint64_t)v7, (uint64_t)v8, v12);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAAF8], -7008, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v10);
  }

}

void __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "length"))
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v6, v7);

    v8 = a1[6];
    if (v6)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v8 + 16))(a1[6], 0, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAAF8], -9004, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

    }
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v10 = a1[5];
      v15 = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Custodian recovery session started for Apple ID: %@, Session ID: %@, IDMS Session ID: %@", (uint8_t *)&v15, 0x20u);
    }

    (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], 1, 0);
  }
  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_startSessionWithServerAttributes:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_2(&dword_1DB4ED000, a2, a3, "Unable to start recovery session, server missing Apple ID (%@) or Session ID (%@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void __78__AAUICustodianStartSessionHook__startSessionWithServerAttributes_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_2(&dword_1DB4ED000, a2, a3, "Failed to start custodian recovery session (%@) with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
