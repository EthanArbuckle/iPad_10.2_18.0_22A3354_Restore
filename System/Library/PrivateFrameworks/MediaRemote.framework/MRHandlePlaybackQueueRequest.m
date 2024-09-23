@implementation MRHandlePlaybackQueueRequest

uint64_t ___MRHandlePlaybackQueueRequest_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___MRHandlePlaybackQueueRequest_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  __CFString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MRLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___MRHandlePlaybackQueueRequest_block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isLocal");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "invalidatationTimestamp");
      v11 = v10;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v5, "contentItems", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v28 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v17, "metadata");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 && MRContentItemGetInferredTimestamp(v17) == 0.0)
              MRContentItemSetInferredTimestamp(v17, v11);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        }
        while (v14);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "homeUserIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "homeUserIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHomeUserIdentifiers:", v21);

    }
    objc_msgSend(v5, "contentItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(v22, 0);
    _MRLogForCategory(1uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v32 = v25;
      v33 = 2114;
      v34 = v26;
      v35 = 2114;
      v36 = v23;
      _os_log_debug_impl(&dword_193827000, v24, OS_LOG_TYPE_DEBUG, "[MRPlaybackQueueServiceClient] Responded to playbackQueueRequest %{public}@ for path %{public}@ with %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t ___onQueue_MRHandlePlaybackQueueRequest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t ___onQueue_MRHandlePlaybackQueueRequest_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void ___MRHandlePlaybackQueueRequest_block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originClientForPlayerPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "playbackQueueCallback");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = ___MRHandlePlaybackQueueRequest_block_invoke_2;
    v14[3] = &unk_1E30CB3C0;
    v7 = &v15;
    v15 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 64);
    ((void (**)(_QWORD, uint64_t, uint64_t, _QWORD *))v4)[2](v4, v5, v6, v14);

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = ___MRHandlePlaybackQueueRequest_block_invoke_3;
    v12[3] = &unk_1E30CB438;
    v7 = &v13;
    v13 = *(id *)(a1 + 64);
    _onQueue_MRHandlePlaybackQueueRequest(v10, v8, v9, v11, v12);
  }

}

void ___MRHandlePlaybackQueueRequest_block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)a1[4];
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "subscriptionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribeToPlaybackQueue:forRequest:", v8, a1[5]);

  (*(void (**)(void))(a1[6] + 16))();
}

void ___MRHandlePlaybackQueueRequest_block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_8();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_193827000, v3, OS_LOG_TYPE_ERROR, "[MRPlaybackQueueServiceClient] Responded to playbackQueueRequest %{public}@ for path %{public}@ with error %{public}@", v4, 0x20u);
}

@end
