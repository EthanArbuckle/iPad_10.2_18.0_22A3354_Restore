@implementation MFAttachmentSecurityScope

+ (id)securityScopedURL:(id)a3
{
  return -[MFAttachmentSecurityScope initWithSecurityScopedURL:withToken:]([MFAttachmentSecurityScope alloc], "initWithSecurityScopedURL:withToken:", a3, 0);
}

+ (id)securityScopedURL:(id)a3 withToken:(id)a4
{
  return -[MFAttachmentSecurityScope initWithSecurityScopedURL:withToken:]([MFAttachmentSecurityScope alloc], "initWithSecurityScopedURL:withToken:", a3, a4);
}

- (MFAttachmentSecurityScope)initWithSecurityScopedURL:(id)a3 withToken:(id)a4
{
  MFAttachmentSecurityScope *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFAttachmentSecurityScope;
  v6 = -[MFAttachmentSecurityScope init](&v8, sel_init);
  if (v6)
  {
    v6->_fileCoordinator = (NSFileCoordinator *)objc_alloc_init(MEMORY[0x1E0CB3600]);
    v6->_securityScopedURL = (NSURL *)a3;
    v6->_securityScopeToken = (NSData *)a4;
  }
  return v6;
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
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[5];
  id v21;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3 = MFLogGeneral();
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
      v21 = 0;
      fileCoordinator = self->_fileCoordinator;
      securityScopedURL = self->_securityScopedURL;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke;
      v20[3] = &unk_1E81CAF18;
      v20[4] = self;
      -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:](fileCoordinator, "coordinateWritingItemAtURL:options:error:byAccessor:", securityScopedURL, 8, &v21, v20);
      if (!self->_secureWriteURL)
      {
        v15 = MFLogGeneral();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[MFAttachmentSecurityScope startWriteAccess].cold.1(&v21, v15);
        -[MFAttachmentSecurityScope stopAccess](self, "stopAccess");
      }
    }
    else
    {
      v16 = -[NSString stringByDeletingLastPathComponent](-[NSURL path](*p_securityScopedURL, "path"), "stringByDeletingLastPathComponent");
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isWritableFileAtPath:", -[NSURL path](*p_securityScopedURL, "path")) & 1) != 0|| objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isWritableFileAtPath:", v16))
      {
        self->_secureWriteURL = self->_securityScopedURL;
      }
      else
      {
        v17 = MFLogGeneral();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[MFAttachmentSecurityScope startWriteAccess].cold.2((uint64_t *)&self->_securityScopedURL, v17, v18);
      }
    }
  }
  return self->_secureWriteURL;
}

id __45__MFAttachmentSecurityScope_startWriteAccess__block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
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
  NSFileCoordinator *fileCoordinator;
  NSURL *securityScopedURL;
  NSObject *v14;
  NSFileCoordinator *v15;
  NSURL *v16;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  _BYTE v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[MFAttachmentSecurityScope startWriteAccess].cold.3(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  if (!self->_secureReadURL)
  {
    -[MFAttachmentSecurityScope _attachSecurityScope](self, "_attachSecurityScope");
    if (self->_securedRead
      || (v11 = -[NSURL startAccessingSecurityScopedResource](self->_securityScopedURL, "startAccessingSecurityScopedResource"), self->_securedRead = v11, v11))
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3052000000;
      v25 = __Block_byref_object_copy__1;
      v26 = __Block_byref_object_dispose__1;
      v27 = 0;
      if (-[NSURL checkPromisedItemIsReachableAndReturnError:](self->_securityScopedURL, "checkPromisedItemIsReachableAndReturnError:", &v27))
      {
        fileCoordinator = self->_fileCoordinator;
        securityScopedURL = self->_securityScopedURL;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke;
        v21[3] = &unk_1E81CAF40;
        v21[4] = self;
        v21[5] = &v22;
        -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](fileCoordinator, "coordinateReadingItemAtURL:options:error:byAccessor:", securityScopedURL, 8, v23 + 5, v21);
      }
      if (!self->_secureReadURL)
      {
        v14 = MFLogGeneral();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MFAttachmentSecurityScope startReadAccess].cold.1(objc_msgSend((id)v23[5], "ef_publicDescription"), (uint64_t)v28, v14);
        -[MFAttachmentSecurityScope stopAccess](self, "stopAccess");
      }
      goto LABEL_15;
    }
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isReadableFileAtPath:", -[NSURL path](self->_securityScopedURL, "path")))
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3052000000;
      v25 = __Block_byref_object_copy__1;
      v26 = __Block_byref_object_dispose__1;
      v27 = 0;
      v15 = self->_fileCoordinator;
      v16 = self->_securityScopedURL;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_55;
      v20[3] = &unk_1E81CAF40;
      v20[4] = self;
      v20[5] = &v22;
      -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:](v15, "coordinateReadingItemAtURL:options:error:byAccessor:", v16, 8, &v27, v20);
LABEL_15:
      _Block_object_dispose(&v22, 8);
      return self->_secureReadURL;
    }
    v18 = MFLogGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MFAttachmentSecurityScope startReadAccess].cold.2((uint64_t *)&self->_securityScopedURL, v18, v19);
  }
  return self->_secureReadURL;
}

id __44__MFAttachmentSecurityScope_startReadAccess__block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_temporaryReadURL:error:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

id __44__MFAttachmentSecurityScope_startReadAccess__block_invoke_55(uint64_t a1, uint64_t a2)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_temporaryReadURL:error:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- (id)_temporaryReadURL:(id)a3 error:(id *)a4
{
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;

  v6 = -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"));
  v7 = objc_msgSend(a3, "lastPathComponent");
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4))
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MFAttachmentSecurityScope _temporaryReadURL:error:].cold.2((uint64_t)v6, v11, v12);
    return 0;
  }
  v8 = -[NSString stringByAppendingPathComponent:](v6, "stringByAppendingPathComponent:", v7);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v8, 0);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "linkItemAtURL:toURL:error:", a3, v9, a4) & 1) == 0)
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MFAttachmentSecurityScope _temporaryReadURL:error:].cold.1((uint64_t)v9, a4, v10);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v6, 0);
    return 0;
  }
  return v9;
}

- (void)_removeTemporaryReadURL
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1(&dword_1C8839000, (uint64_t)a2, a3, "Failed to remove temporary read URL [%@] error [%@]", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_8();
}

- (void)stopAccess
{
  NSURL *secureWriteURL;

  if (self->_securedRead)
    -[NSURL stopAccessingSecurityScopedResource](self->_securityScopedURL, "stopAccessingSecurityScopedResource");
  if (self->_secureReadURL)
  {
    -[MFAttachmentSecurityScope _removeTemporaryReadURL](self, "_removeTemporaryReadURL");

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
  id result;
  const char *v4;

  result = self->_securityScopeToken;
  if (!result)
  {
    -[NSString fileSystemRepresentation](-[NSURL path](self->_securityScopedURL, "path"), "fileSystemRepresentation");
    v4 = (const char *)sandbox_extension_issue_file();
    if (v4)
    {
      result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v4, strlen(v4) + 1);
      self->_securityScopeToken = (NSData *)result;
    }
    else
    {
      return self->_securityScopeToken;
    }
  }
  return result;
}

- (void)_attachSecurityScope
{
  if (-[MFAttachmentSecurityScope securityScopeToken](self, "securityScopeToken"))
  {
    -[MFAttachmentSecurityScope securityScopeToken](self, "securityScopeToken");
    JUMPOUT(0x1CAA35B44);
  }
}

- (id)data
{
  NSURL *secureReadURL;
  uint64_t v5;

  secureReadURL = self->_secureReadURL;
  if (!secureReadURL)
  {
    -[MFAttachmentSecurityScope startReadAccess](self, "startReadAccess");
    secureReadURL = self->_secureReadURL;
  }
  v5 = 0;
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", secureReadURL, 3, &v5);
}

- (BOOL)isReadable
{
  uint64_t v4;

  v4 = 0;
  return (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isReadableFileAtPath:", -[NSURL path](self->_securityScopedURL, "path")) & 1) != 0|| -[NSURL checkPromisedItemIsReachableAndReturnError:](self->_securityScopedURL, "checkPromisedItemIsReachableAndReturnError:", &v4);
}

- (BOOL)isBundle
{
  _BOOL4 v3;
  BOOL result;
  char v5;

  v5 = 0;
  v3 = -[MFAttachmentSecurityScope isReadable](self, "isReadable");
  result = 0;
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", -[NSURL path](self->_secureReadURL, "path"), &v5);
    return v5 != 0;
  }
  return result;
}

- (void)startWriteAccess
{
  OUTLINED_FUNCTION_3_2(&dword_1C8839000, a1, a3, "NSFileCoordinator ops can block, the caller should move to a background thread", a5, a6, a7, a8, 0);
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
  OUTLINED_FUNCTION_0_5(&dword_1C8839000, a2, a3, "#Attachments Error confirming URL is readable [%@]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

- (void)_temporaryReadURL:(os_log_t)log error:.cold.1(uint64_t a1, id *a2, os_log_t log)
{
  const __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
    v5 = (const __CFString *)objc_msgSend(*a2, "ef_publicDescription");
  else
    v5 = CFSTR("unknown");
  v6 = 138412546;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1C8839000, log, OS_LOG_TYPE_ERROR, "#Attachments Failed to create temporary read URL [%@] error [%{public}@]", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_2_1();
}

- (void)_temporaryReadURL:(uint64_t)a3 error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1C8839000, a2, a3, "#Attachments Failed to create temporary read directory [%@]", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8();
}

@end
