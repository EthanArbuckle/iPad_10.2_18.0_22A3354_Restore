@implementation GEOGetURLWithSource

id ___GEOGetURLWithSource_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetUserDefaultsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      _GEOGetURLWithSource(*(_QWORD *)(a1 + 40), 0, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = objc_opt_class();
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "URL for type '%{public}@' is of unexpected type '%{public}@'", (uint8_t *)&v10, 0x16u);

    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "length"))
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v8 = v5;
LABEL_10:

  return v8;
}

id __GEOGetURLWithSource_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  __CFString *v6;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    GEOGetUserDefaultsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (v5 > 0x41)
        v6 = 0;
      else
        v6 = off_1E1C13090[v5];
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1885A9000, v4, OS_LOG_TYPE_ERROR, "URL value for type '%{public}@' is not a valid URL", (uint8_t *)&v8, 0xCu);
    }

  }
  return v3;
}

@end
