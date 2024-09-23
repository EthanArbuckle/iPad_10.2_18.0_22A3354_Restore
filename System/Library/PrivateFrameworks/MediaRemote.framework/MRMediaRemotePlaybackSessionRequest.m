@implementation MRMediaRemotePlaybackSessionRequest

void ___MRMediaRemotePlaybackSessionRequest_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  MRPlaybackSessionRequestMessage *v10;
  MRPlaybackSessionRequestMessage *Error;
  void *v12;
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  _QWORD v16[4];
  MRPlaybackSessionRequestMessage *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_2;
  v18[3] = &unk_1E30CA6A8;
  v7 = v5;
  v19 = v7;
  v20 = a1[4];
  v21 = a1[5];
  v23 = a1[7];
  v22 = a1[6];
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v18);
  if (objc_msgSend(v7, "isResolved"))
  {
    if (objc_msgSend(v7, "isLocal"))
    {
      v9 = (uint64_t)a1[4];
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_17;
      v16[3] = &unk_1E30C7B60;
      v17 = v8;
      MRServiceClientPlaybackSessionCallback((uint64_t)v7, v9, v16);
      v10 = v17;
    }
    else
    {
      v10 = -[MRPlaybackSessionRequestMessage initWithRequest:forPlayerPath:]([MRPlaybackSessionRequestMessage alloc], "initWithRequest:forPlayerPath:", a1[4], v7);
      v12 = (void *)MRGetSharedService();
      v13 = a1[6];
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_3;
      v14[3] = &unk_1E30CA6D0;
      v15 = v8;
      MRMediaRemoteServicePlaybackSessionRequest(v12, v10, v13, v14);

    }
  }
  else
  {
    if (a3)
      Error = a3;
    else
      Error = (MRPlaybackSessionRequestMessage *)MRMediaRemoteNowPlayingPlayerPathCreateError(v7);
    v10 = Error;
    ((void (**)(_QWORD, _QWORD, MRPlaybackSessionRequestMessage *))v8)[2](v8, 0, Error);
  }

}

void ___MRMediaRemotePlaybackSessionRequest_block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 && !v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10)
        goto LABEL_22;
      v12 = a1[4];
      v11 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544386;
      v37 = CFSTR("playbackSession");
      v38 = 2114;
      v39 = v11;
      v40 = 2112;
      v41 = v5;
      v42 = 2114;
      v43 = v12;
      v44 = 2048;
      v45 = v14;
      v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v16 = v9;
      v17 = 52;
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_22;
    v26 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
    *(_DWORD *)buf = 138544130;
    v37 = CFSTR("playbackSession");
    v38 = 2114;
    v39 = v26;
    v40 = 2112;
    v41 = v5;
    v42 = 2048;
    v43 = v27;
    v15 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v6)
  {
    v18 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v18)
        goto LABEL_22;
      v20 = a1[4];
      v19 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544386;
      v37 = CFSTR("playbackSession");
      v38 = 2114;
      v39 = v19;
      v40 = 2114;
      v41 = v6;
      v42 = 2114;
      v43 = v20;
      v44 = 2048;
      v45 = v21;
      _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_17;
    }
    if (v18)
      ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v6, v9);
  }
  else
  {
    v22 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v22)
        goto LABEL_22;
      v24 = (void *)a1[4];
      v23 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544130;
      v37 = CFSTR("playbackSession");
      v38 = 2114;
      v39 = v23;
      v40 = 2114;
      v41 = v24;
      v42 = 2048;
      v43 = v25;
      v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v16 = v9;
      v17 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_17:

      goto LABEL_22;
    }
    if (v22)
    {
      v28 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138543874;
      v37 = CFSTR("playbackSession");
      v38 = 2114;
      v39 = v28;
      v40 = 2048;
      v41 = v29;
      v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v16 = v9;
      v17 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  v30 = (void *)a1[8];
  if (v30)
  {
    v31 = a1[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___MRMediaRemotePlaybackSessionRequest_block_invoke_14;
    block[3] = &unk_1E30C6658;
    v35 = v30;
    v33 = v5;
    v34 = v6;
    dispatch_async(v31, block);

  }
}

uint64_t ___MRMediaRemotePlaybackSessionRequest_block_invoke_14(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___MRMediaRemotePlaybackSessionRequest_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "playbackSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

uint64_t __MRMediaRemotePlaybackSessionRequest_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void ___MRMediaRemotePlaybackSessionRequest_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v9 = 138544130;
  v10 = CFSTR("playbackSession");
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = a2;
  v15 = 2048;
  v16 = v8;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v9, 0x2Au);

}

@end
