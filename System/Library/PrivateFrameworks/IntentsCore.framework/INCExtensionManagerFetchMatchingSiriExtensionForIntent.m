@implementation INCExtensionManagerFetchMatchingSiriExtensionForIntent

void ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke_2;
  block[3] = &unk_1E6BC4BA8;
  v11 = v6;
  v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void ___INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
LABEL_2:
    v3 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "_INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke_2";
      v9 = 2114;
      v10 = v2;
      _os_log_error_impl(&dword_1B727D000, v3, OS_LOG_TYPE_ERROR, "%s Failed to find extension %{public}@", (uint8_t *)&v7, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    goto LABEL_2;
  }
  v4 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 136315394;
    v8 = "_INCExtensionManagerFetchMatchingSiriExtensionForIntent_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B727D000, v4, OS_LOG_TYPE_INFO, "%s Found Siri extensions %@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
