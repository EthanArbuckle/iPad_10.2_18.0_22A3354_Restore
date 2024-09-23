@implementation NSKeyedArchiver(NRSecure)

+ (id)nr_secureArchivedDataWithRootObject:()NRSecure
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v5)
    {
      nr_framework_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        nr_framework_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "nr_safeDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v16 = v10;
          v17 = 2112;
          v18 = v12;
          _os_log_error_impl(&dword_1A0BDB000, v8, OS_LOG_TYPE_ERROR, "Got error (%{public}@) archiving (%@)", buf, 0x16u);

        }
      }
    }
    v9 = v4;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (uint64_t)nr_secureArchiveRootObject:()NRSecure toFile:
{
  return objc_msgSend(a1, "nr_secureArchiveRootObject:toFile:withOptions:", a3, a4, 1);
}

+ (uint64_t)nr_secureArchiveRootObject:()NRSecure toFile:withOptions:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "nr_secureArchivedDataWithRootObject:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "stringByDeletingLastPathComponent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

    if ((v13 & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v39);
      v14 = v39;

      if (v14)
      {
        nr_framework_log();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

        if (v24)
        {
          nr_framework_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "nr_safeDescription");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v41 = v33;
            v42 = 2114;
            v43 = v11;
            v44 = 2112;
            v45 = v35;
            _os_log_error_impl(&dword_1A0BDB000, v25, OS_LOG_TYPE_ERROR, "Error (%{public}@) creating directory (%{public}@) for (%@)", buf, 0x20u);

          }
        }
      }
    }

    v38 = 0;
    v21 = objc_msgSend(v10, "writeToFile:options:error:", v9, a5, &v38);
    v20 = v38;
    if (v20)
    {
      nr_framework_log();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (v27)
      {
        nr_framework_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          -[NSObject nr_safeDescription](v20, "nr_safeDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v30;
          v42 = 2112;
          v43 = v32;
          _os_log_error_impl(&dword_1A0BDB000, v28, OS_LOG_TYPE_ERROR, "Error (%{public}@) writing encoded data for (%@)", buf, 0x16u);

        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "fileExistsAtPath:", v9);

    if (!v16)
    {
      v21 = 1;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v17, "removeItemAtPath:error:", v9, &v37);
    v11 = v37;

    if (!v11)
    {
      v21 = 1;
      goto LABEL_21;
    }
    nr_framework_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (!v19)
    {
      v21 = 0;
      goto LABEL_21;
    }
    nr_framework_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "nr_safeDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v36;
      v42 = 2114;
      v43 = v9;
      _os_log_error_impl(&dword_1A0BDB000, v20, OS_LOG_TYPE_ERROR, "Error (%{public}@) deleting file (%{public}@)", buf, 0x16u);

    }
    v21 = 0;
  }

LABEL_21:
LABEL_22:

  return v21;
}

@end
