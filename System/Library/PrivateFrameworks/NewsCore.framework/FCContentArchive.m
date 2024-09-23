@implementation FCContentArchive

+ (BOOL)supportsSecureCoding
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "+[FCContentArchive supportsSecureCoding]";
    v9 = 2080;
    v10 = "FCContentArchive.m";
    v11 = 1024;
    v12 = 88;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[FCContentArchive supportsSecureCoding]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCContentArchive)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCContentArchive initWithCoder:]";
    v11 = 2080;
    v12 = "FCContentArchive.m";
    v13 = 1024;
    v14 = 93;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCContentArchive initWithCoder:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCContentArchive encodeWithCoder:]";
    v11 = 2080;
    v12 = "FCContentArchive.m";
    v13 = 1024;
    v14 = 98;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCContentArchive encodeWithCoder:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

+ (FCContentArchive)empty
{
  if (qword_1ED0F7CF8 != -1)
    dispatch_once(&qword_1ED0F7CF8, &__block_literal_global_1);
  return (FCContentArchive *)(id)_MergedGlobals_3;
}

void __25__FCContentArchive_empty__block_invoke()
{
  FCEmptyContentArchive *v0;
  void *v1;

  v0 = objc_alloc_init(FCEmptyContentArchive);
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

}

+ (FCContentArchive)archiveWithRecord:(id)a3
{
  id v4;
  FCRecordContentArchive *v5;
  id v6;
  id *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v5 = [FCRecordContentArchive alloc];
    v6 = v4;
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)FCRecordContentArchive;
      v7 = objc_msgSendSuper2(&v9, sel_init);
      v5 = (FCRecordContentArchive *)v7;
      if (v7)
        objc_storeStrong(v7 + 1, a3);
    }

  }
  else
  {
    +[FCContentArchive empty](FCContentArchive, "empty");
    v5 = (FCRecordContentArchive *)objc_claimAutoreleasedReturnValue();
  }

  return (FCContentArchive *)v5;
}

+ (FCContentArchive)archiveWithAsset:(id)a3 remoteURL:(id)a4 filePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCAssetContentArchive *v11;
  id v12;
  id v13;
  id v14;
  id *v15;
  uint64_t v16;
  NSString *filePath;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = [FCAssetContentArchive alloc];
    v12 = v8;
    v13 = v9;
    v14 = v10;
    if (v11)
    {
      v19.receiver = v11;
      v19.super_class = (Class)FCAssetContentArchive;
      v15 = objc_msgSendSuper2(&v19, sel_init);
      v11 = (FCAssetContentArchive *)v15;
      if (v15)
      {
        objc_storeStrong(v15 + 1, a3);
        objc_storeStrong((id *)&v11->_remoteURL, a4);
        v16 = objc_msgSend(v14, "copy");
        filePath = v11->_filePath;
        v11->_filePath = (NSString *)v16;

      }
    }

  }
  else
  {
    +[FCContentArchive empty](FCContentArchive, "empty");
    v11 = (FCAssetContentArchive *)objc_claimAutoreleasedReturnValue();
  }

  return (FCContentArchive *)v11;
}

+ (FCContentArchive)archiveWithAssetWrappingKey:(id)a3 wrappingKeyID:(id)a4
{
  id v6;
  id v7;
  FCAssetKeyContentArchive *v8;
  id v9;
  id v10;
  id *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = [FCAssetKeyContentArchive alloc];
    v9 = v6;
    v10 = v7;
    if (v8)
    {
      v13.receiver = v8;
      v13.super_class = (Class)FCAssetKeyContentArchive;
      v11 = objc_msgSendSuper2(&v13, sel_init);
      v8 = (FCAssetKeyContentArchive *)v11;
      if (v11)
      {
        objc_storeStrong(v11 + 1, a3);
        objc_storeStrong((id *)&v8->_wrappingKeyID, a4);
      }
    }

  }
  else
  {
    +[FCContentArchive empty](FCContentArchive, "empty");
    v8 = (FCAssetKeyContentArchive *)objc_claimAutoreleasedReturnValue();
  }

  return (FCContentArchive *)v8;
}

+ (FCContentArchive)archiveWithAVAsset:(id)a3
{
  id v4;
  FCAVAssetContentArchive *v5;
  id v6;
  id *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v5 = [FCAVAssetContentArchive alloc];
    v6 = v4;
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)FCAVAssetContentArchive;
      v7 = objc_msgSendSuper2(&v9, sel_init);
      v5 = (FCAVAssetContentArchive *)v7;
      if (v7)
        objc_storeStrong(v7 + 1, a3);
    }

  }
  else
  {
    +[FCContentArchive empty](FCContentArchive, "empty");
    v5 = (FCAVAssetContentArchive *)objc_claimAutoreleasedReturnValue();
  }

  return (FCContentArchive *)v5;
}

+ (FCContentArchive)archiveWithAVAssetKey:(id)a3
{
  id v4;
  FCAVAssetKeyContentArchive *v5;
  id v6;
  id *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v5 = [FCAVAssetKeyContentArchive alloc];
    v6 = v4;
    if (v5)
    {
      v9.receiver = v5;
      v9.super_class = (Class)FCAVAssetKeyContentArchive;
      v7 = objc_msgSendSuper2(&v9, sel_init);
      v5 = (FCAVAssetKeyContentArchive *)v7;
      if (v7)
        objc_storeStrong(v7 + 1, a3);
    }

  }
  else
  {
    +[FCContentArchive empty](FCContentArchive, "empty");
    v5 = (FCAVAssetKeyContentArchive *)objc_claimAutoreleasedReturnValue();
  }

  return (FCContentArchive *)v5;
}

+ (FCContentArchive)archiveWithPersistedArchivePath:(id)a3
{
  id v3;
  FCPersistedContentArchive *v4;
  id v5;
  uint64_t v6;
  NSString *archivePath;
  objc_super v9;

  v3 = a3;
  v4 = [FCPersistedContentArchive alloc];
  v5 = v3;
  if (v4)
  {
    v9.receiver = v4;
    v9.super_class = (Class)FCPersistedContentArchive;
    v4 = objc_msgSendSuper2(&v9, sel_init);
    if (v4)
    {
      v6 = objc_msgSend(v5, "copy");
      archivePath = v4->_archivePath;
      v4->_archivePath = (NSString *)v6;

    }
  }

  return (FCContentArchive *)v4;
}

+ (FCContentArchive)archiveWithChildArchives:(id)a3
{
  id v3;
  FCAggregateContentArchive *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *childArchives;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (FCAggregateContentArchive *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = [FCAggregateContentArchive alloc];
    v5 = v3;
    if (v4)
    {
      v13.receiver = v4;
      v13.super_class = (Class)FCAggregateContentArchive;
      v4 = objc_msgSendSuper2(&v13, sel_init);
      if (v4)
      {
        v6 = (void *)MEMORY[0x1E0C99E60];
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __51__FCAggregateContentArchive_initWithChildArchives___block_invoke;
        v11[3] = &unk_1E463AE18;
        v12 = v5;
        objc_msgSend(v6, "fc_set:", v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v8 = objc_claimAutoreleasedReturnValue();
        childArchives = v4->_childArchives;
        v4->_childArchives = (NSArray *)v8;

      }
    }

  }
  return (FCContentArchive *)v4;
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCContentArchive unarchiveIntoContentContext:]";
    v11 = 2080;
    v12 = "FCContentArchive.m";
    v13 = 1024;
    v14 = 162;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCContentArchive unarchiveIntoContentContext:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (FCContentManifest)manifest
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCContentArchive manifest]";
    v9 = 2080;
    v10 = "FCContentArchive.m";
    v11 = 1024;
    v12 = 168;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCContentArchive manifest]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int64_t)storageSize
{
  return 0;
}

@end
