@implementation NSCoder(AppStoreDaemon)

- (id)asd_decodeJSONDictionaryForKey:()AppStoreDaemon
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  objc_msgSend(a1, "_asd_decodeJSONObjectForKey:error:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v4;
      v18 = 2114;
      v19 = v6;
      v12 = v11;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Error decoding JSON dictionary. key = %{public}@, error = %{public}@", buf, 0x20u);

    }
  }
  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (void)asd_encodeJSONDictionary:()AppStoreDaemon forKey:
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11 = 0;
  objc_msgSend(a1, "_asd_encodeJSONObject:forKey:error:", a3, v6, &v11);
  v7 = v11;
  if (v7)
  {
    ASDLogHandleForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      v10 = v9;
      _os_log_error_impl(&dword_19A03B000, v8, OS_LOG_TYPE_ERROR, "[%{public}@]: Error encoding JSON dictionary. key = %{public}@, error = %{public}@", buf, 0x20u);

    }
  }

}

- (id)_asd_decodeJSONObjectForKey:()AppStoreDaemon error:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_asd_encodeJSONObject:()AppStoreDaemon forKey:error:
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  NSObject *v12;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;
    if (v10)
      objc_msgSend(a1, "encodeObject:forKey:", v10, v9);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      AMSHashIfNeeded();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      _os_log_error_impl(&dword_19A03B000, v12, OS_LOG_TYPE_ERROR, "[%{public}@]: Error encoding JSON object. object = %{public}@", (uint8_t *)&v17, 0x16u);

    }
    if (a5)
    {
      ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 507, CFSTR("Invalid JSON Object"));
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

@end
