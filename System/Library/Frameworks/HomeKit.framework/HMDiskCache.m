@implementation HMDiskCache

- (id)loadCachedObjectsForCacheWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  HMDiskCache *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  HMDiskCache *v33;
  NSObject *v34;
  void *v35;
  id v36;
  unsigned __int8 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[4];

  v44[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDiskCache _cachePathForCacheName:](self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v5, &v37);

  if (!v7)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v13;
      v40 = 2112;
      v41 = v5;
      v14 = "%{public}@The disk cache location being loaded (%@) does not exist yet";
      v15 = v12;
      v16 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v9);
    v17 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_9;
  }
  v8 = v37;
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v13;
      v40 = 2112;
      v41 = v5;
      v14 = "%{public}@The disk cache location being loaded (%@) is not a file";
      v15 = v12;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v19;
    v40 = 2112;
    v41 = v5;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@The disk cache location exists at %@, loading from disk", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0C99E60];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v44[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v23, v20, &v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v36;
  v26 = v25;
  if (!v24 || v25)
  {
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = v10;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v35;
      v40 = 2112;
      v41 = v5;
      v42 = 2112;
      v43 = v26;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@The disk cache location being loaded (%@) could not be unarchived: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v32);
    v17 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v27 = v24;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v29 = v27;
    else
      v29 = 0;
    if ((isKindOfClass & 1) != 0)
      v30 = v27;
    else
      v30 = (void *)MEMORY[0x1E0C9AA70];
    v31 = v29;

    v17 = v30;
  }

LABEL_9:
  return v17;
}

- (id)_cachePathForCacheName:(id)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a2;
    objc_msgSend(v2, "cachePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/_HMDiskCache_%@"), v5, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (NSString)cachePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDiskCache)initWithCachePath:(id)a3
{
  id v4;
  HMDiskCache *v5;
  uint64_t v6;
  NSString *cachePath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDiskCache;
  v5 = -[HMDiskCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cachePath = v5->_cachePath;
    v5->_cachePath = (NSString *)v6;

  }
  return v5;
}

- (BOOL)storeCachedObjects:(id)a3 forCacheName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDiskCache *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  HMDiskCache *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  HMDiskCache *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint32_t v41;
  HMDiskCache *v42;
  NSObject *v43;
  void *v44;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDiskCache _cachePathForCacheName:](self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDiskCache cachePath](self, "cachePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v50);

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDiskCache cachePath](self, "cachePath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v20 = objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v49);
    v21 = v49;

    if ((v20 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDiskCache cachePath](v23, "cachePath");
        v26 = v7;
        v27 = v8;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v25;
        v53 = 2112;
        v54 = v28;
        v55 = 2112;
        v56 = v21;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to make disk cache directory %@ (%@).", buf, 0x20u);

        v8 = v27;
        v7 = v26;

      }
      objc_autoreleasePoolPop(v22);
    }

LABEL_11:
    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v48;
    if (v30 || !v29)
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v52 = v44;
        v53 = 2112;
        v54 = v6;
        v55 = 2112;
        v56 = v8;
        v57 = 2112;
        v58 = v30;
        _os_log_impl(&dword_19B1B0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode cache object (%@) for disk cache path: %@, error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v17);
      LOBYTE(v17) = 0;
      goto LABEL_23;
    }
    v46 = v7;
    v47 = 0;
    v31 = v8;
    LODWORD(v17) = objc_msgSend(v29, "writeToFile:options:error:", v8, 1, &v47);
    v32 = v47;
    v33 = (void *)MEMORY[0x1A1AC1AAC]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((_DWORD)v17)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v37;
        v53 = 2112;
        v54 = v6;
        v55 = 2112;
        v56 = v31;
        v38 = "%{public}@Wrote cache object (%@) to disk cache at path: %@";
        v39 = v36;
        v40 = OS_LOG_TYPE_INFO;
        v41 = 32;
LABEL_21:
        _os_log_impl(&dword_19B1B0000, v39, v40, v38, buf, v41);

      }
    }
    else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v52 = v37;
      v53 = 2112;
      v54 = v6;
      v55 = 2112;
      v56 = v31;
      v57 = 2112;
      v58 = v32;
      v38 = "%{public}@Failed to cache object (%@) for disk cache path: %@ with error %@";
      v39 = v36;
      v40 = OS_LOG_TYPE_ERROR;
      v41 = 42;
      goto LABEL_21;
    }

    objc_autoreleasePoolPop(v33);
    v8 = v31;
    v7 = v46;
LABEL_23:

    goto LABEL_24;
  }
  if (v50)
    goto LABEL_11;
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDiskCache cachePath](v13, "cachePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v15;
    v53 = 2112;
    v54 = v16;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@The disk cache location %@ is not a directory", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  LOBYTE(v17) = 0;
LABEL_24:

  return (char)v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachePath, 0);
}

@end
