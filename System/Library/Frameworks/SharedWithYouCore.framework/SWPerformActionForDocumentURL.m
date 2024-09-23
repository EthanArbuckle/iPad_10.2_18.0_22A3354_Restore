@implementation SWPerformActionForDocumentURL

void __SWPerformActionForDocumentURL_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __SWPerformActionForDocumentURL_block_invoke_2;
    v7[3] = &unk_1E217B1C8;
    v8 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 48);
    v9 = 0;
    v10 = v5;
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performAction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __SWPerformActionForDocumentURL_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __SWPerformActionForDocumentURL_block_invoke_2_cold_1(a1, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __SWPerformActionForDocumentURL_block_invoke_2_cold_1(uint64_t a1, void *a2)
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

  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18B618000, v5, v6, "[ERROR] Cannot perform share operation for item at %@. Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
