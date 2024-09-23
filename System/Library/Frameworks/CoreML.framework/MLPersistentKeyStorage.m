@implementation MLPersistentKeyStorage

+ (id)persistentKeyStorageURL
{
  if (+[MLPersistentKeyStorage persistentKeyStorageURL]::onceTokenForPersistentKeyStorageURL != -1)
    dispatch_once(&+[MLPersistentKeyStorage persistentKeyStorageURL]::onceTokenForPersistentKeyStorageURL, &__block_literal_global_6730);
  return (id)+[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL;
}

+ (id)syncQueue
{
  if (+[MLPersistentKeyStorage syncQueue]::onceTokenForSyncQueue != -1)
    dispatch_once(&+[MLPersistentKeyStorage syncQueue]::onceTokenForSyncQueue, &__block_literal_global_38);
  return (id)+[MLPersistentKeyStorage syncQueue]::_syncQueue;
}

+ (BOOL)storeKeyBlob:(id)a3 forKeyIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint8_t buf[16];
  _QWORD block[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint8_t *v26;
  uint8_t v27[8];
  uint8_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    if (a5)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("keyBlob is nil"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)v27 = 0;
    v19 = "Key blob is nil";
    goto LABEL_18;
  }
  if (!v9)
  {
    if (a5)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", 0, CFSTR("keyIdentifier is nil"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)v27 = 0;
    v19 = "Key Identifier is nil";
LABEL_18:
    _os_log_impl(&dword_19C486000, v18, OS_LOG_TYPE_INFO, v19, v27, 2u);
LABEL_19:

    v16 = 0;
    goto LABEL_20;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  *(_QWORD *)v27 = 0;
  v28 = v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__6712;
  v31 = __Block_byref_object_dispose__6713;
  v32 = 0;
  objc_msgSend(a1, "persistentKeyStorageURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bin"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "syncQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MLPersistentKeyStorage_storeKeyBlob_forKeyIdentifier_error___block_invoke;
  block[3] = &unk_1E3D66978;
  v25 = &v33;
  v23 = v8;
  v15 = v13;
  v24 = v15;
  v26 = v27;
  dispatch_sync(v14, block);

  v16 = *((_BYTE *)v34 + 24) != 0;
  if (!*((_BYTE *)v34 + 24))
  {
    if (a5)
    {
      +[MLModelErrorUtils modelDecryptionErrorWithUnderlyingError:format:](MLModelErrorUtils, "modelDecryptionErrorWithUnderlyingError:format:", *((_QWORD *)v28 + 5), CFSTR("Failed to persist Key Blob"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C486000, v17, OS_LOG_TYPE_INFO, "Failed to persist Key Blob", buf, 2u);
    }

  }
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(&v33, 8);
LABEL_20:

  return v16;
}

+ (id)retrieveKeyBlobForKeyIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  if (v4)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6712;
    v19 = __Block_byref_object_dispose__6713;
    v20 = 0;
    objc_msgSend(a1, "persistentKeyStorageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bin"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "syncQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__MLPersistentKeyStorage_retrieveKeyBlobForKeyIdentifier___block_invoke;
    block[3] = &unk_1E3D66E20;
    v13 = v7;
    v14 = &v15;
    v9 = v7;
    dispatch_sync(v8, block);

    v10 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __58__MLPersistentKeyStorage_retrieveKeyBlobForKeyIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __62__MLPersistentKeyStorage_storeKeyBlob_forKeyIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "writeToURL:options:error:", v3, 1, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v6 = (void *)a1[5];
    v7 = *MEMORY[0x1E0C999D8];
    v8 = *(_QWORD *)(a1[7] + 8);
    v10 = *(id *)(v8 + 40);
    v9 = objc_msgSend(v6, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v7, &v10);
    objc_storeStrong((id *)(v8 + 40), v10);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
  }
}

void __35__MLPersistentKeyStorage_syncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.coreml.PersistentKeyStore", 0);
  v1 = (void *)+[MLPersistentKeyStorage syncQueue]::_syncQueue;
  +[MLPersistentKeyStorage syncQueue]::_syncQueue = (uint64_t)v0;

}

void __49__MLPersistentKeyStorage_persistentKeyStorageURL__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLsForDirectory:inDomains:", 5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.coreml"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("PersistentKeyStorage_v2"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL;
  +[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL = v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", +[MLPersistentKeyStorage persistentKeyStorageURL]::_persistentKeyStorageURL, 1, 0, 0);

}

@end
