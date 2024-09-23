@implementation MRMediaRemoteGetBrowsableContentChildItems

uint64_t __MRMediaRemoteGetBrowsableContentChildItems_block_invoke(_QWORD *a1, void *a2)
{
  __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t result;
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(a2, 0);

  v5 = a1[4];
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v5)
    {
      if (!v7)
        goto LABEL_14;
      v18 = a1[5];
      v17 = a1[6];
      v19 = (__CFString *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", a1[7]);
      v36 = 138544130;
      v37 = v18;
      v38 = 2114;
      v39 = v17;
      v40 = 2114;
      v41 = v19;
      v42 = 2048;
      v43 = v20;
      v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v22 = v6;
      v23 = 42;
    }
    else
    {
      if (!v7)
        goto LABEL_14;
      v32 = a1[5];
      v33 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString timeIntervalSinceDate:](v13, "timeIntervalSinceDate:", a1[7]);
      v36 = 138543874;
      v37 = v32;
      v38 = 2114;
      v39 = v33;
      v40 = 2048;
      v41 = v34;
      v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v22 = v6;
      v23 = 32;
    }
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v36, v23);
    goto LABEL_13;
  }
  if (v5)
  {
    if (!v7)
      goto LABEL_14;
    v8 = a1[5];
    v9 = a1[6];
    v10 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(a2, 0);
    v11 = a1[4];
    v12 = (void *)MEMORY[0x1E0C99D68];
    v13 = v10;
    objc_msgSend(v12, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
    v16 = v15;

    v36 = 138544386;
    v37 = v8;
    v38 = 2114;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2114;
    v43 = v11;
    v44 = 2048;
    v45 = v16;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", (uint8_t *)&v36, 0x34u);

LABEL_13:
    goto LABEL_14;
  }
  if (v7)
  {
    v24 = a1[5];
    v25 = a1[6];
    v26 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(a2, 0);
    v27 = (void *)MEMORY[0x1E0C99D68];
    v28 = v26;
    objc_msgSend(v27, "date");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceDate:", a1[7]);
    v31 = v30;

    v36 = 138544130;
    v37 = v24;
    v38 = 2114;
    v39 = v25;
    v40 = 2112;
    v41 = v26;
    v42 = 2048;
    v43 = v31;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", (uint8_t *)&v36, 0x2Au);

  }
LABEL_14:

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  return result;
}

@end
