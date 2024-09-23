@implementation BMComputeXPCPublisherStorage

- (BMComputeXPCPublisherStorage)initWithUseCase:(id)a3 domain:(unint64_t)a4 isClient:(BOOL)a5
{
  id v8;
  BMComputeXPCPublisherStorage *v9;
  BMComputeXPCPublisherStorage *v10;
  uint64_t v11;
  BMFileManager *fileManager;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMComputeXPCPublisherStorage;
  v9 = -[BMComputeXPCPublisherStorage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_domain = a4;
    v9->_isClient = a5;
    v11 = -[BMComputeXPCPublisherStorage newFileManagerWithUseCase:](v9, "newFileManagerWithUseCase:", v8);
    fileManager = v10->_fileManager;
    v10->_fileManager = (BMFileManager *)v11;

  }
  return v10;
}

- (id)newFileManagerWithUseCase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D01D10];
  -[BMComputeXPCPublisherStorage basePath](self, "basePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "pathIsManaged:domain:", v6, 0) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "reliesOnDirectAccessForDomain:", -[BMComputeXPCPublisherStorage domain](self, "domain"));

  if (v8)
  {
LABEL_5:
    v12 = (void *)MEMORY[0x1E0D01D00];
    -[BMComputeXPCPublisherStorage basePath](self, "basePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileManagerWithDirectAccessToDirectory:cachingOptions:", v10, 3);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E0D01D00];
  -[BMComputeXPCPublisherStorage basePath](self, "basePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v10, v4, -[BMComputeXPCPublisherStorage domain](self, "domain"), geteuid());
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (void *)v11;

  return v13;
}

- (BOOL)checkExistenceOfBookmarkForSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[BMComputeXPCPublisherStorage bookmarkPathForSessionStorageWithIdentifier:client:](self, "bookmarkPathForSessionStorageWithIdentifier:client:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMFileManager contentsOfDirectoryAtPath:error:](self->_fileManager, "contentsOfDirectoryAtPath:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v10)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    -[BMComputeXPCPublisherStorage domain](self, "domain");
    BMStringForServiceDomain();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v12;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_INFO, "Bookmark file exists: %@ for subscription %@ domain: %@ path: %@", (uint8_t *)&v15, 0x2Au);

  }
  return v10;
}

- (id)readBookmarkForSubscriptionWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  BMFileManager *fileManager;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    -[BMComputeXPCPublisherStorage bookmarkPathForSessionStorageWithIdentifier:client:](self, "bookmarkPathForSessionStorageWithIdentifier:client:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    fileManager = self->_fileManager;
    v38 = 0;
    -[BMFileManager dataWithContentsOfFileAtPath:error:](fileManager, "dataWithContentsOfFileAtPath:error:", v10, &v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v38;
    if (v13)
    {
      v14 = v13;
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.4();

      if (a5)
      {
        v14 = objc_retainAutorelease(v14);
        v16 = 0;
        *a5 = v14;
LABEL_30:

        goto LABEL_31;
      }
LABEL_19:
      v16 = 0;
      goto LABEL_30;
    }
    if (!objc_msgSend(v12, "length"))
    {
      __biome_log_for_category();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        -[BMComputeXPCPublisherStorage domain](self, "domain");
        BMStringForServiceDomain();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v8;
        v43 = 2112;
        v44 = v29;
        v45 = 2112;
        v46 = v10;
        _os_log_impl(&dword_18D810000, v28, OS_LOG_TYPE_INFO, "Empty bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);

      }
      v14 = 0;
      goto LABEL_19;
    }
    v24 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0CB3510], "bm_allowedClassesForSecureCodingBMBookmark");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v24, "unarchivedObjectOfClasses:fromData:error:", v25, v12, &v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v37;

    if (v14)
    {
      __biome_log_for_category();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.3();

      if (a5)
      {
        v16 = 0;
        *a5 = objc_retainAutorelease(v14);
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      if ((objc_msgSend(v26, "conformsToProtocol:", &unk_1EE0E8348) & 1) != 0)
      {
        __biome_log_for_category();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          -[BMComputeXPCPublisherStorage domain](self, "domain");
          BMStringForServiceDomain();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v8;
          v43 = 2112;
          v44 = v31;
          v45 = 2112;
          v46 = v10;
          _os_log_impl(&dword_18D810000, v30, OS_LOG_TYPE_INFO, "Read bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);

        }
        v16 = v26;
        goto LABEL_29;
      }
      __biome_log_for_category();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.2();

      if (a5)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0D01C60];
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = CFSTR("Not a bookmark");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 0, v35);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v16 = 0;
    goto LABEL_29;
  }
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.1(v10, v17, v18, v19, v20, v21, v22, v23);
  v16 = 0;
LABEL_31:

  return v16;
}

- (void)writeBookmark:(id)a3 forSubscriptionWithIdentifier:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BMFileManager *fileManager;
  char v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    v12 = v11;
    if (v8)
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v29;

      if (v14)
      {
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v31 = v8;
          v32 = 2112;
          v33 = v9;
          v34 = 2112;
          v35 = v14;
          _os_log_error_impl(&dword_18D810000, v15, OS_LOG_TYPE_ERROR, "Error archiving bookmark %@ for subscription %@. %@", buf, 0x20u);
        }
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v13 = v11;
    }
    -[BMComputeXPCPublisherStorage bookmarkPathForSessionStorageWithIdentifier:client:](self, "bookmarkPathForSessionStorageWithIdentifier:client:", v9, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    fileManager = self->_fileManager;
    v28 = 0;
    v24 = -[BMFileManager replaceFileAtPath:withData:protection:error:](fileManager, "replaceFileAtPath:withData:protection:error:", v15, v13, 0xFFFFFFFFLL, &v28);
    v14 = v28;
    if ((v24 & 1) == 0)
    {
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v31 = v8;
        v32 = 2112;
        v33 = v9;
        v34 = 2112;
        v35 = v15;
        v36 = 2112;
        v37 = v14;
        _os_log_error_impl(&dword_18D810000, v25, OS_LOG_TYPE_ERROR, "Error writing bookmark %@ for subscription %@ to %@. %@", buf, 0x2Au);
      }

    }
    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      -[BMComputeXPCPublisherStorage domain](self, "domain");
      BMStringForServiceDomain();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v9;
      v32 = 2112;
      v33 = v27;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_18D810000, v26, OS_LOG_TYPE_INFO, "Wrote bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);

    }
    goto LABEL_16;
  }
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[BMComputeXPCPublisherStorage writeBookmark:forSubscriptionWithIdentifier:client:].cold.1(v14, v16, v17, v18, v19, v20, v21, v22);
LABEL_17:

}

- (BOOL)checkActiveSubscriptionMarkerForStream:(id)a3
{
  id v4;
  void *v5;
  BMFileManager *fileManager;
  uint64_t v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMComputeXPCPublisherStorage subscriptionMarkerPathForSessionStorageWithStream:](self, "subscriptionMarkerPathForSessionStorageWithStream:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fileManager = self->_fileManager;
  v15 = 0;
  LODWORD(v7) = -[BMFileManager fileExistsAtPath:error:](fileManager, "fileExistsAtPath:error:", v5, &v15);
  v8 = v15;
  v9 = CFSTR("NO");
  if ((_DWORD)v7)
    v9 = CFSTR("YES");
  v10 = v9;
  if ((v7 & 1) == 0 && v8)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage checkActiveSubscriptionMarkerForStream:].cold.1();

    LOBYTE(v7) = 1;
    v10 = CFSTR("unknown");
  }
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[BMComputeXPCPublisherStorage domain](self, "domain");
    BMStringForServiceDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01D10], "privacyPathname:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v17 = v10;
    v18 = 2114;
    v19 = v4;
    v20 = 2114;
    v21 = v12;
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_INFO, "Subscription marker exists: %{public}@ for stream: %{public}@ using domain: %{public}@ path: %{public}@", buf, 0x2Au);

  }
  return v7;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (id)subscriptionMarkerPathForSessionStorageWithStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BMComputeXPCPublisherStorage currentSessionSubscriptionsPath](self, "currentSessionSubscriptionsPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentSessionSubscriptionsPath
{
  void *v2;
  void *v3;
  void *v4;

  -[BMComputeXPCPublisherStorage currentSessionPath](self, "currentSessionPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "subscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentSessionBookmarkPath
{
  void *v2;
  void *v3;
  void *v4;

  -[BMComputeXPCPublisherStorage currentSessionPath](self, "currentSessionPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "bookmarks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentSessionPath
{
  void *v2;
  void *v3;
  void *v4;

  -[BMComputeXPCPublisherStorage sessionsPath](self, "sessionsPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "currentSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sessionsPath
{
  void *v2;
  void *v3;
  void *v4;

  -[BMComputeXPCPublisherStorage basePath](self, "basePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "sessions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)basePath
{
  return (id)objc_msgSend(MEMORY[0x1E0D01D10], "computeDirectoryForDomain:", self->_domain);
}

- (id)bookmarkPathForSessionStorageWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[BMComputeXPCPublisherStorage currentSessionBookmarkClientOrServerPath](self, "currentSessionBookmarkClientOrServerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)currentSessionBookmarkClientOrServerPath
{
  void *v3;
  void *v4;
  void *v5;

  if (-[BMComputeXPCPublisherStorage isClient](self, "isClient"))
    objc_msgSend(MEMORY[0x1E0D01D38], "client");
  else
    objc_msgSend(MEMORY[0x1E0D01D38], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCPublisherStorage currentSessionBookmarkPath](self, "currentSessionBookmarkPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isClient
{
  return self->_isClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

+ (id)currentSession
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "bm_bootSessionUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)persistentPath
{
  void *v2;
  void *v3;
  void *v4;

  -[BMComputeXPCPublisherStorage basePath](self, "basePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "persistent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentSessionNonwakingSubscriptionPath
{
  void *v2;
  void *v3;
  void *v4;

  -[BMComputeXPCPublisherStorage currentSessionPath](self, "currentSessionPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01D38], "nonwaking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)initializeBiomeDSLDirectoryForBootSession
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_9_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "currentSessionBookmarkPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_2_4(&dword_18D810000, v0, v3, "BMComputeXPCSubscription error creating directory at DSL directory %@, %@", v4);

  OUTLINED_FUNCTION_1_0();
}

- (void)removeBookmarkFileForSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BMFileManager *fileManager;
  char v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[BMComputeXPCPublisherStorage bookmarkPathForSessionStorageWithIdentifier:client:](self, "bookmarkPathForSessionStorageWithIdentifier:client:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    fileManager = self->_fileManager;
    v22 = 0;
    v10 = -[BMFileManager removeFileAtPath:error:](fileManager, "removeFileAtPath:error:", v8, &v22);
    v11 = v22;
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[BMComputeXPCPublisherStorage domain](self, "domain");
        BMStringForServiceDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v6;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_18D810000, v13, OS_LOG_TYPE_INFO, "Removed bookmark file for subscription %@ domain: %@ path: %@", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v6;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v11;
      _os_log_error_impl(&dword_18D810000, v13, OS_LOG_TYPE_ERROR, "Error removing bookmark file for subscription %@ at path %@ error %@", buf, 0x20u);
    }

  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage removeBookmarkFileForSubscriptionWithIdentifier:client:].cold.1(v8, v15, v16, v17, v18, v19, v20, v21);
  }

}

- (void)writeNonWakingSubscription:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BMFileManager *fileManager;
  char v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[BMComputeXPCPublisherStorage isClient](self, "isClient"))
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage writeNonWakingSubscription:].cold.1();
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "waking") & 1) == 0 && v5 && v6)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v18;
      if (v8)
      {
        v9 = v8;
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCPublisherStorage writeNonWakingSubscription:].cold.3();
      }
      else
      {
        -[BMComputeXPCPublisherStorage currentSessionNonwakingSubscriptionPath](self, "currentSessionNonwakingSubscriptionPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathComponent:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAppendingPathComponent:", v5);
        v10 = objc_claimAutoreleasedReturnValue();

        fileManager = self->_fileManager;
        v17 = 0;
        v14 = -[BMFileManager replaceFileAtPath:withData:protection:error:](fileManager, "replaceFileAtPath:withData:protection:error:", v10, v7, 4, &v17);
        v9 = v17;
        if ((v14 & 1) == 0)
        {
          __biome_log_for_category();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v20 = v4;
            v21 = 2112;
            v22 = v10;
            v23 = 2112;
            v24 = v9;
            _os_log_error_impl(&dword_18D810000, v15, OS_LOG_TYPE_ERROR, "Error writing subscription %@ to %@. %@", buf, 0x20u);
          }

        }
        __biome_log_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v4;
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_18D810000, v16, OS_LOG_TYPE_INFO, "Wrote subscription %@ to %@", buf, 0x16u);
        }

      }
    }
    else
    {
      __biome_log_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherStorage writeNonWakingSubscription:].cold.2();
    }

  }
}

- (void)removeNonWakingSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BMFileManager *fileManager;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[BMComputeXPCPublisherStorage isClient](self, "isClient"))
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage removeNonWakingSubscriptionWithIdentifier:client:].cold.1();
  }
  else if (v6 && v7)
  {
    -[BMComputeXPCPublisherStorage currentSessionNonwakingSubscriptionPath](self, "currentSessionNonwakingSubscriptionPath");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "stringByAppendingPathComponent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    fileManager = self->_fileManager;
    v15 = 0;
    LOBYTE(v9) = -[BMFileManager removeFileAtPath:error:](fileManager, "removeFileAtPath:error:", v8, &v15);
    v12 = v15;
    if ((v9 & 1) == 0)
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v17 = v7;
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v8;
        v22 = 2112;
        v23 = v12;
        _os_log_error_impl(&dword_18D810000, v13, OS_LOG_TYPE_ERROR, "Error removing non-waking subscription %@/%@ at path %@ error %@", buf, 0x2Au);
      }

    }
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_18D810000, v14, OS_LOG_TYPE_INFO, "Removed non-waking subscription %@/%@ at %@", buf, 0x20u);
    }

  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage removeNonWakingSubscriptionWithIdentifier:client:].cold.2();
  }

}

- (id)readNonWakingSubscriptions:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BMFileManager *fileManager;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BMFileManager *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  if (!-[BMComputeXPCPublisherStorage isClient](self, "isClient"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[BMComputeXPCPublisherStorage currentSessionNonwakingSubscriptionPath](self, "currentSessionNonwakingSubscriptionPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    fileManager = self->_fileManager;
    v46 = 0;
    -[BMFileManager contentsOfDirectoryAtPath:error:](fileManager, "contentsOfDirectoryAtPath:error:", v8, &v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v46;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v12 = v10;
    v31 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v31)
    {
      v13 = *(_QWORD *)v43;
      v29 = *(_QWORD *)v43;
      v30 = a3;
      v33 = v12;
      v34 = v8;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(v12);
          v32 = v14;
          v15 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v14);
          objc_msgSend(v8, "stringByAppendingPathComponent:", v15, v29);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = self->_fileManager;
          v41 = v11;
          v35 = (void *)v16;
          -[BMFileManager contentsOfDirectoryAtPath:error:](v17, "contentsOfDirectoryAtPath:error:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v41;

          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v20 = v18;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v38;
            v11 = v19;
            while (2)
            {
              v24 = 0;
              v25 = v11;
              do
              {
                if (*(_QWORD *)v38 != v23)
                  objc_enumerationMutation(v20);
                v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v24);
                v36 = v25;
                -[BMComputeXPCPublisherStorage readNonwakingSubscriptionWithIdentifier:client:error:](self, "readNonwakingSubscriptionWithIdentifier:client:error:", v26, v15, &v36);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = v36;

                if (!v27)
                {
                  if (v30)
                    *v30 = objc_retainAutorelease(v11);

                  v12 = v33;
                  v7 = 0;
                  v8 = v34;
                  goto LABEL_25;
                }
                objc_msgSend(v6, "addObject:", v27);

                ++v24;
                v25 = v11;
              }
              while (v22 != v24);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
              if (v22)
                continue;
              break;
            }
          }
          else
          {
            v11 = v19;
          }

          v14 = v32 + 1;
          v12 = v33;
          v8 = v34;
          v13 = v29;
        }
        while (v32 + 1 != v31);
        v31 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v31);
    }

    v7 = (void *)objc_msgSend(v6, "copy");
LABEL_25:

    goto LABEL_26;
  }
  if (a3)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v49 = *MEMORY[0x1E0CB2D50];
    v50[0] = CFSTR("Invalid for client to read non-waking subscriptions");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    *a3 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("BiomeComputeError"), -1, v6);
LABEL_26:

    return v7;
  }
  return 0;
}

- (id)readNonwakingSubscriptionWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  BMFileManager *fileManager;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[BMComputeXPCPublisherStorage isClient](self, "isClient"))
  {
    if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
    {
      -[BMComputeXPCPublisherStorage currentSessionNonwakingSubscriptionPath](self, "currentSessionNonwakingSubscriptionPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathComponent:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      fileManager = self->_fileManager;
      v25 = 0;
      -[BMFileManager dataWithContentsOfFileAtPath:error:](fileManager, "dataWithContentsOfFileAtPath:error:", v11, &v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v25;
      if (v17)
      {
        v18 = v17;
        __biome_log_for_category();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCPublisherStorage readBookmarkForSubscriptionWithIdentifier:client:error:].cold.4();

        if (a5)
        {
          v18 = objc_retainAutorelease(v18);
          v12 = 0;
          *a5 = v18;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v24 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v16, &v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v24;
        if (v18)
        {
          __biome_log_for_category();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[BMComputeXPCPublisherStorage readNonwakingSubscriptionWithIdentifier:client:error:].cold.2();

          v12 = 0;
          if (a5)
            *a5 = objc_retainAutorelease(v18);
        }
        else
        {
          __biome_log_for_category();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v20;
            v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_18D810000, v22, OS_LOG_TYPE_INFO, "Read subscription %@ from path: %@", buf, 0x16u);
          }

          v12 = v20;
        }

      }
    }
    else
    {
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherStorage readNonwakingSubscriptionWithIdentifier:client:error:].cold.1();
      v12 = 0;
    }
    goto LABEL_26;
  }
  if (a5)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("Invalid for client to read non-waking subscriptions");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 0;
    *a5 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", CFSTR("BiomeComputeError"), -1, v11);
LABEL_26:

    goto LABEL_27;
  }
  v12 = 0;
LABEL_27:

  return v12;
}

- (void)writeActiveSubscriptionMarkerForStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BMFileManager *fileManager;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMComputeXPCPublisherStorage subscriptionMarkerPathForSessionStorageWithStream:](self, "subscriptionMarkerPathForSessionStorageWithStream:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  fileManager = self->_fileManager;
  v14 = 0;
  v8 = -[BMFileManager replaceFileAtPath:withData:protection:error:](fileManager, "replaceFileAtPath:withData:protection:error:", v5, v6, 4, &v14);
  v9 = v14;
  if ((v8 & 1) == 0)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage writeActiveSubscriptionMarkerForStream:].cold.1();

  }
  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v8)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    -[BMComputeXPCPublisherStorage domain](self, "domain");
    BMStringForServiceDomain();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v12;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_INFO, "Wrote new active subscription marker with success: %@ for stream: %@ using domain: %@ path: %@", buf, 0x2Au);

  }
}

- (void)removeActiveSubscriptionMarkerForStream:(id)a3
{
  id v4;
  void *v5;
  BMFileManager *fileManager;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMComputeXPCPublisherStorage subscriptionMarkerPathForSessionStorageWithStream:](self, "subscriptionMarkerPathForSessionStorageWithStream:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fileManager = self->_fileManager;
  v13 = 0;
  v7 = -[BMFileManager removeFileAtPath:error:](fileManager, "removeFileAtPath:error:", v5, &v13);
  v8 = v13;
  if ((v7 & 1) == 0)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherStorage removeActiveSubscriptionMarkerForStream:].cold.1();

  }
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (v7)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    -[BMComputeXPCPublisherStorage domain](self, "domain");
    BMStringForServiceDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v15 = v11;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_INFO, "Removed active subscription marker with success: %@ for stream: %@ using domain: %@ path: %@", buf, 0x2Au);

  }
}

+ (id)bookmarkStorageForCurrentProcess
{
  BMComputeXPCPublisherStorage *v2;

  v2 = [BMComputeXPCPublisherStorage alloc];
  return -[BMComputeXPCPublisherStorage initWithUseCase:domain:isClient:](v2, "initWithUseCase:domain:isClient:", *MEMORY[0x1E0D01C98], 0, 1);
}

- (void)readBookmarkForSubscriptionWithIdentifier:(uint64_t)a3 client:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Invalid subscription identifier when attempting to read bookmark, nil or empty string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)readBookmarkForSubscriptionWithIdentifier:client:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Error: contents of path %@ do not conform to BMBookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)readBookmarkForSubscriptionWithIdentifier:client:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Error decoding data from path %@, error %@");
  OUTLINED_FUNCTION_5();
}

- (void)readBookmarkForSubscriptionWithIdentifier:client:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Error reading contents of %@. %@");
  OUTLINED_FUNCTION_5();
}

- (void)writeBookmark:(uint64_t)a3 forSubscriptionWithIdentifier:(uint64_t)a4 client:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Invalid subscription identifier when attempting to write bookmark, nil or empty string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)removeBookmarkFileForSubscriptionWithIdentifier:(uint64_t)a3 client:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_18D810000, a1, a3, "Invalid subscription identifier when attempting to remove bookmark file, nil or empty string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)writeNonWakingSubscription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Invalid for client to write non-waking subscription %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)writeNonWakingSubscription:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18D810000, v0, v1, "Invalid attempt to write subscription: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)writeNonWakingSubscription:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Error archiving subscription %@. %@");
  OUTLINED_FUNCTION_5();
}

- (void)removeNonWakingSubscriptionWithIdentifier:client:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Invalid for client to remove non-waking subscription %@/%@");
  OUTLINED_FUNCTION_5();
}

- (void)removeNonWakingSubscriptionWithIdentifier:client:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Invalid attempt to remove non-waking subscription: %@/%@");
  OUTLINED_FUNCTION_5();
}

- (void)readNonwakingSubscriptionWithIdentifier:client:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Invalid subscription identifier/client when attempting to read subscription, %@/%@");
  OUTLINED_FUNCTION_5();
}

- (void)readNonwakingSubscriptionWithIdentifier:client:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Error decoding subscription data from path %@, error %@");
  OUTLINED_FUNCTION_5();
}

- (void)checkActiveSubscriptionMarkerForStream:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to check presence of active subscription marker for %{public}@, %{public}@");
  OUTLINED_FUNCTION_5();
}

- (void)writeActiveSubscriptionMarkerForStream:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to write active subscription marker for stream %@, %@");
  OUTLINED_FUNCTION_5();
}

- (void)removeActiveSubscriptionMarkerForStream:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to remove active subscription marker for stream %@, %@");
  OUTLINED_FUNCTION_5();
}

@end
