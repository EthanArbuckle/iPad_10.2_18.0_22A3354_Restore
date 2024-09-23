@implementation ASTLocalization

+ (void)prepareLocalizedStringsWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v3 = a3;
  v4 = v3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__3;
  v8[4] = __Block_byref_object_dispose__3;
  v9 = 0;
  if (ASTStringsTable)
  {
    (*((void (**)(id, uint64_t, _QWORD))v3 + 2))(v3, 1, 0);
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke;
    v5[3] = &unk_24F96A330;
    v7 = v8;
    v6 = v3;
    +[ASTSession requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:](ASTSession, "requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:", CFSTR("strings"), 0, CFSTR("localized"), v5);

  }
  _Block_object_dispose(v8, 8);

}

void __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id obj;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    ASTLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_1();
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  +[ASTEncodingUtilities parseJSONResponseWithData:error:](ASTEncodingUtilities, "parseJSONResponseWithData:error:", v5, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = (void *)ASTStringsTable;
  ASTStringsTable = v8;

  if (!ASTStringsTable)
  {
    ASTLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_2();
LABEL_7:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)localizedStringForKey:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (!ASTStringsTable
    || (objc_msgSend((id)ASTStringsTable, "objectForKeyedSubscript:", v3),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = v3;
  }

  return v4;
}

void __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Strings table could not be downloaded: %@", v2, v3, v4, v5, 2u);
}

void __64__ASTLocalization_prepareLocalizedStringsWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Strings table could not be parsed: %@", v2, v3, v4, v5, 2u);
}

@end
