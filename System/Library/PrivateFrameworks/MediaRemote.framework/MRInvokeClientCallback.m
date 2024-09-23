@implementation MRInvokeClientCallback

void ___onClientQueue_MRInvokeClientCallback_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___onClientQueue_MRInvokeClientCallback_block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "startCachingContentItemUpdatesForItem:forPendingRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___onClientQueue_MRInvokeClientCallback_block_invoke_20;
  v8[3] = &unk_1E30C6568;
  v5 = *(NSObject **)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

void ___onClientQueue_MRInvokeClientCallback_block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "disarm"))
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), a2);
  }
  else if (a2
         || MRContentItemIsEmpty(*(void **)(a1 + 40))
         || (objc_msgSend(*(id *)(a1 + 48), "includeArtwork") & 1) != 0)
  {
    _MRLogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = MRContentItemCopyMinimalReadableDescription(*(void **)(a1 + 40));
      v13 = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueServiceClient] After completion playbackQueueRequest %{public}@ responded to asset request with item, but was ignored %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    _MRLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = MRContentItemCopyMinimalReadableDescription(*(void **)(a1 + 40));
      v13 = 138543618;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueServiceClient] After completion playbackQueueRequest %{public}@ responded to asset request with item %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MRMediaRemotePlaybackQueueDataSourceContentItemChangedWithRequestForPlayer(v10, v11, (uint64_t)v12);

  }
}

uint64_t ___onClientQueue_MRInvokeClientCallback_block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t ___onClientQueue_MRInvokeClientCallback_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void ___onClientQueue_MRInvokeClientCallback_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_8();
  v3 = v0;
  _os_log_error_impl(&dword_193827000, v1, OS_LOG_TYPE_ERROR, "[MRPlaybackQueueServiceClient] playbackQueueRequest %{public}@ responded to asset request with error %{public}@", v2, 0x16u);
}

@end
