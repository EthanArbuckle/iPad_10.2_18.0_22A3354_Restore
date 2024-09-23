@implementation HMBSQLFile

+ (NSHashTable)contexts
{
  if (contexts_dispatchOnce != -1)
    dispatch_once(&contexts_dispatchOnce, &__block_literal_global_150);
  return (NSHashTable *)(id)contexts_result;
}

+ (void)removeDatastoreAtURL:(id)a3
{
  __clean(a3);
}

+ (id)openContextWithURL:(id)a3 usingSubclass:(Class)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(a1, "_openContextWithURL:usingSubclass:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);

  return v9;
}

+ (id)_openContextWithURL:(id)a3 usingSubclass:(Class)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  char v34;
  id v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v51;
  id *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&contextLock);
  v9 = [a4 alloc];
  objc_msgSend(v8, "absoluteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);

  v12 = (void *)MEMORY[0x1D17B6230]();
  v13 = v11;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v15;
    _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Opening SQL context", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  if (_openContextWithURL_usingSubclass_error__dispatchOnce != -1)
    dispatch_once(&_openContextWithURL_usingSubclass_error__dispatchOnce, &__block_literal_global_152);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(a1, "contexts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  v52 = a5;
  if (v17)
  {
    v18 = v17;
    v51 = a1;
    v19 = v8;
    v20 = 0;
    v21 = *(_QWORD *)v56;
LABEL_7:
    v22 = 0;
    v23 = v20;
    while (1)
    {
      if (*(_QWORD *)v56 != v21)
        objc_enumerationMutation(v16);
      v20 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * v22);

      objc_msgSend(v20, "url");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "url");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (v26)
        break;
      ++v22;
      v23 = v20;
      if (v18 == v22)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        if (v18)
          goto LABEL_7;

        v8 = v19;
        a1 = v51;
        goto LABEL_14;
      }
    }
    v27 = objc_opt_class();
    v8 = v19;
    if (v27 != objc_opt_class())
    {
      objc_opt_class();
      _HMFPreconditionFailureWithFormat();
    }

    a1 = v51;
    if (!v20)
      goto LABEL_21;
    objc_msgSend(v13, "setContext:", objc_msgSend(v20, "context"));
    objc_msgSend(v20, "lock");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLock:", v28);

    objc_msgSend(v13, "lock");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lock");

    v30 = (void *)MEMORY[0x1D17B6230]();
    v31 = v13;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v33;
      v61 = 2112;
      v62 = v31;
      _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Opened SQL context with existing database: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v53 = 0;
    v34 = objc_msgSend(v31, "prepareWithError:", &v53);
    v35 = v53;
    if ((v34 & 1) != 0)
    {
      v36 = 1;
      goto LABEL_32;
    }
    v39 = (void *)MEMORY[0x1D17B6230]();
    v45 = v31;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v46;
      v61 = 2112;
      v62 = v45;
      v63 = 2114;
      v64 = v35;
      _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare context %@: %{public}@", buf, 0x20u);

    }
  }
  else
  {
LABEL_14:

LABEL_21:
    v37 = objc_alloc_init(MEMORY[0x1E0D286D8]);
    objc_msgSend(v13, "setLock:", v37);

    objc_msgSend(v13, "lock");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lock");

    v54 = 0;
    LODWORD(v38) = __open(v13, &v54);
    v35 = v54;
    v39 = (void *)MEMORY[0x1D17B6230]();
    v40 = v13;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if ((_DWORD)v38)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        v61 = 2112;
        v62 = v40;
        _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Opened SQL context with new database: %@", buf, 0x16u);

      }
      v20 = 0;
      v36 = 1;
      goto LABEL_31;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v44;
      v61 = 2112;
      v62 = v40;
      v63 = 2112;
      v64 = v35;
      _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to open context %@: %@", buf, 0x20u);

    }
    v20 = 0;
  }
  v36 = 0;
LABEL_31:

  objc_autoreleasePoolPop(v39);
LABEL_32:
  objc_msgSend(v13, "lock");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "unlock");

  if ((v36 & 1) != 0)
  {
    objc_msgSend(a1, "contexts");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v13);

    v49 = v13;
  }
  else
  {
    objc_msgSend(a1, "_close:", v13);
    v49 = 0;
    if (v52)
      *v52 = objc_retainAutorelease(v35);
  }

  return v49;
}

+ (void)close:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(a1, "_close:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&contextLock);

}

+ (void)_close:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  char *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  void *v29;
  char *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&contextLock);
  if (objc_msgSend(v4, "context"))
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    v6 = (char *)v4;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v8;
      v40 = 2112;
      v41 = v6;
      _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Closing SQL context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(a1, "contexts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v6);

    objc_msgSend(v6, "lock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lock");

    objc_msgSend(v6, "finalize");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(a1, "contexts", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "context");
          if (v17 == objc_msgSend(v6, "context"))
          {
            v29 = (void *)MEMORY[0x1D17B6230]();
            v30 = v6;
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v32;
              v40 = 2112;
              v41 = (const char *)v16;
              _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Found other context still using database: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v29);

            goto LABEL_21;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        if (v13)
          continue;
        break;
      }
    }

    v18 = (void *)MEMORY[0x1D17B6230]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v21;
      _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Closing database for SQL context", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = sqlite3_close((sqlite3 *)objc_msgSend(v19, "context"));
    if (v22)
    {
      v23 = v22;
      v24 = (void *)MEMORY[0x1D17B6230]();
      v25 = v19;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = sqlite3_errstr(v23);
        *(_DWORD *)buf = 138543874;
        v39 = v27;
        v40 = 2080;
        v41 = v28;
        v42 = 1024;
        v43 = v23;
        _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to close database: %s (%d)", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v24);
    }
LABEL_21:
    objc_msgSend(v6, "setContext:", 0);
    objc_msgSend(v6, "lock");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "unlock");

  }
  else
  {
    objc_msgSend(v4, "setFinalized:", 1);
  }

}

void __22__HMBSQLFile_contexts__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 2);
  v1 = (void *)contexts_result;
  contexts_result = v0;

}

@end
