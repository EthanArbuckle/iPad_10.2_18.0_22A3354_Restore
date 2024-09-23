@implementation HMDResetConfigPostCleanup

+ (id)_readExistingPostCleanupRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resetConfigPostCleanupFileLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "path"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "fileExistsAtPath:", v6),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v11;
      v51 = 2112;
      v52 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Found reset config post cleanup record on disk at %@. Going to read it.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v4, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v12, "dataWithContentsOfFile:options:error:", v13, 2, &v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v46;

    if (v14)
    {
      v44 = v15;
      v16 = (void *)MEMORY[0x1E0CB3710];
      v17 = (void *)MEMORY[0x1E0C99E60];
      v48 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0C99E60];
      v47 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      objc_msgSend(v16, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v19, v22, v14, &v45);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v45;

      if (v23)
      {
        v25 = v23;
        objc_opt_class();
        v26 = objc_opt_isKindOfClass() & 1;
        if (v26)
          v27 = v25;
        else
          v27 = 0;
        v28 = v27;

        if (!v26)
        {
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = v9;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = v29;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v32;
            v51 = 2112;
            v52 = v25;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to open the reset config post cleanup record : %@", buf, 0x16u);

            v29 = v43;
          }

          objc_autoreleasePoolPop(v29);
          v25 = v3;
        }
        v33 = v25;

      }
      else
      {
        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = v9;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v50 = v41;
          v51 = 2112;
          v52 = v24;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive reset config post cleanup record from archive data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v38);
        v33 = v3;
      }
      v15 = v44;

    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = v9;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v37;
        v51 = 2112;
        v52 = v15;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the post cleanup record due to an error: [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v33 = v3;
    }

  }
  else
  {
    v33 = v3;
  }

  return v33;
}

+ (void)writePostCleanupRecordWithReason:(unint64_t)a3 steps:(unint64_t)a4
{
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  __CFString *v42;
  id v43;
  int v44;
  void *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 != 1)
  {
    objc_msgSend(a1, "_readExistingPostCleanupRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)objc_msgSend(v7, "mutableCopy");

    -[__CFString objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("RST.PST.CleanUP.steps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543618;
        v45 = v15;
        v46 = 2112;
        v47 = v11;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Found existing reason : %@", (uint8_t *)&v44, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[__CFString unsignedLongValue](v11, "unsignedLongValue") | a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, CFSTR("RST.PST.CleanUP.steps"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, CFSTR("RST.POST.CleanUP.reason"));

    objc_msgSend(a1, "resetConfigPostCleanupFileLocation");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = a1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v18)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543362;
        v45 = v41;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to write reset config cleanup record", (uint8_t *)&v44, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      goto LABEL_32;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138543874;
      v45 = v23;
      v46 = 2112;
      v47 = v8;
      v48 = 2112;
      v49 = v18;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Going to write reset config cleanup record : [%@] -> [%@]", (uint8_t *)&v44, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    encodeRootObject();
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[__CFString path](v18, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[__CFString writeToFile:atomically:](v24, "writeToFile:atomically:", v25, 1);

      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v20;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if ((v26 & 1) != 0)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 138544130;
          v45 = v31;
          v46 = 2112;
          v47 = v8;
          v48 = 2112;
          v49 = v24;
          v50 = 2112;
          v51 = v18;
          v32 = "%{public}@Successfully written reset config post cleanup record on disk : %@, %@, %@";
          v33 = v30;
          v34 = OS_LOG_TYPE_DEFAULT;
          v35 = 42;
LABEL_30:
          _os_log_impl(&dword_1CD062000, v33, v34, v32, (uint8_t *)&v44, v35);

        }
      }
      else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543874;
        v45 = v31;
        v46 = 2112;
        v47 = v24;
        v48 = 2112;
        v49 = v18;
        v32 = "%{public}@Unable to write reset config post cleanup record [%@] to location : %@";
        v33 = v30;
        v34 = OS_LOG_TYPE_ERROR;
        v35 = 32;
        goto LABEL_30;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = v20;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138543618;
        v45 = v31;
        v46 = 2112;
        v47 = v18;
        v32 = "%{public}@Unable to write reset config cleanup record at location : %@";
        v33 = v30;
        v34 = OS_LOG_TYPE_ERROR;
        v35 = 22;
        goto LABEL_30;
      }
    }

    objc_autoreleasePoolPop(v27);
LABEL_32:

    return;
  }
  v36 = (void *)MEMORY[0x1D17BA0A0](a1, a2);
  v37 = a1;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 - 1 > 8)
      v40 = CFSTR("Unknown");
    else
      v40 = off_1E89A26A8[a3 - 1];
    HMDResetConfigPostCleanupStepsToString(a4);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = 138543874;
    v45 = v39;
    v46 = 2112;
    v47 = v40;
    v48 = 2112;
    v49 = v42;
    _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Clean up reason or steps are needed. [reason: %@] [steps: %@]", (uint8_t *)&v44, 0x20u);

  }
  objc_autoreleasePoolPop(v36);
}

+ (void)performAnyPostCleanupStepsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cleanupInvalidUserDefaults:", v3);

  objc_msgSend(a1, "resetConfigPostCleanupFileLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      objc_msgSend(a1, "_readExistingPostCleanupRecord");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RST.POST.CleanUP.reason"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
      v11 = v10;

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RST.PST.CleanUP.steps"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      if (v11 && v14)
      {
        objc_msgSend(a1, "performResetConfigPostCleanupSteps:dueToReason:", objc_msgSend(v14, "unsignedLongValue"), objc_msgSend(v11, "unsignedIntValue"));
        v20 = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "removeFilesAtLocation:", v15);

        if (isFirstLaunchAfterBoot_onceToken != -1)
          dispatch_once(&isFirstLaunchAfterBoot_onceToken, &__block_literal_global_709);
      }
      else
      {
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = a1;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = v19;
          v23 = 2112;
          v24 = v11;
          v25 = 2112;
          v26 = v14;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to cast NSNumber from dictionary value : %@, %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
      }

    }
  }

}

+ (void)performResetConfigPostCleanupSteps:(unint64_t)a3 dueToReason:(unint64_t)a4
{
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1D17BA0A0](a1, a2);
  v8 = a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 != 1 && a4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMDResetConfigPostCleanupStepsToString(a3);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (a4 - 1 > 8)
        v14 = CFSTR("Unknown");
      else
        v14 = off_1E89A26A8[a4 - 1];
      v28 = 138543874;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to perform reset config post cleanup steps: %@ due to reason: %@", (uint8_t *)&v28, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    determineHomeKitDaemonRootStorePath();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 128)
    {
      v23 = (void *)MEMORY[0x1E0C99E60];
      HMDHomeKitDaemonDemoModePersistencePath();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setWithObject:", v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:", v18, 0, 0);
      HMHomeKitCacheDirectory();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:", v26, 0, 1);

      HMCacheSubdirectoryWithRelativePath();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:", v27, v22, 1);

    }
    else
    {
      if (a3 != -1)
      {
        objc_msgSend(v8, "performIndividualCleanupTasks:onRootDirectory:", a3, v18);
        goto LABEL_20;
      }
      objc_msgSend(v8, "filesToExcludeFromHomedDirectory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:", v18, v19, 1);

      HMHomeKitCacheDirectory();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filesToExcludeFromCacheDirectory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:", v20, v21, 1);

      HMCacheSubdirectoryWithRelativePath();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:", v22, 0, 0);
    }

LABEL_20:
    return;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 - 1 > 8)
      v16 = CFSTR("Unknown");
    else
      v16 = off_1E89A26A8[a4 - 1];
    HMDResetConfigPostCleanupStepsToString(a3);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = v15;
    v30 = 2112;
    v31 = (uint64_t)v16;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Clean up reason or steps are not known. [reason: %@] [steps: %@]", (uint8_t *)&v28, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
}

+ (void)performIndividualCleanupTasks:(unint64_t)a3 onRootDirectory:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 0x20) != 0)
  {
    objc_msgSend(a1, "sqlFileListToRemove:fromRootDirectory:", CFSTR("datastore.sqlite"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  if ((v4 & 0x40) != 0)
  {
    objc_msgSend(a1, "sqlFileListToRemove:fromRootDirectory:", CFSTR("datastore.sqlite"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

    objc_msgSend(a1, "sqlFileListToRemove:fromRootDirectory:", CFSTR("datastore3.sqlite"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v10);

  }
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to remove following files : %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v12, "removeFilesAtLocation:", v15);

}

+ (id)filesToExcludeFromCacheDirectory
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8B31BD8);
}

+ (id)filesToExcludeFromHomedDirectory
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8B31BF0);
}

+ (id)sqlFileListToRemove:(id)a3 fromRootDirectory:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a3;
  objc_msgSend(v5, "fileURLWithPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-wal"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v14);

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

+ (void)cleanupInvalidUserDefaults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HMDResetConfigPostCleanup_cleanupInvalidUserDefaults___block_invoke;
  v7[3] = &unk_1E89BFE20;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "na_each:", v7);

}

+ (void)removeFilesAtLocation:(id)a3
{
  id v4;
  HMDFileManager *v5;

  v4 = a3;
  v5 = objc_alloc_init(HMDFileManager);
  objc_msgSend(a1, "removeFilesAtLocation:usingFileManager:", v4, v5);

}

+ (void)removeFilesAtLocation:(id)a3 usingFileManager:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HMDResetConfigPostCleanup_removeFilesAtLocation_usingFileManager___block_invoke;
  v8[3] = &unk_1E89A2640;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v8);

}

+ (void)deleteFilesInsideDirectory:(id)a3 excludingFiles:(id)a4 shouldSkipDirectories:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  HMDFileManager *v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(HMDFileManager);
  objc_msgSend(a1, "deleteFilesInsideDirectory:excludingFiles:shouldSkipDirectories:usingFileManager:", v9, v8, v5, v10);

}

+ (void)deleteFilesInsideDirectory:(id)a3 excludingFiles:(id)a4 shouldSkipDirectories:(BOOL)a5 usingFileManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = a1;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v16;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Going to delete all the files inside directory: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C999D0];
  v27[0] = *MEMORY[0x1E0C99A90];
  v27[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __110__HMDResetConfigPostCleanup_deleteFilesInsideDirectory_excludingFiles_shouldSkipDirectories_usingFileManager___block_invoke;
  v22[3] = &unk_1E89A2668;
  v24 = v12;
  v25 = v14;
  v26 = a5;
  v23 = v11;
  v20 = v12;
  v21 = v11;
  objc_msgSend(v20, "enumerateItemsAtURL:includingPropertiesForKeys:usingBlock:", v17, v19, v22);

}

+ (void)writePostCleanupRecordToRemoveAllCoreDataFilesWithReason:(unint64_t)a3
{
  +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:steps:](HMDResetConfigPostCleanup, "writePostCleanupRecordWithReason:steps:", a3, 286);
}

+ (id)resetConfigPostCleanupFileLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HMDCreateHomeKitDaemonCacheDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("resetConfigPostCleanup.plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to create homekit daemon cache directory", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25 != -1)
    dispatch_once(&logCategory__hmf_once_t25, &__block_literal_global_2667);
  return (id)logCategory__hmf_once_v26;
}

void __40__HMDResetConfigPostCleanup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26;
  logCategory__hmf_once_v26 = v0;

}

void __110__HMDResetConfigPostCleanup_deleteFilesInsideDirectory_excludingFiles_shouldSkipDirectories_usingFileManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5
    && (objc_msgSend(v3, "lastPathComponent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "containsObject:", v6),
        v6,
        v7))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v11;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Not deleting excluded file: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v18 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v18, *MEMORY[0x1E0C999D0], 0);
    v12 = v18;
    if (objc_msgSend(v12, "BOOLValue") && *(_BYTE *)(a1 + 56))
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v16;
        v22 = 2112;
        v23 = v4;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping the directory : %@", buf, 0x16u);

      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = *(void **)(a1 + 48);
      v19 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFilesAtLocation:usingFileManager:", v14, *(_QWORD *)(a1 + 40));
    }

    objc_autoreleasePoolPop(v13);
  }

}

void __68__HMDResetConfigPostCleanup_removeFilesAtLocation_usingFileManager___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  -[__CFString path](v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isDeletableFileAtPath:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v18 = 0;
    v7 = objc_msgSend(v6, "removeItemAtURL:error:", v3, &v18);
    v8 = v18;
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("Unsuccessfully");
      *(_DWORD *)buf = 138544130;
      v20 = v12;
      v21 = 2112;
      if (v7)
        v13 = CFSTR("Successfully");
      v22 = v13;
      v23 = 2112;
      v24 = v3;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@%@ removed file [%@] with error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v3;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@File is not deletable by homed: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

void __56__HMDResetConfigPostCleanup_cleanupInvalidUserDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("HMDHomeWalletKeyManagerHomeNeedsWalletKeyRoll_")))
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v3);

}

@end
