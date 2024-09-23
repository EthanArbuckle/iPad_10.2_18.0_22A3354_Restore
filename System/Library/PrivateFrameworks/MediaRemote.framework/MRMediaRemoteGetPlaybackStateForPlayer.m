@implementation MRMediaRemoteGetPlaybackStateForPlayer

void __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t Error;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_2;
  v17[3] = &unk_1E30C66F8;
  v7 = v5;
  v18 = v7;
  v19 = a1[4];
  v20 = a1[5];
  v21 = a1[6];
  v22 = a1[7];
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v17);
  if (objc_msgSend(v7, "isResolved"))
  {
    v9 = objc_msgSend(v7, "isLocal");
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "playerClientForPlayerPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "playbackState");
      if ((_DWORD)v13)
      {
        v8[2](v8, v13, 0);
      }
      else
      {
        +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "playerClientRequestsForPlayerPath:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "handlePlaybackStateRequestWithCompletion:", v8);
      }
    }
    else
    {
      objc_msgSend(v10, "playerClientRequestsForPlayerPath:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "handlePlaybackStateRequestWithCompletion:", v8);
    }
  }
  else
  {
    if (v6)
    {
      v12 = 0;
      Error = (uint64_t)v6;
    }
    else
    {
      Error = MRMediaRemoteNowPlayingPlayerPathCreateError(v7);
      v12 = (void *)Error;
    }
    v8[2](v8, 0, Error);
  }

}

void __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  int v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 - 1) > 4)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E30C67D8[a2 - 1];
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v5)
  {
    v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v15)
        goto LABEL_17;
      v17 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v29 = CFSTR("playbackState");
      v30 = 2114;
      v31 = v16;
      v32 = 2112;
      v33 = v6;
      v34 = 2114;
      v35 = v17;
      v36 = 2048;
      v37 = v18;
      v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v20 = v9;
      v21 = 52;
    }
    else
    {
      if (!v15)
        goto LABEL_17;
      v22 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v29 = CFSTR("playbackState");
      v30 = 2114;
      v31 = v22;
      v32 = 2112;
      v33 = v6;
      v34 = 2048;
      v35 = v23;
      v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v20 = v9;
      v21 = 42;
    }
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_16;
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v10)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v29 = CFSTR("playbackState");
      v30 = 2114;
      v31 = v11;
      v32 = 2114;
      v33 = v5;
      v34 = 2114;
      v35 = v12;
      v36 = 2048;
      v37 = v14;
      _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_16:

    }
  }
  else if (v10)
  {
    __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_2_cold_1();
  }
LABEL_17:

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_389;
  v25[3] = &unk_1E30C66D0;
  v24 = *(NSObject **)(a1 + 56);
  v26 = *(id *)(a1 + 64);
  v27 = a2;
  dispatch_async(v24, v25);

}

uint64_t __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_389(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

void __MRMediaRemoteGetPlaybackStateForPlayer_block_invoke_2_cold_1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6(v1, v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

@end
