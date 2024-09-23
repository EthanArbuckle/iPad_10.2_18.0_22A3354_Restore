@implementation NSMetadataQuery(BRCCloudDocsAdditions)

- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions searchScopes:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isFileURL"))
  {
    brc_bread_crumbs((uint64_t)"-[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:]", 86);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:].cold.1();

    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v32 = CFSTR("url");
    v27 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, CFSTR("invalid url"), v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    objc_exception_throw(v29);
  }
  v8 = v6;
  if (BRIsFPFSEnabled(v8, v9))
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v11 = *MEMORY[0x1E0CB2F00];
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K.URLByDeletingLastPathComponent.path = %@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
    v14 = *MEMORY[0x1E0C9AC50];
    v30 = 0;
    v15 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v31, v14, &v30);
    v16 = v31;
    v17 = v30;
    if ((v15 & 1) != 0)
    {
      v18 = (void *)MEMORY[0x1E0CB3880];
      v19 = *MEMORY[0x1E0CB2F00];
      objc_msgSend(v8, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicateWithFormat:", CFSTR("%K = %@ OR %K.URLByDeletingLastPathComponent.path = %@"), CFSTR("BRMetadataItemParentFileIDKey"), v16, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      brc_bread_crumbs((uint64_t)"predicateForChildrenOfURL", 41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v35 = v8;
        v36 = 2112;
        v37 = v17;
        v38 = 2112;
        v39 = v20;
        _os_log_error_impl(&dword_19CBF0000, v21, (os_log_type_t)0x90u, "[ERROR] can't create predicate for %@: %@%@", buf, 0x20u);
      }

      v13 = 0;
    }

  }
  objc_msgSend(a1, "setPredicate:", v13);

  v22 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(a1, "setSearchScopes:", v22);

}

- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2E58];
  v8 = *MEMORY[0x1E0CB2E60];
  v9 = v4;
  v10 = *MEMORY[0x1E0CB2E30];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:", v6, v7, v8, v9, v10, v11);

}

- (uint64_t)br_setupForMonitoringItemAtURL:()BRCCloudDocsAdditions searchScopes:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v33;
  id v34;
  const __CFString *v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isFileURL");
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "path");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = v6;
      if (BRIsFPFSEnabled(v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0CB3880];
        v14 = *MEMORY[0x1E0CB2F00];
        objc_msgSend(v11, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K.path = %@"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
        objc_msgSend(a1, "setPredicate:", v16);

        v31 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSearchScopes:", v31);

LABEL_21:
        goto LABEL_22;
      }
      objc_msgSend(v11, "br_addPhysicalProperty");
      objc_msgSend(v11, "br_physicalURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      +[BRFileObjectID fileObjectIDForURL:allocateDocID:error:](BRFileObjectID, "fileObjectIDForURL:allocateDocID:error:", v23, 1, &v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v34;

      if (v24)
      {
        v26 = (void *)MEMORY[0x1E0CB3880];
        v27 = v25;
        v28 = *MEMORY[0x1E0CB2F00];
        objc_msgSend(v11, "path");
        v33 = v28;
        v25 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "predicateWithFormat:", CFSTR("%K = %@ OR %K.path = %@"), CFSTR("BRMetadataItemFileObjectIdentifierKey"), v24, v33, v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if ((objc_msgSend(v25, "br_isCocoaErrorCode:", 260) & 1) != 0)
        {
          v16 = 0;
LABEL_19:

          goto LABEL_20;
        }
        brc_bread_crumbs((uint64_t)"predicateForURL", 66);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          v38 = v11;
          v39 = 2112;
          v40 = v25;
          v41 = 2112;
          v42 = v29;
          _os_log_error_impl(&dword_19CBF0000, v30, (os_log_type_t)0x90u, "[ERROR] can't get create predicate for %@: %@%@", buf, 0x20u);
        }

        v16 = 0;
      }

      goto LABEL_19;
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringItemAtURL:searchScopes:]", 105);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:].cold.1();

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v35 = CFSTR("url");
    v10 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, CFSTR("invalid url"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "raise");

    if (!v6)
      goto LABEL_21;
  }
  v8 = 0;
LABEL_22:

  return v8;
}

- (uint64_t)br_setupForMonitoringItemAtURL:()BRCCloudDocsAdditions
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2E58];
  v10 = *MEMORY[0x1E0CB2E60];
  v11 = v4;
  v12 = *MEMORY[0x1E0CB2E30];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "br_setupForMonitoringItemAtURL:searchScopes:", v6, v7, v10, v11, v12, v13);

  return v8;
}

- (uint64_t)br_setupForMonitoringChildrenOfItemAtURL:()BRCCloudDocsAdditions searchScopes:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "isFileURL");
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v6, "path");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = v6;
      if (BRIsFPFSEnabled(v11, v12))
      {
        v13 = (void *)MEMORY[0x1E0CB3880];
        v14 = *MEMORY[0x1E0CB2F00];
        objc_msgSend(v11, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithFormat:", CFSTR("%K.URLByDeletingLastPathComponent.path = %@"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v38 = 0;
        v23 = *MEMORY[0x1E0C9AC50];
        v37 = 0;
        v24 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v38, v23, &v37);
        v25 = v38;
        v26 = v37;
        v27 = v26;
        if ((v24 & 1) != 0)
        {
          v36 = (void *)MEMORY[0x1E0CB3880];
          v28 = v25;
          v29 = v26;
          v30 = *MEMORY[0x1E0CB2F00];
          objc_msgSend(v11, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v30;
          v27 = v29;
          v25 = v28;
          objc_msgSend(v36, "predicateWithFormat:", CFSTR("%K = %@ OR %K.URLByDeletingLastPathComponent.path = %@"), CFSTR("BRMetadataItemParentFileIDKey"), v28, v35, v31);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          brc_bread_crumbs((uint64_t)"predicateForChildrenOfURL", 41);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            v42 = v11;
            v43 = 2112;
            v44 = v27;
            v45 = 2112;
            v46 = v31;
            _os_log_error_impl(&dword_19CBF0000, v32, (os_log_type_t)0x90u, "[ERROR] can't create predicate for %@: %@%@", buf, 0x20u);
          }

          v16 = 0;
        }

      }
      objc_msgSend(a1, "setPredicate:", v16);

      v33 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(a1, "setSearchScopes:", v33);

LABEL_18:
      goto LABEL_19;
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfItemAtURL:searchScopes:]", 135);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[NSMetadataQuery(BRCCloudDocsAdditions) br_setupForMonitoringChildrenOfFolderAtURL:searchScopes:].cold.1();

    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v39 = CFSTR("url");
    v10 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exceptionWithName:reason:userInfo:", v20, CFSTR("invalid url"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "raise");

    if (!v6)
      goto LABEL_18;
  }
  v8 = 0;
LABEL_19:

  return v8;
}

- (uint64_t)br_setupForMonitoringChildrenOfItemAtURL:()BRCCloudDocsAdditions
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2E58];
  v10 = *MEMORY[0x1E0CB2E60];
  v11 = v4;
  v12 = *MEMORY[0x1E0CB2E30];
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "br_setupForMonitoringChildrenOfItemAtURL:searchScopes:", v6, v7, v10, v11, v12, v13);

  return v8;
}

- (void)br_setupForMonitoringChildrenOfFolderAtURL:()BRCCloudDocsAdditions searchScopes:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: invalid url %@%@");
  OUTLINED_FUNCTION_1();
}

@end
