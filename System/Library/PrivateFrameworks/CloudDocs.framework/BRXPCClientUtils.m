@implementation BRXPCClientUtils

+ (BOOL)executeXPCWithMaxRetries:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  uint64_t (**v7)(id, id *);
  void *v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (**)(id, id *))a5;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    do
    {

      v14 = 0;
      v9 = v7[2](v7, &v14);
      v10 = v14;
      v8 = v10;
      if ((v9 & 1) != 0 || !objc_msgSend(v10, "br_isNSXPCConnectionError"))
        break;
      brc_bread_crumbs((uint64_t)"+[BRXPCClientUtils executeXPCWithMaxRetries:error:block:]", 32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] Block execution failed because of XPC - retrying%@", buf, 0xCu);
      }

      --a3;
    }
    while (a3);
  }
  else
  {
    v9 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v9;
}

+ (void)executeAsyncXPCWithMaxRetries:(unint64_t)a3 completion:(id)a4 xpcInvokeBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPersona");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userPersonaUniqueString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke;
  v16[3] = &unk_1E3DA49F8;
  v17 = v11;
  v18 = v7;
  v19 = v8;
  v20 = a3;
  v12 = (void (**)(id, void *))v8;
  v13 = v11;
  v14 = v7;
  v15 = (void *)MEMORY[0x1A1AD85E4](v16);
  v12[2](v12, v15);

}

void __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  if ((objc_msgSend(v3, "br_isNSXPCConnectionError") & 1) != 0 && (v4 = *(_QWORD *)(a1 + 56), v4 != 1))
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2;
      v9[3] = &unk_1E3DA49D0;
      v6 = *(id *)(a1 + 40);
      v8 = *(void **)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v10 = v6;
      v12 = v7;
      v11 = v8;
      +[BRPersonaUtils performWithPersonaID:block:](BRPersonaUtils, "performWithPersonaID:block:", v5, v9);

    }
    else
    {
      +[BRXPCClientUtils executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:](BRXPCClientUtils, "executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:", v4 - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs((uint64_t)"+[BRXPCClientUtils executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:]_block_invoke_2", 54);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2_cold_1((uint64_t)v4, v5);

    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    +[BRXPCClientUtils executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:](BRXPCClientUtils, "executeAsyncXPCWithMaxRetries:completion:xpcInvokeBlock:", a1[6] - 1, a1[4], a1[5]);
  }

}

void __76__BRXPCClientUtils_executeAsyncXPCWithMaxRetries_completion_xpcInvokeBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for _br_addDomain retry%@", (uint8_t *)&v2, 0xCu);
}

@end
