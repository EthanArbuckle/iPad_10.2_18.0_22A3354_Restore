@implementation MADManagedRequest

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
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@"), v5);

  -[MADManagedRequest requestID](self, "requestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADManagedRequest requestDate](self, "requestDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", requestID: %@, requestDate: %@,"), v6, v7);

  -[MADManagedRequest bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bundle: %@, "), v8);

  -[MADManagedRequest sourceIdentifier](self, "sourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADManagedRequest assetIdentifier](self, "assetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADManagedRequest assetURL](self, "assetURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", asset: id-%@, source-%@, url-%@, "), v9, v10, v11);

  -[MADManagedRequest resultDirectoryURL](self, "resultDirectoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", resultDirectoryURL: %@, "), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(", status: %d, "), (int)-[MADManagedRequest status](self, "status"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", attempts: %d, "), (int)-[MADManagedRequest attempts](self, "attempts"));
  -[MADManagedRequest previousAttemptDate](self, "previousAttemptDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", previousAttemptDate: %@, "), v13);

  -[MADManagedRequest nextAttemptDate](self, "nextAttemptDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", nextAttemptDate: %@, "), v14);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (id)entryWithRequestID:(id)a3 bundleIdentifier:(id)a4 sourceIdentifier:(id)a5 assetIdentifier:(id)a6 assetURL:(id)a7 assetURLExtension:(id)a8 resultDirectoryURL:(id)a9 resultDirectoryURLExtension:(id)a10 request:(id)a11 error:(id *)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  MADManagedRequest *v24;
  MADManagedRequest *v25;
  MADManagedRequest *v26;
  MADManagedRequest *v27;
  MADManagedRequest *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  char v37;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  MADManagedRequest *v51;
  __int16 v52;
  MADManagedRequest *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v45 = a4;
  v46 = a5;
  v18 = a6;
  v19 = a7;
  v41 = a8;
  v42 = a9;
  v43 = a10;
  v20 = a11;
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("bundleIdentifier=%@ AND sourceIdentifier=%@ AND assetIdentifier=%@ AND assetURL=%@ AND requestType=%@"), v45, v46, v18, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(a1, "fetchTaskScheduleWithPredicate:error:", v22, &v49);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (MADManagedRequest *)v49;
  objc_msgSend(v23, "firstObject");
  v25 = (MADManagedRequest *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(v44, "managedObjectContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v28 = v25;
    }
    else
    {
      v28 = -[MADManagedRequest initWithContext:]([MADManagedRequest alloc], "initWithContext:", v39);
      if (!v28)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v51 = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to allocate new entry (%@)", buf, 0xCu);
        }
        if (a12)
        {
          v33 = (id)objc_msgSend(0, "copy");
          v28 = 0;
          v24 = 0;
          goto LABEL_37;
        }
        v28 = 0;
        v24 = 0;
LABEL_39:
        v27 = 0;
        goto LABEL_40;
      }
    }
    -[MADManagedRequest setRequestID:](v28, "setRequestID:", v40);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADManagedRequest setRequestDate:](v28, "setRequestDate:", v29);

    -[MADManagedRequest setAssetIdentifier:](v28, "setAssetIdentifier:", v18);
    -[MADManagedRequest setSourceIdentifier:](v28, "setSourceIdentifier:", v46);
    -[MADManagedRequest setAssetURL:](v28, "setAssetURL:", v19);
    -[MADManagedRequest setAssetURLExtension:](v28, "setAssetURLExtension:", v41);
    -[MADManagedRequest setResultDirectoryURL:](v28, "setResultDirectoryURL:", v42);
    -[MADManagedRequest setResultDirectoryURLExtension:](v28, "setResultDirectoryURLExtension:", v43);
    -[MADManagedRequest setBundleIdentifier:](v28, "setBundleIdentifier:", v45);
    -[MADManagedRequest setStatus:](v28, "setStatus:", 0);
    -[MADManagedRequest setAttempts:](v28, "setAttempts:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADManagedRequest setPreviousAttemptDate:](v28, "setPreviousAttemptDate:", v30);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADManagedRequest setNextAttemptDate:](v28, "setNextAttemptDate:", v31);

    -[MADManagedRequest setRequestType:](v28, "setRequestType:", v21);
    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v20, 1, &v48);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (MADManagedRequest *)v48;
    -[MADManagedRequest setRequestData:](v28, "setRequestData:", v32);

    if (v24)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v24;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to parse request (%@)", buf, 0xCu);
      }
      if (a12)
      {
        v33 = (id)-[MADManagedRequest copy](v24, "copy");
LABEL_37:
        v27 = 0;
        *a12 = v33;
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    if (v25)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v25;
        v52 = 2112;
        v53 = v28;
        v34 = MEMORY[0x1E0C81028];
        v35 = "[MADSystemDataStore] Updating existing entry %@ to %@";
        v36 = 22;
LABEL_29:
        _os_log_impl(&dword_1B6C4A000, v34, OS_LOG_TYPE_DEBUG, v35, buf, v36);
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v28;
      v34 = MEMORY[0x1E0C81028];
      v35 = "[MADSystemDataStore] Adding new entry - %@";
      v36 = 12;
      goto LABEL_29;
    }
    v47 = 0;
    v37 = objc_msgSend(v44, "commitChangesOrRollback:", &v47);
    v24 = (MADManagedRequest *)v47;
    if ((v37 & 1) != 0)
    {
      v28 = v28;
      v27 = v28;
LABEL_40:

      goto LABEL_41;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v24;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to register asset (%@)", buf, 0xCu);
    }
    if (a12)
    {
      v33 = (id)-[MADManagedRequest copy](v24, "copy");
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (MADManagedRequest *)*a12;
    *(_DWORD *)buf = 138412290;
    v51 = v26;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADSystemDataStore] Failed to fetch entry (%@)", buf, 0xCu);
  }
  v27 = 0;
  if (a12)
    *a12 = (id)-[MADManagedRequest copy](v24, "copy");
LABEL_41:

  return v27;
}

+ (id)fetchTaskScheduleWithPredicate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADManagedRequest fetchRequest](MADManagedRequest, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setPredicate:", v5);
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;

  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADManagedTaskSchedule] Failed to fetch processing status - %@", buf, 0xCu);
    }
    if (a4)
      *a4 = (id)objc_msgSend(v11, "copy");
  }

  return v10;
}

+ (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  BOOL v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MADSystemDataStore systemDataStore](MADSystemDataStore, "systemDataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MADManagedRequest fetchRequest](MADManagedRequest, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("requestID==%@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v7);
  objc_msgSend(v6, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v10, "executeRequest:error:", v9, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (v12)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADManagedRequest][removeRequest] Failed to remove entry (%@)", buf, 0xCu);
    }
    if (a4)
    {
      v13 = (id)objc_msgSend(v12, "copy");
LABEL_17:
      v15 = 0;
      *a4 = v13;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v17 = 0;
  v14 = objc_msgSend(v6, "commitChangesOrRollback:", &v17);
  v12 = v17;
  if ((v14 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADManagedRequest][removeRequest] Failed to commit changes (%@)", buf, 0xCu);
    }
    if (a4)
    {
      v13 = (id)objc_msgSend(v12, "copy");
      goto LABEL_17;
    }
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADManagedRequest][removeRequest] Removed request %@ - %@", buf, 0x16u);
  }
  v15 = 1;
LABEL_19:

  return v15;
}

@end
