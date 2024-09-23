@implementation MRGroupSessionJoinSessionWithToken

void __MRGroupSessionJoinSessionWithToken_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD);
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  __int128 *p_buf;
  _QWORD v29[3];
  char v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v6)
    {
      _MRLogForCategory(0xCuLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __MRGroupSessionJoinSessionWithToken_block_invoke_cold_1(a1, (uint64_t)v7, v8);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "equivalentMediaIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = v5;
      v12 = v11;

      _MRLogForCategory(0xCuLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Joined group session: %{public}@. Waiting for ASE", (uint8_t *)&buf, 0xCu);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v32 = 0x3032000000;
      v33 = __Block_byref_object_copy__46;
      v34 = __Block_byref_object_dispose__46;
      v35 = 0;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      v14 = MEMORY[0x1E0C809B0];
      v30 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __MRGroupSessionJoinSessionWithToken_block_invoke_254;
      v23[3] = &unk_1E30CF550;
      v27 = v29;
      v15 = v12;
      v24 = v15;
      p_buf = &buf;
      v25 = v5;
      v26 = *(id *)(a1 + 40);
      v16 = (void *)MEMORY[0x194036C44](v23);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      v21[1] = 3221225472;
      v21[2] = __MRGroupSessionJoinSessionWithToken_block_invoke_258;
      v21[3] = &unk_1E30C9DE8;
      v18 = v16;
      v22 = v18;
      objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("kMRMediaRemoteActiveSystemEndpointDidChangeNotification"), 0, 0, v21);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v19;

      v18[2](v18);
      _Block_object_dispose(v29, 8);
      _Block_object_dispose(&buf, 8);

    }
  }

}

void __MRGroupSessionJoinSessionWithToken_block_invoke_254(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MRGroupSessionSubsystemGetQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeSystemEndpointOutputDeviceUIDForType:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", a1[4]);

    if (v5)
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40));

      _MRLogForCategory(0xCuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = a1[5];
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "[MRGroupSession] Resolved ASE to session: %@", (uint8_t *)&v9, 0xCu);
      }

      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

void __MRGroupSessionJoinSessionWithToken_block_invoke_258(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  MRGroupSessionSubsystemGetQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MRGroupSessionJoinSessionWithToken_block_invoke_2;
  block[3] = &unk_1E30C6770;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __MRGroupSessionJoinSessionWithToken_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __MRGroupSessionJoinSessionWithToken_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
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
  v6 = 2114;
  v7 = a2;
  OUTLINED_FUNCTION_2_4(&dword_193827000, a3, (uint64_t)a3, "[MRGroupSession] Failed to join group session with token: %@, error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

@end
