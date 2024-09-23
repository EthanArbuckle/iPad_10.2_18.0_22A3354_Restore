@implementation MRMediaRemoteGetSupportedCommandsForPlayer

void __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *Error;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_2;
  v15[3] = &unk_1E30C6BC0;
  v6 = v5;
  v16 = v6;
  v17 = a1[4];
  v18 = a1[5];
  v19 = a1[6];
  v20 = a1[7];
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v15);
  if (objc_msgSend(v6, "isResolved"))
  {
    v8 = objc_msgSend(v6, "isLocal");
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "playerClientForPlayerPath:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "supportedCommands");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v12, 0);

    }
    else
    {
      objc_msgSend(v9, "playerClientRequestsForPlayerPath:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "handleSupportedCommandsRequestWithCompletion:", v7);
    }

  }
  else if (a3)
  {
    Error = (void *)MRMediaRemoteNowPlayingPlayerPathCreateError(v6);
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, Error);

  }
  else
  {
    v14 = (void *)MRGetSharedService();
    MRMediaRemoteServiceGetSupportedCommands(v14, v6, a1[6], v7);
  }

}

void __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
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
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld commands"), objc_msgSend(v5, "count"));
  v8 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6 && v7)
  {
    v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v13 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v40 = CFSTR("supportedCommands");
        v41 = 2114;
        v42 = v12;
        v43 = 2112;
        v44 = v7;
        v45 = 2114;
        v46 = v13;
        v47 = 2048;
        v48 = v15;
        v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v17 = v10;
        v18 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v11)
      goto LABEL_22;
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v40 = CFSTR("supportedCommands");
    v41 = 2114;
    v42 = v27;
    v43 = 2112;
    v44 = v7;
    v45 = 2048;
    v46 = v28;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v10;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v19)
      {
        v21 = *(_QWORD *)(a1 + 32);
        v20 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v40 = CFSTR("supportedCommands");
        v41 = 2114;
        v42 = v20;
        v43 = 2114;
        v44 = v6;
        v45 = 2114;
        v46 = v21;
        v47 = 2048;
        v48 = v22;
        _os_log_error_impl(&dword_193827000, v10, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_2_cold_1();
    }
    goto LABEL_22;
  }
  v23 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v23)
      goto LABEL_22;
    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    v40 = CFSTR("supportedCommands");
    v41 = 2114;
    v42 = v29;
    v43 = 2048;
    v44 = v30;
    v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v17 = v10;
    v18 = 32;
    goto LABEL_16;
  }
  if (v23)
  {
    v25 = *(void **)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v40 = CFSTR("supportedCommands");
    v41 = 2114;
    v42 = v24;
    v43 = 2114;
    v44 = v25;
    v45 = 2048;
    v46 = v26;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_30;
  block[3] = &unk_1E30C6B98;
  v36 = v5;
  v31 = *(NSObject **)(a1 + 56);
  v32 = *(id *)(a1 + 64);
  v37 = v6;
  v38 = v32;
  v33 = v6;
  v34 = v5;
  dispatch_async(v31, block);

}

uint64_t __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_30(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  result = a1[6];
  if (result)
  {
    if (a1[4])
      v3 = a1[4];
    else
      v3 = MEMORY[0x1E0C9AA60];
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, a1[5]);
  }
  return result;
}

void __MRMediaRemoteGetSupportedCommandsForPlayer_block_invoke_2_cold_1()
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

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6(v1, v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

@end
