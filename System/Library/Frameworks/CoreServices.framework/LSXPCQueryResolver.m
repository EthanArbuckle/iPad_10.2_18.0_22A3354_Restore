@implementation LSXPCQueryResolver

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  void (*v8[5])(_QWORD, _QWORD);

  v2 = MEMORY[0x1E0C809B0];
  v8[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v8[1] = (void (*)(_QWORD, _QWORD))3221225472;
  v8[2] = (void (*)(_QWORD, _QWORD))__59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2;
  v8[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
  v8[4] = *(void (**)(_QWORD, _QWORD))(a1 + 40);
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119;
  v6[3] = &unk_1E1044DD8;
  v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  objc_msgSend(v3, "resolveQueries:legacySPI:completionHandler:", v4, v5, v6);

}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;

  v4 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = a1 + 32;
  objc_storeStrong((id *)(*(_QWORD *)(v6 + 8) + 40), a2);
  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2_cold_1(v5, v7, v8);

}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      goto LABEL_8;
    }
    v8 = objc_msgSend(v6, "mutableCopy");
    -[NSObject addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v9 = -[NSObject copy](v8, "copy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119_cold_1((uint64_t)v7, v8);
  }

LABEL_8:
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v7;

}

void __80___LSXPCQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x186DAE7A0]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v3);

}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "Error fetching database info from lsd: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke_119_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Error resolving queries: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
