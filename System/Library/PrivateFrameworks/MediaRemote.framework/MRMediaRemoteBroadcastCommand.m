@implementation MRMediaRemoteBroadcastCommand

void __MRMediaRemoteBroadcastCommand_block_invoke(uint64_t a1, uint64_t a2, __CFString *a3)
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  uint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 64), *(void **)(a1 + 32), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@%@"), CFSTR("Broadcast"), v7);

  v9 = (__CFString *)MRMediaRemoteCopySendCommandErrorDescription(a2);
  if (a3 && !v9)
  {
    v10 = *(_QWORD *)(a1 + 40);
    _MRLogForCategory(0xAuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v12)
        goto LABEL_22;
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      v42 = v8;
      v43 = 2114;
      v44 = 0;
      v45 = 2112;
      v46 = a3;
      v47 = 2114;
      v48 = v13;
      v49 = 2048;
      v50 = v15;
      v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v17 = v11;
      v18 = 52;
      goto LABEL_16;
    }
    if (!v12)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v42 = v8;
    v43 = 2114;
    v44 = 0;
    v45 = 2112;
    v46 = a3;
    v47 = 2048;
    v48 = v32;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  v19 = (__CFString *)MRMediaRemoteCopySendCommandErrorDescription(a2);

  v20 = *(_QWORD *)(a1 + 40);
  _MRLogForCategory(0xAuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v19)
  {
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (!v22)
        goto LABEL_22;
      v23 = (__CFString *)MRMediaRemoteCopySendCommandErrorDescription(a2);
      v24 = *(_QWORD *)(a1 + 40);
      v25 = (void *)MEMORY[0x1E0C99D68];
      v14 = v23;
      objc_msgSend(v25, "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v28 = v27;

      *(_DWORD *)buf = 138544386;
      v42 = v8;
      v43 = 2114;
      v44 = 0;
      v45 = 2114;
      v46 = v23;
      v47 = 2114;
      v48 = v24;
      v49 = 2048;
      v50 = v28;
      _os_log_error_impl(&dword_193827000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      goto LABEL_17;
    }
    if (v22)
    {
      v33 = (__CFString *)MRMediaRemoteCopySendCommandErrorDescription(a2);
      v34 = (void *)MEMORY[0x1E0C99D68];
      v35 = v33;
      objc_msgSend(v34, "date");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v38 = v37;

      *(_DWORD *)buf = 138544130;
      v42 = v8;
      v43 = 2114;
      v44 = 0;
      v45 = 2114;
      v46 = v33;
      v47 = 2048;
      v48 = v38;
      _os_log_error_impl(&dword_193827000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);

    }
  }
  else
  {
    v29 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (!v29)
        goto LABEL_22;
      v30 = *(__CFString **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v42 = v8;
      v43 = 2114;
      v44 = 0;
      v45 = 2114;
      v46 = v30;
      v47 = 2048;
      v48 = v31;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v17 = v11;
      v18 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_17:

      goto LABEL_22;
    }
    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString timeIntervalSinceDate:](v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v42 = v8;
      v43 = 2114;
      v44 = 0;
      v45 = 2048;
      v46 = v39;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v11;
      v18 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  v40 = *(_QWORD *)(a1 + 56);
  if (v40)
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v40 + 16))(v40, a2, a3);

}

@end
