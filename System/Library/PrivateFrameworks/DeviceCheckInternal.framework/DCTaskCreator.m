@implementation DCTaskCreator

+ (id)create
{
  DCBGSTask *v2;

  v2 = -[DCBGSTask initWithTaskIdentifier:observerIdentifier:]([DCBGSTask alloc], "initWithTaskIdentifier:observerIdentifier:", CFSTR("com.apple.devicecheck.notify"), CFSTR("activityInterval"));
  -[DCBGSTask setTaskHandler:](v2, "setTaskHandler:", &__block_literal_global);
  return v2;
}

void __23__DCTaskCreator_create__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = a2;
  if (v2)
  {
    +[DCAssetFetcher sharedFetcher](DCAssetFetcher, "sharedFetcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __23__DCTaskCreator_create__block_invoke_2;
    v4[3] = &unk_24ED11490;
    v5 = v2;
    objc_msgSend(v3, "initiateMetadataFetchIgnoringCachesWithCompletion:", v4);

  }
}

void __23__DCTaskCreator_create__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    _DCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        __23__DCTaskCreator_create__block_invoke_2_cold_2(a1, v5, v6);
    }
    else if (v7)
    {
      __23__DCTaskCreator_create__block_invoke_2_cold_1(a1);
    }
  }
  else
  {
    _DCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __23__DCTaskCreator_create__block_invoke_2_cold_3(a1);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");
}

void __23__DCTaskCreator_create__block_invoke_2_cold_1(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  OUTLINED_FUNCTION_0(&dword_224FB2000, v2, v3, "Initiated MobileAsset fetch. { taskID=%s }", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

void __23__DCTaskCreator_create__block_invoke_2_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");
  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315394;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_224FB2000, a3, OS_LOG_TYPE_DEBUG, "Failed to to initiate metadata fetch. { taskID=%s, error=%@ }", (uint8_t *)&v8, 0x16u);

}

void __23__DCTaskCreator_create__block_invoke_2_cold_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  OUTLINED_FUNCTION_0(&dword_224FB2000, v2, v3, "Failed to initiate metadata fetch. { taskID=%s }", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
