@implementation MRMediaRemotePlaybackSessionMigrateForOrigin

void ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  MRPlaybackSessionRequest *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1[4], "setResolvedPlayerPath:", v9);
  objc_msgSend(a1[4], "endEvent:withError:", CFSTR("requestType"), v12);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2;
  v22 = &unk_1E30C9570;
  v13 = v9;
  v23 = v13;
  v14 = v10;
  v24 = v14;
  v25 = a1[5];
  v26 = a1[4];
  v27 = a1[6];
  v28 = a1[8];
  v15 = MEMORY[0x194036C44](&v19);
  v16 = (void *)v15;
  if (v11)
  {
    v17 = objc_alloc_init(MRPlaybackSessionRequest);
    -[MRPlaybackSessionRequest setType:](v17, "setType:", v11, v19, v20, v21, v22, v23, v24, v25, v26, v27);
    objc_msgSend(a1[4], "requestID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackSessionRequest setRequestIdentifier:](v17, "setRequestIdentifier:", v18);

    objc_msgSend(a1[4], "setPlaybackSessionRequest:", v17);
    _MRMediaRemotePlaybackSessionMigrateForPlayer(a1[4], v13, v14, a1[7], v16);

  }
  else
  {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v12);
  }

}

void ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("source=%@ destination=%@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v3)
  {
    v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v12)
        goto LABEL_14;
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138544130;
      v22 = v13;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v4;
      v27 = 2048;
      v28 = v14;
      v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v16 = v6;
      v17 = 42;
    }
    else
    {
      if (!v12)
        goto LABEL_14;
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "requestID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
      *(_DWORD *)buf = 138543874;
      v22 = v18;
      v23 = 2114;
      v24 = v9;
      v25 = 2048;
      v26 = v19;
      v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v16 = v6;
      v17 = 32;
    }
    _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "requestID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 64));
    *(_DWORD *)buf = 138544386;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v3;
    v27 = 2114;
    v28 = v4;
    v29 = 2048;
    v30 = v11;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2_cold_1();
LABEL_14:

  v20 = *(_QWORD *)(a1 + 72);
  if (v20)
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v3);

}

void ___MRMediaRemotePlaybackSessionMigrateForOrigin_block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*(id *)(v1 + 56), "requestID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(v0 + 64));
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_193827000, v4, v5, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_0();
}

@end
