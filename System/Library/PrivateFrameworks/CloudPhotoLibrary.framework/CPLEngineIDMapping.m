@implementation CPLEngineIDMapping

- (unint64_t)scopeType
{
  return 3;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && *a4)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_5316();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "No cloud identifier for %@ means the cloud identifier should not be final", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineIDMapping.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 33, CFSTR("No cloud identifier for %@ means the cloud identifier should not be final"), v7);

    abort();
  }

  return v9;
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v4 = a3;
  v12 = 0;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remappedRecords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "realScopedIdentifierForRemappedScopedIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (objc_msgSend(v9, "isEqual:", v4) & 1) == 0)
    {
      -[CPLEngineStorage platformObject](self, "platformObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v9, &v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  char v17;
  _BYTE v19[22];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v9 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_5316();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = " temporarily";
      *(_DWORD *)v19 = 138412802;
      *(_QWORD *)&v19[4] = v13;
      if (v9)
        v15 = "";
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v12;
      v20 = 2080;
      v21 = v15;
      _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_DEBUG, "Mapping local identifier %@ to cloud identifier %@%s", v19, 0x20u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject", *(_OWORD *)v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "addCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", v12, v13, v9, a6, a7);

  return v17;
}

- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  const char *v21;
  void *v22;
  int v23;
  id v24;
  _BYTE v26[24];
  const char *v27;
  __int128 v28;
  uint64_t v29;

  v9 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  -[CPLEngineIDMapping firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:](self, "firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqual:", v12) & 1) != 0)
  {
    if (_CPLSilentLogging)
      goto LABEL_14;
    __CPLStorageOSLogDomain_5316();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    v16 = " temporarily";
    *(_DWORD *)v26 = 138412802;
    *(_QWORD *)&v26[4] = v13;
    if (v9)
      v16 = "";
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v14;
    *(_WORD *)&v26[22] = 2080;
    v27 = v16;
    v17 = "Mapping local identifier %@ to cloud identifier %@%s";
    v18 = v15;
    v19 = OS_LOG_TYPE_DEBUG;
    v20 = 32;
    goto LABEL_12;
  }
  if (_CPLSilentLogging)
    goto LABEL_14;
  __CPLStorageOSLogDomain_5316();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v21 = " temporarily";
    *(_DWORD *)v26 = 138413058;
    *(_QWORD *)&v26[4] = v13;
    *(_WORD *)&v26[12] = 2112;
    if (v9)
      v21 = "";
    *(_QWORD *)&v26[14] = v14;
    *(_WORD *)&v26[22] = 2080;
    v27 = v21;
    LOWORD(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 2) = v12;
    v17 = "Mapping local identifier %@ to cloud identifier %@%s [%@ was already taken]";
    v18 = v15;
    v19 = OS_LOG_TYPE_DEFAULT;
    v20 = 42;
LABEL_12:
    _os_log_impl(&dword_1B03C2000, v18, v19, v17, v26, v20);
  }
LABEL_13:

LABEL_14:
  -[CPLEngineStorage platformObject](self, "platformObject", *(_OWORD *)v26, *(_QWORD *)&v26[16], v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "addCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", v14, v13, v9, a6, a7);

  if (v23)
    v24 = v14;
  else
    v24 = 0;

  return v24;
}

- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3
{
  CPLScopedIdentifier *v4;
  void *v5;
  void *v6;
  void *v7;
  CPLScopedIdentifier *v8;
  uint64_t v9;
  CPLScopedIdentifier *v10;
  CPLScopedIdentifier *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v18;

  v18 = 0;
  v4 = (CPLScopedIdentifier *)a3;
  -[CPLScopedIdentifier scopeIdentifier](v4, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v4, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v4;
  if (v7)
  {
    v9 = 1;
    v10 = v4;
    do
    {
      v11 = [CPLScopedIdentifier alloc];
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[CPLScopedIdentifier identifier](v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@_%lu"), v13, v9);
      v8 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v11, "initWithScopeIdentifier:identifier:", v5, v14);

      -[CPLEngineStorage platformObject](self, "platformObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ++v9;
      v10 = v8;
    }
    while (v16);
  }

  return v8;
}

- (BOOL)setFinalCloudScopedIdentifier:(id)a3 forPendingCloudScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_5316();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Remapping cloud identifier %@ to %@", (uint8_t *)&v14, 0x16u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setFinalCloudScopedIdentifier:forPendingCloudScopedIdentifier:error:", v8, v9, a5);

  return v12;
}

- (BOOL)markAllPendingIdentifiersForScopeWithIdentifier:(id)a3 asFinalWithError:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint8_t v11[16];

  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_5316();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "Marking all pending cloud identifiers as final", v11, 2u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "markAllPendingIdentifiersForScopeWithIdentifier:asFinalWithError:", v6, a4);

  return v9;
}

- (BOOL)hasPendingIdentifiers
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPendingIdentifiers");

  return v3;
}

- (BOOL)removeMappingForCloudScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "removeMappingForCloudScopedIdentifier:error:", v6, a4);

  return (char)a4;
}

- (BOOL)addDeleteEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "addDeleteEventForRecordWithLocalScopedIdentifier:direction:error:", v8, a4, a5);

  return (char)a5;
}

- (BOOL)addAddEventForRecordWithLocalScopedIdentifier:(id)a3 direction:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "addAddEventForRecordWithLocalScopedIdentifier:direction:error:", v8, a4, a5);

  return (char)a5;
}

- (BOOL)resetAllFinalCloudIdentifiersForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "resetAllFinalCloudIdentifiersForScopeWithIdentifier:error:", v6, a4);

  return (char)a4;
}

@end
