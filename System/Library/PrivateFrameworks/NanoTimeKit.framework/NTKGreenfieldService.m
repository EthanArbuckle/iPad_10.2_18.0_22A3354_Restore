@implementation NTKGreenfieldService

- (void)unzipWatchfaceFromURL:(id)a3 withSandboxExtension:(char *)a4 writeSandboxExtension:(char *)a5 completionBlock:(id)a6
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a6;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "decodeWatchFaceFromUrl XPC service started with url: %@", buf, 0xCu);
  }

  v10 = sandbox_extension_consume();
  v11 = sandbox_extension_consume();
  if (v10 == -1 || v11 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not consume sandboxExtension. Extension is %lld"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_decodeWatchFaceErrorWithCode:message:", 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v13);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend((id)objc_opt_class(), "_unzipWatchfaceFromURL:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "absoluteURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("GreenfieldService failed to extract from url: %@"), v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 4;
    goto LABEL_12;
  }
  if (sandbox_extension_release() == -1 || sandbox_extension_release() == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not release extension Extension is %lld"), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = 3;
LABEL_12:
    objc_msgSend(v14, "greenfield_decodeWatchFaceErrorWithCode:message:", v15, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v18);

    goto LABEL_13;
  }
  ((void (**)(id, void *, void *))v8)[2](v8, v12, 0);
LABEL_14:

}

+ (id)_unzipWatchfaceFromURL:(id)a3
{
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy__33;
  v18[3] = __Block_byref_object_dispose__33;
  v19 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
  v5 = dispatch_semaphore_create(0);
  v16 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke;
  v13[3] = &unk_1E6BD5828;
  v15 = &v17;
  v6 = v5;
  v14 = v6;
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", v3, 1, &v16, v13);
  v7 = v16;
  v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v8);
  if (v7 || (v11 = *(void **)(v18[0] + 40)) == 0)
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[NTKGreenfieldService _unzipWatchfaceFromURL:].cold.1((uint64_t)v7, (uint64_t)v18, v9);

    v10 = 0;
  }
  else
  {
    v10 = v11;
  }

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
  objc_msgSend((id)objc_opt_class(), "unzipWatchFaceFileAtUrl:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if (v4)
LABEL_3:
      objc_msgSend(v3, "stopAccessingSecurityScopedResource");
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke_cold_1((uint64_t)v3, v8);

    if (v4)
      goto LABEL_3;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)removeFileAtPath:(id)a3 withSandboxExtension:(char *)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = sandbox_extension_consume();
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2080;
    v19 = a4;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldService did start to remove files at path:%@  with sandbox extension:%s.", buf, 0x16u);
  }

  if (v9 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NTKGreenfieldService remove files at path failed to consume sandbox extension:%s, handle is:%lld."), a4, -1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_decodeWatchFaceErrorWithCode:message:", 2, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v11, "removeItemAtPath:error:", v7, &v15);
    v12 = v15;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NTKGreenfieldService remove files at path failed to remove item at path:%@."), v7);
    }
    else
    {
      if (sandbox_extension_release() != -1)
      {
        v8[2](v8, 0);
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NTKGreenfieldService remove files at path failed to release extension handle:%lld."), v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "greenfield_decodeWatchFaceErrorWithCode:message:", 2, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v14);

  }
LABEL_9:

}

+ (void)_unzipWatchfaceFromURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Failed to read the file: readingError: %@ unizippedDataPath: %@", (uint8_t *)&v4, 0x16u);
}

void __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Failed to unzip watch face file from url: %@", (uint8_t *)&v2, 0xCu);
}

@end
