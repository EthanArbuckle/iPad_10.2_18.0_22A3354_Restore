@implementation MRMediaRemoteGetContentItemsForIdentifiers

uint64_t __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
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
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  int v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a1[4];
  _MRLogForCategory(0xAuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2 && !a3)
  {
    v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v9)
        goto LABEL_22;
      v11 = a1[5];
      v10 = a1[6];
      v12 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
      v35 = 138544386;
      v36 = v11;
      v37 = 2114;
      v38 = v10;
      v39 = 2112;
      v40 = a2;
      v41 = 2114;
      v42 = v12;
      v43 = 2048;
      v44 = v14;
      v15 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v16 = v8;
      v17 = 52;
      goto LABEL_16;
    }
    if (!v9)
      goto LABEL_22;
    v28 = a1[5];
    v29 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
    v35 = 138544130;
    v36 = v28;
    v37 = 2114;
    v38 = v29;
    v39 = 2112;
    v40 = a2;
    v41 = 2048;
    v42 = v30;
    v15 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (a3)
  {
    v18 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (!v18)
        goto LABEL_22;
      v20 = a1[5];
      v19 = a1[6];
      v21 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
      v35 = 138544386;
      v36 = v20;
      v37 = 2114;
      v38 = v19;
      v39 = 2114;
      v40 = a3;
      v41 = 2114;
      v42 = v21;
      v43 = 2048;
      v44 = v22;
      _os_log_error_impl(&dword_193827000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v35, 0x34u);
      goto LABEL_17;
    }
    if (v18)
      __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1();
  }
  else
  {
    v23 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v23)
        goto LABEL_22;
      v25 = a1[5];
      v24 = a1[6];
      v26 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
      v35 = 138544130;
      v36 = v25;
      v37 = 2114;
      v38 = v24;
      v39 = 2114;
      v40 = v26;
      v41 = 2048;
      v42 = v27;
      v15 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v16 = v8;
      v17 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v35, v17);
LABEL_17:

      goto LABEL_22;
    }
    if (v23)
    {
      v31 = a1[5];
      v32 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[7]);
      v35 = 138543874;
      v36 = v31;
      v37 = 2114;
      v38 = v32;
      v39 = 2048;
      v40 = v33;
      v15 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v16 = v8;
      v17 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

void __MRMediaRemoteGetContentItemsForIdentifiers_block_invoke_cold_1()
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
  uint8_t v9;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7(v1, v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

@end
