@implementation CPLEngineIgnoredRecords

- (unint64_t)scopeType
{
  return 2;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CPLEngineIgnoredRecords ignoredRecordWithScopedIdentifier:](self, "ignoredRecordWithScopedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRecordWithScopedIdentifier:", v4);

  return v6;
}

- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "addIgnoredRecord:ignoredDate:otherScopeIndex:error:", v11, v10, a5, a6);

  return (char)a6;
}

- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "removeRecordWithScopedIdentifier:error:", v6, a4);

  return (char)a4;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v11;
  int v12;
  char v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  if (!v12)
    return 0;
  if (*a5)
    return 1;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v15 = objc_msgSend(v14, "popCloudScopedIdentifiersToCheck:otherScopeIndex:maxCount:deletedCount:error:", &v20, a3, a4, a5, a6);
  v16 = v20;

  if (v15)
  {
    if (objc_msgSend(v16, "count"))
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pendingRecordChecks");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v18, "enqueueCloudScopedIdentifiersToCheck:error:", v16, a6);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)ignoredRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ignoredRecordWithScopedIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ignoredRecordsBeforeDate:scopeIdentifier:maximumCount:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "setIgnoredDate:forRecordWithScopedIdentifier:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "scopeIdentifier:hasIgnoredRecordsBeforeDate:", v7, v6);

  return v9;
}

@end
