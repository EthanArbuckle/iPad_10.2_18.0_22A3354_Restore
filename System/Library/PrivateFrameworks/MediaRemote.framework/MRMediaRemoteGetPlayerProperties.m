@implementation MRMediaRemoteGetPlayerProperties

void __MRMediaRemoteGetPlayerProperties_block_invoke(id *a1, void *a2, uint64_t Error)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __MRMediaRemoteGetPlayerProperties_block_invoke_2;
  v17 = &unk_1E30C6680;
  v6 = v5;
  v18 = v6;
  v19 = a1[4];
  v20 = a1[5];
  v21 = a1[6];
  v22 = a1[7];
  v23 = a1[8];
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](&v14);
  if (objc_msgSend(v6, "isResolved", v14, v15, v16, v17))
  {
    v8 = objc_msgSend(v6, "isLocal");
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v9, "playerClientForPlayerPath:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "playerPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v13, 0);

    }
    else
    {
      objc_msgSend(v9, "playerClientRequestsForPlayerPath:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "handlePlayerPropertiesRequestWithCompletion:", v7);
    }
  }
  else
  {
    if (Error)
    {
      v11 = 0;
    }
    else
    {
      Error = MRMediaRemoteNowPlayingPlayerPathCreateError(v6);
      v11 = (void *)Error;
    }
    v7[2](v7, 0, Error);
  }

}

void __MRMediaRemoteGetPlayerProperties_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
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
        v44 = v12;
        v45 = 2114;
        v46 = v11;
        v47 = 2112;
        v48 = v5;
        v49 = 2114;
        v50 = v13;
        v51 = 2048;
        v52 = v15;
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
    v44 = v29;
    v45 = 2114;
    v46 = v30;
    v47 = 2112;
    v48 = v5;
    v49 = 2048;
    v50 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v17 = v9;
    v18 = 42;
    goto LABEL_16;
  }
  if (v6)
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
        v44 = v21;
        v45 = 2114;
        v46 = v20;
        v47 = 2114;
        v48 = v6;
        v49 = 2114;
        v50 = v22;
        v51 = 2048;
        v52 = v23;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __MRMediaRemoteGetClientProperties_block_invoke_2_cold_1();
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
    v44 = v32;
    v45 = 2114;
    v46 = v33;
    v47 = 2048;
    v48 = v34;
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
    v44 = v26;
    v45 = 2114;
    v46 = v25;
    v47 = 2114;
    v48 = v27;
    v49 = 2048;
    v50 = v28;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MRMediaRemoteGetPlayerProperties_block_invoke_382;
  block[3] = &unk_1E30C6658;
  v35 = *(NSObject **)(a1 + 64);
  v36 = *(id *)(a1 + 72);
  v41 = v6;
  v42 = v36;
  v40 = v5;
  v37 = v6;
  v38 = v5;
  dispatch_async(v35, block);

}

uint64_t __MRMediaRemoteGetPlayerProperties_block_invoke_382(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

@end
