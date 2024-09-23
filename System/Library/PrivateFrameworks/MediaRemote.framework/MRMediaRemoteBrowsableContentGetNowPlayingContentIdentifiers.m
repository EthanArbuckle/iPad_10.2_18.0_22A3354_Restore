@implementation MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers

uint64_t __MRMediaRemoteBrowsableContentGetNowPlayingContentIdentifiers_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      if (!v6)
        goto LABEL_14;
      v8 = a1[5];
      v7 = a1[6];
      v9 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[7]);
      v26 = 138544386;
      v27 = v8;
      v28 = 2114;
      v29 = v7;
      v30 = 2112;
      v31 = a2;
      v32 = 2114;
      v33 = v9;
      v34 = 2048;
      v35 = v11;
      v12 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v13 = v5;
      v14 = 52;
      goto LABEL_13;
    }
    if (!v6)
      goto LABEL_14;
    v19 = a1[5];
    v20 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", a1[7]);
    v26 = 138544130;
    v27 = v19;
    v28 = 2114;
    v29 = v20;
    v30 = 2112;
    v31 = a2;
    v32 = 2048;
    v33 = v21;
    v12 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_10;
  }
  if (v4)
  {
    if (!v6)
      goto LABEL_14;
    v16 = a1[5];
    v15 = a1[6];
    v17 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", a1[7]);
    v26 = 138544130;
    v27 = v16;
    v28 = 2114;
    v29 = v15;
    v30 = 2114;
    v31 = v17;
    v32 = 2048;
    v33 = v18;
    v12 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_10:
    v13 = v5;
    v14 = 42;
    goto LABEL_13;
  }
  if (!v6)
    goto LABEL_14;
  v22 = a1[5];
  v23 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", a1[7]);
  v26 = 138543874;
  v27 = v22;
  v28 = 2114;
  v29 = v23;
  v30 = 2048;
  v31 = v24;
  v12 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
  v13 = v5;
  v14 = 32;
LABEL_13:
  _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v26, v14);

LABEL_14:
  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
