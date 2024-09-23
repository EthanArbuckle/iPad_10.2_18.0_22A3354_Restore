@implementation NSKeyedUnarchiver(NRSecure)

+ (id)nr_secureUnarchiveObjectOfClasses:()NRSecure withFile:
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if (v9)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 0, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;
    if (v11)
    {
      nr_framework_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

      if (v13)
      {
        nr_framework_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "nr_safeDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v7;
          v21 = 2114;
          v22 = v17;
          _os_log_error_impl(&dword_1A0BDB000, v14, OS_LOG_TYPE_ERROR, "Failed to read data from file %{public}@ with error %{public}@", buf, 0x16u);

        }
      }
      v15 = 0;
    }
    else
    {
      objc_msgSend(a1, "nr_secureUnarchiveObjectOfClasses:withData:", v6, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)nr_secureUnarchiveObjectOfClasses:()NRSecure withData:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0;
  v8 = (void *)objc_msgSend([a1 alloc], "initForReadingFromData:error:", v7, &v17);
  v9 = v17;
  objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0CB2CD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishDecoding");
  if (v9)
  {
    nr_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      nr_framework_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "nr_safeDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v6;
        v20 = 2114;
        v21 = v16;
        _os_log_error_impl(&dword_1A0BDB000, v13, OS_LOG_TYPE_ERROR, "Failed to unarchive data of type %{public}@ with error %{public}@", buf, 0x16u);

      }
    }
  }
  v14 = v10;

  return v14;
}

@end
