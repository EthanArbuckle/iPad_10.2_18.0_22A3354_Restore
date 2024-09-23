@implementation MFAttachmentSecurityScope

+ (id)securityScopedURL:(id)a3
{
  id v3;
  MFAttachmentSecurityScope *v4;

  v3 = a3;
  v4 = -[MFAttachmentSecurityScope initWithSecurityScopedURL:withToken:]([MFAttachmentSecurityScope alloc], "initWithSecurityScopedURL:withToken:", v3, 0);

  return v4;
}

+ (id)securityScopedURL:(id)a3 withToken:(id)a4
{
  id v5;
  id v6;
  MFAttachmentSecurityScope *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[MFAttachmentSecurityScope initWithSecurityScopedURL:withToken:]([MFAttachmentSecurityScope alloc], "initWithSecurityScopedURL:withToken:", v5, v6);

  return v7;
}

- (MFAttachmentSecurityScope)initWithSecurityScopedURL:(id)a3 withToken:(id)a4
{
  id v7;
  id v8;
  MFAttachmentSecurityScope *v9;
  NSFileCoordinator *v10;
  NSFileCoordinator *fileCoordinator;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFAttachmentSecurityScope;
  v9 = -[MFAttachmentSecurityScope init](&v13, sel_init);
  if (v9)
  {
    v10 = (NSFileCoordinator *)objc_alloc_init(MEMORY[0x1E0CB3600]);
    fileCoordinator = v9->_fileCoordinator;
    v9->_fileCoordinator = v10;

    objc_storeStrong((id *)&v9->_securityScopedURL, a3);
    objc_storeStrong((id *)&v9->_securityScopeToken, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MFAttachmentSecurityScope stopAccess](self, "stopAccess");
  v3.receiver = self;
  v3.super_class = (Class)MFAttachmentSecurityScope;
  -[MFAttachmentSecurityScope dealloc](&v3, sel_dealloc);
}

- (id)startWriteAccess
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSURL **p_securityScopedURL;
  _BOOL4 v12;
  NSFileCoordinator *fileCoordinator;
  NSURL *securityScopedURL;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSURL *v22;
  NSObject *p_super;
  uint64_t v25;
  _QWORD v26[5];
  id v27[5];

  v27[4] = *(id *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[MFAttachmentSecurityScope startWriteAccess].cold.3(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  if (!self->_secureWriteURL)
  {
    -[MFAttachmentSecurityScope _attachSecurityScope](self, "_attachSecurityScope");
    if (self->_securedWrite
      || (p_securityScopedURL = &self->_securityScopedURL,
          v12 = -[NSURL startAccessingSecurityScopedResource](self->_securityScopedURL, "startAccessingSecurityScopedResource"), self->_securedWrite = v12, v12))
    {
      fileCoordinator = self->_fileCoordinator;
      securityScopedURL = self->_securityScopedURL;
      v26[4] = self;
      v27[0] = 0;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke;
      v26[3] = &unk_1E4E8BCA0;
      -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](fileCoordinator, "coordinateWritingItemAtURL:options:error:byAccessor:", securityScopedURL, 8, v27, v26);
      v15 = v27[0];
      if (!self->_secureWriteURL)
      {
        MFLogGeneral();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v15, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[MFAttachmentSecurityScope startWriteAccess].cold.1();
        }

        -[MFAttachmentSecurityScope stopAccess](self, "stopAccess");
      }
      goto LABEL_17;
    }
    -[NSURL path](*p_securityScopedURL, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByDeletingLastPathComponent");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](*p_securityScopedURL, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isWritableFileAtPath:", v19))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isWritableFileAtPath:", v15);

      if (!v21)
      {
        MFLogGeneral();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[MFAttachmentSecurityScope startWriteAccess].cold.2((uint64_t *)&self->_securityScopedURL, p_super, v25);
        goto LABEL_16;
      }
    }
    v22 = self->_securityScopedURL;
    p_super = &self->_secureWriteURL->super;
    self->_secureWriteURL = v22;
LABEL_16:

LABEL_17:
  }
  return self->_secureWriteURL;
}

void __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a2);
}

- (id)startReadAccess
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  NSURL *securityScopedURL;
  _BOOL4 v13;
  NSFileCoordinator *fileCoordinator;
  NSURL *v15;
  id *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  int v21;
  NSFileCoordinator *v22;
  NSURL *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[6];
  id v27;
  _QWORD v28[6];
  id v29;
  id obj;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36[5];

  v36[4] = *(id *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[MFAttachmentSecurityScope startWriteAccess].cold.3(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  if (!self->_secureReadURL)
  {
    -[MFAttachmentSecurityScope _attachSecurityScope](self, "_attachSecurityScope");
    if (self->_securedRead
      || (v11 = -[NSURL startAccessingSecurityScopedResource](self->_securityScopedURL, "startAccessingSecurityScopedResource"), self->_securedRead = v11, v11))
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__9;
      v35 = __Block_byref_object_dispose__9;
      v36[0] = 0;
      securityScopedURL = self->_securityScopedURL;
      obj = 0;
      v13 = -[NSURL checkPromisedItemIsReachableAndReturnError:](securityScopedURL, "checkPromisedItemIsReachableAndReturnError:", &obj);
      objc_storeStrong(v36, obj);
      if (v13)
      {
        fileCoordinator = self->_fileCoordinator;
        v15 = self->_securityScopedURL;
        v16 = (id *)(v32 + 5);
        v29 = (id)v32[5];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke;
        v28[3] = &unk_1E4E8BCC8;
        v28[4] = self;
        v28[5] = &v31;
        -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](fileCoordinator, "coordinateReadingItemAtURL:options:error:byAccessor:", v15, 8, &v29, v28);
        objc_storeStrong(v16, v29);
      }
      if (!self->_secureReadURL)
      {
        MFLogGeneral();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)v32[5], "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[MFAttachmentSecurityScope startReadAccess].cold.1();
        }

        -[MFAttachmentSecurityScope stopAccess](self, "stopAccess");
      }
      _Block_object_dispose(&v31, 8);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](self->_securityScopedURL, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isReadableFileAtPath:", v20);

      if (v21)
      {
        v31 = 0;
        v32 = &v31;
        v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__9;
        v35 = __Block_byref_object_dispose__9;
        v36[0] = 0;
        v22 = self->_fileCoordinator;
        v23 = self->_securityScopedURL;
        v27 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_110;
        v26[3] = &unk_1E4E8BCC8;
        v26[4] = self;
        v26[5] = &v31;
        -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](v22, "coordinateReadingItemAtURL:options:error:byAccessor:", v23, 8, &v27, v26);
        objc_storeStrong(v36, v27);
        _Block_object_dispose(&v31, 8);

      }
      else
      {
        MFLogGeneral();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[MFAttachmentSecurityScope startReadAccess].cold.2((uint64_t *)&self->_securityScopedURL, v24, v25);

      }
    }
  }
  return self->_secureReadURL;
}

void __44__MFAttachmentSecurityScope_startReadAccess__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "_temporaryReadURL:error:", v3, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

}

void __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_110(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "_temporaryReadURL:error:", v3, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;

}

- (id)_temporaryReadURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  __CFString *v19;
  int v20;
  void *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);

  if (!(_DWORD)v8)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MFAttachmentSecurityScope _temporaryReadURL:error:].cold.1();
    goto LABEL_7;
  }
  objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v12, 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "linkItemAtURL:toURL:error:", v5, v13, a4);

  if ((v15 & 1) == 0)
  {
    MFLogGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (a4)
      {
        objc_msgSend(*a4, "ef_publicDescription");
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = CFSTR("unknown");
      }
      v20 = 138412546;
      v21 = v13;
      v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_ERROR, "#Attachments Failed to create temporary read URL [%@] error [%{public}@]", (uint8_t *)&v20, 0x16u);
      if (a4)

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeItemAtPath:error:", v9, 0);

LABEL_7:
    v13 = 0;
  }

  return v13;
}

- (void)_removeTemporaryReadURL
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_7_1(&dword_1A4F90000, a2, a3, "Failed to remove temporary read URL [%@] error [%@]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_5();
}

- (void)stopAccess
{
  NSURL *secureReadURL;
  NSURL *secureWriteURL;

  if (self->_securedRead)
    -[NSURL stopAccessingSecurityScopedResource](self->_securityScopedURL, "stopAccessingSecurityScopedResource");
  if (self->_secureReadURL)
  {
    -[MFAttachmentSecurityScope _removeTemporaryReadURL](self, "_removeTemporaryReadURL");
    secureReadURL = self->_secureReadURL;
    self->_secureReadURL = 0;

    self->_securedRead = 0;
  }
  if (self->_securedWrite)
    -[NSURL stopAccessingSecurityScopedResource](self->_securityScopedURL, "stopAccessingSecurityScopedResource");
  secureWriteURL = self->_secureWriteURL;
  if (secureWriteURL)
  {
    self->_secureWriteURL = 0;

    self->_securedWrite = 0;
  }
}

- (id)securityScopeToken
{
  id v3;
  const char *v4;
  NSData *v5;
  NSData *securityScopeToken;

  if (!self->_securityScopeToken)
  {
    -[NSURL path](self->_securityScopedURL, "path");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "fileSystemRepresentation");
    v4 = (const char *)sandbox_extension_issue_file();

    if (v4)
    {
      v5 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v4, strlen(v4) + 1);
      securityScopeToken = self->_securityScopeToken;
      self->_securityScopeToken = v5;

    }
  }
  return self->_securityScopeToken;
}

- (void)_attachSecurityScope
{
  void *v3;
  NSURL *securityScopedURL;
  id v5;

  -[MFAttachmentSecurityScope securityScopeToken](self, "securityScopeToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    securityScopedURL = self->_securityScopedURL;
    -[MFAttachmentSecurityScope securityScopeToken](self, "securityScopeToken");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A85B0410](securityScopedURL);

  }
}

- (id)data
{
  NSURL *secureReadURL;
  id v4;
  uint64_t v6;

  secureReadURL = self->_secureReadURL;
  if (!secureReadURL)
  {
    v4 = -[MFAttachmentSecurityScope startReadAccess](self, "startReadAccess");
    secureReadURL = self->_secureReadURL;
  }
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", secureReadURL, 3, &v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isReadable
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  NSURL *securityScopedURL;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_securityScopedURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isReadableFileAtPath:", v4);

  if ((v5 & 1) != 0)
    return 1;
  securityScopedURL = self->_securityScopedURL;
  v9 = 0;
  v6 = -[NSURL checkPromisedItemIsReachableAndReturnError:](securityScopedURL, "checkPromisedItemIsReachableAndReturnError:", &v9);

  return v6;
}

- (BOOL)isBundle
{
  _BOOL4 v3;
  BOOL result;
  void *v5;
  void *v6;
  char v7;

  v7 = 0;
  v3 = -[MFAttachmentSecurityScope isReadable](self, "isReadable");
  result = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_secureReadURL, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v7);

    return v7 != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureWriteURL, 0);
  objc_storeStrong((id *)&self->_secureReadURL, 0);
  objc_storeStrong((id *)&self->_securityScopeToken, 0);
  objc_storeStrong((id *)&self->_securityScopedURL, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
}

- (void)startWriteAccess
{
  OUTLINED_FUNCTION_7(&dword_1A4F90000, a1, a3, "NSFileCoordinator ops can block, the caller should move to a background thread", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)startReadAccess
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, a2, a3, "#Attachments Error confirming URL is readable [%@]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)_temporaryReadURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#Attachments Failed to create temporary read directory [%@]", v2);
  OUTLINED_FUNCTION_5();
}

@end
