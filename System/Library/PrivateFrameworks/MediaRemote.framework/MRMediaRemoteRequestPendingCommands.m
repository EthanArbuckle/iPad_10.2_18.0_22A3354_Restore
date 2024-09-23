@implementation MRMediaRemoteRequestPendingCommands

void __MRMediaRemoteRequestPendingCommands_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const __CFString *v44;
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
  if (v6)
  {
    v7 = a1[4];
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v9)
        goto LABEL_20;
      v11 = a1[4];
      v10 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544386;
      v44 = CFSTR("requestPendingCommands");
      v45 = 2114;
      v46 = v10;
      v47 = 2114;
      v48 = v6;
      v49 = 2114;
      v50 = v11;
      v51 = 2048;
      v52 = v13;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_19:

      goto LABEL_20;
    }
    if (v9)
      __MRMediaRemoteRequestPendingCommands_block_invoke_cold_1();
  }
  else
  {
    v14 = (void *)MRMediaRemoteCopyCommandsDescription(v5);

    v15 = a1[4];
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v14)
    {
      if (v15)
      {
        if (!v16)
          goto LABEL_20;
        v25 = (void *)a1[4];
        v24 = a1[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", a1[6]);
        *(_DWORD *)buf = 138544130;
        v44 = CFSTR("requestPendingCommands");
        v45 = 2114;
        v46 = v24;
        v47 = 2114;
        v48 = v25;
        v49 = 2048;
        v50 = v26;
        v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v28 = v8;
        v29 = 42;
      }
      else
      {
        if (!v16)
          goto LABEL_20;
        v37 = a1[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", a1[6]);
        *(_DWORD *)buf = 138543874;
        v44 = CFSTR("requestPendingCommands");
        v45 = 2114;
        v46 = v37;
        v47 = 2048;
        v48 = v38;
        v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v28 = v8;
        v29 = 32;
      }
      _os_log_impl(&dword_193827000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_19;
    }
    if (v15)
    {
      if (!v16)
        goto LABEL_20;
      v17 = a1[5];
      v18 = (void *)MRMediaRemoteCopyCommandsDescription(v5);
      v19 = a1[4];
      v20 = (void *)MEMORY[0x1E0C99D68];
      v12 = v18;
      objc_msgSend(v20, "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", a1[6]);
      v23 = v22;

      *(_DWORD *)buf = 138544386;
      v44 = CFSTR("requestPendingCommands");
      v45 = 2114;
      v46 = v17;
      v47 = 2112;
      v48 = v18;
      v49 = 2114;
      v50 = v19;
      v51 = 2048;
      v52 = v23;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      goto LABEL_19;
    }
    if (v16)
    {
      v30 = a1[5];
      v31 = (void *)MRMediaRemoteCopyCommandsDescription(v5);
      v32 = (void *)MEMORY[0x1E0C99D68];
      v33 = v31;
      objc_msgSend(v32, "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", a1[6]);
      v36 = v35;

      *(_DWORD *)buf = 138544130;
      v44 = CFSTR("requestPendingCommands");
      v45 = 2114;
      v46 = v30;
      v47 = 2112;
      v48 = v31;
      v49 = 2048;
      v50 = v36;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);

    }
  }
LABEL_20:

  v39 = (void *)a1[8];
  if (v39)
  {
    v42 = v39;
    v40 = v5;
    v41 = v6;
    msv_dispatch_async_on_queue();

  }
}

uint64_t __MRMediaRemoteRequestPendingCommands_block_invoke_42(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __MRMediaRemoteRequestPendingCommands_block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)MRCreatePropertyListFromXPCMessage(a2, "MRXPC_COMMAND_KEY");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __MRMediaRemoteRequestPendingCommands_block_invoke_cold_1()
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
