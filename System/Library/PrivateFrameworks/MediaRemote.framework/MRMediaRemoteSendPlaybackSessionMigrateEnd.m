@implementation MRMediaRemoteSendPlaybackSessionMigrateEnd

void __MRMediaRemoteSendPlaybackSessionMigrateEnd_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6)
  {
    v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v15)
        goto LABEL_14;
      objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v23 = 138544130;
      v24 = CFSTR("sendPlaybackSessionMigrateEnd");
      v25 = 2114;
      v26 = v11;
      v27 = 2114;
      v28 = v16;
      v29 = 2048;
      v30 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v9;
      v20 = 42;
    }
    else
    {
      if (!v15)
        goto LABEL_14;
      objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v23 = 138543874;
      v24 = CFSTR("sendPlaybackSessionMigrateEnd");
      v25 = 2114;
      v26 = v11;
      v27 = 2048;
      v28 = v21;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v9;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v23, v20);
    goto LABEL_13;
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v10)
      goto LABEL_14;
    objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v23 = 138544386;
    v24 = CFSTR("sendPlaybackSessionMigrateEnd");
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v6;
    v29 = 2114;
    v30 = v12;
    v31 = 2048;
    v32 = v14;
    _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v23, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v10)
    __MRMediaRemoteSendPlaybackSessionMigrateEnd_block_invoke_cold_1();
LABEL_14:

  v22 = *(_QWORD *)(a1 + 56);
  if (v22)
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v6);

}

void __MRMediaRemoteSendPlaybackSessionMigrateEnd_block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_4();
  objc_msgSend(*(id *)(v1 + 40), "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2(v3, v4);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1(&dword_193827000, v5, v6, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_0();
}

@end
