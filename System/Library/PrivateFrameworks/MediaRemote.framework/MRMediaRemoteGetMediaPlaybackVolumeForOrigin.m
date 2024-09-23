@implementation MRMediaRemoteGetMediaPlaybackVolumeForOrigin

void __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originClientRequestsForPlayerPath:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "handleVolumeRequestWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  _QWORD v41[4];
  id v42;
  float v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5)
  {
    *(float *)&v6 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v15)
    {
      if (v16)
      {
        if (!v17)
          goto LABEL_21;
        v28 = *(_QWORD *)(a1 + 40);
        v27 = *(_QWORD *)(a1 + 48);
        v29 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544130;
        v45 = v28;
        v46 = 2114;
        v47 = v27;
        v48 = 2114;
        v49 = v29;
        v50 = 2048;
        v51 = v30;
        v31 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v32 = v8;
        v33 = 42;
      }
      else
      {
        if (!v17)
          goto LABEL_21;
        v37 = *(_QWORD *)(a1 + 40);
        v38 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v45 = v37;
        v46 = 2114;
        v47 = v38;
        v48 = 2048;
        v49 = v39;
        v31 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v32 = v8;
        v33 = 32;
      }
      _os_log_impl(&dword_193827000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      goto LABEL_20;
    }
    if (v16)
    {
      if (!v17)
        goto LABEL_21;
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      *(float *)&v18 = a3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v45 = v19;
      v46 = 2114;
      v47 = v20;
      v48 = 2112;
      v49 = v13;
      v50 = 2114;
      v51 = v21;
      v52 = 2048;
      v53 = v23;
      v24 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v25 = v8;
      v26 = 52;
    }
    else
    {
      if (!v17)
        goto LABEL_21;
      v34 = *(_QWORD *)(a1 + 40);
      v35 = *(_QWORD *)(a1 + 48);
      *(float *)&v18 = a3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v45 = v34;
      v46 = 2114;
      v47 = v35;
      v48 = 2112;
      v49 = v13;
      v50 = 2048;
      v51 = v36;
      v24 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v25 = v8;
      v26 = 42;
    }
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);

    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v45 = v11;
      v46 = 2114;
      v47 = v10;
      v48 = 2114;
      v49 = v5;
      v50 = 2114;
      v51 = v12;
      v52 = 2048;
      v53 = v14;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    }
  }
  else if (v9)
  {
    __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke_cold_1(a1, v5, v8);
  }
LABEL_21:

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke_85;
  v41[3] = &unk_1E30C66D0;
  v40 = *(NSObject **)(a1 + 64);
  v42 = *(id *)(a1 + 72);
  v43 = a3;
  dispatch_async(v40, v41);

}

uint64_t __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke_85(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(float))(result + 16))(*(float *)(a1 + 40));
  return result;
}

void __MRMediaRemoteGetMediaPlaybackVolumeForOrigin_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id Error;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a2;
  objc_msgSend(v5, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v9)
      Error = v9;
    else
      Error = (id)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    v8 = Error;
    (*(void (**)(float))(*(_QWORD *)(a1 + 32) + 16))(0.0);

  }
}

@end
