@implementation FPExtendBookmarkForDocumentURL

uint64_t __FPExtendBookmarkForDocumentURL_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  id v9;

  v8 = *(_QWORD *)(result + 40);
  if (v8)
  {
    v9 = FPProviderNotFoundErrorForURL(*(_QWORD *)(result + 32), a2, a3, a4, a5, a6, a7, a8);
    return (*(uint64_t (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);
  }
  return result;
}

void __FPExtendBookmarkForDocumentURL_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 | v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_INFO, "[INFO] Extended sandbox and received bookmark for %@: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __FPExtendBookmarkForDocumentURL_block_invoke_2_cold_1(a1, (void *)v6);
    }

    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callNextOverrides");
  }

}

void __FPExtendBookmarkForDocumentURL_block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(*(id *)(a1 + 40), "fp_scopeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_8_2(&dword_1A0A34000, v5, v6, "[ERROR] Could not extend bookmark access of %@ for %@. Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_11_1();
}

@end
