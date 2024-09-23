@implementation HRBrandImageManagerInvalidateOldImagesOperation

- (void)main
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("BrandLogos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -259200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52D8];
  v47 = v5;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v52 = v9;
    v53 = 2112;
    v54 = (uint64_t)v10;
    v55 = 2114;
    v56 = v47;
    _os_log_impl(&dword_1BC30A000, v7, OS_LOG_TYPE_INFO, "%{public}@: removing old brand logos: %@ with cutoff date %{public}@", buf, 0x20u);

    v5 = v47;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enumeratorAtPath:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v12;
  objc_msgSend(v12, "nextObject");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *MEMORY[0x1E0CB2A38];
    do
    {
      objc_msgSend(v4, "stringByAppendingPathComponent:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      objc_msgSend(v17, "attributesOfItemAtPath:error:", v16, &v50);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v50;

      objc_msgSend(v18, "objectForKeyedSubscript:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        if (objc_msgSend(v20, "compare:", v5) != 1)
        {
          v22 = v4;
          _HKInitializeLogging();
          v23 = (void *)*MEMORY[0x1E0CB52D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEBUG))
          {
            v34 = v23;
            v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            HKSensitiveLogItem();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v36;
            v53 = 2114;
            v54 = (uint64_t)v37;
            _os_log_debug_impl(&dword_1BC30A000, v34, OS_LOG_TYPE_DEBUG, "%{public}@: deleting file: %{public}@", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v19;
          v25 = objc_msgSend(v24, "removeItemAtPath:error:", v16, &v49);
          v26 = v49;

          if ((v25 & 1) != 0)
          {
            v19 = v26;
            v4 = v22;
          }
          else
          {
            v4 = v22;
            if (v26)
            {
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E0CB52D8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
              {
                v38 = v27;
                v39 = (objc_class *)objc_opt_class();
                NSStringFromClass(v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                HKSensitiveLogItem();
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v52 = v40;
                v53 = 2114;
                v54 = (uint64_t)v41;
                v55 = 2114;
                v56 = v26;
                _os_log_error_impl(&dword_1BC30A000, v38, OS_LOG_TYPE_ERROR, "%{public}@: failed to delete file: %{public}@ error: %{public}@", buf, 0x20u);

                v4 = v22;
              }
            }
            v19 = v26;
          }
          v5 = v47;
        }
      }
      else
      {
        _HKInitializeLogging();
        v28 = (void *)*MEMORY[0x1E0CB52D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        {
          v29 = v28;
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          HKSensitiveLogItem();
          v31 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v46;
          v53 = 2112;
          v54 = v31;
          v32 = (void *)v31;
          v55 = 2114;
          v56 = v19;
          _os_log_error_impl(&dword_1BC30A000, v29, OS_LOG_TYPE_ERROR, "%{public}@: could not find creation date for: %@ error: %{public}@", buf, 0x20u);

        }
      }

      objc_msgSend(v48, "nextObject");
      v33 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v33;
    }
    while (v33);
  }
  _HKInitializeLogging();
  v42 = (void *)*MEMORY[0x1E0CB52D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_INFO))
  {
    v43 = v42;
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v45;
    _os_log_impl(&dword_1BC30A000, v43, OS_LOG_TYPE_INFO, "%{public}@: done removing old brand logos", buf, 0xCu);

  }
}

@end
