@implementation MRMediaRemoteGetCountOfBrowsableContentChildItems

uint64_t __MRMediaRemoteGetCountOfBrowsableContentChildItems_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t result;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[4];
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      if (!v7)
        goto LABEL_15;
      v8 = a1[5];
      v9 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
      v31 = 138544386;
      v32 = v8;
      v33 = 2114;
      v34 = v9;
      v35 = 2112;
      v36 = v10;
      v37 = 2114;
      v38 = v11;
      v39 = 2048;
      v40 = v13;
      v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v15 = v6;
      v16 = 52;
    }
    else
    {
      if (!v7)
        goto LABEL_15;
      v24 = a1[5];
      v25 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", a1[7]);
      v31 = 138544130;
      v32 = v24;
      v33 = 2114;
      v34 = v25;
      v35 = 2112;
      v36 = v10;
      v37 = 2048;
      v38 = v26;
      v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v15 = v6;
      v16 = 42;
    }
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v31, v16);

  }
  else
  {
    if (v5)
    {
      if (!v7)
        goto LABEL_15;
      v18 = a1[5];
      v17 = a1[6];
      v19 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[7]);
      v31 = 138544130;
      v32 = v18;
      v33 = 2114;
      v34 = v17;
      v35 = 2114;
      v36 = v19;
      v37 = 2048;
      v38 = v20;
      v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v22 = v6;
      v23 = 42;
    }
    else
    {
      if (!v7)
        goto LABEL_15;
      v27 = a1[5];
      v28 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[7]);
      v31 = 138543874;
      v32 = v27;
      v33 = 2114;
      v34 = v28;
      v35 = 2048;
      v36 = v29;
      v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v22 = v6;
      v23 = 32;
    }
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v31, v23);
  }

LABEL_15:
  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
