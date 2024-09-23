@implementation MADManagedSpotlightEntry

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  -[MADManagedSpotlightEntry url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("url: %@, "), v6);

  -[MADManagedSpotlightEntry uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("uniqueIdentifier: %@, "), v7);

  -[MADManagedSpotlightEntry bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("bundleIdentifier: %@, "), v8);

  -[MADManagedSpotlightEntry typeIdentifier](self, "typeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("typeIdentifier: %@, "), v9);

  -[MADManagedSpotlightEntry sandboxToken](self, "sandboxToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sandboxToken: %@, "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("mediaType: %d, "), -[MADManagedSpotlightEntry mediaType](self, "mediaType"));
  objc_msgSend(v3, "appendFormat:", CFSTR("attemptCount: %d, "), -[MADManagedSpotlightEntry attemptCount](self, "attemptCount"));
  -[MADManagedSpotlightEntry nextAttemptDate](self, "nextAttemptDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("nextAttemptDate: %@, "), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("status: %d>"), -[MADManagedSpotlightEntry status](self, "status"));
  return v3;
}

+ (id)entryWithURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 mediaType:(unint64_t)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  MADManagedSpotlightEntry *v22;
  MADManagedSpotlightEntry *v23;
  void *v24;
  MADManagedSpotlightEntry *v25;
  void *v26;
  char v27;
  id v28;
  MADManagedSpotlightEntry *v29;
  id v30;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v15 = a4;
  v35 = a5;
  v16 = a6;
  v17 = a7;
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(a1, "fetchEntryWithUniqueIdentifier:error:", v15, &v38);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v38;
  if (v20)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = *a9;
      *(_DWORD *)buf = 138412290;
      v40 = v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch entry (%@)", buf, 0xCu);
    }
    v22 = 0;
    if (a9)
      *a9 = (id)objc_msgSend(v20, "copy");
    goto LABEL_32;
  }
  if (!v19)
  {
    v23 = [MADManagedSpotlightEntry alloc];
    objc_msgSend(v18, "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MADManagedSpotlightEntry initWithContext:](v23, "initWithContext:", v24);

    -[MADManagedSpotlightEntry setUrl:](v25, "setUrl:", v34);
    -[MADManagedSpotlightEntry setUniqueIdentifier:](v25, "setUniqueIdentifier:", v15);
    -[MADManagedSpotlightEntry setBundleIdentifier:](v25, "setBundleIdentifier:", v35);
    -[MADManagedSpotlightEntry setTypeIdentifier:](v25, "setTypeIdentifier:", v16);
    -[MADManagedSpotlightEntry setSandboxToken:](v25, "setSandboxToken:", v17);
    -[MADManagedSpotlightEntry setMediaType:](v25, "setMediaType:", a8);
    -[MADManagedSpotlightEntry setStatus:](v25, "setStatus:", 0);
    -[MADManagedSpotlightEntry setAttemptCount:](v25, "setAttemptCount:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADManagedSpotlightEntry setNextAttemptDate:](v25, "setNextAttemptDate:", v26);

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v15;
      v41 = 2112;
      v42 = v35;
      v43 = 2112;
      v44 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADSystemDataStore][%@] Registering new asset - %@ %@", buf, 0x20u);
    }
    v37 = 0;
    v27 = objc_msgSend(v18, "commitChangesOrRollbackAndResetContext:", &v37);
    v28 = v37;
    v20 = v28;
    if ((v27 & 1) != 0)
    {
      v36 = v28;
      objc_msgSend(a1, "fetchEntryWithUniqueIdentifier:error:", v15, &v36);
      v29 = (MADManagedSpotlightEntry *)objc_claimAutoreleasedReturnValue();
      v30 = v36;

      v25 = v29;
      v20 = v30;
      if (!a9 || !v30)
      {
        v25 = v29;
        v22 = v25;
        goto LABEL_31;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v31 = *a9;
        *(_DWORD *)buf = 138412290;
        v40 = v31;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch entry (%@)", buf, 0xCu);
      }
      v32 = (id)objc_msgSend(v30, "copy");
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v20;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to register asset (%@)", buf, 0xCu);
      }
      if (!a9)
      {
        v22 = 0;
        goto LABEL_31;
      }
      v32 = (id)objc_msgSend(v20, "copy");
    }
    v22 = 0;
    *a9 = v32;
LABEL_31:

    goto LABEL_32;
  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v40 = v15;
    v41 = 2112;
    v42 = v35;
    v43 = 2112;
    v44 = v16;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADSystemDataStore][%@] Returning existing entry - %@ %@", buf, 0x20u);
  }
  v22 = v19;
  v20 = 0;
LABEL_32:

  return v22;
}

+ (id)fetchEntriesWithMediaType:(unint64_t)a3 fetchLimit:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADManagedSpotlightEntry fetchRequest](MADManagedSpotlightEntry, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("(mediaType==%d) AND (nextAttemptDate<=%@)"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v12);

  if (a4)
    objc_msgSend(v9, "setFetchLimit:", a4);
  objc_msgSend(v8, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v9, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;

  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch asset (%@)", buf, 0xCu);
    }
    if (a5)
      *a5 = (id)objc_msgSend(v15, "copy");
  }

  return v14;
}

+ (id)fetchEntryWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v24 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Querying with uniqueIdentifier:%@", buf, 0xCu);
  }
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADManagedSpotlightEntry fetchRequest](MADManagedSpotlightEntry, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uniqueIdentifier==%@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v7, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v10, "count");
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v24[0] = v12;
    LOWORD(v24[1]) = 2112;
    *(_QWORD *)((char *)&v24[1] + 2) = v13;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADSystemDataStore] Query returns %d results ... firstObject:%@", buf, 0x12u);

  }
  if (!v11)
  {
    if ((unint64_t)objc_msgSend(v10, "count") < 2)
    {
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[MADSystemDataStore] Fetch %lu assets (expected 1)"), objc_msgSend(v10, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v24 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    if (a4)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v24 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch asset (%@)", buf, 0xCu);
  }
  if (!a4)
  {
LABEL_20:
    v14 = 0;
    goto LABEL_22;
  }
  v14 = 0;
  *a4 = (id)objc_msgSend(v11, "copy");
LABEL_22:

  return v14;
}

+ (BOOL)deleteEntryWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADManagedSpotlightEntry fetchRequest](MADManagedSpotlightEntry, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uniqueIdentifier==%@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v7);
  objc_msgSend(v6, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = (id)objc_msgSend(v10, "executeRequest:error:", v9, &v14);
  v12 = v14;

  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to remove entry (%@)", buf, 0xCu);
    }
    if (a4)
      *a4 = (id)objc_msgSend(v12, "copy");
  }

  return v12 == 0;
}

+ (unint64_t)countForMediaType:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADManagedSpotlightEntry fetchRequest](MADManagedSpotlightEntry, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("(mediaType==%d) AND (nextAttemptDate<=%@)"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  objc_msgSend(v6, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v12 = objc_msgSend(v11, "countForFetchRequest:error:", v7, &v15);
  v13 = v15;

  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch count (%@)", buf, 0xCu);
    }
    if (a4)
      *a4 = (id)objc_msgSend(v13, "copy");
  }

  return v12;
}

@end
