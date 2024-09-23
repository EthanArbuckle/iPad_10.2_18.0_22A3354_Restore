@implementation NSKeyedUnarchiver(CPLSafeArchiving)

+ (id)cpl_safeUnarchiveObjectWithData:()CPLSafeArchiving class:
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a4, v5, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
      v8 = 0;
    else
      v8 = _CPLSilentLogging == 0;
    if (v8)
    {
      __CPLArchiverOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = a4;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Data for %{public}@ was corrupt: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLArchiverOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = a4;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Trying to deserialize %{public}@ with a nil data", buf, 0xCu);
      }

    }
    v6 = 0;
  }

  return v6;
}

+ (id)cpl_safeUnarchiveObjectWithData:()CPLSafeArchiving classes:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v5, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v7)
      v9 = 0;
    else
      v9 = _CPLSilentLogging == 0;
    if (v9)
    {
      __CPLArchiverOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v12;
        v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Data for (%{public}@) was corrupt: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    if (!_CPLSilentLogging)
    {
      __CPLArchiverOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Trying to deserialize (%{public}@) with a nil data", buf, 0xCu);

      }
    }
    v7 = 0;
  }

  return v7;
}

@end
