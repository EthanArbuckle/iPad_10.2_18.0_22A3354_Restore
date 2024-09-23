@implementation MRMediaRemoteGetSupportedBrowsableContentAPIs

void __MRMediaRemoteGetSupportedBrowsableContentAPIs_block_invoke(_QWORD *a1, uint64_t a2, __CFError *a3)
{
  __CFString *v6;
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
  uint64_t v35;
  CFIndex Code;
  int v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)MRMediaRemoteCopyBrowsableContentAPIMaskDescription(a2);
  v7 = a1[4];
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!a3 && v6)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v10)
        goto LABEL_22;
      v12 = a1[5];
      v11 = a1[6];
      v13 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v37 = 138544386;
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
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_22;
    v29 = a1[5];
    v30 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v37 = 138544130;
    v38 = v29;
    v39 = 2114;
    v40 = v30;
    v41 = 2112;
    v42 = v6;
    v43 = 2048;
    v44 = v31;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (a3)
  {
    v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v19)
        goto LABEL_22;
      v21 = a1[5];
      v20 = a1[6];
      v22 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v37 = 138544386;
      v38 = v21;
      v39 = 2114;
      v40 = v20;
      v41 = 2114;
      v42 = a3;
      v43 = 2114;
      v44 = v22;
      v45 = 2048;
      v46 = v23;
      _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v37, 0x34u);
      goto LABEL_17;
    }
    if (v19)
      __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1();
  }
  else
  {
    v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v24)
        goto LABEL_22;
      v26 = a1[5];
      v25 = a1[6];
      v27 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v37 = 138544130;
      v38 = v26;
      v39 = 2114;
      v40 = v25;
      v41 = 2114;
      v42 = v27;
      v43 = 2048;
      v44 = v28;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v17 = v9;
      v18 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v37, v18);
LABEL_17:

      goto LABEL_22;
    }
    if (v24)
    {
      v32 = a1[5];
      v33 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v37 = 138543874;
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
  }
LABEL_22:

  v35 = a1[8];
  if (v35)
  {
    if (a3)
      Code = CFErrorGetCode(a3);
    else
      Code = 0;
    (*(void (**)(uint64_t, uint64_t, CFIndex))(v35 + 16))(v35, a2, Code);
  }

}

@end
