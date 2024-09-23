@implementation HFDiskCache

- (HFDiskCache)initWithCacheDirectoryURL:(id)a3 diskCacheDelegate:(id)a4
{
  id v7;
  id v8;
  HFDiskCache *v9;
  HFDiskCache *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *, void *, uint64_t, void *, void *, uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFDiskCache;
  v9 = -[HFCache initWithDelegate:](&v18, sel_initWithDelegate_, self);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_directoryURL, a3);
    objc_storeWeak((id *)&v10->_diskCacheDelegate, v8);
    objc_initWeak(&location, v10);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __59__HFDiskCache_initWithCacheDirectoryURL_diskCacheDelegate___block_invoke;
    v15 = &unk_1EA72A6D8;
    objc_copyWeak(&v16, &location);
    -[HFCache setOverrideObjectEvictionComparator:](v10, "setOverrideObjectEvictionComparator:", &v12);
    -[HFDiskCache createCacheEntriesFromFilesOnDisk](v10, "createCacheEntriesFromFilesOnDisk", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __59__HFDiskCache_initWithCacheDirectoryURL_diskCacheDelegate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, uint64_t a7)
{
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  id v29;
  id v30;
  char v31;
  uint64_t (**v32)(id, id, id, uint64_t, id, id, uint64_t);
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t (**v38)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v39;
  id v40;
  id v42;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v45 = a2;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  v15 = objc_opt_class();
  v16 = v11;
  if (!v16)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v16;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class());

LABEL_7:
    v18 = 0;
  }

  v21 = objc_opt_class();
  v22 = v13;
  if (!v22)
  {
LABEL_14:
    v24 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v22;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v21, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  v50 = 0;
  v27 = *MEMORY[0x1E0C998D0];
  v49 = 0;
  v46 = v18;
  v28 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v50, v27, &v49);
  v29 = v50;
  v30 = v49;
  if ((v28 & 1) != 0)
  {
    v47 = 0;
    v48 = 0;
    v31 = objc_msgSend(v24, "getResourceValue:forKey:error:", &v48, v27, &v47);
    v32 = (uint64_t (**)(id, id, id, uint64_t, id, id, uint64_t))v48;
    v33 = v47;

    if ((v31 & 1) != 0)
    {
      v34 = objc_msgSend(v29, "compare:", v32);
      v30 = v33;
      v35 = v45;
    }
    else
    {
      v42 = v29;
      HFLogForCategory(0xDuLL);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v52 = "-[HFDiskCache initWithCacheDirectoryURL:diskCacheDelegate:]_block_invoke";
        v53 = 2112;
        v54 = v33;
        v55 = 2112;
        v56 = v24;
        _os_log_error_impl(&dword_1DD34E000, v37, OS_LOG_TYPE_ERROR, "%s error: %@; %@", buf, 0x20u);
      }

      objc_msgSend(WeakRetained, "defaultObjectEvictionComparator");
      v38 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v39 = v24;
      v40 = v33;
      v35 = v45;
      v34 = ((uint64_t (**)(_QWORD, id, id, uint64_t, id, id, uint64_t))v38)[2](v38, v45, v16, a4, v12, v22, a7);

      v30 = v40;
      v24 = v39;
      v29 = v42;
    }
  }
  else
  {
    HFLogForCategory(0xDuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v52 = "-[HFDiskCache initWithCacheDirectoryURL:diskCacheDelegate:]_block_invoke";
      v53 = 2112;
      v54 = v30;
      v55 = 2112;
      v56 = v46;
      _os_log_error_impl(&dword_1DD34E000, v36, OS_LOG_TYPE_ERROR, "%s error: %@; %@", buf, 0x20u);
    }

    objc_msgSend(WeakRetained, "defaultObjectEvictionComparator");
    v32 = (uint64_t (**)(id, id, id, uint64_t, id, id, uint64_t))objc_claimAutoreleasedReturnValue();
    v35 = v45;
    v34 = v32[2](v32, v45, v16, a4, v12, v22, a7);
  }

  return v34;
}

- (void)createCacheEntriesFromFilesOnDisk
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[HFCache accessQueue](self, "accessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HFDiskCache_createCacheEntriesFromFilesOnDisk__block_invoke;
  block[3] = &unk_1EA727DD8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __48__HFDiskCache_createCacheEntriesFromFilesOnDisk__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createCacheEntriesFromFilesOnDisk");
}

- (void)_createCacheEntriesFromFilesOnDisk
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[HFCache accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDiskCache directoryURL](self, "directoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDiskCache directoryURL](self, "directoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x1E0C99998];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 20, &__block_literal_global_32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HFDiskCache__createCacheEntriesFromFilesOnDisk__block_invoke_5;
  v10[3] = &unk_1EA72A720;
  v10[4] = self;
  objc_msgSend(v9, "na_each:", v10);

}

uint64_t __49__HFDiskCache__createCacheEntriesFromFilesOnDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  HFLogForCategory(0xDuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = "-[HFDiskCache _createCacheEntriesFromFilesOnDisk]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%s error: %@; %@", (uint8_t *)&v9, 0x20u);

  }
  return 1;
}

void __49__HFDiskCache__createCacheEntriesFromFilesOnDisk__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "diskCacheDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "diskCacheDelegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "diskCache:shouldAddExistingFileToCache:", *(_QWORD *)(a1 + 32), v3),
        v6,
        (v7 & 1) == 0))
  {
    HFLogForCategory(0xDuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[HFDiskCache _createCacheEntriesFromFilesOnDisk]_block_invoke";
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "%s delegate declined to add existing file to cache: %@", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "diskCacheDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "diskCacheDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "diskCache:uniqueIdentifierForExistingFile:", *(_QWORD *)(a1 + 32), v3);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
    }
    v13 = v11;

    if (v13)
    {
      v21 = 0;
      v14 = (void *)*MEMORY[0x1E0C99998];
      v20 = 0;
      v15 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v21, v14, &v20);
      v16 = v21;
      v17 = v20;
      if ((v15 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_setObject:forKey:cost:removeObjectsToAccommodateCost:", v3, v13, objc_msgSend(v16, "unsignedIntegerValue"), 0);
      }
      else
      {
        HFLogForCategory(0xDuLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v23 = "-[HFDiskCache _createCacheEntriesFromFilesOnDisk]_block_invoke";
          v24 = 2112;
          v25 = v14;
          v26 = 2112;
          v27 = v17;
          _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "%s %@ error: %@", buf, 0x20u);
        }

      }
    }
  }

}

- (void)cache:(id)a3 didEvictObject:(id)a4 forKey:(id)a5 cost:(unint64_t)a6
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  -[HFCache accessQueue](self, "accessQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = objc_opt_class();
  v13 = v9;
  if (!v13)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v13;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

LABEL_7:
    v15 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v19 = objc_msgSend(v18, "removeItemAtURL:error:", v15, &v34);
  v20 = v34;

  HFLogForCategory(0xDuLL);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v19)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "relativePath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v36 = "-[HFDiskCache cache:didEvictObject:forKey:cost:]";
      v37 = 2112;
      v38 = v20;
      v39 = 2112;
      v40 = v33;
      _os_log_error_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_ERROR, "%s could not remove file at %@: %@", buf, 0x20u);

    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "relativePath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v36 = "-[HFDiskCache cache:didEvictObject:forKey:cost:]";
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    _os_log_impl(&dword_1DD34E000, v22, OS_LOG_TYPE_DEFAULT, "%s removed file at %@; size: %@", buf, 0x20u);

  }
  -[HFDiskCache diskCacheDelegate](self, "diskCacheDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    v27 = objc_opt_class();
    v28 = v10;
    if (v28)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v22 = v28;
      if (v29)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v27, objc_opt_class());

    }
    v22 = 0;
LABEL_19:

    -[HFDiskCache diskCacheDelegate](self, "diskCacheDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "diskCache:didEvictFileFromDisk:forUniqueIdentifier:", self, v15, v22);

LABEL_22:
  }

}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (HFDiskCacheDelegate)diskCacheDelegate
{
  return (HFDiskCacheDelegate *)objc_loadWeakRetained((id *)&self->_diskCacheDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_diskCacheDelegate);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
