@implementation FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    FPProviderNotFoundErrorForURL(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v8 + 16))(v8, 0, 0, 0, v9);

  }
}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  unint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v9 | v12)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_1();
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_2(a1);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] got service endpoint creating %@ for item at URL %@", v1);
  OUTLINED_FUNCTION_3();
}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 40);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_3_4(&dword_1A0A34000, v1, v2, "[ERROR] failed to get service endpoint creating for for item at URL %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

@end
