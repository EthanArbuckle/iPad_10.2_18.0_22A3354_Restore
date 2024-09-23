@implementation VSOpenURL

void __VSOpenURL_block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Did open URL %@", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    VSErrorLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __VSOpenURL_block_invoke_cold_1(a1, v3);
  }

}

void __VSOpenURL_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __VSOpenURL_block_invoke_3_cold_1(a1, (uint64_t)v4, v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __VSOpenURL_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Failed to open URL: %@", (uint8_t *)&v3, 0xCu);
}

void __VSOpenURL_block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Error opening URL %@: %@", (uint8_t *)&v4, 0x16u);
}

@end
