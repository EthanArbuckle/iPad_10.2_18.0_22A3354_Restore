@implementation MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer

void __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t Error;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2;
  v22 = &unk_1E30CB488;
  v7 = v5;
  v23 = v7;
  v24 = a1[4];
  v25 = a1[5];
  v26 = a1[6];
  v27 = a1[7];
  v28 = a1[8];
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](&v19);
  v9 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@<%@>"), a1[4], a1[5], v19, v20, v21, v22);
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "appendFormat:", CFSTR(" for %@"), v7);
  _MRLogForCategory(0xAuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v30 = v11;
    _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v7, "isResolved"))
  {
    if (objc_msgSend(v7, "isLocal"))
    {
      +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "playerClientForPlayerPath:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "clientCallbacks");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, objc_msgSend(v15, "capabilities"), 0);

    }
    else
    {
      v18 = (void *)MRGetSharedService();
      MRMediaRemoteServiceRequestNowPlayingPlaybackQueueCapabilities(v18, v7, a1[7], v8);
    }
  }
  else
  {
    if (v6)
    {
      v16 = 0;
      Error = (uint64_t)v6;
    }
    else
    {
      Error = MRMediaRemoteNowPlayingPlayerPathCreateError(v7);
      v16 = (void *)Error;
    }
    v8[2](v8, 0, Error);

  }
}

void __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = MRPlaybackQueueCapabilitiesCopyDescription(a2);
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v5 && v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        v12 = *(_QWORD *)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v13 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v38 = v12;
        v39 = 2114;
        v40 = v11;
        v41 = 2112;
        v42 = v6;
        v43 = 2114;
        v44 = v13;
        v45 = 2048;
        v46 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v9;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v38 = v29;
    v39 = 2114;
    v40 = v30;
    v41 = 2112;
    v42 = v6;
    v43 = 2048;
    v44 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v5)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v38 = v21;
        v39 = 2114;
        v40 = v20;
        v41 = 2114;
        v42 = v5;
        v43 = 2114;
        v44 = v22;
        v45 = 2048;
        v46 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2_cold_1(a1);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v32 = *(_QWORD *)(a1 + 40);
    v33 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138543874;
    v38 = v32;
    v39 = 2114;
    v40 = v33;
    v41 = 2048;
    v42 = v34;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v9;
    v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v26 = *(_QWORD *)(a1 + 40);
    v25 = *(_QWORD *)(a1 + 48);
    v27 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v38 = v26;
    v39 = 2114;
    v40 = v25;
    v41 = 2114;
    v42 = v27;
    v43 = 2048;
    v44 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  v36 = *(id *)(a1 + 72);
  v35 = v5;
  msv_dispatch_async_on_queue();

}

uint64_t __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_74(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[6], a1[4]);
  return result;
}

void __MRMediaRemoteRequestNowPlayingPlaybackQueueCapabilitiesForPlayer_block_invoke_2_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

@end
