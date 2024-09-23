@implementation BSUIMappedImageCacheRegistry

- (id)_initWithCachesPath:(id)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BSUIMappedImageCacheRegistry;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v4;

      v6 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = 0;

      *((_DWORD *)a1 + 8) = 0;
      v7 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = 0;

    }
  }

  return a1;
}

- (id)tmpPath
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  uint8_t v32[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v3 = *(void **)(a1 + 16);
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1A1AF6228]();
    objc_msgSend(*(id *)(a1 + 8), "URLByAppendingPathComponent:isDirectory:", CFSTR("MappedImageCache"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    v27 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v27);
    v8 = v27;

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't create directory at %@ with error %@"), v5, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_tmpPath);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v32 = 138544642;
        v33 = v23;
        v34 = 2114;
        v35 = v25;
        v36 = 2048;
        v37 = a1;
        v38 = 2114;
        v39 = CFSTR("BSUIMappedImageCache.m");
        v40 = 1024;
        v41 = 95;
        v42 = 2114;
        v43 = v22;
        _os_log_error_impl(&dword_1A0234000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v32, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A023D3B0);
    }
    v9 = objc_retainAutorelease(v5);
    objc_msgSend(v9, "fileSystemRepresentation");
    v10 = _dirhelper_relative();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v10, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      v14 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v13;

      BSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 8);
        *(_DWORD *)buf = 138412546;
        v29 = v9;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_1A0234000, v15, OS_LOG_TYPE_DEFAULT, "BSUIMappedImageCache found relative tmpDir=%@ for %@", buf, 0x16u);
      }
    }
    else
    {
      NSTemporaryDirectory();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      v19 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v18;

      BSLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v26 = *(_QWORD *)(a1 + 16);
        *(_DWORD *)buf = 138412546;
        v29 = v9;
        v30 = 2112;
        v31 = v26;
        _os_log_fault_impl(&dword_1A0234000, v15, OS_LOG_TYPE_FAULT, "BSUIMappedImageCache failed to get relative tmpDir from dirhelper for %@ : falling back to NSTemporaryDirectory=%@", buf, 0x16u);
      }
    }

    objc_autoreleasePoolPop(v4);
    v3 = *(void **)(a1 + 16);
  }
  v20 = v3;
  os_unfair_lock_unlock(v2);
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_tmpPath, 0);
  objc_storeStrong((id *)&self->_cachesPath, 0);
}

@end
