@implementation MRMediaRemoteUpdateClientProperties

uint64_t __MRMediaRemoteUpdateClientProperties_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  int v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a2)
  {
    v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v12)
        goto LABEL_14;
      v14 = a1[4];
      v13 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v22 = 138544130;
      v23 = CFSTR("updateClientProperties");
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = v14;
      v28 = 2048;
      v29 = v15;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v17 = v6;
      v18 = 42;
    }
    else
    {
      if (!v12)
        goto LABEL_14;
      v19 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v22 = 138543874;
      v23 = CFSTR("updateClientProperties");
      v24 = 2114;
      v25 = v19;
      v26 = 2048;
      v27 = v20;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v6;
      v18 = 32;
    }
    _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
    goto LABEL_13;
  }
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7)
      goto LABEL_14;
    v9 = a1[4];
    v8 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
    v22 = 138544386;
    v23 = CFSTR("updateClientProperties");
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = a2;
    v28 = 2114;
    v29 = v9;
    v30 = 2048;
    v31 = v11;
    _os_log_error_impl(&dword_193827000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v22, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7)
    __MRMediaRemoteUpdateClientProperties_block_invoke_cold_1();
LABEL_14:

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __MRMediaRemoteUpdateClientProperties_block_invoke_cold_1()
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

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6(v1, v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

@end
